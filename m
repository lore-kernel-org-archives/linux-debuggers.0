Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8845C14600C
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 22:36:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774162; cv=none; b=mckUWzMOzPQB464mrXdCA4af12D24jNnLQQgIsJJcTJZMNDoErVN75L8gds9DiVBURXIBYZfnkOnLA2LYUbaqyBM2C3urefgYNN3CxYiJe+VOdwj9U/vR60mqn1UGTlxQLFS0BLQPHTfrv1mTkFSrFlrN/s23hocqrQ++eZ9SvM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774162; c=relaxed/simple;
	bh=iqlG0Dw0ZyEWzSwxSuMLFJ/KuSCsEWFd60/jwbF77co=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lvTQGRTJpEe+0ce8CZzO9E/vv+bh4Yf33ZajN3qaxASH9Enk/ezZ0q9ArB228//UNzLxxPylq09LoNW8lLZk9J4ZLMm4k7f+LVyAkbntOyqhzQnT/y206cEJeaJhnmuixP/wVqbZf8djFtJm1DBHwqlxUCoD+MXgPL3FEH+sUTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=d6gTUwPL; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="d6gTUwPL"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d2d7e692eso1769297b3a.0
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 15:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721774160; x=1722378960; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5C+Pjur69r6z6WOUVFyclMKRmO7Dq0GkyE/j9S93y1I=;
        b=d6gTUwPLiTuOePXrXHW+kdmWhSSRt9AlTasBEGexms9c02AtoeyaO3BC0O3ldh3iat
         e3zV7GsTRYXqsTbmBwLjvmu0nQOkunJSex5BKc22pvbkV264b4HWTtQwUSh6Ax/XXI1f
         pgVLxNCeolB+NjiPP9SdIGgiPX/Wm/8xECPYBtf3jwXpZDL+3aXNkngTq/5tk/eV5NWk
         N3+/aqoD3QZp3sb1IzRIEdRp8es2INQ3JiG+FFC/5Uj3mG7/Y7HhiWLyE7iNRpFSXTLT
         trUTYLF3j5eEuIFN7UNmEMDZySl3mE3HX1oxjAj602YmwGypWGMoQTQtyvY0QFZGBDs8
         eOMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721774160; x=1722378960;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5C+Pjur69r6z6WOUVFyclMKRmO7Dq0GkyE/j9S93y1I=;
        b=hChnGYDBQzXTaLfeaXfE1Yhgk1v6I4tF9jdiyv1PEQ/5KxfKFitPXVTjSKWO88Dq6K
         iDTQhev3jQwoJfEIRBorFhWKXXyU4NYa+fycmNecqxs01YSs25gWMtU+8DWAXDtEqapQ
         Vhh/VUYMxh1iWgeFFlup9XzRoGTJHf+y/q5dbKQyj3s1YO5iYs+IHRKZ+n1VrY0zHJJ8
         dPV8ivkdAJC+cbPbrk/ltkK45StFp2/eNxW/EHdBBZRR9FaxY++pcGXe4jTPyY09vv+N
         exDMDD1SCH+XytWV44s1L4Q9ruqX6qW3ey/8GOuW4xn8L3vuLvYcjbtu8+NpKtuqYzGN
         rPqg==
X-Forwarded-Encrypted: i=1; AJvYcCWdBdLyM1gfaFO0c3E6v7AuE8Fmf4+qlnMbnNTu31HjubvxEeeRYqdlvLJSYZBER+eWe+y9Vxnt94sADvTSWU9rjiCRY8Mh6DzRSbzenR0p
X-Gm-Message-State: AOJu0YzGvgCEU6ps9eoDuR5rj5HXhPcN42OClSPW3V/QIbSMz8n7yXYN
	C9LUMkR5D+/0QZuzHioJxE3h5wd+NS/5Dy30xll/rPpEnl/F/vff5cAltDyQ0vk=
X-Google-Smtp-Source: AGHT+IH9KqbdfDSm9mRwpAS98n2B5zgHfwqJNB0CLZdR9FdFQnjubg7P22vysBxYz9KbYg+3hT0adQ==
X-Received: by 2002:a05:6a21:3283:b0:1c0:e46a:1639 with SMTP id adf61e73a8af0-1c46196d145mr616745637.19.1721774159546;
        Tue, 23 Jul 2024 15:35:59 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:b6d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d241803fdsm4308079b3a.220.2024.07.23.15.35.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 15:35:58 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	Aaron Merey <amerey@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v5 5/7] debuginfod: optimize extraction from seekable xz archives
Date: Tue, 23 Jul 2024 15:35:41 -0700
Message-ID: <967aa58cfdff12734036216e17f5fea8e5c45540.1721773977.git.osandov@fb.com>
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

The kernel debuginfo packages on Fedora, Debian, and Ubuntu, and many of
their downstreams, are all compressed with xz in multi-threaded mode,
which allows random access.  We can use this to bypass the full archive
extraction and dramatically speed up kernel debuginfo requests (from ~50
seconds in the worst case to < 0.25 seconds).

This works because multi-threaded xz compression splits up the stream
into many independently compressed blocks.  The stream ends with an
index of blocks.  So, to seek to an offset, we find the block containing
that offset in the index and then decompress and throw away data until
we reach the offset within the block.  We can then decompress the
desired amount of data, possibly from subsequent blocks.  There's no
high-level API in liblzma to do this, but we can do it by stitching
together a few low-level APIs.

We need to pass down the file ids then look up the size, uncompressed
offset, and mtime in the _r_seekable table.  Note that this table is not
yet populated, so this commit has no functional change on its own.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 configure.ac              |   5 +
 debuginfod/Makefile.am    |   2 +-
 debuginfod/debuginfod.cxx | 456 +++++++++++++++++++++++++++++++++++++-
 3 files changed, 457 insertions(+), 6 deletions(-)

diff --git a/configure.ac b/configure.ac
index 24e68d94..9c5f7e51 100644
--- a/configure.ac
+++ b/configure.ac
@@ -441,8 +441,13 @@ eu_ZIPLIB(bzlib,BZLIB,bz2,BZ2_bzdopen,bzip2)
 # We need this since bzip2 doesn't have a pkgconfig file.
 BZ2_LIB="$LIBS"
 AC_SUBST([BZ2_LIB])
+save_LIBS="$LIBS"
+LIBS=
 eu_ZIPLIB(lzma,LZMA,lzma,lzma_auto_decoder,[LZMA (xz)])
+lzma_LIBS="$LIBS"
+LIBS="$lzma_LIBS $save_LIBS"
 AS_IF([test "x$with_lzma" = xyes], [LIBLZMA="liblzma"], [LIBLZMA=""])
+AC_SUBST([lzma_LIBS])
 AC_SUBST([LIBLZMA])
 eu_ZIPLIB(zstd,ZSTD,zstd,ZSTD_decompress,[ZSTD (zst)])
 AS_IF([test "x$with_zstd" = xyes], [LIBZSTD="libzstd"], [LIBLZSTD=""])
diff --git a/debuginfod/Makefile.am b/debuginfod/Makefile.am
index b74e3673..e199dc0c 100644
--- a/debuginfod/Makefile.am
+++ b/debuginfod/Makefile.am
@@ -70,7 +70,7 @@ bin_PROGRAMS += debuginfod-find
 endif
 
 debuginfod_SOURCES = debuginfod.cxx
-debuginfod_LDADD = $(libdw) $(libelf) $(libeu) $(libdebuginfod) $(argp_LDADD) $(fts_LIBS) $(libmicrohttpd_LIBS) $(sqlite3_LIBS) $(libarchive_LIBS) $(rpm_LIBS) $(jsonc_LIBS) $(libcurl_LIBS) -lpthread -ldl
+debuginfod_LDADD = $(libdw) $(libelf) $(libeu) $(libdebuginfod) $(argp_LDADD) $(fts_LIBS) $(libmicrohttpd_LIBS) $(sqlite3_LIBS) $(libarchive_LIBS) $(rpm_LIBS) $(jsonc_LIBS) $(libcurl_LIBS) $(lzma_LIBS) -lpthread -ldl
 
 debuginfod_find_SOURCES = debuginfod-find.c
 debuginfod_find_LDADD = $(libdw) $(libelf) $(libeu) $(libdebuginfod) $(argp_LDADD) $(fts_LIBS) $(jsonc_LIBS)
diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index b3d80090..cf7f48ab 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -63,6 +63,10 @@ extern "C" {
 #undef __attribute__ /* glibc bug - rhbz 1763325 */
 #endif
 
+#ifdef USE_LZMA
+#include <lzma.h>
+#endif
+
 #include <unistd.h>
 #include <stdlib.h>
 #include <locale.h>
@@ -1961,6 +1965,385 @@ handle_buildid_f_match (bool internal_req_t,
   return r;
 }
 
+
+#ifdef USE_LZMA
+struct lzma_exception: public reportable_exception
+{
+  lzma_exception(int rc, const string& msg):
+    // liblzma doesn't have a lzma_ret -> string conversion function, so just
+    // report the value.
+    reportable_exception(string ("lzma error: ") + msg + ": error " + to_string(rc)) {
+      inc_metric("error_count","lzma",to_string(rc));
+    }
+};
+
+// Neither RPM nor deb files support seeking to a specific file in the package.
+// Instead, to extract a specific file, we normally need to read the archive
+// sequentially until we find the file.  This is very slow for files at the end
+// of a large package with lots of files, like kernel debuginfo.
+//
+// However, if the compression format used in the archive supports seeking, we
+// can accelerate this.  As of July 2024, xz is the only widely-used format that
+// supports seeking, and usually only in multi-threaded mode.  Luckily, the
+// kernel-debuginfo package in Fedora and its downstreams, and the
+// linux-image-*-dbg package in Debian and its downstreams, all happen to use
+// this.
+//
+// The xz format [1] ends with an index of independently compressed blocks in
+// the stream.  In RPM and deb files, the xz stream is the last thing in the
+// file, so we assume that the xz Stream Footer is at the end of the package
+// file and do everything relative to that.  For each file in the archive, we
+// remember the size and offset of the file data in the uncompressed xz stream,
+// then we use the index to seek to that offset when we need that file.
+//
+// 1: https://xz.tukaani.org/format/xz-file-format.txt
+
+// Read the Index at the end of an xz file.
+static lzma_index*
+read_xz_index (int fd)
+{
+  off_t footer_pos = -LZMA_STREAM_HEADER_SIZE;
+  if (lseek (fd, footer_pos, SEEK_END) == -1)
+    throw libc_exception (errno, "lseek");
+
+  uint8_t footer[LZMA_STREAM_HEADER_SIZE];
+  size_t footer_read = 0;
+  while (footer_read < sizeof (footer))
+    {
+      ssize_t bytes_read = read (fd, footer + footer_read,
+                                 sizeof (footer) - footer_read);
+      if (bytes_read < 0)
+        {
+          if (errno == EINTR)
+            continue;
+          throw libc_exception (errno, "read");
+        }
+      if (bytes_read == 0)
+        throw reportable_exception ("truncated file");
+      footer_read += bytes_read;
+    }
+
+  lzma_stream_flags stream_flags;
+  lzma_ret ret = lzma_stream_footer_decode (&stream_flags, footer);
+  if (ret != LZMA_OK)
+    throw lzma_exception (ret, "lzma_stream_footer_decode");
+
+  if (lseek (fd, footer_pos - stream_flags.backward_size, SEEK_END) == -1)
+    throw libc_exception (errno, "lseek");
+
+  lzma_stream strm = LZMA_STREAM_INIT;
+  lzma_index* index = NULL;
+  ret = lzma_index_decoder (&strm, &index, UINT64_MAX);
+  if (ret != LZMA_OK)
+    throw lzma_exception (ret, "lzma_index_decoder");
+  defer_dtor<lzma_stream*,void> strm_ender (&strm, lzma_end);
+
+  uint8_t in_buf[4096];
+  while (true)
+    {
+      if (strm.avail_in == 0)
+        {
+          ssize_t bytes_read = read (fd, in_buf, sizeof (in_buf));
+          if (bytes_read < 0)
+            {
+              if (errno == EINTR)
+                continue;
+              throw libc_exception (errno, "read");
+            }
+          if (bytes_read == 0)
+            throw reportable_exception ("truncated file");
+          strm.avail_in = bytes_read;
+          strm.next_in = in_buf;
+        }
+
+        ret = lzma_code (&strm, LZMA_RUN);
+        if (ret == LZMA_STREAM_END)
+          break;
+        else if (ret != LZMA_OK)
+          throw lzma_exception (ret, "lzma_code index");
+    }
+
+  ret = lzma_index_stream_flags (index, &stream_flags);
+  if (ret != LZMA_OK)
+    {
+      lzma_index_end (index, NULL);
+      throw lzma_exception (ret, "lzma_index_stream_flags");
+    }
+  return index;
+}
+
+static void
+my_lzma_index_end (lzma_index* index)
+{
+  lzma_index_end (index, NULL);
+}
+
+static void
+free_lzma_block_filter_options (lzma_block* block)
+{
+  for (int i = 0; i < LZMA_FILTERS_MAX; i++)
+    {
+      free (block->filters[i].options);
+      block->filters[i].options = NULL;
+    }
+}
+
+static void
+free_lzma_block_filters (lzma_block* block)
+{
+  if (block->filters != NULL)
+    {
+      free_lzma_block_filter_options (block);
+      free (block->filters);
+    }
+}
+
+static void
+extract_xz_blocks_into_fd (const string& srcpath,
+                           int src,
+                           int dst,
+                           lzma_index_iter* iter,
+                           uint64_t offset,
+                           uint64_t size)
+{
+  // Seek to the Block.  Seeking from the end using the compressed size from the
+  // footer means we don't need to know where the xz stream starts in the
+  // archive.
+  if (lseek (src,
+             (off_t) iter->block.compressed_stream_offset
+             - (off_t) iter->stream.compressed_size,
+             SEEK_END) == -1)
+    throw libc_exception (errno, "lseek");
+
+  offset -= iter->block.uncompressed_file_offset;
+
+  lzma_block block{};
+  block.filters = (lzma_filter*) calloc (LZMA_FILTERS_MAX + 1,
+                                         sizeof (lzma_filter));
+  if (block.filters == NULL)
+    throw libc_exception (ENOMEM, "cannot allocate lzma_block filters");
+  defer_dtor<lzma_block*,void> filters_freer (&block, free_lzma_block_filters);
+
+  uint8_t in_buf[4096];
+  uint8_t out_buf[4096];
+  size_t header_read = 0;
+  bool need_log_extracting = verbose > 3;
+  while (true)
+    {
+      // The first byte of the Block is the encoded Block Header Size.  Read the
+      // first byte and whatever extra fits in the buffer.
+      while (header_read == 0)
+        {
+          ssize_t bytes_read = read (src, in_buf, sizeof (in_buf));
+          if (bytes_read < 0)
+            {
+              if (errno == EINTR)
+                continue;
+              throw libc_exception (errno, "read");
+            }
+          if (bytes_read == 0)
+            throw reportable_exception ("truncated file");
+          header_read += bytes_read;
+        }
+
+      block.header_size = lzma_block_header_size_decode (in_buf[0]);
+
+      // If we didn't buffer the whole Block Header earlier, get the rest.
+      eu_static_assert (sizeof (in_buf)
+                        >= lzma_block_header_size_decode (UINT8_MAX));
+      while (header_read < block.header_size)
+        {
+          ssize_t bytes_read = read (src, in_buf + header_read,
+                                     sizeof (in_buf) - header_read);
+          if (bytes_read < 0)
+            {
+              if (errno == EINTR)
+                continue;
+              throw libc_exception (errno, "read");
+            }
+          if (bytes_read == 0)
+            throw reportable_exception ("truncated file");
+          header_read += bytes_read;
+        }
+
+      // Decode the Block Header.
+      block.check = iter->stream.flags->check;
+      lzma_ret ret = lzma_block_header_decode (&block, NULL, in_buf);
+      if (ret != LZMA_OK)
+        throw lzma_exception (ret, "lzma_block_header_decode");
+      ret = lzma_block_compressed_size (&block, iter->block.unpadded_size);
+      if (ret != LZMA_OK)
+        throw lzma_exception (ret, "lzma_block_compressed_size");
+
+      // Start decoding the Block data.
+      lzma_stream strm = LZMA_STREAM_INIT;
+      ret = lzma_block_decoder (&strm, &block);
+      if (ret != LZMA_OK)
+        throw lzma_exception (ret, "lzma_block_decoder");
+      defer_dtor<lzma_stream*,void> strm_ender (&strm, lzma_end);
+
+      // We might still have some input buffered from when we read the header.
+      strm.avail_in = header_read - block.header_size;
+      strm.next_in = in_buf + block.header_size;
+      strm.avail_out = sizeof (out_buf);
+      strm.next_out = out_buf;
+      while (true)
+        {
+          if (strm.avail_in == 0)
+            {
+              ssize_t bytes_read = read (src, in_buf, sizeof (in_buf));
+              if (bytes_read < 0)
+                {
+                  if (errno == EINTR)
+                    continue;
+                  throw libc_exception (errno, "read");
+                }
+              if (bytes_read == 0)
+                throw reportable_exception ("truncated file");
+              strm.avail_in = bytes_read;
+              strm.next_in = in_buf;
+            }
+
+          ret = lzma_code (&strm, LZMA_RUN);
+          if (ret != LZMA_OK && ret != LZMA_STREAM_END)
+            throw lzma_exception (ret, "lzma_code block");
+
+          // Throw away anything we decode until we reach the offset, then
+          // start writing to the destination.
+          if (strm.total_out > offset)
+            {
+              size_t bytes_to_write = strm.next_out - out_buf;
+              uint8_t* buf_to_write = out_buf;
+
+              // Ignore anything in the buffer before the offset.
+              if (bytes_to_write > strm.total_out - offset)
+                {
+                  buf_to_write += bytes_to_write - (strm.total_out - offset);
+                  bytes_to_write = strm.total_out - offset;
+                }
+
+              // Ignore anything after the size.
+              if (strm.total_out - offset >= size)
+                bytes_to_write -= strm.total_out - offset - size;
+
+              if (need_log_extracting)
+                {
+                  obatched(clog) << "extracting from xz archive " << srcpath
+                                 << " size=" << size << endl;
+                  need_log_extracting = false;
+                }
+
+              while (bytes_to_write > 0)
+                {
+                  ssize_t written = write (dst, buf_to_write, bytes_to_write);
+                  if (written < 0)
+                    {
+                      if (errno == EAGAIN)
+                        continue;
+                      throw libc_exception (errno, "write");
+                    }
+                  bytes_to_write -= written;
+                  buf_to_write += written;
+                }
+
+              // If we reached the size, we're done.
+              if (strm.total_out - offset >= size)
+                return;
+            }
+
+          strm.avail_out = sizeof (out_buf);
+          strm.next_out = out_buf;
+
+          if (ret == LZMA_STREAM_END)
+            break;
+        }
+
+      // This Block didn't have enough data.  Go to the next one.
+      if (lzma_index_iter_next (iter, LZMA_INDEX_ITER_BLOCK))
+        throw reportable_exception ("no more blocks");
+      if (strm.total_out > offset)
+        size -= strm.total_out - offset;
+      offset = 0;
+      // If we had any buffered input left, move it to the beginning of the
+      // buffer to decode the next Block Header.
+      if (strm.avail_in > 0)
+        {
+          memmove (in_buf, strm.next_in, strm.avail_in);
+          header_read = strm.avail_in;
+        }
+      else
+        header_read = 0;
+      free_lzma_block_filter_options (&block);
+    }
+}
+
+static int
+extract_from_seekable_archive (const string& srcpath,
+                               char* tmppath,
+                               uint64_t offset,
+                               uint64_t size)
+{
+  inc_metric ("seekable_archive_extraction_attempts","type","xz");
+  try
+    {
+      int src = open (srcpath.c_str(), O_RDONLY);
+      if (src < 0)
+        throw libc_exception (errno, string("open ") + srcpath);
+      defer_dtor<int,int> src_closer (src, close);
+
+      lzma_index* index = read_xz_index (src);
+      defer_dtor<lzma_index*,void> index_ender (index, my_lzma_index_end);
+
+      // Find the Block containing the offset.
+      lzma_index_iter iter;
+      lzma_index_iter_init (&iter, index);
+      if (lzma_index_iter_locate (&iter, offset))
+        throw reportable_exception ("offset not found");
+
+      if (verbose > 3)
+        obatched(clog) << "seeking in xz archive " << srcpath
+                       << " offset=" << offset << " block_offset="
+                       << iter.block.uncompressed_file_offset << endl;
+
+      int dst = mkstemp (tmppath);
+      if (dst < 0)
+        throw libc_exception (errno, "cannot create temporary file");
+
+      try
+        {
+          extract_xz_blocks_into_fd (srcpath, src, dst, &iter, offset, size);
+        }
+      catch (...)
+        {
+          unlink (tmppath);
+          close (dst);
+          throw;
+        }
+
+      inc_metric ("seekable_archive_extraction_successes","type","xz");
+      return dst;
+    }
+  catch (const reportable_exception &e)
+    {
+      inc_metric ("seekable_archive_extraction_failures","type","xz");
+      if (verbose)
+        obatched(clog) << "failed to extract from seekable xz archive "
+                       << srcpath << ": " << e.message << endl;
+      return -1;
+    }
+}
+#else
+static int
+extract_from_seekable_archive (const string& srcpath,
+                               char* tmppath,
+                               uint64_t offset,
+                               uint64_t size)
+{
+  return -1;
+}
+#endif
+
+
 // For security/portability reasons, many distro-package archives have
 // a "./" in front of path names; others have nothing, others have
 // "/".  Canonicalize them all to a single leading "/", with the
@@ -2060,6 +2443,8 @@ handle_buildid_r_match (bool internal_req_p,
                         int64_t b_mtime,
                         const string& b_source0,
                         const string& b_source1,
+                        int64_t b_id0,
+                        int64_t b_id1,
                         const string& section,
                         int *result_fd)
 {
@@ -2246,7 +2631,59 @@ handle_buildid_r_match (bool internal_req_p,
       // NB: see, we never go around the 'loop' more than once
     }
 
-  // no match ... grumble, must process the archive
+  // no match ... look for a seekable entry
+  unique_ptr<sqlite_ps> pp (new sqlite_ps (internal_req_p ? db : dbq,
+                                           "rpm-seekable-query",
+                                           "select type, size, offset, mtime from " BUILDIDS "_r_seekable "
+                                           "where file = ? and content = ?"));
+  rc = pp->reset().bind(1, b_id0).bind(2, b_id1).step();
+  if (rc != SQLITE_DONE)
+    {
+      if (rc != SQLITE_ROW)
+        throw sqlite_exception(rc, "step");
+      const char* seekable_type = (const char*) sqlite3_column_text (*pp, 0);
+      if (seekable_type != NULL && strcmp (seekable_type, "xz") == 0)
+        {
+          int64_t seekable_size = sqlite3_column_int64 (*pp, 1);
+          int64_t seekable_offset = sqlite3_column_int64 (*pp, 2);
+          int64_t seekable_mtime = sqlite3_column_int64 (*pp, 3);
+
+          char* tmppath = NULL;
+          if (asprintf (&tmppath, "%s/debuginfod-fdcache.XXXXXX", tmpdir.c_str()) < 0)
+            throw libc_exception (ENOMEM, "cannot allocate tmppath");
+          defer_dtor<void*,void> tmmpath_freer (tmppath, free);
+
+          fd = extract_from_seekable_archive (b_source0, tmppath,
+                                              seekable_offset, seekable_size);
+          if (fd >= 0)
+            {
+              // Set the mtime so the fdcache file mtimes propagate to future webapi
+              // clients.
+              struct timespec tvs[2];
+              tvs[0].tv_sec = 0;
+              tvs[0].tv_nsec = UTIME_OMIT;
+              tvs[1].tv_sec = seekable_mtime;
+              tvs[1].tv_nsec = 0;
+              (void) futimens (fd, tvs);  /* best effort */
+              struct MHD_Response* r = create_buildid_r_response (b_mtime,
+                                                                  b_source0,
+                                                                  b_source1,
+                                                                  section,
+                                                                  ima_sig,
+                                                                  tmppath, fd,
+                                                                  seekable_size,
+                                                                  seekable_mtime,
+                                                                  "seekable xz archive",
+                                                                  extract_begin);
+              if (r != 0 && result_fd)
+                *result_fd = fd;
+              return r;
+            }
+        }
+    }
+  pp.reset();
+
+  // still no match ... grumble, must process the archive
   string archive_decoder = "/dev/null";
   string archive_extension = "";
   for (auto&& arch : scan_archives)
@@ -2445,6 +2882,8 @@ handle_buildid_match (bool internal_req_p,
                       const string& b_stype,
                       const string& b_source0,
                       const string& b_source1,
+                      int64_t b_id0,
+                      int64_t b_id1,
                       const string& section,
                       int *result_fd)
 {
@@ -2455,7 +2894,8 @@ handle_buildid_match (bool internal_req_p,
 				      section, result_fd);
       else if (b_stype == "R")
         return handle_buildid_r_match(internal_req_p, b_mtime, b_source0,
-				      b_source1, section, result_fd);
+				      b_source1, b_id0, b_id1, section,
+				      result_fd);
     }
   catch (const reportable_exception &e)
     {
@@ -2571,7 +3011,7 @@ handle_buildid (MHD_Connection* conn,
   if (atype_code == "D")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-d",
-                          "select mtime, sourcetype, source0, source1 from " BUILDIDS "_query_d2 where buildid = ? "
+                          "select mtime, sourcetype, source0, source1, id0, id1 from " BUILDIDS "_query_d2 where buildid = ? "
                           "order by mtime desc");
       pp->reset();
       pp->bind(1, buildid);
@@ -2579,7 +3019,7 @@ handle_buildid (MHD_Connection* conn,
   else if (atype_code == "E")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-e",
-                          "select mtime, sourcetype, source0, source1 from " BUILDIDS "_query_e2 where buildid = ? "
+                          "select mtime, sourcetype, source0, source1, id0, id1 from " BUILDIDS "_query_e2 where buildid = ? "
                           "order by mtime desc");
       pp->reset();
       pp->bind(1, buildid);
@@ -2627,6 +3067,12 @@ handle_buildid (MHD_Connection* conn,
       string b_stype = string((const char*) sqlite3_column_text (*pp, 1) ?: ""); /* by DDL may not be NULL */
       string b_source0 = string((const char*) sqlite3_column_text (*pp, 2) ?: ""); /* may be NULL */
       string b_source1 = string((const char*) sqlite3_column_text (*pp, 3) ?: ""); /* may be NULL */
+      int64_t b_id0 = 0, b_id1 = 0;
+      if (atype_code == "D" || atype_code == "E")
+        {
+          b_id0 = sqlite3_column_int64 (*pp, 4);
+          b_id1 = sqlite3_column_int64 (*pp, 5);
+        }
 
       if (verbose > 1)
         obatched(clog) << "found mtime=" << b_mtime << " stype=" << b_stype
@@ -2636,7 +3082,7 @@ handle_buildid (MHD_Connection* conn,
       // XXX: in case of multiple matches, attempt them in parallel?
       auto r = handle_buildid_match (conn ? false : true,
                                      b_mtime, b_stype, b_source0, b_source1,
-				     section, result_fd);
+				     b_id0, b_id1, section, result_fd);
       if (r)
         return r;
 
-- 
2.45.2

