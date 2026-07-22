Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F62B33F385
	for <linux-debuggers@vger.kernel.org>; Wed, 22 Jul 2026 14:04:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784729100; cv=none; b=K9U2G9DJ2FdOPEISA5diwYS4en+NeW7fZ2kYuYjRx1zu2zkDcnmzMTojGpf/Z6cOG3h4Ym/xAj791qh1Ed4h6eVe89jnVotUtw+GOdXFjka2YnlTby/OJdC31kPmMDEE5kj5fOK/5kkcIt9O0QCDPq1Zn8HfOTomITbjtpzT8og=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784729100; c=relaxed/simple;
	bh=BiKsszl+35xq/ewMPZzGz30tgw5kvnsmDpEO+3lG0vE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rCori883h7Wo0tgNYqUHXArHw2vHrVMp0V58FYyNIdbVK/EYACEIFpofdg3JMFr6f9UYb56jScOAMK3rL0Kl+wzyaXLYsO5fY4qZ3mwA8T/ll+rFyGm0KAQ6ZFEdbUjDw/MKY7HUFyswpzgEShEzKtYjfJdOjHuB5+8D8m1jzHg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=mrvhPX8T; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="mrvhPX8T"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-92f0b5ed131so822676985a.3
        for <linux-debuggers@vger.kernel.org>; Wed, 22 Jul 2026 07:04:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784729097; x=1785333897; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wzTopji7Zl+MAyFivVnXiZLO5KABEpd5UV02S/KHUTw=;
        b=mrvhPX8TYaW6OdLHwE1oVXsMQJLltg7gssKp5utqf/LuYMMymUzUMHKiHysM64pTuL
         L8ZJEzSGtBUdGHqeoUS/ZfnQohfr5G/UrhC/wRUH3KEFfdFHNSA50wlsbw2D2YHpykae
         ihCSsUC5m6IS7Fmjzsof4Ps0QyK2W/EjkS+7y09grIz4VVqpiGjn7sXKLdzKT/vQfG/B
         FoUnOSa9uvT9rWH0HIZMJpxdrLvtqqPMzscmxRRoeGPXyeBHamY6dRkeIHPPOFi2zbom
         3sQoKh5VsE/T35TkORWJZ7BdBRwCVaEy85AwnwuwDRQCD5ybGnugX0rapf/PmeW7sZkw
         vl+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784729097; x=1785333897;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wzTopji7Zl+MAyFivVnXiZLO5KABEpd5UV02S/KHUTw=;
        b=dJnCAZSujn+TRNq9Ubyb4cKlZ7FyFH9i5N8I9oN25euLPre5P/lH0X6w0Zuh5+djzo
         OmTRRlc9Q4etqGO6M49JbeO6aKoNHgVUOZjj4apzC9Nuf1omCfBhAZSyfLv0Iug2d5pz
         STSUOLxTrTO6N2URtJ/3RlPv7orUwNiNE4ox3bqyGoH6Jpv8KXIRSoDSWxAFYy/j496C
         CCEjNZRMOosGK9Ug8op9rde9u1ZxAgiK/mJ22r5OC/0ZVeRebDWrpk6LZZd0uTrUyh6Y
         /3+VGb9joJETd/O7L/soSVuPaphysW3eBp0qa21ZGahAjIW5Nr2aSMDADjbi204xaWqV
         17Kw==
X-Forwarded-Encrypted: i=1; AHgh+Rqe3SvEHZl8wSw7nCf24rLNqJ8SsYcTB9A79GhK281UR8aDV2voehRP7fub+taXu5Kha5mrztUReuzNRt7rW7Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YweaSvr3xvrNQ0nogAwc5psiOGR7kzbtHNKegifHItQ6HLU3W+z
	XE2wQuwgLgYB9+BOIQg8LNd2ne9TbxV3YYehLyMToUhKtsW959d28AEd69/zwvOgt/o=
X-Gm-Gg: AR+sD11LOkOxQ7c8GZNTEUPGpykLEaWuh2DlAt0n7paIO9vYEYidHNztD9eEXJOO9KM
	BbMOx0SRTAqvhIKuialrTyTdC/Ry/yzjlJOE3OfxTGv1PASIksDummlo6gE8muVS+fsbI6tzll+
	Kqil85TliIqajOkuAF554kAZNZ1viht6Xk0SqZaJ2roTLMpH8Zl3RvoD9B8NAo+j0gEzMNRBmG8
	YV2+qjGjYh2TpKINKlQLxiy77FaVKx9FWQkDCgfMFXnwxO+VB8w7hUKGjv2vtWGueJrZD+kIkBx
	6YmHpCumliA4Kl/M0qwGJLGJCuNRpzIsjxURaFd3APXh/6cWUPC2H08fD6gjksiag4f+J8eeNvG
	vkLUZysPKVKKvj9ZhA6PBxT1dEbJY5PXUHX8w031+fXMWeihHkvd7B9LVOh9NMs3VZf+4OLx/JA
	RBb7afMDc1n3cJUxMrXXNyFwhCX41GgQvxyKGfequxYL0IIsK80zw/wqH16A==
X-Received: by 2002:a05:620a:1992:b0:930:f7ee:2cf5 with SMTP id af79cd13be357-930f7ee3792mr215753585a.66.1784729095553;
        Wed, 22 Jul 2026 07:04:55 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f68d5d6dsm171863585a.20.2026.07.22.07.04.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 07:04:55 -0700 (PDT)
Date: Wed, 22 Jul 2026 10:04:49 -0400
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com, arun.george@samsung.com, balbirs@nvidia.com, 
	brendan.jackman@linux.dev, yuzenghui@huawei.com, apopple@nvidia.com, alucerop@amd.com, 
	matthew.brost@intel.com, akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, 
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org, surenb@google.com, 
	mhocko@suse.com, corbet@lwn.net, skhan@linuxfoundation.org, 
	gregkh@linuxfoundation.org, rafael@kernel.org, dakr@kernel.org, djbw@kernel.org, 
	vishal.l.verma@intel.com, dave.jiang@intel.com, alison.schofield@intel.com, 
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de, jackmanb@google.com, 
	hannes@cmpxchg.org, ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, 
	joshua.hahnjy@gmail.com, rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev, baohua@kernel.org, 
	axelrasmussen@google.com, yuanchu@google.com, weixugc@google.com, yury.norov@gmail.com, 
	linux@rasmusvillemoes.dk, longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org, 
	mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com, 
	peterx@redhat.com, baolin.wang@linux.alibaba.com, npache@redhat.com, 
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev, usama.arif@linux.dev, 
	xu.xin16@zte.com.cn, chengming.zhou@linux.dev, roman.gushchin@linux.dev, 
	muchun.song@linux.dev, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev, linux-cxl@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org, 
	cgroups@vger.kernel.org, damon@lists.linux.dev, linux-kselftest@vger.kernel.org, 
	kernel-team@meta.com
Subject: Re: [PATCH v5 28/36] mm: add NODE_PRIVATE_CAP_HOTUNPLUG for opted-in
 private nodes
Message-ID: <amDNMmbdE_ZhUgl1@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <20260720193431.3841992-29-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260720193431.3841992-29-gourry@gourry.net>

On Mon, Jul 20, 2026 at 03:34:22PM -0400, Gregory Price wrote:
> Add CAP_HOTUNPLUG, which allows memory_hotplug to migrate a private
> node's folios for the purpose of hotunplugging memory.
> 
> Without this, hotunplug fails if any folio on the node is allocated.
> 
> Add node_allows_hotunplug() - which returns true for any normal node
> and private nodes with CAP_HOTUNPLUG.
> 
> Signed-off-by: Gregory Price <gourry@gourry.net>

after this question:
https://lore.kernel.org/linux-mm/al-pkvmgIxGu3LzM@gourry-fedora-PF4VCD3F/T/#m5b8166212a276fece2380f2dd03d6864375a576b

and some off-list feedback about limiting initial cap bits to active
use cases, I realized that this CAP bit can be entirely eliminated.

hotplug notifier callbacks already allow a driver to prevent memory
block state transitions - so that control already exists.

v6 will remove both the filtering here and the cap bit.

~Gregory
