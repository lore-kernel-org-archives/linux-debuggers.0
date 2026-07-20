Received: from mail-qk1-f173.google.com (mail-qk1-f173.google.com [209.85.222.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8DE1432BFB
	for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 19:35:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576111; cv=none; b=DGb/xbnQ8jnMF2Ic9E1YSGFW0WKCaY7OjAGYWlUPLyKClfC6L3ZX0xJ6vafGu3+T8UtH4K1IcbsP6klZd+GWyomkIjiCfvbWcXLrREJzI7DFQNskFq/Yo9SHU0riZcZ0WQjHps+7Q2Iu+BzEBm3ZLPn/rhBZAriDaxH/z6yu3QE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576111; c=relaxed/simple;
	bh=w0eKiY4I5uQufyW64Owv7K7jj+Cw2kBSZ0H/fUn8aTc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aIYj93elbueAJrM0fZb+qJzMh6yirFqgHFEsJ5xIP3D7vluvZhnvk4nsoctZnVqHSbYwxuVO1SV2BvYJL152YZs6NNx/Ge2LFwMN1j/iK7M2HbytB9vnefhnAPzi0YL8ddqYb4FU8LomdI08oQS/GMCTk/8mgSvxjNduxTUlR+A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=cweaukzy; arc=none smtp.client-ip=209.85.222.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="cweaukzy"
Received: by mail-qk1-f173.google.com with SMTP id af79cd13be357-92e5d6f35c1so921077785a.0
        for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 12:35:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576107; x=1785180907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=AbvY/gXh+2/u61eyWpGKI13cVvWaG4WQkB8wV0sMVYg=;
        b=cweaukzy0xSkEdWhxhls4M00xcE3RdBAkeV+RCtuuVZxeneDh3Lj5w8ubJO/Zrwmrl
         Nln1/CsNKB3whOnU0gxZ+UN+TowVz1+VyoBzRmPx71CReyduVjO8hRWd+ix+3AG25bCd
         Jo4l2RfJyskjI16bDjfDvujp/h3XGJmZwJUCOc4ssvpFAg6+yqWRNpIz54cZxcAEk1Ss
         tqiTLiQttYsOCn1T6APRUcDBYv8WeBG8oj+dTrbYpE4Hcqo98s9Wx0IRMYUFPfOVfa4X
         +r58eMj9l4k5hmuOCFsUm+kzKS2qaNwm/AGbvQC/IXrDAJlkiVxlWATNJk7i9QyP3kDL
         x6jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576107; x=1785180907;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=AbvY/gXh+2/u61eyWpGKI13cVvWaG4WQkB8wV0sMVYg=;
        b=XJKODsgEOmkHJa/OD6pHerhsegBm0oyNatPwMYylty2+SiLu1cK/t0jbJN1CCgzeOe
         Xg6E52qrN4nHNGpZ5hV8XfYdM0loP6MEP3cVvQD2pIGOcTsU4fUTF2xjlSjh7ceC0YTJ
         Mc6VLnVdh6j31wnv8Rfjg7U1guIOOApiPxLbJBNhMQZZA1aSTW4hmLfWyMUJo4XPCPkA
         HATu3h96+OrhKbDzpmUTiC/mla7q3RGcCCyQPo6lucIBHDyJfMwNGMKzJQAhREFZVrhd
         DpucFKJeBPrsQAUNqEq78VKPUMhEhrdeZpCkLri+iwtHgqfIIJwSYy5YOAjtwVAscm0a
         z3yA==
X-Forwarded-Encrypted: i=1; AHgh+RqDVubeq7oIDxTyVHVIkrG1V87wDPgk1Ff+q48Z20VPrFQR7x52MN4MkXLaCvqNXF/o1/4XMwUir/paWTo18gY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwgLEErZXveVZrQuA+G761wWRkrG2sgqz3GUvzYzOqtY9009N+W
	E82+A36aA1uG51QYYJEUhbiUcnFimSR8pufyv6j5v/05Q5ukD3vvKdAM7Uje9JkffdI=
X-Gm-Gg: AfdE7clCmI0nZ6Cl4N3Fu7yNTCt3xNXuWfIfmrjwONSommSxIhMiMgOmwdVSE/e8t5F
	tOudbDupNe0Kng6Z2F1f1c3d6oKkfjQlOlVKa5FRkaIxsgpPQopjz2WoucucIUppW2WGb9K9I0p
	tRHbTBiA009nxmrokH2nMu/3rWMJCeQaSy5FkdnjB6h5tvRTe/tiq4cs6XdWJV36bruxGuGtx+l
	7ghF0h4muHT5thkL/R0U5PZcl117xXYyBrNGVYr6VCRBC9bzaeLrsbR7vdFUD8bjEuYasT8nYZY
	yk0TEYbovwLi1wuEi7+kuGYQAwB0x7yuzqdL4jt4CSPUZHObh0ELmOQeqoJFiUNwapwt1fNn0xS
	uuZoELjjvPMXrE6acOUdOV3GtuABlO3vwYntZjDBCCmVOeKtUG6CHhypMJX06Mh4QnTf1NSlhvN
	LaN8GSwWR5lUk2hnvFP/Wm6hhl9Tq3rUZtgomNtEZ79iUR57hoDFIKJy3TSQ5+m9Q=
X-Received: by 2002:a05:620a:44c2:b0:92e:6b95:237a with SMTP id af79cd13be357-930b3f45487mr1592960485a.32.1784576106925;
        Mon, 20 Jul 2026 12:35:06 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:06 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com,
	arun.george@samsung.com,
	balbirs@nvidia.com,
	brendan.jackman@linux.dev,
	yuzenghui@huawei.com,
	apopple@nvidia.com,
	alucerop@amd.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	osandov@osandov.com,
	jannh@google.com,
	pfalcato@suse.de,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	pbonzini@redhat.com,
	osalvador@suse.de,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	sj@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kvm@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 11/36] mm/compaction: disallow compaction on private nodes
Date: Mon, 20 Jul 2026 15:34:05 -0400
Message-ID: <20260720193431.3841992-12-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720193431.3841992-1-gourry@gourry.net>
References: <20260720193431.3841992-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Skip compaction on private nodes. Compaction requires the ability to
migrate pages, which is not yet supported on private nodes.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/compaction.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/mm/compaction.c b/mm/compaction.c
index 9f81055a358ed..8c1351cce7bcc 100644
--- a/mm/compaction.c
+++ b/mm/compaction.c
@@ -2462,6 +2462,9 @@ bool compaction_zonelist_suitable(struct alloc_context *ac, int order,
 		    !__cpuset_zone_allowed(zone, gfp_mask))
 			continue;
 
+		if (node_is_private(zone_to_nid(zone)))
+			continue;
+
 		/*
 		 * Do not consider all the reclaimable memory because we do not
 		 * want to trash just for a single high order allocation which
@@ -2853,6 +2856,9 @@ enum compact_result try_to_compact_pages(gfp_t gfp_mask, unsigned int order,
 			!__cpuset_zone_allowed(zone, gfp_mask))
 				continue;
 
+		if (node_is_private(zone_to_nid(zone)))
+			continue;
+
 		if (prio > MIN_COMPACT_PRIORITY
 					&& compaction_deferred(zone, order)) {
 			rc = max_t(enum compact_result, COMPACT_DEFERRED, rc);
@@ -2922,6 +2928,9 @@ static int compact_node(pg_data_t *pgdat, bool proactive)
 		.proactive_compaction = proactive,
 	};
 
+	if (node_is_private(pgdat->node_id))
+		return 0;
+
 	for (zoneid = 0; zoneid < MAX_NR_ZONES; zoneid++) {
 		zone = &pgdat->node_zones[zoneid];
 		if (!populated_zone(zone))
@@ -3017,6 +3026,9 @@ static ssize_t compact_store(struct device *dev,
 {
 	int nid = dev->id;
 
+	if (node_is_private(nid))
+		return -EINVAL;
+
 	if (nid >= 0 && nid < nr_node_ids && node_online(nid)) {
 		/* Flush pending updates to the LRU lists */
 		lru_add_drain_all();
-- 
2.53.0-Meta

