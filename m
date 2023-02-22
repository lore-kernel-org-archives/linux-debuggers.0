Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 53C01C61DA3
	for <linux-debuggers@archiver.kernel.org>; Wed, 22 Feb 2023 01:09:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229560AbjBVBJJ (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 21 Feb 2023 20:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229609AbjBVBJJ (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 21 Feb 2023 20:09:09 -0500
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7B9EA25E0E
        for <linux-debuggers@vger.kernel.org>; Tue, 21 Feb 2023 17:09:08 -0800 (PST)
Received: by mail-pl1-x633.google.com with SMTP id e9so2030858plh.2
        for <linux-debuggers@vger.kernel.org>; Tue, 21 Feb 2023 17:09:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2IO+qlcBy8qKVu5IWyAke4DGt2ra3s5RyZ+blwRMSwo=;
        b=42fU+ah19P5/2k+ta+SleCDOG+aX2jqPFwCZz2yy8KXqs7kMsoYI9s/YOMXw+bIsOm
         azR2Dj1ufcnMwM+y3NMGWIQmCnF/7FBdJfqAMMXcoqppepR1CH3RdidaOHuh51kJDRvH
         VRe28mPm1nSK7NOIEQFdWFBaU/mDEipOewB6+6nxT4rdVmxDHvEJvKAGmJmTL/ptjZn4
         /4nTu2T0C0o0Mkt2FrldbXR+b9euzsQMXT99SgJtFisKyhXAVpPuVRCUGrtDPL/lSzCP
         AjmvYnI8U+Y0l5/ZYXeSG7OS1uF5iO1yWb5zdnGAG6Z9h+0mNPN1lUNp41KmfTjDdojo
         b91Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2IO+qlcBy8qKVu5IWyAke4DGt2ra3s5RyZ+blwRMSwo=;
        b=Jut0fotsnW83xYezH7J+fzhszodxci61JV9mEzWpFx2+JevrGKztCsJ4aDiIPF4EGd
         e6HJ29PSCJIap2710Alv+yBAFshYaWdvFny2MoCY19VAoYlh1xYjYcFSoTP/J4eD0hyg
         du9r5ODCv8YXcNY7/BmHlJm5s2yk1Mv2H9oaGzLeulIi9SoCuDRU3OZSSFqFat5S5tX3
         /n9oWvO6ZP0P/3C/RMNz+QBTblMu87s72oqaNirL0mOInI26zhcMLlDOJ2BGryoOe946
         3CY+1lBKVfEP1/2ksFSwe9fOXQa4txDu/A+3k8+XYnZOu+MCCLoxk6imlp5tijjd3IYO
         B4tg==
X-Gm-Message-State: AO0yUKUM1l/zSbeWNP4WPgxDRphypjKkTJGE7hshfTYCnUK/xz3zclrn
        u77LbJ+dPGNEmgQAeKwQSw+DL5D8KEAFP0pH
X-Google-Smtp-Source: AK7set+14dwwfNTHwHsXN18Kg9CpYDWM7BrtEtJt/cVYrFzIs/sFOw7JVMz1OS5AOdewABgwXxDmkQ==
X-Received: by 2002:a17:90b:380b:b0:234:7ccf:3c7c with SMTP id mq11-20020a17090b380b00b002347ccf3c7cmr7304651pjb.9.1677028147297;
        Tue, 21 Feb 2023 17:09:07 -0800 (PST)
Received: from telecaster ([2620:10d:c090:400::5:6963])
        by smtp.gmail.com with ESMTPSA id a11-20020a637f0b000000b00478c48cf73csm2330307pgd.82.2023.02.21.17.09.06
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Feb 2023 17:09:06 -0800 (PST)
Date:   Tue, 21 Feb 2023 17:09:05 -0800
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, February
 22nd
Message-ID: <Y/VrMXDb6dow836M@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello! The next Linux Kernel Debugging Tools meeting is tomorrow,
Wednesday, February 22nd at 11:30 AM Pacific time. This meeting is a
forum to discuss development of Linux kernel debugging tools like drgn,
crash, and more.

I apologize for the short notice. Presidents' Day in the US threw me
off. If you would like to attend, please email me offlist!

The agenda so far is:

- Testing on architectures other than x86-64.
- /proc/kcore can't be enabled on Arm. I've patched it in for the drgn
  test kernel builds:
  https://github.com/osandov/drgn/blob/08cb38cc2f9a6c1c1ca0352e9962d77bd2e0c0d4/vmtest/patches/proc-kcore-allow-enabling-CONFIG_PROC_KCORE-on-ARM.patch.
  I'm curious if anyone else has encountered this or has more
  background.
- drgn module API prototype:
  https://github.com/osandov/drgn/tree/modules. Are there any important
  use cases not covered?
- Jay Kamat: adding type/member alignment to drgn APIs.

Feel free to reply with anything else you'd like to add to the agenda.

Also note that I will be on paternity leave from March 1st-May 3rd
(possibly earlier). I'm dedicating my time until then to catching up on
code review. If there's anything you would like me to prioritize
reviewing, please let me know.

Thanks!
Omar
