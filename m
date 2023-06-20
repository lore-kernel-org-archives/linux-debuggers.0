Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6C884EB64D7
	for <linux-debuggers@archiver.kernel.org>; Tue, 20 Jun 2023 20:46:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229881AbjFTUqu (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 20 Jun 2023 16:46:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbjFTUqu (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 20 Jun 2023 16:46:50 -0400
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E78FBE42
        for <linux-debuggers@vger.kernel.org>; Tue, 20 Jun 2023 13:46:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=bAmHHPnmc2yUJMSbP5QISLTTwtJCByDCqlqpF1hh09Y=; b=C0PrxfMTAEjRka0jLEyP/3XyEW
        x6AI/MNJtJcCH9/DlZ2pBdPbMYE3gohEYaLpspRy1JKBTDJRqmpHhzVAqdxaroCouQhvpuOQVZaau
        ag+Ku/JUZ2pcxaXijdOQQPWBncrs0ww3xp1q/JJPHMKII1FFLGaKRVbiy2gWV2/CXMh0BpVKQFkVq
        ThaOKbSAFPPcyI0+zVace2zUcIE1kM9Ey8b/EgAx5htY67KyumXkdpKD65nA4+VnkJvpgbPRMQP5X
        S7Cd1EKkb54FxCniSoJT+B1Ca+gtT7J8s7nVriy+3hBfN5pSUZCyLg5u9O0Y0yfzXLWz5L1ZxLp59
        I1ugxFMg==;
Received: from [177.94.78.149] (helo=[192.168.1.60])
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
        id 1qBiFR-000vcc-4R; Tue, 20 Jun 2023 22:46:45 +0200
Message-ID: <258a4944-7168-54c2-7a68-468713feda65@igalia.com>
Date:   Tue, 20 Jun 2023 17:45:36 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: LPC: Linux Debuggers MC - Submissions Open
Content-Language: en-US
To:     Stephen Brennan <stephen.s.brennan@oracle.com>,
        linux-debuggers@vger.kernel.org
References: <87sfamvwnt.fsf@oracle.com>
 <44179b06-6d15-eb41-fb0e-81ebb963d972@igalia.com> <87pm5px4dp.fsf@oracle.com>
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <87pm5px4dp.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On 20/06/2023 22:31, Stephen Brennan wrote:
> [...]
> 
> It's preferred to be there in-person, but not required. If you're
> familiar with the "Big Blue Button" system that has been used for LPC
> for the last couple years, it will allow you to present remotely!

That's great to hear =)

> [...]
>> I'm planning to attend virtually only this year, but I'm working in
>> correlated areas, so I'd propose something if possible to present virtually.
> 
> Please do submit it! I'm happy to help test your presentation setup at
> the venue, maybe during a break before or during the MC. That way we can
> avoid any technical hiccups.
> 
> Thanks!
> Stephen

Many thanks for that! Much appreciated - I'll submit it then!
cheers,


Guilherme
