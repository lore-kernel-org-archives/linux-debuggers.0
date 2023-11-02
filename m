Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0063CC4332F
	for <linux-debuggers@archiver.kernel.org>; Thu,  2 Nov 2023 14:38:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230205AbjKBOiZ (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Thu, 2 Nov 2023 10:38:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230196AbjKBOiZ (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Thu, 2 Nov 2023 10:38:25 -0400
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 30D5E186
        for <linux-debuggers@vger.kernel.org>; Thu,  2 Nov 2023 07:38:22 -0700 (PDT)
Received: by mail-qt1-x832.google.com with SMTP id d75a77b69052e-41cd444d9d0so5291111cf.2
        for <linux-debuggers@vger.kernel.org>; Thu, 02 Nov 2023 07:38:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698935901; x=1699540701; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ejkseplvrMek9eThrnFfzFiF6xLK8EYoy7pSv61VTVU=;
        b=jj+JEc3mJJXKTf6eVtdtC/D4BY/d8TJgCvHLJ6sYrpat4idI0LGUji6HiquBTMh0Nc
         8uibK2LaLlgdLUlYpOnR9uRCUa4J+shdR3KFUZoNCgJY59k4gc2Sb2iXZQjqyC2Lwu7p
         vAV5sU7N1Ku+PA8h43knHXXwsXvc1yQR4UwF5d3Xl0yaUo4m9sLp1g6KfyT8ml4xQadl
         IwLdnbmH2IGGDlEDS1rpSwPuUh7sV7LfnFiLoxZJsi45yCrihbKTiQPVniHIyccabBz7
         8nyCxICuTQQuQaW9Mu/PqLzoO+IeCxQpR751GUeq9CBWmIN5jHyh6Jcsh/3yrUZFyi2V
         R3jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698935901; x=1699540701;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ejkseplvrMek9eThrnFfzFiF6xLK8EYoy7pSv61VTVU=;
        b=SHKg6B/kNAz51a2olIWJ1GmJUD2b4WdoPvJrkj56n9/TigPL140e6uF7vrTLbXJyyl
         Vs44MDt4VS2ra/s/gGVeSsCrLyOBd1Zpo6Zr2guflpwb8GoSfg416ll+ESH//0NWNONH
         cKqnN4/0/yAyrOVAfrk6j+dnrfH6vRPp4jMl6Fe+4wVeGAg5uisMvKDwQoamwUjNn1YS
         5IK0RxF9y9RblCsBfI8eQylMP4THVNhJcMitDtIBX9CUku3O+auNFlFyYFz1kelcfp8h
         Dat+fUTAsGd6Mpic3NaiJHVSiDzF+gOAReGBvVkYCd1ERX8ouJSr6A1JolLicT6BC19m
         uf+w==
X-Gm-Message-State: AOJu0Yw1K43pZjbBEqiQmvu4EPsh80uTnDzDYABpDDdZmnqCEzU9aoqN
        oqSs8yUZrokL+qaQ3WLV51Ha1v71sSI65nrIzMfMHOolbYo=
X-Google-Smtp-Source: AGHT+IFoxpbVfd9kGQmH4oLyyNdEkqHq45cTuLgdCGBQCNGf5CLOR7OGKv5Wb3kTPti3tHcbPIDa+2u9EqrOdlCFl6k=
X-Received: by 2002:a05:622a:138b:b0:41c:e206:349b with SMTP id
 o11-20020a05622a138b00b0041ce206349bmr20516024qtk.68.1698935901187; Thu, 02
 Nov 2023 07:38:21 -0700 (PDT)
MIME-Version: 1.0
References: <20230918233233.1431858-1-stephen.s.brennan@oracle.com> <20230918233233.1431858-3-stephen.s.brennan@oracle.com>
In-Reply-To: <20230918233233.1431858-3-stephen.s.brennan@oracle.com>
From:   =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date:   Thu, 2 Nov 2023 18:38:09 +0400
Message-ID: <CAJ+F1CKOWYwrjmLoiQRC=s8XBBE-x2qvABNX1bUVgQdtG-+Q8w@mail.gmail.com>
Subject: Re: [PATCH v3 qemu 2/3] dump: Allow directly outputting raw kdump format
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        Omar Sandoval <osandov@osandov.com>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?Q?Daniel_P_=2E_Berrang=C3=A9?= <berrange@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi Stephen

On Tue, Sep 19, 2023 at 3:32=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> The flattened format (currently output by QEMU) is used by makedumpfile
> only when it is outputting a vmcore to a file which is not seekable. The
> flattened format functions essentially as a set of instructions of the
> form "seek to the given offset, then write the given bytes out".
>
> The flattened format can be reconstructed using makedumpfile -R, or
> makedumpfile-R.pl, but it is a slow process because it requires copying
> the entire vmcore. The flattened format can also be directly read by
> crash, but still, it requires a lengthy reassembly phase.
>
> To sum up, the flattened format is not an ideal one: it should only be
> used on files which are actually not seekable. This is the exact
> strategy which makedumpfile uses, as seen in the implementation of
> "write_buffer()" in makedumpfile [1]. However, QEMU has always used the
> flattened format. For compatibility it is best not to change the default
> output format without warning. So, add a flag to DumpState which changes
> the output to use the normal (i.e. raw) format. This flag will be added
> to the QMP and HMP commands in the next change.
>
> [1]: https://github.com/makedumpfile/makedumpfile/blob/f23bb943568188a274=
6dbf9b6692668f5a2ac3b6/makedumpfile.c#L5008-L5040
>
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  dump/dump.c           | 32 +++++++++++++++++++++++++-------
>  include/sysemu/dump.h |  1 +
>  2 files changed, 26 insertions(+), 7 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 74071a1565..10aa2c79e0 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -814,6 +814,10 @@ static int write_start_flat_header(DumpState *s)
>      MakedumpfileHeader *mh;
>      int ret =3D 0;
>
> +    if (s->kdump_raw) {
> +        return 0;
> +    }
> +
>      QEMU_BUILD_BUG_ON(sizeof *mh > MAX_SIZE_MDF_HEADER);
>      mh =3D g_malloc0(MAX_SIZE_MDF_HEADER);
>
> @@ -837,6 +841,10 @@ static int write_end_flat_header(DumpState *s)
>  {
>      MakedumpfileDataHeader mdh;
>
> +    if (s->kdump_raw) {
> +        return 0;
> +    }
> +
>      mdh.offset =3D END_FLAG_FLAT_HEADER;
>      mdh.buf_size =3D END_FLAG_FLAT_HEADER;
>
> @@ -853,13 +861,21 @@ static int write_buffer(DumpState *s, off_t offset,=
 const void *buf, size_t size
>  {
>      size_t written_size;
>      MakedumpfileDataHeader mdh;
> +    loff_t seek_loc;

Any reason to use loff_t over off_t here? It fails to compile on win32
for ex. I can touch on PR commit otherwise.

>
> -    mdh.offset =3D cpu_to_be64(offset);
> -    mdh.buf_size =3D cpu_to_be64(size);
> +    if (s->kdump_raw) {
> +        seek_loc =3D lseek(s->fd, offset, SEEK_SET);
> +        if (seek_loc =3D=3D (off_t) -1) {
> +            return -1;
> +        }
> +    } else {
> +        mdh.offset =3D cpu_to_be64(offset);
> +        mdh.buf_size =3D cpu_to_be64(size);
>
> -    written_size =3D qemu_write_full(s->fd, &mdh, sizeof(mdh));
> -    if (written_size !=3D sizeof(mdh)) {
> -        return -1;
> +        written_size =3D qemu_write_full(s->fd, &mdh, sizeof(mdh));
> +        if (written_size !=3D sizeof(mdh)) {
> +            return -1;
> +        }
>      }
>
>      written_size =3D qemu_write_full(s->fd, buf, size);
> @@ -1775,7 +1791,8 @@ static void vmcoreinfo_update_phys_base(DumpState *=
s)
>
>  static void dump_init(DumpState *s, int fd, bool has_format,
>                        DumpGuestMemoryFormat format, bool paging, bool ha=
s_filter,
> -                      int64_t begin, int64_t length, Error **errp)
> +                      int64_t begin, int64_t length, bool kdump_raw,
> +                      Error **errp)
>  {
>      ERRP_GUARD();
>      VMCoreInfoState *vmci =3D vmcoreinfo_find();
> @@ -1786,6 +1803,7 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,
>      s->has_format =3D has_format;
>      s->format =3D format;
>      s->written_size =3D 0;
> +    s->kdump_raw =3D kdump_raw;
>
>      /* kdump-compressed is conflict with paging and filter */
>      if (has_format && format !=3D DUMP_GUEST_MEMORY_FORMAT_ELF) {
> @@ -2168,7 +2186,7 @@ void qmp_dump_guest_memory(bool paging, const char =
*file,
>      dump_state_prepare(s);
>
>      dump_init(s, fd, has_format, format, paging, has_begin,
> -              begin, length, errp);
> +              begin, length, false, errp);
>      if (*errp) {
>          qatomic_set(&s->status, DUMP_STATUS_FAILED);
>          return;
> diff --git a/include/sysemu/dump.h b/include/sysemu/dump.h
> index e27af8fb34..d702854853 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -157,6 +157,7 @@ typedef struct DumpState {
>      MemoryMappingList list;
>      bool resume;
>      bool detached;
> +    bool kdump_raw;
>      hwaddr memory_offset;
>      int fd;
>
> --
> 2.39.3
>


--=20
Marc-Andr=C3=A9 Lureau
