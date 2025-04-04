Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3612F847B
	for <linux-debuggers@vger.kernel.org>; Fri,  4 Apr 2025 06:42:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743748959; cv=none; b=CtsNML35vxY0MNj4LfMulRQWcbrrbNBRXLiqijrYix0WduhLN3q8WrOAeVR0NRqjXJWhNptxkhcNV+yWPavljVHkPaF5Yfm8NcwfMAz5I/I3XjmE+QlY2qVysQxK1A9uE7nooccb199CQ85tcVITuhpNyVPgjvdkJ6M0kLp6FWg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743748959; c=relaxed/simple;
	bh=0sNFLsZt36WP0ArGJgC3GkocW3/1dxtR/X0H6ngPGLQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=t9cATuBiTxVvnFOZHefdbp7632Dgf4hxRlGFedOGk23y3dQucTsr1m2IASVjymE6YN53l8LZvJVtdwpDY+C/bZ9q3HKheBFWzQtVK18/uMYxOntEZ+h1WjyoaasbEB1n70VpJ2Ma92A3isnobhKTKoUUL38Kyi+Iri/38uzfbDI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=YZWXseRi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="YZWXseRi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1743748956;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=DjbeDINtt33084spi8VXyNdcuNwN74P6gqK5MyqIp0I=;
	b=YZWXseRinU0JadqY9slk+E2yOAqHrm+oEUtSM/1IyTRk31ykSinQPchKuCjJqYFdJcoFu2
	g9ARjJ1jVYaUL9Q4d/ra+RAQIR2k2Ojo15ifZQ86YfkxEKlMpKK4u8CoLSUk7alaUbGs55
	hF7QPAUB+vV8CxvSdf8NIok/fajat78=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-597-1Fbn9fIhMiyJhNeIEdmiAA-1; Fri, 04 Apr 2025 02:42:34 -0400
X-MC-Unique: 1Fbn9fIhMiyJhNeIEdmiAA-1
X-Mimecast-MFC-AGG-ID: 1Fbn9fIhMiyJhNeIEdmiAA_1743748954
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-ac3d3cd9accso140856866b.3
        for <linux-debuggers@vger.kernel.org>; Thu, 03 Apr 2025 23:42:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743748954; x=1744353754;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=DjbeDINtt33084spi8VXyNdcuNwN74P6gqK5MyqIp0I=;
        b=KmtPRsJMVbWy6enH1LNATbfi3cGspVN3jFhbmFQqtjtN9kCeFNf65xUp3lvRSAlP3r
         y8tq4akSk2Kjz6a4w/+d/rjWv6dodlVT6vwTljHONfexQH47PD/LK/WKDdNclqayjkXE
         JlEweGK8KMzgIJfD3lTDg80ZqxZ0UDTsZoVL3CKbXdHw678IijSV1Y4Q5+z6qCDWUwNm
         zDGssfzb6ZGKREjHZ5VrlpKZlPo8FyNUYKJ3EW1HFIbZ2k6DLNP0c62ggE4Csnvs7Ybz
         QgJL5OUj0plaqUGtqzqXhAvG+uR2LYmL9IzQtpUbEJJ+ifYNyYo+vgqKj100lcv+iAsR
         YSoQ==
X-Forwarded-Encrypted: i=1; AJvYcCV2/PjSYaDbtJkTvYfjN9XIbC1WU4NWNJ7C++2TjedjkAwfe/DV6gcZY4OX/mjv+QM/2CG2PbVEPxDc45qTRSg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzXWfGnalFw8PgTW0J5mHIg78DU4HvO+XdUn8rM6jGWc1dPg7uY
	jKp8Z2Fz60wkDvUEz9anLFWr0zVqWYJI1iVoNYMT65r7BAKDFmYECuKFEFT7AiiqXosy6OByzns
	OCGEzwM3LCNs3bLizO+O/7HvWPfz8tZ5g8bfB3//qeG7xMIUDXD+dKYdw9WnZajN+bBJUNTMV2N
	44APEBp7PzaWhqZcKVVoXXRMqnZOu2rPJ7/tgiSbNv
X-Gm-Gg: ASbGnctxY1+s03Q2lyXq7/Sf8qUHcornu3e0RHcKEmdg+NACodOczHOsjZyUXnPk/tz
	FQo7qhnVh7pUZy1w45QhchGXhl/l/XQHwFRe18o/1M9t+eLcoc62WbGxVGBAjdkR1f2/ufBaGWn
	o=
X-Received: by 2002:a17:906:c144:b0:ac3:50b:b810 with SMTP id a640c23a62f3a-ac7d191bfe5mr201550766b.33.1743748953598;
        Thu, 03 Apr 2025 23:42:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFXs3w1oUWeWLXitSPJIhcgYqTowisSe4ABvnHc0Dt64ptmmgBHK83Ce18B2gpyW6PObK35/zC0lhUiMLrsfwM=
X-Received: by 2002:a17:906:c144:b0:ac3:50b:b810 with SMTP id
 a640c23a62f3a-ac7d191bfe5mr201549466b.33.1743748953177; Thu, 03 Apr 2025
 23:42:33 -0700 (PDT)
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
Date: Fri, 4 Apr 2025 19:41:56 +1300
X-Gm-Features: ATxdqUF4hgW-_JQkP-s0ZQFj3I2MP0S0wtFWTzLlrdVbqvjTxqZou_dCyPnPf1Q
Message-ID: <CAO7dBbUBvRh_u_mcXDszswTaob0zyeS21zVyMTyA0ZSmci0zOg@mail.gmail.com>
Subject: Re: [Crash-utility] [PATCH CRASH] Fix module section load address
 when sh_addr != 0
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: devel@lists.crash-utility.osci.io, linux-debuggers@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: HkPOiOaq3fSXRgYhqzvuT0Uo5Nui-NwVKmCwQmXGWkc_1743748954
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
>
> I've continued debugging and verified that the root cause for this was
> GDB performing relocations to the DWARF info incorrectly. At the bottom
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

Thanks a lot for your efforts on this. I'm looking into your patch,
please wait a while.

Thanks,
Tao Liu

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

