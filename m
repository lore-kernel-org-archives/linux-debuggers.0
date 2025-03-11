Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FA1A225A32
	for <linux-debuggers@vger.kernel.org>; Tue, 11 Mar 2025 12:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741697660; cv=none; b=nE5pR6F+VyPBwb/exuPEyt08HgdVmQUwiTfOr2z0DhfOFtti8a1qT/wMNMBaN619ze50RiL4oWxUvLKtXHSS1UJ9z5BtpII7vb542eWqwDjN1SUVQ58Cp5sGBJokTVQvANoBPUKs0/NmzBgv5cKo8ryvPu+jYhfIDoBVQV0ai8o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741697660; c=relaxed/simple;
	bh=ZnG2jyfgDIu+D9iUJU49SovzML6QYHdmJt29Dxynk2I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Dkpn7UuvnY9kPiWVNwVlCDfHTSCsDY2vlvn/+XXBLobNSPrP2MJagopQyo6H6u0F7lP72lCVIXReO8cOoOvOsEozxyNJgP2DdtakpL/aH91fPJyhJTLA5LWWf5kBxe05wnt+NmJggLYO+NSWu+vyJarpYS6Fw3nTo1GXjQ+Xg/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KZs+INoh; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KZs+INoh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 994EAC4CEEC;
	Tue, 11 Mar 2025 12:54:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741697659;
	bh=ZnG2jyfgDIu+D9iUJU49SovzML6QYHdmJt29Dxynk2I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KZs+INohVu9w82nQeOAxO2hkfOeWFrm+kIUpcXs0AIBaoYbsMs24n5Fn5N9mbFclr
	 3GE216KL6Q1OW6f+BX3aiID0YlvlHk3NnHN33OgF5Dxr2lnDGoXcTIymt6t8jFmZq+
	 5q8PqXgYvFvhb0Gj7GZbQ7f3P6VK32GTRVXNxlyZ1n5d1Qb/aBYiQwWEbZHo1NZ7GS
	 bpZ8dg2lmHxnbmOYw54uIaCJZn6epuPJLG8Wo/NvISewBvgJjSAP9iAOlf4xzeL1eF
	 skSxfclDUFJd2IU5TKq+klllNJlrUJqvF7HjBOo287JFh2hOY8REbE/S/4iN4q9LPr
	 6qSLpvWhRxF+Q==
Date: Tue, 11 Mar 2025 12:54:15 +0000
From: Will Deacon <will@kernel.org>
To: Omar Sandoval <osandov@osandov.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-debuggers@vger.kernel.org, kernel-team@fb.com,
	ardb@kernel.org
Subject: Re: [PATCH] arm64: reserve [_text, _stext) virtual address range
Message-ID: <20250311125414.GA4601@willie-the-truck>
References: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
User-Agent: Mutt/1.10.1 (2018-07-13)

[+Ard]

On Mon, Mar 10, 2025 at 01:05:04PM -0700, Omar Sandoval wrote:
> From: Omar Sandoval <osandov@fb.com>
> 
> Since the referenced fixes commit, the kernel's .text section is only
> mapped starting from _stext; the region [_text, _stext) is omitted. As a
> result, other vmalloc/vmap allocations may use the virtual addresses
> nominally in the range [_text, _stext). This address reuse confuses
> multiple things:
> 
> 1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
>    mapping the entire range [_text, _end) to
>    [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
>    [_text, _stext) from /proc/vmcore therefore gives the incorrect
>    result.
> 2. Tools doing symbolization (either by reading /proc/kallsyms or based
>    on the vmlinux ELF file) will incorrectly identify vmalloc/vmap
>    allocations in [_text, _stext) as kernel symbols.
> 
> In practice, both of these issues affect the drgn debugger.
> Specifically, there were cases where the vmap IRQ stacks for some CPUs
> were allocated in [_text, _stext). As a result, drgn could not get the
> stack trace for a crash in an IRQ handler because the core dump
> contained invalid data for the IRQ stack address. The stack addresses
> were also symbolized as being in the _text symbol.
> 
> Fix this by creating an unmapped vm_area to cover [_text, _stext). This
> prevents other allocations from using it while still achieving the
> original goal of not mapping unpredictable data.
> 
> Fixes: e2a073dde921 ("arm64: omit [_text, _stext) from permanent kernel mapping")
> Cc: stable@vger.kernel.org
> Signed-off-by: Omar Sandoval <osandov@fb.com>
> ---
> Based on v6.14-rc6.
> 
> Thanks!
> 
>  arch/arm64/mm/mmu.c | 26 +++++++++++++++++---------
>  1 file changed, 17 insertions(+), 9 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index b4df5bc5b1b8..88595ea12f39 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -703,10 +703,14 @@ static void __init declare_vma(struct vm_struct *vma,
>  			       void *va_start, void *va_end,
>  			       unsigned long vm_flags)
>  {
> -	phys_addr_t pa_start = __pa_symbol(va_start);
> +	phys_addr_t pa_start = 0;
>  	unsigned long size = va_end - va_start;
>  
> -	BUG_ON(!PAGE_ALIGNED(pa_start));
> +	if (vm_flags & VM_MAP) {
> +		pa_start = __pa_symbol(va_start);
> +		BUG_ON(!PAGE_ALIGNED(pa_start));
> +	}
> +
>  	BUG_ON(!PAGE_ALIGNED(size));
>  
>  	if (!(vm_flags & VM_NO_GUARD))
> @@ -715,7 +719,7 @@ static void __init declare_vma(struct vm_struct *vma,
>  	vma->addr	= va_start;
>  	vma->phys_addr	= pa_start;
>  	vma->size	= size;
> -	vma->flags	= VM_MAP | vm_flags;
> +	vma->flags	= vm_flags;
>  	vma->caller	= __builtin_return_address(0);
>  
>  	vm_area_add_early(vma);
> @@ -765,13 +769,17 @@ core_initcall(map_entry_trampoline);
>   */
>  static void __init declare_kernel_vmas(void)
>  {
> -	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
> +	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT + 1];
>  
> -	declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
> -	declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
> -	declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
> -	declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
> -	declare_vma(&vmlinux_seg[4], _data, _end, 0);
> +	declare_vma(&vmlinux_seg[0], _text, _stext, VM_NO_GUARD);

Should we also put the memblock reservation back as it was, so that this
region can't be allocated there?

In fact, if we're not allocating from here, why don't we just map it
anyway but without execute permissions?

Will
