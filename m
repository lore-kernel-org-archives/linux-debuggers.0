Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B563218629E
	for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 10:04:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721037895; cv=none; b=XqsTMa8gbFUqi2Nf77CmrhE9dqDL7kh75i4thJWeN6ttafBYQoxLAcemITUsvTKtw+fKTgg7YzedtAp2DD/s7NjPZIYDbsx+30e6Np7O/CgbI9rXDVAx0Dy4SaM5Nw8fYzzFwyDCoJh2nQVmhcxdgnHrIAqYdUYPCqxy5PtwDPQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721037895; c=relaxed/simple;
	bh=0X0OBWS2uNVrH18QW+mTNTrsdvbwJcZ7fRc8yiEWihk=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Ew6o8qLuqZHP3QuVsl7seeeJfZpTmr+uJlAYNopL3mNg6aLX51+c5QvoiWhOXPHRk24P1s1nmzXymKENzlv7B7HSTspto5CzkVSh7EPMP+kawVmPzlt7LactEw6aM9aED60HDj9AqhiSrBe4ghNh4E/M8JAWE6OCRnQcRZYaEaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=QOMk7gIo; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="QOMk7gIo"
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-70362cb061aso2294443a34.1
        for <linux-debuggers@vger.kernel.org>; Mon, 15 Jul 2024 03:04:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721037893; x=1721642693; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p3zAioVUelDn8FWl3hdWmimzgkhTqW1v1ObKrpY5pGE=;
        b=QOMk7gIoEv9gnUlyz8N8GXYkYnNpFEYXW8rfK2aFHgoMdOOP81zThh53nyaXMJuWDH
         eksh9gYnuK39Mv8z6xrDM3FDWiu9GAzVaVdNVuKdtmP1UbXaploLs2eXUSBq6LK6Pwhh
         AS/dW/s7oiapt0yKHReviKYB22kA1JT+XPni446stxLmC3UybBGjeJMujIPMzBPDxThv
         jX6vjS7VTbwR1UJShrUA/5W8LsfUZM2jwyxPBKXFx61LRwmgPIf9Yb7lfR4Q/SAlJJZ+
         xW4GSAx74uCT2qSZdCiZXF8yayRbUl4Xhun/ThNEdXm/2djCKPY3jCV29QagIIBlhHRE
         vz8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721037893; x=1721642693;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p3zAioVUelDn8FWl3hdWmimzgkhTqW1v1ObKrpY5pGE=;
        b=jev6RHni0eGKNXCNQYgFQJPT0NeeEE4YIbBOJBTG6wkYrhhiUdS6kBPQUUuge8eriS
         60Tsf15RobV7maeshuBduXnTw3tEeTKvGJW5Fop1N3+PAJWa+AsOCTucIXvqD6NfrQw8
         DCFqlY3QgrJJ4RALBSOkgc0dkGUSsypZAz5D4GNtn37bx9u3kf4jg+GBtR0QQ5b0IB4G
         VQyU1dN3Np3JU+39ZUyjKPRZ0NEilv4zDuzi+KA1CjsiSOGFyYuB10zeAJra3GnA4UWz
         9nZFmQ80E54KCjN1hKOknNaPuY9BK2UrSvf2jkb7D7OXXc5wcc+y6knWFd8n9Du3iiQk
         /CrQ==
X-Gm-Message-State: AOJu0Yy0vCPTVHuzgh4SPrYItV0+7LpwAdyAgB47zaVyqgh06wlD2+Ke
	x4RnLj/cqE79+vamLGdKIug4/8OZAqnj85TpDARsatNrsPz8UCZsOoM1Rg1Owf6FEuZg/3IPu4a
	i
X-Google-Smtp-Source: AGHT+IGGCI6XUQwujZogpXBfou9ojQBtxWrSwk3UIyZR82MHvXnlcDSvisbjSR6J2pIRNPZnJKNBtA==
X-Received: by 2002:a05:6830:349f:b0:704:4771:61b2 with SMTP id 46e09a7af769-7044771644bmr23885598a34.5.1721037892567;
        Mon, 15 Jul 2024 03:04:52 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-78e34d2c4d3sm3049100a12.48.2024.07.15.03.04.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Jul 2024 03:04:51 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: linux-debuggers@vger.kernel.org
Subject: [PATCH v2 2/5] debugifod: add new table and views for seekable archives
Date: Mon, 15 Jul 2024 03:04:33 -0700
Message-ID: <7f00ad830e4d3097bb48638822edbe9e9187b4db.1721037200.git.osandov@fb.com>
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
index 2d709026..81512fec 100644
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

