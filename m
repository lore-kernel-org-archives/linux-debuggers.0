Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23438CA0ECA
	for <linux-debuggers@archiver.kernel.org>; Tue, 12 Sep 2023 06:34:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230008AbjILGe1 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 12 Sep 2023 02:34:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230056AbjILGeU (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 12 Sep 2023 02:34:20 -0400
Received: from mail-qk1-x736.google.com (mail-qk1-x736.google.com [IPv6:2607:f8b0:4864:20::736])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 862ACE7B
        for <linux-debuggers@vger.kernel.org>; Mon, 11 Sep 2023 23:34:16 -0700 (PDT)
Received: by mail-qk1-x736.google.com with SMTP id af79cd13be357-770ef96aa01so207407085a.2
        for <linux-debuggers@vger.kernel.org>; Mon, 11 Sep 2023 23:34:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1694500455; x=1695105255; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=onWGGLkxM/AvYKworx+I2K8oIhrZGL/ZKUj+lLyqhF8=;
        b=LtZGVIKTl6QXktS0jbqxmGDpEdlKqafZHKNOHUwSVd92C9UX8/S6qj0gTrK3EzTi7D
         +ZHJxP3M5TjNWslTkWvlAZJd6D3JmKeAKXl5NT/xb1ZSpK438mcuqFf9g2+PTOtRKJsr
         zKnyLZUDdCqCIbkPVahwdIAyxYrdriAHclYbWSCzIhAllnH6zO/GDgScgF7iB6AHyt27
         /HEHNtdXNVD4kGcJ/dwRvtneExcRD0mPtt/TTtjqrqWMBZmtlz5bKhm2O3Ai3n1GDPIl
         jMTgS5oek4Rj80rzssncpmvFpg9ES+lgGZCP7F1h5UF9Bnpx6H+xygLA/ectKvOTUaAg
         uF7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694500455; x=1695105255;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onWGGLkxM/AvYKworx+I2K8oIhrZGL/ZKUj+lLyqhF8=;
        b=NGPHtcKfrXXLXwtWTfzOIDfcVWs+yY2vuv8ZzLFArLyp2sMuQUev+GOAUZhT3BFuE/
         Wa/inLlEomSgPxdM9aH81oLBIG908LDkGG22FT2VcuVC9DnE0y0rsldhrqZNl6xU4ihm
         /KX5h77x2g5p4T+14ppV02EOww/DZuaa4CsmjmGRA1W8LZh7vr63uY7RrvMYNvBGNgKA
         4W6HgCHb4McOalvm8o4uxpM4+vEyx0GsR11aIfoYNVEcX2LvseztMmkVjT4RdzIER7iv
         P2wmFL7Ug3pZiyBvFzrgTxVocSn+7SQOTkyIez4KhrVM2ip+gg6RXatpYxl/yCfzfgQ1
         +m8w==
X-Gm-Message-State: AOJu0YyHTBloZa2FpLrZiAhoLc+CYzfjwNBDozEJIC8B0c71w5HMfYV/
        IC+aQCM7giBfsrCSTKYsTRrNnulydkscOSlZ+xE=
X-Google-Smtp-Source: AGHT+IEwG7IMnlk+3dd3kF4c0WLSVq9R1hVLF/BsLH2QXtlnPrKs6PeB8dKvU882EYmGQINwqq0JjDdZ6Rkmw0N7RNM=
X-Received: by 2002:a05:620a:e92:b0:766:4a28:69ed with SMTP id
 w18-20020a05620a0e9200b007664a2869edmr11779876qkm.13.1694500455619; Mon, 11
 Sep 2023 23:34:15 -0700 (PDT)
MIME-Version: 1.0
References: <20230717163855.7383-1-stephen.s.brennan@oracle.com>
 <20230717163855.7383-3-stephen.s.brennan@oracle.com> <CAJ+F1C+VFpU=xpqOPjJU1VLt4kofVqV8EN4pj5MjkkwWvVuxZw@mail.gmail.com>
 <87edl4d9wi.fsf@oracle.com> <87fs4aha4t.fsf@oracle.com> <CAJ+F1CKCdy3J8AD9EGvVO+CU6-yFPrLZ2Lum1SDgdj_kghFdQw@mail.gmail.com>
In-Reply-To: <CAJ+F1CKCdy3J8AD9EGvVO+CU6-yFPrLZ2Lum1SDgdj_kghFdQw@mail.gmail.com>
From:   =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date:   Tue, 12 Sep 2023 10:34:04 +0400
Message-ID: <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
Subject: Re: [PATCH qemu 2/2] dump: Only use the makedumpfile flattened format
 when necessary
To:     Stephen Brennan <stephen.s.brennan@oracle.com>,
        =?UTF-8?B?QWxleCBCZW5uw6ll?= <alex.bennee@linaro.org>,
        "Daniel P. Berrange" <berrange@redhat.com>
Cc:     qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        joao.m.martins@oracle.com,
        Richard Henderson <richard.henderson@linaro.org>,
        Thomas Huth <thuth@redhat.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi

On Wed, Aug 23, 2023 at 2:03=E2=80=AFPM Marc-Andr=C3=A9 Lureau
<marcandre.lureau@gmail.com> wrote:
>
> Hi
>
> On Wed, Aug 23, 2023 at 4:31=E2=80=AFAM Stephen Brennan
> <stephen.s.brennan@oracle.com> wrote:
> >
> > Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> > > Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
> > >> I am a bit reluctant to change the dump format by default. But since=
 the
> > >> flatten format is more "complicated" than the "normal" format, perha=
ps we
> > >> can assume all users will handle it.
> > >>
> > >> The change is probably late for 8.1 though..
> > >
> > > Thank you for your review and testing!
> > >
> > > I totally understand the concern about making the change by default. =
I
> > > do believe that nobody should notice too much because the normal form=
at
> > > should be easier to work with, and more broadly compatible. I don't k=
now
> > > of any tool which deals with the flattened format that can't handle t=
he
> > > normal format, except for "makedumpfile -R" itself.
> > >
> > > If it's a blocker, I can go ahead and add a new flag to the command t=
o
> > > enable the behavior. However there are a few good justifications not =
to
> > > add a new flag. I think it's going to be difficult to explain the
> > > difference between the two formats in documentation, as the
> > > implementation of the formats is a bit "into the weeds". The libvirt =
API
> > > also specifies each format separately (kdump-zlib, kdump-lzo,
> > > kdump-snappy) and so adding several new options there would be
> > > unfortunate for end-users as well.
> > >
> > > At the end of the day, it's your judgment call, and I'll implement it
> > > how you prefer.
> >
> > I just wanted to check back on this to clarify the next step. Are you
> > satisfied with this and waiting to apply it until the right time? Or
> > would you prefer me to send a new version making this opt-in?
> >
>
> Nobody seems to raise concerns. If it would be just me, I would change
> it. But we should rather be safe, so let's make it this opt-in please.
>
>

Alex, Daniel, Thomas .. Do you have an opinion on changing the dump format?

Stephen, do you have a new version of the patches to make it opt-in?

thanks



--=20
Marc-Andr=C3=A9 Lureau
