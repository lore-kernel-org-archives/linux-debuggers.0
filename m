Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AFE33B635F
	for <linux-debuggers@vger.kernel.org>; Tue, 30 Jun 2026 17:27:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782840454; cv=none; b=taR4Dlmqu7R0ZM+fZlw9132GIe6uj1tNaBtXq0DMfb73LdV27wdFECabx1jT8zMw+a59LJzD4lcJjD2Az/35XEsyGG8mZpDAJg+fjAZFy01a3VbvqP61MbaAUlDy++CoydGWd7Fwmln+BuAQQ3XHBReq9YAyNfDh8sb5vp/GTCo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782840454; c=relaxed/simple;
	bh=cpJDAfmkCb52KIcjGbUHn46Fc6ElTLojy6+Uy8aV6TA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Zhr/isjYs+9jNvBHqxCqlkpGNzOM6MsZwcmVfZsByy++yf7Eb7h7nxVCeU1QwCWJg8knZj/YbFaqMmFP/HtoimmvnVd5k4Jpk1cMKq5OUZfMvEc3P/gUcEqtFBIAVeXOFAGdXPjCKOclbgXuDosyPAzvfE1IaErtcQW88kMWAf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=O/MJcEC6; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="O/MJcEC6"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-38096590070so18042a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 30 Jun 2026 10:27:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1782840452; x=1783445252; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mEWK+cz0pWLfZOESv7QrVKgCk8tcF/V0/yY5GFbhhOg=;
        b=O/MJcEC64HTSMeOCXWqMxYy+qhPQH+QTaLFeea45hg/YAKaYVNviQl/hUSSVpUrCxm
         9nBs0FKXS7h6IDUV3fEOvsfNoDm2Srj66/XgATzl29c5hl2WXmEcP44nTJtWC09kKslk
         3gd9CUnBPmZcqptxuYH44o2hhmKzB91oD6ZKYsEgA4pYeD8OF6V5+629+pIQgdS6gkd7
         Ot73qrSeKda3KPUB5opL5uTMVx59txmEnhYddhIgPd0wYgSjOVdJ8x746HNzI+R86W7N
         jm1jzF9HRM1AIvl3w4Mfnou1kFPDkbOZFmwRdlaimeC2v8gDtl2woGVWpgOxv+72WY+h
         YFrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782840452; x=1783445252;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mEWK+cz0pWLfZOESv7QrVKgCk8tcF/V0/yY5GFbhhOg=;
        b=XvHrxlbs9qYX5hdGY1rur2ekjzM2nKEx0my++Bp+qUv/0Kaar7EicCqdkmWi6G97P/
         J2Cwi79qgzGSq7JDJZ4dNr0ELXXs+f1gB1/Cc3c3n+UKHNeAY9VI6WQ0XxfA9QcqG9DT
         La9cjUqty6P7h6ayVSV7/90hYbcOoJ0gFNEwoAo/mOX6c0etCXx1G/6NxN2qY5amchJN
         OI65CNSn0q/HxrIM6gwZNs+vXz4wCNagigkjVXdybim8Hya+SiBzAHFZJ1EJgo8/rvIC
         sw71UT0zCcpEfU4plDx5wDjcmj2uXe4xUFjZkqK7e+1ZlDP/MZ/WQofsfbz/d48R3Iik
         Eazw==
X-Gm-Message-State: AOJu0YxT3WYX3J2ibwGZCc7jgK8+UANA/oq6nq9DwCibNMNOT3Kz9ZhM
	LT6RT0EoEcLtw7uJIV1TthyWDP8flBmp2tZzPO+buz3O0vPAK+jorAtJYNmwiEj7lvjGi1qwglh
	doBMU
X-Gm-Gg: AfdE7clOCj5t2CM5yiMA8/ejXzHm6Eadwsy1vfT9+AD/46X2rcvCBnTGsxOglz95IbB
	uBvfWtvq/jlnPPho1vyzgr5wV6PA8l8cTCxccyQx3ESv6ARCcbG7e89Yrr1zl89aAJSboGI7plW
	HErbJkcIJpfSj3lkXU4BfXKWpjZcQSeDTvqBBGBK/ByWxYS7unjsI0zTWKjwGj7qS3S/hqPpBln
	ljwC3QcbeqAkv8o+7B245H5HdAbhmLvmLx+7rM09F9DtmvDezAsHfRLtLBxpQS2qzQnEH2UBPLd
	4YsRN/sLJY/lNvJ6jBa0sRT5OZMAJsrps1S1o9pBZydn6sCii4FQOqtmBjfnjVxTnPm9BEANH1U
	MgnFFK9sQBJfdD70pTe3ZqCyJn/79qenSR4WfwZMSLVeTFTZyOEuLfiaILow0CJKa4KrwIwzk4k
	qXA+bnuLnqs3gaBQpZNOutOWuAOURFpenEjLkrbLogkJkvQZVH3vZzVLJ8P9gPjIjZJK0CcR6wd
	d/y2EIM
X-Received: by 2002:a17:90b:58c5:b0:37f:bfc9:55fe with SMTP id 98e67ed59e1d1-380527b6719mr2129450a91.3.1782840452197;
        Tue, 30 Jun 2026 10:27:32 -0700 (PDT)
Received: from telecaster (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38095ea3011sm267699a91.15.2026.06.30.10.27.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 10:27:31 -0700 (PDT)
Date: Tue, 30 Jun 2026 10:27:31 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Serapheim Dimitropoulos <serapheimd@gmail.com>
Cc: linux-debuggers@vger.kernel.org, Usama Arif <usama.arif@linux.dev>
Subject: Re: Debugging Microconference at Linux Plumbers Conference?
Message-ID: <akP8g_SiT2H2VwrZ@telecaster>
References: <adaxdvQvJX318oy9@telecaster>
 <20260409144144.72399-1-sdimitropoulos@coreweave.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260409144144.72399-1-sdimitropoulos@coreweave.com>

On Thu, Apr 09, 2026 at 10:41:44AM -0400, Serapheim Dimitropoulos wrote:
> On Wed, Apr 08, 2026 at 12:50:14PM -0700, Omar Sandoval wrote:
> > We are gauging interest in hosting another Debugging Microconference at
> > Linux Plumbers Conference this year. Topics would focus on common
> > challenges people are facing with debugging tooling: collecting and
> > analyzing core dumps, doing live analysis, developing more powerful
> > debugger features and tools, etc.
> 
> I'd be interested in attending and potentially starting a discussion
> over a few things that we've been working on at CoreWeave!
> 
> Specifically:
> 
> (1) Capturing crash dumps with tight memory and space constraints at
>     scale
> 
> (2) Triaging, deduplicating, and categorizing crash dumps in
>     production
> 
> (3) We've been experimenting with out-of-band kernel introspection
>     (using drgn in a DPU to introspect the host with one-sided RDMA
>     ops). Would be cool to see if others have worked on the same or
>     similar problems.
> 
> Thanks,
> Serapheim

Just to update the list, instead of having a separate Debugging
Microconference, we're going to submit topics to the Monitoring and
Observability MC since that has a lot of overlap:
https://lpc.events/event/20/sessions/262/.

Serapheim: Usama, who is one of the Monitoring and Observability MC
leads, expressed interest in your topics and asked if you could submit
something.

Thanks,
Omar
