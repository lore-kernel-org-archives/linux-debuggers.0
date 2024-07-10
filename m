Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A743F18C161
	for <linux-debuggers@vger.kernel.org>; Wed, 10 Jul 2024 20:47:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720644448; cv=none; b=pe1NS3kZkKKTcyJ3BmuJryAYi/eloJ/CAXBnz/lpPAzRqHmrUdMawps/Sh2ogNWUY6YtFANZN0vTN6jj2VTJT+JFqqhtX05B4XpQFri3qLOI0k3Frkx09rGY0xvNrSdeYDquCArqXPR5krAZjZWSifJy+marTlKXpWmLPrD1+oI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720644448; c=relaxed/simple;
	bh=dJY8CNP8GKLS6r3+BLfvPT4P3nVXMzQEltYOG1OuEXI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BbLB9DujYiKy2OJ6C8QRwUAS3hvn+/IcKVRlXRgO7WTICLsCbYIQrhcwvspru4ghnJfW1KE1zj0X7p5jwxrrZ0j5lGrPgB40tePZcvPM95+IDgSiWh4j8vEKIhry4BromTyahXfxxBcZvvp67Bzjk8p8EREYemr7AJn6DyPKPQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=hpxNTpz/; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="hpxNTpz/"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fb222a8eaeso989405ad.3
        for <linux-debuggers@vger.kernel.org>; Wed, 10 Jul 2024 13:47:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1720644446; x=1721249246; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WqGEo7EQR7CBkBq/zBsKd7MHoi8uizQ+EwHstDMkJZg=;
        b=hpxNTpz/Qet+2OD2rtWsNb41n8w21tEjLM5Kmg7AT1tSoXRlTqmoGv7TZlD8Sn/edP
         Sg7D3PL5m22158GOz9nnKvHsicTvR4nkDMoUMn4bjFiGJTys29Rx0zPG4FhisPedD4/m
         JMjoPv+W3k7X3irgZTIxTZ7ThZzsjvnHo3S0n48Yp5VzhWCeILrXyG1Js/ycse+0Uk3G
         H51vuoKVRID2vbOkIBg2JqmS5oNpTxtqcKluiXDStd5L9K941z8mvlE5u1FEte8ZW/FT
         yDPlhVAS3445NqUrT3WeFX8PIhGNSE9P1Hd16L5zYZM51vZQB+S9mgGYqQKw6Izd6cGG
         +xQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720644446; x=1721249246;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WqGEo7EQR7CBkBq/zBsKd7MHoi8uizQ+EwHstDMkJZg=;
        b=AQP4HKPAguHi8BhRl7FM8thPWJDwC1TSRlciZrg6w+lb6KRY7i1assazXUF+O4Y7GG
         XA8L4kUVm+O56iz9bLTCP8CzDjmXpAF9SiUwZpDqUwkj37OMZ0YUyZdeidCoVtaHwYf9
         gp9DA331aBuKV7e59yJqjP36M/kKcTA2MD8/jZcPJGRY5EbvGiDmK4XJpUxs19Cz1HpA
         CschFea8rJThu8TPRrjmpSfYaSyt4eIrr3P4LjFX9Bu6oGdLSxExMBPLfSsxcpFuDqXk
         F3HF8hU18BHg833NdJy9bUnHKg6Bq1srXk0LTY/RjsXYateH2iXaJnWJCzPuvy00QqAO
         oEEQ==
X-Gm-Message-State: AOJu0YzRoZ97SZURtVjPwDN3cEsYYMQTPtxEImdQ/neubwykRlWZ4ezk
	0g1ELUuKUUHd6gFK6Fn99OIk8gbtMMGVO56uSx4VPyvcAdTruYA2T2lKx/nXpQzNPKFClGUJnnz
	a
X-Google-Smtp-Source: AGHT+IHHClIvksZSOcHk2YaLP2hTeYKbWFTwgNKaG7Eg11A3x/aXAmjmAhPGqgX6pGn9vgf1QuZUwA==
X-Received: by 2002:a17:902:f68e:b0:1fb:396c:7532 with SMTP id d9443c01a7336-1fbb6d90e10mr54938475ad.56.1720644445730;
        Wed, 10 Jul 2024 13:47:25 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:134a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad5be3sm37698025ad.301.2024.07.10.13.47.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 13:47:25 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH 2/3] debuginfod: add archive entry size, mtime, and uncompressed offset to database
Date: Wed, 10 Jul 2024 13:47:12 -0700
Message-ID: <5e992fd7344f67918e72c2bd3019af18591e40ae.1720644134.git.osandov@fb.com>
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

In order to extract a file from a seekable archive, we need to know
where in the uncompressed archive the file data starts and its size.
Additionally, in order to populate the response headers, we need the
file modification time (since we won't be able to get it from the
archive metadata).  Add the size, modification time, and uncompressed
offset to the _r_de table and _query_d and _query_e views.  Note that
_r_de already has a column for the mtime of the archive itself, so that
one is renamed to mtime0 and the one for the entry is mtime1.

We need a little bit of liblzma magic to detect whether a file is
seekable.  If so, we populate the uncompressed_offset column, and
otherwise we set it to null.  size and mtime1 are populated
unconditionally for simplicity.

Before this change, the database for a single kernel debuginfo RPM
(kernel-debuginfo-6.9.6-200.fc40.x86_64.rpm) was about 15MB.  This
change increases that by about 70kB, only a 0.5% increase.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 configure.ac              |   5 +
 debuginfod/Makefile.am    |   2 +-
 debuginfod/debuginfod.cxx | 234 +++++++++++++++++++++++++++++++++-----
 3 files changed, 213 insertions(+), 28 deletions(-)

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
index 2d709026..95a7d941 100644
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
@@ -162,7 +166,7 @@ string_endswith(const string& haystack, const string& needle)
 
 
 // Roll this identifier for every sqlite schema incompatibility.
-#define BUILDIDS "buildids10"
+#define BUILDIDS "buildids11"
 
 #if SQLITE_VERSION_NUMBER >= 3008000
 #define WITHOUT_ROWID "without rowid"
@@ -239,15 +243,18 @@ static const char DEBUGINFOD_SQLITE_DDL[] =
   "        debuginfo_p integer not null,\n"
   "        executable_p integer not null,\n"
   "        file integer not null,\n"
-  "        mtime integer not null,\n"
+  "        mtime0 integer not null,\n"
   "        content integer not null,\n"
+  "        size integer not null,\n"
+  "        mtime1 integer not null,\n"
+  "        uncompressed_offset integer,\n"
   "        foreign key (file) references " BUILDIDS "_files(id) on update cascade on delete cascade,\n"
   "        foreign key (content) references " BUILDIDS "_files(id) on update cascade on delete cascade,\n"
   "        foreign key (buildid) references " BUILDIDS "_buildids(id) on update cascade on delete cascade,\n"
-  "        primary key (buildid, debuginfo_p, executable_p, file, content, mtime)\n"
+  "        primary key (buildid, debuginfo_p, executable_p, file, content, mtime0)\n"
   "        ) " WITHOUT_ROWID ";\n"
   // Index for faster delete by archive file identifier
-  "create index if not exists " BUILDIDS "_r_de_idx on " BUILDIDS "_r_de (file, mtime);\n"
+  "create index if not exists " BUILDIDS "_r_de_idx on " BUILDIDS "_r_de (file, mtime0);\n"
   // Index for metadata searches
   "create index if not exists " BUILDIDS "_r_de_idx2 on " BUILDIDS "_r_de (content);\n"  
   "create table if not exists " BUILDIDS "_r_sref (\n" // outgoing dwarf sourcefile references from rpm
@@ -268,22 +275,22 @@ static const char DEBUGINFOD_SQLITE_DDL[] =
   // create views to glue together some of the above tables, for webapi D queries
   "create view if not exists " BUILDIDS "_query_d as \n"
   "select\n"
-  "        b.hex as buildid, n.mtime, 'F' as sourcetype, f0.name as source0, n.mtime as mtime, null as source1\n"
+  "        b.hex as buildid, 'F' as sourcetype, f0.name as source0, n.mtime as mtime0, null as source1, null as size, null as mtime1, null as uncompressed_offset\n"
   "        from " BUILDIDS "_buildids b, " BUILDIDS "_files_v f0, " BUILDIDS "_f_de n\n"
   "        where b.id = n.buildid and f0.id = n.file and n.debuginfo_p = 1\n"
   "union all select\n"
-  "        b.hex as buildid, n.mtime, 'R' as sourcetype, f0.name as source0, n.mtime as mtime, f1.name as source1\n"
+  "        b.hex as buildid, 'R' as sourcetype, f0.name as source0, n.mtime0 as mtime0, f1.name as source1, n.size as size, n.mtime1 as mtime1, n.uncompressed_offset as uncompressed_offset\n"
   "        from " BUILDIDS "_buildids b, " BUILDIDS "_files_v f0, " BUILDIDS "_files_v f1, " BUILDIDS "_r_de n\n"
   "        where b.id = n.buildid and f0.id = n.file and f1.id = n.content and n.debuginfo_p = 1\n"
   ";"
   // ... and for E queries
   "create view if not exists " BUILDIDS "_query_e as \n"
   "select\n"
-  "        b.hex as buildid, n.mtime, 'F' as sourcetype, f0.name as source0, n.mtime as mtime, null as source1\n"
+  "        b.hex as buildid, 'F' as sourcetype, f0.name as source0, n.mtime as mtime0, null as source1, null as size, null as mtime1, null as uncompressed_offset\n"
   "        from " BUILDIDS "_buildids b, " BUILDIDS "_files_v f0, " BUILDIDS "_f_de n\n"
   "        where b.id = n.buildid and f0.id = n.file and n.executable_p = 1\n"
   "union all select\n"
-  "        b.hex as buildid, n.mtime, 'R' as sourcetype, f0.name as source0, n.mtime as mtime, f1.name as source1\n"
+  "        b.hex as buildid, 'R' as sourcetype, f0.name as source0, n.mtime0 as mtime0, f1.name as source1, n.size as size, n.mtime1 as mtime1, n.uncompressed_offset as uncompressed_offset\n"
   "        from " BUILDIDS "_buildids b, " BUILDIDS "_files_v f0, " BUILDIDS "_files_v f1, " BUILDIDS "_r_de n\n"
   "        where b.id = n.buildid and f0.id = n.file and f1.id = n.content and n.executable_p = 1\n"
   ";"
@@ -324,8 +331,23 @@ static const char DEBUGINFOD_SQLITE_DDL[] =
 // data over instead of just dropping it.  But that could incur
 // doubled storage costs.
 //
-// buildids10: split the _files table into _parts
+// buildids11: add size, mtime1, and uncompressed_offset to _r_de, _query_d, and _query_e
   "" // <<< we are here
+// buildids10: split the _files table into _parts
+  "DROP VIEW IF EXISTS buildids10_stats;\n"
+  "DROP VIEW IF EXISTS buildids10_query_s;\n"
+  "DROP VIEW IF EXISTS buildids10_query_e;\n"
+  "DROP VIEW IF EXISTS buildids10_query_d;\n"
+  "DROP TABLE IF EXISTS buildids10_r_sdef;\n"
+  "DROP TABLE IF EXISTS buildids10_r_sref;\n"
+  "DROP TABLE IF EXISTS buildids10_r_de;\n"
+  "DROP TABLE IF EXISTS buildids10_f_s;\n"
+  "DROP TABLE IF EXISTS buildids10_f_de;\n"
+  "DROP TABLE IF EXISTS buildids10_file_mtime_scanned;\n"
+  "DROP TABLE IF EXISTS buildids10_buildids;\n"
+  "DROP VIEW IF EXISTS buildids10_files_v;\n"
+  "DROP TABLE IF EXISTS buildids10_files;\n"
+  "DROP TABLE IF EXISTS buildids10_fileparts;\n"
 // buildids9: widen the mtime_scanned table
   "DROP VIEW IF EXISTS buildids9_stats;\n"
   "DROP INDEX IF EXISTS buildids9_r_de_idx;\n"
@@ -1947,6 +1969,140 @@ handle_buildid_f_match (bool internal_req_t,
   return r;
 }
 
+
+#ifdef USE_LZMA
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
+#else
+static bool
+is_seekable_archive (const string& rps, struct archive* a)
+{
+  return false;
+}
+#endif
+
+
 // For security/portability reasons, many distro-package archives have
 // a "./" in front of path names; others have nothing, others have
 // "/".  Canonicalize them all to a single leading "/", with the
@@ -2557,16 +2713,16 @@ handle_buildid (MHD_Connection* conn,
   if (atype_code == "D")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-d",
-                          "select mtime, sourcetype, source0, source1 from " BUILDIDS "_query_d where buildid = ? "
-                          "order by mtime desc");
+                          "select mtime0, sourcetype, source0, source1 from " BUILDIDS "_query_d where buildid = ? "
+                          "order by mtime0 desc");
       pp->reset();
       pp->bind(1, buildid);
     }
   else if (atype_code == "E")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-e",
-                          "select mtime, sourcetype, source0, source1 from " BUILDIDS "_query_e where buildid = ? "
-                          "order by mtime desc");
+                          "select mtime0, sourcetype, source0, source1 from " BUILDIDS "_query_e where buildid = ? "
+                          "order by mtime0 desc");
       pp->reset();
       pp->bind(1, buildid);
     }
@@ -2589,9 +2745,9 @@ handle_buildid (MHD_Connection* conn,
   else if (atype_code == "I")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-i",
-	"select mtime, sourcetype, source0, source1, 1 as debug_p from " BUILDIDS "_query_d where buildid = ? "
+	"select mtime0, sourcetype, source0, source1, 1 as debug_p from " BUILDIDS "_query_d where buildid = ? "
 	"union all "
-	"select mtime, sourcetype, source0, source1, 0 as debug_p from " BUILDIDS "_query_e where buildid = ? "
+	"select mtime0, sourcetype, source0, source1, 0 as debug_p from " BUILDIDS "_query_e where buildid = ? "
 	"order by debug_p desc, mtime desc");
       pp->reset();
       pp->bind(1, buildid);
@@ -3821,7 +3977,7 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
                   sqlite_ps& ps_upsert_buildids, sqlite_ps& ps_upsert_fileparts, sqlite_ps& ps_upsert_file,
                   sqlite_ps& ps_lookup_file,
                   sqlite_ps& ps_upsert_de, sqlite_ps& ps_upsert_sref, sqlite_ps& ps_upsert_sdef,
-                  time_t mtime,
+                  time_t mtime0,
                   unsigned& fts_executable, unsigned& fts_debuginfo, unsigned& fts_sref, unsigned& fts_sdef,
                   bool& fts_sref_complete_p)
 {
@@ -3875,6 +4031,10 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
   if (verbose > 3)
     obatched(clog) << "libarchive scanning " << rps << " id " << archiveid << endl;
 
+  bool seekable = is_seekable_archive (rps, a);
+  if (verbose > 2 && seekable)
+    obatched(clog) << rps << " is seekable" << endl;
+
   bool any_exceptions = false;
   while(1) // parse archive entries
     {
@@ -3896,6 +4056,12 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
           if (verbose > 3)
             obatched(clog) << "libarchive checking " << fn << endl;
 
+          int64_t size = archive_entry_size (e);
+          time_t mtime1 = archive_entry_mtime (e);
+          int64_t uncompressed_offset;
+          if (seekable)
+            uncompressed_offset = archive_filter_bytes (a, 0);
+
           // extract this file to a temporary file
           char* tmppath = NULL;
           rc = asprintf (&tmppath, "%s/debuginfod-classify.XXXXXX", tmpdir.c_str());
@@ -3978,15 +4144,22 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
 
           if (executable_p || debuginfo_p)
             {
-              ps_upsert_de
+              auto& ps =
+                ps_upsert_de
                 .reset()
                 .bind(1, buildid)
                 .bind(2, debuginfo_p ? 1 : 0)
                 .bind(3, executable_p ? 1 : 0)
                 .bind(4, archiveid)
-                .bind(5, mtime)
+                .bind(5, mtime0)
                 .bind(6, fileid)
-                .step_ok_done();
+                .bind(7, size)
+                .bind(8, mtime1);
+              if (seekable)
+                ps.bind(9, uncompressed_offset);
+              else
+                ps.bind(9);
+              ps.step_ok_done();
             }
           else // potential source - sdef record
             {
@@ -3994,18 +4167,25 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
               ps_upsert_sdef
                 .reset()
                 .bind(1, archiveid)
-                .bind(2, mtime)
+                .bind(2, mtime0)
                 .bind(3, fileid)
                 .step_ok_done();
             }
 
           if ((verbose > 2) && (executable_p || debuginfo_p))
-            obatched(clog) << "recorded buildid=" << buildid << " rpm=" << rps << " file=" << fn
-                           << " mtime=" << mtime << " atype="
+            {
+              obatched ob(clog);
+              auto& o = ob << "recorded buildid=" << buildid << " rpm=" << rps << " file=" << fn
+                           << " mtime0=" << mtime0 << " size=" << size
+                           << " mtime1=" << mtime1
+                           << " atype="
                            << (executable_p ? "E" : "")
                            << (debuginfo_p ? "D" : "")
-                           << " sourcefiles=" << sourcefiles.size() << endl;
-
+                           << " sourcefiles=" << sourcefiles.size();
+              if (seekable)
+                o << " uncompressed_offset=" << uncompressed_offset;
+              o << endl;
+            }
         }
       catch (const reportable_exception& e)
         {
@@ -4169,8 +4349,8 @@ scan ()
                               " from " BUILDIDS "_files f, " BUILDIDS "_fileparts p1, " BUILDIDS "_fileparts p2 \n"
                               " where f.dirname = p1.id and f.basename = p2.id and p1.name = ? and p2.name = ?;\n");
   sqlite_ps ps_r_upsert_de (db, "rpm-de-insert",
-                          "insert or ignore into " BUILDIDS "_r_de (buildid, debuginfo_p, executable_p, file, mtime, content) values ("
-                          "(select id from " BUILDIDS "_buildids where hex = ?), ?, ?, ?, ?, ?);");
+                          "insert or ignore into " BUILDIDS "_r_de (buildid, debuginfo_p, executable_p, file, mtime0, content, size, mtime1, uncompressed_offset) values ("
+                          "(select id from " BUILDIDS "_buildids where hex = ?), ?, ?, ?, ?, ?, ?, ?, ?);");
   sqlite_ps ps_r_upsert_sref (db, "rpm-sref-insert",
                             "insert or ignore into " BUILDIDS "_r_sref (buildid, artifactsrc) values ("
                             "(select id from " BUILDIDS "_buildids where hex = ?), "
@@ -4559,7 +4739,7 @@ void groom()
   // as long as we make progress.
 
   sqlite_ps files_del_f_de (db, "nuke f_de", "delete from " BUILDIDS "_f_de where file = ? and mtime = ?");
-  sqlite_ps files_del_r_de (db, "nuke r_de", "delete from " BUILDIDS "_r_de where file = ? and mtime = ?");
+  sqlite_ps files_del_r_de (db, "nuke r_de", "delete from " BUILDIDS "_r_de where file = ? and mtime0 = ?");
   sqlite_ps files_del_scan (db, "nuke f_m_s", "delete from " BUILDIDS "_file_mtime_scanned "
                             "where file = ? and mtime = ?");
 
-- 
2.45.2

