Received: from mail-pf1-f175.google.com (mail-pf1-f175.google.com [209.85.210.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE732C11DE
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 18:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761589113; cv=none; b=i3F263xxWx3flHL8oSAxg6MuIyzti1Ozs9XrUQjAOfslclfYWsko5NSJUtvugdJlNQf5a4dhk49B4dMSCMTasQCWzCQCxcAbjjajYOeOHRUGmDwJZH/sbyBlVe+pYq6+mat9nebwdLjdx5QakU2RQPBamJmXMQvDGrZYtSZ12hY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761589113; c=relaxed/simple;
	bh=jWqR0lvASPURzOAMtlHT3VTA4aQcUUM3kXlapcpHPmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UB36MIWUF68xjLKQF7WSK+8FHesjfeNNUDc78dVQfLYfOXpRskQX2m8nNhLDPvgcK+8KKbYxCobvhLzXGhor6usGUcLu3grZ57WJApVbZUybS4x1TbP42aYOJfCTGS6oeFnAmaOu+3jxCrt7xfrEiNUxRTJuXAtRvFDdV/H1kok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=2XGQAMDU; arc=none smtp.client-ip=209.85.210.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="2XGQAMDU"
Received: by mail-pf1-f175.google.com with SMTP id d2e1a72fcca58-7a271fc7e6bso649708b3a.2
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 11:18:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1761589111; x=1762193911; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=8hHHPAlRJEB1JX0GbzKMa+2xxx7G+tpWaRTFldiRkSo=;
        b=2XGQAMDUwZRmIUYq+mmnJgFfem3F0b7mt4H4HKpLll88EHrLw6GvIOaQjQUSlVLhPF
         HfBTcET3ItW/uNcsl/YDrfJciwubzpQ1GLkEtz5V7GJnu7MhYa8I2HQMlpbV/B0tXyRP
         U2gi70FQ9+xwA+mvpO4V2WTyDlX/b4g9gW0eXCDLPzy+5OB2GCYsO6iAuHi0sBbtdCs7
         tpv+KC6SjpmcegV2CqcYoELGKjVza4PnSlQ64+9w48lhCjPOkDo/y/XS/JBYI4Zc/KDK
         ETGukjCf36yFsu1BmIGrDLJG5LHGl7J3koPOI6BceWZuG0Ls7fDYQi1sqolQFjcO60ai
         dhTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761589111; x=1762193911;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8hHHPAlRJEB1JX0GbzKMa+2xxx7G+tpWaRTFldiRkSo=;
        b=MQ5HZapz5xj/AgE0+Od7h6/P5lM1e8Mo6D/Y+3oG/X+nnYpQGN7NdTae9B8QpcSwbz
         tumnYDhr+N/Qnp0Bj9W3Dphk7/NFl+t9g0Zl9SSNGXLtGxS+mNXj1+2VSepF+415hpHv
         tJrSVRA6TA1zKXCV8qWA9UynjGtNEp2CRNnGzrVngqHU8teJ596Q2iJSqQvKVkio5/1I
         ups1UzaFfhzy1pmkLkIqAiqRZujRobYvhKwr7TM5uHd9Be/sxtvK+CW/M+RSDDNVFBWm
         hDY3NjvmKyY5RurHmq6iinfH/leLgHVhAWde0H4X7DalsM+ZPHSw8DjeeUwcr7G4qAIG
         Tbpw==
X-Forwarded-Encrypted: i=1; AJvYcCWchWMr6vr5PJO9po4F9AiNieF+FHd64S83t3VpZco/J94X/evxSYVTC3iTfBQmhn3gDjTy4hWUCsyYuRy3jLc=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+jTbLr31EmoD3VsxafwjK8qhJaxfEqMzMQmaT9SfO9HlMzkxq
	zhB/rQYC2Vgl9YiEzXMfkRoA2tdNgvyx240qjYAEWOS77yvV96QP5AwzYdef4Br2OzI=
X-Gm-Gg: ASbGncsa8yINmRZeE4bnR+W7Wwr8oq4XorIKoeAQ0r5kQ+u1MjVwUUCIFSEtmAlvMzA
	WyBFBQ2td3c42EwAq/RwNMuYT1RwrhqNqPK4V5wmi0S29K2EWAokRQG6Bj3Q/FlZ66xRIgfD/Gb
	jVmjdazJppcDAYvMVfHwrRt3D8syDEoWk1amSg1+CILqdLYFccfY4sWrdq/pLJZEVwhC+/Yn+Cv
	AR7Pms7QcSbg4YW8VkRzicgGwhggeW2NRZYKfxM+XuPZ2JZ1/984cS19PlY4W4lsCuRj/TgCTIf
	ymm7ww1TK7cffAe0op7eQ/zEaqjWAqu6zRGLim5OzYpN0f9YLP3f6UnU//PK4TO4W3NmAKLoUP9
	aPGxaSEflR4QfExRyxinC12N5eoBux1S4Ai/hPYuz3nR1s2ua3AJb11bl8Wpu7w/8NZs=
X-Google-Smtp-Source: AGHT+IH+WOVT11S4sntBjYZgzee8qptVn9rhiLytdeFJhaeg0WjK0KUKG+IPmyVHCRZ/+efgBvP/aQ==
X-Received: by 2002:a05:6a00:4b01:b0:742:94fe:c844 with SMTP id d2e1a72fcca58-7a441c09940mr515843b3a.4.1761589111082;
        Mon, 27 Oct 2025 11:18:31 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::4:c4])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414068f0fsm9053188b3a.46.2025.10.27.11.18.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 11:18:30 -0700 (PDT)
Date: Mon, 27 Oct 2025 11:18:29 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Israel Batista <linux@israelbatista.dev.br>
Cc: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
Message-ID: <aP-3dauwpc-Kq5Kh@telecaster>
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251026162156.12141-1-linux@israelbatista.dev.br>

On Sun, Oct 26, 2025 at 04:22:05PM +0000, Israel Batista wrote:
> The MEM_* constants indicating the state of the memory block are
> currently defined as macros, meaning their definitions will be omitted
> from the debuginfo on most kernel builds. This makes it harder for
> debuggers to correctly map the block state at runtime, which can be
> quite useful when analysing errors related to memory hot plugging and
> unplugging with tools such as drgn and eBPF.
> 
> Converting the constants to an enum will ensure the correct information
> is emitted by the compiler and available for the debugger, without needing
> to hard-code them into the debugger and track their changes.
> 
> Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
> ---
>  include/linux/memory.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index ba1515160894..8feba3bfcd18 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
>  unsigned long memory_block_size_bytes(void);
>  int set_memory_block_size_order(unsigned int order);
>  
> -/* These states are exposed to userspace as text strings in sysfs */
> -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
> -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
> -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
> -#define	MEM_GOING_ONLINE	(1<<3)
> -#define	MEM_CANCEL_ONLINE	(1<<4)
> -#define	MEM_CANCEL_OFFLINE	(1<<5)

What kernel version is this patch based on? It doesn't apply on mainline
because it is missing a couple of definitions added in 6.9 by commit
c5f1e2d18909 ("mm/memory_hotplug: introduce
MEM_PREPARE_ONLINE/MEM_FINISH_OFFLINE notifiers").

> +enum mem_states {

mem_state is very vague. enum memory_block_state might be a more
appropriate name.

Thanks for sending this!

Omar

> +	/* These states are exposed to userspace as text strings in sysfs */
> +	MEM_ONLINE		 = (1<<0), /* exposed to userspace */
> +	MEM_GOING_OFFLINE	 = (1<<1), /* exposed to userspace */
> +	MEM_OFFLINE		 = (1<<2), /* exposed to userspace */
> +	MEM_GOING_ONLINE	 = (1<<3),
> +	MEM_CANCEL_ONLINE	 = (1<<4),
> +	MEM_CANCEL_OFFLINE	 = (1<<5),
> +};
>  
>  struct memory_notify {
>  	unsigned long start_pfn;
> -- 
> 2.51.0
> 
> 
