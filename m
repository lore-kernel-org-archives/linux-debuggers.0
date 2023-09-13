Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AFDCECA5501
	for <linux-debuggers@archiver.kernel.org>; Wed, 13 Sep 2023 07:12:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238406AbjIMHMz (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 13 Sep 2023 03:12:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238367AbjIMHMz (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 13 Sep 2023 03:12:55 -0400
X-Greylist: delayed 1139 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Wed, 13 Sep 2023 00:12:50 PDT
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com [136.143.184.59])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D46871728
        for <linux-debuggers@vger.kernel.org>; Wed, 13 Sep 2023 00:12:50 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1694589160; cv=none; 
        d=zohomail.com; s=zohoarc; 
        b=ML4k+KNr34PeOi6vSbSME9LqkLMsGJSkN0nVEavPxh9ipTANwk6pizuTjjvjuR5PoA99cLudTcJUMyA+shOOZxEhA2bAiI1i2zKpSwf6qRueRIfapnqinqefHP5taN2N9CNnXUB+RMmNT4Kh9elt8gRSAplY3RBjMzhPU0/hNeM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
        t=1694589160; h=Content-Type:Content-Transfer-Encoding:Cc:Date:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:To; 
        bh=R9jx7h7Wlp8SjmQ2bQ0XZYmEG41I9nmnbkm7VbqtqVQ=; 
        b=GXLzdtURIdYc7cCGNCOIm6WSSkn/R/Qx/gwPJ1dZ//htwQj7lsB7n+fj6t0yFBVrKJqDXkZjpBuM1sbp97mJJph3K3KYvLJdM1iHA6WQOW1EqlL6TfnnfPbbzmks+Uu1HmnSsSpSU8jODZGq5810nFbjdNhYMrtxgmG6kcqVtc0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
        dkim=pass  header.i=brennan.io;
        spf=pass  smtp.mailfrom=stephen@brennan.io;
        dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1694589160;
        s=selector01; d=brennan.io; i=stephen@brennan.io;
        h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:References:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
        bh=R9jx7h7Wlp8SjmQ2bQ0XZYmEG41I9nmnbkm7VbqtqVQ=;
        b=fqn72z6wEtgYpSHxqPdvQAvPrivWcTKScxVo4b7CQq64Jgpn/9Ke3au2lm9Eb1IZ
        ygYqFCvBISPtqenOKLoe2ZqRgkLAQnAQDQcFW0UfutYXRRSlLgmtqUhDxnaU7RLgeDU
        K5IvNSaVsa2LvtrM+xcCNavbQDy1Hq3ZioinIRgM=
Received: from localhost (136.24.52.195 [136.24.52.195]) by mx.zohomail.com
        with SMTPS id 1694589158185197.96495829829678; Wed, 13 Sep 2023 00:12:38 -0700 (PDT)
From:   Stephen Brennan <stephen@brennan.io>
To:     =?utf-8?Q?Daniel_P=2E_Berrang=C3=A9?= <berrange@redhat.com>,
        =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>
Cc:     Alex =?utf-8?Q?Benn=C3=A9e?= <alex.bennee@linaro.org>,
        qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        joao.m.martins@oracle.com,
        Richard Henderson <richard.henderson@linaro.org>,
        Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH qemu 2/2] dump: Only use the makedumpfile flattened
 format when necessary
In-Reply-To: <ZQAgsmXRYFqRx7dI@redhat.com>
References: <20230717163855.7383-1-stephen.s.brennan@oracle.com>
 <20230717163855.7383-3-stephen.s.brennan@oracle.com>
 <CAJ+F1C+VFpU=xpqOPjJU1VLt4kofVqV8EN4pj5MjkkwWvVuxZw@mail.gmail.com>
 <87edl4d9wi.fsf@oracle.com> <87fs4aha4t.fsf@oracle.com>
 <CAJ+F1CKCdy3J8AD9EGvVO+CU6-yFPrLZ2Lum1SDgdj_kghFdQw@mail.gmail.com>
 <CAJ+F1CK0PTM-wHaK90EiuvvsG5OBVXQ4X8iV-AbBxdc6_=RvPQ@mail.gmail.com>
 <ZQAgsmXRYFqRx7dI@redhat.com>
Date:   Wed, 13 Sep 2023 00:12:37 -0700
Message-ID: <875y4e8s2i.fsf@brennan.io>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Daniel P. Berrang=C3=A9 <berrange@redhat.com> writes:
> On Tue, Sep 12, 2023 at 10:34:04AM +0400, Marc-Andr=C3=A9 Lureau wrote:
>> Hi
>>=20
>> On Wed, Aug 23, 2023 at 2:03=E2=80=AFPM Marc-Andr=C3=A9 Lureau
>> <marcandre.lureau@gmail.com> wrote:
>> >
>> > Hi
>> >
>> > On Wed, Aug 23, 2023 at 4:31=E2=80=AFAM Stephen Brennan
>> > <stephen.s.brennan@oracle.com> wrote:
>> > >
>> > > Stephen Brennan <stephen.s.brennan@oracle.com> writes:
>> > > > Marc-Andr=C3=A9 Lureau <marcandre.lureau@gmail.com> writes:
>> > > >> I am a bit reluctant to change the dump format by default. But si=
nce the
>> > > >> flatten format is more "complicated" than the "normal" format, pe=
rhaps we
>> > > >> can assume all users will handle it.
>> > > >>
>> > > >> The change is probably late for 8.1 though..
>> > > >
>> > > > Thank you for your review and testing!
>> > > >
>> > > > I totally understand the concern about making the change by defaul=
t. I
>> > > > do believe that nobody should notice too much because the normal f=
ormat
>> > > > should be easier to work with, and more broadly compatible. I don'=
t know
>> > > > of any tool which deals with the flattened format that can't handl=
e the
>> > > > normal format, except for "makedumpfile -R" itself.
>> > > >
>> > > > If it's a blocker, I can go ahead and add a new flag to the comman=
d to
>> > > > enable the behavior. However there are a few good justifications n=
ot to
>> > > > add a new flag. I think it's going to be difficult to explain the
>> > > > difference between the two formats in documentation, as the
>> > > > implementation of the formats is a bit "into the weeds". The libvi=
rt API
>> > > > also specifies each format separately (kdump-zlib, kdump-lzo,
>> > > > kdump-snappy) and so adding several new options there would be
>> > > > unfortunate for end-users as well.
>> > > >
>> > > > At the end of the day, it's your judgment call, and I'll implement=
 it
>> > > > how you prefer.
>> > >
>> > > I just wanted to check back on this to clarify the next step. Are you
>> > > satisfied with this and waiting to apply it until the right time? Or
>> > > would you prefer me to send a new version making this opt-in?
>> > >
>> >
>> > Nobody seems to raise concerns. If it would be just me, I would change
>> > it. But we should rather be safe, so let's make it this opt-in please.
>>=20
>> Alex, Daniel, Thomas .. Do you have an opinion on changing the dump form=
at?
>
> I think it is a bad idea for the command to output data in a different
> format, silently switching based on whether it is passed a pipe or and
> file FD.

You say that, but this exactly describes the default behavior of
makedumpfile. That may not make it *good* design, but it's at least a
point in favor of consistency =3D)

> Libvirt may pass either a plain file FD or a pipe FD, depending on
> whether the user set the VIR_DUMP_BYPASS_CACHE API flag. IMHO it
> is unacceptable for that to result in a change of data format as a
> silent side effect.
>
> Looking back at the history, the patches originally did NOT use the
> flatten makedumpfile format, but to ensure it was able to work with
> non-seekable files, it jumped through hoops to write to a temporary
> file first process it and then write to the real file. Switching to
> makedumpfile format was to enable it to avoid temp files and always
> be compatible with non-seekable FDs.

Thanks for taking a look at the history, this is something I should have
done. The patches need some historical footing for context. My next
series will include better investigation on the history.

That said, the flattened format is quite a compromise for users, given
that it is far less compatible, and users are given absolutely no
warning that the advertised "kdump" format is actually a format in need
of repair by way of "makedumpfile -R". As it is, we are sacrificing the
common case (writing a broadly compatible, non-flattened core dump) on
the altar of what seems like a special case (using pipes to avoid the
page cache).

I don't have the experience with the Qemu project to say what is the
best for the project, so I leave it in your capable hands. And
ultimately, relitigating the past is irrelevant. There are existing
users who will be broken if we silently change the format based on
seekability, so I can see why it is a non-starter. It's just frustrating
that now, users will need to opt-in to enable the broadly compatible
option which should have been the default in the first place.

Rgeardless, it sounds like the way forward will be to use a flag to opt
into the "non-flattened" format behavior. I'll try to get that out
tomorrow!

Thanks,
Stephen

> With regards,
> Daniel
> --=20
> |: https://berrange.com      -o-    https://www.flickr.com/photos/dberran=
ge :|
> |: https://libvirt.org         -o-            https://fstop138.berrange.c=
om :|
> |: https://entangle-photo.org    -o-    https://www.instagram.com/dberran=
ge :|
