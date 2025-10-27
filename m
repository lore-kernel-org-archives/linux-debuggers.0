Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3521619D07A
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 18:15:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761588939; cv=none; b=auyrzuokDcwVZXP5ZCXPia93S0nJr5olGXfC990o1D34f69HFRa41bS4IVp5o/IAOjrBGllb0oByRUyfwG+UzNUrv/utDEcaehmulmGcxaEe8Gpgvrz2C/EO61A+vS8HwpUSKlxRA2w8HtZLVFpWnN3aG/kOCVaa+GtiR77ud04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761588939; c=relaxed/simple;
	bh=ZrP+c6fYXVmlDgzH2Aos9A/AVisfD22UA7ePy3Zi/OU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnOdQQJfYQh55FFS+3T5SmxEvZtj1q+6oQSxb5vPsQk3a9E/bwI25SWdXbT3Q5l9IChuELMEKy6O/wDKolYbeaJZpIfmcNuqPcl+8+MPnj+dbkGXMT9CKMGnSkw5jVzGntuyUocVjaKy4KQf/Qg81KunhZhHrptLp4fIiJEighE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=AuCcOdDA; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="AuCcOdDA"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7a432101882so67360b3a.3
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 11:15:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1761588937; x=1762193737; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=U4cQfaALGoc4/l8gySmGcJH2leMlkWogl7C+rSKi2tY=;
        b=AuCcOdDAexzbXud1Af27jrM2BUhA4M5EE+yvEV1n6hv+w1NJ3D7JW1pykq7krX42Fh
         SNl/+dBIDoxfWAH+DVJMeuzKsSoxPHQL9/cdHkTfsRhxOC0jTl+Uw8kDw50S2LCPjxxG
         DdyIO3zdG6eJw72CluU8geZIy1myXfZqi60IUZucKStg9/h/0RKzwOrTPop78EqegN9y
         g55g95jeS41k0KEhgVqI6IRlYAeyoSkeJAdro7PqDBRczQkqYKYCLCXvaUJHX+goZBbr
         5ZhtMHCBdIVWyd36XnTrFuXyq0TI1vln0OIK0AZSVZ/hdO8TAMbCms2dKPGu7uwIxGbd
         Mrxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761588937; x=1762193737;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U4cQfaALGoc4/l8gySmGcJH2leMlkWogl7C+rSKi2tY=;
        b=mbwTS3mVUm9zdRADU34KWVQJVK4VPPssqMPqkMY7L6RL+nx2T2ZsRMFa2TnEr3eLIq
         msT7HgfWyynaSzGu/yx7ndzkMuGYhLAL1+RJ0BhPfkSdfy2T9wz+UL0A78DnTbgqyyjS
         ToQH14m+K8Td3u/9wLA7Pd83OAArEVaRIwS1SL6pfwsT7Ep2ItSxmg1izP+bmTrvkYqQ
         CXTESwVGYCmW4UuhoFB2bpE/6J0mKw47/au+MIhpghhpTOqfkdlALHcHhmlo9Sj1i5Oa
         Kvnqr5hd6U/GDJSaJaNLtJ6mvxTLlABgsM/2gmvWsjXtdvaJYvUUV53KENxPiNwgF4sE
         TTEQ==
X-Forwarded-Encrypted: i=1; AJvYcCUQIlvvEO1LkJZyYDHUAI3heZgbPszIQyHgej/WguwHdyArGimqiuvogM27RrRdDPuI5tXKqnurlOoKTIdzNzo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwHJzkMCketHM01onbCajY5mPEtUG036eVTPsOcOtkPOckylJ3a
	01wCgwko77bURLAR1BBrMSoHujL3Dhb+vjLiVXdLNRpYD+0I8hjLbUGtdvoDfuJ2u0iFSf6GMH7
	GL4k8
X-Gm-Gg: ASbGncu1U2rJFRAUvVb1YMBD8kp+WDXPOReGq2nxpaN4vQ/l7BILQDSbyFlXxLCD6Jr
	vkmNdXx3NNpMZ6vXk6xvcto8uE5fGzTX6iMqzsS7T3YULM7/prNLZ4RH26u+WvNDrL2PwF4I77y
	kFzqt6xhCcH4pn78dqsbKqTKXzYmB6kX35+XOAbxwZFcR3vGadNUxnMLLKs8LrgwQz7nfFStiKC
	fumatAHvNaCsu2LM0UUkEM/6RprsUM7EEyzpMkvgF0D49mCNKexFA7XZBH48eW8qrVX3tJ+Nojq
	S+e+e72jOOxG3JHK49tRDO60kRxX9t7oXLQfzro+Y9NXBqbOD4SIZrN5sCkarWvwTHOoAgWUzG2
	ByDpnSomxcPoSubWOg1/hPBtUbOL42tKXvmC9FqdTxeUBto8abh3+Wd8IrGAY1jYv3eM=
X-Google-Smtp-Source: AGHT+IErLx4Y+CSbvwTvDMkVz8jKZH2EyxwoVZhXlu4W9Ro2SZvylBJFK1+cynLtv1hH9V9kl98hhw==
X-Received: by 2002:a17:903:2f0d:b0:290:ccf2:9371 with SMTP id d9443c01a7336-294caca9e03mr5485335ad.0.1761588937149;
        Mon, 27 Oct 2025 11:15:37 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::4:c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d4287bsm91043815ad.80.2025.10.27.11.15.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:15:36 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:15:35 -0700
From: Omar Sandoval <osandov@osandov.com>
To: David Hildenbrand <david@redhat.com>
Cc: Israel Batista <linux@israelbatista.dev.br>, akpm@linux-foundation.org,
	linux-mm@kvack.org, linux-debuggers@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
Message-ID: <aP-2x314BKks2_N9@telecaster>
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>

On Mon, Oct 27, 2025 at 10:29:15AM +0100, David Hildenbrand wrote:
> On 26.10.25 17:22, Israel Batista wrote:
> > The MEM_* constants indicating the state of the memory block are
> > currently defined as macros, meaning their definitions will be omitted
> > from the debuginfo on most kernel builds. This makes it harder for
> > debuggers to correctly map the block state at runtime, which can be
> > quite useful when analysing errors related to memory hot plugging and
> > unplugging with tools such as drgn and eBPF.
> > 
> > Converting the constants to an enum will ensure the correct information
> > is emitted by the compiler and available for the debugger, without needing
> > to hard-code them into the debugger and track their changes.
> > 
> > Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
> > ---
> >   include/linux/memory.h | 16 +++++++++-------
> >   1 file changed, 9 insertions(+), 7 deletions(-)
> > 
> > diff --git a/include/linux/memory.h b/include/linux/memory.h
> > index ba1515160894..8feba3bfcd18 100644
> > --- a/include/linux/memory.h
> > +++ b/include/linux/memory.h
> > @@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
> >   unsigned long memory_block_size_bytes(void);
> >   int set_memory_block_size_order(unsigned int order);
> > -/* These states are exposed to userspace as text strings in sysfs */
> > -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
> > -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
> > -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
> > -#define	MEM_GOING_ONLINE	(1<<3)
> > -#define	MEM_CANCEL_ONLINE	(1<<4)
> > -#define	MEM_CANCEL_OFFLINE	(1<<5)
> > +enum mem_states {
> > +	/* These states are exposed to userspace as text strings in sysfs */
> > +	MEM_ONLINE		 = (1<<0), /* exposed to userspace */
> > +	MEM_GOING_OFFLINE	 = (1<<1), /* exposed to userspace */
> > +	MEM_OFFLINE		 = (1<<2), /* exposed to userspace */
> > +	MEM_GOING_ONLINE	 = (1<<3),
> > +	MEM_CANCEL_ONLINE	 = (1<<4),
> > +	MEM_CANCEL_OFFLINE	 = (1<<5),
> > +};
> >   struct memory_notify {
> >   	unsigned long start_pfn;
> 
> CCing Lorenzo, we recently had a discussion about such conversions.

Yeah, I've been asking people to send out these conversions as we
encounter them in drgn, but ONLY when the absence of a value in the
kernel debugging symbols causes actual problems for drgn. I want it to
be clear that we're not spamming these just to cause churn. This is an
unfortunate corner case of debug info that leaves us with no other
option.

> The states are mutually exclusive (so no flags), so I wonder if we can just
> drop the (1<< X) setting completely.

FWIW, putting my C standard committee hat on, there is nothing wrong
with combining flags in an enum. C11 is silent on the matter, but C23
made this explicit. Quoting 6.7.3.3, paragraph 16: "After possible
lvalue conversion a value of the enumerated type behaves the same as the
value with the underlying type, in particular with all aspects of
promotion, conversion, and arithmetic." Lorenzo may have been thinking
of the stricter rules in C++.

Of course, semantically, it makes more sense to use distinct values in
cases like this where the values are not actually flags.

> IIRC, these values are not exposed to
> user space, only the corresponding names are, see state_show().
> 
> 
> Won't the compiler now complain that e.g., kcore_callback() does snot handle
> all cases? (no default statement)

Only if the controlling expression of the switch statement actually has
the enum type. All existing code uses unsigned long, so the compiler
doesn't care.

> -- 
> Cheers
> 
> David / dhildenb
> 
> 
