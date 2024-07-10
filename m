Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D061DF71
	for <linux-debuggers@vger.kernel.org>; Wed, 10 Jul 2024 20:47:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720644450; cv=none; b=cYJoj82xFR+C2j5BXRbb6UHblmp0uy5j7qo7NoyhZPcRC/YIPOKNHh7bnNJiXSfyF90U3XenpA+KcNoioVlqTVtcHLOWcmxfMOpe9CjsTtSUOLflHyFo8rn/99tJHntaTcLn1b2wBOv+2GTOeJnyvYnafLOuFgLGG6eqzuc7IE8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720644450; c=relaxed/simple;
	bh=21XyRQVjhttTDq5lm7yIAP6dmRC4F1BqgunJYPnoum8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AXSEcUh7gf6SBP8yn1VJs9iSXiDX5IwJ0YdV6SVn6AD9RhJVFlKxIPQP7N5djlnIeOyMD56P+6Ka1rPOlTp9lJe4NxUrnErKNp8BYjccUbPZez/cryK4+A0lS+iVF3ojhhzhk+wjBg1eRMmHjzy3bR7tkRLHruqa5Gex3r9j+HA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=SuTDqrba; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="SuTDqrba"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1f65a3abd01so1073685ad.3
        for <linux-debuggers@vger.kernel.org>; Wed, 10 Jul 2024 13:47:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1720644447; x=1721249247; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6EPkiReHLdg4rOLsZZtkJON5+jcpMUzk+vrv1pi/FoE=;
        b=SuTDqrbaLkA373fqROq4QcTgAqmxg8OwtotCrlV81g0dOZB4M4OpF4U2g5wyH9xJ9s
         sb8z0sPwOZXAU1v7NgWJthtgELw8nuhyNDQMMp5TcX4DSQ57cSIcg+O55BRJCwMzNFu8
         ey2ZXWLi1aCHH/YYVi9Q8YlEv7630xq0EKjQ8WK347p68YkgBb+mRjHjS0AjC7vr3kZW
         PGZtdhlSONYJWB4JarNYfHx8rt6vV/VQ59cxxKSybURW9BIYlNcadcKvTUTn6tGGXLta
         Srr2ZBLACOJaqcZk/mppbEcRcij53cLS1P1jwWwphYAvQLEJt7gnSXFRFpAYFL7w7Y0P
         oUuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720644447; x=1721249247;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6EPkiReHLdg4rOLsZZtkJON5+jcpMUzk+vrv1pi/FoE=;
        b=vniwLDFvHLirRB5Z2qBYIgP23jICRLOL+N/xYZjZU1eiU+p+iWGqhZoNvUpwah9h6D
         Mm1Zi0jdN+MEXzNpRwDylAOz4sVTxODIejovVX7GyWzvfHCs0sRSVomkKpn8sXAvFVgh
         ZS1HhO7t2p7K2NnA/Jz4jV2723rHNIIEEBU/I02cL6bl5OTbzo0/2iszZBU38JMzC4if
         /jMXLDRBBXy8ktVIVD43bcGTH32kF9eKoH5IEN6WtEdKlMzQImPct+9iBJBTRRhZ9tmp
         yPHa7vC8Hx+eWAXdMAL3KMA/i3gGr6fDlM79kTgfqnmYRBbtXr6MNRpe4uWxlYycP8z+
         o3pA==
X-Gm-Message-State: AOJu0Ywkb8DK/ynDTblP3oZQ8Klq3peVmMnP5AyIy3igv80zrzUhg4io
	HNLj49asUjvsrq6MUUcb2iZz0evFNKhx0Wg6kA96qf2EH59+5TeqKiS/X5ngA3c=
X-Google-Smtp-Source: AGHT+IFl8wK3v17MCajfleA7g8mqUhI38FmvrR90ZIFkf5nj1RfS+6tjZYYZISGX0puQDIVtpCP8sw==
X-Received: by 2002:a17:903:32d0:b0:1fb:7435:c2c7 with SMTP id d9443c01a7336-1fbb6ef842bmr53229255ad.57.1720644447187;
        Wed, 10 Jul 2024 13:47:27 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:134a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad5be3sm37698025ad.301.2024.07.10.13.47.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 13:47:26 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH 3/3] debuginfod: optimize extraction from seekable xz archives
Date: Wed, 10 Jul 2024 13:47:13 -0700
Message-ID: <54b1cd82e066537ce232940175e2e1b485b648dd.1720644134.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1720644134.git.osandov@fb.com>
References: <cover.1720644134.git.osandov@fb.com>
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

Since we now save the uncompressed offset and size of each archive file,
pass that information down so we can do the optimized extraction when
applicable.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx | 431 ++++++++++++++++++++++++++++++++++++--
 1 file changed, 417 insertions(+), 14 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index 95a7d941..c3822be3 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -1971,6 +1971,16 @@ handle_buildid_f_match (bool internal_req_t,
 
 
 #ifdef USE_LZMA
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
 // Neither RPM nor deb files support seeking to a specific file in the package.
 // Instead, to extract a specific file, we normally need to read the archive
 // sequentially until we find the file.  This is very slow for files at the end
@@ -2094,12 +2104,352 @@ is_seekable_archive (const string& rps, struct archive* a)
   // The file is only seekable if it has more than one Block.
   return num_records > 1;
 }
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
+  int src = open (srcpath.c_str(), O_RDONLY);
+  if (src < 0)
+    throw libc_exception (errno, string("open ") + srcpath);
+  defer_dtor<int,int> src_closer (src, close);
+
+  try
+    {
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
+      return dst;
+    }
+  catch (const reportable_exception &e)
+    {
+      if (verbose)
+        obatched(clog) << "failed to extract from seekable archive " << srcpath
+                       << ": " << e.message << endl;
+      return -1;
+    }
+}
 #else
 static bool
 is_seekable_archive (const string& rps, struct archive* a)
 {
   return false;
 }
+static int
+extract_from_seekable_archive (const string& srcpath,
+                               char* tmppath,
+                               uint64_t offset,
+                               uint64_t size)
+{
+  return -1;
+}
 #endif
 
 
@@ -2199,9 +2549,12 @@ create_buildid_r_response (int64_t b_mtime0,
 
 static struct MHD_Response*
 handle_buildid_r_match (bool internal_req_p,
-                        int64_t b_mtime,
+                        int64_t b_mtime0,
                         const string& b_source0,
                         const string& b_source1,
+                        int64_t b_size,
+                        int64_t b_mtime1,
+                        int64_t b_uncompressed_offset,
                         const string& section,
                         int *result_fd)
 {
@@ -2213,7 +2566,7 @@ handle_buildid_r_match (bool internal_req_p,
   if (rc != 0)
     throw libc_exception (errno, string("stat ") + b_source0);
 
-  if ((int64_t) fs.st_mtime != b_mtime)
+  if ((int64_t) fs.st_mtime != b_mtime0)
     {
       if (verbose)
         obatched(clog) << "mtime mismatch for " << b_source0 << endl;
@@ -2373,7 +2726,7 @@ handle_buildid_r_match (bool internal_req_p,
           break; // branch out of if "loop", to try new libarchive fetch attempt
         }
 
-      struct MHD_Response* r = create_buildid_r_response (b_mtime, b_source0,
+      struct MHD_Response* r = create_buildid_r_response (b_mtime0, b_source0,
                                                           b_source1, section,
                                                           ima_sig, NULL, fd,
                                                           fs.st_size,
@@ -2388,7 +2741,41 @@ handle_buildid_r_match (bool internal_req_p,
       // NB: see, we never go around the 'loop' more than once
     }
 
-  // no match ... grumble, must process the archive
+  // no match ... if the archive is seekable, try that first
+  if (b_uncompressed_offset > 0)
+    {
+      char* tmppath = NULL;
+      if (asprintf (&tmppath, "%s/debuginfod-fdcache.XXXXXX", tmpdir.c_str()) < 0)
+        throw libc_exception (ENOMEM, "cannot allocate tmppath");
+      defer_dtor<void*,void> tmmpath_freer (tmppath, free);
+
+      fd = extract_from_seekable_archive (b_source0, tmppath,
+                                          b_uncompressed_offset, b_size);
+      if (fd >= 0)
+        {
+          // Set the mtime so the fdcache file mtimes propagate to future webapi
+          // clients.
+          struct timespec tvs[2];
+          tvs[0].tv_sec = 0;
+          tvs[0].tv_nsec = UTIME_OMIT;
+          tvs[1].tv_sec = b_mtime1;
+          tvs[1].tv_nsec = 0;
+          (void) futimens (fd, tvs);  /* best effort */
+          struct MHD_Response* r = create_buildid_r_response (b_mtime0,
+                                                              b_source0,
+                                                              b_source1,
+                                                              section, ima_sig,
+                                                              tmppath, fd,
+                                                              b_size, b_mtime1,
+                                                              "seekable archive",
+                                                              extract_begin);
+          if (r != 0 && result_fd)
+            *result_fd = fd;
+          return r;
+        }
+    }
+
+  // still nothing ...  process the archive
   string archive_decoder = "/dev/null";
   string archive_extension = "";
   for (auto&& arch : scan_archives)
@@ -2512,7 +2899,7 @@ handle_buildid_r_match (bool internal_req_p,
           continue;
         }
 
-      r = create_buildid_r_response (b_mtime, b_source0, b_source1, section,
+      r = create_buildid_r_response (b_mtime0, b_source0, b_source1, section,
                                      ima_sig, tmppath, fd,
                                      archive_entry_size(e),
                                      archive_entry_mtime(e),
@@ -2583,21 +2970,26 @@ and will not query the upstream servers");
 
 static struct MHD_Response*
 handle_buildid_match (bool internal_req_p,
-                      int64_t b_mtime,
+                      int64_t b_mtime0,
                       const string& b_stype,
                       const string& b_source0,
                       const string& b_source1,
+                      int64_t b_size,
+                      int64_t b_mtime1,
+                      int64_t b_uncompressed_offset,
                       const string& section,
                       int *result_fd)
 {
   try
     {
       if (b_stype == "F")
-        return handle_buildid_f_match(internal_req_p, b_mtime, b_source0,
+        return handle_buildid_f_match(internal_req_p, b_mtime0, b_source0,
 				      section, result_fd);
       else if (b_stype == "R")
-        return handle_buildid_r_match(internal_req_p, b_mtime, b_source0,
-				      b_source1, section, result_fd);
+        return handle_buildid_r_match(internal_req_p, b_mtime0, b_source0,
+                                      b_source1, b_size, b_mtime1,
+                                      b_uncompressed_offset, section,
+                                      result_fd);
     }
   catch (const reportable_exception &e)
     {
@@ -2713,7 +3105,7 @@ handle_buildid (MHD_Connection* conn,
   if (atype_code == "D")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-d",
-                          "select mtime0, sourcetype, source0, source1 from " BUILDIDS "_query_d where buildid = ? "
+                          "select mtime0, sourcetype, source0, source1, size, mtime1, uncompressed_offset from " BUILDIDS "_query_d where buildid = ? "
                           "order by mtime0 desc");
       pp->reset();
       pp->bind(1, buildid);
@@ -2721,7 +3113,7 @@ handle_buildid (MHD_Connection* conn,
   else if (atype_code == "E")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-e",
-                          "select mtime0, sourcetype, source0, source1 from " BUILDIDS "_query_e where buildid = ? "
+                          "select mtime0, sourcetype, source0, source1, size, mtime1, uncompressed_offset from " BUILDIDS "_query_e where buildid = ? "
                           "order by mtime0 desc");
       pp->reset();
       pp->bind(1, buildid);
@@ -2765,19 +3157,30 @@ handle_buildid (MHD_Connection* conn,
       if (rc != SQLITE_ROW)
         throw sqlite_exception(rc, "step");
 
-      int64_t b_mtime = sqlite3_column_int64 (*pp, 0);
+      int64_t b_mtime0 = sqlite3_column_int64 (*pp, 0);
       string b_stype = string((const char*) sqlite3_column_text (*pp, 1) ?: ""); /* by DDL may not be NULL */
       string b_source0 = string((const char*) sqlite3_column_text (*pp, 2) ?: ""); /* may be NULL */
       string b_source1 = string((const char*) sqlite3_column_text (*pp, 3) ?: ""); /* may be NULL */
+      int64_t b_size = 0;
+      int64_t b_mtime1 = 0;
+      int64_t b_uncompressed_offset = 0;
+      if (atype_code == "D" || atype_code == "E")
+        {
+          b_mtime1 = sqlite3_column_int64 (*pp, 5);
+          // These may be NULL, in which case sqlite3_column_int64() returns 0.
+          b_size = sqlite3_column_int64 (*pp, 4);
+          b_uncompressed_offset = sqlite3_column_int64 (*pp, 6);
+        }
 
       if (verbose > 1)
-        obatched(clog) << "found mtime=" << b_mtime << " stype=" << b_stype
+        obatched(clog) << "found mtime=" << b_mtime0 << " stype=" << b_stype
              << " source0=" << b_source0 << " source1=" << b_source1 << endl;
 
       // Try accessing the located match.
       // XXX: in case of multiple matches, attempt them in parallel?
       auto r = handle_buildid_match (conn ? false : true,
-                                     b_mtime, b_stype, b_source0, b_source1,
+                                     b_mtime0, b_stype, b_source0, b_source1,
+                                     b_size, b_mtime1, b_uncompressed_offset,
 				     section, result_fd);
       if (r)
         return r;
-- 
2.45.2

