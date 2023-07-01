Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 77B64EB64DC
	for <linux-debuggers@archiver.kernel.org>; Sat,  1 Jul 2023 17:04:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229492AbjGAREM (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Sat, 1 Jul 2023 13:04:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229477AbjGAREL (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Sat, 1 Jul 2023 13:04:11 -0400
X-Greylist: delayed 902 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 01 Jul 2023 10:04:08 PDT
Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com [136.143.188.50])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6C191FE8
        for <linux-debuggers@vger.kernel.org>; Sat,  1 Jul 2023 10:04:08 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1688230145; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=bdJdWQa/pg6MWtUKWjOOxbv3izpwmWDWyYq6y5xf8xff+wKO1fdOOcQCNthDu+xLsXQ3YEJ7qkxy3jcifEYqHvfgMn901B0kqRXQLxgKV6nR2xL65o2nlQutO1WWWWARS4Oda9/STGKljxbnUa3zIM0bRhUBNFpZ32n5octppW4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1688230145; h=Content-Type:Date:From:MIME-Version:Message-ID:Subject:To; 
        bh=YoWm7MAt+Abtw/Q0Il4xj1MyfMAplYVbYjWLt9ES5iE=; 
        b=Xgf+KY2jKi06sHKQwJ5Q4aPFTYjKwwbQkovFtWiZ3RUL4GtXAxzSXsgt/rKpqTiL101AZk6ucJtV7uxQ9rWl8gcNxwa8KW31GMFps8UIZ7t/9QTrWWRrkc+IZFLWszhOb3ghhNfG8SAxQkDbLVw1CJE3IpCweK3ZUeWA/WeMbII=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=brennan.io;
        spf=pass  smtp.mailfrom=stephen@brennan.io;
        dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1688230145;
        s=selector01; d=brennan.io; i=stephen@brennan.io;
        h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
        bh=YoWm7MAt+Abtw/Q0Il4xj1MyfMAplYVbYjWLt9ES5iE=;
        b=TRFGCOmY5PCKlJmIFizlOgQa1es95zcLn58r5ET77LhLKC3w7meglWSpPjSrA0EK
        y9Ova+x1ILxE139KjyagfLFY82pj+C47WIP7lV/6BGngX6uwr2HPi5pBeQyqBFfBSNT
        FnGd2XqLhDVSYy+zyKx++jMtgRDSw5XG5RREMWio=
Received: from localhost (136.24.52.195 [136.24.52.195]) by mx.zohomail.com
        with SMTPS id 1688230143047962.60007885865; Sat, 1 Jul 2023 09:49:03 -0700 (PDT)
From:   Stephen Brennan <stephen@brennan.io>
To:     linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging MC is (still) open: now with a blog post
Date:   Sat, 01 Jul 2023 09:49:01 -0700
Message-ID: <87pm5bvapu.fsf@brennan.io>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi everyone,

Today our post on the LPC blog went live:

https://lpc.events/blog/current/index.php/2023/07/01/linux-kernel-debugging-mc-cfp/

I think it does a good job describing what we're looking for, and it has
instructions for submitting topics. Please consider the problems you
face in your debugging: there's probably a topic for you to submit.

Please also spread the word to other folks and groups who may face the
same debugging problems that we do.

Thanks,
Stephen
