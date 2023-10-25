Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D291C0032E
	for <linux-debuggers@archiver.kernel.org>; Wed, 25 Oct 2023 06:29:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230009AbjJYG3p (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 25 Oct 2023 02:29:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51230 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229688AbjJYG3o (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 25 Oct 2023 02:29:44 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3B8FEA6
        for <linux-debuggers@vger.kernel.org>; Tue, 24 Oct 2023 23:29:42 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-1caa371dcd8so36259525ad.0
        for <linux-debuggers@vger.kernel.org>; Tue, 24 Oct 2023 23:29:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1698215381; x=1698820181; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZRmqjVB0enWt520ZPZKS4Vg8h8Pnje8JLHKvxsxKQYo=;
        b=XyLSU43JGb40ISBPh6rrkMDbohIgLmTs2AYpx+YjF/MlvAR1Nk8JpbTObv9h0YkbhN
         qSGwKJ6nms9DEZXLQ/i80gLFA+xwNL252quLRsuKeA/Dz+Y1IwKMhTwUYN9Llom686Se
         BnysXawX3h7AfUePBsVR/PfNuZarshJUp00qENgZ8ApDsvVRWZmSpU10lvzD+Mt90eXZ
         nPLZZBAC+OwOH/WK11KMTOMhSTIOVV0EIMcq4Xeg9O+8VN6RraZBrWjudazZ3sTjqK2k
         jqIF49v2/GFC+QQeKOxkMwSs/+v1PB4vrdD13mKTg1E9fLi/FpqZZuUinOWqKrQ/G/Ji
         2AQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1698215381; x=1698820181;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZRmqjVB0enWt520ZPZKS4Vg8h8Pnje8JLHKvxsxKQYo=;
        b=CVO4GR5tTZcnIqFh89IK2SNlrUr1DN9Gn9hfwTP3X+uVIawIxinF4KW8oQfPz9Udpj
         MmYVB5ON4QFu8VmeBKvmsFI9EDUMKAtIfQbLpl/GcFE2ITmKswEfEmCbsvi2b1omvmr4
         s6bYq1iBHGJaTdGn6rSduxPRiDLMbW/164h5QEmpW/5iu3jWP6oKhmAur8PSjx664YQa
         mH8u6fIn2eSCkCpPKVr2IvJgeEF+bjG7xUWG6vGZSN3ulYnD5MyQp4heIYT3E/OKKg14
         U/c21/OdXFJ7/QFCQa271HRF793haF50K2+CUrcfSwRuC6EafykDmWb+H5bgQN43r3IG
         xN5Q==
X-Gm-Message-State: AOJu0YyIw4rW1huDPQtBbudDMa81KbXjDLL4lSZrURcfwEgCvIy8IvfG
        7vz9IKPXHSvdJO24mLQOABTUbaMwtdroNee+103KRw==
X-Google-Smtp-Source: AGHT+IFkoukNx9f/d2op4AiL/SDV9dvd3SgKRNfcCl3paJKrdQWGJlOrRubh6PUrQP9otTWmjVd9Qg==
X-Received: by 2002:a17:903:2350:b0:1ca:e16f:a71b with SMTP id c16-20020a170903235000b001cae16fa71bmr9110723plh.23.1698215381288;
        Tue, 24 Oct 2023 23:29:41 -0700 (PDT)
Received: from telecaster ([2601:602:a300:3bc0::7aaf])
        by smtp.gmail.com with ESMTPSA id jj10-20020a170903048a00b001c60c3f9508sm8449820plb.230.2023.10.24.23.29.40
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Oct 2023 23:29:40 -0700 (PDT)
Date:   Tue, 24 Oct 2023 23:29:40 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday,
 October 25th
Message-ID: <ZTi11Aj5a3CzvLny@telecaster>
References: <ZThbme9Mfkrq87l3@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ZThbme9Mfkrq87l3@telecaster>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Tue, Oct 24, 2023 at 05:04:41PM -0700, Omar Sandoval wrote:
> The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
> October 25th at 11:30 AM Pacific time. This meeting is a forum to
> discuss development of Linux kernel debugging tools like drgn, crash,
> and more.
> 
> The agenda so far is:
> 
> - Stephen's CONFIG_DEBUG_INFO_IKCONFIG patch:
>   https://lore.kernel.org/linux-debuggers/20231004165804.659482-1-stephen.s.brennan@oracle.com/T/
> - Improving the drgn UI/making drgn less verbose interactively.

Petr Tesařík suggested a topic related to this one
(https://fosstodon.org/@ptesarik/111294099936407015) -- a quick way to
run contributed scripts vs. adding shorthand commands.
