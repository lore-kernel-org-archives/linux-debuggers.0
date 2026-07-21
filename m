Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3832471267
	for <linux-debuggers@vger.kernel.org>; Tue, 21 Jul 2026 18:16:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784657792; cv=none; b=TZfNNgMFYYQNK9tUy2eV+snmnmVjdQhYxSfthjfcdeQBcllHgH65027R5NXEAxPS6BiU/xAT72PTgZsxTu/LrOwREuEAKDux872hfZY5tps06nCyaywdMjGbEMQDWqRk2tpJCm5+X7cwERhICOFXXYlgLSI5b0uMRAGKN9JbYSI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784657792; c=relaxed/simple;
	bh=oFlvw3giOtGQsSkXQn6VVdx6osu4tro2T3RPW7SBhU0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=t/51rk6dyHFu/NNpNgafHQVrG+yhPiRzKxcYhzLy63XH+DDP5yIhLSd86jmdB1MhtlKf3t8o2V5e0dNS0dVGVBc+syTkYf4HEH1iFMVEfAIZRmb2otatp2M4c0kimRxE0jUuGwQO1FaPn1pi9YElQy9A66iNBA900KFPk1S+8uk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lWiMqNe1; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lWiMqNe1"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-51c0ecfaee7so106761811cf.0
        for <linux-debuggers@vger.kernel.org>; Tue, 21 Jul 2026 11:16:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784657788; x=1785262588; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=tK6CpaworNApxpcs4ZRJbHY7w08bgOkmP8ipHWd1tq8=;
        b=lWiMqNe1aGdlndmF0DEIX11ekT+kppi6ZCsdKP+nARwmUcbPRB2RiqFp9CcVZlrCMe
         a7iQJIUlHGgwrTlgeBPrEB9RYw65vbDnpQS/W6FXlBeixFMzdS/zMQMhcf9prwyKh9Tg
         zZM1P1+WyYLol3M86HhbDS8lLf0qvp8NnbVepemntzhrmA+vdbVuvJTjusRGwuudCrDN
         IJnhW0U1qCJ9qu+q+c/HoRATkAolbkeQ7YmmUklTRfiHMdfAYBd7KPK3bsHOQiTqkD7y
         nQk7+E507U93KpaB3JodhTTR0dnlAPaEgPrkM70sUwYbhPsJOnuOLMGTZLlANx5BWdjy
         4gWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784657788; x=1785262588;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tK6CpaworNApxpcs4ZRJbHY7w08bgOkmP8ipHWd1tq8=;
        b=CC9Dj7K1CIkMKnIpbNp4/S4bN1lfAOyuSeQgwvEqdt0PLaFa4YrWjafN0x2qKgQHxS
         MYH1kkv7ypbUNHHrgOuCe6dgKqgYVhUDaygTJzeNaqM3B8WoNB4Dr4Cbqx0tFvQS+KIV
         vDxWQzSwx0RtRkK7mIgRacIjVew+TyN6zATnk3OGTqaL8E1dgqNN7Faw8Q8DPCuhgrQ9
         SZf07lOImO6TvqJ4zfh0FlvomqSUQy8zECvbkcTcyqi1cKjFc7M6HrjpdkSPND3L+QPp
         KAYDvzD3kr+m2VDN38OVufxjBK9Q10q8pLA7mtFr3G/C0JpmqKVnQ8rWQ/u1Qwu9tozz
         Wd+g==
X-Forwarded-Encrypted: i=1; AHgh+RqFDjoOVpf27bolDpdZbQ3MjlFa43iA6YzQb9wjnVSfqVC0OQG1SrclcJrv88Idk8TxEZ2K+Gevhl0sTjReeGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwckY0WjUUtzmzMXVACG2HFBnFnkk7DfceKUbGwGevoDgBXUxrq
	PYdGrXyMTqnPXuotM8R48THRu+gaXz/4/jlrAH/BiMIWIOv2+Pgqp0kZv+4aHITYasg=
X-Gm-Gg: AfdE7clca5+0VRitg2EJb8xa8kxk9xf+L0KhJdsWd6GNXMvuWzm6vcCpRNbQf2Wyqqi
	3O1xF2Qv7A5DpdKUfo+MsXGa/JwJ1QImVawc/NEv6gpgt+eMziuxWn+7W6181kCrT9w0n6uZ5BO
	7mlbcYmeva2hJtwXhGSt3JQyoIemR8xJM+oBdh9DkBqZ8hXlc7WWSRS5F99T71nYUuPrsazhKVz
	0f/2pNAgR2EcpbYANkuyEUHcRPwkMTcAJoW9gF5Cjv6iqN0gLCn2YooYykbBXV1O4OblNuN7T4n
	FLA5TZECuGUi3sLWpF8mBEEioUa/KkcncfRN5jd6G6WdtTw56xACOsabdfWfr88YRSmIuAzQujP
	R4GPXZn5FRpNz5b5qh8z8/6KQ6vScrEf1RkxkVCYdN1DYRDkBCjOBMnpFfi2jLoq0KIarNc6nmA
	HnJDqaJAsHaR7X6i1dGYvN0SYDEAtPqCUN42IKlaqJBAqbW4ngeVVM25pO+wbLNNwHWCpJ
X-Received: by 2002:ac8:5845:0:b0:51c:7b12:600a with SMTP id d75a77b69052e-5213e881e44mr171868611cf.86.1784657787636;
        Tue, 21 Jul 2026 11:16:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d066fa6asm463921cf.6.2026.07.21.11.16.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 11:16:27 -0700 (PDT)
Date: Tue, 21 Jul 2026 14:16:21 -0400
From: Gregory Price <gourry@gourry.net>
To: Balbir Singh <balbirs@nvidia.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com, 
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
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <al-2D_7NcwMxqmsM@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <6a7aaac3-e70d-4063-9c84-e643db1488e0@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6a7aaac3-e70d-4063-9c84-e643db1488e0@nvidia.com>

On Tue, Jul 21, 2026 at 01:46:01PM +1000, Balbir Singh wrote:
> On 7/21/26 5:33 AM, Gregory Price wrote:
> > 
> > Patch Layout
> > ============
> > The series is broken into two sections:
> > 
> > 1) N_MEMORY_PRIVATE Introduction.
> >    Introduce the node state.
> >    Opt those nodes out of mm/ services.
> > 
> > 2) NODE_PRIVATE_CAP_* features
> >    A set of mm/ service opt-in flags that augment private
> >    nodes to make them more useful (i.e. reclaim = overcommit).
> > 
> >    NODE_PRIVATE_CAP_LTPIN for private node folio pinning
> >    NODE_PRIVATE_CAP_NUMA_BALANCING for private-node NUMA balancing
> >    NODE_PRIVATE_CAP_DEMOTION for private-node tiering demotion
> >    NODE_PRIVATE_CAP_HOTUNPLUG for opted-in private nodes
> >    NODE_PRIVATE_CAP_USER_NUMA for userland numa controls
> >    NODE_PRIVATE_CAP_RECLAIM for opted-in private node reclaim
> > 
> 
> Looks reasonable, I wonder why USER_NUMA/HOTUNPUG is an opt-in?
> 

Ideologically: Private nodes default to fully isolated, why should any
given feature be special?

Concretely: 

User-numa

   Some devices don't want the user to have control over placement.
   I have been working on compressed memory, for example, which only
   ever wants to be used as a reclaim-demotion target.
   
   (The reasoning for this is another thread, i plan on publishing
    my research on this this year)

Hot-unplug:

   Some devices can't necessarily handle unexpected migration, and
   hot-unplug is fundamentally a migration.  So the HOTUNPLUG cap
   actually means "hot-unplug can execute migrations".

   If the entire device has pre-drained the memory (all memory is free)
   then unplug works - it's just not very hot (no migrations) :]

   Maybe a naming issue?

~Gregory

