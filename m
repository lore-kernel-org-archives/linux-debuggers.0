Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EA1BBEE49B0
	for <linux-debuggers@archiver.kernel.org>; Wed, 23 Aug 2023 10:03:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233551AbjHWKDr (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 23 Aug 2023 06:03:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52288 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233593AbjHWKDe (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 23 Aug 2023 06:03:34 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C4070CEF
        for <linux-debuggers@vger.kernel.org>; Wed, 23 Aug 2023 03:03:27 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id d75a77b69052e-40feecefa84so30167951cf.1
        for <linux-debuggers@vger.kernel.org>; Wed, 23 Aug 2023 03:03:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692785007; x=1693389807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iutk+1bfukUXy3bF772sqNmgSjd3Lsyp4QlTkRqxTE4=;
        b=KmAbtopwcVVtLryLiLflyh0MmoU8gVfeuZFqepY7uwCvgW7XOUxCCm4UFys3NUajly
         lDe2xLtZB1xhBfcM6nqQVrZzSBb9kALPypThag0zrVUoLyrwNVc/iW5Y3yQ2dE7A9Aig
         5kcr6xTfQiloFR9scUl+Gu8SyOIr2HU+2Iyf4qhQ9QYJCd/4tLUfN21V4/nfsPe8ja79
         Y+aVjbblH95apmndrqZEytqC30dqokdl6a0dQV8tZxgcIe2DR2DigMlD+IZ0Ry3ZOVZP
         h3YQq6BaEiObiK/jTPG8opBSb6GlKX19kENcn+1at4nR+ua8PKhJ//gDHpaz2CWhEa6J
         PaMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692785007; x=1693389807;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iutk+1bfukUXy3bF772sqNmgSjd3Lsyp4QlTkRqxTE4=;
        b=CtYEkVKeES1sVGCqqa4OlHdbx0B8pT1MMB0msiK8H+tsXBbTuRqt/9YNRTuX/QqcGr
         NEH1561ydlyHqzhXlYG3f5SNpJgnSvUUSQ1njn8Umor89hZ8DbrbMeJQygBdbPfTs0bO
         XgndiBn3ZgQbWlxy5jjh7u+xtsnxsduJ0aE3H8g/2Eh5qAUiVJ52AMzSxyFt5QjevYUd
         hmEABvhRZaRO23YrzWE9ZDRkoHwZ0cWonH/b/M/U4Fiw94Lu0txWFcEP+PVFwPAruw8l
         Zv8hcL3UI4M58/S/P/EZsaR2rTSQn3Q8FhGWphQV0eo0Dcf/6dYFIhrhVxxIewRtkynM
         SkKA==
X-Gm-Message-State: AOJu0Yw64c3qOVDd9kpVlOkIMXdTf53PCdcq03fiJ/r9faP0+hBFoIUn
        +YHnfYBt+7O2aLydBMCg62FYQnqVtDrizcdA2Bc=
X-Google-Smtp-Source: AGHT+IG1h9rZ9dHmLFlMQ5hWtrR1QINBHGRG/Nk1f5QUXdeaOqC9UZrEzwQ9ngJ3TvZmM0Jw8laxklVimlmrkUDTDZA=
X-Received: by 2002:a05:622a:19a2:b0:411:d31b:9864 with SMTP id
 u34-20020a05622a19a200b00411d31b9864mr836433qtc.4.1692785006852; Wed, 23 Aug
 2023 03:03:26 -0700 (PDT)
MIME-Version: 1.0
References: <20230717163855.7383-1-stephen.s.brennan@oracle.com>
 <20230717163855.7383-3-stephen.s.brennan@oracle.com> <CAJ+F1C+VFpU=xpqOPjJU1VLt4kofVqV8EN4pj5MjkkwWvVuxZw@mail.gmail.com>
 <87edl4d9wi.fsf@oracle.com> <87fs4aha4t.fsf@oracle.com>
In-Reply-To: <87fs4aha4t.fsf@oracle.com>
From:   =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date:   Wed, 23 Aug 2023 14:03:15 +0400
Message-ID: <CAJ+F1CKCdy3J8AD9EGvVO+CU6-yFPrLZ2Lum1SDgdj_kghFdQw@mail.gmail.com>
Subject: Re: [PATCH qemu 2/2] dump: Only use the makedumpfile flattened format
 when necessary
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
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

On Wed, Aug 23, 2023 at 4:31=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> > Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
> >> I am a bit reluctant to change the dump format by default. But since t=
he
> >> flatten format is more "complicated" than the "normal" format, perhaps=
 we
> >> can assume all users will handle it.
> >>
> >> The change is probably late for 8.1 though..
> >
> > Thank you for your review and testing!
> >
> > I totally understand the concern about making the change by default. I
> > do believe that nobody should notice too much because the normal format
> > should be easier to work with, and more broadly compatible. I don't kno=
w
> > of any tool which deals with the flattened format that can't handle the
> > normal format, except for "makedumpfile -R" itself.
> >
> > If it's a blocker, I can go ahead and add a new flag to the command to
> > enable the behavior. However there are a few good justifications not to
> > add a new flag. I think it's going to be difficult to explain the
> > difference between the two formats in documentation, as the
> > implementation of the formats is a bit "into the weeds". The libvirt AP=
I
> > also specifies each format separately (kdump-zlib, kdump-lzo,
> > kdump-snappy) and so adding several new options there would be
> > unfortunate for end-users as well.
> >
> > At the end of the day, it's your judgment call, and I'll implement it
> > how you prefer.
>
> I just wanted to check back on this to clarify the next step. Are you
> satisfied with this and waiting to apply it until the right time? Or
> would you prefer me to send a new version making this opt-in?
>

Nobody seems to raise concerns. If it would be just me, I would change
it. But we should rather be safe, so let's make it this opt-in please.



--=20
Marc-Andr=C3=A9 Lureau
