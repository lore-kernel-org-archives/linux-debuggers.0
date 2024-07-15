Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49229187323
	for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 10:04:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721037893; cv=none; b=Vkk2ASkPcESapOqZASm9OQpNNh9AlFYgb+yfgRuoUpPgvGNkoj8a+9d+oThqhAJQXzqGO9ugI2DChC7Ha2D62kQlnshiqn0V512Y7eI313g4IeiLSfWD8WHxXJfNXo9H/RiTNy78yJclyL+L/QwSEXzdVtsItYlxAD4kI1gukgw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721037893; c=relaxed/simple;
	bh=I2O68X8p4uI9Apxa7iIGDxkTitHUEVO5cXpRnfq6PDU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Zq06Z2sq5PLYE2m5+Mjmq2B0wHul3v2xZyw9O30pk/rEIYZaxHgisdf02ogQ0DeZ93JpskyX06thtn4rB7GeweTZ2Gh5MDbyXsO6VX5aeHMwah7cdDxT1yrutam+PHkwwiigSeSPhR5tgI1rmDxf9r3Xd1Tmi+mpGcbVGXW4AWw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=wqYLclbz; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="wqYLclbz"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70af81e8439so3424459b3a.0
        for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 03:04:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721037890; x=1721642690; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=fSLXBnITwTBh9tXhwoDTkKW3wU7HmnHt1KxfdRM41X0=;
        b=wqYLclbzZzTK4sfc5y6rERAJoPM6XMCYTCEdhUn4LWNBNihhn83piiLBkno9rao7zC
         BLypVh2SMFr+x8CeWfSrewSK/UaeZomzs3Et/nJMHgKeJkXi4tCByNMNlywkx6UdCLT7
         8M4dk6BXXjgRGLLcllWmp/WlZ+LwYOnhR2Lx9p2xYZY1qXIbK02n9LNqvjdb7gCl4eMB
         Nuc6XAf7sMhUWYU7yXo1J83TBGyP5mRlFuDukrxonHINp7EuKvRGazKM9b3PcHGY4cyK
         PTEky1pQH1QHssPX2MRkuxH+EAnslKzGZf5+/h+apJkUNVsmla1t3wiS2gq3nbWCsjPG
         q3YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721037890; x=1721642690;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fSLXBnITwTBh9tXhwoDTkKW3wU7HmnHt1KxfdRM41X0=;
        b=DPtUY1etbZu9FTa4yFHVHeNQeWSRQYEag/+/5bb5SuZX1mU9tSwkqPZ9IYgmzWSOJO
         zmo52XcTEEaMBhKlTdpnGopddmCluORC7Y4+FD0fOmpGf8aoJHQBY5Tm4Opfta32y7nC
         OAbyU4zuvRXxU2f6TKOsE2+UIJaOMpBX94VSneW/lVI5OvHAcMGCZIMDCoHiYOCJfh+g
         oiDEOtHuJICCNgMgTK4sHGL0cHL9ffva1hGaxZrq2+q/1jx4+82EfF521X2nYNuQ1t3L
         bC1XfISxcjEShvHFuLP2j6O53vrVq7V66Av01YEmtxX25zLgh5B+TughBRnMKALKmseJ
         4cEg==
X-Gm-Message-State: AOJu0Yx04NJ9xYV8kwHBR7d0RrcomFaaH6yT/aalVc4TLEjMmcf4jQHe
	97uWr2DwpRHcf803aBhUbmkrCMBXm66MwpjK717BlDjh7cmfnHnP2pG2PAjkfKvBTdyI07HGNu2
	M
X-Google-Smtp-Source: AGHT+IEw/1OaP8p40RpaoybS1+2A5W+OtiOzshEQ+WpE7sExzxGaE9iNKCd/rXMnB9HJZtdO7Kq6OA==
X-Received: by 2002:a05:6a00:b87:b0:70b:152:331 with SMTP id d2e1a72fcca58-70b435f6277mr24027681b3a.21.1721037890424;
        Mon, 15 Jul 2024 03:04:50 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2c4d3sm3049100a12.48.2024.07.15.03.04.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:04:50 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH v2 0/5] debuginfod: speed up extraction from kernel debuginfo packages by 200x
Date: Mon, 15 Jul 2024 03:04:31 -0700
Message-ID: <cover.1721037200.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

This is v2 of my patch series optimizing debuginfod for kernel
debuginfo.  v1 is here [7].

The main change from v1 is reworking the database changes to be backward
compatible and therefore not require reindexing.

Patch 1 is a preparatory refactor.  Patch 2 makes the schema changes.
Patch 3 implements the seekable xz extraction.  Patch 4 populates the
table of seekable entries at scan time.  Patch 5 does it for
pre-existing files at request time.

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

Omar Sandoval (5):
  debuginfod: factor out common code for responding from an archive
  debugifod: add new table and views for seekable archives
  debuginfod: optimize extraction from seekable xz archives
  debuginfod: populate _r_seekable on scan
  debuginfod: populate _r_seekable on request

 configure.ac              |   5 +
 debuginfod/Makefile.am    |   2 +-
 debuginfod/debuginfod.cxx | 921 ++++++++++++++++++++++++++++++++------
 3 files changed, 788 insertions(+), 140 deletions(-)

-- 
2.45.2

