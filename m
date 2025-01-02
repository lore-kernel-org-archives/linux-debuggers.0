Received: from mail.archlinux.org (mail.archlinux.org [95.216.189.61])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA0D7166307
	for <linux-debuggers@vger.kernel.org>; Thu,  2 Jan 2025 09:06:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.216.189.61
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808783; cv=none; b=uOfbX7C3QmUonB5W9Bdw656WrZwvMBcB0o0ckUE4wkwcya4t1X6o2ij/CKRXtnjiQ2fKVHwmrZrwUs/pcNW4GPoHFIEhHYR6h9L7tsk8uSyet/06ebhsn6Hi1Obxf6/WIfpLuO7ufrc/gMWGBbJRVqjVAdhUe+76iWdg9DMMjiI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808783; c=relaxed/simple;
	bh=EjCMtqaUudcclqCqgoKDtAIrNaUgCZ9eMqTmQ22Qhug=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHI0phb+34QxCcYjFxS2aLvNO55gBT7dUgBiw1bajYFuD87k8CF7WBl0gW/SY4Er9VLgHzj3APY8QB4/U+BEr2dQCUgde821KcMW3tCXySsUhlV0tjkc2WeC+De7fOEBNilNUIT6yc07V3euag3SC3MnSfKhaeZ6915t5e6R9xQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org; spf=pass smtp.mailfrom=archlinux.org; dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=nr2BA0Ec; dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b=QdkMnuiN; arc=none smtp.client-ip=95.216.189.61
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=archlinux.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=archlinux.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (4096-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="nr2BA0Ec";
	dkim=permerror (0-bit key) header.d=archlinux.org header.i=@archlinux.org header.b="QdkMnuiN"
Date: Thu, 2 Jan 2025 09:57:52 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-rsa; t=1735808275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EjCMtqaUudcclqCqgoKDtAIrNaUgCZ9eMqTmQ22Qhug=;
	b=nr2BA0EccNBCww87ZNzWX8Z5aNzBZ3647n/PVQvDPe+TRTfL4b7/j4d6B8stfEl+XQbV2O
	BuK3sFSpr9h1shBBtCtkmcdaChldQ3Q6ITBxmP9XkavVhQoStZH8EJrkB1ynmAkhGh3ao2
	bHptndF1uChaoFKKa5uuP79uvpfCA0sKqZzBujxo+27F/py6IHRRMjyd9RHionO1V1+CHO
	8diyLCtkyjzCiiYE8us+6CrocZxYh/S6OMAms9SjP/LzUTi8HQTHAuUJseudn3ByspZ3Q7
	Gu6nqzdQlA08zk0oi8lbQzi/spNBc8dxW3jet9N8Q6IK23ojnUWCxtIvKKOfUahCdRZQXA
	7ruto5ycte0nUVc4dycDsvkYaYaDZadQIWFEIDZ/Hooyu1J2LEWF6i8Q+cuHODn1pNryHN
	E7l7CHaMS4tua3DCveod59ukTmRl8FUkXppDGPFpTOgkr9A2/w3+Zs34yo2g5LszrUQSY3
	8yHuIC7e1k1ahsnjYnWOO6c3uZiwdf63IWezfR0OnneIhgc9EGns37D1uwg/xySGPrx108
	nDqTMjICyHSIO3+TcK3QwNbM4tM9e+/7rq6N9C17lV60VWyGKbUQUpFFF1otLT2ltQW7E5
	OQZOV/ZEgqSFYA6Yt2pljZ5X10b5J0OeUzvglIAM1Wpf8JB+oAgJs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=archlinux.org;
	s=dkim-ed25519; t=1735808275;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=EjCMtqaUudcclqCqgoKDtAIrNaUgCZ9eMqTmQ22Qhug=;
	b=QdkMnuiNwcMN9UTX6Uh6ZwSiJmSX9KMoccxtQ67l3hOErhME4WljPmcHKYmqLbH0Glqcxs
	9IyJvtH14wTDaLBg==
Authentication-Results: mail.archlinux.org;
	auth=pass smtp.auth=gromit smtp.mailfrom=gromit@archlinux.org
From: Christian Heusel <gromit@archlinux.org>
To: Stephen Brennan <stephen@brennan.io>
Cc: linux-debuggers@vger.kernel.org, Omar Sandoval <osandov@osandov.com>, 
	Petr Tesarik <petr@tesarici.cz>
Subject: Re: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
Message-ID: <3eb3a0bd-232e-4015-8793-71b1662040ba@heusel.eu>
References: <875xmxljst.fsf@brennan.io>
 <8734i1lips.fsf@brennan.io>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="qxtlf3ojkrhdergi"
Content-Disposition: inline
In-Reply-To: <8734i1lips.fsf@brennan.io>


--qxtlf3ojkrhdergi
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
MIME-Version: 1.0

On 25/01/02 12:31AM, Stephen Brennan wrote:
> Stephen Brennan <stephen@brennan.io> writes:
> > Hi Christian,

Hey Stephen,

> >
> > I think you may already be aware of this, but I wanted to let you know
> > that there's an incompatibility with drgn 0.0.30-2 and libkdumpfile
> > 0.5.5-1 on Arch. libkdumpfile 0.5.5 changed some APIs in a
> > backward-incompatible way. Building drgn against the new version fails,
> > and running a version built against 0.5.4 of course fails due to the
> > soname change. The current drgn 0.0.30-2 on Arch's repositories was
> > built against 0.5.4.

I was not yet aware of this!

> >
> > Thus a user installing drgn & libkdumpfile on Arch, who is fully
> > up-to-date, gets this:
> >
> > ImportError: libkdumpfile.so.10: cannot open shared object file: No suc=
h file or directory
> >
> > The incompatibility is fixed in drgn's main branch by the changes in
> > [1]. Unfortunately, that was merged after drgn 0.0.30 was released.
> > Some major changes have been merged since then, so I don't think a
> > 0.0.31 release is likely for a few months. So I think it may be a good
> > idea to carry the two commits in [1] as downstream patches in a new
> > 0.0.30-3 release. I'd be happy to implement those changes if it'd help.
> >
> > I'm Ccing the linux-debuggers mailing list for posterity, as well as
> > Omar and Petr as an FYI.
> >
> > Thanks,
> > Stephen
> >
> > [1]: https://github.com/osandov/drgn/pull/452
>=20
>=20
> Sorry, I was a bit mistaken here:
>=20
> 1. drgn 0.0.30 DOES build successfully with libkdumpfile 0.5.5. I
> misread the changes there. As far as I can tell, there may be a small
> memory leak when using 0.0.30 with 0.5.5, but nothing major.
>=20
> 2. I'd say the best way forward would be a simple rebuild of drgn
> against libkdumpfile 0.5.5.
>=20
> Thanks,
> Stephen

thanks for your report and suggestions to fix the underlying issue! It
turns out I somehow missed the soname bump in libkdumpfile's last
release (also I'm a bit annoyed that it had one in a patch release)
=2E.. =F0=9F=98=85

Sorry for any trouble this has caused you, this should be fixed with
drgn 0.0.30-3! Additionally to the rebuild I included the patch you
suggested at first, as it applied easily and fixes the lifetime issue!

Cheers,
Chris

--qxtlf3ojkrhdergi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEE8AuW0VIoAT/8nJ0Dk7EdqkwZfj0FAmd2VQ8ACgkQk7EdqkwZ
fj2EZRAAnnr8EpEAExzL5LwRJ9njdZKTSp1fZYTAdwXqZIvKPVQ4eOQLFnokYkLi
tgancGZoIC4SbgqV2W4Yk8s+I0AuW+AmZc4qscKEddN6RW6FaRmaI9dhXamLt7pi
AlS+iSjzVGMbodX6uIwZER7DCENwztAPhTjrnCbgmchEQ0dEc4PIk0SsqcvK157G
O5Tf/hQNYtwXFGZlIBXjQLOxSYbuRC98SzrCTM0kfgygxy2N7VPD0LVWvn20NoQv
4dU+lse4MNWGvp5WZPGUr67R/m3suflVhJ68IC/ZrqorpwHT+FVo9Iq2BjJlcGmH
9Jbi/Swsj7bnFLYt4YYg9+a3H/ViuEyoAa9A+VzZ4qb6+NcoAqHnWhDrZqrH5Dr9
SXOsLukmPiCHSYF9q75jG7X0/zAjIodD92caGLPQWqzJxnM3z9LW0lomPPCWqZVh
6WLkWe/mr0HbAsX+9JUBKX5IXSBEzU1qYRd+oW8yu2Sxyf/PocJUNyMGUS0GTfZi
U/m4UIx5IKO3fP2XQXxeMzB82R3WQ95Hprv/a1H44WKgsTO8+KLkJiYP97eXN217
O4CSZe/Y5AEUG/RMDttVdrO1TOhgX0gZn0vQiIyuZfu0Xgzi0B1IS7w2HkXPnQue
b/b7dR3Wx64+IePY6Hu5Kdvt8ybyrl9cyGSjbRm3s0fRByRTY6A=
=Dpfg
-----END PGP SIGNATURE-----

--qxtlf3ojkrhdergi--
