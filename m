Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C81ECE79AC
	for <linux-debuggers@archiver.kernel.org>; Wed, 20 Sep 2023 07:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233621AbjITHt5 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 20 Sep 2023 03:49:57 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233897AbjITHti (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 20 Sep 2023 03:49:38 -0400
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 497B5E7D
        for <linux-debuggers@vger.kernel.org>; Wed, 20 Sep 2023 00:49:14 -0700 (PDT)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-3215f19a13aso2414372f8f.3
        for <linux-debuggers@vger.kernel.org>; Wed, 20 Sep 2023 00:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695196153; x=1695800953; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1oB9CfeQ/Z/fpJsUaZhEoogiOZTeyWosaH8VFYq0qFo=;
        b=bHVIVa51EOn/iXUxzBUHMX1vZg1Y9EiDVXGHdREo1jDAELPsiEYTCAZFemqtue+sFJ
         U1TaTPOI+CDSgWKiPL4zSgSpIiSz7ExASIDFpcuXB3Ld8dSfeOaAOI3jp1KSELjeaHkC
         sUPY/RwpKlIB3XhspHcDZxXxtnMiR8dEvcOtuU+0lrsreTuT0pqhL+ghwpK8Cj4WueZl
         /DPnnbt8o9d2xyVW1VTOWTit0matr3+C823nZ0zh5wVXd6KcAD+Ex447uoThC9TAC4Cd
         d5i3AVQ2SOVSFKnudkY8mv+yKmd5jboYsdqH+lhaMMu/m0FTf1vhNWkAtz3dPLLTAB1L
         0nkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695196153; x=1695800953;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=1oB9CfeQ/Z/fpJsUaZhEoogiOZTeyWosaH8VFYq0qFo=;
        b=NNWzPQg+uzoz8HorgLZ5xbhaPPpacV4xxHTHDd9CLiHLDHbBdlQBJrmDTjfMPP2hDy
         2QrIuXhtjqcnnIIT87pZncIXkw7bs0X5Dvyi7YAeRdSXzL53fJBUACwdCar91l1q3sXX
         NBT6gTQ5UqRfr1gmIWlz5nTO981ah+5qlkWL4Fs5SfxTHgI/YLVnV3jS2DU7qq/VriwV
         pB3W10vnjm9Dfgidzi9Oacy7kACJGY0FMiLv6GRXAGS643CerTLV0dQuqrtQHjXUMyX8
         rxw7Ha6LYzvlnx8IOBZ4kK1PnB8U5ObmWpPCFqXZkMossYD5KY0COWZ5/W/yc2O0RoUi
         ygEQ==
X-Gm-Message-State: AOJu0YyjQG42UhStEUwBLVVvy1g3g/OjR2rUshyGDREc1+Hma2vhrgMA
        PW2BrDl+lghI2d8IL15xZoZxNVLZdEM=
X-Google-Smtp-Source: AGHT+IFGPwzhxkCR5easQe/4cVFG8YK+ojAjNWV0alYz4yF+QNGJA03vGBde4VYAj5A35cfE1mS4Bg==
X-Received: by 2002:a5d:4c85:0:b0:321:6be7:d1be with SMTP id z5-20020a5d4c85000000b003216be7d1bemr1619699wrs.13.1695196152376;
        Wed, 20 Sep 2023 00:49:12 -0700 (PDT)
Received: from jondnuc ([87.68.178.84])
        by smtp.gmail.com with ESMTPSA id j15-20020a5d604f000000b0031779a6b451sm17536049wrt.83.2023.09.20.00.49.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Sep 2023 00:49:11 -0700 (PDT)
Date:   Wed, 20 Sep 2023 10:49:10 +0300
From:   Jon Doron <arilou@gmail.com>
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        =?iso-8859-1?Q?Marc-Andr=E9?= Lureau 
        <marcandre.lureau@redhat.com>, Laszlo Ersek <lersek@redhat.com>
Subject: Re: Concerns regarding e17bebd049 ("dump: Set correct vaddr for ELF
 dump")
Message-ID: <ZQqj9tFS7cLMTkHv@jondnuc>
References: <87h6nqxdth.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87h6nqxdth.fsf@oracle.com>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi Stephen,

Like you have said the reason is as I wrote in the commit message, 
without "fixing" the vaddr GDB is messing up mapping and working with 
the generated core file.

This patch is almost 4 years old, perhaps some changes to GDB has been 
introduced to resolve this, I have not checked since then.

As I'm no longer using this feature and have not worked and tested it 
in a long while, so I have no obligations to this change, but perhaps
someone else might be using it...

-- Jon.

On 19/09/2023, Stephen Brennan wrote:
>Hello all,
>
>I've started working on better support and documentation around
>hypervisor vmcores in the Drgn debugger[1]. Of course there's quite a
>lot of different implementations out there, but recently I'm looking at
>Qemu kdump and ELF vmcores generated via dump-guest-memory, and one
>thing caught my eye. I generated a ELF vmcore without the paging option
>enabled, and without the guest note loaded, and the resulting core
>dump's program header looked like this:
>
>$ eu-readelf -l dumpfile2
>Program Headers:
>  Type           Offset   VirtAddr           PhysAddr           FileSiz  MemSiz   Flg Align
>  NOTE           0x000168 0x0000000000000000 0x0000000000000000 0x001980 0x001980     0x0
>  LOAD           0x001ae8 0x0000000000000000 0x0000000000000000 0x80000000 0x80000000     0x0
>  LOAD           0x80001ae8 0x00000000fffc0000 0x00000000fffc0000 0x040000 0x040000     0x0
>
>In particular, the "VirtAddr" field for the loadable segment shows a
>confusing address - it appears to reuse the segment's physical address,
>despite the fact that there's no actual corresponding mapping.
>
>By comparison, the /proc/kcore and /proc/vmcore ELF vmcores use the
>VirtAddr in the program header to represent the real virtual memory
>mappings in use by the kernel. Debuggers can directly use these without
>needing to walk page tables. If there is no virtual memory mapping
>information available, I would have expected a placeholder value such as
>0000... or FFFF... to take the place of VirtAddr here so a debugger can
>detect the lack of virtual mappings and know that it needs to use
>architecture-specific details (and the vmcoreinfo) to find the page
>tables and accurately determine memory mappings. As it is, this program
>header seems to advertise to a debugger, "yes, we have the virtual
>memory mappings" when in fact, that's not the case.
>
>It seems that this behavior was introduced in e17bebd049 ("dump: Set
>correct vaddr for ELF dump")[2], a small commit I'll reproduce below.
>The justification seems to be that it fixes an issue reading the vmcore
>with GDB, but I wonder if that's not a GDB bug which should have been
>fixed with them? If GDB aims to support ELF kernel core dumps,
>presumably it should be handling physical addresses separately from
>virtual addresses. And if GDB doesn't aim for this, but you'd like to
>con it into reading your core dump, presumably the onus is on you to
>edit the ELF VirtAddr field to suit your needs? It should be QEMU's
>primary goal to produce a *correct* vmcore, not work around limitations
>or bugs in GDB.
>
>I'd like to propose reverting this, since it makes it impossible to
>interpret QEMU ELF vmcores, unless you discard all the virtual addresses
>in the program headers, and unconditionally do all the page table walks
>yourself. But I wanted to see if there was some justification for this
>behavior that I missed.
>
>Thanks,
>Stephen
>
>[1]: https://github.com/osandov/drgn
>[2]: https://lore.kernel.org/qemu-devel/20181225125344.4482-1-arilou@gmail.com/
>
>---
>
>commit e17bebd049d78f489c2cff755e2b66a0536a156e
>Author: Jon Doron <arilou@gmail.com>
>Date:   Wed Jan 9 10:22:03 2019 +0200
>
>    dump: Set correct vaddr for ELF dump
>
>    vaddr needs to be equal to the paddr since the dump file represents the
>    physical memory image.
>
>    Without setting vaddr correctly, GDB would load all the different memory
>    regions on top of each other to vaddr 0, thus making GDB showing the wrong
>    memory data for a given address.
>
>    Signed-off-by: Jon Doron <arilou@gmail.com>
>    Message-Id: <20190109082203.27142-1-arilou@gmail.com>
>    Reviewed-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>    Tested-by: Marc-André Lureau <marcandre.lureau@redhat.com>
>    Acked-by: Laszlo Ersek <lersek@redhat.com>
>
>diff --git a/dump.c b/dump.c
>index ef1d8025c9..107a67165a 100644
>--- a/dump.c
>+++ b/dump.c
>@@ -192,7 +192,7 @@ static void write_elf64_load(DumpState *s, MemoryMapping *memory_mapping,
>     phdr.p_paddr = cpu_to_dump64(s, memory_mapping->phys_addr);
>     phdr.p_filesz = cpu_to_dump64(s, filesz);
>     phdr.p_memsz = cpu_to_dump64(s, memory_mapping->length);
>-    phdr.p_vaddr = cpu_to_dump64(s, memory_mapping->virt_addr);
>+    phdr.p_vaddr = cpu_to_dump64(s, memory_mapping->virt_addr) ?: phdr.p_paddr;
>
>     assert(memory_mapping->length >= filesz);
>
>@@ -216,7 +216,8 @@ static void write_elf32_load(DumpState *s, MemoryMapping *memory_mapping,
>     phdr.p_paddr = cpu_to_dump32(s, memory_mapping->phys_addr);
>     phdr.p_filesz = cpu_to_dump32(s, filesz);
>     phdr.p_memsz = cpu_to_dump32(s, memory_mapping->length);
>-    phdr.p_vaddr = cpu_to_dump32(s, memory_mapping->virt_addr);
>+    phdr.p_vaddr =
>+        cpu_to_dump32(s, memory_mapping->virt_addr) ?: phdr.p_paddr;
>
>     assert(memory_mapping->length >= filesz);
>
>diff --git a/scripts/dump-guest-memory.py b/scripts/dump-guest-memory.py
>index 198cd0fe40..2c587cbefc 100644
>--- a/scripts/dump-guest-memory.py
>+++ b/scripts/dump-guest-memory.py
>@@ -163,6 +163,7 @@ def add_segment(self, p_type, p_paddr, p_size):
>         phdr = get_arch_phdr(self.endianness, self.elfclass)
>         phdr.p_type = p_type
>         phdr.p_paddr = p_paddr
>+        phdr.p_vaddr = p_paddr
>         phdr.p_filesz = p_size
>         phdr.p_memsz = p_size
>         self.segments.append(phdr)
