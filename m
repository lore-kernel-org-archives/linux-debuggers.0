Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11AF321507F
	for <linux-debuggers@vger.kernel.org>; Fri,  4 Apr 2025 20:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743797361; cv=none; b=SY0uLfxKbcKo72xPdCo+ACf2lGlp4//oRizP8qodsj1ScsbECgUhLcokJlJ5F9B+ZlpTzuK791xSjN9NWSPAtTzZX6JlZEdQla/GNKPoOlAz5wOEZKeLDZt2lxQDGyLxa7JD0Ps+e+fFIaNJ3OfNU7mWwv4GowGvDHCDiRckjg8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743797361; c=relaxed/simple;
	bh=WSKxe2ckBAmpTLe9Q8397TO+s/fmTCjbFmpkba7x8dY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gbr7prW2nB/7m86iOm35hlfpzlXtU9+A+MSDYcdBie/n+oFcBfgQDx1EjWTUophiWdc9SeKvAm3Htk7rmqkdHjBBsTkUOLq1MkKkp1D8mQzs/b9v+FvNfJwOEgUYko/BC6unFyEyjgLmHhlDsRhi7+UvJwN950esT0n7BhJ4d1g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=q12Dqxpv; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="q12Dqxpv"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2260202c2a1so3518925ad.3
        for <linux-debuggers@vger.kernel.org>; Fri, 04 Apr 2025 13:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1743797359; x=1744402159; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=mOFNNhssv/3PObPeS25HGL8WRFCng/TdO7nRt/IAgxc=;
        b=q12Dqxpve8edZn3XBflgtMbqCrpsTqZL+i0mISuTgdPSry3aWl8vfZG2wtAIymgF+j
         wSsuKQ1uOaf6lI180GK4A5emgvOUKexpWwRb/w7yVZcGWWB+/9OwaJKXTyqFXrF+qyLM
         urm2ZPYBihGJOoTFWfVw0etG3Fu2asD+fWYWopSLBezFK2FyYReghRaWWiotFv9iOerP
         rn3HU+ylrPvVSVaTcWpi6IjQGxxC7PXMvHLV8qVCg9C0dWUIOob2tbmA2ijNVT4JMp0b
         KMOka232eElEqWtqFf57WTh36928hi5bVsz+Wo+5u2xsYSY+BADUTfcTTNY2abLGp+/3
         SjuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743797359; x=1744402159;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mOFNNhssv/3PObPeS25HGL8WRFCng/TdO7nRt/IAgxc=;
        b=Jchs1HlNCEqo0FsTLQmXYmcQtrsXFGND66Y6dsbUWfJ2Poy+rgdn9olenkmdSAFt2n
         Uv0IPuZObOAZP/aboi9lnWJjV7I2+Rdzlbx+OH3J+YsoRwQIU9/Xp0XpKds14z3Dhd7W
         GfFtrM3R4/E7FAscfUQZxUdjwQ682anRk1xqiK0WxrE7guFWqO+DEMHDXQW2sA55mdFN
         jtxjStF3L66dOBzwfLZ+Vz91RnAHNAeb6OUhlW/fMA7L7ZU1EUq7yguK875uSd/YozSX
         QjB59vEkOqm9c9dGQ2zdueEIvDzCHlnrjG4Vw7UdfhvYEN3KW8FrDSpqFojwF/3VXFzw
         8S4g==
X-Gm-Message-State: AOJu0YxOz6VXpdzE85fbcKmaa5y+fVZ15g0Iv2KxTrO5h51GeaCkR2+Z
	jyrulO4ldpoeBESWZefJW3K6nEizEcS4ntybLmIGlVv6oqUJM/UNVgWPpxqLjssVeaKLFCOn377
	i
X-Gm-Gg: ASbGncsb5nFwEdes5BwcQ+Z4veDILmRzgII/7FJLwKYhLOospFFenYOzNo0wBw0gum5
	iAAfQEvLSPJ8cnSabD7LSZ7JgAXeCA2SX7PE9bXAzgNsrB7qKnp0mU6Vd608pgK+r1dxCdzJBt2
	3eQMDdJgrzAyT7sikySMyCDQGGiaamLsFzfeYJaRK1ZxYbrmkHvYSwGhwVNALqLvZSRK8dn8JkP
	PFYfUgE39ZTyiPH4cGoNG6eaOu+krA8Mbl8GwYoUD1A8dN7hB7cHQkGjCf47c37WG3D8Gvj4r9e
	vu1CRZknW8f6mgbZFlAafCbb2+ZW
X-Google-Smtp-Source: AGHT+IHcwxarxQ+Oo5QNWQ1lo4494t0vDLua0KKk7q5HdWECsUR0DCPY+qvVNcrYGVRqbHnPaKErfQ==
X-Received: by 2002:a17:902:f54d:b0:216:3dd1:5460 with SMTP id d9443c01a7336-22a8a055293mr17474775ad.2.1743797359214;
        Fri, 04 Apr 2025 13:09:19 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::4:2b52])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2297865e0b4sm36846405ad.154.2025.04.04.13.09.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 04 Apr 2025 13:09:18 -0700 (PDT)
Date: Fri, 4 Apr 2025 13:09:17 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Adrian Johnston <adrian3@gmail.com>
Cc: linux-debuggers@vger.kernel.org
Subject: Re: Fwd: Debugger for mapcount/reference counting issues
Message-ID: <Z_A8bYidN9w4YJv2@telecaster>
References: <CAMtebmKLJ4MaXsNX5zeJN5MoZP+x7_qAru5R+F1WBh10Vzj3=A@mail.gmail.com>
 <CAMtebm+fzVE6iVst=mT5ecWK66C80pM4eFi5SXtU2F46kaGm4Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMtebm+fzVE6iVst=mT5ecWK66C80pM4eFi5SXtU2F46kaGm4Q@mail.gmail.com>

On Fri, Mar 28, 2025 at 08:24:47PM -0700, Adrian Johnston wrote:
> I was just reading an article about the long running
> mapcount/reference counting issues in the kernel over on LWN.
> https://lwn.net/Articles/1013956/bigpage
> 
> And I'd like to make a recommendation in this ongoing discussion.
> 
> The kernel would benefit from a reference count debugger.  This is a
> debug build only tool that keeps track of the owner of each increment
> to a reference count and then confirms that each call to release a
> reference count has an owner that matches an increment by a previously
> registered owner.  This enforces an ownership match between allocation
> and release of each reference count increment, even in ad hoc code. It
> would also be able to validate the reference counter independently
> when resources are being processed, created and destroyed.
> 
> Ideally this tool would be able to show calls stacks associated with
> release operations that have unregistered owners and call stacks for
> leaked reference increments at system shutdown.  Having this type of
> tool enabled on your integration build (linux-next) might save you a
> lot of debugging.
> 
> Personally, I don't think this is a good problem to have and would
> argue that every resource should have a single owner that arbitrates
> it's life cycle.  But there are tools that can help if reference
> counting is necessary.
> 
> All the best,
> Adrian Johnston

Hi,

What you described sounds very similar to ref_tracker:

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/include/linux/ref_tracker.h
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=4e66934eaadc83b27ada8d42b60894018f3bfabf

It doesn't seem to be used very widely, but it has proven useful for
debugging network namespace leaks.

Thanks,
Omar
