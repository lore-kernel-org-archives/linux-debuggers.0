Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 59097EB64D9
	for <linux-debuggers@archiver.kernel.org>; Tue, 27 Jun 2023 20:05:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229687AbjF0UFP (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 27 Jun 2023 16:05:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58664 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229454AbjF0UFP (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 27 Jun 2023 16:05:15 -0400
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com [IPv6:2607:f8b0:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 591E0211B
        for <linux-debuggers@vger.kernel.org>; Tue, 27 Jun 2023 13:05:14 -0700 (PDT)
Received: by mail-pl1-x62d.google.com with SMTP id d9443c01a7336-1b801e6ce85so1695315ad.1
        for <linux-debuggers@vger.kernel.org>; Tue, 27 Jun 2023 13:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20221208.gappssmtp.com; s=20221208; t=1687896313; x=1690488313;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/P2INwY8NjJA9XpenpDys6LG7DUojDLvH1iYUXeUrBQ=;
        b=veI7/cwj5iZGPMiRZtu2LhuxuHlUSY+g25KoLzyrtcUc7PMsy64l7p+DT8Ad+3PQEP
         KM//aQy2Bt884swdf/XldXoLJDHXCUIukPu+zRn8+MjRcsdzlih7iJQ5nu26R54lkfn7
         i8UUL70dh89h3SdTz93Um1rBxY2jbnyPUuGUYdDAqynNDCD5rm7BixSXTe3eFmlC4sp9
         bmgVgdSenBr5xJj7l1m1r1RmiE5ilFvCxEAQXLjxQZK4Wacb3IRiebqsZoQRwoj2JhWL
         GCohFzBjY8mjV292HYLz/sU57M2dOzO7VWbCs8XJl0X9m9kSgDhaTh6GYtXMhdOeR6jt
         E4IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687896313; x=1690488313;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/P2INwY8NjJA9XpenpDys6LG7DUojDLvH1iYUXeUrBQ=;
        b=JfUgw3rYrpLQc0ZyUMqsJ/+SVRin4lx5V4u3M44vQjkrT+uU/lwt8u7TRydFFSTqU9
         7lOYAsKmsfNcrLTS2EgLPd5DiNL4a5DJxyyYi/ZsjuJRBr2TKYUqOokQ8r9JpPFADS80
         eWK5JaVQDB22tbEKzZoAbFugD2K3pzC80tG1RDreQwcsRSKaLez/TQTbAvU6jq8KMUwc
         +cwyDRdLE/uAi5y1EN4Qko+MmgSoOyCREdXck9pqaRufkogM5CUIZEvoIuINxE9Meu0Q
         oAO3UdWWxu2WcvXMQI1SWjvNVRZzHeoHij3taaCAwySgO/UxPeFOIlvceqOPuZfZ3oSS
         HBlg==
X-Gm-Message-State: AC+VfDyaXCY9kL6fF+Rmqfy2wokdLezs1YpioEy3Yl7y8Pd1ph0h+kEn
        si+0SByAmfK+WI6D5yreoWfEtpQRSjJO/kQq2u0=
X-Google-Smtp-Source: ACHHUZ4UoCXD2IIcamwZwK6g178eqeNZ49cidvtdhp4xg/Iu8rYfiMSR5OYH0DVdAidDhR+IZeIIMg==
X-Received: by 2002:a17:902:e80a:b0:1b8:3786:3328 with SMTP id u10-20020a170902e80a00b001b837863328mr352686plg.20.1687896313346;
        Tue, 27 Jun 2023 13:05:13 -0700 (PDT)
Received: from telecaster ([2601:602:a300:3bc0::4461])
        by smtp.gmail.com with ESMTPSA id u13-20020a170903124d00b001b3fb2f0296sm6348709plh.120.2023.06.27.13.05.12
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jun 2023 13:05:13 -0700 (PDT)
Date:   Tue, 27 Jun 2023 13:05:12 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, June 28th
Message-ID: <ZJtA+PV/ZMxOCnqp@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello! The next Linux Kernel Debugging Tools meeting is tomorrow,
Wednesday, June 28nd at 11:30 AM Pacific time. This meeting is a forum
to discuss development of Linux kernel debugging tools like drgn, crash,
and more. I'm back from my parental leave, so I'll be hosting again
(thanks, Stephen, for hosting while I was out).

The agenda so far is:

- The Linux Kernel Debugging microconference was accepted for Linux Plumbers.
  Please submit talk proposals! We can discuss what people are planning
  to present.
- ORC format changes (see https://github.com/osandov/drgn/issues/303).
- Upcoming drgn release.

Feel free to reply with anything else you'd like to add to the agenda.
If you would like to attend, please email me offlist.

Thanks!
Omar
