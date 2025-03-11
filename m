Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4850225D8ED
	for <linux-debuggers@vger.kernel.org>; Tue, 11 Mar 2025 14:54:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741704889; cv=none; b=oAhN2Vsxku8uhqxdmtdpYm0O3WsfbbHNFvg6ywR7s0iHe2nsXsbqz4xrvPHshooDRULeisYMdaIBZaRecboRsy9pnB7tLY3OfzEXr9rvFQOb7pebFvhEHqf0rWwqAdESCvIg0J34GxOX7soYI9OmnKtzgKlUhop7xOLECgTDIeQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741704889; c=relaxed/simple;
	bh=1BL00tFFOHfeMEQQ5Tt4Bqh1x+E0GFK/MG0bdWR9kgo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b52WcjMvdZ9i2jKQCo11JiPsKx0+DUrC4Pe2kqYmkLKyzaHG1hPoAaUMQamxDLXCati+vMUrgAs+c5l0NTqYNfulvvCY7yaXNnSSyJWVHymQ7qYajb2Bjacg+2nrK9E0DMpW8qVDDFz6EezlAObOp4lMcsoELpzL0E2MIFwFO+E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=VCqrhIbR; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="VCqrhIbR"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-301001bc6a8so256917a91.1
        for <linux-debuggers@vger.kernel.org>; Tue, 11 Mar 2025 07:54:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1741704887; x=1742309687; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=d59sGJI+VLcObFpvaWc35UsNwmufPn81Jgd7DH2LSWc=;
        b=VCqrhIbRi3rHRbWooPtmcddU+qjale62wia1k7i3vAfzBa0ZgL1+p8WB7jdHI+aOqS
         iVnERqjCdsk5LrEQzrZ7k1SgppbWRDbAro6uf58Uome9MGPwSHp1ORFkaKmiLd1JB4nk
         e33FSnNnjRVS50ljBXNT4oBXLOGws64weo8z1W8/8b3smBYimhyHq5tZQSo/XmRZVhnJ
         yeYJ1+5s8yreOzdonShRPOIekOKkogYDb8tLkw/ENfzVyN9miuzhYsk7j4N+Rsmp122V
         aF1v/M9lpLXVeUvGC0lfho4R2PftISw8XldexZpLoTlkK/Yl7Id1OWKC1t0IZ14BWNCQ
         Vt6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741704887; x=1742309687;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d59sGJI+VLcObFpvaWc35UsNwmufPn81Jgd7DH2LSWc=;
        b=bIfXE/KHkEfA+g0ErAGvkupukk6TWjuYUGBYqlwPKZichgcjlb5VaazVzcrAouo9k3
         TutvxNk6a8wORv/+XEYNC5w5souwxsx4KmudrF65zB3Wkwtf0AeTlQFBnwTjWblCfiHw
         UiJuM4+vpgiRrE+lz5wsTmolVuYACIqBpB9s2bnznIdscR6482ZEpmWIPRO11Rw1eaPH
         BtDHP86KPgJMUhwtFL7heNmUCrCqoNX1fm2ja5egpw227HRHTLEizzwNWbQsgNGt3Iq1
         dwYOMn9f8/JtkqtQ86zB0hN9xYf9hVylP3gVEnQuWe9jYRLNgtK2YDAtGO3cCmGDjfFs
         9XzA==
X-Forwarded-Encrypted: i=1; AJvYcCXo+e6nw4170T36Ns1D4unkfnU+lUPRslRHZ01lMwUev1w/PDX7Pa5ee/Aws7TP2tsMFAkxGohea/ZE1/m/IqY=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxul8CFu07WKCVqXJi4x1AvEca/kg/XVrcnLpM41O+unPp97KPE
	BJdWw5dLHSKlFTgxmH0YGkg+oz1WOyCYjs7nQESZ974wV+Xd88qoOzpYTC4ncDM=
X-Gm-Gg: ASbGncujDTmJOHTamBWGovG1+Sk9nHX+pI3G+iLpfu8L1xTKzDzas5J/eiwmiPItvz8
	wL+Vx1nymOTeqyNt9uTInMNxtehWb/3gGEEbL6ThwspoXEwGHEzKnQ+gFh7fqrb+dBn0JJXvl4V
	iKRnRBsW0HWV/r26HKr0H8NCIXXRyIuYaJ31tq9hOSC8JASousLTj5I/KaXww+EeRJm7Mok8/I1
	xjaUvy7J3W2n0o5r1u6aJizPwKKIj7EBP0v/Yaa1wyPwj0rSk7GZ/O3DV326p+jurbv2Ougw5iL
	NPZ+6CFaTo/Or5ZB8kgEh9Ngvb1f2veM/I1XEQ==
X-Google-Smtp-Source: AGHT+IHZkUQxuczn7uLgu1nRcj0qqV2jBdIhQhmcmuYHxfiKRdGEtqN0h05FBwTHzHXAqILvvPMfAQ==
X-Received: by 2002:a05:6a20:1586:b0:1ee:b8d7:7b56 with SMTP id adf61e73a8af0-1f58cbf5f4emr2486613637.6.1741704887342;
        Tue, 11 Mar 2025 07:54:47 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::24c4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-af281075eaesm9656245a12.3.2025.03.11.07.54.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 11 Mar 2025 07:54:46 -0700 (PDT)
Date: Tue, 11 Mar 2025 07:54:46 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Will Deacon <will@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-debuggers@vger.kernel.org, kernel-team@fb.com
Subject: Re: [PATCH] arm64: reserve [_text, _stext) virtual address range
Message-ID: <Z9BOttC9HTIDx62P@telecaster>
References: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
 <20250311125414.GA4601@willie-the-truck>
 <CAMj1kXGgKy=1g1dsN1_yd8JwGZC5SpLUwiJk3GCnZhQ8UtTkKQ@mail.gmail.com>
 <20250311141717.GA4931@willie-the-truck>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250311141717.GA4931@willie-the-truck>

On Tue, Mar 11, 2025 at 02:17:18PM +0000, Will Deacon wrote:
> On Tue, Mar 11, 2025 at 02:32:47PM +0100, Ard Biesheuvel wrote:
> > On Tue, 11 Mar 2025 at 13:54, Will Deacon <will@kernel.org> wrote:
> > >
> > > [+Ard]
> > >
> > > On Mon, Mar 10, 2025 at 01:05:04PM -0700, Omar Sandoval wrote:
> > > > From: Omar Sandoval <osandov@fb.com>
> > > >
> > > > Since the referenced fixes commit, the kernel's .text section is only
> > > > mapped starting from _stext; the region [_text, _stext) is omitted. As a
> > > > result, other vmalloc/vmap allocations may use the virtual addresses
> > > > nominally in the range [_text, _stext). This address reuse confuses
> > > > multiple things:
> > > >
> > > > 1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
> > > >    mapping the entire range [_text, _end) to
> > > >    [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
> > > >    [_text, _stext) from /proc/vmcore therefore gives the incorrect
> > > >    result.
> 
> [...]
> 
> > > > @@ -765,13 +769,17 @@ core_initcall(map_entry_trampoline);
> > > >   */
> > > >  static void __init declare_kernel_vmas(void)
> > > >  {
> > > > -     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
> > > > +     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT + 1];
> > > >
> > > > -     declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
> > > > -     declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
> > > > -     declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
> > > > -     declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
> > > > -     declare_vma(&vmlinux_seg[4], _data, _end, 0);
> > > > +     declare_vma(&vmlinux_seg[0], _text, _stext, VM_NO_GUARD);
> > >
> > > Should we also put the memblock reservation back as it was, so that this
> > > region can't be allocated there?
> > >
> > 
> > The issue is about the virtual address space, not the physical memory
> > behind it, right? So the VA range should be protected from reuse, but
> > nothing needs to be mapped there.
> 
> You're absolutely right, but now I'm more confused about the reference
> to crash_prepare_elf64_headers() in the commit message. That sets both
> the virtual (_text) and the physical (__pa_symbol(_text)) addresses in
> the header, so it feels like we really need to keep that memory around
> because it's accessible via /proc/vmcore.
> 
> > 
> > > In fact, if we're not allocating from here, why don't we just map it
> > > anyway but without execute permissions?
> > >
> > 
> > It's just 64k so if this is the simplest approach, I won't object.
> > 
> > I wonder if this needs to be so intrusive, though - there is already a
> > precedent of VMAs not actually mapping the entire region they describe
> > (with guard pages), and so we might just declare the first VMA as
> > [_text, _etext), even though the first 64k of that region is not not
> > actually mapped.
> > 
> > However, if that confuses the bookkeeping or creates other problems,
> > declaring a separate VMA to reserve the VA range seems fine, although
> > the patch seems a bit intrusive (and I don't even see the whole
> > thing).
> 
> As above, I think we'll have to give /proc/vmcore the physical address
> of _something_.

I figured since there's nothing actually at that virtual address
anymore, it doesn't matter what physical address /proc/vmcore gives. But
that doesn't sound great now that you point it out. I'll rework this to
map the range non-executable.

Thanks,
Omar
