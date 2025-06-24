Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8249F2222D2
	for <linux-debuggers@vger.kernel.org>; Tue, 24 Jun 2025 17:44:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750787054; cv=none; b=jeT+EJXDFTWEftU3P8LFKc9HgL0hPk8Wqvy895uuy+J8wui210cUBryO/JfeuEU/lOIFYVGsYIjdcD+ohTBTfo752YdgwVQxgNev/rmc7W17Jz0d9snq5cLq4ypJFQ1o8d4e3+kFgK1iyub5d2+g09/R/EjfTGt+bhhFlqa2/Xw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750787054; c=relaxed/simple;
	bh=dZFx6Mld9o8r3Xi2AGxgS/Ya2OUsM6aElqjNcMUSaqc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=KA2WA3T1X0+ScyQxaSrpRXAf7cj+Pbi7niuCSY4EIV7NxWRitdoGP9k6PIocKaa+xVLnxe9timN+3os/u1TnD9ThmAa61rTGcM8yqpFG6dz2BPjicDGqwfhAd9NywlnllSTa8Ym36fMMUeRAnTnGHHvJSaR//DspENv0EtMIHXk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=pvKK3AT5; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="pvKK3AT5"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-312a806f002so551953a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 24 Jun 2025 10:44:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1750787051; x=1751391851; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+j38USpDB+GWPky0zyc9D94tWNlYVxKGccBHZ2e4geM=;
        b=pvKK3AT5RJmr0M9d4LgwiDpdGACFpGz6y6IEFJkNZZTA/+WzpUXT7ZIjnAc2384Tex
         ct94Hu6oF7nFrmx45kmEKBzqSa/MIUZc3d1XmYEeu4xUnEbCOsM2eQGciAdM+7XhArVU
         gz/aRFFMQmreeE8j6IHM7vBz1w3buPPX1DZgQFjOs/08lId5KvmC1tnckK5pcJA1r12r
         aGAu0zAHFOMFGejs6+4hKtwuM2pGa3+IbIsEmaeXQiscAQhUqV6/hI31Po/tOaj4VmPW
         ejYUDn6qnPH27lsN5kjG2XQc5Q8FTduVtFKtZNQL6eLU4w0px9yvOyKiIaf9G4ykMqfI
         bnRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750787051; x=1751391851;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+j38USpDB+GWPky0zyc9D94tWNlYVxKGccBHZ2e4geM=;
        b=mSnwqfg7F/ksGWB30Jx5LSEN3drjq4UWV9vuNPTdoX0FkBi3p32Gk8oeS/TSnDo0kM
         Cc6dUclX2EBH7TvjQMUJ+EPQ3dA/twMKAEZ8+InvpWksDEOdZUTFTZPlV+jqnhz89VVy
         RXoKM+LkeczRiIEMO8Pyy43Z+93dWjFhC2daZj6jFr9lFJPFjDt3OHU62cZWf0Pf6nhI
         rPQQN6wz6dSY1r1wfnbsZ3qHlgkZ1nbuMyhrAEWq0iJIReF0aMoTBbXj6mrGxD6XsHou
         pLcGeHnI0LOuajjOphXxMz6fakpOoolQe1AFYqDH27iP1/fvSV4u4zSgaBpFPdNuTsGs
         fa8Q==
X-Gm-Message-State: AOJu0Yz/4F27nTxvcWLMa5LIK3VTUrOQzoUEZbxbgKgx5xgbJRPZf8hS
	rmkDADEAJrMADJ41Ik8L2C/WnTyIJcRCdBijUeqwo6orPhxY5TOI5LLlNHF3CrSzXLtqNdlX7yx
	RGpTU
X-Gm-Gg: ASbGnctMaMgbIAOadc//LvSnPxDG8jvwss2Uin88NohuSgLkFmbJmF5XVHtoPCuAtVz
	fB1V+dQRnPWjeEzwJPWFIFTM4q++NtZpQPwnJ1FXDFl7rC7Bi4vwrtLMWysI1eGk6ytpyX77vm5
	omGPuBNVbOfM0xm1s7V6PcaWWuOtt5JUGHibkGhK1AjmFFl40fg/1SjkZyZQVy/yJ9UEljS2AgD
	mr8+Y9pyJ8oq+dFQGmkdLkH08c5WG2Tp1y8fSfH8p0ns9R/5uY6wokbR3cHL2wx0UK6XZ/DsMO0
	KKoJhJOmeDTwjbzpQ7Frcuj2ReWLBwYs10wqQPzZsqoU
X-Google-Smtp-Source: AGHT+IEG1FconY101BP2bAU0VB4lOkq9L/9J6WbksxpXv8Wm3DL7OW11gwgz+uV6yQPUY3WJvqA8ew==
X-Received: by 2002:a17:90b:57ee:b0:312:ec:411a with SMTP id 98e67ed59e1d1-3159d8c6488mr9890442a91.3.1750787051409;
        Tue, 24 Jun 2025 10:44:11 -0700 (PDT)
Received: from telecaster ([2601:602:8980:2c70::1fb])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3159df93ae4sm10912653a91.22.2025.06.24.10.44.10
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Jun 2025 10:44:11 -0700 (PDT)
Date: Tue, 24 Jun 2025 10:44:10 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, June 25th
Message-ID: <aFrj6ggBR1z4M1wQ@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
June 25th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- Porting crash commands to drgn: progress and sign-ups. See
  https://github.com/osandov/drgn/issues/507 and
  https://github.com/users/osandov/projects/2.
- Migrating drgn's build system to Meson.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
