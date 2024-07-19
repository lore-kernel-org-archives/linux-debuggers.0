Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00381474A2
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 18:24:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721413489; cv=none; b=qO+v9oyZKT78YbgqAU+cd+++fc8HdPwoAQWZaURP3uRWP6gp3sd4p8CFBpVgOXFZ6AEqxLn1en7tL9/sLW4csr5OcVwCAFqABnkhofoSSHe2lPvFOpNP7wrpDaUIujTe8862xkRbsVjmppK3rT9b3OZFVpQQ5t0+hD2oi7OvM0k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721413489; c=relaxed/simple;
	bh=8vQiclWFbsx+3K/weG4sVm5OTnKn5KkkGLuIdqwnPHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Jc3MHVphd3pJ/VMcZ50OACoi7N56zedFaO3ioBpk60huys8u4X0uGyjVEONQKGmJDHerkb4IRlo60kdFGImMflvCwcezd8JftbpJYEO8sbvAg7UazF5VO9g0bOZunXrK3ZBOYRq7RP+sEjP5EapkDs5JwlsX/6DUmDLYqHH4hiw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=aDN8qvY0; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="aDN8qvY0"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-70aec66c936so888276b3a.0
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 11:24:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721413487; x=1722018287; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVyuRH8a24N2shL0mW04I1Et6TNCY2O7iCoC94+iBck=;
        b=aDN8qvY0p0D5JNoPHCGMyzcCB5pbvqfEE4IGKvdsf0RXk4eMMTaXlplfRwcoBHVh2p
         RV7/h5xbgUnSFkDRKe1kiHYx4rkVwJ7AXdRZivQdApHtwAo25AejSc+WvHAq/kjJhi72
         4RUVXkTI1OUPXycB+OQjP8qnP8p9aWQFvoweJ87T3KzWfnLbwmZX58va9CD9jagFUQH5
         FPkgmPLewHpNzKggrhGwtF49DLbUMm2+6Oi+54ZoFycVdlfyCrTVCxZ9QITyY1W4oISR
         GcWL+2ZuRNGes58a2wv0oYeV1QOCJ9mE/7h5eK2YQN3qWzMlUbdp3SOOGmL3LQqAbVcB
         BziQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721413487; x=1722018287;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVyuRH8a24N2shL0mW04I1Et6TNCY2O7iCoC94+iBck=;
        b=Crckm0z9gX6PDXK1cLltdM6mc7i6131PbR2wSdg9guVALIZKQ2bsglTb7vSXsJj+8v
         Fdon4P+2Bf9e07TmTpkImePSwCVJk6XLzK3WU+fKmJwUI2nHCdO6y4ubPJyEzAW1F490
         8g+90CAm4k8H7OCw2IfOBL9vZgMSBau128Q60qLPs+y9QKJ9pV2Nqu0e3JIGxEZeUVwn
         AZEGggiGcKNfoAlRrR5bHWnM7yHhLzsUQhhUaW8HBMxLYSoSz8IWPAbSNqDKC+z4z8Yd
         nhqv6B/zqm1UA+7kFx5re5yimRgr0MlcIWvFJVkuRQBrDbIuj0TkfVt7LMCkUvuTqPGZ
         iwgQ==
X-Forwarded-Encrypted: i=1; AJvYcCXW9twTx5ZjNnRnG0l7AvbYJkmJMcU2i/bRMIut0/69XtjbAqMPWNQd7PuAMi3oHFMccagtGgcxZdqnAeDUc/01EBhsLF5iLdweIrBU8xRv
X-Gm-Message-State: AOJu0Yz7GiRulI+gMHV8RJbzzEqm4yDGNIUnDG784ezplDZGYNZ1G1s0
	y73JtnSTMbJPNpxG61Ud0QM0NGT9e64jAwhB0vxffC0DRL7BiryhM9c64WQ4kT3URKyrkZgStNX
	O
X-Google-Smtp-Source: AGHT+IGbmvfluW/xmcOhiPwk3zXBC7E5J1CArz7QJFI/ZehOxkBQB2KdZkKgvyKJe7E9mz5j1kPlyA==
X-Received: by 2002:a05:6a00:2353:b0:70b:8190:d555 with SMTP id d2e1a72fcca58-70ce4f43908mr10801772b3a.32.1721413486801;
        Fri, 19 Jul 2024 11:24:46 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::7:5d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff4b2f40sm1476344b3a.63.2024.07.19.11.24.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:24:46 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v4 1/7] debuginfod: fix skipping <built-in> source file
Date: Fri, 19 Jul 2024 11:24:32 -0700
Message-ID: <46cae5909ccc3ed390e37bd68eb54d032a4ad8a2.1721413308.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721413308.git.osandov@fb.com>
References: <cover.1721413308.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

dwarf_extract_source_paths explicitly skips source files that equal
"<built-in>", but dwarf_filesrc may return a path like "dir/<built-in>".
Check for and skip that case, too.

In particular, the test debuginfod RPMs have paths like this.  However,
the test cases didn't catch this because they have a bug, too: they
follow symlinks, which results in double-counting every file.  Fix that,
too.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx             | 3 ++-
 tests/run-debuginfod-archive-groom.sh | 2 +-
 tests/run-debuginfod-extraction.sh    | 2 +-
 3 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index 305edde8..92022f3d 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -3446,7 +3446,8 @@ dwarf_extract_source_paths (Elf *elf, set<string>& debug_sourcefiles)
           if (hat == NULL)
             continue;
 
-          if (string(hat) == "<built-in>") // gcc intrinsics, don't bother record
+          if (string(hat) == "<built-in>"
+              || string_endswith(hat, "<built-in>")) // gcc intrinsics, don't bother record
             continue;
 
           string waldo;
diff --git a/tests/run-debuginfod-archive-groom.sh b/tests/run-debuginfod-archive-groom.sh
index e2c394ef..0131158f 100755
--- a/tests/run-debuginfod-archive-groom.sh
+++ b/tests/run-debuginfod-archive-groom.sh
@@ -109,7 +109,7 @@ for i in $newrpms; do
     rpm2cpio ../$i | cpio -ivd;
     cd ..;
 done
-sourcefiles=$(find -name \*\\.debug \
+sourcefiles=$(find -name \*\\.debug -type f \
               | env LD_LIBRARY_PATH=$ldpath xargs \
                 ${abs_top_builddir}/src/readelf --debug-dump=decodedline \
               | grep mtime: | wc --lines)
diff --git a/tests/run-debuginfod-extraction.sh b/tests/run-debuginfod-extraction.sh
index da6b25cf..f49dc6f6 100755
--- a/tests/run-debuginfod-extraction.sh
+++ b/tests/run-debuginfod-extraction.sh
@@ -94,7 +94,7 @@ for i in $newrpms; do
     rpm2cpio ../$i | cpio -ivd;
     cd ..;
 done
-sourcefiles=$(find -name \*\\.debug \
+sourcefiles=$(find -name \*\\.debug -type f \
               | env LD_LIBRARY_PATH=$ldpath xargs \
                 ${abs_top_builddir}/src/readelf --debug-dump=decodedline \
               | grep mtime: | wc --lines)
-- 
2.45.2

