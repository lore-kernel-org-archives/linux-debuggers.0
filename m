Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFCB015253E
	for <linux-debuggers@vger.kernel.org>; Thu,  6 Jun 2024 17:34:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717695279; cv=none; b=SdYpHEZs53yd6XBel+H0tW3fH7tQizm8oeIdv05xz0Y8vPYn6PxmJczw8lVOZPIh8HBEGPpDINkHZu4nkl5ucbPW81K6olGQzGRN+OKG12+A4hZG0E64S98X82SsdRAS6JVyfni3GEd9cCaIfveXxQ3Q9C05C13+KiJW/9FUrZU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717695279; c=relaxed/simple;
	bh=Mwm44gSX2pJSO1DQZKq/bU47/WAyUUvkVlSXQ5KADlE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k+oj2vIUgGjAvCmY7yZm1sKtqT9jF55UNGUGVbI1qogd2HvpRGRvXyavvv8Ntv35813N8Lahq5XG1P3FbzZO2gmijCo+mYcHHWO3RF4tQblW9RRig5oRF1QYMYqpqG2i6Oi0PyZRFVTajF+lyhNG3ah4Lw4RBqGyAzQvpcCR5VY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=YJO1Diat; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="YJO1Diat"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1f6c7cdec83so5950735ad.0
        for <linux-debuggers@vger.kernel.org>; Thu, 06 Jun 2024 10:34:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1717695276; x=1718300076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=AAulxVnYL/xyKaB3vnDRoKBoF0F084Ubuhab5n7H9jo=;
        b=YJO1Diat12qRHgRFZWWqBb3KbE33vc5ktBSHZTqYRHvyq4z4Z+2fKwebosbdoHGZsq
         fd04O80vSJ4FLQsa5wbXmUmbbS5Izkx0Bpaz17aO+Zqt/mSyAGq7iuBbABhW6CIsZszR
         WJyq6aE02SrNBKBkwctYJLM9dqZV0zGIlBgN9bHVxyXtYcpACpUtSmABkPUv7n4U+nxd
         hn8J7rcTf6Dy4YyqEX/c9OzGhgJtp+uVmuLNU/DOWCjNqmxIYPDKPoWRr9HmCXKcAXja
         SebV03S5FUqTRloqn2Zl6tXQyeG9rUmBCHu/gL0VYBLR8ACtPAkazyB6mhvb8OiCREKF
         0A7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717695276; x=1718300076;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AAulxVnYL/xyKaB3vnDRoKBoF0F084Ubuhab5n7H9jo=;
        b=qI+vqwY776PMLOj7gjnH2b0mt04sf2Aux/QxzHth0ElylWEn2Sg0xF9thWF+91phwr
         EYbIsmnXEOwyVmYoSeO6lbHtnu0MGC4KDrwd4SL8xRCDAu1UqmjTeCp7J8yQAFvV1NxE
         l75WY2EYUR5dWbNIHVTe5GPrAZjM6Goe51JZyJFs9z33Z4sejJvdwRE5+2SsEHz+xht/
         CshW0CVZIJEmv330OD/nErMOqq1JmqcC5oEljfKn7kxQHMPawSqPsbCLIz6Mkh7uRFVg
         yAewnzqOzgOQjP57BeDz0RpL1RHyoaVcWDAie4KtFOge4jlPV2uwJ3eGHEyxUuPLVfiS
         S5mw==
X-Forwarded-Encrypted: i=1; AJvYcCXJOthpj8xbTcQ4hKVSZ4tPxvRi3znGEXdATCWZYnK/Pn9gEAYOkhi3eMJtmhJQCPWty3c8xp75rk08omxtekFiGTSqfzBIhaF/LEF5dSeF
X-Gm-Message-State: AOJu0YweBT/p6LKRHC0f3cdJYzKnr7s/c6rG7TgYbxgXbZL2yBYMy18N
	06jch98Z7/08e0hu6d3bn4lhvt0TIVHjO5Q7zvF5MArQ49tXyHB+Rn24ptserBk=
X-Google-Smtp-Source: AGHT+IFF5YghgVig/RYReBOoP5uz9DUPAWXJpwtPKtVnFV4hSzqDyvhiRUIt9MC0+IujJ6KGfql9Zw==
X-Received: by 2002:a17:902:dac6:b0:1f6:678c:9e8c with SMTP id d9443c01a7336-1f6d03be125mr2564165ad.67.1717695275716;
        Thu, 06 Jun 2024 10:34:35 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:400::5:ae4b])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f6bd76aa80sm17769735ad.69.2024.06.06.10.34.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 06 Jun 2024 10:34:35 -0700 (PDT)
Date: Thu, 6 Jun 2024 10:34:33 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	linux-kernel@vger.kernel.org, David Hildenbrand <david@redhat.com>,
	Hao Ge <gehao@kylinos.cn>, Vlastimil Babka <vbabka@suse.cz>,
	"Vishal Moola (Oracle)" <vishal.moola@gmail.com>,
	"Matthew Wilcox (Oracle)" <willy@infradead.org>,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH] mm: convert page type macros to enum
Message-ID: <ZmHzKRkgKOGW8Xmk@telecaster.dhcp.thefacebook.com>
References: <20240606172530.829790-1-stephen.s.brennan@oracle.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240606172530.829790-1-stephen.s.brennan@oracle.com>

On Thu, Jun 06, 2024 at 10:25:29AM -0700, Stephen Brennan wrote:
> Changing PG_slab from a page flag to a page type in commit 46df8e73a4a3
> ("mm: free up PG_slab") in has the unintended consequence of removing
> the PG_slab constant from kernel debuginfo. The commit does add the
> value to the vmcoreinfo note, which allows debuggers to find the value
> without hardcoding it. However it's most flexible to continue
> representing the constant with an enum. To that end, convert the page
> type fields into an enum. Debuggers will now be able to detect that
> PG_slab's type has changed from enum pageflags to enum page_type.
> 
> Fixes: 46df8e73a4a3 ("mm: free up PG_slab")
> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  include/linux/page-flags.h | 15 +++++++++------
>  1 file changed, 9 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 104078afe0b16..64fc191a75e8d 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -947,12 +947,15 @@ PAGEFLAG_FALSE(HasHWPoisoned, has_hwpoisoned)
>  #define PAGE_TYPE_BASE	0xf0000000
>  /* Reserve		0x0000007f to catch underflows of _mapcount */
>  #define PAGE_MAPCOUNT_RESERVE	-128

Adding linux-debuggers to Cc.

Can we also get PAGE_TYPE_BASE and PAGE_MAPCOUNT_RESERVE as enums? That
would make it possible for debuggers to implement PageType() and
page_has_type().

> -#define PG_buddy	0x00000080
> -#define PG_offline	0x00000100
> -#define PG_table	0x00000200
> -#define PG_guard	0x00000400
> -#define PG_hugetlb	0x00000800
> -#define PG_slab		0x00001000
> +
> +enum page_type {
> +	PG_buddy	= 0x00000080,
> +	PG_offline	= 0x00000100,
> +	PG_table	= 0x00000200,
> +	PG_guard	= 0x00000400,
> +	PG_hugetlb	= 0x00000800,
> +	PG_slab		= 0x00001000,
> +};
>  
>  #define PageType(page, flag)						\
>  	((page->page_type & (PAGE_TYPE_BASE | flag)) == PAGE_TYPE_BASE)
> -- 
> 2.43.0
> 
