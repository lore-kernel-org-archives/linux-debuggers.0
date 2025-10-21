Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F045026F292
	for <linux-debuggers@vger.kernel.org>; Tue, 21 Oct 2025 22:55:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761087361; cv=none; b=OkUsLvbXqlWkpuMMqOyl+FgA7rdq+i+cAI6NquJpWANe4cWGTdKNkp4bBSZ9RGpoBHhaDDqxHOPb+EVQHzQ9eJt2k74FPujVxXCyPMTng7PHc333qQwFbqdqTKFTpoMNW8XaCoa5DkaJ5t/oS84UjpvrbhXYt/wcLcdod1+EtNo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761087361; c=relaxed/simple;
	bh=MdJ9c2Bd5dv+No+kHVvXqM7ymjqQibkCRg5DAcNjN8M=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sFfrcPXlcKAgOD9+vshfCOvcrBsugekn9eECQZnSywbDeexXnUlAznmMT+17rMU8hpsLNMTtxv9cijFsKigY2V59bPGI1++tINIrL0fcXeU7LxvmIjO8S9PYSTZ8Uw9q3qNwEDQUQv/HlWoQy1NGH1HB1pqvFtDz6GdYyCEpqgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=P55yoSvk; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="P55yoSvk"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-32edcc68e0fso936127a91.0
        for <linux-debuggers@vger.kernel.org>; Tue, 21 Oct 2025 15:55:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1761087359; x=1761692159; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=X61Vv2P8dTPiQGnEzL//3nM9quI96um/gsyo9NMf5ok=;
        b=P55yoSvklFwacf8ApOythDrE4HYEUzbwax8LHq6irMMbm62Yt4ZKIVsy6RrIw49nOE
         b6huhB+XLSrIw4HG4c/JeOaU1RVm9OnzEn64gp67FcnKqb98//Bu2RnKpiwZIgQMd4f7
         U/xMelp4SOe/GB+jwxF7flfM22iVeuAXBxLCqtsi91vylblIFkfmUtaPjEyO1/dWk38X
         ZMSTCthHTkCt5orR+jLfsL7q1wdAGoT6bDJPXmNo0A7plohetEgAoLB9uo0lGn+o16Gh
         kv0BfNHz00aThjOo4Dca5TpZBejFcQhlUyL8WbviIuKxD+/ju12u+9+yITCiDAuPEmEE
         HMpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761087359; x=1761692159;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=X61Vv2P8dTPiQGnEzL//3nM9quI96um/gsyo9NMf5ok=;
        b=droH+EnHCGUZ4y7MeBNB2n41As08G91e7f0CvtHx04aocMdRoyBIybQINRpSVa7ZTi
         GW7fqfCKESbGo8Nue1hXPA/+4cZaXrCjnY3u50Ie/36YvWRhu2iHEXJ3loaSD15ffzA0
         k1ZsnKyLa3iXLrzyYgEw+kf/TEUKai3CbgJ3QADyw44mR/ZM6MqMzE8paX/nTkylS5dH
         rrybT6xwWeIkvzqHz0ZvC1GFp6J0fXQOykc06Hdct5EGpV+2YD68S3sovexAoWsdt0YO
         bPohh2E0Jf8WuzXsuDsQTELnNN2Gbq+0FxjgM1HsuPEgXWed1BGquRDgiwXPg1fwwL57
         /pEQ==
X-Gm-Message-State: AOJu0YwHV2msfeQM/f5UN/6hLOcN+3WH/YVM/UC8E/IYRoWY0SmT+Jy1
	SgnDBBBTqXALpOHAIP4nPAYGbIfKs1CgTE96X9i7qYztHQDh3kTPtD7NTYNp64V/YsFOL4/G100
	5Bl0D
X-Gm-Gg: ASbGnctewoQGipLuvjwfiFhK8WpR1lZQBAAYkwvJ2OHxxLacac6TRYiRckLGo0ytTEk
	BXiQYSVRIyrgR2KEebB5VaFyj4lIRc7MqIQje9VVHKuPKIA2O/PAtfatxe6NwvEUmvIpBrrDtrK
	Tk3UNE7gu8D0lr2EB7dAMkp07VelOUhA6xDXdassC1RpiuqXx/8nFhxE0HT4mIVm77HVii1e/qa
	U0Km+AbJgKJ8VGKEwVqAe3reJGxdBf/NtDlgjajZd46ZEFXO3xVZ4PbdO6ZjP0mImiFgBgQWTT+
	2l9hIjcLqHmTt+t1EQq8gweRBrOKNfGCLoLqF0TZJCxtrkI6u5/WQOTaWpcI7CgAgqrBeM1j4Eu
	01dNGY3x7lPrv11wfbo5iAoYdK3aYUYx1wGE+jedRVjVEew/qcTyR9BTDjA==
X-Google-Smtp-Source: AGHT+IHjhlZ7yNY2b9+GWivQvRi9esZbVxPIDN8cjNrwrJS7yZYm6aP3ZAdbzp7ILZn601hF6oFwiQ==
X-Received: by 2002:a17:90b:38c7:b0:32b:a333:d3dc with SMTP id 98e67ed59e1d1-33bcf8fbb2cmr12608857a91.3.1761087358792;
        Tue, 21 Oct 2025 15:55:58 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:a3ad])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33e223d11c8sm639711a91.4.2025.10.21.15.55.57
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Oct 2025 15:55:57 -0700 (PDT)
Date: Tue, 21 Oct 2025 15:55:56 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, October
 22nd
Message-ID: <aPgPfGsc9bC1mJdQ@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
October 22nd at 11:30 AM Pacific time. This meeting is a forum to
discuss development of Linux kernel debugging tools like drgn, crash,
and more.

Here is the agenda so far:

- drgn release preparations.
- Monthly drgn crash compatibility status update:
  https://github.com/osandov/drgn/issues/507.
- Macro to enum conversion wishlist:
  https://github.com/osandov/drgn/wiki/Linux-Kernel-Macro-to-Enum-Conversion-Wishlist.
- drgn kmodify write_object() bit field bug:
  https://github.com/osandov/drgn/commit/bc3bfbdf4c7ebe8b1596c8354364f4b7fa3ebc55.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
