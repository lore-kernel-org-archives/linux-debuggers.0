Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D47B4D5AF
	for <linux-debuggers@vger.kernel.org>; Wed, 10 Jan 2024 19:58:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="vVoqrgUP"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id BB4DE1AFE84;
	Wed, 10 Jan 2024 20:58:29 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1704916709; bh=YjIMifTSk+qBm4y58fC2o+D8WxwkgaIzX2UYYN5im4Q=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=vVoqrgUPXKjt/SF2Vfup8TwYsdRVEItH/+YqObCuiF2fasauCqXzc7g6oP7hfvhen
	 sX6cGGhXnsTM51Xl9EZx/Pm2j+BGD9Q42oe0Ifc+E1V3OBh8+PmjqJ9bh5uZWRQ4t9
	 gqTpooKPaOWbU2fWQhPsr/9qm0sRyncVWt/Oki6kbD3aGieqWV4uS3kwCYxBCh/Y1E
	 6KPeO2LH9qR/mVhYe+HBXG/rD96jsRXO1JcEw4Q6CG97OjpVW+lTwhkDbNzSUzhSOD
	 9lOYhc/i2EKr4dU2+14+hE3oUcz7TDMEJh0fGhXosqg8C1nxFBRk3sV8zlWmLobqwT
	 gBHKQhWrA048Q==
Date: Wed, 10 Jan 2024 20:58:28 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Subject: Re: Segmentation fault with drgn + libkdumpfile
Message-ID: <20240110205828.0dfd3450@meshulam.tesarici.cz>
In-Reply-To: <87ply9ynp5.fsf@oracle.com>
References: <8734vb1v8n.fsf@oracle.com>
	<20240105202339.09db6ed5@meshulam.tesarici.cz>
	<87zfxjzbuc.fsf@oracle.com>
	<20240108214008.32f807ee@meshulam.tesarici.cz>
	<20240109100609.4e956beb@meshulam.tesarici.cz>
	<87sf36yni8.fsf@oracle.com>
	<20240110093600.61005acd@meshulam.tesarici.cz>
	<20240110144928.19010b9a@meshulam.tesarici.cz>
	<20240110190354.0ff56adc@meshulam.tesarici.cz>
	<87ply9ynp5.fsf@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jan 2024 11:48:22 -0800
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:
>[...]
> > I was able to write a test case for the NULL data pointer. The bug
> > should be fixed by commit e63dab40c8cefdfc013dc57915de9852dbb283e4.
> >
> > Stephen, can you rebuild and verify with your dump file that this was
> > indeed the same bug? =20
>=20
> Hi Petr,
>=20
> I went ahead and pulled the latest from tip and ran my reproducer. The
> segmentation fault is indeed gone!

Great!

> I tested c10036e ("cache: Optimize data reclaim for missed entries"), to
> be exact, which contains e63dab4 as well.

I spent some time pondering whether the other call of reinit_entry() is
also affected. But it's not, so this other commit should be a no-op.

> Thank you so much for taking the time to go back & forth with me on this
> one! I suppose there's a reason that caching is one of the two hard
> problems in computer science ;)

Given that the relevant counter was decremented, it may also be seen as
an off-by-one bug. I think it's all a matter of naming things...

> I owe you a beverage of your choice next time we see each other!

Beer if in Europe, bourbon if in the US. Thanks. ;-)

Petr T
