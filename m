Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0901474B3
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 18:24:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721413491; cv=none; b=gvPbs46deJ6ZvXUzyeMNfPyloSeFkcSAN0DzcHGs6wR5gUjfK+iGCjROX3qJNIcTklAJ2sBCbb793RamoYzapagzOesuRw2LDAHTZHiqIQJOo0bwqHQ9sW3lIcAm0a4I8KX1/taotPn7Cv+T1wKH06MIIm04GBusbIKA0+ZPxDY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721413491; c=relaxed/simple;
	bh=7po6iuMq0yOzagehOqCkbkdF4/fDRh9HsclVqFQrYas=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bs+jGC/58toCO7jyTnB1z+01h8yDYkypwb9hxkREQvhHWIp/AiuQMfpVsd8ZqelyhvPhGhfz/FbmG3NBvaXn4eZyNJF38hOzc6x1GASkUiqYU5IKQnKZDWbHkLk9qKv1uaV+K4v/bQQNC/ToTd3X3rHtpv+ch0NOTNCP7+XPB4k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=czjuL/LU; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="czjuL/LU"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-71871d5e087so1639282a12.1
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 11:24:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721413489; x=1722018289; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4paaUY15mWOyU0kjCYqRC9axHcB+L/opfNmc+xF9ups=;
        b=czjuL/LUdW1J+fgSY6c2bFUzGLu3hoZ56TxRlOURlbXwCqrFNA386LSRdQp/FfcG7d
         mTPdxJakH0x3eG9nVziBlJk768WiVi9eYUm3s8nnuLDaKTUs7hWW0ncumgC5HEXYLxVG
         te3dAv3qdSP4nfZyUmtzrTB+h44529eG0nA8hTlV/yOi9hiZ+CrRv93ppbUgqJWWsoU6
         0UQWbDIETLCR4GrvK0lERFsoCo7HQ8VN2MRZNCq+Fav2UsZZdDjMpGiqFwcSPDixZMXL
         wqOE7LbL4iotZIMnuTrDF41tqh3ZNC/CrhNkVlEqTkJvMfwIGOdrLi9MjcDg2plsO3v3
         iFIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721413489; x=1722018289;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4paaUY15mWOyU0kjCYqRC9axHcB+L/opfNmc+xF9ups=;
        b=srNMrcITM53Avz3y69kYDNFyOTcX8BZFF2HslgCaR8hj2BnSlnaNDqOGaHYHiJd8Ph
         NP9LNYH1ivnXWBZJ8d0kTjlqK/hRJXOYcNtyzrEtTcul4PjJX1WxWQrJO4yFjSHYus54
         6/oFCvn5gBBLBAenAuGuYrBqRhulo0tefV3P+9Wgkty6fTYi9B0WhMrb0noV6fODpI2P
         Lpn2NQYzyFLtXJ4h8kAKsGF4JPebMqFw2zEdDBsrewb0TGPL3tytxlSxXOTicfk5k903
         DNEzetHo/PxTRReuvk0cnPP2dC3quc1OoGk3pf2Q2aI96dpzwx6/SK600x7VUm2py57c
         Zljw==
X-Forwarded-Encrypted: i=1; AJvYcCXFt2orsulWIlWTNBs6NhT8dACZhEIGWJQHwySi7qfzNP45uljXmdPBOUu5jfEk5WcO8sIu2aeI7NHY+6YIzAaqwLRtWCy8tImvh43ghSpv
X-Gm-Message-State: AOJu0Ywa3Sav6WIcJzZe2F4bRoO4I/QtVsyOiVq/W/du58yWS0uJQ7Z+
	RR6MvUMbGvaoBOgRD4FH/iL4XybewJ03KL+AO3paccKfMI+mctI6JrH3gWFsan9Z8fJhXWX/RC4
	A
X-Google-Smtp-Source: AGHT+IElTZK2ehSmBW29wpvbQNdQ6UjRIWkYIkn50lzI/Cpld9iNsmo1wtXBhHQDkoUKUKPCtuoVJg==
X-Received: by 2002:a05:6a21:99a9:b0:1c0:bce5:c19c with SMTP id adf61e73a8af0-1c42288a818mr1221323637.12.1721413489098;
        Fri, 19 Jul 2024 11:24:49 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::7:5d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff4b2f40sm1476344b3a.63.2024.07.19.11.24.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:24:48 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v4 3/7] debuginfod: factor out common code for responding from an archive
Date: Fri, 19 Jul 2024 11:24:34 -0700
Message-ID: <94609d1b0f35e48f6bfead7be7ab40709a36eee5.1721413308.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721413308.git.osandov@fb.com>
References: <cover.1721413308.git.osandov@fb.com>
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

