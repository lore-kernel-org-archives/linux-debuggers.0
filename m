Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762FD3BCD36
	for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 19:35:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576118; cv=none; b=uBU2KxtMUSlbYmdJJQS7kHv43xF4J+rCZBu5B/AA0RvRRLL14/fc8NFsHlvUS71sOolCz8O2Glx1sjB8vvKNuO14h/61WBYw5Otn3rvnWFFKLJ+/0kduG7yE2LIx156DLPxklOkhI0i29gL9xvwg8rsg+ZGh01DsosupmYcyLLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576118; c=relaxed/simple;
	bh=rQ3ZLRwttPY5U7qx79TyOlCHcsHd1SWTIks/cm1EO0k=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lLpbaZEY9CTlsIevuSCIlt5lQNzJZSCMUZju3JvQkpSBiPlF/DX8R1KYl53vfwR271KPihycXy7uS/EyKx2I3nNuYkUewmyq+yD2tJTkYTgUY4BiUMYQzI6mlmIeYYQL8+srRP3AqfDPGoVNArqEgkg6jNXQA9eyTx2RziG+9Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Jzb7G+L+; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Jzb7G+L+"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-92e54f8c051so797906685a.3
        for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 12:35:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576113; x=1785180913; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=dXwJlI/llosQi30lLS1O2+gV7rtKvgDC66cTY4z3y4o=;
        b=Jzb7G+L+pWevO30ha/zRsPrDNzrFGAKggAwxk7Yv/LsBZKPzLyRZovMh8ZirvuBknj
         weVss9OdLNVU7q9vh5b3czjhw28LQfkCgK2M23dqsahaKyXPJJ321z4Rp7/GpypsLFqy
         fC/YLDW53VfGKqk7BbghBQgYdNzcuvR3i/rDGfcoXIBP6RovKh9nfxC1yPe1niSFf0ma
         gvcy13NKniHDM13kC5OMDbuPdrx7zJASklqNQtn5RWem1tHLcXm75R1wtYzkLXDVvn+r
         InJLCTnfyYPJScL6Gkwm61ta05M3o/Xverw/GjLi4m8y+mAGBVWdhhyr/Eg3fQF5FtH0
         rWtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576113; x=1785180913;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=dXwJlI/llosQi30lLS1O2+gV7rtKvgDC66cTY4z3y4o=;
        b=Usr6L9XpBFq1lyNPpx7KYNYcByXeB1799JmWS4qtpOinKCVHta4R8ynNs4w9nDroTv
         oakvTs6GU3DDtQLFYjEndLc482DYVtOkrnlAW4wnZdwuH6pbEL2prG9fbx4EDopyMdCi
         h/G9Er1Nuiz2TRRhOKv6iGDgevhmyI6DRX6R8gos0rwVD2eFhVSUo/6vh2RqhHkXe/sx
         hlckm+nzijWruoCfrgK6YQDk8GQlK2zgo7hLikb9/LInI1YhsjjtFOotxi50wL7RPrCZ
         hydMRHZGD3VrGgCBzVt1QlLfpDEkky3ogqOXWmMoWWrFk0RztvC5akkm3n5lzRIVZqJg
         BSXg==
X-Forwarded-Encrypted: i=1; AHgh+RoSAU361ZvvINePVD2K+AufHqdPG5Ga4Pju9znpgj+QFByu4SH7jbo2VZrCSMu91hI9+hGXxik1sGJqvsr86PY=@vger.kernel.org
X-Gm-Message-State: AOJu0YwLvEh3hbruZWI0gg5kRpP409oohFjjd++ppy073BYiiICjhT+p
	6P9qGUr2PDGsGl1V7lwXb1DY/Rb658qNhg3rTVZ/H+n1VzMsNKi3jJ15JZpa3XmUGzo=
X-Gm-Gg: AfdE7cnTunOBptL4hbY9+bLn7vd3t/bPJQKZt+2SqENdDNp97kd1UJLaZJS/2ydJRCD
	iagZ7w9hBnPDbdRnrFiM0Lu4IZeR8bkIYBdfuRBb0kO40HipMMy8Q+2X1LP4FBVTB1220WoHF3J
	xxvAYN2VDaNAt6N8xjFRHobDQQbreeO4igiV7MlDW+7opd6z2Z99WGY3qwGi5sCc/yahFu2bLuz
	klTxF7ZFMHOxZX4yz3s2f7IFNyWLLITcWnAccYFGvdSjbJ+T0T076jXbySZQ6Z8tpRYOWu6YSJt
	BD0pZZ8SzDfQaJmU48ig2qQVCiYILoMigLcEurRBcDFxszDfyuVEvktZD89k5fhNLTLMrGsJNee
	3SU6t3QWnblWvlHhn9rG6StA43Aee3AKV/Y/jjuinY+QI1ahkPtLfS7SndB+LHpNLXOk+fqpENM
	PTokuH9CjcdIqQ1p0pZ2q2qiztmT84nT8n4+LKep21GA/cOdASbo2Gdzomhr/pUds=
X-Received: by 2002:a05:620a:45a4:b0:930:af44:c3f6 with SMTP id af79cd13be357-930b416db87mr1543521885a.43.1784576112837;
        Mon, 20 Jul 2026 12:35:12 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:12 -0700 (PDT)
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
Subject: [PATCH v5 13/36] mm/mempolicy: disallow NUMA Balancing prot_none on private nodes
Date: Mon, 20 Jul 2026 15:34:07 -0400
Message-ID: <20260720193431.3841992-14-gourry@gourry.net>
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

Skip private node memory the same way zone device memory is
skipped, since private nodes do not presently support migration.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/mempolicy.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/mm/mempolicy.c b/mm/mempolicy.c
index 8e8763f6e5f5b..2b76c57a460c9 100644
--- a/mm/mempolicy.c
+++ b/mm/mempolicy.c
@@ -845,7 +845,7 @@ bool folio_can_map_prot_numa(struct folio *folio, struct vm_area_struct *vma,
 {
 	int nid;
 
-	if (!folio || folio_is_zone_device(folio) || folio_test_ksm(folio))
+	if (!folio || folio_is_private_managed(folio) || folio_test_ksm(folio))
 		return false;
 
 	/* Also skip shared copy-on-write folios */
-- 
2.53.0-Meta

