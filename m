Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D82ACC25B48
	for <linux-debuggers@archiver.kernel.org>; Thu, 26 Oct 2023 08:16:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344474AbjJZIQy (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Thu, 26 Oct 2023 04:16:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51832 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344490AbjJZIQw (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Thu, 26 Oct 2023 04:16:52 -0400
Received: from mail-qt1-x833.google.com (mail-qt1-x833.google.com [IPv6:2607:f8b0:4864:20::833])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E900E128
        for <linux-debuggers@vger.kernel.org>; Thu, 26 Oct 2023 01:16:49 -0700 (PDT)
Received: by mail-qt1-x833.google.com with SMTP id d75a77b69052e-41cd444d9d0so4755951cf.2
        for <linux-debuggers@vger.kernel.org>; Thu, 26 Oct 2023 01:16:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1698308209; x=1698913009; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=62GnCP7RusF+66R1wetiy35tQ1sfJf18J6qkicsRZ1E=;
        b=ZEnNLMtK01H7P4vvQRyxqGRP/fo5ItCo/0n+dtqGsLKNMZ8KuheQ/4ic4J6UbuWhIf
         kQGto/CIDbIOVjY8olnl9mBMhiVLmbovtXWFldFmhqg8OB3XNPDAQkihm3U3Grr1WJzK
         y89dlFUseVl+dxpFAHfL2wb9oasyFZ4BEEeNKaNSI819TY1+G5vuRb808WmOFRPtywAR
         WxpgbS+Pkg0S1brLnhBbiFnc4l/+IjBCjtT2hK2KA7dq5QvbdEX+3BZYE744FGaql53u
         l80qFW9hJwF2AqPZsJNIN4f2AKnQaRzqvvdNOrvazo76UDstT3kJUo7LNuCmpspsRb1Q
         ktJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698308209; x=1698913009;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=62GnCP7RusF+66R1wetiy35tQ1sfJf18J6qkicsRZ1E=;
        b=ax4csBeFExprZH9aqDeT4xjL6EmJLz1A2XK3jCFjWAV+lpq0Cc7wwYpa65xqw5FtHq
         m+LtDVKnxgfUMndAivnA7IXcYEbLEFhjG+u4VpCzfp4C8rh5yYbb/EqvQfEg+jlI+hCg
         7wCbKEDuT1GlU7ftXTgYPNJmuS0FCdItD18psDkn6+mP2eOf2/+YCeJ57UplSHLALsK1
         XHaPUtYIy3sPgL+yasd/vqZPKOodaFd9OC8O+0H604/8rx5qrkvwtvfDVnQktMhfwiFM
         ODnJ4xkTl5DlRpaBY7nJVkWnRt0WgEsXSkAhmt+3XLWnH1J40gX88V7zvMSQYZmGn6ng
         TfzQ==
X-Gm-Message-State: AOJu0Yxazt0Np6dz5RuKKJ8/6EV+cHeMDFG0RC+wE8S+lOfPzJWK+Ks2
        eTu+cAjBztDYci9ApvK+BLTejcWnwiVsnaqms8k=
X-Google-Smtp-Source: AGHT+IFpAlKwVzcohZ3LhJF0lipzB0RyWTw32/ffRCY4ieieroE8J/dnzZzSvHEwkio3rKz0XTkZ/DweRaOeng2dQDM=
X-Received: by 2002:a05:622a:100f:b0:417:b545:e962 with SMTP id
 d15-20020a05622a100f00b00417b545e962mr17687235qte.7.1698308208908; Thu, 26
 Oct 2023 01:16:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230918233233.1431858-1-stephen.s.brennan@oracle.com>
 <CAJ+F1CLLgb=mYxf69gb+DpNQHrdOFY24Ax0eYfkVS4NxQ=NEgg@mail.gmail.com> <87h6mez5i1.fsf@oracle.com>
In-Reply-To: <87h6mez5i1.fsf@oracle.com>
From:   =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@gmail.com>
Date:   Thu, 26 Oct 2023 12:16:36 +0400
Message-ID: <CAJ+F1CJuYex4vdprouSnMgUD86UZeQ7ds5zcEF9Y+OYCRNM7sA@mail.gmail.com>
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

On Thu, Oct 26, 2023 at 2:44=E2=80=AFAM Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
> Hello,
>
> Will this be queued for version 8.2? I see here[1] that the feature
> freeze is November 7. I'm not really familiar with QEMU development so I
> didn't know if there was a "linux-next" equivalent I could check.
>
> [1]: https://wiki.qemu.org/Planning/8.2

I'll prepare a PR.

thanks

--=20
Marc-Andr=C3=A9 Lureau
