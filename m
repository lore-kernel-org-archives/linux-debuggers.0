Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A96E3347BD9
	for <linux-debuggers@vger.kernel.org>; Wed, 22 Jul 2026 13:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784726375; cv=none; b=hJxwWQehZtRvRHlimXc4yXcoUeiRLgXSOHjd9kChrr9m+rQaxhv1BAy8QEreO5P/23eFAIjDRpyreLJhxUbcIgn3AGs86iH22r0F6zFzPyxkHuFQQDtyJ+T9dVviNLN6dF5TmGHs7IeOSJ12MWseFReFaceWO8ATnaOBSs661SI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784726375; c=relaxed/simple;
	bh=epK4LVDwm2+auSTveDZ6GGKifGGGfqh7hgaFGF+EvAo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=IdAdde21BeG8Y7bV3zuRO3IDub2nk0325dCVrwMefKseslxJGgMlY4pmRZlUqRMTqWg3Y2dth9wIl326NFLUJCkg+S9WeVAywZIHlww2oF/CfL4U3rvmGSzhnt/JA2nYhy4M764KH8X+reeYAIo3gaQwZsacqcpI0L/DtH74o9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=hnFAnD8B; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="hnFAnD8B"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-92e53581361so971840885a.1
        for <linux-debuggers@vger.kernel.org>; Wed, 22 Jul 2026 06:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784726369; x=1785331169; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=uPPBH/hmuBagyTMjawpVpFd8RmJZZP/xfXgbpwvebxM=;
        b=hnFAnD8B6yb746lM1dDg1iy3zz4nVeGNoA0PUX2SqMQ0ccOjs4l68Z5mAmqD/V2fey
         2m3DMIiZdnE5jVP6n5bDRNS4xg2G64CdgAZX3IjXkqcm/WdANu7ich8foaJHOlAsixzy
         TlD3GKsCrfIa3N077RdxGvBvK+73UWGGSbzo/z7y8gA1ZHwVGGpcCbQi9ThD8wkUXb2v
         6l4BvYxtquoMM33zGBqpotOPa26jM86mPxxyA8dYjnSvPvc4FmxA4Ru8mls6N1mqvMEa
         oSUGkJS7S5VPYG51sn6svBcXZCP4kBHFPj2Z1U2cNZnLN9+JGqZ8DwoO6D396ccjDJ1D
         PDZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784726369; x=1785331169;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uPPBH/hmuBagyTMjawpVpFd8RmJZZP/xfXgbpwvebxM=;
        b=onlVDpvDlr/79NBtjZCJNV5itcYpbsLg/Yg+6U5rCyqcQF9dthotPDoVVWsCK3cbiv
         kekuXmQaR2Isr8DKtjLxBe7/laRb3MAM/53WgadbRp6g+JomhUbY6r7brp1P9uXa7fwz
         BK6A3blkrFozhO+3MFhI0NAcPyIAsm4JPVdPNlxGguC2+ZCTwK6dUWPMcbgAigknwDro
         nm/nkCY2i1deD4lBAtd9zd63EIZWbZnaVFjjqRYfp3XN4m3T17VQBbbiXn7s7MJl4acb
         fL6cJMOCBRj0SCxApFSUg5rMmbStfNifrz3Z2+Q+UOXM9Vgmg2xQ69SEHDgS+wjuj0IF
         Pw+g==
X-Forwarded-Encrypted: i=1; AHgh+Rr3j8I+fJC5Ic/SnfUMqi7mVG7A4fvsjvtfLwA7AnO99ldFLFOdz7g6NCoCiA7hIcntMJKu5LZ3/YJVbGVMAgQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YycI44QbUYTuGJ5VEIxbqMQ25NUbbNWizb+/B+a5qYrw3gbh7kd
	HT4maqiX/cU3of2j+QG15y3HlN7CaTI/cZWw5pJrATj7np/fi97mdnJY4AMNlZpsRUw=
X-Gm-Gg: AR+sD11gAa61ftM1lok4VlfHMjGC5buoMPXIdx3WYyZY1VWSDCo5uzS/ZPnkN6qlxiG
	J53ziLZ8ctZ0p8YhO2HTDVzIACZTLCgy5XhVcFFcb5jNf57b/7NyrlBFQgD3gWXIOK8yjEmNanS
	EXQtmjIAJ6lkR1etLzIhpSH450dOp17J77zZXeJE4uqDX76nfG4eSkJ3+wyWJvB3+bCW0PNB5dC
	EqJ0BxaqIXH6He2nfH84pbNFgT8T60uWTfef2Civ+HdpaM/tA8MkEUI4UJis+eMXp7XpMQX4xjE
	aWb6fgfXVj7vIJ17ST2Yi1prv7wUgGyrzOZzEcvD1IgV9JyFfgiHAewPEb4ou0ZeJuAQV9ZHOEB
	pqjZgXu9QlNfwGFSxupl9KPo31d+IeTQwe6adquYT7S28VqnFnbU95FDVP4lZ3M9Z0TYwMv1bUk
	uJegnIXDXmsVj5Kr/nVJoj/8q4pnEMiCqsBQ1XUCoVkG+i8HXdR/5VfczbkA==
X-Received: by 2002:a05:620a:460f:b0:92e:8734:b721 with SMTP id af79cd13be357-930b3ee6fa3mr2273972385a.29.1784726369355;
        Wed, 22 Jul 2026 06:19:29 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930f6a6c1efsm160195685a.38.2026.07.22.06.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:19:28 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:19:23 -0400
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
Subject: Re: [PATCH v5 05/36] mm: add ZONELIST_PRIVATE(_NOFALLBACK) for
 N_MEMORY_PRIVATE nodes.
Message-ID: <amDAjb7PpWDnIQcF@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <20260720193431.3841992-6-gourry@gourry.net>
 <amC-b5SIkxUCKQ7H@MWDK4CY14F>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amC-b5SIkxUCKQ7H@MWDK4CY14F>

On Wed, Jul 22, 2026 at 09:00:51PM +0800, Richard Cheng wrote:
> On Mon, Jul 20, 2026 at 03:33:59PM +0800, Gregory Price wrote:
> >  static void build_zonelists(pg_data_t *pgdat)
> >  {
> >  	static int node_order[MAX_NUMNODES];
> > +	nodemask_t tier_nodes;
> >  	int local_node = pgdat->node_id;
> >  	int node, nr_nodes = 0;
> >  
> >  	memset(node_order, 0, sizeof(node_order));
> >  
> > +	/*
> > +	 * Zonelists: FALLBACK, NOFALLBACK, PRIVATE
> > +	 *
> > +	 * FALLBACK:   Allocation order for all nodes.  Private nodes have lists
> > +	 *             but never appear as an entry in any list. Allocations
> > +	 *             targeting a private node w/ FALLBACK land on N_MEMORY.
> > +	 *
> > +	 * NOFALLBACK: A list for each node containing only itself.
> > +	 *             Allocations targeting a private node w/ NOFALLBACK
> > +	 *             will always fail (their NOFALLBACK is empty)
> > +	 *
> > +	 * PRIVATE:    (N_MEMORY | N_MEMORY_PRIVATE) - allows access to
> > +	 *             private nodes, and falls back to normal memory unless
> > +	 *             __GFP_THISNODE otherwise constrains it.
> > +	 */
> > +
> >  	build_node_zonelist(pgdat, &node_states[N_MEMORY], ZONELIST_FALLBACK,
> >  			    true, node_order, &nr_nodes);
> >  	build_thisnode_zonelists(pgdat);
> > @@ -5912,6 +5957,10 @@ static void build_zonelists(pg_data_t *pgdat)
> >  	for (node = 0; node < nr_nodes; node++)
> >  		pr_cont("%d ", node_order[node]);
> >  	pr_cont("\n");
> > +
> > +	nodes_or(tier_nodes, node_states[N_MEMORY], node_states[N_MEMORY_PRIVATE]);
> 
> Hi Gregory,
> 
> A question about this part, if my understanding is right,
> ZONELIST_PRIVATE contains all private nodes, should we use some explicit target
> nodemask here to make sure only the targeting owner's private node can be touched?
> 
> Otherwise it might fall back into a different owner's private node.
> 
> --Richard
> 

Zonelists and the constructors here is a bit difficult to understand,
and I see I actually did a poor job of explaining what's going on in
the comments here.  I will fix that up in v6.

Lets say we have the following nodes:
   N_MEMORY :  0 1
   N_MEMORY_PRIVATE : 2 3

The following zonelists would exist:

ZONELIST_FALLBACK[0]   = {0,1}
ZONELIST_FALLBACK[1]   = {1,0}
ZONELIST_FALLBACK[2]   = {0,1}
ZONELIST_FALLBACK[3]   = {0,1}
ZONELIST_NOFALLBACK[0] = {0}
ZONELIST_NOFALLBACK[1] = {1}
ZONELIST_NOFALLBACK[2] = {}
ZONELIST_NOFALLBACK[3] = {}
ZONELIST_PRIVATE[0]    = {0,1}
ZONELIST_PRIVATE[1]    = {1,0}
ZONELIST_PRIVATE[2]    = {2,0,1}  <- no fallback to 3
ZONELIST_PRIVATE[3]    = {3,0,1}  <- no fallback to 2
ZONELIST_PRIVATE_NOFALLBACK[0] = {0}
ZONELIST_PRIVATE_NOFALLBACK[1] = {1}
ZONELIST_PRIVATE_NOFALLBACK[2] = {2} <- __GFP_THISNODE
ZONELIST_PRIVATE_NOFALLBACK[3] = {3} <- __GFP_THISNODE

In the current design, we actually can never fallback to another private
node, and instead if you wanted to - for example - interleave across
said nodes you'd have to do so manually.

I think it's reasonable to later extend zonelist construction to support
such a think like:

ZONELIST_PRIVATE[2] = {2,0,1,3}

Later if such a need arises, but I would say wait for the use case.

~Gregory
