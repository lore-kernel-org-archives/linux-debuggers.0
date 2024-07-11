Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B6DB1A071C
	for <linux-debuggers@vger.kernel.org>; Thu, 11 Jul 2024 23:00:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720738803; cv=none; b=P0SN0RUi0GSGOB3F1n/AnbF6KYI0p0VpK7lC5SDcGisOsAJjjW/VYGCoV+JJNukQYkkT2YtIQ2UHNhLbzk/mdS9OuOcD7p6FW4mqwjJ/C6bKUP+X6bV+siqlQWw2mAFFmnXc39+p1AjvL8u+Vy/DIG1OsX58qdBPG8FWBsb1G4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720738803; c=relaxed/simple;
	bh=Mqu4c3n9l9GcpDukOR3L7lhDohtrNJ2FNiM3uGc+Y54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GH7G9o7ZsnZiwca4jWwvzso+3irdQ7Jt6/Ptol17I+zOQMdrEKYRo8fFF8moJoqlAyq1wZhTB7qfxpM15VUNdvf9tF2jN6SUvvIkvqjfAsNh5ihipfseZEury51SVYE3JObUXC313NhAf4s9YOAOEIKI9/eiPgFwl/ZtuM+/N2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=ipI5jIii; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="ipI5jIii"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7662181d487so869736a12.2
        for <linux-debuggers@vger.kernel.org>; Thu, 11 Jul 2024 16:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1720738801; x=1721343601; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9EOAxQEAfVOf0C127/72XKyPpvIPkkiRLCuzsJIS3T0=;
        b=ipI5jIiiLyZL3MLJBAmHfNqezUoUceE/F9RVLS1ScKgpZNhFH6E1Ts747vPsxWehr1
         zAvSLht6aZgIY8WgiNLkNz3/jawOZPvFU5BJtRb7/UuzTU6vYF8ZKENe/5XjJHb5Y52k
         hwz60wqtXE5twiIQ4W3xiriXAwhRSGgLRDx2bzok4U6s7IyFFBXstitfEQnRkNBtQeyy
         +MLDeFs2z/0uD8kHJnN7tIbOp8MRTdXZ3ws5BJJGmbYuZSFjQsB4w90NDkQJf4GJE1dT
         rekgkgWX7fjJcUAAiHczXEFycik9pHM/MJivFobncZcIJ6DTfvRqVNfjila7PAiYj3+8
         UFpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720738801; x=1721343601;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9EOAxQEAfVOf0C127/72XKyPpvIPkkiRLCuzsJIS3T0=;
        b=eQK6QEaOfQzSwo0f6TRug42ptchMRLRFoCLTXw12mrPzl6yqYEgJq0mjOoVKaRBP/K
         x3tUXaBhH1/TM7GJ4RcVwHmLqevv9FECTVkE0k0VvzlaIFyXUPFsaRJA3uCRpRKFRtiK
         zUfdCrhiBt3E8ys/thaI1OMfhWgos7D9FZo+jkatsOOA4GMQhbiw3jnSW4y5ppr4LB1A
         Ho+7h14H/TuL66o2iqE28LNhi+vhnZoPiCUclx4oSR6Y8yYtbG7bZI+fr1nDNMSwl8QI
         CjHG+J3jRUewYCJz7mQOHbRWQXa6KLZ8ezEqcJUaGL8ocxGCeTY4xKNf9Z1wVimBa9qC
         0QcA==
X-Forwarded-Encrypted: i=1; AJvYcCWjKzb08Nyq2ASmnB8TZwwWFla0TxvpaHPJ5P7Qn1WCtudyUa+oHB2puee9xUlMvD0QgFvq2N+HubGNvIrZH/ti6RQEfdgfMloEabMvvG5k
X-Gm-Message-State: AOJu0Yz2PZJ8xzwMsfVW6Sa/PGZBdvAe1ZCtKXr8lN9gXSaM/f+o0g10
	db90iAlAFUSoTqiZwyzAX1PJp+WtJNC96nmyjfQnnaL79itUgyAJ5XKV8cEv9AfVZ3/E7e7VFSG
	5
X-Google-Smtp-Source: AGHT+IE6p778roYmHL1HUlVvRAcmhLwZRfLcLT2M6uJ0Kpnoa7hWkcKkA1w23rE7JhwZ+J9uXywSag==
X-Received: by 2002:a05:6a20:6a05:b0:1c0:e8a3:dbfa with SMTP id adf61e73a8af0-1c29820b8a0mr12348196637.2.1720738801386;
        Thu, 11 Jul 2024 16:00:01 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fbb6a11762sm55642885ad.23.2024.07.11.16.00.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 11 Jul 2024 16:00:00 -0700 (PDT)
Date: Thu, 11 Jul 2024 16:00:00 -0700
From: Omar Sandoval <osandov@osandov.com>
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: elfutils-devel@sourceware.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH 0/3] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <ZpBj8Bmqnltd-cfj@telecaster>
References: <cover.1720644134.git.osandov@fb.com>
 <20240711201625.GD2826@redhat.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240711201625.GD2826@redhat.com>

On Thu, Jul 11, 2024 at 04:16:25PM -0400, Frank Ch. Eigler wrote:
> Hi, Omar -
> 
> Thanks.  I wish this sort of amazing kludge weren't necessary, but
> given that it helps, so be it.
> 
> I'd like to commend you on the effort needed to match your code up
> with the stylistic idiosyncracies of the debuginfod c++ code.  It
> looks just like the other code.  My only reservation is the schema
> change.  Reindexing some of our large repos takes WEEKS.  Here's a
> possible way to avoid that:
> 
> - Preserve the current BUILDID schema id and tables as is.
> 
> - Add a new table for the intra-archive coordinates.  Think of it like a cache.
>   Index it with archive-file-name and content-file-name (source0, source1 IIRC).
> 
> - During a fetch out of the archive-file-name, check whether the new
>   table has a record for that file.  If yes, cache hit, go through to
>   the xz extraction stuff, winner!
> 
> - If not, try the is_seekable() check on the archive.  If it is true, we have an
>   archive that should be seekable, but we don't have it in the intra-archive cache.
>   So take this opportunity to index that archive (only), populate the cache table,
>   as the archive is being extracted.  (No need to use the new cache data then, since
>   we've just paid the effort of decompressing/reading the whole thing already.)
> 
> - Need to confirm that during grooming, a disappeared
>   archive-file-name would also drop the corresponding intra-archive
>   rows.
> 
> - Heck, during grooming or scanning, maybe the tool could preemptively
>   do the intra-archive coordinate cache thing if it's not already
>   done, just to defeat the latency of doing it on demand.
> 
> 
> What do you think?

Hi, Frank,

I didn't realize how expensive reindexing could be, thank you for
pointing that out.  Your proposal makes sense to me, I'll rework this.

Thanks,
Omar
