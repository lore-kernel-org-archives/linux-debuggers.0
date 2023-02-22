Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 644DEC636D6
	for <linux-debuggers@archiver.kernel.org>; Wed, 22 Feb 2023 20:24:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232457AbjBVUYP (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 22 Feb 2023 15:24:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232377AbjBVUYO (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 22 Feb 2023 15:24:14 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF4E62A99E
        for <linux-debuggers@vger.kernel.org>; Wed, 22 Feb 2023 12:24:12 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id u10so10397376pjc.5
        for <linux-debuggers@vger.kernel.org>; Wed, 22 Feb 2023 12:24:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=W8nFSAb3QpmfFXBj+a6fJZiarnuC7vaxsdltz5/StpM=;
        b=tUnuDJkLUGJ+WZUlv998LSWFjq66lMQv3b3DfRxxiAnVj1rPT73UEj9pNov+M260If
         EaDMFzmXWB7tCM45/X0d31V9WlqD0eb/MgX8w4O2TcGEt7SNy+7FvJJt+qMPavqBCNs5
         vnBCCQFmBsNk4S4VXnvDK0wBauZUOtvY+NLYOtSVtbGfd8j4IjaNKHpi7Xbv91JhGkHu
         8gZRJB5C+zKZRzA5pJfnF55NFHMkexoezlC3PzUlVmWbynssIGXo1Hakh4ZQObfDEj11
         7HKwZFuzbcWzRIAb6zpK2BxUNeJCGeIWiBmswMFwEE+oF/qekQT5ZqQpdFOxL0Ln8nLR
         bvbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W8nFSAb3QpmfFXBj+a6fJZiarnuC7vaxsdltz5/StpM=;
        b=jLtbKwieL8F8C4p94quHQhNf8uy49penb7Dzn3AC3k6vEQqL/kUlww14nJ7SS5V1OK
         8PDqrh2rjpTqppZCCsht/bhnxqKzFw+4jqnyK/+rXGEVsq18OAW2xZaFcLjXWoUg+0PN
         NKGs8FQu6usViozwfXL5qlfzva2dHjS5iO99g1yu4slPXt0UYRIseObU4uYHLiLKbWE+
         I5k2ZmjTspDu8mAMKXVH+xZmBRT7OaYwWOZy/jz1WHGyhZre3SjIzuTkBHjvmuEMleXp
         /X0jxGCBkF9DB50zraRn2cXqXRDpIsp3j3DjpCNyWPUrAbPn1iyePhIVEbxOYUZgSWmm
         jGCQ==
X-Gm-Message-State: AO0yUKV+Mqw56CTOF51xx4JvbBG4yZb0i00xmgnLUtOobFP/As+ctqrd
        mKCtPv6KwNlEKdAt5ZczYLtAgVYJBMfAsU9Z
X-Google-Smtp-Source: AK7set/uVn1GJBfuIfERVL/taPrrgSI/kIAK69q+iLcLWxPomXVZEt+TdUA/7eOoS/JypNbaWPQgjw==
X-Received: by 2002:a05:6a20:430e:b0:ae:47a6:e6d9 with SMTP id h14-20020a056a20430e00b000ae47a6e6d9mr10439073pzk.6.1677097451244;
        Wed, 22 Feb 2023 12:24:11 -0800 (PST)
Received: from telecaster ([2601:602:a300:3bc0::6894])
        by smtp.gmail.com with ESMTPSA id m18-20020a6562d2000000b005026c125d47sm5796775pgv.21.2023.02.22.12.24.10
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Feb 2023 12:24:10 -0800 (PST)
Date:   Wed, 22 Feb 2023 12:24:10 -0800
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday,
 February 22nd
Message-ID: <Y/Z56qVhd9m/Ycyb@telecaster>
References: <Y/VrMXDb6dow836M@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y/VrMXDb6dow836M@telecaster>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Tue, Feb 21, 2023 at 05:09:05PM -0800, Omar Sandoval wrote:
> Hello! The next Linux Kernel Debugging Tools meeting is tomorrow,
> Wednesday, February 22nd at 11:30 AM Pacific time. This meeting is a
> forum to discuss development of Linux kernel debugging tools like drgn,
> crash, and more.
> 
> I apologize for the short notice. Presidents' Day in the US threw me
> off. If you would like to attend, please email me offlist!
> 
> The agenda so far is:
> 
> - Testing on architectures other than x86-64.
> - /proc/kcore can't be enabled on Arm. I've patched it in for the drgn
>   test kernel builds:
>   https://github.com/osandov/drgn/blob/08cb38cc2f9a6c1c1ca0352e9962d77bd2e0c0d4/vmtest/patches/proc-kcore-allow-enabling-CONFIG_PROC_KCORE-on-ARM.patch.
>   I'm curious if anyone else has encountered this or has more
>   background.
> - drgn module API prototype:
>   https://github.com/osandov/drgn/tree/modules. Are there any important
>   use cases not covered?
> - Jay Kamat: adding type/member alignment to drgn APIs.
> 
> Feel free to reply with anything else you'd like to add to the agenda.
> 
> Also note that I will be on paternity leave from March 1st-May 3rd
> (possibly earlier). I'm dedicating my time until then to catching up on
> code review. If there's anything you would like me to prioritize
> reviewing, please let me know.

Here are the notes from today's meeting:

- LPC is scheduled for November 13th-15th in Richmond, Virginia. We will
  try to arrange a kernel debugging tools micro-conference or BoF.
- Omar's setup for testing AArch64, Arm, ppc64, and s390x support in
  drgn.
    - Kernels are being built along with x86-64 kernels now.
    - I'm still setting up a userspace environment with debootstrap
      manually and testing locally. I'll get some form of this in the
      repository so we can start running it in CI.
    - I asked whether crash had any tips for testing to share or any way
      they could leverage drgn's infrastructure, but Philipp Rudo noted
      that their testing is mostly manual, so there's not much that can
      be done at this point.
- No one had any additional background on /proc/kcore for Arm. It's
  probably worth trying to enable it upstream.
- Proposed drgn module API covers the main use cases brought up.
    - It will require changes for users that rely on -s or
      load_debug_info() loading arbitrary files that don't match
      anything in the program (e.g., Object Introspection).
- Jay Kamat talked about adding type and member alignment to the drgn
  APIs for Object Introspection to make use of. No one else currently
  has a use case for this (the member offsets are usually good enough),
  so we'll probably go with a minimal solution to unblock Object
  Introspection.
- Meetings in March and April are cancelled. See everyone in a couple of
  months!

Thanks,
Omar
