Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F4B6342538
	for <linux-debuggers@vger.kernel.org>; Wed, 22 Jul 2026 13:48:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784728138; cv=none; b=tWwz/Qqai14lzZFeHOPuNgQl94VGJY6S3q2IZpoePPHH+dyaQMFTaz583mVyTh61fp3fJ4vjAdWKcMjpZTrBjl7kqazVEz2p5HGFCh19+1SsD6zb7M7o2e9Isx6W5E5f0BBcCq3u/Y9lcYvJ3dQtjnshfKhTh5/pFzbe92nstrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784728138; c=relaxed/simple;
	bh=JAIqzpQM3gUx7M+gDSziic1KcB43W58VAXiVvJF0/Hk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k58TQ6zJFaCDo2QI+jIXSPB2ewnyQor2BVnqiNP+eFtlCV8UrJGWMo4C3BYtu03cseZSFj87ev+QcZoY/md86YeNGxXjA4a3zj7FB+UncXmIzfrdzf3Jk46stH0up8QTXl4AH3Ji0dEh+yaU8cF+D5Tfj2eS7Jn+Fij8SCi7vA8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=GfLa6fHj; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="GfLa6fHj"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c4436d02cso50814241cf.1
        for <linux-debuggers@vger.kernel.org>; Wed, 22 Jul 2026 06:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784728136; x=1785332936; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=LI4otu0+1hHJyrtu/tBxz3iTtloCysub9k9iNgYv1gk=;
        b=GfLa6fHjBw5k5Cgmz1whJ5nETVeelFxMT26tNktv/o76lhNb8g352TR5NSgzxj0xK/
         l99ZU3otNIqIWf5NPRZOUByX/rsuPiQ11f/76fJZU6VdndYf/hECk1QXXGmtm6zxg/D+
         Jp3L7vWik0zmayA89l50HzOSWyCZrphTG1lt1EZnBbJQbWY5rLr8WS00j1qAY7moV6C6
         lTJ7XSZYNDD8dlO/MPxVy2EEZD8SCjSLPMCaZCsQD7e37hasV8TP4a+NhorAAbZ0Ohhs
         6nlqtYbIICyZZQkN6OqTZwVx6r17L7v2FbkjPkZ0Eqhsumnot7b9+N7Dj0SpPbVDkztD
         g8YA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784728136; x=1785332936;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LI4otu0+1hHJyrtu/tBxz3iTtloCysub9k9iNgYv1gk=;
        b=rUr7m2XlZGBCW70XtwU5C6kBga4s4+uHClRXc95wcdJb49Z3HQq/mHZpQBI727TD5H
         Zllr4xDDMjq6Tg8m2KQDPF/Du/MqIuYdwLFY+eT5TvmdoQducwKo1IOkqcefBrvi411+
         +/1kusWNemFSMp0D6w99AcfU3FRLmOjP5/mEiVqd/FoDzhgZ7gKWE+AuYpn1c8Xtb9lL
         MnHH+F9uGfPiTqM5ly9OvspCUzDbI0q4Jt9hJQVXbTQPFwxk4YluG9tI+kvgsEw8aKTf
         PEBKLErQNVfhz8jb+1oFSOP0/pC2vbbFvq7lmges6FQHIyiRySFdJfC1eQP7URN/sUFp
         LSvg==
X-Forwarded-Encrypted: i=1; AHgh+RpwBEVhLBAFMBDVc7Q7KU6hkiDSEf/zHRZcXo8OqHfHmEFGYBzjSIPpR8JERt57IKSm/kAni2Vx02A7LtbwbMg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwzgTDnGRQrZgR/wSUuMFhthL0izJEszqSHKJBQzUIbG8z1sCc0
	ehGkvi4SjKSFCWJFoYJmEB9pl5zscyQ3Hv/Ls6rZJIUTEEvrPbZkGnhlkAoZ/9SvOvI=
X-Gm-Gg: AR+sD13R12DH5laoFVMjYlzAZUgRU2UHcq2QT3LH71d52yb6m0LCRTgvYDyHhQD0Cal
	opVn0tz78mP0mfHpmWMVVxEwSvaGrpc5xNnNUMIiWpIGxOrVcVAjAW0kACxRQkD+eiWSY3JFr8Z
	27OnqCOgQ90UIc4K7J6GKlIT9of/I4IVidGWyEVXhsLuf86A6WebLLW3S/KeSuSZeqbSUx++Jwb
	bpRrRQiZ/cVU8lG9QK4wqwnRgfVV9sNWxQP7YF4xZWXFEj0/Mfetrz+kVeSfHxRzqBGr96mzVZF
	mOwAF5e/QRkRosiUNzZ9KH/QIO8Z/5fAz5jd52EQUG32Qko9+RHLUhvE8AuwX3JaGd4AH7yzhzq
	FSDjjWiCoLQa/57Qwz7Y7FjS3Asr47o8gnquTSyFZ/GSEVZtpFqvw8QTHeTbIVYom2Xa0Tok6YT
	R9W6GoVVI8cOe5H9zUZIk5LyiwVUX7y4zrMR0GhevVEsWe0mtYR2KkBqZw9A==
X-Received: by 2002:a05:622a:350:b0:51c:555:7dea with SMTP id d75a77b69052e-5213cbd667cmr215415981cf.30.1784728136109;
        Wed, 22 Jul 2026 06:48:56 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-907ba8e2581sm21393266d6.19.2026.07.22.06.48.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:48:55 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:48:50 -0400
From: Gregory Price <gourry@gourry.net>
To: Richard Cheng <icheng@nvidia.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com, 
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com, 
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com, 
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org, liam@infradead.org, 
	vbabka@kernel.org, rppt@kernel.org, surenb@google.com, mhocko@suse.com, 
	corbet@lwn.net, skhan@linuxfoundation.org, gregkh@linuxfoundation.org, 
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org, vishal.l.verma@intel.com, 
	dave.jiang@intel.com, alison.schofield@intel.com, osandov@osandov.com, 
	jannh@google.com, pfalcato@suse.de, jackmanb@google.com, hannes@cmpxchg.org, 
	ziy@nvidia.com, pbonzini@redhat.com, osalvador@suse.de, joshua.hahnjy@gmail.com, 
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com, 
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
Subject: Re: [PATCH v5 26/36] mm: add NODE_PRIVATE_CAP_RECLAIM for opted-in
 private node reclaim
Message-ID: <amDJEbu3aQO8J8f4@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <20260720193431.3841992-27-gourry@gourry.net>
 <amDGXU94trqlXUgR@MWDK4CY14F>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amDGXU94trqlXUgR@MWDK4CY14F>

On Wed, Jul 22, 2026 at 09:36:14PM +0800, Richard Cheng wrote:
> On Mon, Jul 20, 2026 at 03:34:20PM +0800, Gregory Price wrote:
> > +static struct zonelist *memcg_reclaim_zonelist(int nid, gfp_t gfp_mask)
> > +{
> > +	unsigned int aflags = ALLOC_DEFAULT;
> > +
> > +	if (unlikely(!nodes_empty(node_states[N_MEMORY_PRIVATE])))
> > +		aflags = ALLOC_ZONELIST_PRIVATE;
> > +
> > +	return select_zonelist(nid, gfp_mask, aflags);
> > +}
> 
> 
> I applied this code change and notice in mem_cgroup_shrink_node(), it calls
> shrink_lruvec() directly and never passes through shrink_node().
> 
> This patch makes private nodes reachable through memcg reclaim zonelist, but
> what prevents the direct per-node memcg path from reclaiming a private node
> that has not set NODE_PRIVATE_CAP_RECLAIM ?
> 

I legitimately missed this.

Sashiko also picked it up on the filter patch:
https://sashiko.dev/#/message/20260721183528.B4B9C1F00A3A%40smtp.kernel.org

If nothing else - implementing this feature has taught me some
sub-components of mm/ have very well centralized logic, and others (like
vmscan.c) have 3 or 4 different paths in with a lot of strange quirks
carved out.

I think some of the vmscan paths can be improved to simplify this
interaction, but i will fix this particular miss in v6 and come back
around to see whether we can clean up these different paths as a general
improvement.

~Gregory
