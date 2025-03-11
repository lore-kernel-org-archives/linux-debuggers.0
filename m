Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3FFC192B74
	for <linux-debuggers@vger.kernel.org>; Tue, 11 Mar 2025 14:17:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741702643; cv=none; b=uVeoPypzk3T81WnWGr4Yw+ZRMW8L5AwVhGOj+Gcd77yxaoBlPy6lGGjjnKICkqV3OHlOBKzEg7++nHE7KJBuy3xLvieyZrKJOzIZVmkwk5u4eR6YiJv+G7NyKa8NKI8xquTea2lrZcs7euQzzZMAJEDAI5pbbkiPEm5/O+Su7qE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741702643; c=relaxed/simple;
	bh=oUPWS1iGHrlNCRNqq8+iKfTYYMlSqwNoeg2uveVkUDE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GtUSc+dNiZ7Yt5QhWPChc5NXURgIu1VAaEsyNmdPKPU5TmavIlZc1LEcbRJIYC3Sql0O1h/yLynlOFllZQj0lEJ/+l0Fl1DXqRtciZBCcw68EcACk93aCRbaHBkcA0S3wuqIcqQ80pGgdn47Qg4fMSFXMo6xF0moaEIjOReMxp0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P2M9keKm; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P2M9keKm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5862C4CEE9;
	Tue, 11 Mar 2025 14:17:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741702643;
	bh=oUPWS1iGHrlNCRNqq8+iKfTYYMlSqwNoeg2uveVkUDE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=P2M9keKmX+3gG8SWDcs3CbAorRkyS412/jjbyrKIs6+DRCPW00delPh5fiiQJHBgN
	 TUEMGp3mnvTvhQ5Ya2DWTURdr8TnFQmRKhBXLZRldXZWH+7x1asriO/sM9kH49d9xN
	 j34oUxssa6j1Ql6LLXxWqiGbTXqdN3tFBvDmSd/m8mds4+znIjgWIHvqfyYq8plhRB
	 BNI9iD+AyBxYmcnIfdASfZ5OaWY0md4/dRiABNt6UlohHUUibJuq1s2aCHvpZOiE/g
	 CBWUwlIoqYEb2Jj4lgfgVew6tPXJcfH30zaSOd0wjHOxQaUyxhZbgkI8P8+pYatEGy
	 ALtyiDGL418Ig==
Date: Tue, 11 Mar 2025 14:17:18 +0000
From: Will Deacon <will@kernel.org>
To: Ard Biesheuvel <ardb@kernel.org>
Cc: Omar Sandoval <osandov@osandov.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-debuggers@vger.kernel.org, kernel-team@fb.com
Subject: Re: [PATCH] arm64: reserve [_text, _stext) virtual address range
Message-ID: <20250311141717.GA4931@willie-the-truck>
References: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
 <20250311125414.GA4601@willie-the-truck>
 <CAMj1kXGgKy=1g1dsN1_yd8JwGZC5SpLUwiJk3GCnZhQ8UtTkKQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMj1kXGgKy=1g1dsN1_yd8JwGZC5SpLUwiJk3GCnZhQ8UtTkKQ@mail.gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

On Tue, Mar 11, 2025 at 02:32:47PM +0100, Ard Biesheuvel wrote:
> On Tue, 11 Mar 2025 at 13:54, Will Deacon <will@kernel.org> wrote:
> >
> > [+Ard]
> >
> > On Mon, Mar 10, 2025 at 01:05:04PM -0700, Omar Sandoval wrote:
> > > From: Omar Sandoval <osandov@fb.com>
> > >
> > > Since the referenced fixes commit, the kernel's .text section is only
> > > mapped starting from _stext; the region [_text, _stext) is omitted. As a
> > > result, other vmalloc/vmap allocations may use the virtual addresses
> > > nominally in the range [_text, _stext). This address reuse confuses
> > > multiple things:
> > >
> > > 1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
> > >    mapping the entire range [_text, _end) to
> > >    [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
> > >    [_text, _stext) from /proc/vmcore therefore gives the incorrect
> > >    result.

[...]

> > > @@ -765,13 +769,17 @@ core_initcall(map_entry_trampoline);
> > >   */
> > >  static void __init declare_kernel_vmas(void)
> > >  {
> > > -     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
> > > +     static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT + 1];
> > >
> > > -     declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
> > > -     declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
> > > -     declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
> > > -     declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
> > > -     declare_vma(&vmlinux_seg[4], _data, _end, 0);
> > > +     declare_vma(&vmlinux_seg[0], _text, _stext, VM_NO_GUARD);
> >
> > Should we also put the memblock reservation back as it was, so that this
> > region can't be allocated there?
> >
> 
> The issue is about the virtual address space, not the physical memory
> behind it, right? So the VA range should be protected from reuse, but
> nothing needs to be mapped there.

You're absolutely right, but now I'm more confused about the reference
to crash_prepare_elf64_headers() in the commit message. That sets both
the virtual (_text) and the physical (__pa_symbol(_text)) addresses in
the header, so it feels like we really need to keep that memory around
because it's accessible via /proc/vmcore.

> 
> > In fact, if we're not allocating from here, why don't we just map it
> > anyway but without execute permissions?
> >
> 
> It's just 64k so if this is the simplest approach, I won't object.
> 
> I wonder if this needs to be so intrusive, though - there is already a
> precedent of VMAs not actually mapping the entire region they describe
> (with guard pages), and so we might just declare the first VMA as
> [_text, _etext), even though the first 64k of that region is not not
> actually mapped.
> 
> However, if that confuses the bookkeeping or creates other problems,
> declaring a separate VMA to reserve the VA range seems fine, although
> the patch seems a bit intrusive (and I don't even see the whole
> thing).

As above, I think we'll have to give /proc/vmcore the physical address
of _something_.

Will
