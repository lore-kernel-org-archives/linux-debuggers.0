Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAE9B20E6E2
	for <linux-debuggers@vger.kernel.org>; Mon, 17 Aug 2026 00:49:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786927771; cv=none; b=o7ZWCnbLmXrjZ2WBHx3XqTq2EQ7moiEPiwelSyxhDm+J1OuEzmIMvQV3rtK8UcE3MczjRnFcoXgfdfQup/4UHuneBMsoba0kkKFBZALqdbk3ZxB6KENbsFCuCqbu+eBhDra1wHZttzWG65HLmF5J3ty5Qh9KQ7LCY3ThCvqgaps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786927771; c=relaxed/simple;
	bh=Q2AJHfOQlhxmo4d6xkSdfftND9W8OwOWU4sIuscydGg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FzylUBLN2TVoXFt6colx0ZfRro7zm7y8vVACSqtXSiprl6JSkrvHwLkEImPKxcxyfp9QZEp5ySRL5l/KvgF1COWYkvUo+IxKyclfAkzsz5jsQhYn6EPyKR5R8cfFK6YcLab81TJod/tXxZngJKge0LOS3eNM79PBeano5Udjb64=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=ckMtfNP/; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="ckMtfNP/"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-51c2a76536bso28094661cf.1
        for <linux-debuggers@vger.kernel.org>; Sun, 16 Aug 2026 17:49:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786927768; x=1787532568; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FcQdr0dRPL3xWk5ZJ+WEqnlvhAK6C+Y9UAGkoGf2Ky8=;
        b=ckMtfNP/26mDYWEYvnUuKZj+OlJs4rtBqOCTkvgUC2mso3L1qBV4UevATxAcuXcr59
         t3iNEjatomJQrmfd0qmVsl3BjaW6RqJLwsIjj72/eWYrRlfTWeZnYquwPe7qoSJdQ3uw
         g88uZqv47V0VT2fcXb9InChXDCkM8CDWy83shOxcv+0xTEFY14jjWUHpeLQyJn/Eu1+C
         4ygQiiuxj/3pUiyIOY1sjivSzmhc0YEFbIZMcRYKoMzp9C0LbmrFDK4Fu4Uo2z3EnsYd
         hX7wjASGY+5NqmkbdDYqrOgM1h4IrDlgQi9GwqxPZvEyT20eWdaV+AZ8i2avJDfhnijE
         oOMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786927768; x=1787532568;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FcQdr0dRPL3xWk5ZJ+WEqnlvhAK6C+Y9UAGkoGf2Ky8=;
        b=Vk2bxmXeq1hJFtIvnUMc8BL3yQaE7WC7h4HLlE/PPeDZMnUpoAbB5Tn/+Ct8R/y2Ne
         7ynzxLVQgkSWGB5hQNR4Sf7HT+uFa3cTgeBHayreyQaiFvrtgO6/Ejo6Bg6ebnIBqmF6
         1oZqWhiNN15D9NtIeKGSnjyJb2Y3fi6BTre2difBPNvGbRLuMxDdnJqT66eTBn82yhte
         tzSCibKhHaHnacor5SAaEVrNp3PU5izXOMheFvytCc9BYKfc0QyDNssb2M+IFSlWcr5H
         N1t282XDbx82l3hIfoMbKVU4XGCnrVVWSwCzbY4Vvrmz22BQYWHY7xV+F4Ml9n5Ol+y/
         ss9Q==
X-Forwarded-Encrypted: i=1; AHgh+RpjRcQki1jXs0pG/VYs9cxPvPl9txxCX2hWOYCkHMXz77l+iOvU1IiH5Jl0XD0GBzXhiSG4tcZj+iIScP4kUT4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyOfZnOuUlBQQrgZ9nT26k/WgnZSEwgVWZqvlZB1FJVzYwkEzmt
	YldU3gNU9O1PbPA3HSsyXOhzzF73nfE5kYKgPZgQAQAtwwjcO70lvIT2fRcmyBBQaLs=
X-Gm-Gg: AR+sD12LlwgSdjMlad/6hCFymY32iBEXdjvYJfbAzdntiOcSv32yS1wIdFf5D+6SYaR
	5amRYNDzPocaX0uhGXGhMFly1ehzViiILuceIPkDVsVoCejVAdhkR43Ktdv22UrxTdD35FGwMji
	JoPo2/zbJKt4s2Izjc4UasGx1M/VjJj2fz4csm7+FWyF/BJyyvLkAsXxpfIK5wf4uY7krLs6nsJ
	x7HXfrOhtr1tVPkG1CzpDbdcha1rRC/J0HF8cCPynOBFd3NmK2QpdyR/F1GRVcDeJXJ4hLsJSNk
	zCtorNMYmsN5dqmIz6nFqmSn5yxTifC1nI11yBS8D3kW5Ysv6Iw6w/YhSLMmXs4LCJEzWJnY2vs
	mmfiDnXSoLdLiGlT9rUOXifvjGHoUJY8zLTB1rxYkiFAM8fwx0p8TOQASYahA7OPpYLb3oKWgk6
	0w5XyKji12oBRlG91UrSr5MN83O+i9/lL0k6tmtnUrW1Dt5gvVo28b06PgBwfNEJ8TyCMhxMKzp
	a2g4DYM8EN5Hm5lrPtIzUtsnfOGSUwvVbe3Sdkn5vBw
X-Received: by 2002:a05:622a:2b4b:b0:52d:a151:10f5 with SMTP id d75a77b69052e-52da15111admr97787241cf.22.1786927767788;
        Sun, 16 Aug 2026 17:49:27 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-52db62764f2sm1152051cf.30.2026.08.16.17.49.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 16 Aug 2026 17:49:27 -0700 (PDT)
Date: Sun, 16 Aug 2026 20:49:24 -0400
From: Gregory Price <gourry@gourry.net>
To: Qiqi Li <liqiqi23@huawei.com>
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
Subject: Re: [PATCH v5 25/36] mm/memory_hotplug: support N_MEMORY_PRIVATE
 node hotplug
Message-ID: <aoJaaYp30LnKLj1w@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <20260720193431.3841992-26-gourry@gourry.net>
 <6840c720-8cb7-46bb-a652-040c130a4427@huawei.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6840c720-8cb7-46bb-a652-040c130a4427@huawei.com>

On Thu, Aug 06, 2026 at 11:30:08AM +0800, Qiqi Li wrote:
> Hi Gregory,
> 
> On 7/21/2026 3:34 AM, Gregory Price wrote:
> 
> > Add add_private_memory_driver_managed() to let modules hotplug
> > memory onto an N_MEMORY_PRIVATE node they control.
> 
> I am trying to understand how the nid passed to
> add_private_memory_driver_managed() is expected to be provisioned.
> 
> From what I can see, both node_private_register() and
> __add_memory_resource() require the nid to already be present in
> node_possible_map. My understanding is therefore that this patch
> supports hotplugging private memory onto an existing possible node,
> rather than creating a new possible node ID at runtime.
> 
> For example, in the use case I am looking at, the device's private
> node is not described by firmware. Would its nid need to be reserved
> during early NUMA initialization, or is there another mechanism that
> I may have missed?
> 

It would need to be reserved, and you could use numa emulation but
that's clunky.  I have an RFC for exactly this issue - though i haven't
pushed it further yet.

https://lore.kernel.org/all/20260610014517.253609-1-gourry@gourry.net/

> Also, could you please Cc me on future revisions of this series?
> I would appreciate it and would be happy to follow the work:)
> 
> Thanks,
> Qiqi
