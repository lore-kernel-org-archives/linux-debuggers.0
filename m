Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C824EB64DD
	for <linux-debuggers@archiver.kernel.org>; Wed,  5 Jul 2023 22:10:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230327AbjGEWKB (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 5 Jul 2023 18:10:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51362 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230015AbjGEWKA (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 5 Jul 2023 18:10:00 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E658D171E
        for <linux-debuggers@vger.kernel.org>; Wed,  5 Jul 2023 15:09:59 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id d9443c01a7336-1b89d47ffb6so16963515ad.2
        for <linux-debuggers@vger.kernel.org>; Wed, 05 Jul 2023 15:09:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20221208.gappssmtp.com; s=20221208; t=1688594999; x=1691186999;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4p9EqQYUtWjrwVCXKqXzhQq9ZZH4GUdAmxlS1TdtGBg=;
        b=RdUcGzKQnEBPVrSQkUKKGkbHTY+qLfnEFm5aKGc+eDlFcSxc4N6moq4AWMansk42jB
         nrujM+uFI/FoXxbrtJJbU/LTW8OG1M1wXkAmTY/fkDAdMrf3TQbF/4e93Z5NK/hPmbJA
         HeRlthxk/ZMI/wgVGkjpELtzGcTBJaoz2J3bl8RThgTSvGiDRqZv+zOp33+h9nZHfyHY
         DuYiDvlI9lm94mpmT4aDRXgPE/dmGlGRzvYKxhltJjPda9O2wht6Lhz98124h6H9KDnm
         hoYueIaAdJU2bJeclLSudWbkkqLsovJ4sxjAAeNQST2ZSbHZ/b7a/pR9cuBaNlimyLOR
         7Dsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688594999; x=1691186999;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4p9EqQYUtWjrwVCXKqXzhQq9ZZH4GUdAmxlS1TdtGBg=;
        b=dXQXDy0Ra0z/M4GDN6IhMG+wZktS/N2Wgzz/A+Ly8/7wYLCKdrgSqm5ED3GsFqzwr4
         ZsNUsGL+7WzLFBxPDqvGaFwInlwEtqkavYj+kOZ7W18YoByKh0yLZWV+P69y7vpvW1tj
         jvWRJhB/CBYstof5VkXI8GRHde7Dyr+H1TsnLsIJ7ljqFa8Dxo+/BOptH/iMQOetVdYu
         eMwORg7vJBrNhZzhkrID4ZU1QQWl+z6QX+c4G/LXa1sdXrcByuIBPxKTEv2Kx2gKWQvW
         LFxJ8p2yF4CGThYnrGog9F/dqiVNPv8a/eZEAsB21z8tKd5SnQm7PczHYz2yCHFuSE+Z
         BM6Q==
X-Gm-Message-State: ABy/qLYH6a5eahReyn5OTxrgexp5OyM1CiffKG3czZW0yThMWtD8R73/
        zfrvnTm5/KrwDZajXKMz30xutsa065goUB3PZHc=
X-Google-Smtp-Source: APBJJlHKnD8ihHSIlAi+RHtkF56Y2JxT3IZ/v9oHcBcQcEV5B+UpBrJ8jLzIl/CEWZSe+XXewLtlVQ==
X-Received: by 2002:a17:902:7893:b0:1ac:859a:5b5a with SMTP id q19-20020a170902789300b001ac859a5b5amr263272pll.0.1688594999074;
        Wed, 05 Jul 2023 15:09:59 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:b1c7])
        by smtp.gmail.com with ESMTPSA id f1-20020a170902ab8100b001b80b428d4bsm16684352plr.67.2023.07.05.15.09.58
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Jul 2023 15:09:58 -0700 (PDT)
Date:   Wed, 5 Jul 2023 15:09:57 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: drgn Roadmap
Message-ID: <ZKXqNQY/KRFFciZW@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi, everyone,

I published a roadmap of the current and upcoming work in drgn, along
with some thoughts about drgn's short-, medium-, and long-term goals:
https://github.com/users/osandov/projects/1/views/1?pane=info.

I'll update it as we make progress and come up with new ideas.
Prioritization is based on user feedback and developer time, so please
reach out or comment on the relevant issues if something is important to
you.

Thanks!
Omar
