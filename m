Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900B2CA5501
	for <linux-debuggers@archiver.kernel.org>; Wed, 13 Sep 2023 07:23:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235421AbjIMHX4 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 13 Sep 2023 03:23:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33622 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238572AbjIMHX4 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 13 Sep 2023 03:23:56 -0400
X-Greylist: delayed 2703 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Sep 2023 00:23:52 PDT
Received: from sender4-of-o51.zoho.com (sender4-of-o51.zoho.com [136.143.188.51])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 951F71728
        for <linux-debuggers@vger.kernel.org>; Wed, 13 Sep 2023 00:23:52 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694587121; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=DZzWWErpsiCQU8WLD5pvqu/JgfR9qZAja4dzed8+NeIls5RwzR6ayfJ9ufOmQs1MKIoQMETfb4+VU9zeXkkxMrTk+k9dlVfqmid3vb3Ugtnq9NF7g7clN1Vst+NZQcHpSnGq5EwxsucqTC2IOolPnTUiaK4tVDK2kSFBM4sCUcE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1694587121; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=dypCVOF/KKl70MOToLdCJ/V8ZHQzOGX4MdOyUG6jOUI=; 
        b=by9nW3dcxwSZfs0Pe+f8AAKaig9yJQtmP9kUFeMEouXALjpLxAF3VRnmrF78nGxLmZZ4mIfhLJBJxKK2dLPKfpTv4UcSRWNwYXiUpQVj2osjeka66iQ9IoJ0CmkmO/mC4Cr5jC6Vgbcol5gSHVpaNJykkL+Mdfx00hLTegVvdoQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=brennan.io;
        spf=pass  smtp.mailfrom=stephen@brennan.io;
        dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1694587121;
        s=selector01; d=brennan.io; i=stephen@brennan.io;
        h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:References:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=dypCVOF/KKl70MOToLdCJ/V8ZHQzOGX4MdOyUG6jOUI=;
        b=NfHssmDVmW191vVcrVzp8r38oXTZUl0wOh8EkrK4h85cd+5+zXCYZJUmOphEKBDR
        r7zZkznFNokDRUBe4AA1GIB7wYSMPWlOpcDByehSBf4nzZ1NPOhELWAGIiCC69KCAwd
        ZfNHRkwTKMm163m7/Cfh9JhNJ88qQMqVPt1DotIE=
Received: from localhost (136.24.52.195 [136.24.52.195]) by mx.zohomail.com
        with SMTPS id 1694587118513156.9937277734624; Tue, 12 Sep 2023 23:38:38 -0700 (PDT)
From:   Stephen Brennan <stephen@brennan.io>
To:     =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
        Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        "Daniel P. Berrange" <berrange@redhat.com>
Cc:     qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        joao.m.martins@oracle.com,
        Richard Henderson <richard.henderson@linaro.org>,
        Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH qemu 2/2] dump: Only use the makedumpfile flattened
 format when necessary
In-Reply-To: <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
References: <20230717163855.7383-1-stephen.s.brennan@oracle.com>
 <20230717163855.7383-3-stephen.s.brennan@oracle.com>
 <CAJ+F1C+VFpU=xpqOPjJU1VLt4kofVqV8EN4pj5MjkkwWvVuxZw@mail.gmail.com>
 <87edl4d9wi.fsf@oracle.com> <87fs4aha4t.fsf@oracle.com>
 <CAJ+F1CKCdy3J8AD9EGvVO+CU6-yFPrLZ2Lum1SDgdj_kghFdQw@mail.gmail.com>
 <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
Date:   Tue, 12 Sep 2023 23:38:38 -0700
Message-ID: <87a5tq8tn5.fsf@brennan.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:

> Hi
>
> On Wed, Aug 23, 2023 at 2:03=E2=80=AFPM Marc-Andr=C3=A9 Lureau
> <marcandre.lureau@gmail.com> wrote:
>>
>> Hi
>>
>> On Wed, Aug 23, 2023 at 4:31=E2=80=AFAM Stephen Brennan
>> <stephen.s.brennan@oracle.com> wrote:
>> >
>> > Stephen Brennan <stephen.s.brennan@oracle.com> writes:
>> > > Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>> > >> I am a bit reluctant to change the dump format by default. But sinc=
e the
>> > >> flatten format is more "complicated" than the "normal" format, perh=
aps we
>> > >> can assume all users will handle it.
>> > >>
>> > >> The change is probably late for 8.1 though..
>> > >
>> > > Thank you for your review and testing!
>> > >
>> > > I totally understand the concern about making the change by default.=
 I
>> > > do believe that nobody should notice too much because the normal for=
mat
>> > > should be easier to work with, and more broadly compatible. I don't =
know
>> > > of any tool which deals with the flattened format that can't handle =
the
>> > > normal format, except for "makedumpfile -R" itself.
>> > >
>> > > If it's a blocker, I can go ahead and add a new flag to the command =
to
>> > > enable the behavior. However there are a few good justifications not=
 to
>> > > add a new flag. I think it's going to be difficult to explain the
>> > > difference between the two formats in documentation, as the
>> > > implementation of the formats is a bit "into the weeds". The libvirt=
 API
>> > > also specifies each format separately (kdump-zlib, kdump-lzo,
>> > > kdump-snappy) and so adding several new options there would be
>> > > unfortunate for end-users as well.
>> > >
>> > > At the end of the day, it's your judgment call, and I'll implement it
>> > > how you prefer.
>> >
>> > I just wanted to check back on this to clarify the next step. Are you
>> > satisfied with this and waiting to apply it until the right time? Or
>> > would you prefer me to send a new version making this opt-in?
>> >
>>
>> Nobody seems to raise concerns. If it would be just me, I would change
>> it. But we should rather be safe, so let's make it this opt-in please.
>>
>>
>
> Alex, Daniel, Thomas .. Do you have an opinion on changing the dump forma=
t?
>
> Stephen, do you have a new version of the patches to make it opt-in?

Thanks for the reminder, I did have a start on the patches, but they're
not quite ready to share just yet. I'm learning about the QMP command
JSON schemas, which I'll need to update. I ended up receiving a new work
laptop which disrupted my work. I'll try to get a new patch series out
during my Wednesday (US Pacific time) workday.

Thanks,
Stephen
