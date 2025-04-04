Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 763C818CBFC
	for <linux-debuggers@vger.kernel.org>; Fri,  4 Apr 2025 10:28:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743762499; cv=none; b=CiyuZVB0JFmKuoJ3FuwfEcVb1uRWKLVZp9PMVD7c8S9MqLW+ircaal0nq9gzFZVsMvNjewHA+hWz42XvCcMAnsD1P6bG0Rwn+bxM4Qn1gRTEiak9rK3bATq42oL9qt0N6P6529vWqnS7XtSKqGrmGYeGhp9p/ub/q4//ZkYMfMI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743762499; c=relaxed/simple;
	bh=Hqa3Al6vJ7R8e0eaJMoLY9urVrZte3sXZPkLGUYGYYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu9q2nnV+kAFFbNIOixN/wtWzBzAcDwqn5/SUJwcnRRo/m4Fd3sIEDirPr9frbcq0uGnT8z4szFYnxOIWuvTXwPgaS37H11dXjYbsTL9VvdOEbXj/FzZ7sdfYk71XeEZn7BNLWwNgAJYHETwFhc+Bl02WtSrYWNQzhHTFvHFoT4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=RTQ75zYY; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="RTQ75zYY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743762493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UmSPTLfARn0sIwuwYqo89JtimHThN4vkfYBg4LAVWfw=;
	b=RTQ75zYYs4bazVKZsjxByLrrLsD0XNhYHgvv79lf7PPq/SPmQj/ufoqZlM8/Hgw65tciJT
	tEJHINmMT0eMmFyC7MQxnc5u5u0XvV7A05rf9KiojAVDt0AA1IcBosQY7UUlPvq6iluzXX
	kspmqa0mP1kFkG1HhHPV9X3TsLO92wc=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-pjGetypHMpWhI-5GvZyU9g-1; Fri, 04 Apr 2025 06:28:12 -0400
X-MC-Unique: pjGetypHMpWhI-5GvZyU9g-1
X-Mimecast-MFC-AGG-ID: pjGetypHMpWhI-5GvZyU9g_1743762491
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac27f00a8a5so143099266b.3
        for <linux-debuggers@vger.kernel.org>; Fri, 04 Apr 2025 03:28:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743762491; x=1744367291;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UmSPTLfARn0sIwuwYqo89JtimHThN4vkfYBg4LAVWfw=;
        b=fL1DD8W26IzYpx9+LJJwUfCiW0FpI0PhDlHb4K9nAWvBmq94/HbEpPaban6OouElHd
         A1ce63HlPp0OyI7f4H6U2LZbzFPE5OPIRUiCiFFtLyd2aAwbzWZzn79phO4qySWy1UwK
         LIyTkUZZ/uVmG8vsvP8q0OKs/X53OEAF/+J0Xdse0yYZq6vtUBlKrlNW2Wqx8/vDSuKg
         UKptd6kIioKnRODkAZ/MCuvRSNH/yIT7sNJnDNFMAHQnGmTOthh4g8+D/K3odMcmkQUR
         aejGiOzeXNSuREuUi3Ov7pqmYO/n1RvgtkHyyUkYhLf1PwQt87WIIRpdCw4ZfOPXGwPZ
         Aznw==
X-Forwarded-Encrypted: i=1; AJvYcCXoulwbFxzY1qOlAmRU3mD6+31+80ZD5CBBMu4MjEIXp+WK65I0MeoAdwBga2Y5cNwiO9L2Nt9UmVMUfjhKwjc=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCI700KaCbZm+zmavHf1zA9yknWNoA54sYBuUuJsC2bFOJmjD7
	c54E4hXpwYDrKT4+n9HxUNduWxGA9ZMYrqsKkmR1kYPJcYhhrUbLito3ofo8uxm9S7S/UwAuPvQ
	ySf1EJQ16x340XFOJAdtL2fJv8Xfnl53AZRFpLg9dBg4dZQFiiCekIkn8y8tpdePUjWrBzwQTH6
	LJ26aKK2E5tj/mkPf2VKyFXIz5Sr0XninUsrH5laTIiWs85dX3r40=
X-Gm-Gg: ASbGnctNjNwKoYdhj6dRDFgM9ebUCTjLgG3ZHEqpINkqouOXpwu/rYpxyk0Hn559pRX
	XnTUi7KRJm89ZqItEJRLEVVpx6vEPEOieFXAsVp+QJ+pMxGOIDNcit1ZqsNcgaXQLYYzFQM8heF
	I=
X-Received: by 2002:a17:906:c14c:b0:ac7:30a2:696c with SMTP id a640c23a62f3a-ac7d6d230f2mr207861066b.16.1743762490332;
        Fri, 04 Apr 2025 03:28:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWxd8crNnoDE809HYow0CSWd8xhGWfqnmYzANLT4RilTyjFpnpA/jZlgRbVZHpAf1ttSfVQ6hwK6U53+7VQ40=
X-Received: by 2002:a17:906:c14c:b0:ac7:30a2:696c with SMTP id
 a640c23a62f3a-ac7d6d230f2mr207859266b.16.1743762489834; Fri, 04 Apr 2025
 03:28:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
 <CAO7dBbVa=HMvZEsFTCYwULSgjbfac7SCZNEKgYePgPXb9kNvgA@mail.gmail.com>
 <877c42ywxw.fsf@oracle.com> <871pu8zx1k.fsf@oracle.com>
In-Reply-To: <871pu8zx1k.fsf@oracle.com>
From: Tao Liu <ltao@redhat.com>
Date: Fri, 4 Apr 2025 23:27:33 +1300
X-Gm-Features: ATxdqUEUGGNhyuYYqwEpU_qup0EfTq3_kgAwEZPVoodajFz1l5xCCab9pJ4T9vg
Message-ID: <CAO7dBbUAOfK-k-CKFgBopN_i4bGBO+bykO9VMQ0pu6Ja4hSGEw@mail.gmail.com>
Subject: Re: [Crash-utility] [PATCH CRASH] Fix module section load address
 when sh_addr != 0
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: devel@lists.crash-utility.osci.io, linux-debuggers@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2q0N3JFzB88GwqzoaI668sd74cqWvZjtJxTVcS5D_DM_1743762491
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Fri, Apr 4, 2025 at 11:43=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> > Tao Liu <ltao@redhat.com> writes:
> >> Hi Stephen,
> >>
> >> Thanks for reporting the issue and patch. Please check if I understood
> >> you correctly. The correct output you are expecting in your case is:
> >>
> >>     crash> sym ata_dummy_port_ops
> >>     ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
> >>     crash> mod -s libata
> >>          MODULE       NAME                      TEXT_BASE         SIZE
> >>  OBJECT FILE
> >>     ffffffffc0a7b640  libata                 ffffffffc0a47000   520192
> >>     /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/driv=
ers/ata/libata.ko.debug
> >>     crash> sym ata_dummy_port_ops
> >>     ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
> >>     crash> p/x &ata_dummy_port_ops
> >>     $1 =3D 0xffffffffc0a6fe80 <<-------- should be 0xffffffffc0a71580,
> >> same as sym's output, right?
> >
> > Yes, that's correct.
> >
> >> If that is the case, then after applied your patch, the issue still
> >> exists on my machine:
> >>
> >> crash> sym fuse_miscdevice
> >> ffffffffc05f7fe0 (?) fuse_miscdevice [fuse]
> >> crash> mod -s fuse
> >>      MODULE       NAME                             TEXT_BASE
> >> SIZE  OBJECT FILE
> >> ffffffffc05f8dc0  fuse                          ffffffffc05da000
> >> 233472  /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs/fu=
se/fuse.ko.debug
> >> crash> sym fuse_miscdevice
> >> ffffffffc05f7fe0 (b) fuse_miscdevice [fuse]
> >> crash> p/x &fuse_miscdevice
> >> $1 =3D 0xffffffffc05daf20 << ------ unmatch with the previous value.
> >
> > Indeed, I checked with fuse on Fedora (6.11.4-301.fc41.x86_64, so almos=
t
> > the same version). And I see the same behavior with fuse_miscdevice.
> >
> > In your case and mine, the offset is 0x1d0c0, which could be a clue to
> > how this mismatch happens.
> >
> >> The .data section of fuse.ko.debug have non-zero address:
> >>
> >> $ readelf -S /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/=
fs/fuse/fuse.ko.debug
> >> Section Headers:
> >>   [Nr] Name              Type             Address           Offset
> >>        Size              EntSize          Flags  Link  Info  Align
> >> ...
> >> [50] .data             NOBITS           0000000000000e20  00000100
> >>        000000000000080f  0000000000000000  WA       0     0     32
> >>
> >> Could you please re-check your patch for this, or is there something
> >> I'm missing?
> >
> > From what I can tell, the important difference here may be that the
> > symbol you selected is a static variable (which becomes a local ELF
> > symbol). Apparently, my patch only resolves the issue for *global
> > variables*, but not for local variables.
> >
> > $ eu-readelf -s /usr/lib/debug/lib/modules/$(uname -r)/kernel/fs/fuse/f=
use.ko.debug | grep -P "fuse_(miscdevice|mutex)"
> >    85: 0000000000000100     80 OBJECT  LOCAL  DEFAULT       50 fuse_mis=
cdevice
> >  1041: 00000000000005c0     32 OBJECT  GLOBAL DEFAULT       50 fuse_mut=
ex
> >
> > Here is the behavior of crash's master branch on these two symbols:
> >
> > crash> sym fuse_miscdevice
> > ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
> > crash> sym fuse_mutex
> > ffffffffc02fb4a0 (?) fuse_mutex [fuse]
> > crash> mod -s fuse
> >      MODULE       NAME                                  TEXT_BASE      =
   SIZE  OBJECT FILE
> > ffffffffc02fbdc0  fuse                               ffffffffc02dd000  =
 233472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fuse/f=
use.ko.debug
> > crash> sym fuse_miscdevice
> > ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
> > crash> sym fuse_mutex
> > ffffffffc02fb4a0 (B) fuse_mutex [fuse]
> > crash> p/x &fuse_miscdevice
> > $1 =3D 0xffffffffc02ddf20
> > crash> p/x &fuse_mutex
> > $2 =3D 0xffffffffc02fa680
> >
> > Both fuse_miscdevice, and fuse_mutex are mismatched (with different
> > offsets). And now, here's the behavior of crash with my patch:
> >
> > crash> sym fuse_miscdevice
> > ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
> > crash> sym fuse_mutex
> > ffffffffc02fb4a0 (?) fuse_mutex [fuse]
> > crash> mod -s fuse
> >      MODULE       NAME                                  TEXT_BASE      =
   SIZE  OBJECT FILE
> > ffffffffc02fbdc0  fuse                               ffffffffc02dd000  =
 233472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fuse/f=
use.ko.debug
> > crash> sym fuse_miscdevice
> > ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
> > crash> sym fuse_mutex
> > ffffffffc02fb4a0 (B) fuse_mutex [fuse]
> > crash> p/x &fuse_miscdevice
> > $1 =3D 0xffffffffc02ddf20
> > crash> p/x &fuse_mutex
> > $2 =3D 0xffffffffc02fb4a0
> >
> > Here the global fuse_mutex is correct, but the static/local
> > fuse_miscdevice is still incorrect. This indicates that there's more ye=
t
> > to fix. (But at least my patch does part of the work!)
> >
> > I'm wondering whether this has anything to do with ELF relocations.
>
> Hello Tao,

Thanks for your detailed debug info, which is quite helpful! For your
No.1 patch which fixes the global variable relocation, it looks good.
However, for your No.2 patch in the attached file, I have some
questions.
>
> I've continued debugging and verified that the root cause for this was
> GDB performing relocations to the DWARF info incorrectly. At the bottom

1) Is this a gdb bug? If it does, then the proper way is to post No.2
patch to gdb mailing list and get it fixed there, then we can do gdb
patch backporting to crash. Frankly I haven't figured out whether it
is gdb or crash bug so far by myself...

2) I'm quoting part of the commit log in your No.2 patch has follows
(Please don't send patch as attachment next time, because I cannot
comment directly on it)

...
1. In default_symfile_offsets(), GDB detects the nonzero sh_addr field
   and fails to apply the user-supplied section offsets. The result is
   that later, in symfile_relocate_debug_section(), relocations are
   applied to the DWARF info using the wrong section addresses, which

Didn't we have corrected the .data section address in No.1 patch of
the .ko? Then why the "wrong section addresses"?

   results in invalid addresses for variables. Clearly, this has
   happened before, because crash has special-cased the "__ksymtab*"

Which line of code do you mean the special-cased __ksymtab? I didn't
find one in gdb/symfile.c.

   section names to avoid this condition. To resolve this, we simply
   drop the check for nonzero sh_addr altogether: the only ET_REL files
   we encounter should be kernel modules, so there's no real reason to
   be picky.

2. Even with that fixed, the user-supplied section addresses are
   clobbered by the addr_info_make_relative(), which subtracts out
   section offsets during its operation. To resolve this, undo the
   operation for ET_REL files where a section address was provided by
   the user (i.e. crash).
...

According to your description, it seems to me the gdb cannot handle
the nonzero sh_addr in the .ko case, but .ko isn't the only one whose
.data VMA is non-zero, see this case:

$ readelf -S /lib64/libc.so.6
...
[30] .data             PROGBITS         00000000001e8000  001e8000
       00000000000016c8  0000000000000000  WA       0     0     32
...

I don't know if gdb also fails in the userspace .so case? I mean, if
gdb can handle the user case with no problem, then probably we don't
need to hack gdb like this.

Thanks,
Tao Liu


> of this email I've attached my patch, which you can apply to the master
> branch to test out my proposed fix. The patch file also contains a
> longer explanation of what I believe the issue is.
>
> However, since it updates the gdb-16.2.patch file, it's quite difficult
> to understand. Thus, I'll also provide a diff here of the relevant GDB
> source file.
>
> I'm not certain how the GDB patches are normally updated & reviewed. I
> also recognize that this change is a bit messy, so I'd appreciate your
> feedback as well.
>
> Thank you,
> Stephen
>
> --- tmp/gdb-16.2/gdb/symfile.c  2025-04-03 15:38:26.093760270 -0700
> +++ gdb-16.2/gdb/symfile.c      2025-04-03 15:07:43.239691104 -0700
> @@ -341,8 +341,13 @@ place_section (bfd *abfd, asection *sect
>      return;
>
>    /* If the user specified an offset, honor it.  */
> -  if (offsets[gdb_bfd_section_index (abfd, sect)] !=3D 0)
> +  if (offsets[gdb_bfd_section_index (abfd, sect)] !=3D 0) {
> +    /* addr_info_make_relative() subtracts out the section VMA. But if t=
he user
> +     * specified an offset, they have already taken this into account. A=
dd it
> +     * back in */
> +    offsets[gdb_bfd_section_index (abfd, sect)] +=3D bfd_section_vma(sec=
t);
>      return;
> +  }
>
>    /* Otherwise, let's try to find a place for the section.  */
>    start_addr =3D (lowest + align - 1) & -align;
> @@ -628,35 +633,8 @@ default_symfile_offsets (struct objfile
>    if ((bfd_get_file_flags (objfile->obfd.get ()) & (EXEC_P | DYNAMIC)) =
=3D=3D 0)
>      {
>        bfd *abfd =3D objfile->obfd.get ();
> -      asection *cur_sec;
> +      asection *cur_sec =3D NULL;
>
> -      for (cur_sec =3D abfd->sections; cur_sec !=3D NULL; cur_sec =3D cu=
r_sec->next)
> -       /* We do not expect this to happen; just skip this step if the
> -          relocatable file has a section with an assigned VMA.  */
> -        if (bfd_section_vma (cur_sec) !=3D 0
> -           /*
> -            *  Kernel modules may have some non-zero VMAs, i.e., like th=
e
> -            *  __ksymtab and __ksymtab_gpl sections in this example:
> -            *
> -            *    Section Headers:
> -            *      [Nr] Name              Type             Address      =
     Offset
> -            *           Size              EntSize          Flags  Link  =
Info  Align
> -            *      ...
> -            *      [ 8] __ksymtab         PROGBITS         0000000000000=
060  0000ad90
> -            *           0000000000000010  0000000000000000   A       0  =
   0     16
> -            *      [ 9] .rela__ksymtab    RELA             0000000000000=
000  0000ada0
> -            *           0000000000000030  0000000000000018          43  =
   8     8
> -            *      [10] __ksymtab_gpl     PROGBITS         0000000000000=
070  0000add0
> -            *           00000000000001a0  0000000000000000   A       0  =
   0     16
> -            *      ...
> -            *
> -            *  but they should be treated as if they are NULL.
> -            */
> -            && strncmp (bfd_section_name (cur_sec), "__k", 3) !=3D 0)
> -         break;
> -
> -      if (cur_sec =3D=3D NULL)
> -       {
>           section_offsets &offsets =3D objfile->section_offsets;
>
>           /* Pick non-overlapping offsets for sections the user did not
> @@ -704,7 +682,6 @@ default_symfile_offsets (struct objfile
>                                         offsets[cur_sec->index]);
>               offsets[cur_sec->index] =3D 0;
>             }
> -       }
>      }
>
>    /* Remember the bfd indexes for the .text, .data, .bss and
>
>

