Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A8FBC7EE25
	for <linux-debuggers@archiver.kernel.org>; Fri,  9 Jun 2023 23:17:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231921AbjFIXRo (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Fri, 9 Jun 2023 19:17:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59018 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230044AbjFIXRn (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Fri, 9 Jun 2023 19:17:43 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 343372D7C
        for <linux-debuggers@vger.kernel.org>; Fri,  9 Jun 2023 16:17:42 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-54290603887so985820a12.1
        for <linux-debuggers@vger.kernel.org>; Fri, 09 Jun 2023 16:17:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20221208.gappssmtp.com; s=20221208; t=1686352661; x=1688944661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7RWuX+kZ/I+FgoPe+JjGYufRY/zYD1Mu3QxCDrMKGlE=;
        b=n6tk3kvmE4tmB8KJRAQbmvKm6tDzPxxBtgvVo40GnL8Z019gUykcAyYKe+2GJ/BCvB
         mZfAt6QLb+TcGcFYLxzYksdcaGG0vipWUtab6Ff8EftrRZmNtRyJy3szqsraaTodiLwL
         R1nNMxwL1wDrUOBfnQsEm2EZ5bRpWDvRVZrI9T7WmK4DXa5CImG3CLc5+0OIO19I0Y+7
         aD6OfXyv9vpk7So7Bh/hmNxK/TVHQvJM0dTdGhGrwmJGd2idK3MLi3Tz+D+kFTTlCK20
         clrboVuQKvzuNCFEPHCjKNutbBBTyEQZyTn1JAae7fZLGAImgFXKcq8p4OZvpPsg42TC
         T5DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686352661; x=1688944661;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7RWuX+kZ/I+FgoPe+JjGYufRY/zYD1Mu3QxCDrMKGlE=;
        b=MMSNT2PX3UccONhK/rKT8KKSb7H3zyc6gR8js9s2GiNDuZRnAcawG6PSHydMzqo3Cv
         A7+LFaOuN+FZBy0V63pI031YrsNEC/wnIb7mb3hScPgkG2otoqEkPDEyZxu3pxpl/6ZI
         OR2/hFFY7gGGCixxdFtMBbbHi7m+zVgQAMF8etal/RRmO5xkdiuz5//ryn+DiZyywOR/
         oG6kbXoMJPfgYUMTj4NUdo55WWOoDrez58rPpvw5I2o1mDhcwXJQVQEkMDMt4/b6ON5N
         AUc+VtYAKfAQSJJPZmYLKZpOwFgGWtkas5hYrMi+YT+Nz6cPl8O5AsM/OTUCepcqyA5Z
         4T+A==
X-Gm-Message-State: AC+VfDwRvv134g0KcD5+N1sz3zOABnQBru3hrt2tS0M7q55nHwkLf3wd
        YoiwobN/MEwJMxTmEQSlwXeuGA==
X-Google-Smtp-Source: ACHHUZ7ihrkV19nTxaELivb9kdHmXDY6SEwTwsd6YpSswQGgsHzOKYi3wbTgq24gQqqtjJr6azf+yw==
X-Received: by 2002:a17:903:1104:b0:1af:d225:9002 with SMTP id n4-20020a170903110400b001afd2259002mr308875plh.14.1686352661470;
        Fri, 09 Jun 2023 16:17:41 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:eb84])
        by smtp.gmail.com with ESMTPSA id j3-20020a170902da8300b001b045c9ababsm3756196plx.264.2023.06.09.16.17.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jun 2023 16:17:41 -0700 (PDT)
Date:   Fri, 9 Jun 2023 16:17:39 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     Josh Poimboeuf <jpoimboe@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-debuggers@vger.kernel.org,
        kernel-team@fb.com
Subject: Re: [PATCH] x86/unwind/orc: add ELF section with ORC version number
Message-ID: <ZIOzE4f2xr9CCA45@telecaster>
References: <5b70bc58ef70aab0a821111cd3201eeced8bab95.1686263379.git.osandov@osandov.com>
 <20230609220430.agw2rtswmjbquzom@treble>
 <ZIOmpuqLTJROYQt8@telecaster>
 <20230609224803.275vqw345utsusah@treble>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230609224803.275vqw345utsusah@treble>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Fri, Jun 09, 2023 at 03:48:03PM -0700, Josh Poimboeuf wrote:
> On Fri, Jun 09, 2023 at 03:24:38PM -0700, Omar Sandoval wrote:
> > > Though, instead of
> > > using an incrementing version, Peter had the idea to hash the struct,
> > > like:
> > > 
> > >   awk '/^struct orc_entry {$/ { p=1 } p { print } /^}/ { p=0 }' arch/x86/include/asm/orc_types.h | sha1sum
> > > 
> > > That way we don't have to remember to bump the version number, and it
> > > would be more resilient to partial backports in distros.
> > > 
> > > Would something like that work for you?
> > 
> > Any sort of unique identifier works for me. One thing that the proposed
> > hash wouldn't catch is if ORC_REG_* or ORC_TYPE_* are ever renumbered
> > (i.e., the meanings of existing values change). It also wouldn't catch
> > if something about the .orc_unwind_ip section changed. But assuming
> > changes like that would be much rarer, it could be handled manually by
> > bumping a "salt" for the hash. E.g., by adding 'BEGIN { print <SALT> }'
> > to the awk script:
> > 
> > awk 'BEGIN { print 1 } /^struct orc_entry {$/ { p=1 } p { print } /^}/ { p=0 }' arch/x86/include/asm/orc_types.h | sha1sum
> > 
> > I'll defer to you guys whether it's easier to remember to bump a version
> > everytime or only in those rare cases.
> 
> I think I'd prefer only bumping it in the rare cases, because we're
> going to end up forgetting either way ;-)
> 
> To catch REG/TYPE changes, we could forego awk and just hash the whole
> file, the only downside being that it might introduce unnecessary
> changes if we change a comment or something.  But the file changes
> rarely enough.
> 
> Or we could tweak the awk to also print ORC_{REG,TYPE}_* pretty easily.

Printing ORC_{REG,TYPE}_* should cover almost everything, and if there's
anything not covered, it can be handled manually, so that sounds good to
me. I'll draft a patch doing that.

Thanks,
Omar
