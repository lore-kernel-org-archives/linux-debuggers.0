Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCF931EB2F
	for <linux-debuggers@vger.kernel.org>; Thu,  2 Jan 2025 13:57:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.15.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735826263; cv=none; b=cD4yNMuSBchw65x7Hnv3K6DKn5iDL7AV8CaXbN7pPHLxuj7ex4j0ltTCJnoEr6tthp2cf9mignX3BUmp2lHUgrjkYT7pR1RrG/ZOyskAlEb6cbXFwDHkqHX6LVFGRLDNDbiTkR8MrBoZqJkVtvOKrNvorzWsLMyM81VNKAWExVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735826263; c=relaxed/simple;
	bh=FVDc5zh9SlbOh+CNBfbxDE6cJTxO/JS3T2KP7eyeC4Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YAMLEzU6OTSxxKD/Kc1REUsa5TDqhsSbGAThp2QSmLlCJLQRmH4NNv4k2T8pQwgqBTE1Odt4k2Ea7ymMPKBqv4GZzNvRKX5WCi09rErWXsHq9Wd35DeIXOZ0pzp46um1/yPr7ZZx5mhy+LtwhI2Qad396X0hRhZevWJLc20JmTo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=U96nAYqx; arc=none smtp.client-ip=37.205.15.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="U96nAYqx"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-b985-910f-39e1-703f.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:b985:910f:39e1:703f])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 0B4251F0FBA;
	Thu,  2 Jan 2025 14:57:35 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1735826256; bh=FVDc5zh9SlbOh+CNBfbxDE6cJTxO/JS3T2KP7eyeC4Y=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=U96nAYqxNqCOShQt9ckYo5GHqBKu+qgMiJbs+sVIchi+2pt8URnS+lgbTrHo7M9pG
	 aanLq9qtLSXLMCJfrrSfw87XmjOan+m62Lmpoq5Mb4bMrQHdm+8YXg+HEg204xln73
	 THPIIB4I9ujsw4nYtTd6gRIPe4bbHZpEfKWjFK6wQ1/C5FT8e4E9hEDbuKSMbBEANU
	 NNIcDucrIrQ2F8AYPgD0CkFP2kaT53S6kMDZeDlBrMeqUvITFYXj6ZD/hRpvS2mzRY
	 wsO8IrNegmi0pE96djUd6R+loJpgGs90zBobwsNdSd6C+p6nsZ1WZphYfFCj7kmwl5
	 Y3xBe2PYwA0ZA==
Date: Thu, 2 Jan 2025 14:57:28 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Christian Heusel <gromit@archlinux.org>
Cc: Stephen Brennan <stephen@brennan.io>, linux-debuggers@vger.kernel.org,
 Omar Sandoval <osandov@osandov.com>
Subject: Re: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
Message-ID: <20250102145728.0c61ed68@meshulam.tesarici.cz>
In-Reply-To: <3eb3a0bd-232e-4015-8793-71b1662040ba@heusel.eu>
References: <875xmxljst.fsf@brennan.io>
	<8734i1lips.fsf@brennan.io>
	<3eb3a0bd-232e-4015-8793-71b1662040ba@heusel.eu>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/Czh70nhwcvAGbmvmM_tCl/z";
 protocol="application/pgp-signature"; micalg=pgp-sha512

--Sig_/Czh70nhwcvAGbmvmM_tCl/z
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Thu, 2 Jan 2025 09:57:52 +0100
Christian Heusel <gromit@archlinux.org> wrote:

> On 25/01/02 12:31AM, Stephen Brennan wrote:
> > Stephen Brennan <stephen@brennan.io> writes: =20
> > > Hi Christian, =20
>=20
> Hey Stephen,
>=20
> > >
> > > I think you may already be aware of this, but I wanted to let you know
> > > that there's an incompatibility with drgn 0.0.30-2 and libkdumpfile
> > > 0.5.5-1 on Arch. libkdumpfile 0.5.5 changed some APIs in a
> > > backward-incompatible way. Building drgn against the new version fail=
s,
> > > and running a version built against 0.5.4 of course fails due to the
> > > soname change. The current drgn 0.0.30-2 on Arch's repositories was
> > > built against 0.5.4. =20
>=20
> I was not yet aware of this!
>=20
> > >
> > > Thus a user installing drgn & libkdumpfile on Arch, who is fully
> > > up-to-date, gets this:
> > >
> > > ImportError: libkdumpfile.so.10: cannot open shared object file: No s=
uch file or directory
> > >
> > > The incompatibility is fixed in drgn's main branch by the changes in
> > > [1]. Unfortunately, that was merged after drgn 0.0.30 was released.
> > > Some major changes have been merged since then, so I don't think a
> > > 0.0.31 release is likely for a few months. So I think it may be a good
> > > idea to carry the two commits in [1] as downstream patches in a new
> > > 0.0.30-3 release. I'd be happy to implement those changes if it'd hel=
p.
> > >
> > > I'm Ccing the linux-debuggers mailing list for posterity, as well as
> > > Omar and Petr as an FYI.
> > >
> > > Thanks,
> > > Stephen
> > >
> > > [1]: https://github.com/osandov/drgn/pull/452 =20
> >=20
> >=20
> > Sorry, I was a bit mistaken here:
> >=20
> > 1. drgn 0.0.30 DOES build successfully with libkdumpfile 0.5.5. I
> > misread the changes there. As far as I can tell, there may be a small
> > memory leak when using 0.0.30 with 0.5.5, but nothing major.
> >=20
> > 2. I'd say the best way forward would be a simple rebuild of drgn
> > against libkdumpfile 0.5.5.
> >=20
> > Thanks,
> > Stephen =20
>=20
> thanks for your report and suggestions to fix the underlying issue! It
> turns out I somehow missed the soname bump in libkdumpfile's last
> release (also I'm a bit annoyed that it had one in a patch release)
> ... =F0=9F=98=85

Hey, you may want to know that libkdumpfile (package) does not follow
any kind of semantic versioning rules. So, there's nothing like a
"patch release".

I will reconsider this approach with the release of v1.0, but that's
not planned until there is feature parity with the crash utility...

However, since some people have already found the library useful, I
maintain libtool versioning, which takes care of API and ABI updates
(and makes it possible to install multiple ABI-incompatible versions on
a single system).

Petr T

--Sig_/Czh70nhwcvAGbmvmM_tCl/z
Content-Type: application/pgp-signature
Content-Description: Digitální podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQR36mnYrQDNXFnn8/Pem5ZkryZSgUCZ3abSAAKCRDPem5ZkryZ
StocAQC2GeS/OU+U/x5jNOStb+fB5ehIYMfK+fvOW+Yfm5odPwEAv6zt9aNzw1AL
C9DVjO0YM9/VtqYC+yCFUomG3G9EnAw=
=VROQ
-----END PGP SIGNATURE-----

--Sig_/Czh70nhwcvAGbmvmM_tCl/z--
