Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B0D6723BF
	for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 10:04:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721037899; cv=none; b=mjeGM7gF+j5VbUSc439iH7Nzic53mfTRp5X48ImbA45UypA6htNQvDP8okArK3Pj9mQKCb6cZLDZcndKdgvA2gxIYPKbUXtUBi/UF7w1nEKbh8I7hoZFfYS93zXO4YMW7Zm2N9eqnXc+TlAHorK8KG+vKCRqQ3p5XhqC62Ifdj0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721037899; c=relaxed/simple;
	bh=Ep3TqcWuou0COzEWY/D+sBXbcRb7HgshtyY0EBg3Sp4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=XpOwFYW/XSobHSlfErptt+xgSPDrM+l+Q6K1kwVynqXKrC7gNPnFj8xUjbdLcml+isCCuPTx++a9udFbu9FrdSHpG2hJhJ016ITQs8wrwek7QZrZ9lzqTugXVSV3tNmzDeyfapJ5dvqq4kZyqweH/sc8NR4rouWoUWzk8OHeYis=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=VtzYluUe; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="VtzYluUe"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7039e4a4a03so2631851a34.3
        for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 03:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721037897; x=1721642697; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5ZMScVr8GbbrjEGRclMr/cjkkrXoVI1dtlYXFNeFlhk=;
        b=VtzYluUecJlmcilt/pRys6gQEBpk/9sr05eLxb3nmva1CBufy9aHs+do3n7pP+X1rf
         lnbuvi+b+I7yAU0emCeSZyvGquohd7ptVYpZ6a8sELMF7v8Cvq2LzzbDQyNUZ7Fdxbd+
         dIHm5/9g+eJiN4qMpu9rN6nmeEVvPjEooiY5Asj3THjOZC/cvYNozp75wD6XXhI4dGOY
         NJexpgRz4PL/YSXX1U+EGmGa7O5lbc/giPZLHMW+bxO3CaICFTH88OoWYw+zsOd6Y82+
         iLlbHDe5OCMFRdySTgDOH9cWI45dIbdArtC4SXoTVzM9pII+Wg/uKcBrMrSXT8HJBAs+
         ajlw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721037897; x=1721642697;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=5ZMScVr8GbbrjEGRclMr/cjkkrXoVI1dtlYXFNeFlhk=;
        b=rcMCan4bjqeNnyb4eSYYde+/2YJlDbfaIXrPaByrEQmQOoeaT71J/w46K4ohQPrrlJ
         JahBvxPlKfrkAyuv44RtFNOiUmuECMc6VRUV4F2Vj+loe7CAc4Ivn9FZk0nVC/9U8o6R
         FpsDoyldIZFheBKFtopYkVRVdbxFMheLxvKRmUhfL7yfV7BHJnVZWLcFSpJSsJr4MwT/
         CFhtG4ua7FeGIne5NaIXKb04WLXp4MVOr8/IBIdBYSdakJ0GFE/Eo6B7Eof8BtKkjbJ7
         eDCXduS7vbQxD6OGh+oqCXIz16lZRSTdSb4Uwpd6NloW+cJ4HcpSpgMXinotvkxIDnJ1
         s0VQ==
X-Gm-Message-State: AOJu0YwU0WtuGAcFg9M/Yiie5r1w+kmJNGBwvguDT6JNTGF5alHS1Y7Q
	vM3g/kwTNUmoIuSKhwWw33JotPaXwrrIzzHz4b2a78PZRQCLkJHE7rLFxH/wMXXFM7c+Ue7jOIK
	v
X-Google-Smtp-Source: AGHT+IHdVlzBmALVkOCxHPNYSKhnw3FhpEN3K4052Gd7u8+kHFb4JX4oahytCQcyp+LTLT7WTvj6mQ==
X-Received: by 2002:a05:6870:d8ca:b0:254:b5b9:3552 with SMTP id 586e51a60fabf-25eae88a6f4mr14671847fac.33.1721037894850;
        Mon, 15 Jul 2024 03:04:54 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2c4d3sm3049100a12.48.2024.07.15.03.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:04:54 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH v2 4/5] debuginfod: populate _r_seekable on scan
Date: Mon, 15 Jul 2024 03:04:35 -0700
Message-ID: <d034189a604ff4b349d82c41dba9c174e446b1fd.1721037200.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721037200.git.osandov@fb.com>
References: <cover.1721037200.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

Whenever a new archive is scanned, check if it is seekable with a little
liblzma magic, and populate _r_seekable if so.  With this, newly scanned
seekable archives will used the optimized extraction path added in the
previous commit.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx | 150 +++++++++++++++++++++++++++++++++++++-
 1 file changed, 147 insertions(+), 3 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index a9cbd7cc..f120dc90 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -1998,6 +1998,109 @@ struct lzma_exception: public reportable_exception
 //
 // 1: https://xz.tukaani.org/format/xz-file-format.txt
 
+// Return whether an archive supports seeking.
+static bool
+is_seekable_archive (const string& rps, struct archive* a)
+{
+  // Only xz supports seeking.
+  if (archive_filter_code (a, 0) != ARCHIVE_FILTER_XZ)
+    return false;
+
+  int fd = open (rps.c_str(), O_RDONLY);
+  if (fd < 0)
+    return false;
+  defer_dtor<int,int> fd_closer (fd, close);
+
+  // Seek to the xz Stream Footer.  We assume that it's the last thing in the
+  // file, which is true for RPM and deb files.
+  off_t footer_pos = -LZMA_STREAM_HEADER_SIZE;
+  if (lseek (fd, footer_pos, SEEK_END) == -1)
+    return false;
+
+  // Decode the Stream Footer.
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
+          return false;
+        }
+      if (bytes_read == 0)
+        return false;
+      footer_read += bytes_read;
+    }
+
+  lzma_stream_flags stream_flags;
+  lzma_ret ret = lzma_stream_footer_decode (&stream_flags, footer);
+  if (ret != LZMA_OK)
+    return false;
+
+  // Seek to the xz Index.
+  if (lseek (fd, footer_pos - stream_flags.backward_size, SEEK_END) == -1)
+    return false;
+
+  // Decode the Number of Records in the Index.  liblzma doesn't have an API for
+  // this if you don't want to decode the whole Index, so we have to do it
+  // ourselves.
+  //
+  // We need 1 byte for the Index Indicator plus 1-9 bytes for the
+  // variable-length integer Number of Records.
+  uint8_t index[10];
+  size_t index_read = 0;
+  while (index_read == 0) {
+      ssize_t bytes_read = read (fd, index, sizeof (index));
+      if (bytes_read < 0)
+        {
+          if (errno == EINTR)
+            continue;
+          return false;
+        }
+      if (bytes_read == 0)
+        return false;
+      index_read += bytes_read;
+  }
+  // The Index Indicator must be 0.
+  if (index[0] != 0)
+    return false;
+
+  lzma_vli num_records;
+  size_t pos = 0;
+  size_t in_pos = 1;
+  while (true)
+    {
+      if (in_pos >= index_read)
+        {
+          ssize_t bytes_read = read (fd, index, sizeof (index));
+          if (bytes_read < 0)
+          {
+            if (errno == EINTR)
+              continue;
+            return false;
+          }
+          if (bytes_read == 0)
+            return false;
+          index_read = bytes_read;
+          in_pos = 0;
+        }
+      ret = lzma_vli_decode (&num_records, &pos, index, &in_pos, index_read);
+      if (ret == LZMA_STREAM_END)
+        break;
+      else if (ret != LZMA_OK)
+        return false;
+    }
+
+  if (verbose > 3)
+    obatched(clog) << rps << " has " << num_records << " xz Blocks" << endl;
+
+  // The file is only seekable if it has more than one Block.
+  return num_records > 1;
+}
+
 // Read the Index at the end of an xz file.
 static lzma_index*
 read_xz_index (int fd)
@@ -2330,6 +2433,11 @@ extract_from_seekable_archive (const string& srcpath,
     }
 }
 #else
+static bool
+is_seekable_archive (const string& rps, struct archive* a)
+{
+  return false;
+}
 static int
 extract_from_seekable_archive (const string& srcpath,
                                char* tmppath,
@@ -4277,6 +4385,7 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
                   sqlite_ps& ps_upsert_buildids, sqlite_ps& ps_upsert_fileparts, sqlite_ps& ps_upsert_file,
                   sqlite_ps& ps_lookup_file,
                   sqlite_ps& ps_upsert_de, sqlite_ps& ps_upsert_sref, sqlite_ps& ps_upsert_sdef,
+                  sqlite_ps& ps_upsert_seekable,
                   time_t mtime,
                   unsigned& fts_executable, unsigned& fts_debuginfo, unsigned& fts_sref, unsigned& fts_sdef,
                   bool& fts_sref_complete_p)
@@ -4331,6 +4440,10 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
   if (verbose > 3)
     obatched(clog) << "libarchive scanning " << rps << " id " << archiveid << endl;
 
+  bool seekable = is_seekable_archive (rps, a);
+  if (verbose> 2 && seekable)
+    obatched(clog) << rps << " is seekable" << endl;
+
   bool any_exceptions = false;
   while(1) // parse archive entries
     {
@@ -4352,6 +4465,15 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
           if (verbose > 3)
             obatched(clog) << "libarchive checking " << fn << endl;
 
+          int64_t seekable_size, seekable_offset;
+          time_t seekable_mtime;
+          if (seekable)
+            {
+              seekable_size = archive_entry_size (e);
+              seekable_offset = archive_filter_bytes (a, 0);
+              seekable_mtime = archive_entry_mtime (e);
+            }
+
           // extract this file to a temporary file
           char* tmppath = NULL;
           rc = asprintf (&tmppath, "%s/debuginfod-classify.XXXXXX", tmpdir.c_str());
@@ -4443,6 +4565,15 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
                 .bind(5, mtime)
                 .bind(6, fileid)
                 .step_ok_done();
+              if (seekable)
+                ps_upsert_seekable
+                  .reset()
+                  .bind(1, archiveid)
+                  .bind(2, fileid)
+                  .bind(3, seekable_size)
+                  .bind(4, seekable_offset)
+                  .bind(5, seekable_mtime)
+                  .step_ok_done();
             }
           else // potential source - sdef record
             {
@@ -4456,11 +4587,19 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
             }
 
           if ((verbose > 2) && (executable_p || debuginfo_p))
-            obatched(clog) << "recorded buildid=" << buildid << " rpm=" << rps << " file=" << fn
+            {
+              obatched ob(clog);
+              auto& o = ob << "recorded buildid=" << buildid << " rpm=" << rps << " file=" << fn
                            << " mtime=" << mtime << " atype="
                            << (executable_p ? "E" : "")
                            << (debuginfo_p ? "D" : "")
-                           << " sourcefiles=" << sourcefiles.size() << endl;
+                           << " sourcefiles=" << sourcefiles.size();
+              if (seekable)
+                o << " seekable size=" << seekable_size
+                  << " offset=" << seekable_offset
+                  << " mtime=" << seekable_mtime;
+              o << endl;
+            }
 
         }
       catch (const reportable_exception& e)
@@ -4491,6 +4630,7 @@ scan_archive_file (const string& rps, const stat_t& st,
                    sqlite_ps& ps_upsert_de,
                    sqlite_ps& ps_upsert_sref,
                    sqlite_ps& ps_upsert_sdef,
+                   sqlite_ps& ps_upsert_seekable,
                    sqlite_ps& ps_query,
                    sqlite_ps& ps_scan_done,
                    unsigned& fts_cached,
@@ -4528,7 +4668,7 @@ scan_archive_file (const string& rps, const stat_t& st,
       string archive_extension;
       archive_classify (rps, archive_extension, archiveid,
                         ps_upsert_buildids, ps_upsert_fileparts, ps_upsert_file, ps_lookup_file,
-                        ps_upsert_de, ps_upsert_sref, ps_upsert_sdef, // dalt
+                        ps_upsert_de, ps_upsert_sref, ps_upsert_sdef, ps_upsert_seekable, // dalt
                         st.st_mtime,
                         my_fts_executable, my_fts_debuginfo, my_fts_sref, my_fts_sdef,
                         my_fts_sref_complete_p);
@@ -4634,6 +4774,9 @@ scan ()
   sqlite_ps ps_r_upsert_sdef (db, "rpm-sdef-insert",
                             "insert or ignore into " BUILDIDS "_r_sdef (file, mtime, content) values ("
                             "?, ?, ?);");
+  sqlite_ps ps_r_upsert_seekable (db, "rpm-seekable-insert",
+                                  "insert or ignore into " BUILDIDS "_r_seekable (file, content, type, size, offset, mtime) "
+                                  "values (?, ?, 'xz', ?, ?, ?);");
   sqlite_ps ps_r_query (db, "rpm-negativehit-query",
                       "select 1 from " BUILDIDS "_file_mtime_scanned where "
                       "sourcetype = 'R' and file = ? and mtime = ?;");
@@ -4676,6 +4819,7 @@ scan ()
                                ps_r_upsert_de,
                                ps_r_upsert_sref,
                                ps_r_upsert_sdef,
+                               ps_r_upsert_seekable,
                                ps_r_query,
                                ps_r_scan_done,
                                fts_cached,
-- 
2.45.2

