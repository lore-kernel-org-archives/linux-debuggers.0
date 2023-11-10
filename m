Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D445819BA7
	for <linux-debuggers@vger.kernel.org>; Fri, 10 Nov 2023 15:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="RyOeGuzi";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="BK5ET2C6"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [IPv6:2001:67c:2178:6::1d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AFFCF3A20F;
	Fri, 10 Nov 2023 07:01:52 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id 6A7091F8BD;
	Fri, 10 Nov 2023 15:01:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1699628511; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm6Rv0IKjOpqSgpid2tlKClS4cQAI4xSq+YH2tlFBRg=;
	b=RyOeGuziutCWKARfHwhY3lvtB+fclTTH+0WkBgzt3fLcGa0+oYI3CWGL8NV/uUMgvyDwFv
	+BZ9k/10wbev/PZ64+PejTrvXjIcu0ijaGN9yfuzb5yNaEFQJf0VkRlcVOi9bty/E/hd+a
	HX73aYxy4uFList49bEJxWR8IjlbBx8=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1699628511;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Gm6Rv0IKjOpqSgpid2tlKClS4cQAI4xSq+YH2tlFBRg=;
	b=BK5ET2C64uoCYbDq1IQxDsCCnfbIjoY6b3MzatQxGG8Y7iReZuvp0y7UG3R6+EecZ31G83
	+Clb0kgUw/wgCkCg==
Received: from localhost.cz (unknown [10.100.229.110])
	by relay2.suse.de (Postfix) with ESMTP id 20C392D2E2;
	Fri, 10 Nov 2023 15:01:51 +0000 (UTC)
From: Lukas Hruska <lhruska@suse.cz>
To: linux-debuggers@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michal Koutny <mkoutny@suse.com>,
	YOSHIDA Masanori <masanori.yoshida.tv@hitachi.com>
Subject: [RFC PATCH 4/4 v1] livedump: Add tools to make livedump creation easier
Date: Fri, 10 Nov 2023 16:00:57 +0100
Message-ID: <20231110150057.15717-5-lhruska@suse.cz>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231110150057.15717-1-lhruska@suse.cz>
References: <20231110150057.15717-1-lhruska@suse.cz>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add tool wrapping all handling of livedump's sysfs. Add tool extracting the
dump from block device first checking the correct size of dumped memory. This
way the extraction can be done even after resizing the physical memory.

Signed-off-by: Lukas Hruska <lhruska@suse.cz>
---
 tools/livedump/livedump.sh         | 44 ++++++++++++++++++++++++++++++
 tools/livedump/livedump_extract.sh | 19 +++++++++++++
 2 files changed, 63 insertions(+)
 create mode 100755 tools/livedump/livedump.sh
 create mode 100755 tools/livedump/livedump_extract.sh

diff --git a/tools/livedump/livedump.sh b/tools/livedump/livedump.sh
new file mode 100755
index 000000000000..2cc67bbbc380
--- /dev/null
+++ b/tools/livedump/livedump.sh
@@ -0,0 +1,44 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# This is a wrapper for livedump's sysfs to make a complete memdump.
+# Usage: livedump block_device
+#
+# Author: Lukas Hruska <lhruska@suse.cz>
+#
+# This file has been put into the public domain.
+# You can do whatever you want with this file.
+#
+
+if [ $# -ne 1 ]; then
+	>&2 echo "Usage: livedump block_device"
+	>&2 echo "Not enough arugments"
+	exit 1
+fi
+
+DEV=$1
+
+write_and_check() {
+	NAME=$1
+	VAL=$2
+	PATH=$3
+
+	echo -n "$NAME: "
+	echo $VAL > $PATH
+	if [ $? -ne 0 ]; then
+		exit 1
+	fi
+	echo "OK"
+}
+
+CUR_STATE=`head -n 1 /sys/kernel/livedump/state`
+if [ $CUR_STATE -ne 0 ] && [ $CUR_STATE -ne 5 ]; then
+	write_and_check "reset" 5 /sys/kernel/livedump/state
+fi
+
+write_and_check "device" $DEV /sys/kernel/livedump/output
+write_and_check "init" 1 /sys/kernel/livedump/state
+write_and_check "start" 2 /sys/kernel/livedump/state
+write_and_check "sweep" 3 /sys/kernel/livedump/state
+write_and_check "finish" 4 /sys/kernel/livedump/state
+write_and_check "uninit" 5 /sys/kernel/livedump/state
diff --git a/tools/livedump/livedump_extract.sh b/tools/livedump/livedump_extract.sh
new file mode 100755
index 000000000000..c1dc69da7559
--- /dev/null
+++ b/tools/livedump/livedump_extract.sh
@@ -0,0 +1,19 @@
+#!/bin/bash
+# SPDX-License-Identifier: GPL-2.0-or-later
+#
+# This script extracts the ELF formatted livedump from block device with correct size.
+# Usage: livedump_extract block_device output_file
+#
+# Author: Lukas Hruska <lhruska@suse.cz>
+#
+# This file has been put into the public domain.
+# You can do whatever you want with this file.
+#
+device=$1
+output=$2
+
+head -c 4096 $device > /tmp/livedump_hdr
+size=$(readelf -l /tmp/livedump_hdr | tail -2 | tr '\n' ' ' | tr -s ' ' \
+	| cut -d ' ' -f 5,6 | xargs printf "%d + %d" | xargs expr)
+size=$(expr $size / 4096)
+dd if=$device of=$output count=$size bs=4096 status=progress
-- 
2.39.2

