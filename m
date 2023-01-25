Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F126C27C76
	for <linux-debuggers@archiver.kernel.org>; Wed, 25 Jan 2023 21:37:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236334AbjAYVhA (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 25 Jan 2023 16:37:00 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34702 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236147AbjAYVhA (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 25 Jan 2023 16:37:00 -0500
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com [IPv6:2607:f8b0:4864:20::430])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 136A51BE5
        for <linux-debuggers@vger.kernel.org>; Wed, 25 Jan 2023 13:36:59 -0800 (PST)
Received: by mail-pf1-x430.google.com with SMTP id z3so14369520pfb.2
        for <linux-debuggers@vger.kernel.org>; Wed, 25 Jan 2023 13:36:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20210112.gappssmtp.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=tRBRtRNX/F1vOSBKhU+3xdFKMEaN2ZI+XOBv7Dgi33A=;
        b=SJ1UQkilc+cXJsjB41rirabpwgipNi1sNFJoGiWYfOVtKbfE1WmT7SboZChsjfXpgG
         LKxLqrzCwSRBLjm4tVYr/YCuLPm3HFduaMfjeD0bUVPxupwMufsho3TEif62HeW360qJ
         ZQ+3n8qgh6c2qm+Z3I6w00ebSHBZfl+zHXiDbWYWNtTTb3VHHBRsoN7KavrOTCJaX/D5
         x5rLF2Mi7JPYTqvNrVvvW192s1e/AQha3DrOzIaYdeuYHwbcfEHEk62bsCymlizEyz5u
         ccZ27W5J+XX+a7N1W0ZOfo382iuN0Neh4+WrtLhjV7WQnldm+XueGY25orv05HMBZqH7
         VnPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRBRtRNX/F1vOSBKhU+3xdFKMEaN2ZI+XOBv7Dgi33A=;
        b=TNdfkpcm3RJe/4Y2wKm1W4uP8BOpbF0War3rlzTmkGON15ndspBoOuCJgnIAtKt2r8
         pJdmed1F7J6ETN91ZkMOG85GkM7kDbsmZD0cDnzcpOxTtLWTdaXqC9MzJ5TChG12sQPT
         xz6G5gZbct22v+Rk43joTEUhr8FcqtzIkY7aPwBJjfJsbhhIwGRgPFLtBO4Z9Atyiqli
         pvZZ6kW+vfdJJYEUnXHVXj/3HuUSUXK5cnuV4M5kEnzdI8Jgp9d4MgUlPYH/B+GKJW6X
         rR4eNQXbOFKFmIuy9+gk2Zn1VMk/Srd8odYHiLpgl+xeRIsKRgLB7zOITqrGrDh3UC0U
         udAw==
X-Gm-Message-State: AFqh2krg5iQwyjyEOVza7N8ZroAepY9YU/53YmeTK0lKHdZHqZ7OZEpg
        6F6KnVpVErLrRFONoUrnpU9t9bjOCt6GVG77
X-Google-Smtp-Source: AMrXdXt2nPyG/wsEGP3IwZANB0Y7ch0Mg36kft0pKpcPc7CP44mpeEbhs+V3UsQDnb4f5e3AlkFqlw==
X-Received: by 2002:aa7:85d5:0:b0:582:6732:ee0b with SMTP id z21-20020aa785d5000000b005826732ee0bmr53985841pfn.28.1674682617841;
        Wed, 25 Jan 2023 13:36:57 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::4:92fd])
        by smtp.gmail.com with ESMTPSA id s10-20020aa78d4a000000b0058e08796e98sm4067408pfe.196.2023.01.25.13.36.57
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 25 Jan 2023 13:36:57 -0800 (PST)
Date:   Wed, 25 Jan 2023 13:36:56 -0800
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday,
 January 25th
Message-ID: <Y9Gg+PqIVjSTn1wn@telecaster>
References: <Y87pyvDebF7YBQTZ@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Y87pyvDebF7YBQTZ@telecaster>
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Mon, Jan 23, 2023 at 12:10:50PM -0800, Omar Sandoval wrote:
> Hello! The first Linux Kernel Debugging Tools meeting of 2023 is this
> Wednesday, January 25th at 11:30 AM Pacific time. We've been having
> these for a few years as a forum to discuss development of Linux kernel
> debugging tools like drgn, crash, and more. Now that we have this
> mailing list, I figured it'd be nice to publicize it more widely. If you
> would like to attend, please email me offlist.
> 
> The agenda so far is roughly:
> 
> - Is there a good way to iterate over all online `struct page`s? See
>   https://github.com/osandov/drgn/pull/228
> - Pending drgn work
>     - Pluggable symbol finder from Stephen
>     - Slab helpers from Imran
> - Dealing with `DW_OP_entry_value` and `DW_TAG_call_site_parameter`. See
>   https://github.com/osandov/drgn/issues/233
> - Call for drgn/contrib scripts:
>   https://github.com/osandov/drgn/tree/main/contrib
> 
> Please reply with anything else you'd like to add to the agenda.
> 
> Thanks!
> Omar

Here are notes from the meeting:

- There doesn't seem to be a better way currently to get the constants
  needed for iterating sparsemem. We should bite the bullet and make
  them enums upstream. This won't be too hard, but it'll be a bit
  tedious since they're defined separately for each architecture. And it
  will only solve it for new kernels.
- Stephen Brennan is working on making symbol finding pluggable (as
  opposed to only from ELF symbols). This will make it possible to find
  debug info for kernel modules from `kallsyms` without loading the
  module debug info, for BPF functions, and more.
- Imran Khan has a bunch of new slab helpers, and on top of those,
  helpers for validating that the slab metadata makes sense, to help
  with debugging memory corruptions. Some of these require `slub_debug`
  to be enabled.
- Ross Zwisler is working on setting aside the vmcore from the kdump
  kernel for the full kernel to access. This works on x86 by marking it
  in the e820 table, but Arm will need something different (maybe in
  device tree).
- I'll merge the workaround for `DW_OP_entry_value` from
  https://github.com/osandov/drgn/issues/233, but there's potentially
  more we can do to actually recover the value when
  `DW_TAG_call_site_parameter` is available.
- Jeremy Carin, a teaching assistant at Columbia University's Operating
  Systems course, is looking for good resources to teach beginners
  kernel debugging.
    - We weren't aware of anything great that already exists, but we had
      some ideas for the future. Specifically, I would love to have
      step-by-step walkthroughs through kernel bugs with the core dumps
      and debug info available for download so that you can follow along
      with drgn.
- I may or may not be around for the meeting next month since I have a
  baby coming around then.

Thanks everyone!
