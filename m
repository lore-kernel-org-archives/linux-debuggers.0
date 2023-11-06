Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3C877C4332F
	for <linux-debuggers@archiver.kernel.org>; Mon,  6 Nov 2023 07:01:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231152AbjKFHBa (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 6 Nov 2023 02:01:30 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57446 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230509AbjKFHBY (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 6 Nov 2023 02:01:24 -0500
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D69A4
        for <linux-debuggers@vger.kernel.org>; Sun,  5 Nov 2023 23:01:20 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id A99E9197EE5;
        Mon,  6 Nov 2023 08:01:17 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1699254077; bh=GYaor+eI/dxo7292szcxJikSzYK16geIzLSCbFiMuuU=;
        h=Date:From:To:Subject:From;
        b=qtREpYm4D5CtxoHs3eh6FSorWC5OICOkniUIVRlHRQenypmnhZONwgG+/XtKt0FxR
         L02UJbLP7zr/tWo6EYBy5sfoEY5LuXkbQuzzAJVFsDrrFxT82GxWgJWXOlSscfoBoU
         h28/lGCI6IdJFDgLQ5CXhE4qyKNsIITYDvFT+F2qtjm+Me/tEXpcYR4iCOnkRONs+0
         sy3Saq0e8ryclSahO9+lXTGyl8aI2aPEQ6zwPV9Hv+USnkSp5/kPzIAEXyK9i1G2qp
         NmJP0XL17x9RRxbVFdIgq9rP1gnjpTF/n/ZWTvBIrAHsMS1jZnwArhwGnf+Gu5hs35
         Z6jzRBS4d1zIg==
Date:   Mon, 6 Nov 2023 08:01:16 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     linux-debuggers@vger.kernel.org,
        Alexander Kamensky <alexander.kamensky42@gmail.com>
Subject: Aggregated address spaces in libkdumpfile
Message-ID: <20231106080116.29142ff0@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi Alexander,

I'm taking this discussion to the linux-debugging ML, because I think
other people may be interested.

It's about this pull request:

https://github.com/ptesarik/libkdumpfile/pull/77

If my understanding is correct, it is sometimes useful to have a single
address translation which covers both kernel-space and user-space
addresses, but uses a different method to translate each.

For one thing, kernel-space and user-space cannot be distinguished by
address value alone on some architectures (hi there, S/390!), so I
wonder how to deal with the kernel-space/user-space boundary in the
general case.

If there are use cases for aggregating multiple "low-level" address
spaces into a synthetic "high-level" one, then libaddrxlat may provide
a better mechanism. OTOH this could be over-engineering if there is
only one potential use for the feature.

Has anyone else run into a similar need as Alexander?

Petr T
