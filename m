Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D19A35201E
	for <linux-debuggers@vger.kernel.org>; Wed, 22 Jul 2026 13:43:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784727810; cv=none; b=QZ0OQUt6RcUJILc2/iFNmerAN7uXizK6K59lQfMHQ6qnhN7R3k7Sn7XsXcYdH96oIdGsvyNh0Gw5GlCnilB8qnVz+/F8IXKWujkCeT1lWOVfnPVgDMFy6n8TPGPyqB/IKRWOEt10CULtj9JFBkUYn0kVy3eheTPY0TcKYfs4+Yk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784727810; c=relaxed/simple;
	bh=PYGMpBdbfrddSWhi8wSkhjZKYMi0cam4nIYPZarnXJw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/mt91xJ6RKKcn2jcHSbzD8D4uszSWI7/4jDFK5V/mvpSJKbIYXd/fimCJbgPq1yXRdxcaLy7gRPzurmldBjQS+PyyiMT9JBlqjma2DkOW+bsrcLaH5L86nq8O1eLZTLH/KMtvB1oSaPHKg0uszu2GC6dXakF+sSp57RRLQ/W7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=QG1gO5uC; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="QG1gO5uC"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-51c2a449c57so125983241cf.1
        for <linux-debuggers@vger.kernel.org>; Wed, 22 Jul 2026 06:43:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784727807; x=1785332607; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=wqGzltcyJPxwfdEhPSjMSETzXly+gOy2t1lReGVE8tY=;
        b=QG1gO5uCmzfckS/4hrc8GaGFjBboFkrunoc3JyezIFVZDpSfgRfasKH01+RjgBtnW7
         oNviLvafLrI+ny8eRATwbyYk8NPOzuWTnrVKeCqOjPgPr5ijUDKHTORpByWhRIJooYlL
         Xwp3Cla/WAYyuwmkhBcwzLaRLmP8eTSeUEDEgRHqcn8hSeJ/2/aXsmMnakunQbWq8sgM
         5WgEbzekaktHb9KZqu4HrgyPmbSPconuKte38ex1GDbA+5zx/Gl4DKgVwM61MEJcZzXi
         SnaijE/jQgrTohKRpeo7PkHDeeCIREbeou4mPGxOwj5JtWYd1bKRCfwW96yEkcEEsHHF
         w/TQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784727807; x=1785332607;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wqGzltcyJPxwfdEhPSjMSETzXly+gOy2t1lReGVE8tY=;
        b=MgK81C7AtnZCQ3WNDO6d8DsI9NWKLbfTi+SLqBQtqlDgCh5VJsGTjT6rp7SjY/8ZJ5
         eUEGcVLKIStJIZh7Ci59AFgRnJQWfMlT8DrJN8IsINtpMfUHT6CksT9a55OxblADBSkg
         JFnennZGdUX3q1XNK9y+MTZbIuNCIg3R95XKbQKIIKpJS+Qr9gLxAeyCWUXYTfuYatOk
         MHBKPdfKSD4PNJOhui6dZsWvPOaPFsxEJsnFHdYVZBQAdXUEoKcVqWB2ZGE8M9jSg9ST
         ILrLGfGaXrbd3HYAUNUFYxLnSNm19WTm3FODj9cM4RMhFtva1t9LpW7U+hJECbr71nu5
         r/Zg==
X-Forwarded-Encrypted: i=1; AHgh+Rq9jV26+/wIouTljp8vN4zPdC3LQPjP3GcQcYBpW5uihTqNPOywcxvBU9sSB8JAPQRkGpjYLnB1Z0tCZG2AjsQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJuoHt1KeZ4lh5i++XQK4OGr1KXeVnMenA258Lwuzyv3hQO0v2
	JDx9zS423oJBHFnyggahkUI1H8UNZ9eoYb0UK0N6qN5eb/ALh6ZK6++Kt+MYacxknQ4=
X-Gm-Gg: AR+sD10KAVOjlqMx6Fv46qe6feY7HDa91TH9SpCxR/mn6rtbGja6IBOXzMY5z7r62gB
	nLJs86C5IvhZbSUGnd5LBGlf5Vmuoo64Sj6qfWefWomztryegILQWTDM2cn6Ji4wE1ZGA065I4z
	jEb0ny4lOBsrumI4DHBUnyHUYquNabBIYEYC9vwwWwyUgKUBAlCVbYjdQEx0kyv1giFovSvNvnq
	n+GD1pgWyh+7vSpAtfVdfk8PS/AecmBdlmLY9HzsVjNExJLy7KH4TuxtM+2CIGBRE9MsZE8wwVm
	+iH1cmpj61uZoGprNTrGlHsfrlD0sDFOESB/yU/R2auj1XR7m+M7hB17MxQoPRAYlhPGBCeSJbU
	pZdMVRzaQhsgFys7FkJOBmpsw1NGs4Csz7OVhDb/a2TQnG1axg3IdyfzY9elz4Oz4ur3RwT0Op9
	l8RSf4DpoKMCeocfQJ8xakE0F1R9FQ2yV8qD+14RKR6/JWf53rvHurc+FhprQmXDjN6w0i
X-Received: by 2002:a05:622a:1f91:b0:516:e152:7a59 with SMTP id d75a77b69052e-5213e08256bmr218014961cf.42.1784727806950;
        Wed, 22 Jul 2026 06:43:26 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-527d3b3f66dsm15332181cf.27.2026.07.22.06.43.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Jul 2026 06:43:26 -0700 (PDT)
Date: Wed, 22 Jul 2026 09:43:21 -0400
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
Subject: Re: [PATCH v5 32/36] mm/khugepaged: base private node collapse
 eligiblity on actor/cap bits
Message-ID: <amDIuZSsOPjRkywY@gourry-fedora-PF4VCD3F>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <20260720193431.3841992-33-gourry@gourry.net>
 <amDEEnTv0QumcDJn@MWDK4CY14F>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <amDEEnTv0QumcDJn@MWDK4CY14F>

On Wed, Jul 22, 2026 at 09:24:37PM +0800, Richard Cheng wrote:
> On Mon, Jul 20, 2026 at 03:34:26PM +0800, Gregory Price wrote:
> >  
> >  		page = vm_normal_page(vma, addr, pteval);
> > -		if (unlikely(!page) || unlikely(page_is_private_managed(page))) {
> > +		if (unlikely(!page) ||
> > +		    unlikely(!page_allows_collapse(page, cc->is_khugepaged))) {
> 
> I think collapse_scan_file() need something like folio_allows_collapse() check as well.
> 

I believe you are correct, sashiko up some stuff here too.

Thanks!
~Gregory
