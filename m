Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 591CDCA0EC3
	for <linux-debuggers@archiver.kernel.org>; Tue, 12 Sep 2023 07:22:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231468AbjILHWj (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 12 Sep 2023 03:22:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjILHWj (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 12 Sep 2023 03:22:39 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 41B0710C3
        for <linux-debuggers@vger.kernel.org>; Tue, 12 Sep 2023 00:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694503313;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=7BvHu4veckrfz6KuzpbP7HjPDSNgySXMvrxCBE5h/HI=;
        b=HlDrt/2Iw5aqZy6KqnNMv12KgbEpip2n/D9nm8kiRRfODt7kTxR9avrVfnCyMTgNURSFs1
        RqXRwfdljbVcaX0I0E8xRk7pC3F9BSkc51KKJaHhZySL6XzNwfO50+GqS+Otl/xGb1yap5
        qW4tzRurdtu7EGFW6SxGRUKgwoLmQ9M=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-182-jRArr5RTPQOins9x3k35wQ-1; Tue, 12 Sep 2023 03:21:52 -0400
X-MC-Unique: jRArr5RTPQOins9x3k35wQ-1
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-31c470305cfso3519301f8f.3
        for <linux-debuggers@vger.kernel.org>; Tue, 12 Sep 2023 00:21:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503311; x=1695108111;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=7BvHu4veckrfz6KuzpbP7HjPDSNgySXMvrxCBE5h/HI=;
        b=iVRjVs6zfywVXd1QrYggF//kva7yF/L66PjGqFg33OJ9SjQ72rS0uaMGPjafsS3b2R
         xgcN2yhgspnBxeG7rCbEUP+0kybTdw/Bt0nB5H2asrmjiQkW+67s5DR5Vyp/s3hJH/Xy
         6Z6UhLDYOGuR8aA6rMimPOlVJ1KuOPJPch21D+WXazHb+TxPXDYs/Dvk8om78h2V9ir7
         ar0teCHfnmuQZqq5Xh17LfxLQsIGC7asBV3DYXmDAWgaUhlXKgsnHXpDB06acAu7diF+
         j/IJR9WFZqWcl+v1maa+clKNi18USpNb7+hdihTHiICLsTUl/o0qFiBwDc9y1sJ9OBzR
         uAbA==
X-Gm-Message-State: AOJu0YzZl6x57p7Qf1umCu1GYcW8trR/RZRqqrURYB2QHGlFJuca3Kb0
        gVbfVHLdWRAsoqofySrrcy2wXpyRQJGaRW1yKOIoVFKSx5nrKb+7zRjxH650wOeoYHprczyBCQc
        kp19YfHasBWzV/CHaM28n5c+77XRG
X-Received: by 2002:a5d:560d:0:b0:313:f1c8:a968 with SMTP id l13-20020a5d560d000000b00313f1c8a968mr9698788wrv.2.1694503310926;
        Tue, 12 Sep 2023 00:21:50 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IExPMGW5JeNv0plxANul4UmSCGkcVkAYBI6a0kzV65U4Gnwp0uyItKr5o8r5UsXS9UU/zZwIA==
X-Received: by 2002:a5d:560d:0:b0:313:f1c8:a968 with SMTP id l13-20020a5d560d000000b00313f1c8a968mr9698773wrv.2.1694503310569;
        Tue, 12 Sep 2023 00:21:50 -0700 (PDT)
Received: from [192.168.0.2] (ip-109-43-179-28.web.vodafone.de. [109.43.179.28])
        by smtp.gmail.com with ESMTPSA id x5-20020a5d54c5000000b0031773a8e5c4sm11985034wrv.37.2023.09.12.00.21.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 00:21:50 -0700 (PDT)
Message-ID: <b614f33c9fcc461f8099a11b97af4340ceb4cf1a.camel@redhat.com>
Subject: Re: [PATCH qemu 2/2] dump: Only use the makedumpfile flattened
 format when necessary
From:   Thomas Huth <thuth@redhat.com>
To:     =?ISO-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>,
        Stephen Brennan <stephen.s.brennan@oracle.com>,
        Alex =?ISO-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        "Daniel P. Berrange" <berrange@redhat.com>
Cc:     qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        joao.m.martins@oracle.com,
        Richard Henderson <richard.henderson@linaro.org>,
        Janosch Frank <frankja@linux.ibm.com>
Date:   Tue, 12 Sep 2023 09:21:49 +0200
In-Reply-To: <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
References: <20230717163855.7383-1-stephen.s.brennan@oracle.com>
         <20230717163855.7383-3-stephen.s.brennan@oracle.com>
         <CAJ+F1C+VFpU=xpqOPjJU1VLt4kofVqV8EN4pj5MjkkwWvVuxZw@mail.gmail.com>
         <87edl4d9wi.fsf@oracle.com> <87fs4aha4t.fsf@oracle.com>
         <CAJ+F1CKCdy3J8AD9EGvVO+CU6-yFPrLZ2Lum1SDgdj_kghFdQw@mail.gmail.com>
         <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Tue, 2023-09-12 at 10:34 +0400, Marc-Andr=C3=A9 Lureau wrote:
> Hi
>=20
> On Wed, Aug 23, 2023 at 2:03=E2=80=AFPM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
> >=20
> > Hi
> >=20
> > On Wed, Aug 23, 2023 at 4:31=E2=80=AFAM Stephen Brennan
> > <stephen.s.brennan@oracle.com> wrote:
> > >=20
> > > Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> > > > Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
> > > > > I am a bit reluctant to change the dump format by default.
> > > > > But since the
> > > > > flatten format is more "complicated" than the "normal"
> > > > > format, perhaps we
> > > > > can assume all users will handle it.
> > > > >=20
> > > > > The change is probably late for 8.1 though..
> > > >=20
> > > > Thank you for your review and testing!
> > > >=20
> > > > I totally understand the concern about making the change by
> > > > default. I
> > > > do believe that nobody should notice too much because the
> > > > normal format
> > > > should be easier to work with, and more broadly compatible. I
> > > > don't know
> > > > of any tool which deals with the flattened format that can't
> > > > handle the
> > > > normal format, except for "makedumpfile -R" itself.
> > > >=20
> > > > If it's a blocker, I can go ahead and add a new flag to the
> > > > command to
> > > > enable the behavior. However there are a few good
> > > > justifications not to
> > > > add a new flag. I think it's going to be difficult to explain
> > > > the
> > > > difference between the two formats in documentation, as the
> > > > implementation of the formats is a bit "into the weeds". The
> > > > libvirt API
> > > > also specifies each format separately (kdump-zlib, kdump-lzo,
> > > > kdump-snappy) and so adding several new options there would be
> > > > unfortunate for end-users as well.
> > > >=20
> > > > At the end of the day, it's your judgment call, and I'll
> > > > implement it
> > > > how you prefer.
> > >=20
> > > I just wanted to check back on this to clarify the next step. Are
> > > you
> > > satisfied with this and waiting to apply it until the right time?
> > > Or
> > > would you prefer me to send a new version making this opt-in?
> > >=20
> >=20
> > Nobody seems to raise concerns. If it would be just me, I would
> > change
> > it. But we should rather be safe, so let's make it this opt-in
> > please.
> >=20
> >=20
>=20
> Alex, Daniel, Thomas .. Do you have an opinion on changing the dump
> format?

I just double-checked with Janosch Frank, and from s390x perspective
we're mostly interested in the ELF dump format, so from the s390x side
of view: =C2=AF\_(=E3=83=84)_/=C2=AF

 Thomas

