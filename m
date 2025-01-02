Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333321AAA1C
	for <linux-debuggers@vger.kernel.org>; Thu,  2 Jan 2025 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735827218; cv=none; b=LQs5yY7MT2Pr+kJw0bfO13m7Vw5/08e+QO+2mzi3zBYHWcKmywBybBHo/+pxXo0eKCejPQoT1zXVgJJyIW7+PcHQuzBF8682k7/kyYLoij0K6tK93F5b5vp+9LtAAXXrAuODgcXJ1PlAuNg1b9VQbe88NtBmPApEJFD7EkBpVZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735827218; c=relaxed/simple;
	bh=eQgE7jMsgWtTRa2j/qj82uYSN2kWP9S0DQuVvyQCt1k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qRZd4VhRsBmtq0f4r4XqnNtWxCdbYcOI1d0b0dy3di4Uv3SuKqVD06UhNruxWfWHOHKPDIMMr7NiEKgK4AAVONa+g5AJB+0Rcm6GNbWLu2gB4U6loLWd8OLPOrQtoRvbPOcOqoSp/Ifygok9paoyVRg+rGv87R04Q6b34VbgbWM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=FS7hsc2n; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=98xa9Ffs; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="FS7hsc2n";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="98xa9Ffs"
Date: Thu, 2 Jan 2025 15:13:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1735827212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sM4m+Xtf/BwMEi22BUSnyiKTn9tsnS+jHZ7cn9qpCU=;
	b=FS7hsc2njfRsXLdx+UFv5IpEJkshUSANKID7lCKuiO9Z4kn/kPsjtlhol8tAwhNkyVMRzT
	DgveoUOMfGx9HwQa2BAREAoAJ/uz5NDo0sbBx9dA/JBw8niBnYc2axS5Qnip/kGCQ+ax3R
	01QoNV4MAT+c5Yxr71dGEygq6BcvRgBIgY45LCcKXcOY9DMNGah8SLKEwclmX+Aqj0SIMP
	zz4UyPyekC3jQO2QlznHqTSrllvRJUESkoFvg6g+YYNqw/L78Bfo5GBlZjXAwn/9Yw0Ls2
	UyGtaEmhiAVucD+pX8C/u5oI25C6V9aznSpPBIU+79GE3JH6IpTKSLDGI7sCio2nOfEJi+
	8aXsR9ztGruHZouSPyE1w93Jd8zDoCifCrK5iks1SxQXc4VX/cYq8U+9kGb1qy7WC++8fM
	WiO6Kj8lT+bkQR9oQdWBNsWhHH8Lv5EZc2gEPVJ9vJQF5SEUMTW0HeaxAGOFvo/kMI8Qr/
	z5sOHj9D/g8LOnRJHavb6RiFey8rMzP4UKbuPfMFypQgaEjKbLRbiItOf7tcC8A90NsaYf
	YG44mVPJ0M2U0QjdtpB9YCOjPoa2IvmY1nsDS8AXc0D2PHW+yCOMIN3bW5+lueUE3zun7p
	LaPvCdR1+/B4MQTeXuSkcxB4vVpnvLpAWPhmWJt+WDFa4hK8vfYaI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1735827212;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=1sM4m+Xtf/BwMEi22BUSnyiKTn9tsnS+jHZ7cn9qpCU=;
	b=98xa9FfsION+RnpPBsEpTBy/3OZIO+lgTqpbvx83/RkoX8qTvhONgN6kSHb8goweyiJSxx
	UmRVubM5ZF92yjAA==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=gromit smtp.mailfrom=gromit@archlinux.org
From: Christian Heusel <gromit@archlinux.org>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Stephen Brennan <stephen@brennan.io>, linux-debuggers@vger.kernel.org, 
	Omar Sandoval <osandov@osandov.com>
Subject: Re: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
Message-ID: <29b93529-5e28-4458-bf39-e12c00d84c16@heusel.eu>
References: <875xmxljst.fsf@brennan.io>
 <8734i1lips.fsf@brennan.io>
 <3eb3a0bd-232e-4015-8793-71b1662040ba@heusel.eu>
 <20250102145728.0c61ed68@meshulam.tesarici.cz>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="744647uqjximc36v"
Content-Disposition: inline
In-Reply-To: <20250102145728.0c61ed68@meshulam.tesarici.cz>


--744647uqjximc36v
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
MIME-Version: 1.0

On 25/01/02 02:57PM, Petr Tesa=C5=99=C3=ADk wrote:
> On Thu, 2 Jan 2025 09:57:52 +0100
> Christian Heusel <gromit@archlinux.org> wrote:
> > thanks for your report and suggestions to fix the underlying issue! It
> > turns out I somehow missed the soname bump in libkdumpfile's last
> > release (also I'm a bit annoyed that it had one in a patch release)
> > ... =F0=9F=98=85
>=20
> Hey, you may want to know that libkdumpfile (package) does not follow
> any kind of semantic versioning rules. So, there's nothing like a
> "patch release".

Alright, thats good to know!

> I will reconsider this approach with the release of v1.0, but that's
> not planned until there is feature parity with the crash utility...
>=20
> However, since some people have already found the library useful, I
> maintain libtool versioning, which takes care of API and ABI updates
> (and makes it possible to install multiple ABI-incompatible versions on
> a single system).

Yeah again as I wrote initially, missing the soname bump one is
definitely on me!

> Petr T

Hope y'all had a great start into the year =F0=9F=8E=89=F0=9F=8E=86

    ~ Chris

--744647uqjximc36v
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8AuW0VIoAT/8nJ0Dk7EdqkwZfj0FAmd2nwYACgkQk7EdqkwZ
fj0P4w//UGFFo7wzYsEABxJDh3P1ORsZ3SWWjoMbt6S+3f4ZzaGirPMfQz1WWtIt
knK3yzUzcGWyot6A7CG1U8M4pTpDcVuvEQbGvdqqG8W7uIzBxV5ZA7a+ijvmP1PC
lFPftbYlTg7Kjh3dbInpuj+4Qfp/P+J0NY5kzM6htZqNc2KYDukMwZNKCfNDm1Kc
AQTOhiddEeIqJo7ZAJ91eir6V/uGTPOSgN7WCHDr7e6WrqRk1KsDiqDcqy/vev5o
fqUBYOwzVhphj7CvX3KeHizaWLMk+CHBzidFzLpkKxIgSKzg4UsLAl+Ofq6jnLFc
nMTLfFWHEkmn+7B7x5s7/1PIjWKC2pSTi+KmD+HrRkrA7oAh9iAzbuyk5BT+VDKk
TgUT5eK9QS4wo+xrek4AQH+Z12uAXhtx8JEUZfqMMpQkOFpkPCDhT9Sjg5OoB0cY
JEhQjimkr/1vjvRGCxANAc7xI0Le0XGj+eSvPSuPCgr4CifZmg+c65daUEz6Hn3g
Bc/BklL6dIXwysyvOqc8stIxY6O5prm75S+BsrvUu+60RJmBISaoEXGEfpl/jxec
+QQHX6hgzv6djm9gGzH4CwCrOc0vSi3ohQXxQYRI52vTaKwP3KKf3YLJOCuHmsk5
JxqsWjajtZ5SXEycVbzTJ22ZMcXkdT73/bilJOW7DbJfPEBdilo=
=2gbX
-----END PGP SIGNATURE-----

--744647uqjximc36v--
