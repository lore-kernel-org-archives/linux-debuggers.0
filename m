Received: from mail-oa1-f54.google.com (mail-oa1-f54.google.com [209.85.160.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8409514600C
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 22:36:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774165; cv=none; b=VgUkdBtb5CIAEeyoBAmE8LMkdsPiKLim9Sd1e2ij2cn2OhPxnD5sl6/WSgbockc1ev+onCcPDZMUQjnJIsGRibqGaDbA3Ws3vfGDwqST86dtT//uq3dZ8pJ/sKD6vIQZ2nr44misZdzhdeAMuCnzIK30YOHA1lqUUs/Ut9BFG7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774165; c=relaxed/simple;
	bh=BfGpjmGuoVX1MQUaPOxTnK/QUxIgLJspepRX69c4aAA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=O6mBUnbkw28ozA7XNaEsGOJ39oDtpjbpYEyVW16lNOItdYdLZFRwxOsqiBkTxJxbqPILMoGA7ZgKmw5CQggJ0PtPtpqFBkRNghtHYn507fQTqOiFvksUDSZqcc8sVGaUs4sSKz7AMO34ofKU5hrvAqtvwlGdh/Ag+QZfRrMXxUc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=SdrrKFn9; arc=none smtp.client-ip=209.85.160.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="SdrrKFn9"
Received: by mail-oa1-f54.google.com with SMTP id 586e51a60fabf-26109c97728so2988047fac.0
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 15:36:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721774163; x=1722378963; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tGeP9/8dOlqvEia1+uTBIxya97s19VhY1EsZjtEjEEA=;
        b=SdrrKFn9cj6BonL3cmsbtMK5vEEuS6uA/N6tuyOe074UEU+0qgdKp52bYanp/rnYrB
         6/yD1hmJzhaNMohxwscp/wtWXUvJ1zo28i1vf3RlVB15EadnoIq0MZ8eeri0ukGAtmIC
         ME99LcW2QrpVF4RoDFEf1TKhz5ZT9MlYSBo6WsqKOkWQNHAmf1qHQuoDuXzC26Rb9ZKK
         MVpJAqhwcCMdOKpj+RWK+JYdgN96fuqnF8qnmoVHbVAzoQiCEJbMMMNAF9qEVSm1kaK6
         P3s5NUw0oaDwcBiJs5cao/iph0BsHau4hatKVboHiXSZNUuvwPOE8x+w6q/vcXZbeiCi
         1vLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721774163; x=1722378963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tGeP9/8dOlqvEia1+uTBIxya97s19VhY1EsZjtEjEEA=;
        b=AiAfv7Q6lkU3UFZa6qL1pTP/CovIZtw4FN4tQWF0EQDPKGfcczCn2nUtcO4XL+66ft
         AYOmR1Ao5r+LuVbHqZ1HQeM/gmPMAs9m+JMH7XXQz9wHOBxYYIhc99BE4G7ykDbj6OSa
         NoR36dCfnRvM7KI8e3gZr5pUilg1JM37rCu+GrnY8D9qFDJySH5kJdnqdP/fObhBFjeI
         mJMY4BkIsMQh47iOjFngtb3YY4uEaVjmH5hGDTB95fUkbcOP42YLwb2wZdWPW6/mxLAp
         sIH4USbojzJSht72Q+fKE6QWwMP8k79Pq+e5oZ6eN2MzDQEhlh/TGKyy31LaYFZc4AyQ
         se6w==
X-Forwarded-Encrypted: i=1; AJvYcCXf7huC/C99w/DQu9nSGBcjzJ4EI5CTD8lLZxQfvA7QcMTFDXQljZJ2iXRcsZuuKX0dNvDEkc0opJNklJm3lKGkPR1Q+TQf7ljXTlHK6MjS
X-Gm-Message-State: AOJu0YzIGg4Xe9Mg8jKxbRnbHK6Ijw+oXb/J02ox4pDdBLWEvbMai8nF
	gJ+NRA/HgCMvgmZIIu+jH66PgVvdUnWBgSh43qyp826ktk5JdFWl7JjgKVgBFPc=
X-Google-Smtp-Source: AGHT+IEJQVDF0Rq765DFkCykIiWb877J7ZNCLCR7g36NI44A/XBcIQAvXhel1QkKqY12rgglP9wPeQ==
X-Received: by 2002:a05:6871:207:b0:254:b5b9:354e with SMTP id 586e51a60fabf-26487692f1dmr1173858fac.19.1721774162660;
        Tue, 23 Jul 2024 15:36:02 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:b6d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d241803fdsm4308079b3a.220.2024.07.23.15.36.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 15:36:02 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	Aaron Merey <amerey@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v5 7/7] debuginfod: populate _r_seekable on request
Date: Tue, 23 Jul 2024 15:35:43 -0700
Message-ID: <1429197ef17eaca1c72abb29c4763938a8f0bb10.1721773977.git.osandov@fb.com>
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
 tests/run-debuginfod-seekable.sh | 48 ++++++++++++++++++++
 2 files changed, 118 insertions(+), 6 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index 5fe2db0c..fb7873ae 100644
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
index 4dd3b71e..52a5ab1e 100755
--- a/tests/run-debuginfod-seekable.sh
+++ b/tests/run-debuginfod-seekable.sh
@@ -141,4 +141,52 @@ kill $PID1
 wait $PID1
 PID1=0
 
+if type sqlite3 2>/dev/null; then
+	# Emulate the case of upgrading from an old server without the seekable
+	# optimization by dropping the _r_seekable table.
+	sqlite3 "$DB" 'DROP TABLE buildids10_r_seekable'
+
+	env LD_LIBRARY_PATH=$ldpath ${abs_builddir}/../debuginfod/debuginfod $VERBOSE \
+		-d $DB -p $PORT2 -t0 -g0 \
+		--fdcache-mbs=100 --fdcache-mintmp=0 --fdcache-prefetch=0 \
+		-R -U R D > vlog$PORT2 2>&1 &
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

