Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EA21DF71
	for <linux-debuggers@vger.kernel.org>; Wed, 10 Jul 2024 20:47:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720644445; cv=none; b=ZDWQb1Io+oPkMOECU5R3iKzLhCbdJZcg89geYSvrotZfWSs3k1uyHmhpeseu+XAxSAL8eM9M3x4VwHFxWZ6Q/3uYKMScpot9p8Qk5lnkUwhbAd4/EiG2IoOuU2zt2jJC+YrXUPB3BhaJq61Tlb+tulLdjM1agxBWtMDKkNmXDXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720644445; c=relaxed/simple;
	bh=vGBIcBvmeTdU7DQa3VC5+RW7M4X7ipjsU7I8K2fNn1M=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=cLuNGR1b0lWYGJMiFz0tlHNp+5WjLqpnTvs+/cfbhi1KxXThKYWXGgk7LpL7mxUNkxFzmb74tmk29s0s/YWkk/BgsFQON4kyUb2wYHQnjHrUy3lX9JLEpBfw2+NQrLLK/td2+e2WpU68VgLbvdQ/fJqs3u4sIaX8Ul2Y4FjFGRw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=qsSmRMug; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="qsSmRMug"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1fb72eb3143so1600735ad.1
        for <linux-debuggers@vger.kernel.org>; Wed, 10 Jul 2024 13:47:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1720644443; x=1721249243; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=I29wQ4cK8G8p67UqSleTUzA6bTgv4PXvM5++AXzjg1E=;
        b=qsSmRMugV3kl74FlZzIqHUlEQnxhADTV7Pp1X3j7kZRoQIzZsKrcVik0dnJGtb17Am
         nTyiOdDBrce1r/0HhUdbxE93jVl/LTJTev5HsJ0Ees6Z/QqGMoDwPiW8fvjuCoKSn+1t
         9SHA6Qzz74pf7Eb4YaM/vgVGF5pzcEB6M/Tq6lVH+rWJyRnB8Q0m9J+uSYPeR4OMIrzR
         hwcv+mrshexj1b1lan6fB/R7iW06mXVsr1iEavpk+on/u0Bjy4fm30XN1XgLK/qgyZEC
         IHySTQ5Wam6evAl1RZuY/OmO6gS/4nsgPgNDGc1mjrsMEDpiXVbgPytsVLV5JMruwlt8
         xTww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720644443; x=1721249243;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=I29wQ4cK8G8p67UqSleTUzA6bTgv4PXvM5++AXzjg1E=;
        b=wlcJKfc65jSWt8vZ9BKUq9A8TxrCESgYCrRnYtVJuUzELQL9bV7WVfr0TVAcNSH3gJ
         1lIxsvTYGpnYZ3RozRRYsKqcHsd9pXRBkhEtupJwmw1Ylm4ST/G2pPyCSbVZZOnoDqTx
         U3BiX26hZ2pkdiPqEcP8bUngG8kjAF5lOd+MN2odB7lBN5ODEMv8zxPI0dSbJS7ZCATz
         LhgdaOiqk+I2b7wmpBGxvWD/Mqn0r5dFJ1vhFlINxXz5qYK0kHoKewpT9dkNfStIbGb6
         qiTctRVl1nTpZi4UHsg2mdBjBFWMFicrKHEi/pTKThkMzh8Y5mymwjZIl/DgGqi+1tIC
         Oidg==
X-Gm-Message-State: AOJu0Yyae8zHXgqDvUsPBap5EIut4bqv/gPD1s4pnQfwCMGE8juU1sJR
	XlkMQNAiB1iQTZrU9j3szFIWMPKVFAES/89oGznTHgenrvmgpeT9QwTzlDMqC5TwiPE0b1QrgGC
	K
X-Google-Smtp-Source: AGHT+IFq5LXLdgUUvhDh2V6OK9rv41Q7Y/l5y1N+6zV164SN+C8/HR8QNDe7Ge9+LyWmRlWzOMD4qw==
X-Received: by 2002:a17:902:c401:b0:1fa:fe30:fc16 with SMTP id d9443c01a7336-1fbdba4a0aamr12156035ad.25.1720644443086;
        Wed, 10 Jul 2024 13:47:23 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:134a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad5be3sm37698025ad.301.2024.07.10.13.47.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 13:47:22 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH 0/3] debuginfod: speed up extraction from kernel debuginfo packages by 200x
Date: Wed, 10 Jul 2024 13:47:10 -0700
Message-ID: <cover.1720644134.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

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

Patch 1 is a preparatory refactor.  Patch 2 implements saving the
uncompressed offsets and sizes in the database.  Patch 3 implements the
seekable xz extraction.

I tested this by requesting and verifying the digest of every file from
a few kernel debuginfo rpms and debs [5].

P.S. The biggest downside of this change is that it depends on a very
specific compression format.  I think this is something we should
formalize with Linux distributions: large debuginfo packages should use
a seekable format.  Currently, xz in multi-threaded mode is the only
option, but Zstandard also has an experimental seekable format that is
worth looking into [6].

1: https://github.com/osandov/drgn
2: https://sourceware.org/bugzilla/show_bug.cgi?id=29478
3: https://bugzilla.redhat.com/show_bug.cgi?id=1970578
4: https://github.com/osandov/drgn/pull/380
5: https://gist.github.com/osandov/89d521fdc6c9a07aa8bb0ebf91974346
6: https://github.com/facebook/zstd/tree/dev/contrib/seekable_format

Omar Sandoval (3):
  debuginfod: factor out common code for responding from an archive
  debuginfod: add archive entry size, mtime, and uncompressed offset to
    database
  debuginfod: optimize extraction from seekable xz archives

 configure.ac              |   5 +
 debuginfod/Makefile.am    |   2 +-
 debuginfod/debuginfod.cxx | 870 +++++++++++++++++++++++++++++++-------
 3 files changed, 722 insertions(+), 155 deletions(-)

-- 
2.45.2

