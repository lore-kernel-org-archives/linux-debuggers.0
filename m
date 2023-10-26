Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB686C25B48
	for <linux-debuggers@archiver.kernel.org>; Thu, 26 Oct 2023 15:02:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231477AbjJZPCY (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Thu, 26 Oct 2023 11:02:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41406 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231423AbjJZPCX (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Thu, 26 Oct 2023 11:02:23 -0400
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D0699187
        for <linux-debuggers@vger.kernel.org>; Thu, 26 Oct 2023 08:02:19 -0700 (PDT)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id 95395180474;
        Thu, 26 Oct 2023 17:02:14 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1698332534; bh=J/9PxDshCj5FXJ3uH2Rdetj6doqkcinWzbnCebDVE/I=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=K4lY9b9jJdWtl+FXWPpt5q6/jr29TBKtgffAG+9ykUAWKZmB8hDLbsXQ9MVkHGDOG
         m0RguozbX6/ha7dgCCqEGzEZugVKx0pI1skCSq3S2FTFGK4v6GwOklE6cUGg7YcIZ5
         Xtlr2fgiO+Jd8+zlrYYAoWfGC7I6r3VOyCQztyq4yL2l+yZcdI6s51TRfWIzRMXr/1
         9sS29hZ7uhij/O5cEqT2KAhBjgHVVW1dH2/7NSzH2PWYIfTXMOFgO3fGS9N3fMe98N
         rBR5u5PMM3cmFYoTsHn+/SRRMtGsLR5NYG7N31kIaPLR2Bur09Hw5H7rb9OJEtdpZY
         xO2ecn08YDr4w==
Date:   Thu, 26 Oct 2023 17:02:13 +0200
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2 1/1] kernel/config: Introduce
 CONFIG_DEBUG_INFO_IKCONFIG
Message-ID: <20231026170213.202722da@meshulam.tesarici.cz>
In-Reply-To: <20231025223640.1132047-2-stephen.s.brennan@oracle.com>
References: <20231025223640.1132047-1-stephen.s.brennan@oracle.com>
        <20231025223640.1132047-2-stephen.s.brennan@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi Stephen,

you mentioned yesterday that you couldn't figure out how binutils
determines which sections contain debugging information. I was curious.
As expected, the logic is in libbfd. There is some helpful code and
comment in _bfd_elf_make_section_from_shdr():

  if ((flags & SEC_ALLOC) == 0)
    {
      /* The debugging sections appear to be recognized only by name,
	 not any sort of flag.  Their SEC_ALLOC bits are cleared.  */
      if (name [0] == '.')
	{
	  if (startswith (name, ".debug")
	      || startswith (name, ".gnu.debuglto_.debug_")
	      || startswith (name, ".gnu.linkonce.wi.")
	      || startswith (name, ".zdebug"))
	    flags |= SEC_DEBUGGING | SEC_ELF_OCTETS;
	  else if (startswith (name, GNU_BUILD_ATTRS_SECTION_NAME)
		   || startswith (name, ".note.gnu"))
	    {
	      flags |= SEC_ELF_OCTETS;
	      opb = 1;
	    }
	  else if (startswith (name, ".line")
		   || startswith (name, ".stab")
		   || strcmp (name, ".gdb_index") == 0)
	    flags |= SEC_DEBUGGING;
	}
    }

Your section name starts with .debug, which looks good to me, and
definitely better than any of the alternatives.

Petr T

On Wed, 25 Oct 2023 15:36:40 -0700
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> The option CONFIG_IKCONFIG allows the gzip compressed kernel
> configuration to be included into vmlinux or a module. In these cases,
> debuggers can access the config data and use it to adjust their behavior
> according to the configuration. However, distributions rarely enable
> this, likely because it uses a fair bit of kernel memory which cannot be
> swapped out.
> 
> This means that in practice, the kernel configuration is rarely
> available to debuggers.
> 
> So, introduce an alternative, CONFIG_DEBUG_INFO_IKCONFIG. This strategy,
> which is only available if IKCONFIG is not already built-in, adds a
> section ".debug_linux_ikconfig", to the vmlinux ELF. It will be stripped
> out of the final images, but will remain in the debuginfo files. So
> debuggers which rely on vmlinux debuginfo can have access to the kernel
> configuration, without incurring a cost to the kernel at runtime.
> 
> The configuration is enabled whenever DEBUG_INFO=y and IKCONFIG!=y. The
> added section is not large compared to debug info sizes. It won't affect
> the runtime kernel at all, and this default will ensure that
> distributions intending to create useful debuginfo will get this new
> addition for kernel debuggers.
> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  include/asm-generic/vmlinux.lds.h |  3 ++-
>  kernel/Makefile                   |  1 +
>  kernel/configs-debug.S            | 18 ++++++++++++++++++
>  lib/Kconfig.debug                 | 15 +++++++++++++++
>  4 files changed, 36 insertions(+), 1 deletion(-)
>  create mode 100644 kernel/configs-debug.S
> 
> diff --git a/include/asm-generic/vmlinux.lds.h b/include/asm-generic/vmlinux.lds.h
> index 9c59409104f6..025b0bfe17bf 100644
> --- a/include/asm-generic/vmlinux.lds.h
> +++ b/include/asm-generic/vmlinux.lds.h
> @@ -824,7 +824,8 @@
>  		.comment 0 : { *(.comment) }				\
>  		.symtab 0 : { *(.symtab) }				\
>  		.strtab 0 : { *(.strtab) }				\
> -		.shstrtab 0 : { *(.shstrtab) }
> +		.shstrtab 0 : { *(.shstrtab) }				\
> +		.debug_linux_ikconfig 0 : { *(.debug_linux_ikconfig) }
>  
>  #ifdef CONFIG_GENERIC_BUG
>  #define BUG_TABLE							\
> diff --git a/kernel/Makefile b/kernel/Makefile
> index 3947122d618b..e2f517a10f04 100644
> --- a/kernel/Makefile
> +++ b/kernel/Makefile
> @@ -138,6 +138,7 @@ KCSAN_SANITIZE_stackleak.o := n
>  KCOV_INSTRUMENT_stackleak.o := n
>  
>  obj-$(CONFIG_SCF_TORTURE_TEST) += scftorture.o
> +obj-$(CONFIG_DEBUG_INFO_IKCONFIG) += configs-debug.o
>  
>  $(obj)/configs.o: $(obj)/config_data.gz
>  
> diff --git a/kernel/configs-debug.S b/kernel/configs-debug.S
> new file mode 100644
> index 000000000000..d0dd5c2f7bd5
> --- /dev/null
> +++ b/kernel/configs-debug.S
> @@ -0,0 +1,18 @@
> +/* SPDX-License-Identifier: GPL-2.0-only
> + *
> + * Inline kernel configuration for debuginfo files
> + *
> + * Copyright (c) 2023, Oracle and/or its affiliates.
> + */
> +
> +/*
> + * By using the same "IKCFG_ST" and "IKCFG_ED" markers found in configs.c, we
> + * can ensure that the resulting debuginfo files can be read by
> + * scripts/extract-ikconfig. Unfortunately, this means that the contents of the
> + * section cannot be directly extracted and used. Since debuggers should be able
> + * to trim these markers off trivially, this is a good tradeoff.
> + */
> +	.section .debug_linux_ikconfig
> +	.ascii "IKCFG_ST"
> +	.incbin "kernel/config_data.gz"
> +	.ascii "IKCFG_ED"
> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index fa307f93fa2e..c43a874ea584 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -429,6 +429,21 @@ config GDB_SCRIPTS
>  	  instance. See Documentation/dev-tools/gdb-kernel-debugging.rst
>  	  for further details.
>  
> +config DEBUG_INFO_IKCONFIG
> +	bool "Embed KConfig in debuginfo, if not already present"
> +	depends on IKCONFIG!=y
> +	default y if IKCONFIG!=y
> +	help
> +	  This provides the gzip-compressed KConfig information in an ELF
> +	  section called .ikconfig which will be stripped out of the final
> +	  bootable image, but remain in the debuginfo. Debuggers that are aware
> +	  of this can use this to customize their behavior to the kernel
> +	  configuration, without requiring the configuration information to be
> +	  stored in the kernel like CONFIG_IKCONFIG does. This configuration is
> +	  unnecessary when CONFIG_IKCONFIG is enabled, since the data can be
> +	  found in the .rodata section in that case (see
> +	  scripts/extract-ikconfig).
> +
>  endif # DEBUG_INFO
>  
>  config FRAME_WARN

