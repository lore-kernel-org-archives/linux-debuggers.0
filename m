Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4DBECD37B0
	for <linux-debuggers@archiver.kernel.org>; Mon, 18 Sep 2023 11:17:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233284AbjIRLRG (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 18 Sep 2023 07:17:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48782 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240032AbjIRLQf (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 18 Sep 2023 07:16:35 -0400
Received: from mail-qt1-x82b.google.com (mail-qt1-x82b.google.com [IPv6:2607:f8b0:4864:20::82b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 282EC101
        for <linux-debuggers@vger.kernel.org>; Mon, 18 Sep 2023 04:16:08 -0700 (PDT)
Received: by mail-qt1-x82b.google.com with SMTP id d75a77b69052e-4135f3d1213so25780521cf.1
        for <linux-debuggers@vger.kernel.org>; Mon, 18 Sep 2023 04:16:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695035767; x=1695640567; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MUlZ0YcSMol8OYE5fUSjDOxC0F0uI+1cUnDhDBAua1U=;
        b=hlDwbORfnCLovdW84n5OuTWMPBTJcoGpZwLzUe3gkC1xV+Q+ATSh7j5BpmV7QmAzr/
         Lxafohbar2MpoIFfTIsYAMgDOpYSq3tbl6d9ERzn2tBeTIUug1Sketzxp9tpukLagwSV
         d/ddVdtYn0f4cs+FbMdYZYHs++M8cOXrx5nxOsAeSTim2CyAM1vGU1As47j/Nk1vDczj
         6xjZaWtryITZ9pR/j2+bTu8tsTWdLBzPMYUqSGIHepMwdRtUWpQhFVSeTfNfbocu73t0
         AJfrRJNnPeUDqmGB+5i5dHwZvD5D9fA6oH0JTlWLAK8b0yHe/bAYqpkFkCk3iHTumoV0
         l1Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695035767; x=1695640567;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MUlZ0YcSMol8OYE5fUSjDOxC0F0uI+1cUnDhDBAua1U=;
        b=c0McHc/I+qnbVaTKkKwzDBC3EajOQ0d+AJlxeKUrXt0X8JGjNagZ/DKvI18CsRMgVA
         kRATjUfS5mcFqTW8Gutv1XElZPfGw04Ko2Kba5HXvtD0B8Npzbfnn8Lf/VPQ690wGvPr
         8xaKw3K0CpsLqnqO5ujBTClpEY+98luGhRtPkCfGvD+ze2SDoxu5Va9bh1GBYFV3n+hz
         HlDSsbqM9x931GA1WtAJ9vaICSl5uu1tgRSnNufAFn5vng1IG2EzFKAIYttbfrX3EoY2
         yCadbNH/JX3yzXPvAS/nK5MP7M+sVUw4e38ga+FHEdjrmGmLiTL+VADfty11iDKDpJW1
         cMWw==
X-Gm-Message-State: AOJu0YzuBZqrKE0Ee2YAkkGBEsv8fpCn1qDwmb6F+oAa8X0WT9c6Im3j
        DDus51VqrlbIvCxL+U8zlErA4zurah3qQV2K2Zw=
X-Google-Smtp-Source: AGHT+IEM9u0REq9MN60ViPYHi3AIusEPjm3JRFnrvrdTjzE9/rfN1Zi27GpFI0jNLJV2BM1Q50uGOBx8xYh7cQvkGuA=
X-Received: by 2002:a05:622a:1a25:b0:403:b2fc:1e69 with SMTP id
 f37-20020a05622a1a2500b00403b2fc1e69mr10023143qtb.12.1695035767155; Mon, 18
 Sep 2023 04:16:07 -0700 (PDT)
MIME-Version: 1.0
References: <20230914010315.945705-1-stephen.s.brennan@oracle.com> <20230914010315.945705-4-stephen.s.brennan@oracle.com>
In-Reply-To: <20230914010315.945705-4-stephen.s.brennan@oracle.com>
From:   =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date:   Mon, 18 Sep 2023 15:15:55 +0400
Message-ID: <CAJ+F1CJmBg_v3982=TdKTRQF2m88Cf-2Jfj1JcCrtR3OdWqKVg@mail.gmail.com>
Subject: Re: [PATCH v2 qemu 3/3] dump: Add qmp argument "reassembled"
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

On Thu, Sep 14, 2023 at 5:03=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> This can be used from QMP command line as "-R" to mirror the
> corresponding flag for makedumpfile. This enables the kdump_reassembled
> flag introduced in the previous patch.
>
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  dump/dump-hmp-cmds.c |  8 +++++++-
>  dump/dump.c          | 12 +++++++++++-
>  hmp-commands.hx      |  7 +++++--
>  qapi/dump.json       | 14 +++++++++++++-
>  4 files changed, 36 insertions(+), 5 deletions(-)
>
> diff --git a/dump/dump-hmp-cmds.c b/dump/dump-hmp-cmds.c
> index b038785fee..1d882e4bd8 100644
> --- a/dump/dump-hmp-cmds.c
> +++ b/dump/dump-hmp-cmds.c
> @@ -24,9 +24,11 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict *=
qdict)
>      bool has_begin =3D qdict_haskey(qdict, "begin");
>      bool has_length =3D qdict_haskey(qdict, "length");
>      bool has_detach =3D qdict_haskey(qdict, "detach");
> +    bool has_reassembled =3D qdict_haskey(qdict, "reassembled");
>      int64_t begin =3D 0;
>      int64_t length =3D 0;
>      bool detach =3D false;
> +    bool reassembled =3D false;
>      enum DumpGuestMemoryFormat dump_format =3D DUMP_GUEST_MEMORY_FORMAT_=
ELF;
>      char *prot;
>
> @@ -61,11 +63,15 @@ void hmp_dump_guest_memory(Monitor *mon, const QDict =
*qdict)
>      if (has_detach) {
>          detach =3D qdict_get_bool(qdict, "detach");
>      }
> +    if (has_reassembled) {
> +        reassembled =3D qdict_get_bool(qdict, "reassembled");
> +    }
>
>      prot =3D g_strconcat("file:", file, NULL);
>
>      qmp_dump_guest_memory(paging, prot, true, detach, has_begin, begin,
> -                          has_length, length, true, dump_format, &err);
> +                          has_length, length, true, has_reassembled,
> +                          reassembled, dump_format, &err);
>      hmp_handle_error(mon, err);
>      g_free(prot);
>  }
> diff --git a/dump/dump.c b/dump/dump.c
> index fb9040cfbc..42d4015fb3 100644
> --- a/dump/dump.c
> +++ b/dump/dump.c
> @@ -2089,6 +2089,7 @@ void qmp_dump_guest_memory(bool paging, const char =
*file,
>                             bool has_detach, bool detach,
>                             bool has_begin, int64_t begin, bool has_lengt=
h,
>                             int64_t length, bool has_format,
> +                           bool has_reassembled, bool reassembled,
>                             DumpGuestMemoryFormat format, Error **errp)
>  {
>      ERRP_GUARD();
> @@ -2119,6 +2120,12 @@ void qmp_dump_guest_memory(bool paging, const char=
 *file,
>                           "filter");
>          return;
>      }
> +    if (has_reassembled && format !=3D DUMP_GUEST_MEMORY_FORMAT_KDUMP_ZL=
IB
> +                        && format !=3D DUMP_GUEST_MEMORY_FORMAT_KDUMP_LZ=
O
> +                        && format !=3D DUMP_GUEST_MEMORY_FORMAT_KDUMP_SN=
APPY) {
> +        error_setg(errp, "'reassembled' only applies to kdump format");
> +        return;
> +    }
>      if (has_begin && !has_length) {
>          error_setg(errp, QERR_MISSING_PARAMETER, "length");
>          return;
> @@ -2130,6 +2137,9 @@ void qmp_dump_guest_memory(bool paging, const char =
*file,
>      if (has_detach) {
>          detach_p =3D detach;
>      }
> +    if (!has_reassembled) {
> +        reassembled =3D false;
> +    }
>
>      /* check whether lzo/snappy is supported */
>  #ifndef CONFIG_LZO
> @@ -2192,7 +2202,7 @@ void qmp_dump_guest_memory(bool paging, const char =
*file,
>      dump_state_prepare(s);
>
>      dump_init(s, fd, has_format, format, paging, has_begin,
> -              begin, length, false, errp);
> +              begin, length, reassembled, errp);
>      if (*errp) {
>          qatomic_set(&s->status, DUMP_STATUS_FAILED);
>          return;
> diff --git a/hmp-commands.hx b/hmp-commands.hx
> index 2cbd0f77a0..c3062da470 100644
> --- a/hmp-commands.hx
> +++ b/hmp-commands.hx
> @@ -1085,14 +1085,15 @@ ERST
>
>      {
>          .name       =3D "dump-guest-memory",
> -        .args_type  =3D "paging:-p,detach:-d,windmp:-w,zlib:-z,lzo:-l,sn=
appy:-s,filename:F,begin:l?,length:l?",
> -        .params     =3D "[-p] [-d] [-z|-l|-s|-w] filename [begin length]=
",
> +        .args_type  =3D "paging:-p,detach:-d,windmp:-w,zlib:-z,lzo:-l,sn=
appy:-s,reassembled:-R,filename:F,begin:l?,length:l?",
> +        .params     =3D "[-p] [-d] [-z|-l|-s|-w] [-R] filename [begin le=
ngth]",
>          .help       =3D "dump guest memory into file 'filename'.\n\t\t\t=
"
>                        "-p: do paging to get guest's memory mapping.\n\t\=
t\t"
>                        "-d: return immediately (do not wait for completio=
n).\n\t\t\t"
>                        "-z: dump in kdump-compressed format, with zlib co=
mpression.\n\t\t\t"
>                        "-l: dump in kdump-compressed format, with lzo com=
pression.\n\t\t\t"
>                        "-s: dump in kdump-compressed format, with snappy =
compression.\n\t\t\t"
> +                      "-R: when using kdump (-z, -l, -s), try to avoid t=
he flattened format.\n\t\t\t"
>                        "-w: dump in Windows crashdump format (can be used=
 instead of ELF-dump converting),\n\t\t\t"
>                        "    for Windows x86 and x64 guests with vmcoreinf=
o driver only.\n\t\t\t"
>                        "begin: the starting physical address.\n\t\t\t"
> @@ -1115,6 +1116,8 @@ SRST
>      dump in kdump-compressed format, with lzo compression.
>    ``-s``
>      dump in kdump-compressed format, with snappy compression.
> +  ``-R``
> +    when using kdump (-z, -l, -s), try to avoid the flattened format.
>    ``-w``
>      dump in Windows crashdump format (can be used instead of ELF-dump co=
nverting),
>      for Windows x64 guests with vmcoreinfo driver only
> diff --git a/qapi/dump.json b/qapi/dump.json
> index 4ae1f722a9..9cc7c3ea93 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -69,6 +69,18 @@
>  #     to dump all guest's memory, please specify the start @begin and
>  #     @length
>  #
> +# @reassembled: if false (the default), the kdump output formats will us=
e the
> +#     "makedumpfile flattened" variant of the format, which is less broa=
dly
> +#     compatible with analysis tools. The flattened dump can be reassemb=
led
> +#     after the fact using the command "makedumpfile -R". If true, Qemu

QEMU

> +#     attempts to generate the standard kdump format. This requires a
> +#     seekable file as output -- if the output file is not seekable, the=
n
> +#     the flattened format is still generated. The standard format is mo=
re

Will have to be adjusted to return an error if we drop the fallback behavio=
ur.

> +#     broadly compatible with debugging tools, but generating it require=
s a
> +#     seekable output file descriptor, and could use more system memory =
due
> +#     to page cache utilization. This should be left unspecified for non=
-kdump
> +#     output formats.
> +#
>  # @format: if specified, the format of guest memory dump.  But non-elf
>  #     format is conflict with paging and filter, ie.  @paging, @begin
>  #     and @length is not allowed to be specified with non-elf @format
> @@ -89,7 +101,7 @@
>  { 'command': 'dump-guest-memory',
>    'data': { 'paging': 'bool', 'protocol': 'str', '*detach': 'bool',
>              '*begin': 'int', '*length': 'int',
> -            '*format': 'DumpGuestMemoryFormat'} }
> +            '*reassembled': 'bool', '*format': 'DumpGuestMemoryFormat'} =
}
>
>  ##
>  # @DumpStatus:
> --
> 2.39.3
>


--=20
Marc-Andr=C3=A9 Lureau
