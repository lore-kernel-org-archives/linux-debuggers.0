Received: from mail-pj1-f43.google.com (mail-pj1-f43.google.com [209.85.216.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 922CB72626
	for <linux-debuggers@vger.kernel.org>; Wed,  7 May 2025 23:13:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746659587; cv=none; b=lSFnLHxvFZubrKoiNJzRPO/Sb8IOlYQcHg7QcnOriA7Z6jCOprbwV6Q5+/XlmwY35Lpy80alTMKVFjGLX5XrCKf7Iw+454MhmafxUctI0f80nIRJohVODRyRfEOZbo+MHMXwO/ul/eOm8ZQHJF8wRPfDRoWzJ/VCH+dp+oaWHQY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746659587; c=relaxed/simple;
	bh=VpRYCxbgwTqyjkzN/WuYkouF17B9EPHH8+zr5YUI1SQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DwfBiH75J2sYrxO7aPYzL2D45vh1vftSTWXScnoc1V1nDas0VAbBKpY7vnhGCKLAhLLh0kOa9HZWVIdLNRoaZxsxLpKrcaXjWxQJ3BApTw+htvyvYZJwgN98M88ieIExPQ8iFPGRq28sV/bVT2RJ/3Zjc3321SfhMCN3DRgP/hs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=P8X/6VT/; arc=none smtp.client-ip=209.85.216.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="P8X/6VT/"
Received: by mail-pj1-f43.google.com with SMTP id 98e67ed59e1d1-3054e2d13a7so58047a91.2
        for <linux-debuggers@vger.kernel.org>; Wed, 07 May 2025 16:13:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1746659585; x=1747264385; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bze+nlRK9GdebdTiqCcyHrSNtG9GFSGfKrcCqT38XaI=;
        b=P8X/6VT/bH+DNaO2+oHs867bT2Z/O9Wr3sVgbS0Yk0/qu5GsyU3S13zK6kBGdmYQRq
         eHZUhBEkZaZwhSCl44wfEjpwi8mKJMtWKI8v8lLBEw4PLAhPwykLFh/UMZ7twDTkHKp/
         Kg87QcW6dVdopQ1rGp/DT3MXq/1K8OWrUbDDH+aKTxmjMBH1DPLewWXxIsYwaoLWQpWO
         OKNHalSLGpGFWTmwNLwkRMctryJEr9hQP5qIkhaaciVh/qtWPmJuEeQUnQB//2DByd8I
         BcMXLJtmQ+eQuk6Zmf78xLCZalerB+bo4w1dDAUOg7nc1SmcAM3UbuRcaI8LIK3WodkN
         pH8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746659585; x=1747264385;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bze+nlRK9GdebdTiqCcyHrSNtG9GFSGfKrcCqT38XaI=;
        b=C+4YZLiGtxs+4qpsRUU1Y1RpZbBy+oBeVJF4STi73039OCj0IGwHUAdK3zzgsjOTKt
         Z/j8hmYSoJUxvKnE+5kSC7+vvy0Y2JokbJYVX+NkMwhae6Z/IamQSNqy2uuOAqjbaBoE
         X0Kd1RvVQyVoKkGBXUZsYsUcMtfUPlcSvPfk2CpO+UoiQkNGDz8fepv6BkT1DFZ1k9pu
         MqRGp0iCfUj3onE6Kf9rvWqNzmEDoOd9CdTzwzVzQwm3rBvTWFqE47aS4kven45Wtn82
         eo4Stw+jnFvgfVoPP3JoiQMDOwsIqH08S1vOhEypWJbQkeAqqyDyeCIjWjRothT/3i7V
         +zUA==
X-Forwarded-Encrypted: i=1; AJvYcCUD8sKdfIt8QGXJR5/+PXCoiS86DJzTmIcwVljz3agPj8KYHxeqaYKSn2nwi/tCs3DBW3a0kWt93cYl6ypZrjM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzBR86XEkX5deMvOwdhkJAE5NI/NOSEhkRa251xzvdAbrcqSYgx
	UVfNCDkfWFKwgq/Ay5CiTniHaHQH6g6pIYqRWDNMrvmYWgYs2toy5AXCtWS6Ld0=
X-Gm-Gg: ASbGncv3QT+KlGz07Mv/J/Xe+UUL93P1cXvxEOuXoHhKg5WGVINe0bThsb1MabqVCzv
	cAfX8JKv04w1pvSa7OkPsm8lvvIeRSLwbKCEY3PQbx1/BXMB0LBUgzCwb/1bo1JvuHKN6gIC8Rt
	uK3l6pMOolMTXPblXJXgsnfMu0FP/iy5AAxlw1d5ofPv/6ZFZsOo03XToWfjDzmw4HXMnw09fP3
	sH1ol5CwFPswlp9vWTQ2CbDLlzTpdfmymquo4guLLecLZr9qsYFhRPCw9Vp2xUjhQYwA4eiSoF1
	k+qkpWAEmmBbWtKga2ClIE4=
X-Google-Smtp-Source: AGHT+IHXf2uaAFydOllzDh6nhZaOcR5ywT2UaACaV2lmI5F+DIMWgpuh5HCG0Ql/E9CoWvoaXWr8HA==
X-Received: by 2002:a17:90b:3e83:b0:30a:80bc:ad5 with SMTP id 98e67ed59e1d1-30aac1f1bd8mr3014058a91.3.1746659584720;
        Wed, 07 May 2025 16:13:04 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::71f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e152204desm100243565ad.140.2025.05.07.16.13.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:13:04 -0700 (PDT)
Date: Wed, 7 May 2025 16:13:03 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>,
	Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	Sentaro Onizuka <sentaro@amazon.com>
Subject: Re: [PATCH] fs: convert mount flags to enum
Message-ID: <aBvo_-Ee7QQtd3YU@telecaster>
References: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
 <20250507230511.GA2023217@ZenIV>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250507230511.GA2023217@ZenIV>

On Thu, May 08, 2025 at 12:05:11AM +0100, Al Viro wrote:
> On Wed, May 07, 2025 at 03:34:01PM -0700, Stephen Brennan wrote:
> > In prior kernel versions (5.8-6.8), commit 9f6c61f96f2d9 ("proc/mounts:
> > add cursor") introduced MNT_CURSOR, a flag used by readers from
> > /proc/mounts to keep their place while reading the file. Later, commit
> > 2eea9ce4310d8 ("mounts: keep list of mounts in an rbtree") removed this
> > flag and its value has since been repurposed.
> > 
> > For debuggers iterating over the list of mounts, cursors should be
> > skipped as they are irrelevant. Detecting whether an element is a cursor
> > can be difficult. Since the MNT_CURSOR flag is a preprocessor constant,
> > it's not present in debuginfo, and since its value is repurposed, we
> > cannot hard-code it. For this specific issue, cursors are possible to
> > detect in other ways, but ideally, we would be able to read the mount
> > flag definitions out of the debuginfo. For that reason, convert the
> > mount flags to an enum.
> 
> Just a warning - there's a bunch of pending changes in that area,
> so debuggers are going to be in trouble anyway.
> 
> Folks, VFS data structures do *NOT* come with any stability warranties.
> Especially if the object in question is not even defined in include/*/*...
> 
> _Anything_ that tries to play with these objects must be version-dependent
> and be ready to be broken by changes in underlying code at zero notice.

That's totally fine, we can deal with breakages as long as we can
reliably detect what version we're dealing with. We can see changed enum
values, renamed/removed structure members, etc., so that's why those are
preferable. Macros are invisible at the debug info level (since no one
compiles with -g3), so those are no good for us. We also avoid version
checks as much as possible because backports in RHEL and co. make
version numbers mostly meaningless.
