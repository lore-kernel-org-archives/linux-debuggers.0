Received: from mail-oa1-f53.google.com (mail-oa1-f53.google.com [209.85.160.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46288143C6B
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 22:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774160; cv=none; b=BAlU2VQdJ8NPWcV1yFQx1sMwIIQCtJV1GtfSL5KnfM4CCdLCRONEJNffaaLtbwOI/SM4EbvSNis05Zf6zU+ENkBNfuNZxOuZKkV5PComVLNX9d/iE/HnolqLERKvoqoO3aB5/FUXQI/wuWa61V1Yv0/5qBFt5FF/Jq3ghUB2u/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774160; c=relaxed/simple;
	bh=HOfAHJo///BN1FVi73kIPNB998r4isI11ggmhEvmArI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=gMoqqxHcZvAi9koJ5eXFTkjKT1oNDijC9GK2qIuDdBrulk7+E1kBKaVsj+0DMiSSm/s/SjvITM6Ov/5bl4n8C0XRxDKb1aAoKG0QqDCRj8hPj+C/tGSWQAP9E/aJrsPhSa6WcPH/fCcJu0xXN/0N2WN01tE+M1qgBdjiwF+F2zg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=V9SMQ7kB; arc=none smtp.client-ip=209.85.160.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="V9SMQ7kB"
Received: by mail-oa1-f53.google.com with SMTP id 586e51a60fabf-26119999171so2863991fac.2
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 15:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721774158; x=1722378958; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4Rj/ZnOVSL02OnzUupYCg3NbyqN5BwrWVZX7PHvJeg=;
        b=V9SMQ7kBf+OmFBUQIPFIkpl/PnFizVZwYI2hhksnLLJRcBsAt9WKfLRhR8h9bEY5Bq
         YjX7d8xIxF3YsfS1q7Sgdvby42O90wAWjPSr8uRfroZLp0OQ76C90ph2wieWDdEwZWAI
         td34oK7vaBJIl/2LnxInUQNA8FJSd9/PCX0bfsAo18ta7UUnuYf1rqBgncGC/Aid799K
         dD5Iq+OGELlhfhIbc8pLuiZxglyX03E56GoVEAzVzUfPaBnXRANa4N+EC+2VoHOOoFQD
         6VUV8qLn8QS+M2CAXhvQ0wY+2wlDvWrx8TzHtfVNo0D+dqIpwewt8+/8NCLMRiUXr8LT
         89Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721774158; x=1722378958;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4Rj/ZnOVSL02OnzUupYCg3NbyqN5BwrWVZX7PHvJeg=;
        b=fWDiufva6W2mTv+8LpFeZxVljXGRoGfjncMhVdSzi0gILuW5pnHzdyHD+eX9w584R/
         5Vv42H7sbbyi9midZtJ1DIc6HQxAU2yhj5dD9HAEEq2Ezk5BGvf90ctbWAwTIR/Gj0yY
         JXL+vYTFtJcRWo+/hFIdJ0YuTI32zRNXSSvECw+pvhh/jWz8b3XeSeW7dTUsOY1sujSa
         I8WPv3In40j826C4JndFY6drgGdTyThRCxPG/latwfXUqsnvABCUYQpR505ZBwgpBP/U
         CqHnvcphDddyfZzvUoI9yfvabidB0c4wiEgwM4zk/7hYD9L9r4DUXXIUjlweCtKhZGPi
         bd1A==
X-Forwarded-Encrypted: i=1; AJvYcCWykM0JrDbXusN5+HeOKEuU/sEVnmY7Ik/OZ3IGpa1b6tvOtRcyoEg5yyYIegw9NHTZpA2uPZcoVxOT8g+KyYAxdJzTmP9QOrSI0YSQz8yl
X-Gm-Message-State: AOJu0Yz6Q5amcj9E3LF6HCIOkUNJO5/garEa7gqv7CAq5RvUnuEXYLd3
	UVQeiweePOOpnwl0yfPVqmOGwddnLbpikh5H6TTz56/Lzc0y4fDYyUbmWDG0dP8=
X-Google-Smtp-Source: AGHT+IHeFnw2y57mOvcjRUIMaso4gzunebmtC6lhrer++vPe7Vr308eHS/nWncqeffgY1EoxwMb7WA==
X-Received: by 2002:a05:6871:b08:b0:25e:29e7:14c8 with SMTP id 586e51a60fabf-2648cc9f300mr292136fac.42.1721774158172;
        Tue, 23 Jul 2024 15:35:58 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:b6d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d241803fdsm4308079b3a.220.2024.07.23.15.35.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 15:35:57 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	Aaron Merey <amerey@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v5 4/7] debugifod: add new table and views for seekable archives
Date: Tue, 23 Jul 2024 15:35:40 -0700
Message-ID: <4dd631195fbccd6aaec440f38ff12220ea6cc516.1721773977.git.osandov@fb.com>
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

