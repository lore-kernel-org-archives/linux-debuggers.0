Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com [136.143.188.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD424188938
	for <linux-debuggers@vger.kernel.org>; Thu,  2 Jan 2025 08:08:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=136.143.188.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735805331; cv=fail; b=RRGIX7YJuwVX8gBB3DXkZnQ+pPApU68zk18RBQ9R8bFKm0+Or05JrPsNlazKSuHz6VZxIincEN2diL9X7zpJbqglx8vA2BKbfELWg6+3uGCUxHEBOh4+QGqaHFVsQok+Z2/Qf5E4NpPCDJzG550KL6wh+DScfWN2SVExGbLQLHA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735805331; c=relaxed/simple;
	bh=WCowI6teWfW3JPrzLx/gxMsC0e7qep+nwKr7er3jAj4=;
	h=From:To:Cc:Cc:Cc:Subject:Date:Message-ID:MIME-Version:
	 Content-Type; b=lIPbzenY/8LzA+4SiQ2kAL97xdlBXnj7EeqG7uksIfDAwIzneUQJfL41yprvxXYQUZFcGKDsweXRwrgeK5pX4C1GGvouZlruHq0Y7GBPPiTPJgxREq1zRaAIF0+JKof/4C7prI3wBaMmCE4e+CbJHRUYmEI69fqwXW2po/BujKc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brennan.io; spf=pass smtp.mailfrom=brennan.io; dkim=fail (1024-bit key) header.d=brennan.io header.i=stephen@brennan.io header.b=gK53KQS2 reason="signature verification failed"; arc=fail smtp.client-ip=136.143.188.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brennan.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brennan.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=brennan.io header.i=stephen@brennan.io header.b="gK53KQS2"
ARC-Seal: i=1; a=rsa-sha256; t=1735805320; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DWJRHxS1aYIIe35YRrQ9B7sZtX+q6Q7okkpELKM6KMz4v2HaWXDKGpu/0B+L2snyE7tt/XVGZ53spADyfk8Oqd0VUStbORXo3d4fZAeLAdpixc79HZFADiKLmnCZzIv5dlax3e3jVAs0JzN/fhaGNQzpImDCmmWmv9vw+RxXuc4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735805320; h=Content-Type:Cc:Cc:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=WCowI6teWfW3JPrzLx/gxMsC0e7qep+nwKr7er3jAj4=; 
	b=eKXMIDyZaZ3qIdniPFrm+mXA1ngvWOhi+yLvfCB9iIYajH5UMKJ3vjAuE30SzD1aPcAeN+n7n0lWagCN8w+2UCAAw5MkX5tl71IrEccirNnFKlTyRePQrS1nMU6UBkRBpCQztId4IMd/WMVfes3Gg5GDtcFfulUpoLXHXjvJIgw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=brennan.io;
	spf=pass  smtp.mailfrom=stephen@brennan.io;
	dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735805320;
	s=selector01; d=brennan.io; i=stephen@brennan.io;
	h=From:From:To:To:Cc:Cc:Cc:Cc:Cc:Cc:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To;
	bh=WCowI6teWfW3JPrzLx/gxMsC0e7qep+nwKr7er3jAj4=;
	b=gK53KQS2PuJLny0ICVpwAKPvZQChKIwZ4I4iVxw95rsRWFE49PJjFVIo0JdHBR23
	xVPxdI24oiplbij/ixiB2bSKJAWSI6eRnaZ289BiPLwajYORUjAIMnYmaMw6Ft8ckMB
	pQ3tdecDh2OKwSX4JcGXv6J3QOLenF/FsU+71RIs=
Received: by mx.zohomail.com with SMTPS id 1735805316710127.18198012429957;
	Thu, 2 Jan 2025 00:08:36 -0800 (PST)
From: Stephen Brennan <stephen@brennan.io>
To: Christian Heusel <gromit@archlinux.org>
Cc: linux-debuggers@vger.kernel.org
Cc: Omar Sandoval <osandov@osandov.com>
Cc: Petr Tesarik <petr@tesarici.cz>
Subject: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
Date: Thu, 02 Jan 2025 00:08:34 -0800
Message-ID: <875xmxljst.fsf@brennan.io>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External

Hi Christian,

I think you may already be aware of this, but I wanted to let you know
that there's an incompatibility with drgn 0.0.30-2 and libkdumpfile
0.5.5-1 on Arch. libkdumpfile 0.5.5 changed some APIs in a
backward-incompatible way. Building drgn against the new version fails,
and running a version built against 0.5.4 of course fails due to the
soname change. The current drgn 0.0.30-2 on Arch's repositories was
built against 0.5.4.

Thus a user installing drgn & libkdumpfile on Arch, who is fully
up-to-date, gets this:

ImportError: libkdumpfile.so.10: cannot open shared object file: No such file or directory

The incompatibility is fixed in drgn's main branch by the changes in
[1]. Unfortunately, that was merged after drgn 0.0.30 was released.
Some major changes have been merged since then, so I don't think a
0.0.31 release is likely for a few months. So I think it may be a good
idea to carry the two commits in [1] as downstream patches in a new
0.0.30-3 release. I'd be happy to implement those changes if it'd help.

I'm Ccing the linux-debuggers mailing list for posterity, as well as
Omar and Petr as an FYI.

Thanks,
Stephen

[1]: https://github.com/osandov/drgn/pull/452
