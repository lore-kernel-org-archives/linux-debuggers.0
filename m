Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 364BCEE49A5
	for <linux-debuggers@archiver.kernel.org>; Wed, 23 Aug 2023 00:15:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231185AbjHWAPp (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 22 Aug 2023 20:15:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48568 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231733AbjHWAPp (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 22 Aug 2023 20:15:45 -0400
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com [IPv6:2607:f8b0:4864:20::835])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0139BCFE
        for <linux-debuggers@vger.kernel.org>; Tue, 22 Aug 2023 17:15:40 -0700 (PDT)
Received: by mail-qt1-x835.google.com with SMTP id d75a77b69052e-40a9918ec08so31862011cf.0
        for <linux-debuggers@vger.kernel.org>; Tue, 22 Aug 2023 17:15:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20221208.gappssmtp.com; s=20221208; t=1692749739; x=1693354539;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=x+h5y6Cfn02CDbpb9yEgmdibgY8JstdzwJYMA8VVov4=;
        b=icdnjsZQfL5YZhA5p+QdFuu90UOndPTpTuV9t0TN4u6Yey1x9ZPm2rX1BMvQG06qRZ
         3G8dpxv0Y3v6SPROk8wEw8byhz42+CDtGbAD7NHwTbr5RR7QHgZwaUcxRbZ26zKXhzei
         PJka0S+lVgzb6wwQW2fQGvHXQNJrD1ul8RBHDJ81jkN7Awi1k7hrOjsN+BDK/GE5TUlS
         AeC7haEH7gif/L2TAFDUgI7VaXXdXaopkU2lRnX34u1FDVB4b7IoEbQ+UXYkTY0zXELz
         Gwvw2cu2Lg/g0GRPmTuP3KZ1UkzJ+KZj3kaVs2PGSNmyalDDxmTtwp8uMdgiS7Y900MY
         3AEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692749739; x=1693354539;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=x+h5y6Cfn02CDbpb9yEgmdibgY8JstdzwJYMA8VVov4=;
        b=c/pOkNdlLxibkbmMJoBKl9kWLaCXbWhjNOz5XLEvo2hRKdQLrCzXGEIJf2/4tlCLT7
         iqwMQ9Pm8EOwToNmxlGvOYAHXTqD67PGa7jwbWFZHyZpLP30OayOODXEsRYrzulEt3yg
         cBoLNIqwStPfvUotE8FhOTX2EvpiE0Qlh5QmF/yO0xp0D/eGUlxGyhm8UHGRyYbEOhtx
         wwB5/jycT8Gv3fFvzUl2RlEOXFwRxNlLB9lLvI4u25y4eng4gVIj0C9v4OzeXpoR6zFg
         Tke2o37DL+Cc+O5Q2hZa6TgXnZuOthk0FPjlwB4JbtaTDO0AS4aPoNR5VJaG192FCLa3
         mIqQ==
X-Gm-Message-State: AOJu0YxVUxPu8kd2CAGvbnIegFu7XktMzdjDsxOspCYS3T7b53W79utA
        lI+e6ufLW8Kg5PxzpotIxha5fJNck0won5zdFjY=
X-Google-Smtp-Source: AGHT+IE3wsopoDUSDLMz6iKRuxus15NtAyQlCEnjNwjohJUnijwF1FCUoA2mxtM+4bGE61fwK84L/g==
X-Received: by 2002:ac8:5c46:0:b0:411:5528:64f6 with SMTP id j6-20020ac85c46000000b00411552864f6mr52951qtj.27.1692749738788;
        Tue, 22 Aug 2023 17:15:38 -0700 (PDT)
Received: from telecaster ([2620:10d:c091:400::5:90ca])
        by smtp.gmail.com with ESMTPSA id s8-20020a05622a1a8800b004035b79860dsm3382157qtc.81.2023.08.22.17.15.37
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Aug 2023 17:15:37 -0700 (PDT)
Date:   Tue, 22 Aug 2023 17:15:36 -0700
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, August
 23rd
Message-ID: <ZOVPqCEHEQkEs1ly@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello! The next Linux Kernel Debugging Tools meeting is tomorrow,
Wednesday, June 23rd at 11:30 AM Pacific time. This meeting is a forum
to discuss development of Linux kernel debugging tools like drgn, crash,
and more.

The agenda so far is:

- The Linux Kernel Debugging microconference at Linux Plumbers has
  proposals! The CFP is still open, probably until the end of August.
- Omar gives updates on what he's been working on:
    - drgn roadmap:
      https://github.com/users/osandov/projects/1/views/1?pane=info
    - Split DWARF.
    - C++ class indexing.
    - DWARF indexing rework.
    - Cross-architecture testing.
- Stephen gives updates on what he's been working on:
    - QEMU dump format.
    - Type checking drgn helpers.
    - Running drgn without root.
    - drgn Symbol finder API.
    - DWARF-less debugging.

Feel free to reply with anything else you'd like to add to the agenda.
If you would like to attend, please email me offlist.

Thanks!
Omar
