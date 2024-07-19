Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECED81E519
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377947; cv=none; b=NGYQJgcWAXFh24Bz96UxL6dLDewHHVlvvsroRt8AqVdNM41j/hvnE4a6Zf8L0bCwb4L9SIJQchObzg1Ryt7pM4lkRAiZOV1kR7lMyaEG7M56VymCCvCg4YYyav3I6pOiwi4/Hun+sWgwoNoZ1n+Qf35uAvlkPpohgRJ1V3+TncI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377947; c=relaxed/simple;
	bh=Oru7xXuE+W1tjggcxnCvwHOAYmbas3RkZ3wR/gXJ/L4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KHhyXUwR4ulA2cPiwztdQ0+Wa+7JS/T5o0VIl2blYcGa5i4HiLtKG2PMIka5gdpSFJ+D6WMALlHRCGZXsybOceVNENw06/JH0Q6L3NNI62IYqKzCeQpOAoxVps1NsOnyGidSyRK71l+lshPXikZ6muTcmBQ06UbUEPuT8octeqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=FP0kchoi; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="FP0kchoi"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-1fc4fcbb131so15513785ad.3
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721377941; x=1721982741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vd6YrB0OanJN1pB/Gsz92oGaAsFfGlo3b0Rc95uxBKU=;
        b=FP0kchoigvPHRXWyTq9xDoo1FYEgQTfujq1S/uhinEr7Mac8Qe9bJcmdtgqnmQ82M1
         1ucjNEVRLNhLiVPrxzl3wfHShsVEiQnAEY5atT4VhajrtH3lWWTECs6oGCUgeQlLFC4u
         EyHhMx/qqkZ4PqocJWyTUuLcNjTdqsEZubpbhyviPWylH05x/ukOeCzNXDBWaJU6E69z
         9I128w4B1RgBjEvPT1YtnRzCBdv3pRH6MweBmoluHpvguF1OYuq8ygnFd/hiFKBAK1AP
         n7icX35Gl1OY2vKcf+KZVeZ7FmD00y4JwDV4K5rJgVf9w3qkeMrTIsNqfVXz8LL3sl+W
         b6xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721377941; x=1721982741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vd6YrB0OanJN1pB/Gsz92oGaAsFfGlo3b0Rc95uxBKU=;
        b=WYFLTw6UMdMqmdanZUTOj90hAsFQUPBXtvJ8hczCCS4bryoFXyolzwnTVSSOUufR4S
         2BzLjBHdHheV/j1m6WrN86syGhjwwtAbx7QfEMMD0ehsMMWur5JLs7MJnSs0rrN7IwxQ
         BfKb9HpeRFwYdt3rB7zJnCV2M3WhNNHI9mPD+6NGQGG34yYfx3NFDWrQ7u5gJLDUhphV
         BqEB6BAXDKEYr2le00TPaOe1m3RymVsUsMXIisQcNQT3394szL1+MQSxxK4xiGMKsStq
         reOsVLJmrzHz6jKpiLhJYgLc0YCUalOFseXQ49rCbqgMHv9kUPhO7Ztx7NRK+s4d0Gkl
         MLbA==
X-Forwarded-Encrypted: i=1; AJvYcCW0flx8hLMHg40A2hKVHJCY+JlatkItpXVyp4ugnRcrYvblHokWh/nNLPbJYabwq8VMsHsOrPxmN2zYiChGrYLEJLXmbXUDlBfOqkWNCa3z
X-Gm-Message-State: AOJu0YwzUiwklsuL0oEcItudbxvUNpMqKqRa9TkYsXwetzhrYg+eickB
	m/wvj1L95cZtZCYC0U+VEQ4mFTHSUmK1CWlhZjm5//8u7LukYzONMH5BS/3LuJ0=
X-Google-Smtp-Source: AGHT+IHmBR82lz1gfW5wYUDyj60HYxXohM98oRhHn4v6mmnwurV3hUD4Sji943+DfNodjt7aI6JgdA==
X-Received: by 2002:a17:903:2289:b0:1fc:719c:5f0 with SMTP id d9443c01a7336-1fc719c08admr31418895ad.49.1721377940378;
        Fri, 19 Jul 2024 01:32:20 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b49467sm8832375ad.6.2024.07.19.01.32.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:32:19 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v3 6/7] debuginfod: populate _r_seekable on scan
Date: Fri, 19 Jul 2024 01:32:02 -0700
Message-ID: <1d95dc15ab91b926a7c5fa1a94810a81532744ac.1721377314.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721377314.git.osandov@fb.com>
References: <cover.1721377314.git.osandov@fb.com>
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
previous commit.  Also add a test case using some artificial packages.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx                     | 150 +++++++++++++++++-
 tests/Makefile.am                             |   4 +-
 ...pressme-seekable-xz-dbgsym_1.0-1_amd64.deb | Bin 0 -> 6288 bytes
 ...compressme-seekable-xz_1.0-1.debian.tar.xz | Bin 0 -> 1440 bytes
 .../compressme-seekable-xz_1.0-1.dsc          |  19 +++
 .../compressme-seekable-xz_1.0-1_amd64.deb    | Bin 0 -> 6208 bytes
 .../compressme-seekable-xz_1.0.orig.tar.xz    | Bin 0 -> 7160 bytes
 .../compressme-seekable-xz-1.0-1.src.rpm      | Bin 0 -> 15880 bytes
 .../compressme-seekable-xz-1.0-1.x86_64.rpm   | Bin 0 -> 31873 bytes
 ...sme-seekable-xz-debuginfo-1.0-1.x86_64.rpm | Bin 0 -> 21917 bytes
 ...e-seekable-xz-debugsource-1.0-1.x86_64.rpm | Bin 0 -> 7961 bytes
 tests/run-debuginfod-seekable.sh              | 141 ++++++++++++++++
 12 files changed, 309 insertions(+), 5 deletions(-)
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

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index cf7f48ab..677eca30 100644
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
@@ -2333,6 +2436,11 @@ extract_from_seekable_archive (const string& srcpath,
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
@@ -4282,6 +4390,7 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
                   sqlite_ps& ps_upsert_buildids, sqlite_ps& ps_upsert_fileparts, sqlite_ps& ps_upsert_file,
                   sqlite_ps& ps_lookup_file,
                   sqlite_ps& ps_upsert_de, sqlite_ps& ps_upsert_sref, sqlite_ps& ps_upsert_sdef,
+                  sqlite_ps& ps_upsert_seekable,
                   time_t mtime,
                   unsigned& fts_executable, unsigned& fts_debuginfo, unsigned& fts_sref, unsigned& fts_sdef,
                   bool& fts_sref_complete_p)
@@ -4336,6 +4445,10 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
   if (verbose > 3)
     obatched(clog) << "libarchive scanning " << rps << " id " << archiveid << endl;
 
+  bool seekable = is_seekable_archive (rps, a);
+  if (verbose> 2 && seekable)
+    obatched(clog) << rps << " is seekable" << endl;
+
   bool any_exceptions = false;
   while(1) // parse archive entries
     {
@@ -4357,6 +4470,15 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
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
@@ -4448,6 +4570,15 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
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
@@ -4461,11 +4592,19 @@ archive_classify (const string& rps, string& archive_extension, int64_t archivei
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
@@ -4496,6 +4635,7 @@ scan_archive_file (const string& rps, const stat_t& st,
                    sqlite_ps& ps_upsert_de,
                    sqlite_ps& ps_upsert_sref,
                    sqlite_ps& ps_upsert_sdef,
+                   sqlite_ps& ps_upsert_seekable,
                    sqlite_ps& ps_query,
                    sqlite_ps& ps_scan_done,
                    unsigned& fts_cached,
@@ -4533,7 +4673,7 @@ scan_archive_file (const string& rps, const stat_t& st,
       string archive_extension;
       archive_classify (rps, archive_extension, archiveid,
                         ps_upsert_buildids, ps_upsert_fileparts, ps_upsert_file, ps_lookup_file,
-                        ps_upsert_de, ps_upsert_sref, ps_upsert_sdef, // dalt
+                        ps_upsert_de, ps_upsert_sref, ps_upsert_sdef, ps_upsert_seekable, // dalt
                         st.st_mtime,
                         my_fts_executable, my_fts_debuginfo, my_fts_sref, my_fts_sdef,
                         my_fts_sref_complete_p);
@@ -4639,6 +4779,9 @@ scan ()
   sqlite_ps ps_r_upsert_sdef (db, "rpm-sdef-insert",
                             "insert or ignore into " BUILDIDS "_r_sdef (file, mtime, content) values ("
                             "?, ?, ?);");
+  sqlite_ps ps_r_upsert_seekable (db, "rpm-seekable-insert",
+                                  "insert or ignore into " BUILDIDS "_r_seekable (file, content, type, size, offset, mtime) "
+                                  "values (?, ?, 'xz', ?, ?, ?);");
   sqlite_ps ps_r_query (db, "rpm-negativehit-query",
                       "select 1 from " BUILDIDS "_file_mtime_scanned where "
                       "sourcetype = 'R' and file = ? and mtime = ?;");
@@ -4681,6 +4824,7 @@ scan ()
                                ps_r_upsert_de,
                                ps_r_upsert_sref,
                                ps_r_upsert_sdef,
+                               ps_r_upsert_seekable,
                                ps_r_query,
                                ps_r_scan_done,
                                fts_cached,
diff --git a/tests/Makefile.am b/tests/Makefile.am
index cfed54b7..c2e45e02 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -227,7 +227,7 @@ export ELFUTILS_DISABLE_DEMANGLE = 1
 endif
 
 if LZMA
-TESTS += run-readelf-s.sh run-dwflsyms.sh
+TESTS += run-readelf-s.sh run-dwflsyms.sh run-debuginfod-seekable.sh
 endif
 
 if HAVE_ZSTD
@@ -669,7 +669,7 @@ EXTRA_DIST = run-arextract.sh run-arsymtest.sh run-ar.sh \
 	     testfile-dwp-4-cu-index-overflow.dwp.bz2 \
 	     testfile-dwp-cu-index-overflow.source \
 	     testfile-define-file.bz2 \
-	     testfile-sysroot.tar.bz2 run-sysroot.sh
+	     testfile-sysroot.tar.bz2 run-sysroot.sh run-debuginfod-seekable.sh
 
 
 if USE_VALGRIND
diff --git a/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz-dbgsym_1.0-1_amd64.deb b/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz-dbgsym_1.0-1_amd64.deb
new file mode 100644
index 0000000000000000000000000000000000000000..75cb984c8a071373e64ee9d78a2956b813796009
GIT binary patch
literal 6288
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

literal 0
HcmV?d00001

diff --git a/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1.debian.tar.xz b/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1.debian.tar.xz
new file mode 100644
index 0000000000000000000000000000000000000000..9b2e48c07a05d48ab5997c9af514ce3aac141549
GIT binary patch
literal 1440
zcmV;R1z-C8H+ooF000E$*0e?hz~2ghP$2;p000000001fj0|DmC;tUkT>vr}NNor1
z@tIyK_)om_N=i<6S-%T;fOGB2GRB9q4BH)7u*{O+35*lzS?P;V?>R9m3|5mRC1vlm
zpdl4bJBbbDh$n$YctsuncBa4);~^V*qxuz;gg9<O%^~*Oo6$jSkP~rGaa8B~h@%2K
z5lQE?>h)*KSpPVWKeb?g?+GlrlvNrQcgTfUJantdls#`}KO4P-Qg}vo)6p8f-(j5B
z$9r@8gxU_UB&?a@ta;Z63hK@27KRfyWzE<qT=hzt227tHQOXPDMBn12p~2AolQJBX
zv18y|;bcv)FyA%`hKlGZ$y~ZCgc)-i1u#^%+M+sc9Ti#(ZRqT8AP<tHz?ZA3<W`sB
zOJ79cbt8Tkw{DWq8F`wwBI5-bnpxPbPEdjN{|jh_@64$ZE0aaVJ|>a4NOzQtw{Wi8
z$z0x+^#qZ_ec39;WI#|n@ud<wCpudafX|DFF;XruX6wnGVl+s0C?pZALiL}eUrx)p
z=BrpuQH>0}_qOEj7UZ`kY~QHZRO<8gTk#HKF0evhS;lLj=c9-490N*$8zT7vVu0pd
z%>9W9C;8AZ{vpn91rjn$i$lFJpn<Nf1)4K8?mD-*f{m!PeLV8bAA1b9HH=v1onl9G
zSiN{o3?%kT%4TIVbqGmwI^iwbpV%R(1r8WNP}Q9;$$VnLh7FX&^c6IPCK@Soe7%QQ
zU_UDf9he)fH89V>IV?Q>E&Im5MaU9M&ob9s#Rte%`1Wj<4kS}vy?~e1TLSIXABEBB
zKX<9mRT#-HQt^lH5na8B%Ts$+ELZ*XOOa-{szny%o3>ECz$M)zQQjf3ckvo$?+^L4
z`ZUv<cIN`V{pr8Fh49|owdrFowie0!vmeQxS6hG#i^c8l>0N$Shx2}%oJR7JebGx>
z1vL42G?s8&_IwUJPgqn%=E+z{(9BGkjNFZqY`C9(2%%maJ;Z<nVOgkS-~xvAVB_9_
zb(f-;18Ao;uIO_yC=u&^jcGnI=$4aE!GIyiP=tjo>a*Tg<?+)7b`Xqd=nz{VsL+*b
zFurILYFpA~S35@a5kO5WkQ8v43?n+Y<c?{)FxStP0!!3wlk|aZKp8R)JQ{KBM33oC
zJOWD<%2mNvA6#cYAaSD=DNFtM0OlOLN_|#q0!u{Kvr@q(YtasB1$2~HKuSd57)kDc
z9>kS;N|S|qvF+Vr0B%O}co(x77PNNIL|V)?0gt+6K5+eC`LFCmcy(ywV_KG>lRBnI
za`%y9z)Yd{c8bqYX}qTUX?jw)!)BDx_7hRRpAU8`uN4~fh`r+OJAo8vG9KKTNE{cW
zDd{U93d7*#F|Xag)e_sbe_=(Vw#aV?pjHh}6_n`EiLQj#nhkS&j)RJ4aUe@DTNTD`
zSqAJ5y(k27IX3c#imik@u<$y<9^Zm(mc{B-_U<Fyi$X9XZ&az_=-wV^xK~xedZYG=
zX({wMvN;kz%Ns00qyCSnpSFb_ps_L8YzQwzVnU8y-I04TvXOholR?qnVq=7^Owl-p
z$-BXEv*Pgr5r)rz-o}4pG4a=kL!EV)lD3_DPh%XbVYQ+1W`f*6R;ZN=a}ZS%e~(Ak
z*Wv($-sfNMq7i$(3qOrAxFPI4n91oVgxEm@LWK1T(vi6{!D;aK9Y7v0^%Ook(uUo`
z@T4_IA$Cjs%m*lHdy|#E@l^6q5gdEi>GI_I(3=*_IZt@zs<j+;f7+&LpR?H=e;rOF
zOTes4;dE=SaO!;4>1Ok(va9>}i6(5dJkmL)dp&Sm63Yk!BBpN9QrvUqU$ga}D1+Cz
u+Y_q>#eNQlfB*nA5!+sa^F8$d0s9JoPyhfey;XOy#Ao{g000001X)^04!WuU

literal 0
HcmV?d00001

diff --git a/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1.dsc b/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1.dsc
new file mode 100644
index 00000000..5ba2559e
--- /dev/null
+++ b/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1.dsc
@@ -0,0 +1,19 @@
+Format: 3.0 (quilt)
+Source: compressme-seekable-xz
+Binary: compressme-seekable-xz
+Architecture: any
+Version: 1.0-1
+Maintainer: Omar Sandoval <osandov@fb.com>
+Standards-Version: 4.5.1
+Build-Depends: debhelper-compat (= 13)
+Package-List:
+ compressme-seekable-xz deb misc optional arch=any
+Checksums-Sha1:
+ bb182efecbbe8a3f9921b411201203711bd66722 7160 compressme-seekable-xz_1.0.orig.tar.xz
+ 76d7e5457e8cafda6c2d5591ea6701ec39d2be56 1440 compressme-seekable-xz_1.0-1.debian.tar.xz
+Checksums-Sha256:
+ e221d529467a253ddab35e735d1e049826292a3bd395e8f65f690919a9b508d6 7160 compressme-seekable-xz_1.0.orig.tar.xz
+ 71c40c722a9ff5cace7226a5c75d56dfe11aa220bf5a95a163438a971649e056 1440 compressme-seekable-xz_1.0-1.debian.tar.xz
+Files:
+ bd331eb0439afb87ecef108c7ef6652e 7160 compressme-seekable-xz_1.0.orig.tar.xz
+ 2ce6642053700808bb65226dde0b6603 1440 compressme-seekable-xz_1.0-1.debian.tar.xz
diff --git a/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1_amd64.deb b/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1_amd64.deb
new file mode 100644
index 0000000000000000000000000000000000000000..6900119ae0bd20c550b3c78f62eb3a2c26e77df4
GIT binary patch
literal 6208
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
Q=+iMSfe;7me>%qh0z(tT#sB~S

literal 0
HcmV?d00001

diff --git a/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0.orig.tar.xz b/tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0.orig.tar.xz
new file mode 100644
index 0000000000000000000000000000000000000000..6a54d20c8b3ede88943856ededcc33cb1b5b1338
GIT binary patch
literal 7160
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

literal 0
HcmV?d00001

diff --git a/tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-1.0-1.src.rpm b/tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-1.0-1.src.rpm
new file mode 100644
index 0000000000000000000000000000000000000000..ada76efcf3d952a33f268323bbd49150152a909b
GIT binary patch
literal 15880
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
D11UFp

literal 0
HcmV?d00001

diff --git a/tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-1.0-1.x86_64.rpm b/tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-1.0-1.x86_64.rpm
new file mode 100644
index 0000000000000000000000000000000000000000..923ab96b3082592dc90c48ae2c50f5977ad88811
GIT binary patch
literal 31873
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
DsxeDm

literal 0
HcmV?d00001

diff --git a/tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-debuginfo-1.0-1.x86_64.rpm b/tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-debuginfo-1.0-1.x86_64.rpm
new file mode 100644
index 0000000000000000000000000000000000000000..e53efb6b94bdc1925edb87fe5b8cf2d64a26f778
GIT binary patch
literal 21917
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
Dc|5y#

literal 0
HcmV?d00001

diff --git a/tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-debugsource-1.0-1.x86_64.rpm b/tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-debugsource-1.0-1.x86_64.rpm
new file mode 100644
index 0000000000000000000000000000000000000000..3595e5a37ff02914a050759cfd443395ca981156
GIT binary patch
literal 7961
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
Rr{B2n#lYyBD!F9Fe*m-tG7<m)

literal 0
HcmV?d00001

diff --git a/tests/run-debuginfod-seekable.sh b/tests/run-debuginfod-seekable.sh
new file mode 100755
index 00000000..d546fa3d
--- /dev/null
+++ b/tests/run-debuginfod-seekable.sh
@@ -0,0 +1,141 @@
+#!/usr/bin/env bash
+
+. $srcdir/debuginfod-subr.sh
+
+# for test case debugging, uncomment:
+set -x
+unset VALGRIND_CMD
+
+mkdir R Z
+cp -rvp ${abs_srcdir}/debuginfod-rpms/seekable-xz R
+cp -rvp ${abs_srcdir}/debuginfod-debs/seekable-xz D
+
+# This variable is essential and ensures no time-race for claiming ports occurs
+# set base to a unique multiple of 100 not used in any other 'run-debuginfod-*' test
+base=14100
+get_ports
+
+DB=${PWD}/.debuginfod_tmp.sqlite
+tempfiles $DB
+export DEBUGINFOD_CACHE_PATH=${PWD}/.client_cache
+
+env LD_LIBRARY_PATH=$ldpath ${abs_builddir}/../debuginfod/debuginfod $VERBOSE -d $DB -p $PORT1 -t0 -g0 -v -R -U R D > vlog$PORT1 2>&1 &
+PID1=$!
+tempfiles vlog$PORT1
+errfiles vlog$PORT1
+
+wait_ready $PORT1 'ready' 1
+wait_ready $PORT1 'thread_work_total{role="traverse"}' 1
+wait_ready $PORT1 'thread_work_pending{role="scan"}' 0
+wait_ready $PORT1 'thread_busy{role="scan"}' 0
+
+# Mapping from build ID to sha256 of executable and debuginfo files.  Generated with:
+#
+# #/bin/bash
+# set -e
+#
+# tmpdir="$(mktemp -d)"
+# trap 'rm -rf "$tmpdir"' EXIT
+# mkdir "$tmpdir/rpm" "$tmpdir/deb"
+# rpm2cpio tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-1.0-1.x86_64.rpm | cpio -D "$tmpdir/rpm" -id --quiet
+# rpm2cpio tests/debuginfod-rpms/seekable-xz/compressme-seekable-xz-debuginfo-1.0-1.x86_64.rpm | cpio -D "$tmpdir/rpm" -id --quiet
+# ar p tests/debuginfod-debs/seekable-xz/compressme-seekable-xz_1.0-1_amd64.deb data.tar.xz | tar -C "$tmpdir/deb" -xJ
+# ar p tests/debuginfod-debs/seekable-xz/compressme-seekable-xz-dbgsym_1.0-1_amd64.deb data.tar.xz | tar -C "$tmpdir/deb" -xJ
+#
+# echo "declare -A files=("
+# for which in rpm deb; do
+# 	cd "$tmpdir/$which/usr/bin"
+# 	echo "	# $which"
+# 	for file in $(ls -v); do
+# 		build_id="$(eu-readelf -n "$file" | sed -n 's/^.*Build ID: \([a-f0-9]\+\).*$/\1/p')"
+# 		executable_sha="$(sha256sum "$file" | cut -d' ' -f1)"
+# 		debuginfo_sha="$(sha256sum "../../usr/lib/debug/.build-id/${build_id:0:2}/${build_id:2}.debug" | cut -d' ' -f1)"
+# 		echo "	[$build_id]=\"$executable_sha $debuginfo_sha\" # $file"
+# 	done
+# done
+# echo ")"
+declare -A files=(
+	# rpm
+	[3a54b25d643025aa69d33f08f1ddeee42b63b0c7]="7e8f2bb564e1a74f1fb0344b2218ee5dd885a84885d850846980d1e7e56d8b8b 4421819cac8118e56f9fe2fa6f3becb209b115c6eb2906ed54935f970034315c" # compressme1
+	[aa1dd872c917955a95be7943219a4c58886dc965]="e38b0b8494c5cb7816394c00e9c80333262d28b368c8eff59397981435e401b4 101f46d227db71ec8c080de08fd93750a976299a81a2397f6f3b19c0771e138a" # compressme2
+	[c80ba826295ca18732ddc15474f166c50c81fc51]="7b1fbbe1d702770d8fa22610a9463c41c7dee8d21fce167a9a1b0588bf82f516 49962d52bd736b63975ade48f52b5431fa7f478baf102b12bbb9efce8c5ef0ba" # compressme3
+	[f8617b5ea038d166417357779f6c17dec8b80690]="4bc682ee3194ed9d2efb92e828a9f6ff3c7b0f25cb5ba94832250e79261ada8b eec384c131ce68eeb8026168a6888e3acb2fbf0d60fe808ddbe0e342eabf74a9" # compressme4
+	[34880de6319ba33c23c1b1c25e454abf5ec9c433]="c83e1ed93fe09b3850368bff92ed9d4e5807515920126db71bdefc25cc3cb617 7fde181eb2ecd79be1b8aa8c5929454df5bf6c91c96e458b7c36df8da9cc640b" # compressme5
+	[1be17d4e02bcf6059481e9591881c6ef2d24b795]="94037ba19019ea1be06ffa20f4d9e7cc58faf7af90c4554a657395fcc86e3c3f 6e0c3b6c5daa824f30ea95587e8e3c051bebd0eca883f8cdeada5190e8c1d4cd" # compressme6
+	[be3a4ca9a68fc2b200fe5acbb12f0c5b8c761b69]="c16ac0ccde84cd8f89eebec8c29ce783a7da5c5730c76393774925487e6511f7 34b08a88f131cc9d4f7f1053b26dd277956eb18a47420aa1ac8d35c99c23d574" # compressme7
+	[d64dd065e26a876c79f9ce640e107075263e4595]="53ab9909861aa77eb5cb5e7d62e2882f733861fcaf5c2421800758e52c1e0dea 3d2e3a6ddd7673acaf0573f39f0cc52d95a1b52a080d34efcc02d85e788c148e" # compressme8
+	[28cc53dd47f9d12673d97ab38f6a21bcad3a528f]="9c231d8ea65133479eed17425e1d3b355703bcd0bf3dfc80520e25ffdc6d5d78 79aa232366e99bcbf4adf8ee74b333979d9164f45ad6ba55abb0e85be2ccd079" # compressme9
+	[a05381ea7253b6b446e2120cab2fef08445612a3]="a66b503b4decade17b1551ef82b380c1506713b36a78c776d12d9c3863a4115a 0a6d59c228e74d485e9b314cb7e1f718267103d2c179efac89e874f7b852bbec" # compressme10
+	# deb
+	[f2d910ae1e3e3fa717ef202120966ee4dba07ebd]="e16a38135865eff8f26b5ddfdd5719ba4b90d233f469fb07428cc6ef299214e9 047f7ec51840f6cf6977d6253ccd503f2ce2711813a53317b81e79d20452fd38" # compressme1
+	[65e773f11929c579b90923ea81f36523ce2337e6]="00e2fac30ba6c494473fdba1e5ccb0cdbf12229581d2f95af519c9550af5d3d6 eee11a8c840623093de5a1518e673e50141df42e18ea1933c78edf7f11742427" # compressme2
+	[a679eaf745a6da111041d208cdeb4474192c2e50]="194b79bcab83fa8140ccbee6cc199f233b0e8804b4a2231695f3c7c4604b67b4 684ff9ad385ab15a066ad4bfc3074df15f1525580310202150d7043513e9890b" # compressme3
+	[8b117108d9b7f6ffce251421bdf6c6cc8c801d35]="edf8fec536efb1d9cfb534fd67c12a35b60fdb5955d3f9119ef664818fef0b22 1ef9d762fe59b03547ac7baa5596e13a4bfa8322bbdd8400987f8a95a4d038a6" # compressme4
+	[2269081378c82ff119d0f0ec8cdaba3977746835]="77a5b384554a32c73f528abfd196c05c5eca6b97c948ebdccbd6d1beb441105b d29dc24c52cde04397f874660e0980f2d4a043ff132c019d0f92b238012ab464" # compressme5
+	[d0840f88ceb63f52354c0b4dceda6c5011155bbd]="523c2c1c4176149a2d773307e5de520195195020bf0f2e42eb47b958b2fbdb93 170a684806ff7e55938d3afa02095a6bdd3184b62b8efdfebb72bb85bfc4120b" # compressme6
+	[8101300d5d590b434b798c3edda0908346230cef]="878b7b8cedca8fb69ebc8bc3cb635a7ce0dd4b4da787cde18ff7d06503105c73 86d2cd52026cba35114201d3a1fc2ce31b2403d91785dad5366b5a5b9fe3636f" # compressme7
+	[b8755c57a65fe12fa210f216dd861cf2b5101918]="2ec562f19b5b57036b48cd1f07d2d61c6a5a91b0470d14393b8c11429753d632 1ee7340245db704a0e3d5f7431706e14e7feeb9ba5c6572e61287b24b0e9fca0" # compressme8
+	[ffe01fd7b7d994d9b9d9e9311ac5189d82162ba0]="cf129420e315943b9d63891455aae7fb69189158b66eba82faf1580e763aa642 3a73ccbd08a6a4088355e973bd4748d99c56b3557b12417e4fa34ed9e85c85a9" # compressme9
+	[dd25b00a86c89feaf5ba61fd9c6dc8bd9e5aebef]="5bd04cadb7bce5ca3f817b84c734639764046365a96a0bc1870ecc480e7c38a9 08f9da5788224b8cfdc3bd91b784d1f9a109780100a71f6fbe0b52ec43ea436e" # compressme10
+)
+
+which=(executable debuginfo)
+check_all() {
+	local port="$1"
+	for build_id in "${!files[@]}"; do
+		sha=(${files["$build_id"]})
+		# Check the executable and the debuginfo.
+		for ((i = 0; i < 2; i++)); do
+			# Check each one twice to test the fdcache.
+			for ((j = 0; j < 2; j++)); do
+				path="$(env LD_LIBRARY_PATH=$ldpath DEBUGINFOD_URLS=http://localhost:$port ${abs_builddir}/../debuginfod/debuginfod-find "${which[$i]}" "$build_id")"
+				sha256sum --check - << EOF
+${sha[$i]} $path
+EOF
+				rm -f "$path"
+			done
+		done
+	done
+}
+
+check_all $PORT1
+
+# Make sure all extractions used the seekable optimization.
+curl -s http://localhost:$PORT1/metrics | awk '
+/^http_responses_total\{result="seekable xz archive"\}/ {
+	print
+	seekable = $NF
+}
+
+/^http_responses_total\{result="archive fdcache"\}/ {
+	print
+	fdcache = $NF
+}
+
+/^http_responses_total\{result="(rpm|deb) archive"\}/ {
+	print
+	full = $NF
+}
+
+END {
+	if (seekable == 0) {
+		print "error: no seekable extractions" > "/dev/stderr"
+		exit 1
+	}
+	if (fdcache == 0) {
+		print "error: no fdcache hits" > "/dev/stderr"
+		exit 1
+	}
+	if (full > 0) {
+		print "error: " full " full extractions" > "/dev/stderr"
+		exit 1
+	}
+}'
+
+tempfiles $DB*
+
+kill $PID1
+wait $PID1
+PID1=0
+
+exit 0
-- 
2.45.2

