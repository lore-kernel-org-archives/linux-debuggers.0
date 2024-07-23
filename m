Received: from mail-oa1-f52.google.com (mail-oa1-f52.google.com [209.85.160.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 780D91487D1
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 22:35:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774156; cv=none; b=QKYxJfMbrrcBoCXnP30fmZxgmWvz0dfKHR3sxgaB7saAPUAIWaJMGMEAch933LCu9rXx/iamhqNzQK3y+5wE14IFXjldpoWmpjIRUKg9jyYFwZfHNxqHCjSLuxCibNWzU9oX33fU9Xk/tXvwiR3jDtO1iXC6jSrmn6HyuNAuPJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774156; c=relaxed/simple;
	bh=8vQiclWFbsx+3K/weG4sVm5OTnKn5KkkGLuIdqwnPHQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Q0URCxDNEFC/7cwGbx34e19fbdYt65DhZ8VKBGd8P0MUXlQ2YskpuUL2f6HllsCpozUgkh2JeVXoF6plvYy4zE/weJnaNlBcl8En9mPwgCn0EQh0XigxG6O7AmyGFI3Tg2yrV1dimvT/Apb6AHU5uizM4khxnU/ala8RPvkDoAQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=qRJDwSer; arc=none smtp.client-ip=209.85.160.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="qRJDwSer"
Received: by mail-oa1-f52.google.com with SMTP id 586e51a60fabf-261112c303bso2814204fac.1
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 15:35:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721774154; x=1722378954; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jVyuRH8a24N2shL0mW04I1Et6TNCY2O7iCoC94+iBck=;
        b=qRJDwSerxgzvp03ATFLLedmZ5pK9ecBt2Mc+UWdS7D9K7u/ivzgWfwSiubapvFGLB4
         HDBzwNFDQKlNCMSMjdfUrodkemDssItf2+vmmOgFNokES3rCIWgd2nvF/g1PyeeuLRWK
         DRWL9Y3Z1zGU6LI3zyVbHfizGU4hm5U9xTrRUT6YHCUqj8XvmAMvKqTBz7wa8YnLuC8w
         0Ou2wK/tbs+QCUVYn1uRMl8RvezHA+mx6jpcJ8ynxr5l9UzAxUGrhdjkXfrXOWxcYuXq
         3/tNaumM/e5eSEmBCCZYLIcOjgYgQG//kEkRAyuzK4hIJU8EM1a7YwVZTznaF7JPef+Q
         MMEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721774154; x=1722378954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jVyuRH8a24N2shL0mW04I1Et6TNCY2O7iCoC94+iBck=;
        b=w3I+vZZBrNVgQpcjwSKGnfBQt14ZqxYT57EGh6uIN4/C0metJkANYl+Gns5iAASiPA
         LTyjmvuENhMyvozMYzavE8R21z77LW3Su8k4UKbRAk6qFrjcZ2Q6Z/irmR/tSyb4SNkR
         6wBA0bvPlN3rEfwoCpFAwLJOR+3GFaRpFKBkae2q+veVNyYPP9zQOCbq8fsUKjdwc6Wx
         qpaiFS+JkJCpw/aNXwT2Eg1TxBL2rn1tixU1G0W2r13YsNWkJt7hwylsKItWa1LRn2bo
         fYTa4l1g6kUPPn28Uk0fJ3DTmnaxbOL5U9hd5IppD2g3OC4uo767c1ArnvrDJvOdiU6i
         VUbg==
X-Forwarded-Encrypted: i=1; AJvYcCVpKZLBcc3rtb4FXCTzfh+aAeAftaiUMiN4g6SS6LjoEjOQdK4RqejvGWwu+PkD39lB1j/C+UQo7wV9rYd9hOMoeSt5BJFj6Q478m2/f90x
X-Gm-Message-State: AOJu0YxXy8FhPVk44fo/H3o1D44SeGca595maDShIUJ+tAHQtiV3I0xw
	pzin7euCKVP/KYc+VJ3tRE/H2awgdVUJ7d4sdaGbMfZmyfoP2RcsfmNu8vdjCsU=
X-Google-Smtp-Source: AGHT+IHI/PlFqCBNrfc5XwX4XVa/OSJLFGcB7L0j1RRZlqU/KPdIXnPT6UtM+UUai5Y97DTLBo10fQ==
X-Received: by 2002:a05:6870:71cd:b0:261:f8e:a37a with SMTP id 586e51a60fabf-264876830abmr1371800fac.14.1721774154470;
        Tue, 23 Jul 2024 15:35:54 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:b6d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d241803fdsm4308079b3a.220.2024.07.23.15.35.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 15:35:53 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	Aaron Merey <amerey@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v5 1/7] debuginfod: fix skipping <built-in> source file
Date: Tue, 23 Jul 2024 15:35:37 -0700
Message-ID: <1b3f0374f89af4c6bbba9fa1b0f15034864c0afc.1721773977.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721773977.git.osandov@fb.com>
References: <cover.1721773977.git.osandov@fb.com>
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

