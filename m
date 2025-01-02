Received: from sender4-of-o50.zoho.com (sender4-of-o50.zoho.com [136.143.188.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24A91A95E
	for <linux-debuggers@vger.kernel.org>; Thu,  2 Jan 2025 08:32:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735806733; cv=pass; b=mtGC+UT3+enOlZoJoPcVKbuRZS+DL5QZGXlTyJGfN8qpko2LLBhAT85B7llpRxQfTpN3i+7x2pxZeA+53KOl52wLj29Ty9IUcV6+d5Mv/ycHvrt+KA1igDMFUn0a6JWVEA9pN2Kxv1pmhbMHZbY+fXi3xFXHNsuAHRjSJe+vOVA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735806733; c=relaxed/simple;
	bh=jlACIh77jYfZhliBlfkbj7IcDWv5y8eBsrSLdKzo4SU=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=SClJ8oQQXhh1lWZSbPPY7wupbWHrngYscRlyQ6nFy0YHlOiQcxnS29cVZwHkCdEAahzgOH5DA3QXhoF+1iLV3jwqIGP/tXO81VCk7hEZRcoPIANDGFoM+K1++90qLjATg479I6Xh5UiSzuvwCPjVXCL5OCvCXa/WCc5SezqtnpY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brennan.io; spf=pass smtp.mailfrom=brennan.io; dkim=pass (1024-bit key) header.d=brennan.io header.i=stephen@brennan.io header.b=fC6ubKg/; arc=pass smtp.client-ip=136.143.188.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=brennan.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=brennan.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=brennan.io header.i=stephen@brennan.io header.b="fC6ubKg/"
ARC-Seal: i=1; a=rsa-sha256; t=1735806723; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=QaJuf4v9cwvH080lmWSqeSPwGlH7vSzKLBwhc8v26v5azShlnCQMkH9TJKAjvRIHPqjdrOWVQeQrnuKxZ0XEsTWGV9KMdgNjAxUoQrPUb2OHj3qV0d2jypYcMkUg2vEGhW9FTxDdM0N5IZj3BJ3K9uEm4AE2g98WycqasZT28QE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1735806723; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=jlACIh77jYfZhliBlfkbj7IcDWv5y8eBsrSLdKzo4SU=; 
	b=Si9kY5QLohv/HBYyFT28RjBu1bAu4dABZpIRIgvBMR3HhNDzT9pFESeFWaoAtYYkJoSAkTkMzcP2+xH7cCQ37HNJIerYcdy7LwbDeqNA1WsFDFbUn0ZrduwxxAgqLZ/vvl6PhCkLNlZrUv4rD+WnlIOM02egMphq7qudXtFLOyY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=brennan.io;
	spf=pass  smtp.mailfrom=stephen@brennan.io;
	dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1735806723;
	s=selector01; d=brennan.io; i=stephen@brennan.io;
	h=From:From:To:To:Cc:Cc:Subject:Subject:In-Reply-To:References:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To;
	bh=jlACIh77jYfZhliBlfkbj7IcDWv5y8eBsrSLdKzo4SU=;
	b=fC6ubKg/bCPeUAzWC4eEDl/fBSby/sO1XEV11eLogxpOqNt2G/B7a/m4fRnzQ01s
	G1JuH4AXN9YvVnSVOP2y0TBNzNFh/RGZkZv6XC2aCCV5GmF9wKfT7mIko4Gu3TwXnCc
	fos+w01t7AfloMT0dxSXe725R0NEbxdaAib8FHhg=
Received: by mx.zohomail.com with SMTPS id 1735806720157670.1116063394236;
	Thu, 2 Jan 2025 00:32:00 -0800 (PST)
From: Stephen Brennan <stephen@brennan.io>
To: Christian Heusel <gromit@archlinux.org>
Cc: linux-debuggers@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
 Petr Tesarik <petr@tesarici.cz>
Subject: Re: drgn 0.0.30 and libkdumpfile 0.5.5 incompatibility in Arch
In-Reply-To: <875xmxljst.fsf@brennan.io>
References: <875xmxljst.fsf@brennan.io>
Date: Thu, 02 Jan 2025 00:31:59 -0800
Message-ID: <8734i1lips.fsf@brennan.io>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External

Stephen Brennan <stephen@brennan.io> writes:
> Hi Christian,
>
> I think you may already be aware of this, but I wanted to let you know
> that there's an incompatibility with drgn 0.0.30-2 and libkdumpfile
> 0.5.5-1 on Arch. libkdumpfile 0.5.5 changed some APIs in a
> backward-incompatible way. Building drgn against the new version fails,
> and running a version built against 0.5.4 of course fails due to the
> soname change. The current drgn 0.0.30-2 on Arch's repositories was
> built against 0.5.4.
>
> Thus a user installing drgn & libkdumpfile on Arch, who is fully
> up-to-date, gets this:
>
> ImportError: libkdumpfile.so.10: cannot open shared object file: No such file or directory
>
> The incompatibility is fixed in drgn's main branch by the changes in
> [1]. Unfortunately, that was merged after drgn 0.0.30 was released.
> Some major changes have been merged since then, so I don't think a
> 0.0.31 release is likely for a few months. So I think it may be a good
> idea to carry the two commits in [1] as downstream patches in a new
> 0.0.30-3 release. I'd be happy to implement those changes if it'd help.
>
> I'm Ccing the linux-debuggers mailing list for posterity, as well as
> Omar and Petr as an FYI.
>
> Thanks,
> Stephen
>
> [1]: https://github.com/osandov/drgn/pull/452


Sorry, I was a bit mistaken here:

1. drgn 0.0.30 DOES build successfully with libkdumpfile 0.5.5. I
misread the changes there. As far as I can tell, there may be a small
memory leak when using 0.0.30 with 0.5.5, but nothing major.

2. I'd say the best way forward would be a simple rebuild of drgn
against libkdumpfile 0.5.5.

Thanks,
Stephen
