Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE0A4C4332F
	for <linux-debuggers@archiver.kernel.org>; Mon,  6 Nov 2023 12:15:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229922AbjKFMPI (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 6 Nov 2023 07:15:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50342 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjKFMPH (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 6 Nov 2023 07:15:07 -0500
Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A90A192
        for <linux-debuggers@vger.kernel.org>; Mon,  6 Nov 2023 04:15:03 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id B452D1975E2
        for <linux-debuggers@vger.kernel.org>; Mon,  6 Nov 2023 13:15:00 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1699272900; bh=W+ELNbQI8RStMwEzKzNgUJYAH6Bt7LuzuBZG7/UgYkg=;
        h=Date:From:To:Subject:From;
        b=1gdeTWErrPG2tGHKD+efEp+aywtyEyONkmgM2s4scuoDeon/N9DfENvyuwTZKL8s0
         zuFSJkGAMXRVdNXHk7fOft4qpC6a6QkUTDd+LUxLX2bFGkzNCms+vP0I2d7g16YBlB
         Lbov+JWYoC2uZC8rfdBz7vMEYRSY9Uy8HLI3Q3GuvNHJ/8VyGkpzI2SYsfdKyV7KDA
         j9LHWLfL7P/3iVo4bbgTKb4oxo/vOuk4SaglTWlEE3k1MEB2JYNdRD/HqgqiiFJJ7V
         rA4Ww2NahV4lQohUypMVTIvWbSSr2PBdq7uf2Igf8pcdzCatiekITImBUh4myognny
         /TfF9RCvUTS6g==
Date:   Mon, 6 Nov 2023 13:14:59 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     linux-debuggers@vger.kernel.org
Subject: libkdumpfile and makdumpfile flattened format
Message-ID: <20231106131459.146c1d5a@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi all,

JFYI, after encountering flattened crash dumps more often lately, I got
tired of the rearrangement step and implemented support for this dump
file variant in libkdumpfile.

Enjoy (and report bugs)!

Petr T
