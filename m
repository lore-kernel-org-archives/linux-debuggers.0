Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6D85EE7D0C2
	for <linux-debuggers@archiver.kernel.org>; Fri, 22 Sep 2023 03:07:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229609AbjIVDHS (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Thu, 21 Sep 2023 23:07:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229476AbjIVDHR (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Thu, 21 Sep 2023 23:07:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C1FA08F
        for <linux-debuggers@vger.kernel.org>; Thu, 21 Sep 2023 20:06:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695351986;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=F8H6TjO+Bbw2lg6kY6367tlLHXF7ti8mu8AOnn6bhwk=;
        b=GBK4dFsMKUY+dqkX/yYHr7RYaSfWJbO/MuXmkZ/fEKDUEMfXbmXMarl2gTGVg9BVEnZhQU
        ODtgXYMf0bR6fgkd3GND/v1pqKskz+f9Xq6PgqVDuiVJL6j/lHfrTQa27yKyBiPuCT+OYX
        AI1GMK3/zltPwQfrpcLLyRrumPiwNqA=
Received: from mail-io1-f72.google.com (mail-io1-f72.google.com
 [209.85.166.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-395-85RU2FciOceuW-Lx_Z60cg-1; Thu, 21 Sep 2023 23:06:22 -0400
X-MC-Unique: 85RU2FciOceuW-Lx_Z60cg-1
Received: by mail-io1-f72.google.com with SMTP id ca18e2360f4ac-79f9ef9b91eso2675039f.1
        for <linux-debuggers@vger.kernel.org>; Thu, 21 Sep 2023 20:06:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695351982; x=1695956782;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F8H6TjO+Bbw2lg6kY6367tlLHXF7ti8mu8AOnn6bhwk=;
        b=uERnKsyG3xSKn0CAPZuo+1GS0QCtBeRXf54CyUzeGM/GjfEp9hX+ZTkCBL2L89uXWM
         MQrG2EYVBItw5YSOicEZFUCEdWkOYC128qykZZnhC5SHUvnb/3AMrMvctbW7dz6v8TGr
         bq202UtyLGq5lIHgoa80ucPPjexjVmWgpQbhv3ICt0SPmKdBEd1Q/oRlHgoiXZV8AVKr
         vjncMP3Ww2Bl1LCb4EoSkF07WFla+eXonrmHYOfAa2mSST7lYYFrbfft3eXWIISi/nNe
         ZQ2H9XziOB65xN7o7DzuthOtbCPMojZFEupgQMjxQXczSgKSuTpoqpZ9/uo7+CbRjYWf
         4dJw==
X-Gm-Message-State: AOJu0Yyi7jpnJoM8NfnJyUi/S3c6EbfnM8jEBwpmbalYgua4limuVRxY
        9YlmVwRZE2aoS0XnucMyIa/SJA8zBJDX5oWtH62EVwjfhQGkzWsS0MyRiMb7hmE+kHS24C+bmYF
        qE2atQz7SkRmQmRZyydc9JcDrfa9zWeOEUQvIMaGWyZyyZkZMZRNYOKs=
X-Received: by 2002:a92:c147:0:b0:34f:36ae:e8c3 with SMTP id b7-20020a92c147000000b0034f36aee8c3mr7526320ilh.1.1695351981826;
        Thu, 21 Sep 2023 20:06:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFvz1i4sXuMRTWdYmjqhJuAejCUEXw9PjB2rQdl06U40zDY2TiiusgaS1xni/SoxhF+LgPt4+wjjN/X4H+sPjw=
X-Received: by 2002:a92:c147:0:b0:34f:36ae:e8c3 with SMTP id
 b7-20020a92c147000000b0034f36aee8c3mr7526310ilh.1.1695351981523; Thu, 21 Sep
 2023 20:06:21 -0700 (PDT)
MIME-Version: 1.0
References: <87h6nqxdth.fsf@oracle.com> <ZQqj9tFS7cLMTkHv@jondnuc>
 <87edisycgu.fsf@oracle.com> <87bkdwyc3v.fsf@oracle.com>
In-Reply-To: <87bkdwyc3v.fsf@oracle.com>
From:   Dave Young <dyoung@redhat.com>
Date:   Fri, 22 Sep 2023 11:06:01 +0800
Message-ID: <CALu+AoTJXtnS8dV-uL_Ov0CEYq1YTX7KTuOSwFdo+1tNB8hqJw@mail.gmail.com>
Subject: Re: Concerns regarding e17bebd049 ("dump: Set correct vaddr for ELF dump")
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     Jon Doron <arilou@gmail.com>, qemu-devel@nongnu.org,
        linux-debuggers@vger.kernel.org,
        =?UTF-8?B?TWFyYy1BbmRyw6kgTHVyZWF1?= <marcandre.lureau@redhat.com>,
        Laszlo Ersek <lersek@redhat.com>,
        "Discussion list for crash utility usage, maintenance and development" 
        <crash-utility@redhat.com>, Lianbo Jiang <lijiang@redhat.com>,
        =?UTF-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+IOS4gOS7gSk=?= 
        <k-hagio-ab@nec.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Not sure if crash people subscribed to linux-debuggers, let's add more
cc for awareness about this thread.

On Thu, 21 Sept 2023 at 01:45, Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> > Hi Jon,
> >
> > Jon Doron <arilou@gmail.com> writes:
> >> Hi Stephen,
> >> Like you have said the reason is as I wrote in the commit message,
> >> without "fixing" the vaddr GDB is messing up mapping and working with
> >> the generated core file.
> >
> > For the record I totally love this workaround :)
> >
> > It's clever and gets the job done and I would have done it in a
> > heartbeat. It's just that it does end up making vmcores that have
> > incorrect data, which is a pain for debuggers that are actually designed
> > to look at kernel core dumps.
> >
> >> This patch is almost 4 years old, perhaps some changes to GDB has been
> >> introduced to resolve this, I have not checked since then.
> >
> > Program Headers:
> >   Type           Offset             VirtAddr           PhysAddr
> >                  FileSiz            MemSiz              Flags  Align
> >   NOTE           0x0000000000000168 0x0000000000000000 0x0000000000000000
> >                  0x0000000000001980 0x0000000000001980         0x0
> >   LOAD           0x0000000000001ae8 0x0000000000000000 0x0000000000000000
> >                  0x0000000080000000 0x0000000080000000         0x0
> >   LOAD           0x0000000080001ae8 0x0000000000000000 0x00000000fffc0000
> >                  0x0000000000040000 0x0000000000040000         0x0
> >
> > (gdb) info files
> > Local core dump file:
> >         `/home/stepbren/repos/test_code/elf/dumpfile', file type elf64-x86-64.
> >         0x0000000000000000 - 0x0000000080000000 is load1
> >         0x0000000000000000 - 0x0000000000040000 is load2
> >
> > $ gdb --version
> > GNU gdb (GDB) Red Hat Enterprise Linux 10.2-10.0.2.el9
> > Copyright (C) 2021 Free Software Foundation, Inc.
> > License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
> > This is free software: you are free to change and redistribute it.
> > There is NO WARRANTY, to the extent permitted by law.
> >
> >
> > It doesn't *look like* anything has changed in this version of GDB. But
> > I'm not really certain that GDB is expected to use the physical
> > addresses in the load segments: it's not a kernel debugger.
> >
> > I think hacking the p_vaddr field _is_ the way to get GDB to behave in
> > the way you want: allow you to read physical memory addresses.
> >
> >> As I'm no longer using this feature and have not worked and tested it
> >> in a long while, so I have no obligations to this change, but perhaps
> >> someone else might be using it...
> >
> > I definitely think it's valuable for people to continue being able to
> > use QEMU vmcores generated with paging=off in GDB, even if GDB isn't
> > desgined for it. It seems like a useful hack that appeals to the lowest
> > common denominator: most people have GDB and not a purpose-built kernel
> > debugger. But maybe we could point to a program like the below that will
> > tweak the p_paddr field after the fact, in order to appeal to GDB's
> > sensibilities?
>
> And of course I sent the wrong copy of the file. Attached is the program
> I intended to send (which properly handles endianness and sets the vaddr
> as expected).
>

