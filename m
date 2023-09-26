Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B46E5E7F127
	for <linux-debuggers@archiver.kernel.org>; Tue, 26 Sep 2023 20:44:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235859AbjIZUoP (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 26 Sep 2023 16:44:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235740AbjIZUoO (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 26 Sep 2023 16:44:14 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BED6E4
        for <linux-debuggers@vger.kernel.org>; Tue, 26 Sep 2023 13:44:08 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-1c1e3a4a06fso68823405ad.3
        for <linux-debuggers@vger.kernel.org>; Tue, 26 Sep 2023 13:44:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1695761047; x=1696365847; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=9HL7f6uYlU0gPWwG4DcsoirhMa6CTBMSsh2QNFKRZqA=;
        b=oCatLwcW49HUh3KTGFkpp9Lqu+aX4klaihSOG/EDaAdVxY3LRTgtGHwOUcbNXrmvKC
         C8OMDnHL5Eo/9DR1CNFPRePPWrKjj+Y8oM8+y1ZD4jVP1zVguhM2WeA/kZ9WsSacJ5FO
         JIk4dRZYoXPMeGal0eK574AUv+ABE4TbWjXKJMX8gflH5JFgH5g5ydBgKPjv2+5S1MIR
         OtTmTwJHj6JaqurnaxMjEqvuT5r7qwBaJWOhdoAbW6L19rQyf/k6rYBLtLCJQOfO8MY/
         e0OP+ZEYRnGbXxirE2GOlONBeCYDZcPTm4seU6Vengjvrer/RMdajVFbomKuXmcPAjVg
         fD9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695761047; x=1696365847;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=9HL7f6uYlU0gPWwG4DcsoirhMa6CTBMSsh2QNFKRZqA=;
        b=s9+BhS93s5YiYkh06+Hr/CpuXa4GnpofomgvGN5QnQA3RH7GA95nZ5tnlBvs4YXC8V
         IpzyG3/E0q5aofoNOLfQgiOhRmhstiCpiCs0LAMKXFaECnbHcXDm0uyW6qVvOkRV67H2
         plq6uJRUAN8DqRolopM4vxYyHBQpeuxUFGXSaVs1rI8D219eJ89XRt5nuh1iIUSJmdaP
         UrxzcolZk/63rQRfMQOsOwAa++lF2yfmJcxMzuJIgqWOMnGY9dK1/xnD+lavLtmJnDuU
         PPhEVA3GPhf2TLWZdWvctn0n/rBx4dqCxV2CmvqdHI5aPM4h/kZLmRg6JLKEKIatqc/s
         jmwg==
X-Gm-Message-State: AOJu0YyYt9o1EOI2e5WIOXpBi68u77QjvIb6sTiizsPpNVOcTLWvlKXx
        4ufmhyJT3yIphVIWDoFIQacZwfU7sdxO2i9vlJtPpA==
X-Google-Smtp-Source: AGHT+IGYWhG2q/V4Z8T3ExFt20j2Wufbs50OS/zKVBnChfWIqK614TIoR4Zx5orEueJsEPP/I73HpA==
X-Received: by 2002:a17:902:c409:b0:1c3:ed30:cdf4 with SMTP id k9-20020a170902c40900b001c3ed30cdf4mr10609989plk.4.1695761047540;
        Tue, 26 Sep 2023 13:44:07 -0700 (PDT)
Received: from telecaster ([2601:602:a300:3bc0::2e5b])
        by smtp.gmail.com with ESMTPSA id u5-20020a170902b28500b001c62b9a51a4sm2537853plr.239.2023.09.26.13.44.06
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Sep 2023 13:44:07 -0700 (PDT)
Date:   Tue, 26 Sep 2023 13:44:06 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, September
 26th
Message-ID: <ZRNClkjjJF3pZnvz@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
September 26th at 11:30 AM Pacific time. This meeting is a forum to
discuss development of Linux kernel debugging tools like drgn, crash,
and more.

The agenda from my side so far is light this month:

- LPC Linux Kernel Debugging microconference abstracts/schedule.
- Unwinding NULL function calls:
  https://github.com/osandov/drgn/commit/412ce956b0c3fa7924448324317c4716f31e5a65
- Split DWARF continued: DWARF package files.
- Stephen's battles with vmcores from QEMU.

Feel free to reply with anything else you'd like to add to the agenda.
If you would like to attend, please email me offlist.

Thanks!
Omar
