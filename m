Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5629F1853
	for <linux-debuggers@vger.kernel.org>; Wed,  2 Apr 2025 07:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743578762; cv=none; b=jeqgj1Otr2+JY8+6YHGe8uQbAQemgLo8EvNiSq5cWXpCqbdrXDkNCV1hS6oH/8dvLSexV7jHiCVAvR3ChRqbXQ06hGpKfDowDTao/2U1SC1TAIB9BWvIG8S1Two8XpFIHMg7S1gx8TUHLe9WQjwLjTAvBeyriBQ2yMbjsuQqO8g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743578762; c=relaxed/simple;
	bh=/s5Gr4AUIy6IIrBAjg++f/2ZwZzt0591fXW+ebFQNm8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VOv+xnEPCvtbFxVj5jG9t2IOQU4La1bL/q8o6CHzC+JMY3IjcorV/h4gswwtpey7I0C2+xHowljJi2iTRZYLVBBDX1hT5y9Gdit7FhO7N904qavnHxrheAVucA+KHgdlkqmxq3YU0ncwOI4oAycA1dXyzIMdL0q8Bxj0aywRbLs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=V18p9dbG; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="V18p9dbG"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743578759;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=viIMpmlVUvk59078H9EUwvyL/Zfh+VWzLDEsfn0FIRQ=;
	b=V18p9dbGNtDt65yn5xS+D518ICV3lLU0Vf58OZvWEKXZkPl0hozJxOOsBQ25rRb/tPMBLJ
	GClsyzS4chQBmyD9c2OWdf0IVfNj3141ZDPRigytBdPHLJ06KQEd2PreGqYOn/IGxFX0Hr
	Wg++xX8HvQdAHXW51cUOmSBg1nKi/+0=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-677-U9JKsIefP0qnQeebJBaCUA-1; Wed, 02 Apr 2025 03:25:58 -0400
X-MC-Unique: U9JKsIefP0qnQeebJBaCUA-1
X-Mimecast-MFC-AGG-ID: U9JKsIefP0qnQeebJBaCUA_1743578757
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac6a0443bafso582934366b.2
        for <linux-debuggers@vger.kernel.org>; Wed, 02 Apr 2025 00:25:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743578756; x=1744183556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=viIMpmlVUvk59078H9EUwvyL/Zfh+VWzLDEsfn0FIRQ=;
        b=HcCo49NzWvvkZhIPkLsi8tDj3RtlTjSDA6B4qDGojQiWABKv9kyV1B8b1+qkhmsU3V
         TyWk37UyqgwLqgUIa2TGycmQki31USsxvd73KiVgPtQ2yKvv0q6Vl+10SmaBERgu6op3
         2UR/A0vrtAqglIYZWM/dCwzDUlCTJpzMjl9QdwhN6KzkxUQawb0R8NvYPxsCwX4mXQYj
         qRkJ3uTvWnbWWdRnHK2Tfb29TX/qRvW+/N+BRcIaFkff7Qn2f3tyTYTQWCYTOntcIWGu
         gh5wxeL0NiYpjyu8daaBzdebcVG9HvLsF1IzV3V+WlZ1+swFXgYfkFwfbvLCF+02V3qw
         A7Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVJ3+GVEPxSO+bhgZlJL0c/FHyBzbC5QutL3zJj3oAHXGtBInGs+j8foYhBrwvfl0svzjMoG8ho73sdVEXxgQc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwsGmU/KHZJS1h90hm2A0tlJo036oTyfACOdDAD/tSlSYDKJLAH
	0OrjN2vNzQo1XHRNlfka+HM7tNcfbTFBhamUakedyf/OfiH5fot5srLvlWVeBLWdfI3oaZ1Bkiw
	LI/dAFOxm8Wu9d/xlnhWU1ex37ESdTyNL9DzAm4e1oxrbggLRfE6HjxiT3Gx6uwMz6sxRJNDX1r
	YAZ+oVstemv3EA4wxJunopk4JwDk/tn0hyQCAsB9eDxDZ+N+4LB8U=
X-Gm-Gg: ASbGnct8QudGJVKtgS6H+52hf+w/XOCkkvKjfkb99CxiYm2xxZtaCANfTV3BO4dPGvV
	WXWbh1znSYVkJzlrW19cbJFQnf5nZ1CcDaBVWghPTMqOefnbVb0KJLtQxAKC8siumyFWp6BqODa
	4=
X-Received: by 2002:a17:907:7d8c:b0:ac3:8896:416f with SMTP id a640c23a62f3a-ac782b63ed1mr532452666b.15.1743578756495;
        Wed, 02 Apr 2025 00:25:56 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGg5c2swHBjPFbvTbyERth/l8KMODPcDIEopVQJMusrhdemqsvDqmHK48/cEkkXPnbsYh3xnvnE095EiNIGZFg=
X-Received: by 2002:a17:907:7d8c:b0:ac3:8896:416f with SMTP id
 a640c23a62f3a-ac782b63ed1mr532450966b.15.1743578755979; Wed, 02 Apr 2025
 00:25:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
From: Tao Liu <ltao@redhat.com>
Date: Wed, 2 Apr 2025 20:25:19 +1300
X-Gm-Features: AQ5f1JqW8YSrmWsbQ4tGdg0F1TfYcT5sY2ljbPABPmnl6zyJem6J993Qjpsist8
Message-ID: <CAO7dBbVa=HMvZEsFTCYwULSgjbfac7SCZNEKgYePgPXb9kNvgA@mail.gmail.com>
Subject: Re: [Crash-utility] [PATCH CRASH] Fix module section load address
 when sh_addr != 0
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: devel@lists.crash-utility.osci.io, linux-debuggers@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: cQ-xTVSLmngD574rD-Bzc6BOCRS7twegtGZUA-sqdLg_1743578757
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

Thanks for reporting the issue and patch. Please check if I understood
you correctly. The correct output you are expecting in your case is:

    crash> sym ata_dummy_port_ops
    ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
    crash> mod -s libata
         MODULE       NAME                      TEXT_BASE         SIZE
 OBJECT FILE
    ffffffffc0a7b640  libata                 ffffffffc0a47000   520192
    /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/drivers/a=
ta/libata.ko.debug
    crash> sym ata_dummy_port_ops
    ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
    crash> p/x &ata_dummy_port_ops
    $1 =3D 0xffffffffc0a6fe80 <<-------- should be 0xffffffffc0a71580,
same as sym's output, right?

If that is the case, then after applied your patch, the issue still
exists on my machine:

crash> sym fuse_miscdevice
ffffffffc05f7fe0 (?) fuse_miscdevice [fuse]
crash> mod -s fuse
     MODULE       NAME                             TEXT_BASE
SIZE  OBJECT FILE
ffffffffc05f8dc0  fuse                          ffffffffc05da000
233472  /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs/fuse/fu=
se.ko.debug
crash> sym fuse_miscdevice
ffffffffc05f7fe0 (b) fuse_miscdevice [fuse]
crash> p/x &fuse_miscdevice
$1 =3D 0xffffffffc05daf20 << ------ unmatch with the previous value.

The .data section of fuse.ko.debug have non-zero address:

$ readelf -S /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs/fu=
se/fuse.ko.debug
Section Headers:
  [Nr] Name              Type             Address           Offset
       Size              EntSize          Flags  Link  Info  Align
...
[50] .data             NOBITS           0000000000000e20  00000100
       000000000000080f  0000000000000000  WA       0     0     32

Could you please re-check your patch for this, or is there something
I'm missing?

Thanks,
Tao Liu

On Wed, Apr 2, 2025 at 11:41=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> A user reported that crash was reporting the address for certain module
> variables incorrectly. I was able to track it down specifically to
> variables which were located in the .data section of a kernel module.
> While the "sym" command gave the correct value, printing the address of
> the variable or expressions based on it with "p" would give an incorrect
> value. For example, the variable "ata_dummy_port_ops" variable is
> included in the .data section of libata.ko when built as a module:
>
>     $ sudo grep '\bata_dummy_port_ops\b' /proc/kallsyms
>     ffffffffc0a71580 d ata_dummy_port_ops   [libata]
>     $ sudo crash /usr/lib/debug/lib/modules/$(uname -r)/vmlinux /proc/kco=
re
>     crash> sym ata_dummy_port_ops
>     ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
>     crash> mod -s libata
>          MODULE       NAME                      TEXT_BASE         SIZE  O=
BJECT FILE
>     ffffffffc0a7b640  libata                 ffffffffc0a47000   520192
>     /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/drivers=
/ata/libata.ko.debug
>     crash> sym ata_dummy_port_ops
>     ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
>     crash> p/x &ata_dummy_port_ops
>     $1 =3D 0xffffffffc0a6fe80
>
> The symbol value (from kallsyms) is correct, but its address provided by
> GDB is incorrect. It turns out that the .data section has an sh_addr
> which is non-zero. The result of this is that calculate_load_order_6_4()
> incorrectly calculates the base address for the .data section. This
> patch fixes the base address which is later provided to GDB via
> add-symbol-file.
>
> The impact here is interesting. Only variables within sections that have
> a non-zero sh_addr are impacted. It turns out that this is relatively
> common since Linux kernel commit 22d407b164ff7 ("lib: add allocation
> tagging support for memory allocation profiling"), which was merged in
> 6.10. That commit added an entry to the scripts/module.lds.S linker
> script, without specifying a base address of zero. I believe that is the
> reason for the non-zero base addresses.
>
> I was able to verify that, in addition to the Oracle Linux kernel where
> we initially noticed the issue, kernel modules on Arch Linux and Fedora
> also have non-zero .data sh_addr values. This is likely the case for
> most non-clang kernels since 6.10, but those were the only two distros I
> checked. While my reading of the module.lds.S seems to indicate that
> kernels built with CONFIG_LTO_CLANG=3Dy should also have non-zero .data,
> .bss, and .rodata section addresses, I haven't been able to reproduce
> this with clang LTO kernels. Regardless, crash should properly handle
> non-zero sh_addr since it exists in the real world now.
>
> The core of the issue is that the symbol value returned by BFD includes
> the sh_addr of the section containing the symbol. For example, suppose
> a symbol with address 0 is located within a section with virtual address
> 0xa00. Then, the resulting symbol value will be 0xa00, not 0.
>
> calculate_load_order_6_4() computes the base address of each section by
> using a kallsyms symbol known to be within that section, and then
> subtracting the value of the symbol from the object file. This
> implicitly assumes that the section sh_addr is zero, and thus the symbol
> value is just an offset. To fix the computation, add in the section base
> address, to account for cases where it is non-zero.
>
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  symbols.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
>
> diff --git a/symbols.c b/symbols.c
> index 5adbc30..e30fafe 100644
> --- a/symbols.c
> +++ b/symbols.c
> @@ -12808,6 +12808,7 @@ calculate_load_order_6_4(struct load_module *lm, =
bfd *bfd, int dynamic,
>         asymbol *store;
>         asymbol *sym;
>         symbol_info syminfo;
> +       bfd_vma secaddr;
>         char *secname;
>         int i, t;
>
> @@ -12860,6 +12861,7 @@ calculate_load_order_6_4(struct load_module *lm, =
bfd *bfd, int dynamic,
>                                 }
>                                 if (strcmp(syminfo.name, s1->name) =3D=3D=
 0) {
>                                         secname =3D (char *)bfd_section_n=
ame(sym->section);
> +                                       secaddr =3D bfd_section_vma(sym->=
section);
>                                         break;
>                                 }
>
> @@ -12890,14 +12892,14 @@ calculate_load_order_6_4(struct load_module *lm=
, bfd *bfd, int dynamic,
>                         }
>
>                         /* Update the offset information for the section =
*/
> -                       sec_start =3D s1->value - syminfo.value;
> +                       sec_start =3D s1->value - syminfo.value + secaddr=
;
>                         /* keep the address instead of offset */
>                         lm->mod_section_data[i].addr =3D sec_start;
>                         lm->mod_section_data[i].flags |=3D SEC_FOUND;
>
>                         if (CRASHDEBUG(2))
> -                               fprintf(fp, "update sec offset sym %s @ %=
lx  val %lx  section %s\n",
> -                                       s1->name, s1->value, (ulong)symin=
fo.value, secname);
> +                               fprintf(fp, "update sec offset sym %s @ %=
lx  val %lx  section %s @ %lx\n",
> +                                       s1->name, s1->value, (ulong)symin=
fo.value, secname, secaddr);
>
>                         if (strcmp(secname, ".text") =3D=3D 0)
>                                 lm->mod_text_start =3D sec_start;
> --
> 2.43.5
> --
> Crash-utility mailing list -- devel@lists.crash-utility.osci.io
> To unsubscribe send an email to devel-leave@lists.crash-utility.osci.io
> https://${domain_name}/admin/lists/devel.lists.crash-utility.osci.io/
> Contribution Guidelines: https://github.com/crash-utility/crash/wiki

