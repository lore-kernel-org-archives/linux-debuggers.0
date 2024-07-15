Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7661D23BF
	for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 10:04:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721037894; cv=none; b=rIStnT1xBiyMf1Je59ouRooezGK1bDTeiukb/iUdMdGTnAFRqr7jK5BZ04g6Lg+uTi1uskO47XY5h6NFYjyw1rDs9b51a0QrxWxemNLuXgHKyEgKNl1QHAqD2th2b8kCaVJ/zaGbVB4/wkUTDgi/AIVQ6MzX6yLRcrvHaSyho8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721037894; c=relaxed/simple;
	bh=s06NQraKMlouNFxJKhhvr6Zc4iy4hCmI1yY1YriaaKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=WJwSkkXhNJJ5+7SPD4Ua+rxp2800w6ixYF4wH1tnE1HvumXjhZ5mXDacGh4l/slyN/jieNFBFjhojXWno+AxHGAmgZXqRSrxtTh57oVVTbM1qBVXrcWwEF7ldMC/k4hjQAYINOkuUHauT3e+bMGl1izEkDrsB8OMDU7UPFuSHbY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=Vxv+uTRu; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="Vxv+uTRu"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-70af22a9c19so3069611b3a.2
        for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 03:04:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721037892; x=1721642692; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flSmarIAFZkeQQAodQ+DS9Q4W6S+b7WB3G19Tv44sVo=;
        b=Vxv+uTRuIf/duw3aiwlq13F1fY3AFNIRzEfyDMb9Xg7kdiyauRoeF+tQKdeMsjolvD
         F02zfiQzl7U4NT/sromCUSoU4M+u5iQOD7y1nP7CYo4BB9kdO3tHr53Z0HHOFyksIOzv
         xjJ02i7Fz4rlIlOnunwgvHeIqUSf3gK+wtBsrME3Vu3VP09xKG9YnDBMv91DnmasrkPv
         6pRCCxQ9eP+hJhw6BNLdOenEDpv497vkv3jOCPnWpMOEXWESKG/eIndqnC5pAzBy/RfI
         eR38ChWfUMY5V3iH+mCPS/51pnXifZeSY1BkHma3H3/HkaTqW9wcTEqZbOyBT9JcBuOW
         d3TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721037892; x=1721642692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flSmarIAFZkeQQAodQ+DS9Q4W6S+b7WB3G19Tv44sVo=;
        b=Uhr/Hw5ICuWs608W6f6sHv8rS/f21Pk6S6WrAwEy8/59e/S5cXgWHXHzxhTovoHQxb
         JthIai9HQDPF+S7eMRW+ClU30UNQrWMUIOg6GhxyeYp55n017usa7vVx2BYOXDaIXRTS
         ZVin5TvUNQwO4/5YolHphJlMTRWMuKo3PHx8EykjUkCGhEJWsBwyJ2T9v1k6fel5/tP0
         zbhVUK2nM4VBGlHDnWp35rfF/fArNDl9lCi/sWTSp7mshhUtXMuVjm5DjVDzTWTv9U1l
         P2HkaglAnTpJI0zAB9vePsys0pNtgGE7/ToBRlYCBYeWTCXc7W1d2+Yw9VPRVangY5o6
         29pA==
X-Gm-Message-State: AOJu0YweCi9C7/qSjhnGGph6U8Ln1YtozTGfywjIpf1d0lIpUZYXMTwr
	3LsLMLrcKZ5dJfQX2Yw2z9/Ykgtph+YDJ8uiUWRbNmC46CdKy1lW+lEheuMZH/U2aufqPoxV86K
	G
X-Google-Smtp-Source: AGHT+IEmbUzh51AmpqYUIPQrawsbKUW/pybk9YjoGqsx3LyjHBZKOkeThwszJX17XdLV29HDUSUr9w==
X-Received: by 2002:a05:6a00:3e25:b0:705:9fc7:9133 with SMTP id d2e1a72fcca58-70b435e7ee2mr23392402b3a.23.1721037891568;
        Mon, 15 Jul 2024 03:04:51 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2c4d3sm3049100a12.48.2024.07.15.03.04.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:04:50 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH v2 1/5] debuginfod: factor out common code for responding from an archive
Date: Mon, 15 Jul 2024 03:04:32 -0700
Message-ID: <381ab6f4add85fb5673e05230067c5fa70bdb9d1.1721037200.git.osandov@fb.com>
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

handle_buildid_r_match has two very similar branches where it optionally
extracts a section and then creates a microhttpd response.  In
preparation for adding a third one, factor it out into a function.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx | 213 +++++++++++++++++---------------------
 1 file changed, 96 insertions(+), 117 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index 305edde8..2d709026 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -1965,6 +1965,81 @@ string canonicalized_archive_entry_pathname(struct archive_entry *e)
 }
 
 
+// NB: takes ownership of, and may reassign, fd.
+static struct MHD_Response*
+create_buildid_r_response (int64_t b_mtime0,
+                           const string& b_source0,
+                           const string& b_source1,
+                           const string& section,
+                           const string& ima_sig,
+                           const char* tmppath,
+                           int& fd,
+                           off_t size,
+                           time_t mtime,
+                           const string& metric,
+                           const struct timespec& extract_begin)
+{
+  if (tmppath != NULL)
+    {
+      struct timespec extract_end;
+      clock_gettime (CLOCK_MONOTONIC, &extract_end);
+      double extract_time = (extract_end.tv_sec - extract_begin.tv_sec)
+        + (extract_end.tv_nsec - extract_begin.tv_nsec)/1.e9;
+      fdcache.intern(b_source0, b_source1, tmppath, size, true, extract_time);
+    }
+
+  if (!section.empty ())
+    {
+      int scn_fd = extract_section (fd, b_mtime0,
+                                    b_source0 + ":" + b_source1,
+                                    section, extract_begin);
+      close (fd);
+      if (scn_fd >= 0)
+        fd = scn_fd;
+      else
+        {
+          if (verbose)
+            obatched (clog) << "cannot find section " << section
+                            << " for archive " << b_source0
+                            << " file " << b_source1 << endl;
+          return 0;
+        }
+
+      struct stat fs;
+      if (fstat (fd, &fs) < 0)
+        {
+          close (fd);
+          throw libc_exception (errno,
+            string ("fstat ") + b_source0 + string (" ") + section);
+        }
+      size = fs.st_size;
+    }
+
+  struct MHD_Response* r = MHD_create_response_from_fd (size, fd);
+  if (r == 0)
+    {
+      if (verbose)
+        obatched(clog) << "cannot create fd-response for " << b_source0 << endl;
+      close(fd);
+    }
+  else
+    {
+      inc_metric ("http_responses_total","result",metric);
+      add_mhd_response_header (r, "Content-Type", "application/octet-stream");
+      add_mhd_response_header (r, "X-DEBUGINFOD-SIZE", to_string(size).c_str());
+      add_mhd_response_header (r, "X-DEBUGINFOD-ARCHIVE", b_source0.c_str());
+      add_mhd_response_header (r, "X-DEBUGINFOD-FILE", b_source1.c_str());
+      if(!ima_sig.empty()) add_mhd_response_header(r, "X-DEBUGINFOD-IMASIGNATURE", ima_sig.c_str());
+      add_mhd_last_modified (r, mtime);
+      if (verbose > 1)
+        obatched(clog) << "serving " << metric << " " << b_source0
+                       << " file " << b_source1
+                       << " section=" << section
+                       << " IMA signature=" << ima_sig << endl;
+      /* libmicrohttpd will close fd. */
+    }
+  return r;
+}
 
 static struct MHD_Response*
 handle_buildid_r_match (bool internal_req_p,
@@ -2142,57 +2217,15 @@ handle_buildid_r_match (bool internal_req_p,
           break; // branch out of if "loop", to try new libarchive fetch attempt
         }
 
-      if (!section.empty ())
-	{
-	  int scn_fd = extract_section (fd, fs.st_mtime,
-					b_source0 + ":" + b_source1,
-					section, extract_begin);
-	  close (fd);
-	  if (scn_fd >= 0)
-	    fd = scn_fd;
-	  else
-	    {
-	      if (verbose)
-	        obatched (clog) << "cannot find section " << section
-				<< " for archive " << b_source0
-				<< " file " << b_source1 << endl;
-	      return 0;
-	    }
-
-	  rc = fstat(fd, &fs);
-	  if (rc < 0)
-	    {
-	      close (fd);
-	      throw libc_exception (errno,
-		string ("fstat archive ") + b_source0 + string (" file ") + b_source1
-		+ string (" section ") + section);
-	    }
-	}
-
-      struct MHD_Response* r = MHD_create_response_from_fd (fs.st_size, fd);
+      struct MHD_Response* r = create_buildid_r_response (b_mtime, b_source0,
+                                                          b_source1, section,
+                                                          ima_sig, NULL, fd,
+                                                          fs.st_size,
+                                                          fs.st_mtime,
+                                                          "archive fdcache",
+                                                          extract_begin);
       if (r == 0)
-        {
-          if (verbose)
-            obatched(clog) << "cannot create fd-response for " << b_source0 << endl;
-          close(fd);
-          break; // branch out of if "loop", to try new libarchive fetch attempt
-        }
-
-      inc_metric ("http_responses_total","result","archive fdcache");
-
-      add_mhd_response_header (r, "Content-Type", "application/octet-stream");
-      add_mhd_response_header (r, "X-DEBUGINFOD-SIZE",
-			       to_string(fs.st_size).c_str());
-      add_mhd_response_header (r, "X-DEBUGINFOD-ARCHIVE", b_source0.c_str());
-      add_mhd_response_header (r, "X-DEBUGINFOD-FILE", b_source1.c_str());
-      if(!ima_sig.empty()) add_mhd_response_header(r, "X-DEBUGINFOD-IMASIGNATURE", ima_sig.c_str());
-      add_mhd_last_modified (r, fs.st_mtime);
-      if (verbose > 1)
-	obatched(clog) << "serving fdcache archive " << b_source0
-		       << " file " << b_source1
-		       << " section=" << section
-		       << " IMA signature=" << ima_sig << endl;
-      /* libmicrohttpd will close it. */
+        break; // branch out of if "loop", to try new libarchive fetch attempt
       if (result_fd)
         *result_fd = fd;
       return r;
@@ -2307,13 +2340,12 @@ handle_buildid_r_match (bool internal_req_p,
       tvs[1].tv_nsec = archive_entry_mtime_nsec(e);
       (void) futimens (fd, tvs);  /* best effort */
 
-      struct timespec extract_end;
-      clock_gettime (CLOCK_MONOTONIC, &extract_end);
-      double extract_time = (extract_end.tv_sec - extract_begin.tv_sec)
-        + (extract_end.tv_nsec - extract_begin.tv_nsec)/1.e9;
-      
       if (r != 0) // stage 3
         {
+          struct timespec extract_end;
+          clock_gettime (CLOCK_MONOTONIC, &extract_end);
+          double extract_time = (extract_end.tv_sec - extract_begin.tv_sec)
+            + (extract_end.tv_nsec - extract_begin.tv_nsec)/1.e9;
           // NB: now we know we have a complete reusable file; make fdcache
           // responsible for unlinking it later.
           fdcache.intern(b_source0, fn,
@@ -2324,69 +2356,16 @@ handle_buildid_r_match (bool internal_req_p,
           continue;
         }
 
-      // NB: now we know we have a complete reusable file; make fdcache
-      // responsible for unlinking it later.
-      fdcache.intern(b_source0, b_source1,
-                     tmppath, archive_entry_size(e),
-                     true, extract_time); // requested ones go to the front of the line
-
-      if (!section.empty ())
-	{
-	  int scn_fd = extract_section (fd, b_mtime,
-					b_source0 + ":" + b_source1,
-					section, extract_begin);
-	  close (fd);
-	  if (scn_fd >= 0)
-	    fd = scn_fd;
-	  else
-	    {
-	      if (verbose)
-	        obatched (clog) << "cannot find section " << section
-				<< " for archive " << b_source0
-				<< " file " << b_source1 << endl;
-	      return 0;
-	    }
-
-	  rc = fstat(fd, &fs);
-	  if (rc < 0)
-	    {
-	      close (fd);
-	      throw libc_exception (errno,
-		string ("fstat ") + b_source0 + string (" ") + section);
-	    }
-	  r = MHD_create_response_from_fd (fs.st_size, fd);
-	}
-      else
-	r = MHD_create_response_from_fd (archive_entry_size(e), fd);
-
-      inc_metric ("http_responses_total","result",archive_extension + " archive");
+      r = create_buildid_r_response (b_mtime, b_source0, b_source1, section,
+                                     ima_sig, tmppath, fd,
+                                     archive_entry_size(e),
+                                     archive_entry_mtime(e),
+                                     archive_extension + " archive",
+                                     extract_begin);
       if (r == 0)
-        {
-          if (verbose)
-            obatched(clog) << "cannot create fd-response for " << b_source0 << endl;
-          close(fd);
-          break; // assume no chance of better luck around another iteration; no other copies of same file
-        }
-      else
-        {
-          add_mhd_response_header (r, "Content-Type",
-                                   "application/octet-stream");
-          add_mhd_response_header (r, "X-DEBUGINFOD-SIZE",
-                                   to_string(archive_entry_size(e)).c_str());
-          add_mhd_response_header (r, "X-DEBUGINFOD-ARCHIVE", b_source0.c_str());
-          add_mhd_response_header (r, "X-DEBUGINFOD-FILE", b_source1.c_str());
-          if(!ima_sig.empty()) add_mhd_response_header(r, "X-DEBUGINFOD-IMASIGNATURE", ima_sig.c_str());
-          add_mhd_last_modified (r, archive_entry_mtime(e));
-          if (verbose > 1)
-	    obatched(clog) << "serving archive " << b_source0
-			   << " file " << b_source1
-			   << " section=" << section
-			   << " IMA signature=" << ima_sig << endl;
-          /* libmicrohttpd will close it. */
-          if (result_fd)
-            *result_fd = fd;
-          continue;
-        }
+        break; // assume no chance of better luck around another iteration; no other copies of same file
+      if (result_fd)
+        *result_fd = fd;
     }
 
   // XXX: rpm/file not found: delete this R entry?
-- 
2.45.2

