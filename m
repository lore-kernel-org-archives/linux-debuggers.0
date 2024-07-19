Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 195471474AD
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 18:24:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721413492; cv=none; b=Njidm0G6lEfzEzZ22DFElEzxuK+pF3FDk23qZrf4cYv2nwFpJlYMHSyNXKMkYs1e64DAhGVkHDpEoihXKiYS+7xVypSSkc5i7pa4wFyRz3lUkIBDRDkdOR/b70IDd6r/PVGXeGH4PTYKwyL7M4fU3IZOSSOfd8NWS/P92BGi3e4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721413492; c=relaxed/simple;
	bh=HOfAHJo///BN1FVi73kIPNB998r4isI11ggmhEvmArI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=KR+2DkKEFuMGRwmBCUqbPkGGDWRSayyJbh7/wojaSm1jSZxz7zfzBUO3Qz3g4KMhAnKBzKvJZobGEBCjNw3SsJo9vnH+OxDCGWIRW4KMD43V++PNvTOaVwP7qjstR20VdiP52IFEY9bp1ojlE0qcHzLWwo0MjMBoUg8ZmoOqj8M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=Z0I+gizm; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="Z0I+gizm"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-70b4a8a5587so773753b3a.2
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721413490; x=1722018290; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4Rj/ZnOVSL02OnzUupYCg3NbyqN5BwrWVZX7PHvJeg=;
        b=Z0I+gizmv5xM2mHdZOWa3q1Pi+VVXpg33X4MaHDvBa34Cl/ZxI8uiP3YHwM4RMr/h9
         EYoiBHbo99nxrQQQitnE7VmPilSbm3uq1q3oZmSfgsPIH1hn/nQY2Q3jUbdv9XsdR0OB
         KquBXoTFtpS/68bENrRlMCbx8ud2u7grguJGreqw1/VlMdIBZGbJh/Y8/rkozwCIK3ZL
         1kHJVzCxbxStKjoDRjB0qAkv+BTmxLwW7mPL1cyfeFpt5hjsbH7guQ1gcbygYgHFbsc4
         mBQkQ6EKsygod8ynrrxnJUbtK53frBJMxxv2BEv8D/iVczetp/0jd4EwBsvqqqoNKtbr
         CrNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721413490; x=1722018290;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4Rj/ZnOVSL02OnzUupYCg3NbyqN5BwrWVZX7PHvJeg=;
        b=cGPioDEZZZnnuy2FQ+dh1XV2OpX8kCH/zvTwreou7YcxzyKSbtcPsMs+/+4+unSB/4
         qub1XVklGzVURUdj2saeWFDDjaDuhzOUau2qe/HarpWoDIV1SRXyMjTH8hdSTcaXm0hX
         76GDL9f528vSetbOwiOJky1Pv5//pdi+vzirv8qjGqKBz9HVfnkQm4T3kkE5yHxo+YtT
         bdGMHhNCQhVn46wmxQvPS36xXzdWImrsp7FlL0d0myK4q0/DsJ4DJnxEkjOaluDKY0oN
         /L5MPJRtMrhODdqdGrOd45QRHcp8rMWt8+yJhLwAxXfhKDi3nyVDzb06+Iu2V4uzMkbK
         hMSw==
X-Forwarded-Encrypted: i=1; AJvYcCVK7ZHCWj8YiyKKcLpZdO4vRTiG8ATiKdt3ZLd1juiFTKmhVPKTv48qc0FyrWmewQj1t0igR2rZlUNnf5w5ZDsNIJaH9Uf3P2bKbKY5KxuY
X-Gm-Message-State: AOJu0YymetooyJwEFY6ANddqHFugIViNthUXCZ1Bkf/RulncoWZZ31Ir
	VLgAR2bBtJHZ4Ajn7b62xdTuJQfk+RPqWHH+BxHKA0caoHu0rSm22KLJU7RNsCU=
X-Google-Smtp-Source: AGHT+IEt+E4bwRLRzr0ecVo/0xqnOq5NOesHSN2zgSfrnheLa82O6DmEHXBMRZypL09r1f7Ec4x8Rw==
X-Received: by 2002:a05:6a00:244b:b0:70b:1b51:b8af with SMTP id d2e1a72fcca58-70d0877f17cmr848846b3a.19.1721413490275;
        Fri, 19 Jul 2024 11:24:50 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::7:5d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff4b2f40sm1476344b3a.63.2024.07.19.11.24.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:24:49 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v4 4/7] debugifod: add new table and views for seekable archives
Date: Fri, 19 Jul 2024 11:24:35 -0700
Message-ID: <8354294593abfcd9cfc1f83d259921a5da0d55c3.1721413308.git.osandov@fb.com>
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

In order to extract a file from a seekable archive, we need to know
where in the uncompressed archive the file data starts and its size.
Additionally, in order to populate the response headers, we need the
file modification time (since we won't be able to get it from the
archive metadata).  Add a new table, _r_seekable, keyed on the archive
file id and entry file id and containing the size, offset, and mtime.
It also contains the compression type just in case new seekable formats
are supported in the future.

In order to search this table when we get a request, we need the file
ids available.  Add the ids to the _query_d and _query_e views, and
rename them to _query_d2 and _query_e2.

This schema change is backward compatible and doesn't require
reindexing.  _query_d2 and _query_e2 can be renamed back the next time
BUILDIDS needs to be bumped.

Before this change, the database for a single kernel debuginfo RPM
(kernel-debuginfo-6.9.6-200.fc40.x86_64.rpm) was about 15MB.  This
change increases that by about 70kB, only a 0.5% increase.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 debuginfod/debuginfod.cxx | 34 ++++++++++++++++++++++++----------
 1 file changed, 24 insertions(+), 10 deletions(-)

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index 24702c23..b3d80090 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -265,25 +265,39 @@ static const char DEBUGINFOD_SQLITE_DDL[] =
   "        foreign key (content) references " BUILDIDS "_files(id) on update cascade on delete cascade,\n"
   "        primary key (content, file, mtime)\n"
   "        ) " WITHOUT_ROWID ";\n"
+  "create table if not exists " BUILDIDS "_r_seekable (\n" // seekable rpm contents
+  "        file integer not null,\n"
+  "        content integer not null,\n"
+  "        type text not null,\n"
+  "        size integer not null,\n"
+  "        offset integer not null,\n"
+  "        mtime integer not null,\n"
+  "        foreign key (file) references " BUILDIDS "_files(id) on update cascade on delete cascade,\n"
+  "        foreign key (content) references " BUILDIDS "_files(id) on update cascade on delete cascade,\n"
+  "        primary key (file, content)\n"
+  "        ) " WITHOUT_ROWID ";\n"
   // create views to glue together some of the above tables, for webapi D queries
-  "create view if not exists " BUILDIDS "_query_d as \n"
+  // NB: _query_d2 and _query_e2 were added to replace _query_d and _query_e
+  // without updating BUILDIDS.  They can be renamed back the next time BUILDIDS
+  // is updated.
+  "create view if not exists " BUILDIDS "_query_d2 as \n"
   "select\n"
-  "        b.hex as buildid, n.mtime, 'F' as sourcetype, f0.name as source0, n.mtime as mtime, null as source1\n"
+  "        b.hex as buildid, 'F' as sourcetype, n.file as id0, f0.name as source0, n.mtime as mtime, null as id1, null as source1\n"
   "        from " BUILDIDS "_buildids b, " BUILDIDS "_files_v f0, " BUILDIDS "_f_de n\n"
   "        where b.id = n.buildid and f0.id = n.file and n.debuginfo_p = 1\n"
   "union all select\n"
-  "        b.hex as buildid, n.mtime, 'R' as sourcetype, f0.name as source0, n.mtime as mtime, f1.name as source1\n"
+  "        b.hex as buildid, 'R' as sourcetype, n.file as id0, f0.name as source0, n.mtime as mtime, n.content as id1, f1.name as source1\n"
   "        from " BUILDIDS "_buildids b, " BUILDIDS "_files_v f0, " BUILDIDS "_files_v f1, " BUILDIDS "_r_de n\n"
   "        where b.id = n.buildid and f0.id = n.file and f1.id = n.content and n.debuginfo_p = 1\n"
   ";"
   // ... and for E queries
-  "create view if not exists " BUILDIDS "_query_e as \n"
+  "create view if not exists " BUILDIDS "_query_e2 as \n"
   "select\n"
-  "        b.hex as buildid, n.mtime, 'F' as sourcetype, f0.name as source0, n.mtime as mtime, null as source1\n"
+  "        b.hex as buildid, 'F' as sourcetype, n.file as id0, f0.name as source0, n.mtime as mtime, null as id1, null as source1\n"
   "        from " BUILDIDS "_buildids b, " BUILDIDS "_files_v f0, " BUILDIDS "_f_de n\n"
   "        where b.id = n.buildid and f0.id = n.file and n.executable_p = 1\n"
   "union all select\n"
-  "        b.hex as buildid, n.mtime, 'R' as sourcetype, f0.name as source0, n.mtime as mtime, f1.name as source1\n"
+  "        b.hex as buildid, 'R' as sourcetype, n.file as id0, f0.name as source0, n.mtime as mtime, n.content as id1, f1.name as source1\n"
   "        from " BUILDIDS "_buildids b, " BUILDIDS "_files_v f0, " BUILDIDS "_files_v f1, " BUILDIDS "_r_de n\n"
   "        where b.id = n.buildid and f0.id = n.file and f1.id = n.content and n.executable_p = 1\n"
   ";"
@@ -2557,7 +2571,7 @@ handle_buildid (MHD_Connection* conn,
   if (atype_code == "D")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-d",
-                          "select mtime, sourcetype, source0, source1 from " BUILDIDS "_query_d where buildid = ? "
+                          "select mtime, sourcetype, source0, source1 from " BUILDIDS "_query_d2 where buildid = ? "
                           "order by mtime desc");
       pp->reset();
       pp->bind(1, buildid);
@@ -2565,7 +2579,7 @@ handle_buildid (MHD_Connection* conn,
   else if (atype_code == "E")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-e",
-                          "select mtime, sourcetype, source0, source1 from " BUILDIDS "_query_e where buildid = ? "
+                          "select mtime, sourcetype, source0, source1 from " BUILDIDS "_query_e2 where buildid = ? "
                           "order by mtime desc");
       pp->reset();
       pp->bind(1, buildid);
@@ -2589,9 +2603,9 @@ handle_buildid (MHD_Connection* conn,
   else if (atype_code == "I")
     {
       pp = new sqlite_ps (thisdb, "mhd-query-i",
-	"select mtime, sourcetype, source0, source1, 1 as debug_p from " BUILDIDS "_query_d where buildid = ? "
+	"select mtime, sourcetype, source0, source1, 1 as debug_p from " BUILDIDS "_query_d2 where buildid = ? "
 	"union all "
-	"select mtime, sourcetype, source0, source1, 0 as debug_p from " BUILDIDS "_query_e where buildid = ? "
+	"select mtime, sourcetype, source0, source1, 0 as debug_p from " BUILDIDS "_query_e2 where buildid = ? "
 	"order by debug_p desc, mtime desc");
       pp->reset();
       pp->bind(1, buildid);
-- 
2.45.2

