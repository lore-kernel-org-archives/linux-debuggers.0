Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B4CCCD37B0
	for <linux-debuggers@archiver.kernel.org>; Mon, 18 Sep 2023 12:12:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241853AbjIRMM3 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 18 Sep 2023 08:12:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50834 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242045AbjIRMMR (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 18 Sep 2023 08:12:17 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 685EDFF
        for <linux-debuggers@vger.kernel.org>; Mon, 18 Sep 2023 05:10:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695039041;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=Di1DbymDlRuVr74aSXrGgFG7BrXnrGaVV92M3e3e9qg=;
        b=b9DZMAbgLkOfMF43YcBmdmkPFczxMu8nQf7lxaGKvMyl+qKZ5bedJiaUhGM35iynxoE7vC
        hXYBd3dwqXg46wO8W2TftYYHKMRIBUCtykmv2whNLoS8GCCVxuUitwl5KSF4xZpUhk2y+g
        HiqgikVBfYhEdu3Me4Sj7+CPgMyea8c=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-563--Q7N5OjAMgWciZst-nBeig-1; Mon, 18 Sep 2023 08:10:36 -0400
X-MC-Unique: -Q7N5OjAMgWciZst-nBeig-1
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 5B05229AA3B0;
        Mon, 18 Sep 2023 12:10:35 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.114])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id 7A1D110D14C7;
        Mon, 18 Sep 2023 12:10:34 +0000 (UTC)
Date:   Mon, 18 Sep 2023 13:10:31 +0100
From:   Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
        Omar Sandoval <osandov@osandov.com>,
        Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 qemu 0/3] Allow dump-guest-memory to output standard
 kdump format
Message-ID: <ZQg+NzzKrigE0rG0@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230914010315.945705-1-stephen.s.brennan@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914010315.945705-1-stephen.s.brennan@oracle.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.3
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Wed, Sep 13, 2023 at 06:03:12PM -0700, Stephen Brennan wrote:
> Hello all,
> 
> This is the second version of my patch series about the kdump format,
> you can see the first version here [1].
> 
> The current output format for dump-guest-memory's kdump compressed
> format is actually the "makedumpfile flattened" format. It was done
> intentionally to allow the flexibility to write to non-seekable file
> descriptors, like pipes [2], without using temporary files. Currently
> libvirt uses this ability when VIR_DUMP_BYPASS_CACHE flag is set, to
> avoid the dump process using page cache. The standard kdump output
> format needs the page cache so that it can seek back and forth as part
> of writing the dump file.
> 
> So the default kdump dump format cannot be changed to the standard
> format. This patch series adds the ability to use the standard format,
> and adds a QMP / HMP argument to enable it.
> 
> An open question for Daniel et al.:
> 
> Would it be possible to make flattened the default only for libvirt? I
> totally agree that this would be a bad backward incompatible change
> there. But for QMP / HMP commands, I think using the standard, broadly
> compatible format as the default is important for user friendliness. If
> a user needs to know the difference between flavors of kdump formats
> like the flattened format, in order to set the correct option, then
> we've already lost.

The default is 'elf' - any use of kdump formats is already an opt-in,
and with the new kdump variants represented as enums, the user can
just specify which they want explicitly.


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

