Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4592F196438
	for <linux-debuggers@vger.kernel.org>; Wed, 10 Jul 2024 20:47:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720644446; cv=none; b=O14P1IMy+5l7RgfthRBQEMgxQZDR74al8olbfGOC1Zo+nOrDE+moBcT/pElaJ9uzwKeEVTVMg43BI6CXemjcbeZft85vSjJX61x2HtIn9ZtlaDyfbqqPlVne0cdExybd4WsSYZz0yOjxGOKxw4KjdqxDKYWnpXc48cni6TkgIcE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720644446; c=relaxed/simple;
	bh=s06NQraKMlouNFxJKhhvr6Zc4iy4hCmI1yY1YriaaKI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CgyHuq0AWNv+9Mms+EuQzeenj5r2pddsJRUK4J0reKr2qRujVo7SOhhxbUrlsp3/v0KyatDe152NA0WLVd+bHAxTgMgYJYNMxWAiIclZEi9HH5LzMqGPU4+PTnc6WdltZXY4QFmNDFWi895PQsiL8E0bwHnV7t753VvufWSaUyc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=3cYFL4HZ; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="3cYFL4HZ"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-1f9de13d6baso1108635ad.2
        for <linux-debuggers@vger.kernel.org>; Wed, 10 Jul 2024 13:47:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1720644444; x=1721249244; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=flSmarIAFZkeQQAodQ+DS9Q4W6S+b7WB3G19Tv44sVo=;
        b=3cYFL4HZZqGsoPToJht1DK/kRyXbyYjcndoyg3dOi2f+VrdQ5mJpBqENQ8fQYyEZRP
         2p0WIcO8lrfjDSbePTxNsYa0ppm3/Z16ftqD63BAQ+ol3+EvylIzldNdVquyjyCAP754
         Vke976+QBYQsU2r3tt/ZtFKFjLsm5nSM3+cyUGJRhhowl3F1Dspw0sJHDqbrTnlFGofh
         m9rI9+GZDCEMSvyt6q7ZNuiTnFoIXPxMYuGbHcinmvj5VgyLPJFbhq0HUqzO2Z2Mpqxr
         innbHG2ODLxAAXuRUKjkM1csjfVlLCn1RC20Zn4Yv51JcP4i42zFvCG7NEmZYxYbQ2Qf
         DL+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720644444; x=1721249244;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=flSmarIAFZkeQQAodQ+DS9Q4W6S+b7WB3G19Tv44sVo=;
        b=NpDYCSDeETsQHPhb/TrJkE+Z46ykZmxxtcxjd8W81/6+FfHVZgBiUBEwy99E+ULw2e
         3NvAJC/DbySaiz3tR/trDZ7/Gvm1sg4P7MNn6LICvJxjKCLQC56Sf0BnCUJKMxNe6Mna
         I3iUzreLr4FYY9YEmqqP4AszfOLTMsBQrlsJFUfK4nTLU9oJAYIbH1c58OsEfz0ng8Xg
         y+/jI70cO7I64Cy54O24T2B4ykcznKuJqr/Zv36ItWf7lfGOw5/x8XQ47siDQDX1Ui/I
         AVgLxVxwxif+dIK9bJlGDKP9tgwMz5pnfVheg1g0baKbgPd8eTgJxI+guadRPatzxEy5
         SyvA==
X-Gm-Message-State: AOJu0YwujZfuENgb9oMmwzRokU3Is2ThoynEpk5UGGhj0f9XwNdPOC2S
	n+CoPlhsMlrNYcRigIcsdpXvTVHPbr6FVUB8f1DqolyTxNXE/22Lj2XkcZ+DfZdEsRnqyjoj2WW
	V
X-Google-Smtp-Source: AGHT+IF/Jacp/yCkB9U28GIYly6JHK2yI9xETTieES95dqEAxgiu4yFN6fSs0ScZFEZmgWAYTTt68w==
X-Received: by 2002:a17:902:d488:b0:1fa:d319:e09b with SMTP id d9443c01a7336-1fbb6c0aab0mr58960605ad.0.1720644444371;
        Wed, 10 Jul 2024 13:47:24 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:134a])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6ad5be3sm37698025ad.301.2024.07.10.13.47.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Jul 2024 13:47:23 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH 1/3] debuginfod: factor out common code for responding from an archive
Date: Wed, 10 Jul 2024 13:47:11 -0700
Message-ID: <d87d4d1e0638490c12bb122880d612f41e63670d.1720644134.git.osandov@fb.com>
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

