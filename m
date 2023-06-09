Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FCE3C7EE2E
	for <linux-debuggers@archiver.kernel.org>; Fri,  9 Jun 2023 22:48:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229786AbjFIWsH (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Fri, 9 Jun 2023 18:48:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229461AbjFIWsH (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Fri, 9 Jun 2023 18:48:07 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5F16E1BD;
        Fri,  9 Jun 2023 15:48:06 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id E962665C7C;
        Fri,  9 Jun 2023 22:48:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2831AC433D2;
        Fri,  9 Jun 2023 22:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686350885;
        bh=9YSajLIiu//vD45TQak0tIUptjVcaYp5b5akN0t5Ftw=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bsQ8UmEqEv/TW1Aao/M294bQzvIgC+L2N/QeRe1S6b5XT152Kjon97fUQk5wzPM6Q
         8dyKZrJ1fEHzxSbZmGkyAJsv/IZg4nj5rorjfFeYYAuzLfAcLbCv25rnxuzKq3p8iW
         K1PLhtzxEyA0xpDQx+inY0UyEE5u8c90fSTZJN8rJBEEbKr5jWtYwzRW1Td2kCqA1U
         rRzuaAnAAnNH2JoPjGsYVm5myFrpR1T0EWbOgGlag3XPmQPbWKRytqsJbJZDe2xsHp
         5Z4n6Xs6VYe99SOb9m6+lDkPTsSi1IHOfpJMulQecn0NuSH2Q7GmJxih0TFZwkWOny
         KO8q8DhK9O7GQ==
Date:   Fri, 9 Jun 2023 15:48:03 -0700
From:   Josh Poimboeuf <jpoimboe@kernel.org>
To:     Omar Sandoval <osandov@osandov.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-debuggers@vger.kernel.org,
        kernel-team@fb.com
Subject: Re: [PATCH] x86/unwind/orc: add ELF section with ORC version number
Message-ID: <20230609224803.275vqw345utsusah@treble>
References: <5b70bc58ef70aab0a821111cd3201eeced8bab95.1686263379.git.osandov@osandov.com>
 <20230609220430.agw2rtswmjbquzom@treble>
 <ZIOmpuqLTJROYQt8@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZIOmpuqLTJROYQt8@telecaster>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Fri, Jun 09, 2023 at 03:24:38PM -0700, Omar Sandoval wrote:
> > Though, instead of
> > using an incrementing version, Peter had the idea to hash the struct,
> > like:
> > 
> >   awk '/^struct orc_entry {$/ { p=1 } p { print } /^}/ { p=0 }' arch/x86/include/asm/orc_types.h | sha1sum
> > 
> > That way we don't have to remember to bump the version number, and it
> > would be more resilient to partial backports in distros.
> > 
> > Would something like that work for you?
> 
> Any sort of unique identifier works for me. One thing that the proposed
> hash wouldn't catch is if ORC_REG_* or ORC_TYPE_* are ever renumbered
> (i.e., the meanings of existing values change). It also wouldn't catch
> if something about the .orc_unwind_ip section changed. But assuming
> changes like that would be much rarer, it could be handled manually by
> bumping a "salt" for the hash. E.g., by adding 'BEGIN { print <SALT> }'
> to the awk script:
> 
> awk 'BEGIN { print 1 } /^struct orc_entry {$/ { p=1 } p { print } /^}/ { p=0 }' arch/x86/include/asm/orc_types.h | sha1sum
> 
> I'll defer to you guys whether it's easier to remember to bump a version
> everytime or only in those rare cases.

I think I'd prefer only bumping it in the rare cases, because we're
going to end up forgetting either way ;-)

To catch REG/TYPE changes, we could forego awk and just hash the whole
file, the only downside being that it might introduce unnecessary
changes if we change a comment or something.  But the file changes
rarely enough.

Or we could tweak the awk to also print ORC_{REG,TYPE}_* pretty easily.

-- 
Josh
