Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8030E219A7D
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 23:34:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761608074; cv=none; b=tn1KCIPYDVDJNx+ncj8mE2647fB0nsVHtpm/bJh9smWfNzLD5yj/F5aVXRlI7YAa4RMcENAbLL73kEuh/Zq8gTyS/mh4vbrlEheXB6ZfA4G77X7otXWed7kegnaOHW+O59vpkG7yiHy74b1R/IKZDMzdFIAKHGH/zJQUf/Ef4ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761608074; c=relaxed/simple;
	bh=66ZNwwIPSvSZvVHEjr0IaIHg9fnYWd5Z5gbcHw3XBEU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tS1lpDXJvtIprsrOeFBbiVNF1+L8HSTm4pCULHFdFrav/zuIyH+m0AAwNiUkmHSLAOlvlqrVPbC2ZbeHcUX1LZtBMUNk8mI65WbgRihQdZ3TMnqCAXnp5IbM2m3O3GaalmwB5pQ3Wxs82UgDoFVg7l2LBBN89knvqMyV0zB78S4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=qfUCHXU7; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="qfUCHXU7"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-339a0b9ed6cso1282352a91.3
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 16:34:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1761608072; x=1762212872; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=uPCmD4uzhtfswoc/l5V0R9c2cekIs5r3x52JtrQEQ6g=;
        b=qfUCHXU7x+T/cj1s9+/LnQ4PtEWXGbk6EKcGxYuJZJPpdqYWDYByfypEzLmyJSIRNE
         GHjqPTGpRGd8muBMSBVeEEInKCqahOPr7T1l0eotN2ikI4EFPxaPEi/CRwuGkmrVPmtF
         1u0lCStClyIJ9/g/gLKf5cjGcaK9HUgyVyYeK6AXVm5+4NkhyX/fpI2/0AMYe82RUHI5
         f7/NYMs/PuaKa9HVYpe+KBrK5MTXC+iBcdjQhDH1bpsYYqKhK5ooWAjEUdPpP6GTRMhp
         IL11JPxfkVsCQ+pbjHnBAxh1iW7b0wUTBfVw89mAh+9d1niN7VuNxJVhzwy/TDL6IHGK
         RAwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761608072; x=1762212872;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uPCmD4uzhtfswoc/l5V0R9c2cekIs5r3x52JtrQEQ6g=;
        b=f9/TlS4UwoelMVx/ZZeeeqnG0jlKpAz76qUhtgPRS61SZ6Eczd6zEDy4WOmlY6As2Z
         uVeErguZbS3Wzc0TNVO7yB8I0gvI1H7x302O+f8aUvLiewEOmPQ84Mb+udo716czXnoi
         DwVNcU2NvuCkyJPGIWLjH4K5WG/ckztqP+nftIPKkb+DjV1mD6rtMbR9Q0sdfFgE19ch
         Vo8cn6etIpoK9Kfb8+JGiFjHIpIUU6t2A45GM5795QEn3KncvtdFh5grrF/hZLaYpv6k
         vbVq/9bDviTW4x4xyQEmsbI7EhdWB5oKpWPODCMotwkctXxt/vZ36/ydUIpC23W+mZio
         fqaQ==
X-Forwarded-Encrypted: i=1; AJvYcCUYCp7FY4qWHDHJ3lohKSsS3/+KkRDwrHFyMPzN/N0PeFtsvLC4zZ71u95gPM+8JT3KyWxp8YDCedj1uFWYln4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWbw0FSAPsAUUcXF5yGEEmWQXdya9KtavGgjD+H8+4EVXwgMso
	A4FSrA13PQtqSihgggAlu5WwlHKrCbIHlDcCVkiC73f20oZQJTQIQ3+LtmQ0H8VR6F4=
X-Gm-Gg: ASbGncvV9oswpP70DWto6Ao/K7vhXgduB7leHudtVKNlUIBabWEINbDyuDkX3umsxgm
	oAk6OYFNgw83uUkm2wsELqdPHNNKcbukTAC0Z5O38WdyEa97NRAk8rmbUcLkldN0qvhOpB8gyMz
	0l37H7sN7+T/Vt2QwUgIRIdCOqBGjwbxxh2nj1x1uZrRJj1DeTf0/Sjj60wO7FTSKy967n+Wvr7
	UA58vgPJb8g6RtxhSGw4MuJjpyv3b+tAzZm+DzedHu6J2mh6sW/bLjD+H2bjY3XS1MhPdTjRI7C
	EN0GIuXaZDyKvnYHaHI+5ygM1AlD5xWL9KvgVuF0Q3kDa57hYIgGuzRE10t+AEyeI3O5fMDFb98
	/gebUEliG6Xy9cX1lxWAcjCn87SvPFkeAb0qhRRlx2EIqMq3f4XGVLzA4f6eduw+nHZ8=
X-Google-Smtp-Source: AGHT+IF+fIC8nkEhc1qH8rsvSrdHlsUcfw3Mhoj6ntlufIF+zqKXRzzjo2Jm1L6py6bmWl1j/Yu00g==
X-Received: by 2002:a17:902:db11:b0:25c:9a33:95fb with SMTP id d9443c01a7336-294cb502797mr8728975ad.8.1761608071589;
        Mon, 27 Oct 2025 16:34:31 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::4:c4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d273cdsm93594155ad.55.2025.10.27.16.34.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 16:34:31 -0700 (PDT)
Date: Mon, 27 Oct 2025 16:34:29 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>,
	Israel Batista <linux@israelbatista.dev.br>,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
Message-ID: <aQABhaMC8xfO2Vem@telecaster>
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>
 <aP-2x314BKks2_N9@telecaster>
 <3d3bfa52-3e13-4d23-8ef7-6cb8b1ab7d79@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3d3bfa52-3e13-4d23-8ef7-6cb8b1ab7d79@lucifer.local>

On Mon, Oct 27, 2025 at 07:46:43PM +0000, Lorenzo Stoakes wrote:
> On Mon, Oct 27, 2025 at 11:15:35AM -0700, Omar Sandoval wrote:
> > On Mon, Oct 27, 2025 at 10:29:15AM +0100, David Hildenbrand wrote:
> > > On 26.10.25 17:22, Israel Batista wrote:
> > > > The MEM_* constants indicating the state of the memory block are
> > > > currently defined as macros, meaning their definitions will be omitted
> > > > from the debuginfo on most kernel builds. This makes it harder for
> > > > debuggers to correctly map the block state at runtime, which can be
> > > > quite useful when analysing errors related to memory hot plugging and
> > > > unplugging with tools such as drgn and eBPF.
> > > >
> > > > Converting the constants to an enum will ensure the correct information
> > > > is emitted by the compiler and available for the debugger, without needing
> > > > to hard-code them into the debugger and track their changes.
> > > >
> > > > Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
> > > > ---
> > > >   include/linux/memory.h | 16 +++++++++-------
> > > >   1 file changed, 9 insertions(+), 7 deletions(-)
> > > >
> > > > diff --git a/include/linux/memory.h b/include/linux/memory.h
> > > > index ba1515160894..8feba3bfcd18 100644
> > > > --- a/include/linux/memory.h
> > > > +++ b/include/linux/memory.h
> > > > @@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
> > > >   unsigned long memory_block_size_bytes(void);
> > > >   int set_memory_block_size_order(unsigned int order);
> > > > -/* These states are exposed to userspace as text strings in sysfs */
> > > > -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
> > > > -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
> > > > -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
> > > > -#define	MEM_GOING_ONLINE	(1<<3)
> > > > -#define	MEM_CANCEL_ONLINE	(1<<4)
> > > > -#define	MEM_CANCEL_OFFLINE	(1<<5)
> > > > +enum mem_states {
> 
> Why are we naming a type we never use...

As David suggested, naming it means that we can then use it in a way
that enables compiler warnings and documents the code better.

> > > > +	/* These states are exposed to userspace as text strings in sysfs */
> > > > +	MEM_ONLINE		 = (1<<0), /* exposed to userspace */
> > > > +	MEM_GOING_OFFLINE	 = (1<<1), /* exposed to userspace */
> > > > +	MEM_OFFLINE		 = (1<<2), /* exposed to userspace */
> > > > +	MEM_GOING_ONLINE	 = (1<<3),
> > > > +	MEM_CANCEL_ONLINE	 = (1<<4),
> > > > +	MEM_CANCEL_OFFLINE	 = (1<<5),
> > > > +};
> 
> If it has to be named, can we just expose the bits as an enum and the values as
> BIT(...)?
> 
> > > >   struct memory_notify {
> > > >   	unsigned long start_pfn;
> > >
> > > CCing Lorenzo, we recently had a discussion about such conversions.
> >
> > Yeah, I've been asking people to send out these conversions as we
> > encounter them in drgn, but ONLY when the absence of a value in the
> > kernel debugging symbols causes actual problems for drgn. I want it to
> > be clear that we're not spamming these just to cause churn. This is an
> > unfortunate corner case of debug info that leaves us with no other
> > option.
> 
> Right. That really sucks, but I like drgn so if reasonable I do want us to
> make life easier there... :)
> 
> >
> > > The states are mutually exclusive (so no flags), so I wonder if we can just
> > > drop the (1<< X) setting completely.
> >
> > FWIW, putting my C standard committee hat on, there is nothing wrong
> > with combining flags in an enum. C11 is silent on the matter, but C23
> > made this explicit. Quoting 6.7.3.3, paragraph 16: "After possible
> > lvalue conversion a value of the enumerated type behaves the same as the
> > value with the underlying type, in particular with all aspects of
> > promotion, conversion, and arithmetic." Lorenzo may have been thinking
> > of the stricter rules in C++.
> 
> I don't really understand the argument being made there.
> 
> That's just saying the enum behaves as if it's the underlying type? I'm not
> arguing otherwise.
> 
> Consider:
> 
> enum some_name {
> 	X,
> 	Y
> };
> 
> void some_func(enum some_name val)
> {
> 	switch (val) {
> 	case X:
> 		...
> 	case Y:
> 		...
> 	}
> 
> 	// compiler doesn't warn about missing cases.
> }
> 
> This is already giving some sense as to the intuition that enums specify
> all the values as declared specific enumeration values.
> 
> But intuitively, with the enum as a _named_ type, it's _weird_ for there to
> be possible values for it that are not listed.
> 
> The problem here for me is the type being _named_.
> 
> If it's unnamed, then it doesn't really matter, it's just another way of
> declaring the values.

I read
https://lore.kernel.org/all/809f552d-3282-4746-ba49-066d2bd8d44f@lucifer.local/
("it's not valid to have flag values as an enum") as a claim that this
was invalid at the language level, but it sounds like your objection is
more of a personal style preference. Which is totally fine, the MM
subsystem can have whatever rules it wants.

To play devil's advocate, using a named enum for flags makes it easy to
document what flags are used for a given field. I don't know about you,
but I'm often annoyed when I come across an undocumented `unsigned long
flags` and I have to track down what set of flags it uses. And switching
on a flags value doesn't make sense in the first place regardless of
whether it's a macro or enum, so I don't expect that concern to matter
much in practice.

> If drgn needs it named, then just name bit values and use BIT(...).
> 
> >
> > Of course, semantically, it makes more sense to use distinct values in
> > cases like this where the values are not actually flags.
> 
> enum's are kinda defined by being distinct values...
> 
> >
> > > IIRC, these values are not exposed to
> > > user space, only the corresponding names are, see state_show().
> > >
> > >
> > > Won't the compiler now complain that e.g., kcore_callback() does snot handle
> > > all cases? (no default statement)
> >
> > Only if the controlling expression of the switch statement actually has
> > the enum type. All existing code uses unsigned long, so the compiler
> > doesn't care.
> 
> So why are we naming the type... does drgn require it?

Nope, drgn can work with anonymous enum types just fine. As long as
we're all on the same page that naming it/not naming it and using bit
numbers/flag values is a style choice and not a language requirement,
I'm happy with whatever approach makes the maintainers happy.

> Thanks, Lorenzo
