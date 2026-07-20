Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706D5439905
	for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 19:35:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576107; cv=none; b=lnXDxmzcPINCmqDP0XIFwOk6voIJrnda6mRtiUIPlHBBf3boqDi7P/pgdCXBdB7CMaH5sQ8RAiQABFFVRs6hAx+BUsta4WiQmnBvt8Yih9JFB3cYihluma/elk91OCPerOWtVYRFNfzzCYjUEw9zC/qrN1ytmii8kTx72tBj73g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576107; c=relaxed/simple;
	bh=IH9XmY5lZ74Lh/qC51Vmj6nJ/SlEkb5m+xVKm1fBETo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lPNeZGzHWPNU3nylpNriLpuIKRnYfbi65rwN3KrinTGHcT5erJWSldF8tj36SRTfkRkWTCzlZ923Gnsi4tqgkpMQU62NoYY66SikNCUGMkQ1lTeZdU5zsTUEybGu4xOcFgayEBjGMabXe5lRFcCR5V5XcA6xoZ34QhcQZfo2gwU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=d0h7rOhU; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="d0h7rOhU"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-9305a2121a1so722924185a.2
        for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 12:35:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576102; x=1785180902; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=pZmCSk3Ktta7GM7YUNaW3uB9vhWdsptSIGrgvbOB7hc=;
        b=d0h7rOhUVRLfrDoaAL8llbupY5GuA7xThH9ldIu2SnfXravQpuZIJ0VnKtATtUkBVt
         4GyDeUNi0CufD1NDEV/wu5OqZvDZxDLLlcqy0IB1nQnhsx603JCf/DgVrnC6on2prveu
         /Boq93AE1EyPP0a14G9QmHGR4vLQE/yM5jrhwBudtWMEdsAJ5RkbHRCOFlI5TPNkcHz6
         ptShotJbKiePrY+XbJdX3TtnSLbxiEZifI5Yol0nqYfDfFCsNGyj7fu2tAgbw+JATcgw
         6zWewHR4bkgHsqfXC5lekiZGUOA34p347MISOcRcWma7Ay6no59iP7HLbvxD8GnhnUaJ
         jq8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576102; x=1785180902;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=pZmCSk3Ktta7GM7YUNaW3uB9vhWdsptSIGrgvbOB7hc=;
        b=nnQ6RMQNaeBK4yC+pHeJr4KqFj1LobbvRTb7h0tIWKo15gxSee/MohtBs0gUvMQPJU
         wCyrqk+LJIdmc46c1iarhICrYyjCUhDjCeu2VAihS2ToAc0aRbFYZtfwXB4HgNeta6mF
         i/YOfCZ8916VxwosbN0c928jWnI51xOIP0+MbOqeyKOSQcvkJZ9Wn6Knv8brxQSRN7Vi
         VsyddeKDKNDIgvTfd4OpSOMnsvxt4PPCvjxNYrrsRCb2jogW2p0R/InwxkCVQjrnnU9L
         WbBh4TQsoGo8pV2qziVDMHKLajmNfuWPvPn4xfkh1sK0Ixc+oPBkAmeCggnYISWtCkko
         VNnA==
X-Forwarded-Encrypted: i=1; AHgh+RpmKA0B/L20FP6+pTcP3mlQvP70Uj2kTL4lefz+ty4QFw73hSi+xMMaGyUjlzG7B5OTJWAjl1Q8yzNNoeLLBR8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw/Cb+5lhwIaWFWNhcX8yrUu954vDPW/SRbb4OBpLeoNGtDW/Xm
	RLGYBsQ8ZT9dVcLSDwvJjSLW4MRvwWD9yjHz+lSMcGfvmUyJcfYyzKB/uxmQ/YDRE6s=
X-Gm-Gg: AfdE7clD7qZ50prorkcnVUVk6nP5/X3dhesrAgUjsNbNfmpVw6mw8+0FeGSiku1cRdX
	TnpoP3Jrcq/NcUE7wfD53usYBwlwRsadpwO9CCxJHtvo5rtv4Dm97IIoqvTj3x9BUDndR2MghJD
	ayOzTNvsRpH2EiSzVeahqyV9p2ddffEMMzZv95B0kk6VaXOB3x+d3nh4gVfHtqMYvLxfGl2GP0v
	OYKMDdhwv165178tChNFAdP+tOK6MLkkDswWkYP1jiHZfnrKDR/Uh5gARLqw59oDiR+n1L9uu9z
	pW8U2oJi/ewVYjmL85K5wZF442Kr2ySl/Vp95clkXL5HmszAYCqbqaATQkq4U/iorAPshY9nem3
	wG29h9tEeFuabyRcESx9oFHH000sY2dqJ0Co98FgJBBpkiwx7G6+rIQKoC0hYp+kFg3Ggg4V5R8
	f2llAo0Jiw8Stb+Qt70vpoxca6HPt1CIAn1R/Qx+DZVlvdKUuUW4/2utBckZPOuang/VHFig+CT
	gy+Btwdm3tB
X-Received: by 2002:a05:620a:a481:b0:92e:cac7:9706 with SMTP id af79cd13be357-930b431c958mr1298084185a.52.1784576101920;
        Mon, 20 Jul 2026 12:35:01 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:01 -0700 (PDT)
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
Subject: [PATCH v5 09/36] mm/migrate: disallow userland driven migration for private nodes
Date: Mon, 20 Jul 2026 15:34:03 -0400
Message-ID: <20260720193431.3841992-10-gourry@gourry.net>
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

Use the same filter locations as zone_device folios to disallow
userland driven migration requests for private node memory.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/migrate.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/mm/migrate.c b/mm/migrate.c
index a8a86141dbb54..d20674c07b947 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -2268,7 +2268,7 @@ static int __add_folio_for_migration(struct folio *folio, int node,
 	if (is_zero_folio(folio) || is_huge_zero_folio(folio))
 		return -EFAULT;
 
-	if (folio_is_zone_device(folio))
+	if (folio_is_private_managed(folio))
 		return -ENOENT;
 
 	if (folio_nid(folio) == node)
@@ -2477,7 +2477,7 @@ static void do_pages_stat_array(struct mm_struct *mm, unsigned long nr_pages,
 		if (folio) {
 			if (is_zero_folio(folio) || is_huge_zero_folio(folio))
 				err = -EFAULT;
-			else if (folio_is_zone_device(folio))
+			else if (folio_is_private_managed(folio))
 				err = -ENOENT;
 			else
 				err = folio_nid(folio);
-- 
2.53.0-Meta

