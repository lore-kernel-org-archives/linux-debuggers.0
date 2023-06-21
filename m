Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D81F2EB64D7
	for <linux-debuggers@archiver.kernel.org>; Wed, 21 Jun 2023 17:43:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231209AbjFURnD (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 21 Jun 2023 13:43:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231634AbjFURmq (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 21 Jun 2023 13:42:46 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A576E1726;
        Wed, 21 Jun 2023 10:42:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id AF13A61642;
        Wed, 21 Jun 2023 17:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CE7D4C433C8;
        Wed, 21 Jun 2023 17:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1687369313;
        bh=pod9vxsJ9/lJVWWTJCewna80E9noVqemDffNCQX/HMU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Vf9aRTT9xfDyEXdW3zs9vwc0uhfEnZRLveJuFaGow22Ny7mAWZcgcjbuNyBE/tKk0
         qEmhd2+XoS0RBhZio26hqeK5AyR9f+7MMYkyAVv2/eN/UX3FmbPntgxq8LOqNvMBwY
         4TZXrp3ApHX6imRSn9O6+PIEWY4OuQKdHqcCGIAnegzztIS12j+dvdxMlC9UNvNwox
         hNySBbaY50Q6lQRSSUH5FC8JknwxZN8Crjh4ZCoCrl84nP3FqbkDM+rjdmzRf3C3oq
         uZk5rdbEtD2Y5HSWArWqdCHvGUGJcRH+wIoZ88spD328gvwldikEVL7JprO7drVqRK
         0VpXVJ8TRbTcA==
Date:   Wed, 21 Jun 2023 10:41:51 -0700
From:   Josh Poimboeuf <jpoimboe@kernel.org>
To:     Omar Sandoval <osandov@osandov.com>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        linux-kernel@vger.kernel.org, linux-debuggers@vger.kernel.org,
        kernel-team@fb.com
Subject: Re: [PATCH v2] x86/unwind/orc: add ELF section with ORC version
 identifier
Message-ID: <20230621174151.e5vucxl2hlsp3o3b@treble>
References: <aef9c8dc43915b886a8c48509a12ec1b006ca1ca.1686690801.git.osandov@osandov.com>
 <20230614091751.GE1639749@hirez.programming.kicks-ass.net>
 <ZJHYuH/DD6tqJ+bu@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <ZJHYuH/DD6tqJ+bu@telecaster>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Tue, Jun 20, 2023 at 09:50:00AM -0700, Omar Sandoval wrote:
> > So we're fairly late in the cycle and it would need justification to go
> > into objtool/urgent -- preferably only fixes at this point.
> > 
> > But given we 'broke' the ORC layout this cycle, we can mark this with
> > Fixes: for the two mentioned commits.
> > 
> > Josh?
> 
> Ping, Josh, any chance of getting this in to 6.4? Sorry to be cutting it
> so close.

Sorry, I had acked this privately and Peter queued it last week but it
may have slipped through the cracks.  He may still try to get into 6.4.

-- 
Josh
