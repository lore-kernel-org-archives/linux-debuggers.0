Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6583E193404;
	Wed,  4 Dec 2024 22:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733350655; cv=none; b=rhyXxYBTaFPH0BesLlz8sYiWpuI6/cWgCaTCbgQylYfyzmAj5NSzbpK2F7cXW9NE2vnVS17tUPGOWsLBrUcDiV43g/lyRZ1B5TS/7gGd/zPKFFXnjSfEhD2045m/QQGfNHISSBwLWcWeHyjl9Pun/4AQhGLgI4H7iP46Z6lju6Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733350655; c=relaxed/simple;
	bh=4YhsW/+XTII94Jgnvz7Bi53+EzmtwOXWe7T1y0CEgCY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=uKbVszft01h6z1EZs7MdC9/6ur74d4iUb/QcnBC1sqz3FUOXZ3DGTzGLf1ckbykAt8X0iuZvil0RlvHVmozGe9Csqyr5LTPGEE2eXT2FsOcUBWi+9nMWZkuARP2QpqxDrw1weO5CdQ4E8FLr0Wb8m23D0tpeK2Ee/S8IaDoa96M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=fWSY74hJ; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="fWSY74hJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:In-Reply-To:References;
	bh=u8qbnsGP9NFtkMH+s5X60nr73aUy5sVw5uUZ2Liwlgg=; b=fWSY74hJyxX7HFxQzaWiyMTukm
	nq4RkrIAg50eh3k4Ei3S5EmnI6md+ZIzA/qTW1eAwAdjBUyRSD0nY/895j4nv0ufQJBnHnG6A6iCg
	egoS5tTmp5bn3dPaHecC5FVIwetCEleXTskc5Lc8Y6+2MAe/Mo+VlWdJ2Grx2/LP6eyILGxBTjhcD
	hhSOpX601BYly8HjAYJzW4iUPp1ezLtIogubGWvgbv7nn6XXWNm8XNuAI9MH7iD00gBQn8P9nBZpg
	us8Mvw0Vg8W0brrkgfQP7ivlWvrW+0mhEg4zz1hY6VmiFqu8xxQl2kU3mgIbgiEj99ePAmqqb98TT
	A67Xpl2Q==;
Received: from [50.53.2.24] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tIxgX-0000000E0LX-2tF2;
	Wed, 04 Dec 2024 22:17:29 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>,
	workflows@vger.kernel.org,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-debuggers@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net
Subject: [PATCH] Documentation: move dev-tools debugging files to process/debugging/
Date: Wed,  4 Dec 2024 14:17:20 -0800
Message-ID: <20241204221720.66146-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.47.1
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Move gdb and kgdb debugging documentation to the dedicated
debugging directory (Documentation/process/debugging/).
Adjust the index.rst files to follow the file movement.
Update location of kgdb.rst in MAINTAINERS file.

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>
Cc: workflows@vger.kernel.org
Cc: Jason Wessel <jason.wessel@windriver.com>
Cc: Daniel Thompson <danielt@kernel.org>
Cc: Douglas Anderson <dianders@chromium.org>
Cc: linux-debuggers@vger.kernel.org
Cc: kgdb-bugreport@lists.sourceforge.net
---
 Documentation/dev-tools/index.rst                                       | 2 --
 Documentation/{dev-tools => process/debugging}/gdb-kernel-debugging.rst | 0
 Documentation/process/debugging/index.rst                               | 2 ++
 Documentation/{dev-tools => process/debugging}/kgdb.rst                 | 0
 MAINTAINERS                                                             | 2 +-
 5 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
index 3c0ac08b2709..c1e73e75f551 100644
--- a/Documentation/dev-tools/index.rst
+++ b/Documentation/dev-tools/index.rst
@@ -27,8 +27,6 @@ Documentation/dev-tools/testing-overview.rst
    kmemleak
    kcsan
    kfence
-   gdb-kernel-debugging
-   kgdb
    kselftest
    kunit/index
    ktap
diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
similarity index 100%
rename from Documentation/dev-tools/gdb-kernel-debugging.rst
rename to Documentation/process/debugging/gdb-kernel-debugging.rst
diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
index f6e4a00dfee3..bc4a816e3d32 100644
--- a/Documentation/process/debugging/index.rst
+++ b/Documentation/process/debugging/index.rst
@@ -12,6 +12,8 @@ general guides
 
    driver_development_debugging_guide
    userspace_debugging_guide
+   gdb-kernel-debugging
+   kgdb
 
 .. only::  subproject and html
 
diff --git a/Documentation/dev-tools/kgdb.rst b/Documentation/process/debugging/kgdb.rst
similarity index 100%
rename from Documentation/dev-tools/kgdb.rst
rename to Documentation/process/debugging/kgdb.rst
diff --git a/MAINTAINERS b/MAINTAINERS
index 1e930c7a58b1..1753fe792d04 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12809,7 +12809,7 @@ L:	kgdb-bugreport@lists.sourceforge.net
 S:	Maintained
 W:	http://kgdb.wiki.kernel.org/
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jwessel/kgdb.git
-F:	Documentation/dev-tools/kgdb.rst
+F:	Documentation/process/debugging/kgdb.rst
 F:	drivers/misc/kgdbts.c
 F:	drivers/tty/serial/kgdboc.c
 F:	include/linux/kdb.h
