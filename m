Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1F3F146D7C
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 18:24:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721413488; cv=none; b=GvZlgzN/xv8EEVzRvcemFfgRf384YAxKv4uoZ9eu9SbVy6ERVphDv23gyFu7V5S4mPPh3BCqIQUlDvuaoNKl1fRLSTiZW2+mK4Mrmzs+6gMRo++qwNpNUfSkF9s8scO+l7ep6lXfjBUu9ZYrHqb2GwW1lVcuCaNKWvCJ4OMHIbM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721413488; c=relaxed/simple;
	bh=st7h4VWEp3WnC2FkRJB6Jv7b94xK/EqLBhZRLpyuOtg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=S2g34N0HSSNsU1jzoass5nsU7hPi/GAyF9aX1QFxzhhxGZ8I5ae6SlRi+alTBlklO+5lxlSk1KQyKlfLgpYw+IcQwD7WA+x1EI2zkkZPZzClwPTg4aUqpaANHXMSRUjQWHTjWMsuPagin6uB2fbWLhSMOUVVHoeL72/0yr9LoRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=WDxB+sMF; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="WDxB+sMF"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-71871d5e087so1639258a12.1
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 11:24:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721413486; x=1722018286; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=d6LVgQ/2dV7xqdWXeBwu3U0jzidyYiBG6cXMai2lFpw=;
        b=WDxB+sMFQeGIOKj/p611o1WtDzLDrqoFdEsWSoL2fU1igajYyBOg8aOm1hLaJaGIOd
         sTECvub7D7MKe9drS9J+tlsRgOdomMUbRwR1p3qPLN2eBBKERT/lXVTzxYVT89HPRbqc
         24L/0iYlhVXDYJHg8uTZKwh6OgoHJxjvv7y5Bn0aK5bNfmuJoYN1D1pkLyQgjtdJKWZT
         aAX3GD+VvxvSabMtG9h0j+tQuDOe2mBJOP5bhmPHBLC7uiuxjF3NbZ1JzK5M1yQ1Zpkc
         NAQcSZ0RuQvSZDjebxfgqddSgLdMTuQ3WgvpCC4wCpJAe5aIWkyphu/1UepfpGrDZ+I6
         XmJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721413486; x=1722018286;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=d6LVgQ/2dV7xqdWXeBwu3U0jzidyYiBG6cXMai2lFpw=;
        b=Yfufo0Whtk1CQa8qMHMGKdZLCsx1rjrcAjIH1Oc2VW8Tr5LgSyzJlHihl709VF+eYo
         jnn9+5ZFZD+uxMTBGHN6/6YLxHMp1Su4yMYGZuRwKuxvWVkMUEO6+FkwhSTeAvfk+oxJ
         ZBW0ct5w/BLzV6/6bz9wGcsugf74Ugv9EProsaFPomjegZA73w2vLm5+oPYtFBZKcnnE
         guv3lZbJPv/YX50gV0IcHkMCkPMew99OdaSmH1AxhCxaAf/SjRXQN3CbUdMkc3saB8VM
         A+on1siPb7ox9qf5KPwkMagBOu7uXz5Cd1utCvhmaBSAJZjLz9cRIs+7YxcH8fZMwBu0
         WUag==
X-Forwarded-Encrypted: i=1; AJvYcCV/T0+VOWKx5+lp54MN6h3/E+ibgE2Of6C3CE1XpG3TQ9tOD8AjI1eC2wQenK/jGyfelowDXcaCdoBuuv+Vmr5f1LuGlmP1yva7e8+cdfOZ
X-Gm-Message-State: AOJu0Yy+5hhajdXwf5T51INVFY7h7OtKQ7SP8y9+BDVNeVMjfieIPBKD
	WLrcyU2El6cxJAz+4cewqt9L0Oz6a8+sizReejp+AgQPVH8hr9z9AgwdXQoEz4g=
X-Google-Smtp-Source: AGHT+IHiul1DLOfEGVIvO3Hv0zPrqnMOZx5g3u2hKaRKyU2aQxWeLFyquosrkRQ6iXLJMkrV7JRZaw==
X-Received: by 2002:a05:6a20:728d:b0:1c0:eabc:86a8 with SMTP id adf61e73a8af0-1c422855829mr1189578637.5.1721413485810;
        Fri, 19 Jul 2024 11:24:45 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::7:5d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff4b2f40sm1476344b3a.63.2024.07.19.11.24.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:24:45 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v4 0/7] debuginfod: speed up extraction from kernel debuginfo packages by 200x
Date: Fri, 19 Jul 2024 11:24:31 -0700
Message-ID: <cover.1721413308.git.osandov@fb.com>
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
debuginfo.  v1 is here [1], v2 is here [2], v3 is here [3].  The only
changes from v3 in this version are fixing a bogus maybe-uninitialized
error on the Debian build and adding the new test files to EXTRA_DIST so
that make distcheck passes.

Thanks,
Omar

1: https://sourceware.org/pipermail/elfutils-devel/2024q3/007191.html
2: https://sourceware.org/pipermail/elfutils-devel/2024q3/007208.html
3: https://sourceware.org/pipermail/elfutils-devel/2024q3/007243.html

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
 tests/run-debuginfod-seekable.sh              | 186 ++++
 17 files changed, 1011 insertions(+), 145 deletions(-)
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

