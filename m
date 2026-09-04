Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 730E138E5C4
	for <linux-debuggers@vger.kernel.org>; Fri,  4 Sep 2026 03:18:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788491890; cv=none; b=ihHavNk+gs9nEqdnTrUDwQnoYo0+BiYsiivXwo7yRI+q2scnAHh2I47tb6G3YtpNy3hf9mbLT+e/EmW4yocCe38wa0Az8wi8pwcHseafpYa0tG0fpWpEHfe6Pre7syYS2vBPxW6CqX0EYSJpSNL5dLQFWtjvr0LR3Dz4B/MnxPU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788491890; c=relaxed/simple;
	bh=AIU6NGTW/RpZfTt6y2cuypcAmkoFDaCDqNNZTCJi0Bc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X1DZyW5+23YOCpZK7wIOsbkQVig62cuDLqmtGTrTQcGcs0uY5cSLcaVK43f+5AT9j62S+XLjkFkfS8cOtb/3xy4bOE08vzQ9wkttGevXMGxAZNYDuXRZ0fv0ResEETyy7CCqIpf2qIrEwb//CFDAviU0gqDx+k9JlzFm1gddmiU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XXnf1qrk; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XXnf1qrk"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-5303932c4f3so3554631cf.2
        for <linux-debuggers@vger.kernel.org>; Thu, 03 Sep 2026 20:18:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1788491887; x=1789096687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=I82bST350eZ9tF0sXAbqbqSO4hf+URoRFBA/uGedV7I=;
        b=XXnf1qrkElo3aCzA7QExaOWSdNxP/unmoxpQ7Nl14LSqP+OXLeyp+7TwEx+/0vPFXS
         mbXWBII3WXz82rpc/mRXs5oQAafMXv/lR9i6NSNTO7vI6fbUQ9Lm/H+/70dUKyPYID/D
         rINud0bXIB6JWQRfob5+wo6/7GzlrBSpoLZZyO4V6Mq1y4oT1jQb28+99bKN5jmlVfq7
         XLGDbXv6L3DciY+gWrXNu3RIZDTtpgb+GehzhnXRXGRkpYwMGg9GSc7zeFG53wLU+gCx
         flGxyi214iKlFdnetOf0+RVR7gjNDakGPu1348MlAGrbuEUQ+hjaFC/oLLirlUZ3Lv2L
         lQ3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788491887; x=1789096687;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I82bST350eZ9tF0sXAbqbqSO4hf+URoRFBA/uGedV7I=;
        b=sgXAYFMDvbOdcDZVlJNU9Hk77sliVgusR2CYWVaCVHvRJTDlueBCqxqw1UDXcoENdy
         9iFagxoZn82IzlR0Jzi6+Uht1mFJ0fdCERNVskNLzDaY2I3lVBq5lM9OXZolyZJnFY5p
         OUPue3o3W0tCVdlTT6WeoEfULtgFRvk80E5D6dAHoa4XFTgtS3MOYlWVNNEncy1XtmDk
         0WuUSOu24uwC2Eva3Zhzna/IbBWDUtgP3DRiRsK94k5SFt97jMzh69n1peYT7UTVtzGX
         7X51hwME+ZYQjCcX1hkIz2U8u+oOgG92OmGhcsAGCyvdAiysSdFI24qSF/73n8lDQ6gX
         p8xA==
X-Forwarded-Encrypted: i=1; AKwUvBzczeXCBRrdnkn2yA58RmQ67AdIx+CX6qKbwIFDy88SUC27CZLuOIh5oWKpw8Vv1ZTzah5hfHd/+YyDJP4S5A4=@vger.kernel.org
X-Gm-Message-State: AFuF++kOwpj2EBAwoZ4UtRUELSWvvN0xLziR9l+zJfEfSq6kWv9J4Xn0
	i1t3QQx87jfPprhzQ5NSeX/cJ3GMhDArHfWThILBlHiJ0RMSG+zOue/minq+b993wR4=
X-Gm-Gg: AYBFou19R2ismHfy2kL4JfA82jrhdgHayy7Uw4nsrRF2PwaEzqRCp66yH3SLwdZRooA
	7r517fqN3ZwwZhJuhRe2DYCUAXtv0psgdkCF2Ok1ZYe5SdZ/BkRuPhAVKK04DtCDqVbiEksBrHk
	IGrz5XU3+Nnh88oeBIqIWECALkAIe86Awa8IYAO2Nd6FhI6EJD1VA5l1Oqnim0ve7XzOj/DVnmg
	5x9TmhFjPkW5AeMrbst17bcsYDGJYe8rMWu2rggy7oeNfa56MzaNCtHti38mN7Il8fqwCXK1T2S
	xUYME2ga+siYYEDkt8g/USmbSygxIZrVObZuNd0olu60NuD7Haj4Hc6KiiC6/Rw5pYT7mzeLIJC
	GMcHF9tAgeyX8T6lCypdFAHivWOOF2vAC44J4rFSujDdcS9iJ0Jsgn1pMnUoNoHMbFz920HdHKh
	4M8JPuU+Z34H0qZkqVopNiuuSKgMBWDkesYW/tDccHzD4s6zcjkPNWWXDHfFGoP4IlZRI1otuEB
	FlSCHEjFFgXyDtKvcUSzifiYm//N4uBkomY93iqNnOMK0df9vr18+A=
X-Received: by 2002:a05:622a:1c18:b0:52d:4f43:d5b0 with SMTP id d75a77b69052e-530548bc5e0mr43078621cf.22.1788491887027;
        Thu, 03 Sep 2026 20:18:07 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-5305402a7b7sm11260161cf.3.2026.09.03.20.18.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 03 Sep 2026 20:18:06 -0700 (PDT)
Date: Thu, 3 Sep 2026 23:18:03 -0400
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
Message-ID: <apo3bZab6qtCosQM@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <20260720193431.3841992-26-gourry@gourry.net>
 <6840c720-8cb7-46bb-a652-040c130a4427@huawei.com>
 <aoJaaYp30LnKLj1w@gourry-fedora-PF4VCD3F>
 <0334fe7d-d949-45f7-8914-3012cb11b740@huawei.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0334fe7d-d949-45f7-8914-3012cb11b740@huawei.com>

On Fri, Sep 04, 2026 at 09:05:39AM +0800, Qiqi Li wrote:
> On 8/17/2026 8:49 AM, Gregory Price wrote:
> > It would need to be reserved, and you could use numa emulation but
> > that's clunky.  I have an RFC for exactly this issue - though i haven't
> > pushed it further yet.
> > 
> > https://lore.kernel.org/all/20260610014517.253609-1-gourry@gourry.net/
> 
> Hi Gregory,
> 
> Sorry for the late reply.
> 
> I took a look at the exclusive-node RFC. The approach looks useful for
> device-backed private memory without a firmware-described NUMA node.
> Thanks for the pointer.
> 
> We are currently looking into the private-node and CRAM design as a
> whole. I noticed that CRAM was not included with the v5 series, and saw
> that others were also interested in a v5 version.
> 
> If you already have a CRAM branch or patches based on v5, even if they
> are still work in progress, would you mind sharing them? It would be
> very helpful for us to continue testing the overall design.
>

I dropped it off because it was starting to become unwieldly, but i am
continuing to maintain a branch on my github:

https://github.com/gourryinverse/linux/commits/scratch/gourry/cramtest/cram_72/

I have not posted a new version in some time and it has been reworked
significantly in the past few months - but I plan to talk about this
particular branch and the tests I've run with it at the device memory
LPC micro-conference.

I validated this branch against most in-tree (relevant) filesystems for
the page-cache extension, but I imagine the anon-only version subset is
the more immediately interesting for upstream development.

I may include the anon-only version in v6, but I've been a bit busy
shoring up the base private memory node core and implementing kernel
selftests and LTP tests to ensure there's no userland api regressions.

I hope to get something out later this month.

~Gregory
