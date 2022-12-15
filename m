Return-Path: <linux-debuggers-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 152BAC4332F
	for <linux-debuggers@archiver.kernel.org>; Thu, 15 Dec 2022 19:37:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230024AbiLOThz (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Thu, 15 Dec 2022 14:37:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229911AbiLOThy (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Thu, 15 Dec 2022 14:37:54 -0500
Received: from mail-qt1-x832.google.com (mail-qt1-x832.google.com [IPv6:2607:f8b0:4864:20::832])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57C5242F40
        for <linux-debuggers@vger.kernel.org>; Thu, 15 Dec 2022 11:37:53 -0800 (PST)
Received: by mail-qt1-x832.google.com with SMTP id h16so443646qtu.2
        for <linux-debuggers@vger.kernel.org>; Thu, 15 Dec 2022 11:37:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=fSib7yzb3wsz5KWP0s0wkDGuo4ZJkP9xDaVJGY3opjM=;
        b=XdP2QLR0XbZsbLIPK8eKTonBWbSsd9EvKU90gKltKlvhsaSxqFk5nNZwy+lrZILekh
         nQoXiE0a8wIvvGuXvj/1MuB6IhYro1/UXJmUXCEBRnbHDBSJZ4dZC4H3oaOwDpntz+oO
         QKszi1BACjJm8oj3ELqrkkJvqdvNmzc1sOp5o=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fSib7yzb3wsz5KWP0s0wkDGuo4ZJkP9xDaVJGY3opjM=;
        b=2YKHtg6QMhoA4ngcdX+ZPPx9mwKldOq2A+shFLcDPSppbWPR55X5OrTIqBmMipXKoa
         B0FagXxVIxEfbf6mlg9mX7Gk1zhKWe/7UuNhe89rbtobsOgkfPdymQNePlCb8Ehp9C1F
         YPOFysMV00fRAtkVsWn+vvN4qnGu0GzwvKbbKTu2NcoBGyD3sHiB5hyJ1uC5De0r3sUj
         7FUBHYUtGro8iV6l+NrzLPlenmjWl5G+HHh7EDI5gBHieHt+AqAwKnEpDpjFMk/eVVrE
         0/wEnAtWqx4aJRzI+mqNL/npZIaH2/ib08z5RtH0R1dVRSPJzoDryiBAiZd5ES3hjGgi
         5Lzw==
X-Gm-Message-State: AFqh2koMc/GSfbjBoXH8dYjBDJk+jtdRy/zHK9ubRUXqngvjso1Id2xF
        UB64N/fdQZfsV1tB0jJhCPqn5bfayxgSmFIF
X-Google-Smtp-Source: AMrXdXtsDaOYPlxecRuLqfdkrR2LPO8QpebOa1bI1LtEFBX+HNQYyZiCs+nzbEE3PYFxEdZxVsiCVA==
X-Received: by 2002:ac8:690:0:b0:3a6:8ece:9eef with SMTP id f16-20020ac80690000000b003a68ece9eefmr212926qth.27.1671133072236;
        Thu, 15 Dec 2022 11:37:52 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-33-142-113-79-147.dsl.bell.ca. [142.113.79.147])
        by smtp.gmail.com with ESMTPSA id n11-20020ac8674b000000b003a7f1e16649sm3981502qtp.42.2022.12.15.11.37.51
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Dec 2022 11:37:51 -0800 (PST)
Date:   Thu, 15 Dec 2022 14:37:50 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-debuggers@vger.kernel.org
Subject: Test delivery
Message-ID: <20221215193750.c26jt4vrwmwf46ou@meerkat.local>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

This is a test delivery to check propagation to lore.kernel.org.

Please ignore.

-K
