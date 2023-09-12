Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B9A5CA0ECA
	for <linux-debuggers@archiver.kernel.org>; Tue, 12 Sep 2023 08:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbjILI10 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 12 Sep 2023 04:27:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43516 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232520AbjILI1X (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 12 Sep 2023 04:27:23 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 88834B9
        for <linux-debuggers@vger.kernel.org>; Tue, 12 Sep 2023 01:26:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1694507194;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=Jhmke+dGn8Kyd2GVWFpaViofWfgkfL6LGx7bEbBVGW4=;
        b=FLsvBRfn/oKDM5wl60An3nwJAH2i6+Ej/ZjDtovnq32ZvAgDrP9z1+pE/Uhylt8PZJ6bIb
        DbalN0Lteo7H3GgsRa/2iF2vZYBLGsHRAlLNCO8P/uT9a5BkqiEKv3kTOVh07TMho3v8Fx
        g0S9TxR18LLFKLgFcOxkAE4iaF9NiFY=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-49-x81DcOawMm-pFJ7Hcrt9fA-1; Tue, 12 Sep 2023 04:26:31 -0400
X-MC-Unique: x81DcOawMm-pFJ7Hcrt9fA-1
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id A65F6101FAA0;
        Tue, 12 Sep 2023 08:26:30 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.38])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id BBCF87B62;
        Tue, 12 Sep 2023 08:26:28 +0000 (UTC)
Date:   Tue, 12 Sep 2023 09:26:26 +0100
From:   Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To:     =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc:     Stephen Brennan <stephen.s.brennan@oracle.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        joao.m.martins@oracle.com,
        Richard Henderson <richard.henderson@linaro.org>,
        Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH qemu 2/2] dump: Only use the makedumpfile flattened
 format when necessary
Message-ID: <ZQAgsmXRYFqRx7dI@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230717163855.7383-1-stephen.s.brennan@oracle.com>
 <20230717163855.7383-3-stephen.s.brennan@oracle.com>
 <CAJ+F1C+VFpU=xpqOPjJU1VLt4kofVqV8EN4pj5MjkkwWvVuxZw@mail.gmail.com>
 <87edl4d9wi.fsf@oracle.com>
 <87fs4aha4t.fsf@oracle.com>
 <CAJ+F1CKCdy3J8AD9EGvVO+CU6-yFPrLZ2Lum1SDgdj_kghFdQw@mail.gmail.com>
 <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.5
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Tue, Sep 12, 2023 at 10:34:04AM +0400, Marc-André Lureau wrote:
> Hi
> 
> On Wed, Aug 23, 2023 at 2:03 PM Marc-André Lureau
> <marcandre.lureau@gmail.com> wrote:
> >
> > Hi
> >
> > On Wed, Aug 23, 2023 at 4:31 AM Stephen Brennan
> > <stephen.s.brennan@oracle.com> wrote:
> > >
> > > Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> > > > Marc-André Lureau <marcandre.lureau@gmail.com> writes:
> > > >> I am a bit reluctant to change the dump format by default. But since the
> > > >> flatten format is more "complicated" than the "normal" format, perhaps we
> > > >> can assume all users will handle it.
> > > >>
> > > >> The change is probably late for 8.1 though..
> > > >
> > > > Thank you for your review and testing!
> > > >
> > > > I totally understand the concern about making the change by default. I
> > > > do believe that nobody should notice too much because the normal format
> > > > should be easier to work with, and more broadly compatible. I don't know
> > > > of any tool which deals with the flattened format that can't handle the
> > > > normal format, except for "makedumpfile -R" itself.
> > > >
> > > > If it's a blocker, I can go ahead and add a new flag to the command to
> > > > enable the behavior. However there are a few good justifications not to
> > > > add a new flag. I think it's going to be difficult to explain the
> > > > difference between the two formats in documentation, as the
> > > > implementation of the formats is a bit "into the weeds". The libvirt API
> > > > also specifies each format separately (kdump-zlib, kdump-lzo,
> > > > kdump-snappy) and so adding several new options there would be
> > > > unfortunate for end-users as well.
> > > >
> > > > At the end of the day, it's your judgment call, and I'll implement it
> > > > how you prefer.
> > >
> > > I just wanted to check back on this to clarify the next step. Are you
> > > satisfied with this and waiting to apply it until the right time? Or
> > > would you prefer me to send a new version making this opt-in?
> > >
> >
> > Nobody seems to raise concerns. If it would be just me, I would change
> > it. But we should rather be safe, so let's make it this opt-in please.
> 
> Alex, Daniel, Thomas .. Do you have an opinion on changing the dump format?

I think it is a bad idea for the command to output data in a different
format, silently switching based on whether it is passed a pipe or and
file FD.

Libvirt may pass either a plain file FD or a pipe FD, depending on
whether the user set the VIR_DUMP_BYPASS_CACHE API flag. IMHO it
is unacceptable for that to result in a change of data format as a
silent side effect.

Looking back at the history, the patches originally did NOT use the
flatten makedumpfile format, but to ensure it was able to work with
non-seekable files, it jumped through hoops to write to a temporary
file first process it and then write to the real file. Switching to
makedumpfile format was to enable it to avoid temp files and always
be compatible with non-seekable FDs.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

