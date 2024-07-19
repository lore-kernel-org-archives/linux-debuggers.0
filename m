Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A08741A84
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 08:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377937; cv=none; b=hCMGNi4D3agFBf9RlTo8Arwt3BaR8JncTnB/XG0NBlQRZ+vSrFNn1kkcvzSqZsVQlmippEhIQYjs8L2hibgOH9wUz3XBaxcl6q6wOuYObAwRJbNQyoS83Oz9p3Rfi8pnveY570TnJQacGgtXydsAEAr54W6Qj03WkSUaQITNFoY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377937; c=relaxed/simple;
	bh=8vQiclWFbsx+3K/weG4sVm5OTnKn5KkkGLuIdqwnPHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sCf5LIaC/Lv6YRW7NGIToh8VPk0pm/ZzZmvFbFyyQRBhFwhzI9vH7R9iIiC2/dLj3o1n+Vehg8Qzif1sflGhjZBi66nNm96363YetKnREXcG5Xt9xKFWEadw8Oo0QjbRF8oCUORruFYddwzDJ3PmaXscK2qf4KazAzzeFPWoPQ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=jqO9d/UB; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="jqO9d/UB"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7662181d487so1132214a12.2
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 01:32:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721377935; x=1721982735; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVyuRH8a24N2shL0mW04I1Et6TNCY2O7iCoC94+iBck=;
        b=jqO9d/UBKTwc15MnIAx/8PKHRt2l7g/yCSnA4NueRPbwX3okSa8tneU0m7mg1KIYXZ
         jfKm8+5FOsTNu1pHtednG6e3RVYmWBBMzrZSlgraefVCARbA/gp9v3lFAb+cHh/DgxTT
         xTI+eb9Bbe1xCS2wtAbpwTzw/647fwVjCiZ/HOLBHzeL006MVPbn1ZYm1FZXX3ozQxDP
         8O+kF2WLx6DXK/VxVKsiTACbij1JQYDL+APiWyyxo5oBzFhvAh37Y22kLbx65VQ75RPI
         urqz9+98FHrp4yuYUDCie8I1XcryIzac7GMkc48EHi1X67zNKa0GBZ/k0C67UxiCqUJi
         buYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721377935; x=1721982735;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVyuRH8a24N2shL0mW04I1Et6TNCY2O7iCoC94+iBck=;
        b=e9cQpsGnq55t/8MJuIFXJFpDDVujm/r6lsjRc+t17QqVRLls2LttMrRt2SPte8wmEp
         cyCREJ8HwYPBS1QRVtaDGCSJr/7dmDuwwW3pjA9byXg3Ej4vDL3maqrNKC+wJlkckXhO
         TAwauSZXxGEZla3v9dUWedWjIFDEwIvQK2LaDYCoeJVti/fPqc9ekl1D3YBq1BSLY6pj
         mtzNVQBFLzCwCRFkKdK74C5Fqiwao5xQ0zO5p0Qt9N9qfi7NGlr1mxz/H8Y7HM4TK2zd
         wLdDHMzwavqXC55QRwXFkibphix9nu6mgmVOpwBmrnSnGd1r9qJxVl3SCZ/O1WhiS3rW
         brZw==
X-Forwarded-Encrypted: i=1; AJvYcCXyqizBIfUYRGaxfIHqtx6Ix5FiFbxpO0Hc/fa6QcyK2nb4Bl2Ca8zYclQqNSfPgSJyd8Ym6ZdfUnjzYw30vsEetnccJqct3yXXce/pcXhd
X-Gm-Message-State: AOJu0YxCi+Zszt+/K+ckxvzL/laBv3wOSP3IIMOOJ3ajjlNJ1RGEuNqV
	kXuWmlKWOqsf1p95Cw0+/3LDucZPua29RtuxqSOvrX9lIHVWVfwuEsHaA2nLNHM=
X-Google-Smtp-Source: AGHT+IG8WIRpcIENng26Qn2G40U2KTpd5QpQ45/P0IITKemz6mAMUPvB21AZy6qRGXoSyObLPPq+rQ==
X-Received: by 2002:a05:6a20:258c:b0:1c2:9cbf:cc3e with SMTP id adf61e73a8af0-1c3fdd3bdffmr8908224637.45.1721377934477;
        Fri, 19 Jul 2024 01:32:14 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b49467sm8832375ad.6.2024.07.19.01.32.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:32:14 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v3 1/7] debuginfod: fix skipping <built-in> source file
Date: Fri, 19 Jul 2024 01:31:57 -0700
Message-ID: <46cae5909ccc3ed390e37bd68eb54d032a4ad8a2.1721377314.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721377314.git.osandov@fb.com>
References: <cover.1721377314.git.osandov@fb.com>
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

