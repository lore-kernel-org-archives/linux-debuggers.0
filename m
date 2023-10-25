Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88168C07545
	for <linux-debuggers@archiver.kernel.org>; Wed, 25 Oct 2023 00:04:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1344703AbjJYAEr (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 24 Oct 2023 20:04:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42808 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1344663AbjJYAEr (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 24 Oct 2023 20:04:47 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1CC610CF
        for <linux-debuggers@vger.kernel.org>; Tue, 24 Oct 2023 17:04:43 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1c9d3a21f7aso42759305ad.2
        for <linux-debuggers@vger.kernel.org>; Tue, 24 Oct 2023 17:04:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1698192283; x=1698797083; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=qbwae7no33QOKd7lRWuX9MSy45Tlgkje9Q3gGiLd5C8=;
        b=Q0Ux531IKe2nK3PZr6ycM1udkxrImbtgPwDdnawHIVZmHg9VUedi3D7TtzF7eStsKp
         enjV5fR90fFk9MTSIDOiJjzGY7fFrzyvb3pEmNTqE32IKVk997kIkiMej2zbHKUbMgev
         w7ivF2InySRQV2hXGfajfM3+85nT/Dc8MCQ4LOn9nmTDGwhtQuQbYHpCFG43YpaMLnN0
         VLX/pBoVLnV+UXDQEph5RGURBMVzRplMiUSFG91QV4fsWZW4XYxBD2Ei28l5G1eDPtki
         U85tEdV/cCvTOVsK3M3ZEHNXqrM4Y1ccDJ+B6P+yAqlX3IR2C7z4GfuCMbQxHDIahiiD
         EHqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698192283; x=1698797083;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qbwae7no33QOKd7lRWuX9MSy45Tlgkje9Q3gGiLd5C8=;
        b=vTrQTCy2kfzqkAT9R42ijqvCDVIhr60xqjvL+wjMDdklQqypEDi9u7P6sdsy3oXkUu
         0Th/V/FkS0m0oyVhfe0SoWjn4WYu4ZaiIim7c4i4NY1phyFpux+b4jQuBzd92JBlP9o2
         59KFKX45slL1kXeOIHMT6XuqJQI3+tJxSEA2ptVUTqCGlDRrpuXwCF5KjaKNEtZGTIur
         RqYXVYvyXdqTRKNFp7GjZxajD5fcYXa78k3K/C6zJRNcFOqScbs/QzwBTVfeN67Np/2e
         IloubyER1t0N8sV1qSkRrnDrO0ZqPsyCpKs1d03nIIOROzBEwF+NhwVtSCxnWU+H8SDJ
         fO3Q==
X-Gm-Message-State: AOJu0YzQTHmVCxHpKAtNS0+Mpr1uyJwKU7EKos7gNVVhCq3PxxnIcB4M
        afiAzF/8yt2AxuQQOFMxXQy9FIG/ewizp8yKszo=
X-Google-Smtp-Source: AGHT+IElWX1meNiBJ8QJvnD7m3lBYmk1/GxORrrXfmglrHEzcH03WzqftWUiuawXQkz294cQNKGRHA==
X-Received: by 2002:a17:90a:1a15:b0:27c:efd2:9a0b with SMTP id 21-20020a17090a1a1500b0027cefd29a0bmr12454272pjk.39.1698192283063;
        Tue, 24 Oct 2023 17:04:43 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::4:4dbb])
        by smtp.gmail.com with ESMTPSA id u12-20020a17090a890c00b0027d09ba2f91sm9340941pjn.34.2023.10.24.17.04.42
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 17:04:42 -0700 (PDT)
Date:   Tue, 24 Oct 2023 17:04:41 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, October
 25th
Message-ID: <ZThbme9Mfkrq87l3@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
October 25th at 11:30 AM Pacific time. This meeting is a forum to
discuss development of Linux kernel debugging tools like drgn, crash,
and more.

The agenda so far is:

- Stephen's CONFIG_DEBUG_INFO_IKCONFIG patch:
  https://lore.kernel.org/linux-debuggers/20231004165804.659482-1-stephen.s.brennan@oracle.com/T/
- Improving the drgn UI/making drgn less verbose interactively.
- Any final preparations for the LPC Linux Kernel Debugging
  microconference?

Feel free to reply with anything else you'd like to add to the agenda.
If you would like to attend, please email me offlist.

Thanks!
Omar
