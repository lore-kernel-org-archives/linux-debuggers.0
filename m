Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7892CA0EC3
	for <linux-debuggers@archiver.kernel.org>; Tue, 12 Sep 2023 07:20:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231452AbjILHVB (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 12 Sep 2023 03:21:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56686 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231316AbjILHVB (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 12 Sep 2023 03:21:01 -0400
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com [IPv6:2607:f8b0:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 70CD6AA
        for <linux-debuggers@vger.kernel.org>; Tue, 12 Sep 2023 00:20:57 -0700 (PDT)
Received: by mail-pl1-x62f.google.com with SMTP id d9443c01a7336-1bf11b1c7d0so44143705ad.0
        for <linux-debuggers@vger.kernel.org>; Tue, 12 Sep 2023 00:20:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1694503257; x=1695108057; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=t8gkAD2Tox161Vy4sOVhwXN6LH6F1WwZDOdwPXWAuHM=;
        b=MKZFcTAdmm4F1a+vuFtjU5+QszjRZs0dvtflDxXdasYWk+Pmca4ox6N6V8RsPkMuSo
         Gxpm4kaR0xL5gQC8psHHk5LgOnIGFwDiQsqb5o0pRg9wX3zDgkAMj/uLlw27p7I4Yrr7
         UILqWZef6Q3sEyqNaZsTTPoHJhR5xFDMvi1kz3FEri1N8G2eKCqP8nZZum54blRjJBxQ
         LALl6Uye0AsQ1enYQlp84g13NfMC8fXAgFa1Tou//aCMC21CrsKsIwpg1pC4Abe4Juw0
         HOle//4k5wyh/iOhcz+PX5llmXn+TXGjr8TG90dVLv4BrBw+BADpEczK89RccBvd9mWJ
         XMFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1694503257; x=1695108057;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t8gkAD2Tox161Vy4sOVhwXN6LH6F1WwZDOdwPXWAuHM=;
        b=mb+23+TmxUjPjwLBzbODHTt7VbhOt8KvRNpQi2e6/P7AaXkHX1atPKGoFkecsH98c6
         c608+McTJbolQQaErE/ibwz05utUJnYamiHtJi/SVgMkKdJWgKr7Hd8FsHixwGNCgeeR
         4XlCmQRA7YPus8Mve6a9ftB/O4EMRnTepm6FK2ZxvHUKTqik7a06/eZ2E9/HHyLDOUUL
         YoY2MlPMl6zg7EPNVxJ+Pd29fUXzi5VEwteMnvjpXBzequG98R2oHJMLgh+3JVj2vy5O
         sPdTG9BEcg69zskDVNdWF7MymzFIQvUo8j7A3ksI8BGBJU/dqQOr/mFL9SpWEsXpynVE
         9+Kg==
X-Gm-Message-State: AOJu0Yz1F9WHzFXmvMl6RqworLf6x5HqBzT2RfylDP2vCVL5eTcothrh
        mwqGrvkkerfVfGDWnz3wq8gu5A==
X-Google-Smtp-Source: AGHT+IEEPxTunVCEfBdJY4FTl5TagWG77q1m8GyOEI9y62BgvvtEN5tmjPf+I2VX82jCaw5oLI9G/w==
X-Received: by 2002:a17:902:d501:b0:1c3:22a9:8643 with SMTP id b1-20020a170902d50100b001c322a98643mr2499690plg.31.1694503256818;
        Tue, 12 Sep 2023 00:20:56 -0700 (PDT)
Received: from telecaster ([2601:602:a300:3bc0::2928])
        by smtp.gmail.com with ESMTPSA id d13-20020a170902c18d00b001a5260a6e6csm7649534pld.206.2023.09.12.00.20.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Sep 2023 00:20:56 -0700 (PDT)
Date:   Tue, 12 Sep 2023 00:20:55 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     =?iso-8859-1?Q?Marc-Andr=E9?= Lureau <marcandre.lureau@gmail.com>
Cc:     Stephen Brennan <stephen.s.brennan@oracle.com>,
        Alex =?iso-8859-1?Q?Benn=E9e?= <alex.bennee@linaro.org>,
        "Daniel P. Berrange" <berrange@redhat.com>, qemu-devel@nongnu.org,
        linux-debuggers@vger.kernel.org, joao.m.martins@oracle.com,
        Richard Henderson <richard.henderson@linaro.org>,
        Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH qemu 2/2] dump: Only use the makedumpfile flattened
 format when necessary
Message-ID: <ZQARV6fJ0N0QyTk1@telecaster>
References: <20230717163855.7383-1-stephen.s.brennan@oracle.com>
 <20230717163855.7383-3-stephen.s.brennan@oracle.com>
 <CAJ+F1C+VFpU=xpqOPjJU1VLt4kofVqV8EN4pj5MjkkwWvVuxZw@mail.gmail.com>
 <87edl4d9wi.fsf@oracle.com>
 <87fs4aha4t.fsf@oracle.com>
 <CAJ+F1CKCdy3J8AD9EGvVO+CU6-yFPrLZ2Lum1SDgdj_kghFdQw@mail.gmail.com>
 <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Tue, Sep 12, 2023 at 10:34:04AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Aug 23, 2023 at 2:03 PM Marc-André Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Wed, Aug 23, 2023 at 4:31 AM Stephen Brennan
> > <stephen.s.brennan@oracle.com> wrote:
> > >
> > > Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> > > > Marc-André Lureau <marcandre.lureau@gmail.com> writes:
> > > >> I am a bit reluctant to change the dump format by default. But since the
> > > >> flatten format is more "complicated" than the "normal" format, perhaps we
> > > >> can assume all users will handle it.
> > > >>
> > > >> The change is probably late for 8.1 though..
> > > >
> > > > Thank you for your review and testing!
> > > >
> > > > I totally understand the concern about making the change by default. I
> > > > do believe that nobody should notice too much because the normal format
> > > > should be easier to work with, and more broadly compatible. I don't know
> > > > of any tool which deals with the flattened format that can't handle the
> > > > normal format, except for "makedumpfile -R" itself.
> > > >
> > > > If it's a blocker, I can go ahead and add a new flag to the command to
> > > > enable the behavior. However there are a few good justifications not to
> > > > add a new flag. I think it's going to be difficult to explain the
> > > > difference between the two formats in documentation, as the
> > > > implementation of the formats is a bit "into the weeds". The libvirt API
> > > > also specifies each format separately (kdump-zlib, kdump-lzo,
> > > > kdump-snappy) and so adding several new options there would be
> > > > unfortunate for end-users as well.
> > > >
> > > > At the end of the day, it's your judgment call, and I'll implement it
> > > > how you prefer.
> > >
> > > I just wanted to check back on this to clarify the next step. Are you
> > > satisfied with this and waiting to apply it until the right time? Or
> > > would you prefer me to send a new version making this opt-in?
> > >
> >
> > Nobody seems to raise concerns. If it would be just me, I would change
> > it. But we should rather be safe, so let's make it this opt-in please.
> >
> >
> 
> Alex, Daniel, Thomas .. Do you have an opinion on changing the dump format?

Chiming in as a user here, but I'd much prefer for the normal format to
be the default. The last time that I tried dump-guest-memory with the
kdump format, it took me awhile to figure out what format it was
actually using since libkdumpfile didn't understand it.
