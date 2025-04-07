Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EAA99156230
	for <linux-debuggers@vger.kernel.org>; Mon,  7 Apr 2025 08:16:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744013773; cv=none; b=uxjoDihPwLojIPkG7Ct0ilVDkr2ahqhh73NWquh4165Ujp2syyhAbV5+N2XIg3ML/aMfFyE1gjJG3GYva+Mz+nCl9x4kxDmDZ9Tnto4wOmxbzbqBq9bGHJmVDc/EBo35fNCTt93siQHYTpF0bqqr0u+eglMDh2aM4YeDE7+c4Qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744013773; c=relaxed/simple;
	bh=OxGuUMUUHGBX9XNNDKeS1nzWvDsfswymJjLZ3z4KwPU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ncNYgim26wFYaFbhDtaOM8hhPjhiCJyTsRBKHafgVlUBzYAI/BXcgMhJHwatcbZsQUrU/+YRWpoiEa6xbCUlfsLn5oeengSA4KtvRKvylRtAC7/5B2dyVNd1elL8VGRjEGt7YS+4G23LQPdiM8QjIEu776oZOSN4UFEO41ifHJI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LtDkqpxE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LtDkqpxE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1744013769;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yxAjUspLNKz9OtF7XtFWl9vL1VmkpAfNsWVDz+QvhOk=;
	b=LtDkqpxE6lF+Ygchazd4YTVgY5KaNn9qqFFsGxnhM8eN6ty7+my8sQutG1avgqwfItZmPe
	fc+zyNpK6rkXT9jkadSjyZfXSTlJrO4lj1z8HrBNXVVh0zJXQF5RmPjb4hvnRXWO9wMTT+
	g4Mr/Y+jwVIWVUTVz/dW5JuKCAb8x5Q=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-HQGhZFcSP0C5jIW3BQAoXg-1; Mon, 07 Apr 2025 04:16:08 -0400
X-MC-Unique: HQGhZFcSP0C5jIW3BQAoXg-1
X-Mimecast-MFC-AGG-ID: HQGhZFcSP0C5jIW3BQAoXg_1744013767
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-ac737973d06so376398866b.2
        for <linux-debuggers@vger.kernel.org>; Mon, 07 Apr 2025 01:16:08 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744013767; x=1744618567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yxAjUspLNKz9OtF7XtFWl9vL1VmkpAfNsWVDz+QvhOk=;
        b=OuXEAxeIhx/7qfRQVCYq0EwmFxIrhNsV40lzt5TYm3ozv1HcdSFEZt+bmIRCwaYuro
         wluu+/aPQ0/GhsRoBVF/hXXE+X+6A7qNX79Gf4adEQWyToD0GKjtvtb/nvYUOuxiq3I0
         e6S7bp80sP89Mg9hcrksxi0lvP96ZHQAcCxcZii8RdhM2nzX7RyGCIICpXRbs9hnM6Ev
         oPgnLzsn1/iM2tDNLatauIUFWrwt0ZBoIYlV4hk1xQPtQuHFsGhdb0Ss9TkZoKzGSBbM
         F/rfR6z3V6CjNj7wEhL+gsYfKScH2nqmqwcylGa284Vg8UrLifPCKDMiB/UYDWhNdFaT
         pGHw==
X-Forwarded-Encrypted: i=1; AJvYcCWsmLIauv5ZWTsomrfT/rUQT6IoeU60PYG9vXG9opp95OaONA984eUWOyN4rsIC3bJA9+D4FmwWdSp5fhCBl0M=@vger.kernel.org
X-Gm-Message-State: AOJu0YzO2hbdWoboGvLtW3/lahdWRMUCU2SO8trx5MYnm5dolraAq0rV
	juKksFE5glG8ha1+zdxfkwtNs+44u65FKUk5GWYp57HDfZTW72Dbwcz7w/Fbt39CUwAoai1Z7hy
	FMmCQyIxB6SpzE26wRfKiKEjJjxm5K8MTjs8zujQ/ODgRuulJn2xDpRjnarXh/SFQOjdNvWpmxh
	MVkEY1YMBpSv/KToJSRi7tqi6iUJC0nmxhlgmEJnyG8W40npho
X-Gm-Gg: ASbGncsRiasvrY9UqOJTPNgitUI4sOAzuaELd2rvxnJmPXSh2nISuEBZk2DKhtMia2E
	Kdtl4cHiajiq/Zn7cSLoUPw7E5AWXpiArfqUB+Kei1UxaeTCv1xxZeqZOmFxmrrKzXQ2v6gnvhi
	E=
X-Received: by 2002:a17:907:97d6:b0:ac7:391b:e68a with SMTP id a640c23a62f3a-ac7d1c14826mr893670366b.60.1744013766965;
        Mon, 07 Apr 2025 01:16:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFqL6cFBMejr4WW7U3qNQWRB1IiJGGaYtxCuToFJTpCrgLPUjyEwuKxOhzU0bnGyypt5OU07Pbl7dtl1D+QD5k=
X-Received: by 2002:a17:907:97d6:b0:ac7:391b:e68a with SMTP id
 a640c23a62f3a-ac7d1c14826mr893667266b.60.1744013766430; Mon, 07 Apr 2025
 01:16:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
 <CAO7dBbVa=HMvZEsFTCYwULSgjbfac7SCZNEKgYePgPXb9kNvgA@mail.gmail.com>
 <877c42ywxw.fsf@oracle.com> <871pu8zx1k.fsf@oracle.com> <CAO7dBbUAOfK-k-CKFgBopN_i4bGBO+bykO9VMQ0pu6Ja4hSGEw@mail.gmail.com>
 <87y0wfy06z.fsf@oracle.com>
In-Reply-To: <87y0wfy06z.fsf@oracle.com>
From: Tao Liu <ltao@redhat.com>
Date: Mon, 7 Apr 2025 20:15:30 +1200
X-Gm-Features: ATxdqUHisAlvhSUw1GfuPhibhb_D1zI18kuuMqfTANjWsL9hBIzK04pnld8rfe0
Message-ID: <CAO7dBbXBsXwniUQm0ox-XgwzHPTfRf2GCjSvt2ger2VYK28ZxQ@mail.gmail.com>
Subject: Re: [Crash-utility] [PATCH CRASH] Fix module section load address
 when sh_addr != 0
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: devel@lists.crash-utility.osci.io, linux-debuggers@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: B4cyNHIt4qeSLhZTDi-Amr9tZli072rk25k-4npDGSQ_1744013767
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

On Sat, Apr 5, 2025 at 12:30=E2=80=AFPM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> Hi Tao,
>
> Thanks for digging through the code with me. I'm not very confident or
> familiar with it, so I don't have 100% confident answers, but I'll do my
> best to answer:

Thanks for your explanation! I think your modification is reasonable
and I have run tests against your patch, no regression is found.
Though I still haven't figured out whether it is a gdb issue or crash
specific, however I think it is OK to accept your patch for now. So I
will ack your No.1 and No.2 patch. Though No.2 patch needs some
cleanup on the code, but I think that is just a minor change, I have
no objection to its major part.

So ack.

Thanks,
Tao Liu

>
> Tao Liu <ltao@redhat.com> writes:
> > Hi Stephen,
> >
> > On Fri, Apr 4, 2025 at 11:43=E2=80=AFAM Stephen Brennan
> > <stephen.s.brennan@oracle.com> wrote:
> >>
> >> Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> >> > Tao Liu <ltao@redhat.com> writes:
> >> >> Hi Stephen,
> >> >>
> >> >> Thanks for reporting the issue and patch. Please check if I underst=
ood
> >> >> you correctly. The correct output you are expecting in your case is=
:
> >> >>
> >> >>     crash> sym ata_dummy_port_ops
> >> >>     ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
> >> >>     crash> mod -s libata
> >> >>          MODULE       NAME                      TEXT_BASE         S=
IZE
> >> >>  OBJECT FILE
> >> >>     ffffffffc0a7b640  libata                 ffffffffc0a47000   520=
192
> >> >>     /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/d=
rivers/ata/libata.ko.debug
> >> >>     crash> sym ata_dummy_port_ops
> >> >>     ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
> >> >>     crash> p/x &ata_dummy_port_ops
> >> >>     $1 =3D 0xffffffffc0a6fe80 <<-------- should be 0xffffffffc0a715=
80,
> >> >> same as sym's output, right?
> >> >
> >> > Yes, that's correct.
> >> >
> >> >> If that is the case, then after applied your patch, the issue still
> >> >> exists on my machine:
> >> >>
> >> >> crash> sym fuse_miscdevice
> >> >> ffffffffc05f7fe0 (?) fuse_miscdevice [fuse]
> >> >> crash> mod -s fuse
> >> >>      MODULE       NAME                             TEXT_BASE
> >> >> SIZE  OBJECT FILE
> >> >> ffffffffc05f8dc0  fuse                          ffffffffc05da000
> >> >> 233472  /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs=
/fuse/fuse.ko.debug
> >> >> crash> sym fuse_miscdevice
> >> >> ffffffffc05f7fe0 (b) fuse_miscdevice [fuse]
> >> >> crash> p/x &fuse_miscdevice
> >> >> $1 =3D 0xffffffffc05daf20 << ------ unmatch with the previous value=
.
> >> >
> >> > Indeed, I checked with fuse on Fedora (6.11.4-301.fc41.x86_64, so al=
most
> >> > the same version). And I see the same behavior with fuse_miscdevice.
> >> >
> >> > In your case and mine, the offset is 0x1d0c0, which could be a clue =
to
> >> > how this mismatch happens.
> >> >
> >> >> The .data section of fuse.ko.debug have non-zero address:
> >> >>
> >> >> $ readelf -S /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kern=
el/fs/fuse/fuse.ko.debug
> >> >> Section Headers:
> >> >>   [Nr] Name              Type             Address           Offset
> >> >>        Size              EntSize          Flags  Link  Info  Align
> >> >> ...
> >> >> [50] .data             NOBITS           0000000000000e20  00000100
> >> >>        000000000000080f  0000000000000000  WA       0     0     32
> >> >>
> >> >> Could you please re-check your patch for this, or is there somethin=
g
> >> >> I'm missing?
> >> >
> >> > From what I can tell, the important difference here may be that the
> >> > symbol you selected is a static variable (which becomes a local ELF
> >> > symbol). Apparently, my patch only resolves the issue for *global
> >> > variables*, but not for local variables.
> >> >
> >> > $ eu-readelf -s /usr/lib/debug/lib/modules/$(uname -r)/kernel/fs/fus=
e/fuse.ko.debug | grep -P "fuse_(miscdevice|mutex)"
> >> >    85: 0000000000000100     80 OBJECT  LOCAL  DEFAULT       50 fuse_=
miscdevice
> >> >  1041: 00000000000005c0     32 OBJECT  GLOBAL DEFAULT       50 fuse_=
mutex
> >> >
> >> > Here is the behavior of crash's master branch on these two symbols:
> >> >
> >> > crash> sym fuse_miscdevice
> >> > ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
> >> > crash> sym fuse_mutex
> >> > ffffffffc02fb4a0 (?) fuse_mutex [fuse]
> >> > crash> mod -s fuse
> >> >      MODULE       NAME                                  TEXT_BASE   =
      SIZE  OBJECT FILE
> >> > ffffffffc02fbdc0  fuse                               ffffffffc02dd00=
0   233472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fus=
e/fuse.ko.debug
> >> > crash> sym fuse_miscdevice
> >> > ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
> >> > crash> sym fuse_mutex
> >> > ffffffffc02fb4a0 (B) fuse_mutex [fuse]
> >> > crash> p/x &fuse_miscdevice
> >> > $1 =3D 0xffffffffc02ddf20
> >> > crash> p/x &fuse_mutex
> >> > $2 =3D 0xffffffffc02fa680
> >> >
> >> > Both fuse_miscdevice, and fuse_mutex are mismatched (with different
> >> > offsets). And now, here's the behavior of crash with my patch:
> >> >
> >> > crash> sym fuse_miscdevice
> >> > ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
> >> > crash> sym fuse_mutex
> >> > ffffffffc02fb4a0 (?) fuse_mutex [fuse]
> >> > crash> mod -s fuse
> >> >      MODULE       NAME                                  TEXT_BASE   =
      SIZE  OBJECT FILE
> >> > ffffffffc02fbdc0  fuse                               ffffffffc02dd00=
0   233472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fus=
e/fuse.ko.debug
> >> > crash> sym fuse_miscdevice
> >> > ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
> >> > crash> sym fuse_mutex
> >> > ffffffffc02fb4a0 (B) fuse_mutex [fuse]
> >> > crash> p/x &fuse_miscdevice
> >> > $1 =3D 0xffffffffc02ddf20
> >> > crash> p/x &fuse_mutex
> >> > $2 =3D 0xffffffffc02fb4a0
> >> >
> >> > Here the global fuse_mutex is correct, but the static/local
> >> > fuse_miscdevice is still incorrect. This indicates that there's more=
 yet
> >> > to fix. (But at least my patch does part of the work!)
> >> >
> >> > I'm wondering whether this has anything to do with ELF relocations.
> >>
> >> Hello Tao,
> >
> > Thanks for your detailed debug info, which is quite helpful! For your
> > No.1 patch which fixes the global variable relocation, it looks good.
> > However, for your No.2 patch in the attached file, I have some
> > questions.
> >>
> >> I've continued debugging and verified that the root cause for this was
> >> GDB performing relocations to the DWARF info incorrectly. At the botto=
m
> >
> > 1) Is this a gdb bug? If it does, then the proper way is to post No.2
> > patch to gdb mailing list and get it fixed there, then we can do gdb
> > patch backporting to crash. Frankly I haven't figured out whether it
> > is gdb or crash bug so far by myself...
>
> I'm also not sure whether it's a GDB or Crash bug.
>
> Honestly, I think the "bug" is in Linux for producing non-zero section
> addresses in a relocatable file. It seems to be universal that section
> addresses are zero for relocatble ELF files.
>
> > 2) I'm quoting part of the commit log in your No.2 patch has follows
> > (Please don't send patch as attachment next time, because I cannot
> > comment directly on it)
>
> Understood, sorry.
>
> > ...
> > 1. In default_symfile_offsets(), GDB detects the nonzero sh_addr field
> >    and fails to apply the user-supplied section offsets. The result is
> >    that later, in symfile_relocate_debug_section(), relocations are
> >    applied to the DWARF info using the wrong section addresses, which
> >
> > Didn't we have corrected the .data section address in No.1 patch of
> > the .ko? Then why the "wrong section addresses"?
>
> The flow is like this:
>
> 1. crash executes "add-symbol-file [...] -s .data ADDRESS"
> 2. add_symbol_file_command() parses these and stores them in a list
> 3. We eventually make our way down to syms_from_objfile_1(), which seems
>    to be the main logic.
>    a. addr_info_make_relative() takes this list of section offsets,
>       along with the BFD file, and matches each one against the BFD
>       section. The function description indicates that the purpose is to
>       make the addresses provided be relative to the addresses in the
>       BFD section, which I suppose is why this number is subtracted.
>
>    b. Then, default_symfile_offsets() is called from
>       syms_from_objfile_1(). This function only cares about ET_REL
>       relocatable files. It verifies that all sections have a zero
>       sh_addr, and assuming that is so, it updates the load address and
>       sets various fields on the BFD file to allow relocations to work
>       correctly.
> 4. Relocations get applied using the values set in 3.b. Since the values
>    in 3.b were tampered with in 3.a, relocations that are based on the
>    address of the affected address are done incorrectly.
>
> I'm still not certain who is at fault, though!
>
> >    results in invalid addresses for variables. Clearly, this has
> >    happened before, because crash has special-cased the "__ksymtab*"
> >
> > Which line of code do you mean the special-cased __ksymtab? I didn't
> > find one in gdb/symfile.c.
>
> It is this part of the diff. I've removed it in my commit and also
> removed the check for nen-zero section addresses.
>
> --- gdb-16.2/gdb/symfile.c.orig
> +++ gdb-16.2/gdb/symfile.c
> @@ -633,7 +633,26 @@ default_symfile_offsets (struct objfile *objfile,
>        for (cur_sec =3D abfd->sections; cur_sec !=3D NULL; cur_sec =3D cu=
r_sec->next)
>         /* We do not expect this to happen; just skip this step if the
>            relocatable file has a section with an assigned VMA.  */
> -       if (bfd_section_vma (cur_sec) !=3D 0)
> +        if (bfd_section_vma (cur_sec) !=3D 0
> +           /*
> +            *  Kernel modules may have some non-zero VMAs, i.e., like th=
e
> +            *  __ksymtab and __ksymtab_gpl sections in this example:
> +            *
> +            *    Section Headers:
> +            *      [Nr] Name              Type             Address      =
     Offset
> +            *           Size              EntSize          Flags  Link  =
Info  Align
> +            *      ...
> +            *      [ 8] __ksymtab         PROGBITS         0000000000000=
060  0000ad90
> +            *           0000000000000010  0000000000000000   A       0  =
   0     16
> +            *      [ 9] .rela__ksymtab    RELA             0000000000000=
000  0000ada0
> +            *           0000000000000030  0000000000000018          43  =
   8     8
> +            *      [10] __ksymtab_gpl     PROGBITS         0000000000000=
070  0000add0
> +            *           00000000000001a0  0000000000000000   A       0  =
   0     16
> +            *      ...
> +            *
> +            *  but they should be treated as if they are NULL.
> +            */
> +            && strncmp (bfd_section_name (cur_sec), "__k", 3) !=3D 0)
>           break;
>
>        if (cur_sec =3D=3D NULL)
>
>
> >    section names to avoid this condition. To resolve this, we simply
> >    drop the check for nonzero sh_addr altogether: the only ET_REL files
> >    we encounter should be kernel modules, so there's no real reason to
> >    be picky.
> >
> > 2. Even with that fixed, the user-supplied section addresses are
> >    clobbered by the addr_info_make_relative(), which subtracts out
> >    section offsets during its operation. To resolve this, undo the
> >    operation for ET_REL files where a section address was provided by
> >    the user (i.e. crash).
> > ...
> >
> > According to your description, it seems to me the gdb cannot handle
> > the nonzero sh_addr in the .ko case, but .ko isn't the only one whose
> > .data VMA is non-zero, see this case:
> >
> > $ readelf -S /lib64/libc.so.6
> > ...
> > [30] .data             PROGBITS         00000000001e8000  001e8000
> >        00000000000016c8  0000000000000000  WA       0     0     32
> > ...
> >
> > I don't know if gdb also fails in the userspace .so case? I mean, if
> > gdb can handle the user case with no problem, then probably we don't
> > need to hack gdb like this.
>
> One important difference is that libc.so.6 is a ET_DYN dynamic object
> file. A key difference between dynamic executables and relocatable files
> is the symbol table: symbols in dynamic executables have an absolute
> virtual address, and they only change based on the load address. Symbols
> in relocatable files have an address which is an offset from the
> beginning of their section. So if a relocation is done based on the
> section address, and the section address is incorrect, then the
> relocation will be wrong.
>
> Stephen
>

