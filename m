Received: from mail-oo1-f51.google.com (mail-oo1-f51.google.com [209.85.161.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 147311E519
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 08:32:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377938; cv=none; b=bNVBh1ksUHq1aqNVNMyuaLIbHlpJ1iTCJHJTWhznJuDtUlIaCSNi+3h35zghrItF/Pnk5m7NNw4mAWrT/EO0QD2U7S9MfUQLltg0i5InJ9SUYH6TI9Tmfp9ZDD8V6EhprUSEi0s1illwNF3iQohGc7+fXC/CAbP3GvnSJhbflns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377938; c=relaxed/simple;
	bh=V/x4syxdp8ZcGWuz3KrDhKmSFvW2TeX169o7Of5ULys=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=COPwfuVRoJjoP1xLXOkaTQfwQWCX8Vw4FMCz82f9unn20oPUi676jM9sWkPR1exQk2b6+oPjTKrwab94ki0MR2jFKetkOzMs8eI8UiWdko8sY7g10LP4RJcJz19urupk03FLsv3+Lvvx+XhVPJQwJ0CCSvTBjJPz+b6CyjvTEPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=g/8vIZmB; arc=none smtp.client-ip=209.85.161.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="g/8vIZmB"
Received: by mail-oo1-f51.google.com with SMTP id 006d021491bc7-5ce739c2650so920803eaf.1
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 01:32:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721377934; x=1721982734; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qj47/S75JiOHdj8zrrJyGuV0KYdPeJuJgYB4xKwyhXo=;
        b=g/8vIZmBevA/t976FnugAwa9GAmra74C1Jbia6GUlk1OEL6g/xaLr8ApX4AS+uXDP8
         xb5U/fqS5yjK42Ju56bO4OGvkeyopgBXKpDNvVsiXdPSwA2T4l1DuL+4XY5v9Uaxw+9e
         PZaGTvD0hVnIeaDy9deS3NpXOTaILE+60X/cmV7+O60tbpbEE7+PapvcSHJZqEPzQuE/
         IrqTwOu1Fkp3pHri8kd9w9e1qVHNGbIZ8IdLDzSTpqVRQ9NtKjCD05X+ijrgRRufYt44
         H0NEhBncNjrdB8+54YVA5mVnK/3S5ujttZ4SlXUMEJEmPldUXbUZR7yLQqFrscKwm1PX
         dX3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721377934; x=1721982734;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qj47/S75JiOHdj8zrrJyGuV0KYdPeJuJgYB4xKwyhXo=;
        b=RUHR7Ftby88L4W/FUroOyc3/5lZROEPxZZsyAYi1gPPyaSrcgZ1Na+ZMibs9UZS6Ee
         pA+3qY4cSWvxXd2aiZIptsJ0jF8DcLEvDI8OYSLU3jPSdbd0oJyu8ZvMp2+NCZX4tHo8
         IO7FgnLr4ma5cCc+m6s7Qi0s/200euL0JmxtMJwq5AorxYwoByE1A0P3+XCax8NHu1gz
         zPHbhbZhwZ+D83oVne/9NOkJaMQwJ8H5drvzMZzdMAHWQ57X8kBsH+uNVOI2wl0kWSMK
         H8cFacPPPD9/GN4AjwpsVcgAuOERomEhfF78S/qeODCu0C8n01u4xajVwZ3IZ8edDBI9
         uY/g==
X-Forwarded-Encrypted: i=1; AJvYcCUChEZjpjkPRrcRp5caRz0bqfrWVuIJdyng0bC1pWqYzMExQw2Tc2U7V15Lj2zEW59p8PJLepqlal3x6gMaaWWR+yLOAgBJcNuVoIwR/8oL
X-Gm-Message-State: AOJu0Yxno8dGejqPMFD9xOZD5wMd9zoEg+pbtYELO1aZBJujtmMXWmbI
	QBDJ+VxUk8YT91ZkzmUTHzLf4+3AxKaBEVdSrRbhQ186AurdnNCKXWYk7xVHxik=
X-Google-Smtp-Source: AGHT+IER2vgACA68RUEq4FYPQdVdtXgZ4ivzYwwRgL00SHcbU4mX3eQgqgLlpkeGAsIzeLESXBb/kQ==
X-Received: by 2002:a05:6358:599b:b0:1aa:b645:329a with SMTP id e5c5f4694b2df-1aca9f344e0mr458845255d.21.1721377933749;
        Fri, 19 Jul 2024 01:32:13 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b49467sm8832375ad.6.2024.07.19.01.32.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:32:13 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v3 0/7] debuginfod: speed up extraction from kernel debuginfo packages by 200x
Date: Fri, 19 Jul 2024 01:31:56 -0700
Message-ID: <cover.1721377314.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

This is v3 of my patch series optimizing debuginfod for kernel
debuginfo.  v1 is here [7], v2 is here [8].  This version fixes a couple
of minor bugs and adds test cases.

Changes from v2 to v3:

- Added a test case with seekable rpm and deb files.
- Added a couple of independent fixes uncovered while adding tests.
- Added a few more prometheus metrics.
- Fixed passive mode.

Patches 1 and 2 fix existing bugs that the were uncovered by adding new
test package files.  Patch 3 is a preparatory refactor.  Patch 4 makes
the schema changes. Patch 5 implements the seekable xz extraction.
Patch 6 populates the table of seekable entries at scan time and adds a
test.  Patch 7 does it for pre-existing files at request time.

Here is the background copied and pasted from v1:

drgn [1] currently uses debuginfod with great success for debugging
userspace processes.  However, for debugging the Linux kernel (drgn's
main use case), we have had some performance issues with debuginfod, so
we intentionally avoid using it.  Specifically, it sometimes takes over
a minute for debuginfod to respond to queries for vmlinux and kernel
modules (not including the actual download time).

The reason for the slowness is that Linux kernel debuginfo packages are
very large and contain lots of files.  To respond to a query for a Linux
kernel debuginfo file, debuginfod has to decompress and iterate through
the whole package until it finds that file.  If the file is towards the
end of the package, this can take a very long time.  This was previously
reported for vdso files [2][3], which debuginfod was able to mitigate
with improved caching and prefetching.  However, kernel modules are far
greater in number, vary drastically by hardware and workload, and can be
spread all over the package, so in practice I've still been seeing long
delays.  This was also discussed on the drgn issue tracker [4].

The fundamental limitation is that Linux packages, which are essentially
compressed archives with extra metadata headers, don't support random
access to specific files.  However, the multi-threaded xz compression
format does actually support random access.  And, luckily, the kernel
debuginfo packages on Fedora, Debian, and Ubuntu all happen to use
multi-threaded xz compression!

debuginfod can take advantage of this: when it scans a package, if it is
a seekable xz archive, it can save the uncompressed offset and size of
each file.  Then, when it needs a file, it can seek to that offset and
extract it from there.  This requires some understanding of the xz
format and low-level liblzma code, but the speedup is massive: where the
worst case was previously about 50 seconds just to find a file in a
kernel debuginfo package, with this change the worst case is 0.25
seconds, a ~200x improvement! This works for both .rpm and .deb files.

I tested this by requesting and verifying the digest of every file from
a few kernel debuginfo rpms and debs [5].

P.S. The biggest downside of this change is that it depends on a very
specific compression format that is only used by kernel packages
incidentally.  I think this is something we should formalize with Linux
distributions: large debuginfo packages should use a seekable format.
Currently, xz in multi-threaded mode is the only option, but Zstandard
also has an experimental seekable format that is worth looking into [6].

Thanks,
Omar

1: https://github.com/osandov/drgn
2: https://sourceware.org/bugzilla/show_bug.cgi?id=29478
3: https://bugzilla.redhat.com/show_bug.cgi?id=1970578
4: https://github.com/osandov/drgn/pull/380
5: https://gist.github.com/osandov/89d521fdc6c9a07aa8bb0ebf91974346
6: https://github.com/facebook/zstd/tree/dev/contrib/seekable_format
7: https://sourceware.org/pipermail/elfutils-devel/2024q3/007191.html
8: https://sourceware.org/pipermail/elfutils-devel/2024q3/007208.html

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
 debuginfod/debuginfod.cxx                     | 928 +++++++++++++++---
 tests/Makefile.am                             |   4 +-
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
 17 files changed, 1007 insertions(+), 145 deletions(-)
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

