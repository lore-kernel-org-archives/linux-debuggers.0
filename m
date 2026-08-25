Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BFEC42E8DEB
	for <linux-debuggers@vger.kernel.org>; Tue, 25 Aug 2026 20:35:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787690120; cv=none; b=iWK8fALReSb2u1yUDv6qLeoLTQEF8IS1YnXefQIGp9rBmdxWj4w0lAFZN4DHc3u0l67xDJMAYX12xqRNHO+W936Bbfq2kAvvKOgtKwR7gGBCeNqw2ekD+exKKd8EJ5tEqvGjro2wASp7yNWDiyVjBnwvXUXQLAb+ZCZIV0uyd08=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787690120; c=relaxed/simple;
	bh=5sSaGOCqXn7wcDI5c8hxZOf7mCLIeCN7LeV5PpHFLa8=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=btWgShBsxCpeTrOIwH1aty5JrOQYxtAuPoUBY15tgFS9gE8yBYA72bNzJqKv6gPon+bL381MG90LhAJiB/btLgqE9g53ZRJAIEg0IaDkzXmwn4h8ZovgeZbkGh2xpBq+PAIQfHZNVaiw8f33aK0OzIMmAnOaBFePWlMZRubb5Dk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=Xv+vf/FR; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="Xv+vf/FR"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3964707f32aso43209a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 25 Aug 2026 13:35:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1787690118; x=1788294918; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fq93Krj1c4Rjx4UyK3oHOwnshg4MwnfVQqsaq7fOlLE=;
        b=Xv+vf/FRBA0S8dyUnVssWU97neoZPlHgDDmgkLd6XqpB9uvINIZc4VdA0sSVdwux3c
         eVdESAoWcgNHEBYPIy8nJ5smAVp7NxKZHrwO3B893/brBb8AjIecBR34KM0rWRhsrOq5
         3avwLYWx/rjJdGRm26jqLK6GxrpfgG57Mzys19N9HEF6UpzfK1TbGEaK9Eb9sFw3XQrc
         KcHCHRQ4lZvKFY5+VtHGDcYNFgq8imQTI7oyO/dCkTzWnMnAfHoPMEszMm0rDcCBI7Hy
         6O96j5ifjWoBfmXNo8IEqxfxKFulJQP3UgaUrm9WMPRN5PXOE0D3tvNi7S/SFfGGtas/
         vVrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787690118; x=1788294918;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fq93Krj1c4Rjx4UyK3oHOwnshg4MwnfVQqsaq7fOlLE=;
        b=Qibmi9qchyBoPaUFfUu+5YDPy8Ey+GzW5F6WdmcNpxAc2Ilg4X7dTklOqEbHot1l5D
         T8N7xcuIxh9WTduZLipW0tsgKFncizFenWxm8XdsILuRhHxAbjTaNK8+/xo9h8ust1Bj
         y6KUZViPhUH6Awd9wOSVdE63LoH1n7uW3IP5i/Np2/iQfxOHNw8iRDGwqjSEZQZoXKJC
         CV30q1JuYavp9tBfzBFwXv7skX/VGbcDxSrbA2UILub2bMK8Yxhk+qiJZOucyOHDbZA9
         i70lvmWRpJokLF3uSQm6myOmztrFUz2Ne14V3tP4znlnbWOkvf/Ndu2EhVa/Zg6kkYkX
         iw+w==
X-Gm-Message-State: AFuF++m5G0Zr5tqb4Z8/8AKasDYcRcCWD34mBQxFh4+mS5QCylCyYKha
	Lar0UbYb34G5yqT/zM2jTiYti+TEtblTfP242oQ691l/zzHUM3YnhIVgeqCy9rI0IS/D+mWJa5t
	9tYwqQg4=
X-Gm-Gg: AR+sD13+nVSmpgnwuxxGJ66TP1Wet0UJ84JuOHrcebZP3WAhkYPkIT9Q/OHhcQFP5Nd
	r6Zp3sHGvxq4FTJIHqF6K2oCrThy/lLj25+uSzl5uujV4mSG7BS9tvCQPLsd8n/SANE0UlqEc2j
	JkbYPhSndLgkxtaDdwXt8ksJm/SfpGeXpVQ1bzelzW60qjLs1bbNmXANsDipl1zwM5leIqeOApz
	KvZHXPpEYzd3+C4Lg/lhjZ32iQZaOXov1drPOxdRKLUa3E4ylgBDqxbkE956iMfSz/15MBYYdR1
	2ukbhU5f2xvdJJhIooWtiDPZzbw/Y+3i7GEON23DGhtrxTduvdUKWNgS2iZKs0rlvRDyqh0AxFw
	PEee00Z09EKUrFRE3cv1TMukN08capd2dbrpyIpp+23TFIQ2GZGYwERTCtg8rN68oJhaICVa7Pp
	lm2nv3bBizMqz9VsrEbtRcSrN+rmRJBAtiu8EQ0skadsD/Aez05X8KJTO/THlqgiVCtlnpAhxWW
	XY67Bb5MDADlH9lJEHaZw0UU6z5/dudf7xBrpDKmeIquaFSC3xVJUDf
X-Received: by 2002:a17:90b:4c4d:b0:38e:c140:2a0b with SMTP id 98e67ed59e1d1-3966d45efd1mr1534419a91.3.1787690117861;
        Tue, 25 Aug 2026 13:35:17 -0700 (PDT)
Received: from telecaster (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3965d119724sm2871761a91.2.2026.08.25.13.35.17
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Aug 2026 13:35:17 -0700 (PDT)
Date: Tue, 25 Aug 2026 13:35:16 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, August
 26th
Message-ID: <ao38hD6eAj9Thiuj@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
August 26th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- In-kernel enumeration of data structures for drgn using BPF:
  https://github.com/osandov/drgn/pull/637
- Disassembly support for drgn: https://github.com/osandov/drgn/pull/629

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
