Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 684C5EB64D7
	for <linux-debuggers@archiver.kernel.org>; Wed, 28 Jun 2023 20:19:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231146AbjF1UTl (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 28 Jun 2023 16:19:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229469AbjF1UTj (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 28 Jun 2023 16:19:39 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD0A11BDD
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Jun 2023 13:19:38 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id d2e1a72fcca58-6686708c986so174528b3a.0
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Jun 2023 13:19:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20221208.gappssmtp.com; s=20221208; t=1687983578; x=1690575578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=nqt4LfMvUOQCRHpMy7KpDu1UobVhoC3KaNl/rsn0Ogc=;
        b=hLrq8JNwIkmm2tTImPsmqSY+D+xbzNwJ9ZDmxEc2SBmImDZ8veGf3aGDMOI7ndEVWK
         Qn4FUVveQSU/e7zg0GfvQVRlM0Xzud4Z1NHd97rgCrSgjjUgfpZRiMI/8GieS1NryHWp
         lsYRnh98vpbWjHSiJGNs6x6XUQph0Qo8Ws6kvH5XyZK17kIJ48elTt/QMtk8f23hyUBp
         Xp3KXUL7IHcYIrYtoMCaY7vKlQvOU3YfxchMOx5xeJms84e/mZC8Wf4ki2u19hwByC7K
         t2Dqg+kMvZ4kkbr1PJkiI2oviCUzD1bQvVESa4MjawafkS9A0YAIECxqfNr6yqhVfBxV
         uxBA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687983578; x=1690575578;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nqt4LfMvUOQCRHpMy7KpDu1UobVhoC3KaNl/rsn0Ogc=;
        b=A/16zWQyGL6UnBofLxEuK3/7GYss1TXx4ZfSv5CwPUIS6LHzDISkTgrqcVCOikgscO
         /shyyAho0gLKykxSn1kCfyDTNEmKwenznRqXGsOy8lOzgMnViWA4THUqwWO0wrbQd1hu
         HBFe7bHgHlaRcREPKdLLNGQDfv/9xqBCwBs5i7WVf+w5kqyROtweabRQDuaMd52JRd3J
         72uzKrgLgUpHVJ29HFapVITTd43jzvU6bX0HmsVU850KRpu2urHMbSRV3QYpfcbqOtYj
         PxPqh1lCmUn28vccTyLW/6TKVtMIsuP912PFSZQDOaDmjiDRyYD9zyWL9vOOQ0bfh43h
         EYfQ==
X-Gm-Message-State: AC+VfDyt0ZoYeqGHNKlXxzSqGXgAC+Lt6ppsUqKyUGrBIxrZkcTkwcI5
        yQKaEW+zgEUohSpXwfrgex2A2GqGCYp3/Eg2UVM=
X-Google-Smtp-Source: ACHHUZ6hPDiGw0nggf7xgf9dDSLmIKC7LymWaRIuhgUr/CijVX07vGfv/AzukW3x0RZmtPYaI2UEgQ==
X-Received: by 2002:aa7:8896:0:b0:681:142f:e8e3 with SMTP id z22-20020aa78896000000b00681142fe8e3mr3671511pfe.14.1687983577840;
        Wed, 28 Jun 2023 13:19:37 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::5:3f5b])
        by smtp.gmail.com with ESMTPSA id j20-20020aa79294000000b0064389eab4c8sm7334355pfa.126.2023.06.28.13.19.37
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jun 2023 13:19:37 -0700 (PDT)
Date:   Wed, 28 Jun 2023 13:19:36 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, June
 28th
Message-ID: <ZJyV2LxQklawQXK9@telecaster>
References: <ZJtA+PV/ZMxOCnqp@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZJtA+PV/ZMxOCnqp@telecaster>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Tue, Jun 27, 2023 at 01:05:12PM -0700, Omar Sandoval wrote:
> Hello! The next Linux Kernel Debugging Tools meeting is tomorrow,
> Wednesday, June 28nd at 11:30 AM Pacific time. This meeting is a forum
> to discuss development of Linux kernel debugging tools like drgn, crash,
> and more. I'm back from my parental leave, so I'll be hosting again
> (thanks, Stephen, for hosting while I was out).
> 
> The agenda so far is:
> 
> - The Linux Kernel Debugging microconference was accepted for Linux Plumbers.
>   Please submit talk proposals! We can discuss what people are planning
>   to present.
> - ORC format changes (see https://github.com/osandov/drgn/issues/303).
> - Upcoming drgn release.
> 
> Feel free to reply with anything else you'd like to add to the agenda.
> If you would like to attend, please email me offlist.
> 
> Thanks!
> Omar

Here are notes from the meeting:

- Guilherme G. Piccoli from Igalia joined and discussed some of the work he's doing to enable debugging on the Steam Deck. He's mainly using pstore with the ramoops backend.
- Stephen discussed the topic he's planning for the debugging microconference at LPC: an update on debugging without DWARF (using kallsyms and BTF/CTF instead).
- Guilherme discussed his microconference topic around general pstore awareness and improvements.
- We agreed that it makes sense for the microconference to not be strictly limited to "debuggers", but rather debugging as a whole.
- Omar hasn't decided what he's going to present. Perhaps something about fixing the pain points in debugging kernel code across versions/configurations (by using enums instead of macros, making it easy to bootstrap the debugger by providing enough information about memory layout, etc.).
- Stephen also mentioned his idea for providing BPF programs in the kernel that export knowledge of data structures to debuggers, which by his admission would be a ton of work but could help with a lot of portability issues.
- Omar gave an update on handling the ORC format change in drgn. This is now done.
- Omar is planning a new release of drgn this week.

See everyone next month!
