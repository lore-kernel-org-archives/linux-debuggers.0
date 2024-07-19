Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 698A21474A2
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 18:24:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721413496; cv=none; b=tfVCSUINZ/XTSa2JvNQGA+5iiM0VQ1hUVaeUZ/3gC/iC36GyyR79MSeBMCMl1uGAtEqMeN5fE/wlw4YZniWYm85bmIbcpwWGl+c77hiabJ+sTKrQt9DWjFGmdY0Amqm+nC7i6WqQI5Ve0wyxH14iYAgqAIov/JPMQ6uZcJUreCY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721413496; c=relaxed/simple;
	bh=dwgvgrIp09u3tk89mAn+7NZnPmf+6349+R7yz9bHE14=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QI+oPfBRfktIQhjhlFJM23CFkYx1faHODkwWnzF/MQ3J98xR5Z1veMe2wh9PDtzAHR5jdhCBqGJxTKeyGab9q5fY5Aza67QVPaLZ2fuNG2zgNqcfRkeaJJ3Usc6nqReVf6c/iKO3MDT/R7kf77cx/iarK/XqcfgRl1Vr4c/ptQY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=vdMQns85; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="vdMQns85"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70b1808dee9so851881b3a.2
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 11:24:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721413494; x=1722018294; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jyXA9l38FmGfagMMaEXadf4EZ7z0P5kdHpg/k92mBmI=;
        b=vdMQns85vFTw4Y0yZz1HR1MB3kx6FeO1cvYpbiBTFmZJknDe3MWkYVdU/9RgMDt5Uu
         HciJlSu0j75I+fqgJp9WJrYIVIbx1z/9dFCydyVu16EVdeUUFZZ3XzI0lNofdLJCjQHn
         cKLqoe/yhlg7O03qM8Uq+05RHacsWXa2wOBee2zkokXw01GmOOGo36tCO3H9Xi1vVlCe
         +w3DngxzGns1u3jHl7voSXsge0cAolJdgmz5b8S6usqu8pS5nSpqbeQpF5gVZeZUsmAL
         BvG+l/WWQMzRlocidsjvGpt7uFWd8qL6whIQbyPQuZ9iyCoSlo49LmgNkKgABf5Kv9mM
         azag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721413494; x=1722018294;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jyXA9l38FmGfagMMaEXadf4EZ7z0P5kdHpg/k92mBmI=;
        b=iCfT+oRw44mBQtRxRm7jsQTMfrurPHCywKHnY1QSwVzoJk+6v+TPQZP6loeA1sTMfs
         zvQW9wkcjk5Feyw95pQMtzhvM6ahZ1ryRTb49cHcaQG42H92/M96LVlSih4mUA/8vIVJ
         L7sLBx58sKdEWSW11RExzPnqoNlUu4NU4QXdEmP2U4mhztSexEx8NFRXwHNgEecJU94D
         xo5zbueswddb+jLH+I6rq9p908bU6H9EmKRqHDTTrCOrXWDreCiQoVZV4UBMMcQtp57i
         ykMUX+76g3Rx9ZFvHdqDLTPaeVnuTDOFvM6YvXl8POWB6odkIWKR0aKvm6IgzftHk+uk
         SOzw==
X-Forwarded-Encrypted: i=1; AJvYcCV1fhDdWqGRJ88aSg/lxgbIB50tkQisqEl/wt7DvltWiwU6KrBx2WIG9JVOKGfO75XkhtH/47hjbiov+lXlp9TWC6UFZ9nv29jhajjfxjkL
X-Gm-Message-State: AOJu0Yz2pyVjGmevlFo6YxKAhzU6ZQ1Ts0bw0RlktzbzYFo5E9DdnwNK
	0yfk+H609WY3rgUfomGA+E6xtTKNFsLI5en2gUXzS3pJrt910Y/1AwMJ38V3lmj6vDi54Yelcz9
	Y
X-Google-Smtp-Source: AGHT+IGciLEi44jQa6NMmFS49VBDLw8cc7gQf5i1LwwWAK+SSaSByorIN/KPQVI5I0en+/SKfFc9JA==
X-Received: by 2002:a05:6a21:78a2:b0:1c0:f0be:1536 with SMTP id adf61e73a8af0-1c3fddb3cadmr10683051637.40.1721413494449;
        Fri, 19 Jul 2024 11:24:54 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::7:5d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff4b2f40sm1476344b3a.63.2024.07.19.11.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:24:53 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v4 7/7] debuginfod: populate _r_seekable on request
Date: Fri, 19 Jul 2024 11:24:38 -0700
Message-ID: <7805d255fdf503cb1154fe168c62347c3ed8a559.1721413308.git.osandov@fb.com>
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

