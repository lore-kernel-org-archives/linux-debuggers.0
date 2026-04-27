Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06D5B364E81
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Apr 2026 20:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777322886; cv=none; b=UzaoQKnrK3vJZXOQ70VMlPmkmglspUiK92lmFZgskaWGq7GYGb5BGDziyxKIGzyH2vG+tiyR9MSMuA7ejESXd5D4I76flrWmmzgiZDGLQEyk1DwDXb21NrwTeiYWb8JttMyJtze1ganlvaoaue6QMkKqhRFJ/bnZ3onlBF+FIFY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777322886; c=relaxed/simple;
	bh=OYZquLirpAbHxIaWIo9QLY0u+7IEtAkkjn9+CQz7ebg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FXHNHerq2If0G9PgbkZ39O2CRUOV9UWmRWRGgujPqHhHdiUkN72McSqgh3Wj6egOnEnImDqAXGz+kZ/ifDjqXBOxzvrCazx+hPefMeRYjv71R88u3wGGdt/YoBE1DMX2/z3VgQcabQKF35z9p/GK9x15NgDSsNG/w3DVXRDD5rQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=HGu69O6f; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="HGu69O6f"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-12c8c3f48deso409834c88.2
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Apr 2026 13:48:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1777322884; x=1777927684; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=NrpFP9W06UpCIRfe1+NjkVUyD89PsmxrZiNRzVySX60=;
        b=HGu69O6frr/qL6emCewLsqtHqRr97Ah+WID+fS3Nz8LAVNKr0YGU6bZOV+pGFptr97
         Bv7g/5tneRudGeAz4NofDsmfRDFxYVmmYA7zrHHmG8qn+o0rsNzkKYE9IkI376OhR3fy
         1+tcL0HAK0wyy6zQA1qTGggvXuWMJOuxcoWeqL2vartGhKhmivU9otOqmCmRxi36Fcui
         LjjmgXr+Mfs+15XEc0q3fuJ6frXWT1tVdUq04Is5qJ2lXniAIlrXVYCcz7PcVPNI0Ntu
         ZCJmGsNR0eexBynlUmlyArmyrgPd10hGwYzOpHwfDnxT6Z1X+ZbtlET4xqrG97s+2ots
         YEqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777322884; x=1777927684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=NrpFP9W06UpCIRfe1+NjkVUyD89PsmxrZiNRzVySX60=;
        b=f8r3mwkcgSZGZUSUJ3zBD+OlQLZome44Wsej5FxdJN7I8Nsz+aLh668QlR/M/6pxU4
         NIxWa/hqH+AW5q5zaRPCA9DiwRkIEpQhI4XUnJaSoDLbwOA/QAn6wbciRTS/UG1II3Vx
         LYf0/YyhYfxEhFHIh19Z/98dif1rd6oHcvY9awh1g6J+VZBYl9yG33qWjR8HVi8ZgZ9K
         8sVsEVrnaQXDnIZIwa5qC+Xz93zPPBDkAY7iuWobw09mY9nY2X2ljCf+ER6P3fivOHCH
         RFwX11Y/f9aZDbRBgNdwr2Zu170p21Vz/6aDvJmh/RGii2b93US7pYXp/xslDGwp/jGE
         9FLg==
X-Gm-Message-State: AOJu0Yx9aLONKn261w2xEpYGNg25+OzUxCWyS8tMC+fbhZ+UmLBUtVXl
	mAjF4WwYYh1wDZcjh4rnV1tBcyaSNBz3sEVLxUyOGQFAn4gbw7gBeeyD7qGGN4HsTIU=
X-Gm-Gg: AeBDiesxh48BJQgsoYS6TwDVH4BCtNiae7WtG3YSd3Gs7p6C+GAUBB+OkoPc+YFpEph
	d+TIVm9wXP/yqNhz7Gfbc8p7bG7+lYlbZcqGTlt6jdfSXqNSPUM1aZkpfvKSN/1Rv0e1L51cLg3
	Ywr2LWKeHalKE8KWYw0GUGKoGuuOpFAyIlZ2zJSulUauqAv/Goz4zEiwpE//U2EGhhERZXQb6el
	G7lTl7iC5e97mrP8Q/WRrfMNeyXUps9yavflKRcEtDZRIq2Nb5UhJoC1l7oWGUfE8BJtdEDlcfJ
	x8Ja8h+5LDhxR9gcTBH3n+Y2EpzKP2D/2k50qG4UiCKzxuGea0ZMlV668gv27Bz3Fk9CHL2VP9D
	eFTN6Xq7V2F+sVXkyLRzmAGF9ByIxMczUhoIwjaNYFw++6Qz72Hx6vDb94eDC75L3+KbNZCbvyt
	EVsXoio2Pw61eIE8xhRq3YD2ERrFdLb6Btt73MA5Q+yfklK9EVYQ==
X-Received: by 2002:a05:7300:72c9:b0:2e5:faa9:ca76 with SMTP id 5a478bee46e88-2ed09c3094dmr115570eec.7.1777322883807;
        Mon, 27 Apr 2026 13:48:03 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::3:9e14])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2ed0a10650esm474976eec.22.2026.04.27.13.48.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Apr 2026 13:48:03 -0700 (PDT)
Date: Mon, 27 Apr 2026 13:48:01 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: linux-debuggers@vger.kernel.org, kernel-team@fb.com
Subject: Re: [PATCH] riscv: fix vmemmap and vmalloc offsets in /proc/kcore
Message-ID: <ae_LgT-xmJ8YOMHr@telecaster>
References: <5273041dacfde780bbc917660537783c354e0598.1770323325.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5273041dacfde780bbc917660537783c354e0598.1770323325.git.osandov@fb.com>

On Thu, Feb 05, 2026 at 12:31:20PM -0800, Omar Sandoval wrote:
> From: Omar Sandoval <osandov@fb.com>
> 
> kc_vaddr_to_offset() maps a kernel virtual address to its file offset in
> /proc/kcore. The default definition is (address - PAGE_OFFSET). However, on
> RISC-V, the vmemmap and vmalloc regions are below PAGE_OFFSET, so the computed
> offsets for those regions are negative and wrap around to a large u64:
> 
>   # readelf -l /proc/kcore
>   ...
>   Program Headers:
>     Type           Offset             VirtAddr           PhysAddr
>                    FileSiz            MemSiz              Flags  Align
>   ...
>     LOAD           0xffc0000000002000 0xff20000000000000 0xffffffffffffffff
>                    0x0040000000000000 0x0040000000000000  RWE    0x1000
>   ...
> 
> When userspace applications like drgn attempt to read from that offset, it
> overflows an loff_t and results in EINVAL.
> 
> Fix it by defining an alternate kc_vaddr_to_offset() that masks off the
> high bits, which is what x86-64 does, too.
> 
> Fixes: 07037db5d479 ("RISC-V: Paging and MMU")
> Cc: stable@vger.kernel.org
> Signed-off-by: Omar Sandoval <osandov@fb.com>
> ---
> Based on Linus' tree as of 8fdb05de0e2db89d8f56144c60ab784812e8c3b7.
> 
> This method doesn't work for riscv32 since VA_BITS == BITS_PER_LONG
> there. But, I think riscv32 can get away with the wrapped 32-bit
> integers as long as userspace is using _FILE_OFFSET_BITS=64. I don't
> have a riscv32 userspace environment available to test it.

Ping. I've been carrying this patch for my test builds for a few
releases with no problems. It'd be great to get it resolved.

Thanks,
Omar
