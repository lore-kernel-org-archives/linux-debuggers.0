Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E99AFCD549C
	for <linux-debuggers@archiver.kernel.org>; Tue, 19 Sep 2023 07:54:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231282AbjISHyI (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 19 Sep 2023 03:54:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39662 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229771AbjISHyH (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 19 Sep 2023 03:54:07 -0400
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E2511100
        for <linux-debuggers@vger.kernel.org>; Tue, 19 Sep 2023 00:54:01 -0700 (PDT)
Received: by mail-qt1-x829.google.com with SMTP id d75a77b69052e-41512bfdcfbso36321611cf.3
        for <linux-debuggers@vger.kernel.org>; Tue, 19 Sep 2023 00:54:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695110041; x=1695714841; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UQXgsU4RZ5I1NRE5t7sRu1JVh0G05gyB1Ad+fK3odLA=;
        b=Ejin6kPbm176jpDQPHELBemCs3KVqto4kIZUIt2og8dGbl4wrxR1qeK8uaFHS3iBjI
         dyGdCA++NRSzEhHGu9WpxYDTR1J2XAtxCufMrpTlIhvscxQzG7VEGFPBfETO5vtrGYQG
         49nddYHQI7ZgL2fyYdz167ukX4X8MKyppdkeCfo0leNYikZkGjNuThRzLH0XMy4EP2I3
         z5DQLRtBBKxoFMXYen6o+4227dwcREcG5dtBAMVKTN1ANa6LVi2Tg0FQ4FB3JIOcfVDA
         QxxBSSpbRKt4VZoH78QO7ij6Vugh45oSrzEWFtPsgKEPlsQTSHxfb3VTGyqA6WAxZq2D
         Hh4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695110041; x=1695714841;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UQXgsU4RZ5I1NRE5t7sRu1JVh0G05gyB1Ad+fK3odLA=;
        b=Qz0YDyhf1iGBJM7ivWKmRbkZBIPlhy/+jGIbii248ZF2AkymJbsglwnGCn1tvqQ5Wg
         +0ngMD/CFF6YRmVKPPQ0rsNwoTsHYKs2+9LtINasc216yVFacWYI8jqk8WlV/497RO4H
         +5iz3moMAMUpP1y6hYgDYwladGFc+2qLfK6vGQU8IVnKFpvaxtWvFc6/uu+hjr2keC+X
         HJyub0Hvkk3QQ116J+FEqVKs5MYXL+LJK5XoyUs9NoSVMSvkOVpY5nB1r1UxS061gwfx
         rwPHpwEaQ/3C+HSQ7hfHYTAqVJkcWVXWQ1KnpHj9/G2E8EOl3rNK/lh8HjvSio8xZ0C9
         XHCg==
X-Gm-Message-State: AOJu0YyoVtd4sUSLS+fQnZs3n6oLJSIOqqvO2RNp82ie9YZefXZSNvZj
        0LDBe3217k0PgyGhHSdS7PgQVYTtw4374WDxHJg=
X-Google-Smtp-Source: AGHT+IHklbOAD1AVVEnNry7IGaqM4zFleJ07wtPLX/VPsVMSoptSSqBifjm52FrTpnLbsyRZTWRZv1MvggCClyY0mls=
X-Received: by 2002:a05:622a:4a16:b0:412:2284:cb33 with SMTP id
 fv22-20020a05622a4a1600b004122284cb33mr13432757qtb.48.1695110040960; Tue, 19
 Sep 2023 00:54:00 -0700 (PDT)
MIME-Version: 1.0
References: <20230918233233.1431858-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20230918233233.1431858-1-stephen.s.brennan@oracle.com>
From:   =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date:   Tue, 19 Sep 2023 11:53:49 +0400
Message-ID: <CAJ+F1CLLgb=mYxf69gb+DpNQHrdOFY24Ax0eYfkVS4NxQ=NEgg@mail.gmail.com>
Subject: Re: [PATCH v3 qemu 0/3] Allow dump-guest-memory to output standard
 kdump format
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

On Tue, Sep 19, 2023 at 3:32=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> Hello all,
>
> This is the third version of the kdump patch series, the first and
> second revisions being visible at [1] and [2] respectively. You can see
> the history and motivation for the patch series described in the cover
> letter of [2].
>
> Thank you for your continued feedback and review.
> Stephen
>
> Changes from v2 to v3:
> - Rather than use "reassembled" flag in QMP API, represent each kdump
>   format "kdump-X" with a new enumerator "kdump-raw-X". (The HMP
>   interface retains the -R option)
> - Return an error if the file descriptor passed in is not seekable, yet
>   the requested dump format is kdump-raw-*
>
> Changes from v1 to v2:
> - Keep the default as the flattened format
> - Add QMP / HMP arguments for "reassembled"
>
> [1]: https://lore.kernel.org/qemu-devel/20230717163855.7383-1-stephen.s.b=
rennan@oracle.com/
> [2]: https://lore.kernel.org/qemu-devel/20230914010315.945705-1-stephen.s=
.brennan@oracle.com/
>
> Stephen Brennan (3):
>   dump: Pass DumpState to write_ functions
>   dump: Allow directly outputting raw kdump format
>   dump: Add command interface for kdump-raw formats
>
>  dump/dump-hmp-cmds.c  | 21 +++++++--
>  dump/dump.c           | 99 +++++++++++++++++++++++++++++++------------
>  hmp-commands.hx       |  9 +++-
>  include/sysemu/dump.h |  3 +-
>  qapi/dump.json        | 24 +++++++++--
>  5 files changed, 119 insertions(+), 37 deletions(-)
>
> --
> 2.39.3
>

For the series:
Reviewed-by: Marc-Andr=C3=A9 Lureau <marcandre.lureau@redhat.com>

--=20
Marc-Andr=C3=A9 Lureau
