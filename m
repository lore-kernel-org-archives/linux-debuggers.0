Received: from mail-oo1-f41.google.com (mail-oo1-f41.google.com [209.85.161.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB02F1E519
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 08:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377940; cv=none; b=jz+G7f2lMzHoDj8iczzKHqVnSZgk5iM3q5Mkmm/KQkPS+On4VZKjxhUXNtPyk9ht4R25k5mNA8qsidClhEP0gluNHpYpew89LSYtURD4+BeA78TgcVvGVKygq3EuLxfXzGbqoxx9sCDpQW0tJ9bVDgjYo4kPYqJBZUphUNecRlU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377940; c=relaxed/simple;
	bh=HOfAHJo///BN1FVi73kIPNB998r4isI11ggmhEvmArI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3IZPHtGT9W60LuCbTjVJKUeqoHnk+S0NWp11zWNL2vfWZLsdZlcC1mjRImCyj5MGBvbfEmV8bNLzti+aQzt1+7q8vNWk8ZPM3fBO+RZcryLpiHtAaFSnbXsnSup+WvEApqFBjy/r4PHaRIaky/VFnpkrEPv45VT1lnsdHV0Cao=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=XX/CMarR; arc=none smtp.client-ip=209.85.161.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="XX/CMarR"
Received: by mail-oo1-f41.google.com with SMTP id 006d021491bc7-5b9778bb7c8so841266eaf.3
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 01:32:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721377938; x=1721982738; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4Rj/ZnOVSL02OnzUupYCg3NbyqN5BwrWVZX7PHvJeg=;
        b=XX/CMarRpJAAil989nrf/MwYUFnpwJCq7rZGDC1/PTwqNg1dBhZyg+kDL3YUEo+hjW
         0EKjdm3DuwO3K+nc2C6LaCwdhfvd5K/X7H9YWuTySfHm9Cwqw9Bg0qBSppapQGPXwerD
         b2MWDmypmqoHU0/XRaLG3LO7uNaI8K1pCyivPWkZICDyT3u6DJcmfy6uCy/lAI9nUc4C
         TrzDms9BY/LbkzYBvlAhz5UyDpH1SdBYStBF9Lc6nJ+9h6IHh4xLkmAwh3YF46QNcG4z
         8Rz5iJPKczl0zn/IMCwENgkv13ZGpJKImmZhDCCIH7ZBp3edTEt4hOmqhBiYfUjWP1BK
         eaDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721377938; x=1721982738;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=u4Rj/ZnOVSL02OnzUupYCg3NbyqN5BwrWVZX7PHvJeg=;
        b=KdWIi94fKuCxgzowQC8KndWvDi4bR2yh5IYVheThjI5g1M7i4oiBulcZAiAmAy7FGd
         AOvkNptZvIjtsLJ94iO8y68evdMnrKNertJIdRwbdLzFKabWB5mB1lQZQjsXq6ddlCX8
         dAll7xF5lLYbx4VASLoSJ/bKvWcxLz8gpukvh+Tp2Y0c/0YBolc+G9WKG1SeHifzreZk
         Vqc6pfT2vasGWZ9Gh3r/Bs+gyG+HE4yHUsvFU3fXtMqfmwcslhLjyxTCBq0mkm/bI588
         SIw7m3jJW5rIPyzAWm/FVuF0KkBTgSkX1HJaXykoJ9BzjtCNaFWQBdzCrydVeWnOTG0e
         zmLA==
X-Forwarded-Encrypted: i=1; AJvYcCWsBQ/33LPdV0/06aDsVekBiOVWvanaCC4bTfScMFAhPeIYsD8EJP1ed3tzImI7eX5F7wK4AURo0UeHYo4HA5VUj2bqXGIQ69Ffe4cHEVG8
X-Gm-Message-State: AOJu0Yz35mR/EVdQ54+i2G4DjVOjyU93bnf2mjF4IsSC4HRnGtZt4kws
	imgrjhf6JWOXQXV1nBqRdChO0r7tiFAUZ8W29Xpsh/NogydtXx2303Mh0TqfbvdipS1/9TablEn
	T
X-Google-Smtp-Source: AGHT+IHkvQtCuGcznMAiz6vuPjx94FfYZCOnsO4lGhnEfZ1pHTjs/V0zDMNyDurEaOmG/LG/VjwX9Q==
X-Received: by 2002:a05:6358:3423:b0:1aa:a19e:f195 with SMTP id e5c5f4694b2df-1aca9e92dc1mr481990555d.4.1721377937669;
        Fri, 19 Jul 2024 01:32:17 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b49467sm8832375ad.6.2024.07.19.01.32.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:32:17 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v3 4/7] debugifod: add new table and views for seekable archives
Date: Fri, 19 Jul 2024 01:32:00 -0700
Message-ID: <8354294593abfcd9cfc1f83d259921a5da0d55c3.1721377314.git.osandov@fb.com>
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

