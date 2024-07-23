Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B221914600C
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 22:35:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774159; cv=none; b=HVuUZzoytdup5kP1TDxWKtgPM9qt+fJRTmsmO3ti47mmtQilnDD6f3c3dI2oZsxHXxfh5+JBhFT1l234e0Pp6+8koJctOzES2uxxrwVftVcgnd6/8OPOrllUZeCsmStyRpGKCdhWtwgiLtvgP3lIF/ri5v3Tfujr6htqvpSxoaU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774159; c=relaxed/simple;
	bh=7po6iuMq0yOzagehOqCkbkdF4/fDRh9HsclVqFQrYas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=A6wsjHRT0R+SvibgYhTKugp2P3b8cQkrXdMzPPBPc0Eyif770+YfvIEbmTk2evq+ewsXo33qwdiox41eo/UINvOoarXo4MhYJ9WibNlqcSg/eBzDOqg6u5XqpI1zu/RmYWTY+P81iGF4GpK6xkf7AQyLNNak4ymAN03eKZDBXIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=En9GJhxk; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="En9GJhxk"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70d1cbbeeaeso1766722b3a.0
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 15:35:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721774157; x=1722378957; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4paaUY15mWOyU0kjCYqRC9axHcB+L/opfNmc+xF9ups=;
        b=En9GJhxk4vbHxkWMKxsDAo+Q343rM0I/76CcU2gg7PlX6dXCMgeAkDDz08HTbt91iA
         ypzkTp62O/TqMb7YYksp2EUje1j7F99W9EYDrsLNZUqanP1ddUgL5FJbIBcZLPnlez8t
         AWdltxTYrwXpL/xlY5sfMeGFFVzGWXUMxLR1d7MTKQt8TY3rQqGKs+USH+Rzsv+Ucbdz
         SrxWuWPhQf68ckCfCdIziLJtYRu0/AOXBNqv2zjH4/QF8r2RQt9c0/0aklSPiUiusqGG
         Jv5VP3anyD0K0+lrxGfvYR//kSR4szgZGnswgBYYOPEQ9Dkg3ibIn7I0rT/EzKwe2D5z
         4rxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721774157; x=1722378957;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4paaUY15mWOyU0kjCYqRC9axHcB+L/opfNmc+xF9ups=;
        b=cKpwPMZn5gN9Uze4P/pfJ0hjVqIFMTcsg4XP2UZmvg5SKVh/wAltT+IwrzLNmVZkXp
         KGOnaRm7AJmHMgKHTh8bSOTyarxESJag23csoUo3KRnrqTh4v9srzBfitY8LYAVm+6xu
         P91/MUWOSugJ6AnHQg2UMty7QxJg73vXvJKOxJM2F7OFrr7+2drTzo19/ddRElky3K9P
         aGw9Owj82kyc2+kh/n2JI+mc6/H3XDgjGG4GFhQZ5U1nQCPhsmo1IiLbRuMiOrGhuwUE
         w5V4V6VFMetjJlQaEXBFaW1fP+cZoAglnbML/V/LAkHxsZxwOGwhdp6yP2mroiWaJeTR
         WNNg==
X-Forwarded-Encrypted: i=1; AJvYcCVcWQsktAn7LlGYS7MhLuk0lxWFwntxJiCPtIg6ySuB57xjWUiNLsv8pGgSfY53PjRBTDKE+0nOLtInSgfAKg2BUdUTvDHxpjnkWe7xIBcC
X-Gm-Message-State: AOJu0YySw3C5NRcjoGYrXKVLoB0w81f0w+syVaXf6xc42kRSy3xfqXsy
	aQoqOkuIjWh5IHKvP3hKFNlymd45HlFKtu9kNa51vo+IYKTqpVXq8HOhGBvVLaMfDE61HwtTfi9
	Z
X-Google-Smtp-Source: AGHT+IHoklk6xLktE+wkKzHVFPE9dC7QZnMbV3xke+zpxwrLT9RZkfCyfMb2FaMXwEX2PhPQnw5Tbw==
X-Received: by 2002:a05:6a00:238d:b0:70d:2ba1:2402 with SMTP id d2e1a72fcca58-70e9971b63bmr1469346b3a.29.1721774156917;
        Tue, 23 Jul 2024 15:35:56 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:b6d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d241803fdsm4308079b3a.220.2024.07.23.15.35.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 15:35:56 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	Aaron Merey <amerey@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v5 3/7] debuginfod: factor out common code for responding from an archive
Date: Tue, 23 Jul 2024 15:35:39 -0700
Message-ID: <a0329a92ebb38e9ae0026a9fae9beb57ac729652.1721773977.git.osandov@fb.com>
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

handle_buildid_r_match has two very similar branches where it optionally
extracts a section and then creates a microhttpd response.  In
preparation for adding a third one, factor it out into a function.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx | 213 +++++++++++++++++---------------------
 1 file changed, 96 insertions(+), 117 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index 92022f3d..24702c23 100644
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

