Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A45A2940F
	for <linux-debuggers@vger.kernel.org>; Tue, 11 Mar 2025 13:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741699981; cv=none; b=qQGrAfmb+cnMN211VwAydVzOg92mRgy5snrPd/DWGcy8HmKBt/lsvRiSmCKIuD+LQaCHH+5yEVfBXLxZ/3V0YA8MUSStwln22ubldd1MFfMiYlJZ0MhboHfK+5AC0X0nJzhflrMqeW/lMeOSy5/cVW2yp+RQJ8fouNaY0X+NX8U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741699981; c=relaxed/simple;
	bh=jWsX/Qg1rMFAh6j8QjWJXoFRAIfS1ZMBT5PoMPo7/gY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aZIvszo5JU4OdeAtTEO9EGLBzz6qcizKjU5H8TzDMRd8O1Nh0HHw4r1EX1so/bqJmekT5j0zksw1Rnpku/C5vE/MMgeo/yipLyXQBtXkeFYX1MOqVtwmg/e6CWMPm5aJ0FOpFR7Padvbr0RupDESneRKNeXicLqtLq7tV5rpVdU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D7/jzoQg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D7/jzoQg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E1D1FC4AF0B
	for <linux-debuggers@vger.kernel.org>; Tue, 11 Mar 2025 13:33:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741699980;
	bh=jWsX/Qg1rMFAh6j8QjWJXoFRAIfS1ZMBT5PoMPo7/gY=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=D7/jzoQgSkzefHFTjbdWC73h4DNERyylLF3p/s0wbM5tAZ/9F4SwrvrfK0yyHQJ1h
	 eDt3IojABvZmtQffoLAHa/GbCxP8XDbnKdIem3j7ff1zr0BaDlniL6Ar9IPRILo5Fh
	 +e7Hcj+OQWuPqZ2c9Yr1ctoiyYgK0eRVOCtvJqCerXzK6eE0sGYtKb3s2uSduJiTeM
	 3TIx9G0C9WfrN5AhDPYjYiiGZ391Sh4w3Irc5GXLxp5agmgwsMbxIEkCRGDiq4E2z2
	 em1fJNrpZEh+sHxMDrEVDv5tMLUIBZXg9ErnhQ+5jSFrQLTj+dbZalutb8hyq0MXb/
	 wcm7Kq5wGly7Q==
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5497590ffbbso6207299e87.1
        for <linux-debuggers@vger.kernel.org>; Tue, 11 Mar 2025 06:33:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWjI2UK80A1sSj9EbOJSZMGYKeVjvSxbFfRZm9gyjxI2N971NqUVzpxLecGmKJL1zORGJQP313O04AiEIP0hLI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzrJelJmqSGCtTELEL328NB18AuApVh6/C+ZXjivB3o3HD5AZNn
	QajL2AmfhewXKw0vbTFrMPNjNnu0hWrIXWYjvms4n2Cn29aFwBXkAzgT3Nwf0JUUpmPhl/bjm34
	Dhq8csJ8Ok+uKEpzDMHiDsoA3vqQ=
X-Google-Smtp-Source: AGHT+IEu0soh+KNFGsJOvLh7Fum8OWfAFfiAYqEKpAbAv62U8+qcIy81jqPkupXhzyTeXCugykA21cOtmzExXvscUos=
X-Received: by 2002:a05:6512:ea5:b0:545:2f9b:7584 with SMTP id
 2adb3069b0e04-549910b5e7emr5799514e87.36.1741699979225; Tue, 11 Mar 2025
 06:32:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
 <20250311125414.GA4601@willie-the-truck>
In-Reply-To: <20250311125414.GA4601@willie-the-truck>
From: Ard Biesheuvel <ardb@kernel.org>
Date: Tue, 11 Mar 2025 14:32:47 +0100
X-Gmail-Original-Message-ID: <CAMj1kXGgKy=1g1dsN1_yd8JwGZC5SpLUwiJk3GCnZhQ8UtTkKQ@mail.gmail.com>
X-Gm-Features: AQ5f1JoAO9MBusLF0ZJzALnD8ovDsuYSh14c6lm6mMG92fbFlrAELGl7vH7Ph24
Message-ID: <CAMj1kXGgKy=1g1dsN1_yd8JwGZC5SpLUwiJk3GCnZhQ8UtTkKQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: reserve [_text, _stext) virtual address range
To: Will Deacon <will@kernel.org>
Cc: Omar Sandoval <osandov@osandov.com>, Catalin Marinas <catalin.marinas@arm.com>, 
	linux-arm-kernel@lists.infradead.org, linux-debuggers@vger.kernel.org, 
	kernel-team@fb.com
Content-Type: text/plain; charset="UTF-8"

On Tue, 11 Mar 2025 at 13:54, Will Deacon <will@kernel.org> wrote:
>
> [+Ard]
>
> On Mon, Mar 10, 2025 at 01:05:04PM -0700, Omar Sandoval wrote:
> > From: Omar Sandoval <osandov@fb.com>
> >
> > Since the referenced fixes commit, the kernel's .text section is only
> > mapped starting from _stext; the region [_text, _stext) is omitted. As a
> > result, other vmalloc/vmap allocations may use the virtual addresses
> > nominally in the range [_text, _stext). This address reuse confuses
> > multiple things:
> >
> > 1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
> >    mapping the entire range [_text, _end) to
> >    [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
> >    [_text, _stext) from /proc/vmcore therefore gives the incorrect
> >    result.
> > 2. Tools doing symbolization (either by reading /proc/kallsyms or based
> >    on the vmlinux ELF file) will incorrectly identify vmalloc/vmap
> >    allocations in [_text, _stext) as kernel symbols.
> >
> > In practice, both of these issues affect the drgn debugger.
> > Specifically, there were cases where the vmap IRQ stacks for some CPUs
> > were allocated in [_text, _stext). As a result, drgn could not get the
> > stack trace for a crash in an IRQ handler because the core dump
> > contained invalid data for the IRQ stack address. The stack addresses
> > were also symbolized as being in the _text symbol.
> >
> > Fix this by creating an unmapped vm_area to cover [_text, _stext). This
> > prevents other allocations from using it while still achieving the
> > original goal of not mapping unpredictable data.
> >
> > Fixes: e2a073dde921 ("arm64: omit [_text, _stext) from permanent kernel mapping")
> > Cc: stable@vger.kernel.org
> > Signed-off-by: Omar Sandoval <osandov@fb.com>
> > ---
> > Based on v6.14-rc6.
> >
> > Thanks!
> >
> >  arch/arm64/mm/mmu.c | 26 +++++++++++++++++---------
> >  1 file changed, 17 insertions(+), 9 deletions(-)
> >
> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index b4df5bc5b1b8..88595ea12f39 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -703,10 +703,14 @@ static void __init declare_vma(struct vm_struct *vma,
> >                              void *va_start, void *va_end,
> >                              unsigned long vm_flags)
> >  {
> > -     phys_addr_t pa_start = __pa_symbol(va_start);
> > +     phys_addr_t pa_start = 0;
> >       unsigned long size = va_end - va_start;
> >
> > -     BUG_ON(!PAGE_ALIGNED(pa_start));
> > +     if (vm_flags & VM_MAP) {
> > +             pa_start = __pa_symbol(va_start);
> > +             BUG_ON(!PAGE_ALIGNED(pa_start));
> > +     }
> > +
> >       BUG_ON(!PAGE_ALIGNED(size));
> >
> >       if (!(vm_flags & VM_NO_GUARD))
> > @@ -715,7 +719,7 @@ static void __init declare_vma(struct vm_struct *vma,
> >       vma->addr       = va_start;
> >       vma->phys_addr  = pa_start;
> >       vma->size       = size;
> > -     vma->flags      = VM_MAP | vm_flags;
> > +     vma->flags      = vm_flags;
> >       vma->caller     = __builtin_return_address(0);
> >
> >       vm_area_add_early(vma);
> > @@ -765,13 +769,17 @@ core_initcall(map_entry_trampoline);
> >   */
> >  static void __init declare_kernel_vmas(void)
> >  {
> > -     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
> > +     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT + 1];
> >
> > -     declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
> > -     declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
> > -     declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
> > -     declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
> > -     declare_vma(&vmlinux_seg[4], _data, _end, 0);
> > +     declare_vma(&vmlinux_seg[0], _text, _stext, VM_NO_GUARD);
>
> Should we also put the memblock reservation back as it was, so that this
> region can't be allocated there?
>

The issue is about the virtual address space, not the physical memory
behind it, right? So the VA range should be protected from reuse, but
nothing needs to be mapped there.

> In fact, if we're not allocating from here, why don't we just map it
> anyway but without execute permissions?
>

It's just 64k so if this is the simplest approach, I won't object.

I wonder if this needs to be so intrusive, though - there is already a
precedent of VMAs not actually mapping the entire region they describe
(with guard pages), and so we might just declare the first VMA as
[_text, _etext), even though the first 64k of that region is not not
actually mapped.

However, if that confuses the bookkeeping or creates other problems,
declaring a separate VMA to reserve the VA range seems fine, although
the patch seems a bit intrusive (and I don't even see the whole
thing).
