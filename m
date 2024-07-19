Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09A9A71747
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 08:32:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377943; cv=none; b=eV928TM9/bQr7IeMEggDuZTu/oNAsq1cPLPcxIWMBlvPVrEgznC9JH+PoUzjpWdEAGAmY7mGVYzA9lknwqAQq4IHid0LCZdaucBE0/p9Dap9t5XgkM544b/TtCu3CYY+OZxInXkUHn5qoxm1kHPW1aY2GarAGapEDaV1mCKGInY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377943; c=relaxed/simple;
	bh=agDSi8xWCBdvDIXT0FELTzOpR+F7mJtkbuWXMvK/saY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ra0fTCJ+fUcLmVPViGwxb63WL6y5KpvD99ilMQzv4dlbJ05XGiy15QglnGCGyDYKAt4OY2U9i97Ol52KDhw9YVg5AGoS6qdExNtv74n4yWRVXN6oNwwBvGf2boTnNFIxKJm4mvMfeAhGRlPb+829q0FLbzDOc0/ngxUojXhqlLY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=mBMnmt2Y; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="mBMnmt2Y"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb4a807708so15733145ad.2
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 01:32:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721377941; x=1721982741; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mLK46KT51dAP0a3tOktqrPFE0gq0ljUrBtqHmp2qrN4=;
        b=mBMnmt2YDYJMTN+pJ6eVwKSWjE8i0L2zRDzzErRXuzAogdj+1y3RvyPbaad+3wylmi
         AArXbVsydI/yWVcN9fQ+k5MQ0cd97uJo8O4SGovnJU8QVfJiK0/wAJrOR61zGEcrtriQ
         JFsCuglG6RGX8mnGDuCvZMf4IUvCsQmkHMCsyGJ+RvSEs9AKlf9T/pMoAsCKQUhZ5nwS
         rf/v1BKhVJKx0wAg1fKa9LNAmluHM5DUyRFG0yLKhb4se7sbIPQJKID1+7UjsEQeERAA
         VNAKq+e3vch1PQ39k44Otq1Qt/YYEiyL3i4BttSLxqxV4Z6NoCNoeRjrRau3g0rp2TrT
         d7tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721377941; x=1721982741;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mLK46KT51dAP0a3tOktqrPFE0gq0ljUrBtqHmp2qrN4=;
        b=ZIL504EJgwITQXhweA79OQMQCGaUbvkSWWHXZJ6eLlroWS+v5HpOJ82R/tgE0BQgJd
         /PDY1MESEZHLvabmk2iasNzMJUjkDHrLTgUd6WzH7wjQD9rbGEv6o/b/q5MTe0I1nfaA
         jZQUIfi3IJwjthu5PS5Uhw89IY9J40Cc4wAULsKNDphfiyvYYrYs7p266yFCpPimYVG+
         2aLEGqCVzCZWoDbBWH8fC3hLDlwBW4WykGbWGQ9Fn5YmNFB56no1QftR4NZ+eNIZusYz
         VJNejOzm6ufF38CU01FCuyomrwaA1h91XGSinL89ynU9L0MDgCo4sPyTuQSGH/1L0V0+
         g9Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUqfWVEYP3aeUsvkfmqoBJ8nrbpiQbpty2mFF0zxB8IY+/fU3b82PHG+bLdiEB6aC8PQHz3crP8Ggu0A7OgLNCaJ9ZpTbIdAk1q5YbIhy/j
X-Gm-Message-State: AOJu0Yztz5AobzLgjg/D+saaVK8HEEMaR2l0SNDKpqs9jXd5PDwANXJ7
	LnlVi5wtJgsWtbESzZolmgDp05LedHeYA5wPpBmQlNAiLtlWBG6njul8+VoKxQA3MfWztsZc4H3
	N
X-Google-Smtp-Source: AGHT+IG72SUBZAvwMALXqzTD5+dohWTHp5gVIDoExuDoyD6/TSz7HDqAFXAzhLZxkmWRbAXwmEcVBA==
X-Received: by 2002:a17:902:ea04:b0:1fc:611a:bb3 with SMTP id d9443c01a7336-1fc611a0f69mr36407365ad.16.1721377941311;
        Fri, 19 Jul 2024 01:32:21 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b49467sm8832375ad.6.2024.07.19.01.32.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:32:20 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v3 7/7] debuginfod: populate _r_seekable on request
Date: Fri, 19 Jul 2024 01:32:03 -0700
Message-ID: <99e9dcbd8c29a1be4ac46c74b9e59499fc0fce07.1721377314.git.osandov@fb.com>
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

Since the schema change adding _r_seekable was done in a backward
compatible way, seekable archives that were previously scanned will not
be in _r_seekable.  Whenever an archive is going to be extracted to
satisfy a request, check if it is seekable.  If so, populate _r_seekable
while extracting it so that future requests use the optimized path.

The next time that BUILDIDS is bumped, all archives will be checked at
scan time.  At that point, checking again will be unnecessary and this
commit (including the test case modification) can be reverted.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx        | 76 +++++++++++++++++++++++++++++---
 tests/run-debuginfod-seekable.sh | 45 +++++++++++++++++++
 2 files changed, 115 insertions(+), 6 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index 677eca30..d8a02fb5 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -2740,6 +2740,7 @@ handle_buildid_r_match (bool internal_req_p,
     }
 
   // no match ... look for a seekable entry
+  bool populate_seekable = ! passive_p;
   unique_ptr<sqlite_ps> pp (new sqlite_ps (internal_req_p ? db : dbq,
                                            "rpm-seekable-query",
                                            "select type, size, offset, mtime from " BUILDIDS "_r_seekable "
@@ -2749,6 +2750,9 @@ handle_buildid_r_match (bool internal_req_p,
     {
       if (rc != SQLITE_ROW)
         throw sqlite_exception(rc, "step");
+      // if we found a match in _r_seekable but we fail to extract it, don't
+      // bother populating it again
+      populate_seekable = false;
       const char* seekable_type = (const char*) sqlite3_column_text (*pp, 0);
       if (seekable_type != NULL && strcmp (seekable_type, "xz") == 0)
         {
@@ -2840,16 +2844,39 @@ handle_buildid_r_match (bool internal_req_p,
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
@@ -2863,6 +2890,43 @@ handle_buildid_r_match (bool internal_req_p,
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
 
diff --git a/tests/run-debuginfod-seekable.sh b/tests/run-debuginfod-seekable.sh
index d546fa3d..c787428f 100755
--- a/tests/run-debuginfod-seekable.sh
+++ b/tests/run-debuginfod-seekable.sh
@@ -138,4 +138,49 @@ kill $PID1
 wait $PID1
 PID1=0
 
+if type sqlite3 2>/dev/null; then
+	# Emulate the case of upgrading from an old server without the seekable
+	# optimization by dropping the _r_seekable table.
+	sqlite3 "$DB" 'DROP TABLE buildids10_r_seekable'
+
+	env LD_LIBRARY_PATH=$ldpath ${abs_builddir}/../debuginfod/debuginfod $VERBOSE -d $DB -p $PORT2 -t0 -g0 --fdcache-prefetch=0 -v -R -U R D > vlog$PORT2 2>&1 &
+	PID2=$!
+	tempfiles vlog$PORT2
+	errfiles vlog$PORT2
+
+	wait_ready $PORT2 'ready' 1
+
+	check_all $PORT2
+
+	# The first request per archive has to do a full extraction.  Check
+	# that the rest used the seekable optimization.
+	curl -s http://localhost:$PORT2/metrics | awk '
+/^http_responses_total\{result="seekable xz archive"\}/ {
+	print
+	seekable = $NF
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
+	if (full > 4) {
+		print "error: too many (" full ") full extractions" > "/dev/stderr"
+		exit 1
+	}
+}'
+
+	tempfiles $DB*
+
+	kill $PID2
+	wait $PID2
+	PID2=0
+fi
+
 exit 0
-- 
2.45.2

