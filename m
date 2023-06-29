Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3784FEB64D9
	for <linux-debuggers@archiver.kernel.org>; Thu, 29 Jun 2023 06:27:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229840AbjF2G1y (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Thu, 29 Jun 2023 02:27:54 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232096AbjF2G1H (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Thu, 29 Jun 2023 02:27:07 -0400
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E9F1A102
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Jun 2023 23:26:46 -0700 (PDT)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id E30098EF7F;
        Thu, 29 Jun 2023 08:26:43 +0200 (CEST)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1688020004; bh=7QPdvBHvl33Zw6uQojnPHkRm3JomrRY2m6ojIVay/i8=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=HC8AHQy/6veoqgYs8Pf1aU0a9UmP4Nsk6XILJ7OAjd+VO12LO8I6GXYU7wLq1eW/H
         sJ5vfEs/lwPj2P/cbjHhw7bNrByEtTCc+mjyMiBJbqXtybG0364G7Ik7Y91cLPv6g/
         Xnx1e9d66lQHJ94mVIKIXcd/QtrJLLtNmw3OrI51aDAL+JBMOBL6Jq5bCbic0r91tA
         Nn6UKLudrPhSLnkoK6SJ775OGvAkgndizXhJE57rx2CDijP7MMcD9TZiuj5vX9l2iI
         8k1knlvaFeEEWaTdi3I6sAXLRX4jtmSBOL7F8cf7+VkAhxVvjK/Hdk+CQJNVz3ee+Y
         v/dN7zdB9QlGg==
Date:   Thu, 29 Jun 2023 08:26:41 +0200
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     linux-debuggers@vger.kernel.org
Subject: Re: [PATCH kdumpid 0/3] Prevent segfault on missing disassembler
Message-ID: <20230629082641.5f8c4fac@meshulam.tesarici.cz>
In-Reply-To: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
References: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Wed, 28 Jun 2023 14:03:41 -0700
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> Hi Petr,
> 
> I didn't know quite where to send patches for kdumpid, so I elected to
> send direct to you, and CC the linux-debuggers list. Hope that's ok!


Yes, absolutely! Thank you for the fixes, they are much appreciated.

I should move this project to a better place. In my defense I should
say that the code predates GitHub, and there weren't many options back
then. ;-)

Petr T

> I encountered a segmentation fault of kdumpid (master branch):
> 
> #0  0x0000000000000000 in ?? ()
> #1  0x0000000000406aa9 in disas_at (dd=0x7fffffffde70, info=0x7fffffffdc80, pc=0) at ppc64.c:112
> #2  0x0000000000406d42 in looks_like_kcode_ppc64 (dd=0x7fffffffde70, addr=0) at ppc64.c:174
> #3  0x0000000000405616 in explore_kernel (dd=0x7fffffffde70, fn=0x405880 <explore_utsname>) at util.c:269
> #4  0x0000000000405d3f in explore_raw_data (dd=0x7fffffffde70) at util.c:465
> #5  0x0000000000404c98 in main (argc=2, argv=0x7fffffffe168) at main.c:248
> 
> The print_insn function pointer was NULL and calling it resulted in the
> segfault. So I've included a patch to check the return value of
> disassembler() and avoid calling print_insn in those cases.
> 
> I also added some fixes to build issues I encountered - hopefully to
> help you avoid autotools for even longer :P
> 
> Thanks,
> Stephen
> 
> Stephen Brennan (3):
>   cdefs.sh: require bash
>   Use -lz unconditionally
>   Gracefully handle missing dissasembler function
> 
>  Makefile | 2 +-
>  cdefs.sh | 2 +-
>  libs.sh  | 3 ---
>  ppc.c    | 2 ++
>  ppc64.c  | 2 ++
>  s390.c   | 2 ++
>  x86.c    | 2 ++
>  7 files changed, 10 insertions(+), 5 deletions(-)
> 

