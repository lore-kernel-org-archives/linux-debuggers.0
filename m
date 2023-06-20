Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54B57EB64D7
	for <linux-debuggers@archiver.kernel.org>; Tue, 20 Jun 2023 19:11:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230355AbjFTTLW (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 20 Jun 2023 15:11:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230235AbjFTTLV (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 20 Jun 2023 15:11:21 -0400
Received: from fanzine2.igalia.com (fanzine2.igalia.com [213.97.179.56])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 78D909B
        for <linux-debuggers@vger.kernel.org>; Tue, 20 Jun 2023 12:11:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=igalia.com;
        s=20170329; h=Content-Transfer-Encoding:Content-Type:In-Reply-To:From:
        References:To:Subject:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:
        Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
        Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
        List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=cDhMrPrH6JxlwzVqH1oOjSDI3CDND5gS81ei+36Gfi8=; b=g9kqgEOqXUk3mopZFV6woypDOj
        0AX3WEfzwCDzxF2NyWc0RUF+uFLp0v37ZUHSoi9yJoca00mj9/u8tGZxGsTeLqQADRZGupTy1wm4G
        13bf0vmVb7rgKPcWHbqyu+2Sk/Wy4Yzcf2+AnHkL/xZ/8dfsf7ART8Xpx952wRKSP4hgiBgyl6LXt
        LRQ4bnt7Ff0gTR3N6zq8L9qttJmEMo0V3DENY64l/z0ydIz+zLaVNsIWvJUfO4/JD/afz+/ZTVEuS
        ZAkBLEwUqSaDg25XDo3F4SC+HbB8kFbyqOHIvQ8w6PN+u92vq2Fr//UtQvuO9lHgYrdDYDC1uGGPR
        1Gfst+Vg==;
Received: from [177.94.78.149] (helo=[192.168.1.60])
        by fanzine2.igalia.com with esmtpsa 
        (Cipher TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_128_GCM:128) (Exim)
        id 1qBgl1-000t3p-57; Tue, 20 Jun 2023 21:11:15 +0200
Message-ID: <44179b06-6d15-eb41-fb0e-81ebb963d972@igalia.com>
Date:   Tue, 20 Jun 2023 16:10:05 -0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: LPC: Linux Debuggers MC - Submissions Open
Content-Language: en-US
To:     Stephen Brennan <stephen.s.brennan@oracle.com>,
        linux-debuggers@vger.kernel.org
References: <87sfamvwnt.fsf@oracle.com>
From:   "Guilherme G. Piccoli" <gpiccoli@igalia.com>
In-Reply-To: <87sfamvwnt.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On 20/06/2023 20:03, Stephen Brennan wrote:
> Hello everyone!
> 
> I'm pleased to share that there will be a "Linux Debugging"
> microconference at Linux Plumbers (LPC), November 13-15 in Richmond,
> Virginia.
> 
> The microconference format is a great way for us to get together and
> share the ongoing work that could use some discussion and development as
> a group. If you've been joining our meetings or following along, or
> doing some cool hacking on any of the Linux debugging tools out there,
> I'd encourage you to write out your problem statement and submit it to
> the Call for Proposals here[1]. Use the "Submit Abstract" button and be
> sure to select "Linux Kernel Debugging MC" for your track.
> 
> Please do reach out with any questions!
> Thanks,
> Stephen
> 
> [1]: https://lpc.events/event/17/abstracts/

Hi Stephen, thanks for the announcement!

Let me ask: in order to present, is it necessary to attend in-person?

I'm planning to attend virtually only this year, but I'm working in
correlated areas, so I'd propose something if possible to present virtually.

Thanks,


Guilherme
