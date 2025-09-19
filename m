Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C45DC25A2DE
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Sep 2025 21:28:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758317282; cv=none; b=QFvdvd2k76F5obIzzweRBbhVm461O9kOr0GEkAUyN6rZ/0PiUJd25KSSxp8IgyBhBDHaQqLujNq9GYBN6D3oqpVQPh8/MvpSIAXaf9MtNQomw9t6wZ+xuA0s9AcJFOL2gUP5hBAiU2L/B/Q8Jn0k585Hfz/8oClSIGFhrDO2u+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758317282; c=relaxed/simple;
	bh=I1TuVbTawwq0FEpas1Ip20L/CJsZf4d7L/hosAkCN8I=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=JO/7mC/4he4o55SAQwSmA5YIQ6OfrjgbrAwrtcd79G2kH/p6qw/alK0APyiQ6PzWwNhXyXfcLnsZ8FqlYyDqWMhbydNl86L5J1pD0vJ5sbjegN9JmjZe2OSqKsigJmAQ4oxzxjgn98TdbQVPqN2q3BrcdYJOx7GUdCPaJO/CQtA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=2YkxIDz+; arc=none smtp.client-ip=209.85.215.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="2YkxIDz+"
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-b55138c1974so269689a12.3
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Sep 2025 14:28:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1758317280; x=1758922080; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/ZQDb9So2gKQ/FkPvqKAWsxEXamgfK1EXFZjJht5XQI=;
        b=2YkxIDz+u9q6RSNJpb6bfuJI3R5btiVC+vK5OkKmfPIBO4lc0pRk2O849EnWLichMT
         FQTXlVVXlH1YFBahrH0ENbpite6p1h0JBqM5qkAqM1e3+q2xx0Ky/AavYQGC7GIZLpem
         th3lY9/hsFmqAYdMb6+541UepaL/u2w0y3SesTd3Wa2vZiiebhri+6VC3HhhlfKO35tY
         W1NOJyjCwub5f8Vxema6ecMd9ZMHAwr6EHansYoDd4mNmB38AOtL+LwmK1Ye5Yo20nS+
         iDyoa+FG+Zz/xglHm7oIzctXLBQ1R0QwmSbWPiB3y2exTDmLC8ba3mbzifRxMWSHvuAV
         6mDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758317280; x=1758922080;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/ZQDb9So2gKQ/FkPvqKAWsxEXamgfK1EXFZjJht5XQI=;
        b=c/x7ES+adkagr6bHDXX8YGSlPSPzg/ujdLfndiLhlF3DwEfUVaWrGsibZb+0Scag36
         M4GGQagrf2kgKy7fZlodsGI0e+dMwDGb43EtvxwQQh8jwnnZZSQi1yAa2JaMNmdu3BOB
         6Gp5zz73O85pKO/jl0GbHd2Ti5dTpaltepPQhwn6xBf0MNTltJhXmGwRVH5LAFiCzFVY
         qu7L2usxsGRFHj9Q4/UTWfeq70XRYmc2Hjd7VqWEzCJCmAQedKTvBoVUPdYPZuyNz6+0
         EAtSQ9Au5kXIVuXYfYxTzHiTVs7fYYk6QqKHbFsIMfpPrlcbEbhpebWIgPdXBjIhhonD
         Nyzw==
X-Gm-Message-State: AOJu0YxGb8Zvpm9+6Or35wc7kn5f57z46dsE7ERs7cd3ndzlzT9UPlbQ
	ep+sruPdUPgDwZ2odV2h2Y7gn0Vg2ytztuTO93v3SSO0BxPe2zEbpcE45UTsKcsS8oM=
X-Gm-Gg: ASbGncuXq1yQc8txbq4+/mExbzaD62yJoXvG3vioAx0P4lDBAhW2OzeFvxvsLyV27D6
	7tHYib5k1NbhouBS30qRPF/EW/L64N9g2sM3z1UR1H7RO4E+aFEPy7bOmosnqzv9qNet02dZr9Z
	9LYuhj7OsXi7ixVigGt8C4EnzwYdMz5UhNtqVmsoVu3B9jxWqUXDOFDfiNLNZAeE9T91icZCgkZ
	62A98UC0i0/5qXwYMgnrZWfNjhUen8SpArk4hwOoYEQopLlkFzxYrnPZNO2rsQ8jk1x7j7nRJ47
	8a8NasR8sxshJ9b1BwtvczxJ9m/HtwlIZ06aroreehHN4lGycPu3hGbsu3C6lUfcR8r4Qagfk+V
	XzWbybYnSCVU6m78Xz1HSiD2JbFE=
X-Google-Smtp-Source: AGHT+IFrLc3vg7pW3fKZ2PwyEo2/VqlPtOfTzZE+fhi6HGHFBrj8XYf3MbD8MvcP68Gv9K7iWYq3MA==
X-Received: by 2002:a17:90b:4a46:b0:330:944e:4814 with SMTP id 98e67ed59e1d1-330983587e1mr3504387a91.5.1758317279731;
        Fri, 19 Sep 2025 14:27:59 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::6:e352])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-330654bf948sm3247297a91.0.2025.09.19.14.27.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:27:59 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-debuggers@vger.kernel.org,
	kernel-team@fb.com
Subject: [PATCH v2] arm64: map [_text, _stext) virtual address range non-executable+read-only
Date: Fri, 19 Sep 2025 14:27:51 -0700
Message-ID: <93a6f8e47cce118493e250b719a927f517be12cf.1758316750.git.osandov@osandov.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

Since the referenced fixes commit, the kernel's .text section is only
mapped starting from _stext; the region [_text, _stext) is omitted. As a
result, other vmalloc/vmap allocations may use the virtual addresses
nominally in the range [_text, _stext). This address reuse confuses
multiple things:

1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
   mapping the entire range [_text, _end) to
   [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
   [_text, _stext) from /proc/vmcore therefore gives the incorrect
   result.
2. Tools doing symbolization (either by reading /proc/kallsyms or based
   on the vmlinux ELF file) will incorrectly identify vmalloc/vmap
   allocations in [_text, _stext) as kernel symbols.

In practice, both of these issues affect the drgn debugger.
Specifically, there were cases where the vmap IRQ stacks for some CPUs
were allocated in [_text, _stext). As a result, drgn could not get the
stack trace for a crash in an IRQ handler because the core dump
contained invalid data for the IRQ stack address. The stack addresses
were also symbolized as being in the _text symbol.

Fix this by bringing back the mapping of [_text, _stext), but now make
it non-executable and read-only. This prevents other allocations from
using it while still achieving the original goal of not mapping
unpredictable data as executable. Other than the changed protection,
this is effectively a revert of the fixes commit.

Fixes: e2a073dde921 ("arm64: omit [_text, _stext) from permanent kernel mapping")
Cc: stable@vger.kernel.org
Signed-off-by: Omar Sandoval <osandov@fb.com>
---
Hi,

We're working on our AArch64 stack tracing reliability in drgn [1], so I
finally got back around to this patch from March [2]. I reworked it as
Will suggested to map the range non-executable instead of leaving it
unmapped.

1: https://github.com/osandov/drgn/pull/547
2: https://lore.kernel.org/all/ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com/

Based on v6.17-rc6.

Thanks!

 arch/arm64/kernel/pi/map_kernel.c |  6 ++++++
 arch/arm64/kernel/setup.c         |  4 ++--
 arch/arm64/mm/init.c              |  2 +-
 arch/arm64/mm/mmu.c               | 14 +++++++++-----
 4 files changed, 18 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/kernel/pi/map_kernel.c b/arch/arm64/kernel/pi/map_kernel.c
index 0f4bd7771859..a8d76d0354da 100644
--- a/arch/arm64/kernel/pi/map_kernel.c
+++ b/arch/arm64/kernel/pi/map_kernel.c
@@ -78,6 +78,12 @@ static void __init map_kernel(u64 kaslr_offset, u64 va_offset, int root_level)
 	twopass |= enable_scs;
 	prot = twopass ? data_prot : text_prot;
 
+	/*
+	 * [_stext, _text) isn't executed after boot and contains some
+	 * non-executable, unpredictable data, so map it non-executable.
+	 */
+	map_segment(init_pg_dir, &pgdp, va_offset, _text, _stext, data_prot,
+		    false, root_level);
 	map_segment(init_pg_dir, &pgdp, va_offset, _stext, _etext, prot,
 		    !twopass, root_level);
 	map_segment(init_pg_dir, &pgdp, va_offset, __start_rodata,
diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
index 77c7926a4df6..23c05dc7a8f2 100644
--- a/arch/arm64/kernel/setup.c
+++ b/arch/arm64/kernel/setup.c
@@ -214,7 +214,7 @@ static void __init request_standard_resources(void)
 	unsigned long i = 0;
 	size_t res_size;
 
-	kernel_code.start   = __pa_symbol(_stext);
+	kernel_code.start   = __pa_symbol(_text);
 	kernel_code.end     = __pa_symbol(__init_begin - 1);
 	kernel_data.start   = __pa_symbol(_sdata);
 	kernel_data.end     = __pa_symbol(_end - 1);
@@ -280,7 +280,7 @@ u64 cpu_logical_map(unsigned int cpu)
 
 void __init __no_sanitize_address setup_arch(char **cmdline_p)
 {
-	setup_initial_init_mm(_stext, _etext, _edata, _end);
+	setup_initial_init_mm(_text, _etext, _edata, _end);
 
 	*cmdline_p = boot_command_line;
 
diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
index ea84a61ed508..0dd558613bd7 100644
--- a/arch/arm64/mm/init.c
+++ b/arch/arm64/mm/init.c
@@ -279,7 +279,7 @@ void __init arm64_memblock_init(void)
 	 * Register the kernel text, kernel data, initrd, and initial
 	 * pagetables with memblock.
 	 */
-	memblock_reserve(__pa_symbol(_stext), _end - _stext);
+	memblock_reserve(__pa_symbol(_text), _end - _text);
 	if (IS_ENABLED(CONFIG_BLK_DEV_INITRD) && phys_initrd_size) {
 		/* the generic initrd code expects virtual addresses */
 		initrd_start = __phys_to_virt(phys_initrd_start);
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 183801520740..324b96e3632c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -574,8 +574,8 @@ void __init mark_linear_text_alias_ro(void)
 	/*
 	 * Remove the write permissions from the linear alias of .text/.rodata
 	 */
-	update_mapping_prot(__pa_symbol(_stext), (unsigned long)lm_alias(_stext),
-			    (unsigned long)__init_begin - (unsigned long)_stext,
+	update_mapping_prot(__pa_symbol(_text), (unsigned long)lm_alias(_text),
+			    (unsigned long)__init_begin - (unsigned long)_text,
 			    PAGE_KERNEL_RO);
 }
 
@@ -636,7 +636,7 @@ static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool, pgd_t *pgdp) {
 static void __init map_mem(pgd_t *pgdp)
 {
 	static const u64 direct_map_end = _PAGE_END(VA_BITS_MIN);
-	phys_addr_t kernel_start = __pa_symbol(_stext);
+	phys_addr_t kernel_start = __pa_symbol(_text);
 	phys_addr_t kernel_end = __pa_symbol(__init_begin);
 	phys_addr_t start, end;
 	phys_addr_t early_kfence_pool;
@@ -683,7 +683,7 @@ static void __init map_mem(pgd_t *pgdp)
 	}
 
 	/*
-	 * Map the linear alias of the [_stext, __init_begin) interval
+	 * Map the linear alias of the [_text, __init_begin) interval
 	 * as non-executable now, and remove the write permission in
 	 * mark_linear_text_alias_ro() below (which will be called after
 	 * alternative patching has completed). This makes the contents
@@ -710,6 +710,10 @@ void mark_rodata_ro(void)
 	WRITE_ONCE(rodata_is_rw, false);
 	update_mapping_prot(__pa_symbol(__start_rodata), (unsigned long)__start_rodata,
 			    section_size, PAGE_KERNEL_RO);
+	/* mark the range between _text and _stext as read only. */
+	update_mapping_prot(__pa_symbol(_text), (unsigned long)_text,
+			    (unsigned long)_stext - (unsigned long)_text,
+			    PAGE_KERNEL_RO);
 }
 
 static void __init declare_vma(struct vm_struct *vma,
@@ -780,7 +784,7 @@ static void __init declare_kernel_vmas(void)
 {
 	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
 
-	declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[0], _text, _etext, VM_NO_GUARD);
 	declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
 	declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
 	declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
-- 
2.51.0

