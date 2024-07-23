Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 455C914600C
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 22:35:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774155; cv=none; b=bLK5TVVkp3fNa8A8doL6IQQa1ukOepG4qsT9I4vUMgao4EAQ9+0ARuKcfipbFcRwZatU7Hi6ZpyasdjpNZZ41/A9GtnWBuHI36YEVM8RpryF2rv3m58Hcfm64hqExtEwwN6eV0znBurImzn6pyOQpMv+xzoZhWtbSbIqA7v1KsY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774155; c=relaxed/simple;
	bh=8UPAleTFcMdsMb6OXqqO2E7X4FkXEySrWVL3vWa/Fiw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=RffXAAHbgP/Al67t+W6oxlrHbil1qRtYQEeQ+bVtow+nrJCK2DWCXimbo8ePr0dXk1tTfbil3v+zPwOWEMzv7xxOSLLyO6oALI7E149euXVP2HfiFq/5OxA7QC4/+trLEPXKNd4Y7HE4q0s3AaOtfr0xJXzbAWIiUeJpcG3mQfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=vPaWx+RC; arc=none smtp.client-ip=209.85.167.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="vPaWx+RC"
Received: by mail-oi1-f179.google.com with SMTP id 5614622812f47-3d9dbbaa731so2939735b6e.3
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 15:35:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721774153; x=1722378953; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=VeGfVUIaeh7T1Ayb6yMWL6Gx3NufEz7e20uvTW2Ot3E=;
        b=vPaWx+RCd93tTUSTBrp6NWhn+6yPEWMomn4bbEdpMu9y4qaeChVU1+YTzUfIjXakkB
         a68w6/jMdh1VGXcEMwrJzdMf790er+jPou6iFFtJzAw7pzHt1lrbHboVB4pWKiPPvHfU
         D8XWpqaZk8yFU1zCFACmkfx9wrFqxBoJmumb3r3xOdyMuIntHo8ewDY03N+JBs9AkaXF
         JJQ7PEJ7DuDE4yD53ukku9eMo7/RE8FoKT8ta704nfUw0qhzfURPk0Vk7xi5FiZJ9v8T
         GGk5FA/lcLCHSiQeh7KBVYuJcH1GCHaue2NPwM5dN1ZYoHe/KCpJBnnEbuPxzqccuPps
         yDbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721774153; x=1722378953;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=VeGfVUIaeh7T1Ayb6yMWL6Gx3NufEz7e20uvTW2Ot3E=;
        b=Rku97Hw5knd8qkgO1gq8QzyVSi3fOKdXVPYSYcN5j2Tf0QhD+DOBMLqZhVFQHrEEiA
         HOMpi8JTfXWv1FjAsyS3tUfRN1zDiy2q0zMF7H5BHMXgWiyLQTraT+CNA3IGFP/MFoFT
         bZitjJflwQ9Ua/6gOsdOEH2uzUuzPdlq39pp8C1+gKRUsrbMmCW8mG5nvqi+tNmputR+
         VqiPCUubI+ddBYlQNMRF3xEPmn07cDDcP1ff4FGtIgs9xd89Ut5ZTd3bLLn2BBLYzZoH
         Eh1E6AR3Jj1kNKtCpw0mpMFji9JflaGbmoEp+y3RZOVrPJLDGh1Ukd6eYqTdMvGj3NSF
         ZTgQ==
X-Forwarded-Encrypted: i=1; AJvYcCWOw3YHQG+G1rpwFOXoJy8bvycuJdIffSuYs95BkIbrF7mTYroEEOq1TLjUDkp4yT4+p0kcoFHKsSglKiViXeYRG4TxP4bhTdXfmoHDcUth
X-Gm-Message-State: AOJu0YyKUIF6gnqYG2kAAWG4o2DDZEnNIYmT/yQjqp4crAsIy3kI2B/C
	ciMkFJ6p/noxz4hNNToa3FFU23p/3wTDuJtA2d7B0XzsIIE3VANishwmeKpJIcE=
X-Google-Smtp-Source: AGHT+IEfCOv4BMOYoXpEm7JW2SAcaWPQv665DfVsOq0b5ri4nl48LueVVIR92sm2WxO45z3r+thI+A==
X-Received: by 2002:a05:6870:c152:b0:261:1a17:c817 with SMTP id 586e51a60fabf-2648764c612mr1263178fac.7.1721774153166;
        Tue, 23 Jul 2024 15:35:53 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:b6d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d241803fdsm4308079b3a.220.2024.07.23.15.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 15:35:52 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	Aaron Merey <amerey@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v5 0/7] debuginfod: speed up extraction from kernel debuginfo packages by 200x
Date: Tue, 23 Jul 2024 15:35:36 -0700
Message-ID: <cover.1721773977.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

This is v4 of my patch series optimizing debuginfod for kernel
debuginfo.  v1 is here [1], v2 is here [2], v3 is here [3], v4 is here
[4].  The only change from v4 in this version is adding --fdcache-mbs
and --fdcache-mintmp to the new test to fix some sporadic test failures.
Hopefully this version finally gets a clean test run.

Thanks,
Omar

1: https://sourceware.org/pipermail/elfutils-devel/2024q3/007191.html
2: https://sourceware.org/pipermail/elfutils-devel/2024q3/007208.html
3: https://sourceware.org/pipermail/elfutils-devel/2024q3/007243.html
4: https://sourceware.org/pipermail/elfutils-devel/2024q3/007255.html

Omar Sandoval (7):
  debuginfod: fix skipping <built-in> source file
  tests/run-debuginfod-fd-prefetch-caches.sh: disable fdcache limit
    check
  debuginfod: factor out common code for responding from an archive
  debugifod: add new table and views for seekable archives
  debuginfod: optimize extraction from seekable xz archives
  debuginfod: populate _r_seekable on scan
  debuginfod: populate _r_seekable on request

 configure.ac                                  |   5 +
 debuginfod/Makefile.am                        |   2 +-
 debuginfod/debuginfod.cxx                     | 923 +++++++++++++++---
 tests/Makefile.am                             |  13 +-
 ...pressme-seekable-xz-dbgsym_1.0-1_amd64.deb | Bin 0 -> 6288 bytes
 ...compressme-seekable-xz_1.0-1.debian.tar.xz | Bin 0 -> 1440 bytes
 .../compressme-seekable-xz_1.0-1.dsc          |  19 +
 .../compressme-seekable-xz_1.0-1_amd64.deb    | Bin 0 -> 6208 bytes
 .../compressme-seekable-xz_1.0.orig.tar.xz    | Bin 0 -> 7160 bytes
 .../compressme-seekable-xz-1.0-1.src.rpm      | Bin 0 -> 15880 bytes
 .../compressme-seekable-xz-1.0-1.x86_64.rpm   | Bin 0 -> 31873 bytes
 ...sme-seekable-xz-debuginfo-1.0-1.x86_64.rpm | Bin 0 -> 21917 bytes
 ...e-seekable-xz-debugsource-1.0-1.x86_64.rpm | Bin 0 -> 7961 bytes
 tests/run-debuginfod-archive-groom.sh         |   2 +-
 tests/run-debuginfod-extraction.sh            |   2 +-
 tests/run-debuginfod-fd-prefetch-caches.sh    |   4 +
 tests/run-debuginfod-seekable.sh              | 192 ++++
 17 files changed, 1017 insertions(+), 145 deletions(-)
 create mode 100644 tests/debuginfod-debs/seekable-xz/compressme-seekable-xz-dbgsym_1.0-1_amd64.deb
 create mode 100644 tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1.debian.tar.xz
 create mode 100644 tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1.dsc
 create mode 100644 tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1_amd64.deb
 create mode 100644 tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0.orig.tar.xz
 create mode 100644 tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-1.0-1.src.rpm
 create mode 100644 tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-1.0-1.x86_64.rpm
 create mode 100644 tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-debuginfo-1.0-1.x86_64.rpm
 create mode 100644 tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-debugsource-1.0-1.x86_64.rpm
 create mode 100755 tests/run-debuginfod-seekable.sh

-- 
2.45.2

