Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793777149;
	b=CIKt9OKmPtIizCLYQI54mgm1piIwH0injd7DC+cc9zCiwnHAaYQ5FSDQKd0DWpTO3BD3
	 EClDmxXUn8/l1GeBHArwVI4FUf0V4D/Vij/UGyCCT3ssyKTFb+qwlxhvEefbS1cuysxtt
	 KsqMZuwAe8aHkGXo6pZ/UchXAt/IpDALyUxZqMZ+StkB6voHhuT+PNuE4Q/q9nDEjoD15
	 d7lmfKbnqz823ZZ+1Fs1HFXU7FuHCmyaSHqldjAdP3msVJCrs/uJ/kWGg33GPpdfOWJ3t
	 zNbTRcpe6jWMHfy9Rq6UVl7RXgQ8kM1Hhr/wk57kvEn/topLYfVgyzDIhucHm8GoQog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793777149;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
	b=idmj552xNvwMKcS/L53WFh/4SJami5LTMBRCFclOuJX58sUyC4rg+h2oRvh8dKivJ94M
	 Uy3OKNFyis5Khd0snSFS2EVdZlLMruig/cXmlvGPbrHZlX1gGZsQqOy45PjAHRECFlSuz
	 2vVUUC48mM4pygnn99bmllIURejDBzzKQxpx41fxFSo3S/0eZqb/9Gy7PUsyM5gz66s6A
	 B++4/j4gfWJXomYJH2RfBzGKmpT3B9EG1Ft54hddAEEYFOz0QkqI+s2LwvrgfdIyrvLK6
	 8T0AiJ0pMgJYEzlmvnNh+r7hGghVqjIQgLs1l3I6lNYKXiS14jnZ/tb7t8wAiIY8Gyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	dkim=pass header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VRgHZidZ;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DCC0606A326
	for <linux-debuggers@vger.kernel.org>; Wed,  4 Nov 2026 07:25:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8DCC0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=VRgHZidZ
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3adb9cbb0c3so62554a91.1
        for <linux-debuggers@vger.kernel.org>; Tue, 03 Nov 2026 23:25:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20260707.gappssmtp.com; s=20260707; t=1793777148; x=1794381948; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
        b=VRgHZidZURljCrK0HH3V2vKy9f31BQ0iYTP43G6ikNvBR4QjOxKvexYUY5uUu+JitD
         T9TOLxU3AuwSiEfvs+OeG0AzPdwnVqjedfkdmdtpWZVvyj1FCA9sCGyKG3IfgqeMduF7
         tADytHQvwR9g70pEF30quutiy5cwA5plryhJHjdgJ/FA7lKi9UOpU0Hi2aHxpB9zmmLz
         p7lB/1HmvqOF5+WzgD1Xyuwg3Sd7aC8aoth5hS9HATjN45F4AIk9OThyjOW0PZmMn8Gb
         PyeFm2ozp72iY7GtQJs9SMMvKa8+VY3YqslwzoN50PyVfinzUal3mgUUKUFwvo9oFTcD
         Kj2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793777148; x=1794381948;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HGf7LW+11fFCmkfZDnBYSiu7NHiZ1J+7B7vrKk2MO+o=;
        b=y8ZwoWCJN8U1+zwI6uvcM1kCkOuCFYDWAvUO2tWQuSjYATYmYmzaBnzcFAHwXtwZZR
         UVhNraevSSUcl5gYD4cD4v/MFDEJGgpUw4bkhRuddhiAGDzrKUtzX7Hg7US2f69/SGva
         PEB7AC/XTFsC/PA5KdOredK7mCpVJ7myyhW21f2uGOoWz5kDaZx51v66ju3Fhsujbuji
         mazXJ4zzAYXBlqjNS7N9t3YI8qOSOm7HkA6icKJcUWEg9DMPk1jdYkSc5MtD6ifYegTq
         3voCAWBpazejHupBB/SOIGj2ijusm3KZznpAlmCTJ6F7lBqO1nuXImy5nyBdUkSuL3Wx
         0z2g==
X-Forwarded-Encrypted: i=1; AKwUvBx9+X/Rqe08oM3ZDbj7xVQVn2BaJdQf76Y2GRTUpA319QFixD7HsaTSiuPWtkSianA1LIJmt/BtwBwatN79tDo=@vger.kernel.org
X-Gm-Message-State: APuU4Z+aVzwf6lwwEFeH9QTkvKcKgu/2cRbx6QrAJLQ2IHDV5holPdYD
	hdcSde7v0zp8X5+/B+hbJoa1hil99Sua6uv0lU1sFHci61queq+Esc0aBDF06wzPgZ8=
X-Gm-Gg: AYBFou0+KF4d2pOFrxTasphpa08xpIvwkABVHhH4Lck9iNYfnwDDxJH7BmWiB+1P7b9
	vLFz9wMfq5NC5BnNT+ko6DdCp68ybz0wwJzqjUaNTs41lgSwe5zuHD0udXbaJOu1P6gTlRAHvh7
	5gR1LJXd8CRq4o5z+UHVj0vPKRwH3eXeKMG65eP9lg+ehqPg8kGWukXlbhVynwub2k8w70+A4Ic
	50fKzawgCJ5XQWXjbQHTFo54m+Im87XqDuvXIXlTSOOgr8ckvJbWyl2sKzkxWP6dh7iPde6qeh1
	JUn6sqjeSSqWVYdDgPZUshM4mh2EKdkVjmRCQTNitsL/bhHcrpSFvW/Ka6hksJTkHJ4BT6H+j/l
	7SS4GTiCpMA1dWbfdOefLjhRuR8GDYy9+ZM06cZh42FUnDJPgfyo1mfvb3/zE/pa//BKxPw/ZF+
	KDd/eut78XIZmL0KQj4HuIA20C90PUl2Q/0x2loCtoYn1WxKMNV4Ti6nM3nMiLvg20vzruAswFq
	29RmWpv8Aja5FMFZNIVBjPH7M1GddgbZjgVznI4SuxDZeF8axKhBXVnME6T2NV2HYocU9//00Hi
	OmoACAZqSArV32ixDG292NxDjlk8wYf9jg1L9PFxaWceaS1a2PQCcs4NBV4NbXdrsAwN7qxGTlX
	ChlAEcOGPJoqwHwRKsyPFooJB09jNTqSL1OL62RDd5F2Zy7I7XqI+8khm
X-Received: by 2002:a17:90b:4488:b0:3b0:9a3e:bf8b with SMTP id 98e67ed59e1d1-3b09a3ec031mr1494219a91.6.1793777147801;
        Tue, 03 Nov 2026 23:25:47 -0800 (PST)
Received: from os-N5J97HY9XQ.tail2dda0.ts.net (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b09311866fsm2861006a91.17.2026.11.03.23.25.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 23:25:47 -0800 (PST)
Date: Tue, 3 Nov 2026 23:25:46 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <aurd-kCBE7ebENUl@os-N5J97HY9XQ.tail2dda0.ts.net>
References: <auAmuqZyUodq3iqk@chrisdown.name>
 <auKKisespDm1xLLg@os-N5J97HY9XQ>
 <auOEhTNaKzu8dgEy@chrisdown.name>
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auOEhTNaKzu8dgEy@chrisdown.name>

On Fri, Oct 30, 2026 at 01:38:13AM +0800, Chris Down wrote:
> Hi Omar,
> 
> Thanks for taking a look!
> 
> Omar Sandoval writes:
> > The code looks correct, but is there a reason that /proc/kcore
> > (CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
> > memory (e.g., CAP_BPF + CAP_PERFMON)?
> 
> Not in terms of what it can read, indeed. I would say the distinction is
> more about who needs each capability and what we can remove.
> 
> Abstractly speaking CAP_SYS_RAWIO may be needed for hardware access without
> necessarily wanting to grant general RAM access. STRICT_DEVMEM already makes
> that possible for /dev/mem, but /proc/kcore gives the same capability to do
> general purpose RAM reading anyway.
> 
> In our case in particular, a process with CAP_SYS_RAWIO doesn't necessarily
> have CAP_BPF and CAP_PERFMON, so keeping BPF available doesn't make removing
> kcore redundant.  On the hosts in question, BPF tracing and BPF LSM are part
> of the monitoring and sandboxing we rely on, so we can't remove it from the
> kernel entirely, but we nevertheless keep CAP_BPF and CAP_PERFMON away from
> guest facing processes. Nothing on those host uses /proc/kcore, so we remove
> it as one more gap to close.
> 
> For that reason those hosts already run with CONFIG_PROC_KCORE=n, while
> other hosts keep kcore to aid debugging, since they have a different threat
> model.  This patch, then, lets us preserve those choices while using the
> same kernel image.
> 
> In retrospect I should have explained that better in the commit message :-)
> I can update it for v2. Does that make more sense? Let me know if I can
> clarify further.
> 
> Thanks!

Yeah, with a bit more justification in the commit message I'm fine with
this.

Thanks,
Omar
