Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3991C7EE2E
	for <linux-debuggers@archiver.kernel.org>; Fri,  9 Jun 2023 22:04:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232498AbjFIWEf (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Fri, 9 Jun 2023 18:04:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39874 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229475AbjFIWEf (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Fri, 9 Jun 2023 18:04:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 082622D44;
        Fri,  9 Jun 2023 15:04:34 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 90ECF61044;
        Fri,  9 Jun 2023 22:04:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BFD60C433D2;
        Fri,  9 Jun 2023 22:04:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686348273;
        bh=49WnzezBZqWAzArNQMUxsT8uVlrxotAtCA0lmcdXwvU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=M+veaxV9QapnY+RNKTa5WQKeoAo4FtGCqbpAywvHvJuzDsJrooGzKT/XjeMx241uZ
         /LLB8iaAEQ9bQcJiPJc1mT7BPteTaNDrQU5ge8PrAEBUy9YQ5N62DSJ6ak3NjKBVtn
         1WOtv5VRqXug/GEXsWnaCRyrr0iTa2pVgQovjif7a4fZHC5VGZ1PkUnFW1g6why9pN
         +m9M9jft2/E9N6IdWiU1enkpUJqqknzlYbMPhiujuNQ3HS2qvz5Ao3kmmhfdV15jxT
         5f2tPIukaM53DOSeZ8t3zwWkFE1U2fwsbmkJcbtT/rDA6pfppmj0h22aUxFW0nHXR1
         VRSJonQkTyGTA==
Date:   Fri, 9 Jun 2023 15:04:30 -0700
From:   Josh Poimboeuf <jpoimboe@kernel.org>
To:     Omar Sandoval <osandov@osandov.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-debuggers@vger.kernel.org,
        kernel-team@fb.com
Subject: Re: [PATCH] x86/unwind/orc: add ELF section with ORC version number
Message-ID: <20230609220430.agw2rtswmjbquzom@treble>
References: <5b70bc58ef70aab0a821111cd3201eeced8bab95.1686263379.git.osandov@osandov.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <5b70bc58ef70aab0a821111cd3201eeced8bab95.1686263379.git.osandov@osandov.com>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Thu, Jun 08, 2023 at 03:38:38PM -0700, Omar Sandoval wrote:
> Hi,
> 
> As mentioned in the commit message, the motivation for this patch is
> allowing drgn to continue to make use of ORC for kernel stack unwinding.
> 
> I want to make it clear that I don't want ORC to be stable ABI. The
> kernel is free to change the format as much as needed, I just need a way
> to detect the change. (drgn already pokes at many kernel internals and
> needs updates for most kernel versions anyways. We have a big test suite
> to catch changes we care about.)
> 
> I'm not at all married to (or proud of) this particular implementation;
> I'd be happy to use anything that lets me detect the format version in
> both cases mentioned in the commit message (ELF file or core dump +
> symbol table).
> 
> It'd be great if we could get a solution in before 6.4 is released. I
> would've reported this sooner, but I just got back from paternity leave
> last week.

Hi Omar,

Peter and I agree this seems fine in principle.  Though, instead of
using an incrementing version, Peter had the idea to hash the struct,
like:

  awk '/^struct orc_entry {$/ { p=1 } p { print } /^}/ { p=0 }' arch/x86/include/asm/orc_types.h | sha1sum

That way we don't have to remember to bump the version number, and it
would be more resilient to partial backports in distros.

Would something like that work for you?

-- 
Josh
