Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED12D1CAA6E
	for <linux-debuggers@vger.kernel.org>; Mon, 10 Mar 2025 20:05:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741637134; cv=none; b=hoPEwT7OGYisy2Jr8j8EcoLGZkyQ2u66g9i6ioUwYylxT0KLKTNcOA7GfbuJDT6lqu15k/J5CGT7cfo0198CCFpRaION18PA1QgxG0df8Nsdrr7LXvcAp8qaO8ERArzPkDrE4mO65H/Zzg0Uk4QRNnuD2OMfWJBNmQXH7MO8nFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741637134; c=relaxed/simple;
	bh=RDE2Kdj74iM9wnFuRbh6SaPVZG35oB8mWGyEQuC9Plk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=CHdfR5/KjOSujrNBvHb8THV94W6wodJ815gp5HR4nKnwFvCECaRVr0GYzC3qGc7ttI5p18pJ6nInztg5jxjhvq4yJB+JKufQDx1FyzAy38uAO0vYVXIKqBMmKJPEZr1nnuTFgtDe5LFKkpksQXXbXmGLYxc6EO0Caqd30B037uc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=Exc9P25U; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="Exc9P25U"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so1255863a91.0
        for <linux-debuggers@vger.kernel.org>; Mon, 10 Mar 2025 13:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1741637131; x=1742241931; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=6E2fY/dOO7K8H2PCOjc/QXC2clNa/LmdMboLxglCV4w=;
        b=Exc9P25UxQBaD8UgbmcUiZFXaDIKXjCv84DYEBJQ9ULSQzYUzVE/AITmcTPxcXagcj
         Rk6abg9ZcQwBoERIK8tM/nWd962HE9UfkV4twNwQHD+Uj32E3qrp2ZISsIVtpVqSlKXK
         Zon9mKoijsE4dyP8iQ4KXBhFsshsRc+oMWAsKK2a7o3sQuzzqBhbnXoVw/wC/I63QIk0
         fpOqXeMW5qhxHncz2qjfVqxQeNRpvwsbyf5sj/uJ2ktLJlDgmUOaN21dfdM24rgaifDN
         oIjlE8DvTfztYNGJdCO6oypaHKWp9QFHcCnPfu6CGl87sijF1++80vVZGPkIVGPQxfoY
         WTqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741637131; x=1742241931;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6E2fY/dOO7K8H2PCOjc/QXC2clNa/LmdMboLxglCV4w=;
        b=KYDJt79HMX/sl+Bxzifk1HD95stbQV3XsqoLfZyD1CHxstUUN5/8mPek8xPgLG+rMs
         7Xvyomwyx8KtKdUT3JmKE6FYVlC8llAGK8noZdeSdzTveLOOazQRqbIPzxWhSCzJRZ+j
         QOkoFk0wlXa9J7Xf8Ziz58dqapt4zpq01YQ39cntKJC+DYRDMG4pDHe4vDUEbmvu6dZJ
         iB0j5tIb5tSlSKc2w65L7X7gFcmghjlVrU/CosUdfULNzt7swHLd8cycCcXltqo2vNa+
         nq/deVusf0IBeeBn36CspP1p3FLGT2Wa+cgyRR499qGlVBYNeIJJguYLud4XHuuX4obr
         vPNA==
X-Gm-Message-State: AOJu0YxLvsVZSR2H14snkOdoNK/tghnDlCOpPKu1+3CWX7pWBj3cjASQ
	bOb76c0bMAk2IyfAdyOChp8FzNiSTb7+e0RFnDcRcvKxJP4DQS9m14MNPtCRfuw=
X-Gm-Gg: ASbGnctUTYHUJzjalwjLpV+MvYGL530n/cL1FlcY7IkakNMIOeG/ShqcQLCOA4xmw0p
	rVt/4Ed3muh4PC3lJRmGooLA94CPIFBIPaCba1L4WEZAQ/EAJ6zyy7dJD7yB9b4lPWf+VSHWRDS
	KuHWkxPULCCXtOYMg8Ks1HQcGL3ffJGbeJG3GP1mhzSjL4dgIB59iz0/jKDTKhaEVxwc/0SY8Bz
	PVvwcEv+gf6WbbJkqDDznCmSYTZ2Nvem9T0qS+OnBm6ciA3FZn+JnOa0v3Kg/b8NjhVVC3k6jJ0
	51mbTUUQ2uskj84UmzBalN20SZ1KG+G/s4i+uy5vuE0J1g+h
X-Google-Smtp-Source: AGHT+IEZY1hRshDJHK2NbEAj0bV/vF6iudG3bTSp20WZpc/wKRjHKhWDW2v8gGqKHNULSlhBJJIr6w==
X-Received: by 2002:a17:90b:1c90:b0:2ff:78dd:2875 with SMTP id 98e67ed59e1d1-300ff8c0db7mr494323a91.5.1741637130945;
        Mon, 10 Mar 2025 13:05:30 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::4:54c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2ff69374622sm9474522a91.23.2025.03.10.13.05.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:05:30 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	linux-arm-kernel@lists.infradead.org
Cc: linux-debuggers@vger.kernel.org,
	kernel-team@fb.com
Subject: [PATCH] arm64: reserve [_text, _stext) virtual address range
Date: Mon, 10 Mar 2025 13:05:04 -0700
Message-ID: <ec2d02358eee53f095ad9a7d9c96af8f4d0d4eeb.1741636880.git.osandov@osandov.com>
X-Mailer: git-send-email 2.48.1
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

Fix this by creating an unmapped vm_area to cover [_text, _stext). This
prevents other allocations from using it while still achieving the
original goal of not mapping unpredictable data.

Fixes: e2a073dde921 ("arm64: omit [_text, _stext) from permanent kernel mapping")
Cc: stable@vger.kernel.org
Signed-off-by: Omar Sandoval <osandov@fb.com>
---
Based on v6.14-rc6.

Thanks!

 arch/arm64/mm/mmu.c | 26 +++++++++++++++++---------
 1 file changed, 17 insertions(+), 9 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index b4df5bc5b1b8..88595ea12f39 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -703,10 +703,14 @@ static void __init declare_vma(struct vm_struct *vma,
 			       void *va_start, void *va_end,
 			       unsigned long vm_flags)
 {
-	phys_addr_t pa_start = __pa_symbol(va_start);
+	phys_addr_t pa_start = 0;
 	unsigned long size = va_end - va_start;
 
-	BUG_ON(!PAGE_ALIGNED(pa_start));
+	if (vm_flags & VM_MAP) {
+		pa_start = __pa_symbol(va_start);
+		BUG_ON(!PAGE_ALIGNED(pa_start));
+	}
+
 	BUG_ON(!PAGE_ALIGNED(size));
 
 	if (!(vm_flags & VM_NO_GUARD))
@@ -715,7 +719,7 @@ static void __init declare_vma(struct vm_struct *vma,
 	vma->addr	= va_start;
 	vma->phys_addr	= pa_start;
 	vma->size	= size;
-	vma->flags	= VM_MAP | vm_flags;
+	vma->flags	= vm_flags;
 	vma->caller	= __builtin_return_address(0);
 
 	vm_area_add_early(vma);
@@ -765,13 +769,17 @@ core_initcall(map_entry_trampoline);
  */
 static void __init declare_kernel_vmas(void)
 {
-	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT];
+	static struct vm_struct vmlinux_seg[KERNEL_SEGMENT_COUNT + 1];
 
-	declare_vma(&vmlinux_seg[0], _stext, _etext, VM_NO_GUARD);
-	declare_vma(&vmlinux_seg[1], __start_rodata, __inittext_begin, VM_NO_GUARD);
-	declare_vma(&vmlinux_seg[2], __inittext_begin, __inittext_end, VM_NO_GUARD);
-	declare_vma(&vmlinux_seg[3], __initdata_begin, __initdata_end, VM_NO_GUARD);
-	declare_vma(&vmlinux_seg[4], _data, _end, 0);
+	declare_vma(&vmlinux_seg[0], _text, _stext, VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[1], _stext, _etext, VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[2], __start_rodata, __inittext_begin,
+		    VM_MAP | VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[3], __inittext_begin, __inittext_end,
+		    VM_MAP | VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[4], __initdata_begin, __initdata_end,
+		    VM_MAP | VM_NO_GUARD);
+	declare_vma(&vmlinux_seg[5], _data, _end, VM_MAP);
 }
 
 void __pi_map_range(u64 *pgd, u64 start, u64 end, u64 pa, pgprot_t prot,
-- 
2.48.1

