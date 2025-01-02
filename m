Received: from bee.tesarici.cz (bee.tesarici.cz [37.205.15.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8160192B8F
	for <linux-debuggers@vger.kernel.org>; Thu,  2 Jan 2025 09:07:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=37.205.15.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735808852; cv=none; b=AGfc64XpwJp7BSVlMUqZ2rYLmQKGHG6Dif/HYO3DLP2CMz0pxTVEG7UeFGwWmuVOoQ3Z8jmYFiO2bzShlwLVnMkWuc+INW/Hw9fBMVQT7QW/kemXe2v36S/4AQbGzDC++ZoxsMSi1pyoZXdMGWfLr9sM0hSWRIb45mWleSREwSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735808852; c=relaxed/simple;
	bh=qiGTXIBgD2ze2fQf8J28z7osQLkNgthIg7N/RSFrP7Y=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=SJ+ZWHBGk/AEc8BzNtg1rq2a+gvbQ6ZJnoTCpsYu2dahK4iAmojZTAT4/N6LBKIzpMWpRnv3dePvLfBGiRKr+6cjlfPwkCurFCFWB5LBZ3wiKi0ZgvwrGJXISWBlvBoCAP/pQfCEKkljr3/dawFELiL18m4pn6bZ8jCJ8PSQ0Gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=KrHKEcTm; arc=none smtp.client-ip=37.205.15.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="KrHKEcTm"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 626A61FDCDD;
	Thu,  2 Jan 2025 09:58:27 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=quarantine dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tesarici.cz; s=mail;
	t=1735808307; bh=/Uskc31NofKM/0K5tg3fucFJfADS58fniLK8owMCBcQ=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=KrHKEcTm1Xyomyx4TWCQ8yBtrZlqn0vhK05Aec2NuFUmTCW+gik+FTvChSawS4ByR
	 nXa6SDaO97R1B4brjIbHiXDGF00fdqU0LK/nOwLNKkFQ9W+U2Ixs3IhfsdxtflMwFm
	 A+sVRNeuw8ChzzBAunBlS+LnGy9H2HBbEqPgc/gWL1wKTh3vA69u8wOc1R+1rBy3el
	 xtUYC2CUWv+ICEZqwaCmYFpb4lrYe9yjQ2YRlP+xWk9z/c3/1Z1JTl4KDkLI2n4X8H
	 EJ3r/09X0/qef0WtzU2+fQHPZgUl1B8xAh84AnPMhGYOEbC/Z17NQDMciQhCtlg7cE
	 WL2wxadxGUPUw==
Date: Thu, 2 Jan 2025 09:58:26 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Stephen Brennan <stephen@brennan.io>
Cc: Christian Heusel <gromit@archlinux.org>,
 linux-debuggers@vger.kernel.org, Omar Sandoval <osandov@osandov.com>
Subject: Re: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
Message-ID: <20250102095826.35880f75@meshulam.tesarici.cz>
In-Reply-To: <8734i1lips.fsf@brennan.io>
References: <875xmxljst.fsf@brennan.io>
	<8734i1lips.fsf@brennan.io>
X-Mailer: Claws Mail 4.3.0 (GTK 3.24.43; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Thu, 02 Jan 2025 00:31:59 -0800
Stephen Brennan <stephen@brennan.io> wrote:

> Stephen Brennan <stephen@brennan.io> writes:
> > Hi Christian,
> >
> > I think you may already be aware of this, but I wanted to let you know
> > that there's an incompatibility with drgn 0.0.30-2 and libkdumpfile
> > 0.5.5-1 on Arch. libkdumpfile 0.5.5 changed some APIs in a
> > backward-incompatible way. Building drgn against the new version fails,
> > and running a version built against 0.5.4 of course fails due to the
> > soname change. The current drgn 0.0.30-2 on Arch's repositories was
> > built against 0.5.4.
> >
> > Thus a user installing drgn & libkdumpfile on Arch, who is fully
> > up-to-date, gets this:
> >
> > ImportError: libkdumpfile.so.10: cannot open shared object file: No such file or directory
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
> 
> 
> Sorry, I was a bit mistaken here:
> 
> 1. drgn 0.0.30 DOES build successfully with libkdumpfile 0.5.5. I
> misread the changes there. As far as I can tell, there may be a small
> memory leak when using 0.0.30 with 0.5.5, but nothing major.

Yes, the PRSTATUS blob data will leak. To be clear, the memory leak
is not even relevant unless your program releases many drgn objects.
Most use cases involve a single instance which is released at program
exit, and then there's no practical difference.

> 2. I'd say the best way forward would be a simple rebuild of drgn
> against libkdumpfile 0.5.5.

Agreed.

Petr T
