Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com [136.143.188.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6464E82899
	for <linux-debuggers@vger.kernel.org>; Thu,  2 Jan 2025 17:22:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735838557; cv=pass; b=KasIzejCe+twi6GDSW4vj9JzudBEZIrr9lajX/QW6rubDLNtFcmMSMAwC7U/i1xvAtdCfpLe1T8e8IZnK4Bh7/qJ9Q0hCrdOLfnQJrY5kUIcjTfD0HDuldQDe6Fs4zzIf2/JJ4gdXbmjyKFQRkAGPU8j24F1Oa6NAy/TMDFRsIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735838557; c=relaxed/simple;
	bh=JJRiEyWt6zC8bUlUZuORcbG8htL99l6mUUWYjEgqiAo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=hDv9Mw8lPlm8astrxxuM80Cfh1Ab5G+g5gQ8dG/Jl5KU3S/D1T7qP0xypQoxUUzHAaTKRpcn+Oc5T86GpLnXSZfhEyHByrRGFWbBwgCwkMvOGjut58c0aKtCGAdIZO26WNJjJaYb3G+z6br/oR9AMZvqRiY0u57vrjhO2h6tsmE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brennan.io; spf=pass smtp.mailfrom=brennan.io; dkim=pass (1024-bit key) header.d=brennan.io header.i=stephen@brennan.io header.b=PVxrrqjV; arc=pass smtp.client-ip=136.143.188.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brennan.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brennan.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=brennan.io header.i=stephen@brennan.io header.b="PVxrrqjV"
ARC-Seal: i=1; a=rsa-sha256; t=1735838545; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TEnjnyMKjCQXXxr2hS3m+dL5DNBHXJCGVcssGNcUuK4r1+VNPLARt1Ep8WZvShRGj9dgbQiyhaolBfsunghPI4RMmJtSfHZpXTB/LIkqV7/aA06pFeXMFRUns9JCdHirtH0vy67trxVqYxdBQayNzcPMRY0uBtmlqdydooqh5/0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735838545; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=JJRiEyWt6zC8bUlUZuORcbG8htL99l6mUUWYjEgqiAo=; 
	b=KSHcLDGu2DHgfU/DiSxB+mA16kKQZRlAgZOSQmNkqdfDQuuphJ2Z0NA5hS2E/RSwsyDsea7jeOEWkR23//SkFXe5pBeATZfxPOkRC4U6rMKh9nb0U0+o9bdLC3c1xiw77vKj3vTmiEKwdlum2gpZiokLofDxfrEmc4biYki8Idc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=brennan.io;
	spf=pass  smtp.mailfrom=stephen@brennan.io;
	dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735838545;
	s=selector01; d=brennan.io; i=stephen@brennan.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:References:Date:Date:Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=JJRiEyWt6zC8bUlUZuORcbG8htL99l6mUUWYjEgqiAo=;
	b=PVxrrqjV1tDBCJPeoFANJV1oUK/IYRkj2hw5zYUqERJZD8WGj6MDndWv3beMGTlG
	mFuSNVbJyH93EptWYT/bhtSLemcq4N4kduA+dfpOq5CVMsGnhEmtnMTq7wEPzY5LDgr
	wo0x4b4bsF7XaQg0CVb80U/VHFItHEkl2S2GuMgE=
Received: by mx.zohomail.com with SMTPS id 1735838543320615.6317627709893;
	Thu, 2 Jan 2025 09:22:23 -0800 (PST)
From: Stephen Brennan <stephen@brennan.io>
To: Christian Heusel <gromit@archlinux.org>
Cc: linux-debuggers@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
 Petr Tesarik <petr@tesarici.cz>
Subject: Re: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
In-Reply-To: <3eb3a0bd-232e-4015-8793-71b1662040ba@heusel.eu>
References: <875xmxljst.fsf@brennan.io> <8734i1lips.fsf@brennan.io>
 <3eb3a0bd-232e-4015-8793-71b1662040ba@heusel.eu>
Date: Thu, 02 Jan 2025 09:22:22 -0800
Message-ID: <87zfk9jfld.fsf@brennan.io>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ZohoMailClient: External

Christian Heusel <gromit@archlinux.org> writes:
> On 25/01/02 12:31AM, Stephen Brennan wrote:
>> Stephen Brennan <stephen@brennan.io> writes:
>> > Hi Christian,
>
> Hey Stephen,
>
>> >
>> > I think you may already be aware of this, but I wanted to let you know
>> > that there's an incompatibility with drgn 0.0.30-2 and libkdumpfile
>> > 0.5.5-1 on Arch. libkdumpfile 0.5.5 changed some APIs in a
>> > backward-incompatible way. Building drgn against the new version fails,
>> > and running a version built against 0.5.4 of course fails due to the
>> > soname change. The current drgn 0.0.30-2 on Arch's repositories was
>> > built against 0.5.4.
>
> I was not yet aware of this!
>
>> >
>> > Thus a user installing drgn & libkdumpfile on Arch, who is fully
>> > up-to-date, gets this:
>> >
>> > ImportError: libkdumpfile.so.10: cannot open shared object file: No su=
ch file or directory
>> >
>> > The incompatibility is fixed in drgn's main branch by the changes in
>> > [1]. Unfortunately, that was merged after drgn 0.0.30 was released.
>> > Some major changes have been merged since then, so I don't think a
>> > 0.0.31 release is likely for a few months. So I think it may be a good
>> > idea to carry the two commits in [1] as downstream patches in a new
>> > 0.0.30-3 release. I'd be happy to implement those changes if it'd help.
>> >
>> > I'm Ccing the linux-debuggers mailing list for posterity, as well as
>> > Omar and Petr as an FYI.
>> >
>> > Thanks,
>> > Stephen
>> >
>> > [1]: https://github.com/osandov/drgn/pull/452
>>=20
>>=20
>> Sorry, I was a bit mistaken here:
>>=20
>> 1. drgn 0.0.30 DOES build successfully with libkdumpfile 0.5.5. I
>> misread the changes there. As far as I can tell, there may be a small
>> memory leak when using 0.0.30 with 0.5.5, but nothing major.
>>=20
>> 2. I'd say the best way forward would be a simple rebuild of drgn
>> against libkdumpfile 0.5.5.
>>=20
>> Thanks,
>> Stephen
>
> thanks for your report and suggestions to fix the underlying issue! It
> turns out I somehow missed the soname bump in libkdumpfile's last
> release (also I'm a bit annoyed that it had one in a patch release)
> ... =F0=9F=98=85
>
> Sorry for any trouble this has caused you, this should be fixed with
> drgn 0.0.30-3! Additionally to the rebuild I included the patch you
> suggested at first, as it applied easily and fixes the lifetime issue!

No trouble at all, and thanks for the quick turnaround. I've got the
update and verified it is working.

Happy new year!

Thanks,
Stephen

> Cheers,
> Chris
