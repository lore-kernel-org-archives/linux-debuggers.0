Received: from mail-il1-f181.google.com (mail-il1-f181.google.com [209.85.166.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32AAC185623
	for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 10:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.166.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721037900; cv=none; b=GtqpmZxZTKVfP/hF/i+tUBH72S24LNM/ew5ICCrDVW/4ItrEt5VYD4cx0/7Ga3yubdTkRNj6CpMWYXkBwiVeRZ82fOV/9+6VMfnlOWJV0k48/etFjgzHzBwcTPTLNJIrveVGUbxYNWkHP+TWVLIeZChg9JbtaQJAoM7Df/OlesU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721037900; c=relaxed/simple;
	bh=09/FTFXx7nNMLaP+6pAAsVYe92EoSLNwEglmFj2QvvI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V5dW1Yr08J8S59+riCcNdxkDsGNKID/irEiTzOnk9YjRQZ9Yqib1HjhQRWnh+ygHrrOXWRYD6L12T5p9MQRnvMvnGImdMzGb8Awgv5IP+zQ8ugieENbGQhWnVGnsb/UZbtmVu6lVVOheIsWTlW1FaW8hykieWHrMQZKyQjs+Cg4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=GawlTxXi; arc=none smtp.client-ip=209.85.166.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="GawlTxXi"
Received: by mail-il1-f181.google.com with SMTP id e9e14a558f8ab-376266a65c8so18246455ab.3
        for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 03:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721037898; x=1721642698; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tAZSr6VPPWH+Hr6qOOXXtzd7LQWvSzQ8JSSEm7K5XiQ=;
        b=GawlTxXig7R6JeZeoSB9X8Ui1sxGvoidYjUoiTEac3UWy4Qi2EYtRbZsRJOEPqlKD3
         Apa7xH8Eoe1bpfZTyS5AfIaUxmdjOieuFV2M7U9gK42D4LrKd8yCfr9stKnL75EOTW3n
         USiFWE+nFQ/mjxBylHMZNDIineBuFQ10O/oEDdBgnKTb+cN5L1zEa8Ksf1mCQmR+VxrN
         VPoXdqWk6WCbLjtHOy68qHNWNnChIEneJLWJjoVTyEIZAaLPmye3O9+bFa/oFw9n4Mze
         OdOkZqdxuUZNuW3EFMsQtNdV9cy30XQf8CbpoW2MyK2tkQqlVNRsjsrF1geHuz4uw1/s
         BcWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721037898; x=1721642698;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tAZSr6VPPWH+Hr6qOOXXtzd7LQWvSzQ8JSSEm7K5XiQ=;
        b=EB2x8pKXHyad7zC8k6vp0ZXbAsTOQrMKxK/wLcumB13FSoUjGag1XBIG1VBK385UfB
         c9rIuXSAnhUln53YdmEDBo0lUvI0Jwzv2/O8lr2VrrkTG74FjGQqlSRsCwAqAnaupK6z
         dj9Hv7cDKUL++btCXyDnAVUb6tK+Ri/aT/i95b57tLTDZXHBkDFFU29mjnQlYTRZzUjx
         KhJ3QpWhUSYml2Wjv/5WCBCVOcMskrbC3l3ybdk1S9oSEMQFDR/vaNxdRPiIpEw8kj5E
         L15uny2sg4S4Gc5Ne4YsPVH/proYmOSJ4NaBSj68qkvKGC6tQ+6AsXJzyMywAaXqRCZt
         VBbA==
X-Gm-Message-State: AOJu0Yw2gdVs6o66zsohKzFkvX7rt2rkCTRuSZTm19ryib40KXy14lfs
	EDPf3mLrLX0AT7ohOiIPBQReh0UJOPVVQIyC6KvvD6yveUTUtcHlHnt0wFUz7XNwL5NRkgCq/Vs
	U
X-Google-Smtp-Source: AGHT+IGYMCLLUttpsyMBLFzFjYuSrUNFbrIx1GdJjT4Rxo+2iSEnpOjo28u7JAxnN3F2VaCEbuwfyA==
X-Received: by 2002:a05:6e02:1a88:b0:374:a6a3:333b with SMTP id e9e14a558f8ab-38a596cab7dmr229741615ab.28.1721037898197;
        Mon, 15 Jul 2024 03:04:58 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2c4d3sm3049100a12.48.2024.07.15.03.04.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:04:57 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH v2 5/5] debuginfod: populate _r_seekable on request
Date: Mon, 15 Jul 2024 03:04:36 -0700
Message-ID: <ad7b3cb4b6568957fba6ddfd5a0cfe97fb68d76b.1721037200.git.osandov@fb.com>
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

Since the schema change adding _r_seekable was done in a backward
compatible way, seekable archives that were previously scanned will not
be in _r_seekable.  Whenever an archive is going to be extracted to
satisfy a request, check if it is seekable.  If so, populate _r_seekable
while extracting it so that future requests use the optimized path.

The next time that BUILDIDS is bumped, all archives will be checked at
scan time.  At that point, checking again will be unnecessary and this
commit can be reverted.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx | 76 +++++++++++++++++++++++++++++++++++----
 1 file changed, 70 insertions(+), 6 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index f120dc90..6fb4627c 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -2737,6 +2737,7 @@ handle_buildid_r_match (bool internal_req_p,
     }
 
   // no match ... look for a seekable entry
+  bool populate_seekable = true;
   unique_ptr<sqlite_ps> pp (new sqlite_ps (db, "rpm-seekable-query",
                                            "select type, size, offset, mtime from " BUILDIDS "_r_seekable "
                                            "where file = ? and content = ?"));
@@ -2745,6 +2746,9 @@ handle_buildid_r_match (bool internal_req_p,
     {
       if (rc != SQLITE_ROW)
         throw sqlite_exception(rc, "step");
+      // if we found a match in _r_seekable but we fail to extract it, don't
+      // bother populating it again
+      populate_seekable = false;
       const char* seekable_type = (const char*) sqlite3_column_text (*pp, 0);
       if (seekable_type != NULL && strcmp (seekable_type, "xz") == 0)
         {
@@ -2836,16 +2840,39 @@ handle_buildid_r_match (bool internal_req_p,
       throw archive_exception(a, "cannot open archive from pipe");
     }
 
-  // archive traversal is in three stages, no, four stages:
-  // 1) skip entries whose names do not match the requested one
-  // 2) extract the matching entry name (set r = result)
-  // 3) extract some number of prefetched entries (just into fdcache)
-  // 4) abort any further processing
+  // If the archive was scanned in a version without _r_seekable, then we may
+  // need to populate _r_seekable now.  This can be removed the next time
+  // BUILDIDS is updated.
+  if (populate_seekable)
+    {
+      populate_seekable = is_seekable_archive (b_source0, a);
+      if (populate_seekable)
+        {
+          // NB: the names are already interned
+          pp.reset(new sqlite_ps (db, "rpm-seekable-insert2",
+                                  "insert or ignore into " BUILDIDS "_r_seekable (file, content, type, size, offset, mtime) "
+                                  "values (?, "
+                                  "(select id from " BUILDIDS "_files "
+                                  "where dirname = (select id from " BUILDIDS "_fileparts where name = ?) "
+                                  "and basename = (select id from " BUILDIDS "_fileparts where name = ?) "
+                                  "), 'xz', ?, ?, ?)"));
+        }
+    }
+
+  // archive traversal is in five stages:
+  // 1) before we find a matching entry, insert it into _r_seekable if needed or
+  //    skip it otherwise
+  // 2) extract the matching entry (set r = result).  Also insert it into
+  //    _r_seekable if needed
+  // 3) extract some number of prefetched entries (just into fdcache).  Also
+  //    insert them into _r_seekable if needed
+  // 4) if needed, insert all of the remaining entries into _r_seekable
+  // 5) abort any further processing
   struct MHD_Response* r = 0;                 // will set in stage 2
   unsigned prefetch_count =
     internal_req_p ? 0 : fdcache_prefetch;    // will decrement in stage 3
 
-  while(r == 0 || prefetch_count > 0) // stage 1, 2, or 3
+  while(r == 0 || prefetch_count > 0 || populate_seekable) // stage 1-4
     {
       if (interrupted)
         break;
@@ -2859,6 +2886,43 @@ handle_buildid_r_match (bool internal_req_p,
         continue;
 
       string fn = canonicalized_archive_entry_pathname (e);
+
+      if (populate_seekable)
+        {
+          string dn, bn;
+          size_t slash = fn.rfind('/');
+          if (slash == std::string::npos) {
+            dn = "";
+            bn = fn;
+          } else {
+            dn = fn.substr(0, slash);
+            bn = fn.substr(slash + 1);
+          }
+
+          int64_t seekable_size = archive_entry_size (e);
+          int64_t seekable_offset = archive_filter_bytes (a, 0);
+          time_t seekable_mtime = archive_entry_mtime (e);
+
+          pp->reset();
+          pp->bind(1, b_id0);
+          pp->bind(2, dn);
+          pp->bind(3, bn);
+          pp->bind(4, seekable_size);
+          pp->bind(5, seekable_offset);
+          pp->bind(6, seekable_mtime);
+          rc = pp->step();
+          if (rc != SQLITE_DONE)
+            obatched(clog) << "recording seekable file=" << fn
+                           << " sqlite3 error: " << (sqlite3_errstr(rc) ?: "?") << endl;
+          else if (verbose > 2)
+            obatched(clog) << "recorded seekable file=" << fn
+                           << " size=" << seekable_size
+                           << " offset=" << seekable_offset
+                           << " mtime=" << seekable_mtime << endl;
+          if (r != 0 && prefetch_count == 0) // stage 4
+            continue;
+        }
+
       if ((r == 0) && (fn != b_source1)) // stage 1
         continue;
 
-- 
2.45.2

