Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C1A4CD37B0
	for <linux-debuggers@archiver.kernel.org>; Mon, 18 Sep 2023 11:15:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234440AbjIRLP1 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 18 Sep 2023 07:15:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241544AbjIRLOy (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 18 Sep 2023 07:14:54 -0400
Received: from mail-oi1-x22a.google.com (mail-oi1-x22a.google.com [IPv6:2607:f8b0:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 802EAE6D
        for <linux-debuggers@vger.kernel.org>; Mon, 18 Sep 2023 04:13:40 -0700 (PDT)
Received: by mail-oi1-x22a.google.com with SMTP id 5614622812f47-3adba522a5dso1528251b6e.2
        for <linux-debuggers@vger.kernel.org>; Mon, 18 Sep 2023 04:13:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695035620; x=1695640420; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Muytw7Xb3bSzzBX7EybLQFIvJbCJQTp+2CyV7XtpksY=;
        b=Qi+OgpLTyUcX4ldqxFTtyWg2llNVRa/u7yROIEL91Gp4ZB5EWep1PzRZ5hoXcNb5/5
         NHGX1B0973gwPQqyUsAuG2z9ZB9d3O4/xnfGO45zI1KoxwZH26NiKBJWP//ALG5FwYIp
         GMGhXz8bkctEPDW7payrYGxfp+FAah/B+nU/TaSXoWl5sFoRoEngjJ3wynBbhYAjQm33
         /Ekwy7U45ABX3QOiBTnJPWsjX4BD++Lnfye7gC+t1WC+dZkJRQ31FFqkrP6ME0+KOv2G
         kVpqOpAxThv3tXKs9NhKPqhOmTFZY3vtE0C4lRW5D+EHmzkYqXChbxQAnoFndliTBmum
         X5UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695035620; x=1695640420;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Muytw7Xb3bSzzBX7EybLQFIvJbCJQTp+2CyV7XtpksY=;
        b=k9K3pzZEKr9KJ7oVCpLJeyQeJ7yim4Lumb3r36Ta4lzh0Nzhs9NwTlKrKZuj/CQIl4
         znCnL+7QlXDJDPhIrKM45QvYwqUX4lxB1pD7airEyNWMNFBDdOc2vnMgk+2Oy0u06S3a
         r5yBjAIpCO3KbK2M7WMZVN5jW6wPfs1gfTns19mk4ur6BArFoPhTCZ9mbYN2n5+cf+X/
         TWhkHx15GLqfIXqJmgowkex62qvCRPcZd8JiM7/ew18gxvUBtTsyGjCxvlNZG1bnt4uA
         /6PZTi0oOpHIQqoV/K6alNTYln1AJhocJepMpx04IMDW1U8opnXgFz2RyGC3j0LRBXMb
         lT9A==
X-Gm-Message-State: AOJu0YzFc/hnKT1k6xNfnyzGYG80Yk74F48r44wHbumTfDvSctKjJfTA
        qZcggyYssLqmjElqphqKwLOcFY9FRmaVEubdtpGYBZnZPcU=
X-Google-Smtp-Source: AGHT+IFIi7FYpZ7QGaNe6e+jd8ZoMjoM0RUuOEuL6Emc4X3VThBzglUCDwHhDY+uB1Om6hu0o2UhBxxEgfs9oowIk8E=
X-Received: by 2002:a05:6808:64c:b0:3a7:36f9:51aa with SMTP id
 z12-20020a056808064c00b003a736f951aamr8023601oih.17.1695035619688; Mon, 18
 Sep 2023 04:13:39 -0700 (PDT)
MIME-Version: 1.0
References: <20230914010315.945705-1-stephen.s.brennan@oracle.com> <20230914010315.945705-3-stephen.s.brennan@oracle.com>
In-Reply-To: <20230914010315.945705-3-stephen.s.brennan@oracle.com>
From:   =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date:   Mon, 18 Sep 2023 15:13:28 +0400
Message-ID: <CAJ+F1CJK60Mu5DJTgPg1ytGaxQ3aoXiV9GXG61+rOOYDuk6Dmg@mail.gmail.com>
Subject: Re: [PATCH v2 qemu 2/3] dump: Allow directly outputting reassembled kdumps
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

Hi

On Thu, Sep 14, 2023 at 5:04=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> The flattened format (currently output by qemu) is used by makedumpfile
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
> "write_buffer()" in makedumpfile [1]. However, Qemu has always used the
> flattened format. For compatibility it is best not to change the default
> output format without warning. So, add a flag to DumpState which changes
> the output to use the normal (i.e. reassembled) format. This flag will
> be added to the QMP commands in the next change.
>
> [1]: https://github.com/makedumpfile/makedumpfile/blob/f23bb943568188a274=
6dbf9b6692668f5a2ac3b6/makedumpfile.c#L5008-L5040
>
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  dump/dump.c           | 38 +++++++++++++++++++++++++++++++-------
>  include/sysemu/dump.h |  1 +
>  2 files changed, 32 insertions(+), 7 deletions(-)
>
> diff --git a/dump/dump.c b/dump/dump.c
> index 74071a1565..fb9040cfbc 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -814,6 +814,16 @@ static int write_start_flat_header(DumpState *s)
>      MakedumpfileHeader *mh;
>      int ret =3D 0;
>
> +    /* The user can request we not use the flattened format, but
> +     * if the file is not seekable, we need to fall back to flattened. *=
/
> +    if (s->kdump_reassembled) {
> +        if (lseek(s->fd, 0, SEEK_CUR) =3D=3D (loff_t) -1) {
> +            s->kdump_reassembled =3D false;

Since it was explicitly asked by the user, we better return an error
instead of falling back silently on flattened.


> +        } else {
> +            return 0;
> +        }
> +    }
> +
>      QEMU_BUILD_BUG_ON(sizeof *mh > MAX_SIZE_MDF_HEADER);
>      mh =3D g_malloc0(MAX_SIZE_MDF_HEADER);
>
> @@ -837,6 +847,10 @@ static int write_end_flat_header(DumpState *s)
>  {
>      MakedumpfileDataHeader mdh;
>
> +    if (s->kdump_reassembled) {
> +        return 0;
> +    }
> +
>      mdh.offset =3D END_FLAG_FLAT_HEADER;
>      mdh.buf_size =3D END_FLAG_FLAT_HEADER;
>
> @@ -853,13 +867,21 @@ static int write_buffer(DumpState *s, off_t offset,=
 const void *buf, size_t size
>  {
>      size_t written_size;
>      MakedumpfileDataHeader mdh;
> +    loff_t seek_loc;
>
> -    mdh.offset =3D cpu_to_be64(offset);
> -    mdh.buf_size =3D cpu_to_be64(size);
> +    if (s->kdump_reassembled) {
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
> @@ -1775,7 +1797,8 @@ static void vmcoreinfo_update_phys_base(DumpState *=
s)
>
>  static void dump_init(DumpState *s, int fd, bool has_format,
>                        DumpGuestMemoryFormat format, bool paging, bool ha=
s_filter,
> -                      int64_t begin, int64_t length, Error **errp)
> +                      int64_t begin, int64_t length, bool kdump_reassemb=
led,
> +                      Error **errp)
>  {
>      ERRP_GUARD();
>      VMCoreInfoState *vmci =3D vmcoreinfo_find();
> @@ -1786,6 +1809,7 @@ static void dump_init(DumpState *s, int fd, bool ha=
s_format,
>      s->has_format =3D has_format;
>      s->format =3D format;
>      s->written_size =3D 0;
> +    s->kdump_reassembled =3D kdump_reassembled;
>
>      /* kdump-compressed is conflict with paging and filter */
>      if (has_format && format !=3D DUMP_GUEST_MEMORY_FORMAT_ELF) {
> @@ -2168,7 +2192,7 @@ void qmp_dump_guest_memory(bool paging, const char =
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
> index e27af8fb34..71ec492fce 100644
> --- a/include/sysemu/dump.h
> +++ b/include/sysemu/dump.h
> @@ -157,6 +157,7 @@ typedef struct DumpState {
>      MemoryMappingList list;
>      bool resume;
>      bool detached;
> +    bool kdump_reassembled;
>      hwaddr memory_offset;
>      int fd;
>
> --
> 2.39.3
>


--
Marc-Andr=C3=A9 Lureau
