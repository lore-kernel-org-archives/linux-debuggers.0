Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E140D26A09F
	for <linux-debuggers@vger.kernel.org>; Tue, 26 Aug 2025 21:42:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756244539; cv=none; b=ZfbCcpD0xHnrDa5MkcnSg8zMJJBPyNWcXR1ROif8LK9sJUOxjEturkbDIAHv0XNsPorRNdlKUCZrhwgZz8Ndj0sYCtXltFdytJWhbWS+3atTBFqMMbeFGPd2cXFO9lBbJ5Z8eLWKq8PCBBuWGI1xrouJM1ImZzS+FPr9gFfiAMM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756244539; c=relaxed/simple;
	bh=/ziTFy0qWYUHkOnmnDYPfJ9/OX077TWG8OUp/ob2JjU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=f7AQoC61YOM7ZLHOzeCkWqrT/rATEkKN7xJXA2gbVhD0TKwI5ne64tkYHgWnbYgId+lnT2XTopktV3EjTVJ0TRbj4UAk6FX8qMgZM7ysCjh7JOHUvIda85mgHmANZKQ27ys7v/dz5DwwlTs/a1D8gZb6pF5CFWT9GD9wF/U8MPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=tmyAndao; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="tmyAndao"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-324e2c12f43so573049a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 26 Aug 2025 14:42:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1756244537; x=1756849337; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/ziTFy0qWYUHkOnmnDYPfJ9/OX077TWG8OUp/ob2JjU=;
        b=tmyAndao9rvVfJ8eIIfJVwWL6FIsNP/YRP3SJVSFB29MalzPLtJmfPRklESXj7qJH3
         jo4Kt6H8Qjv6CKOtW0U600sdRWLD61h+RmvMUz0JUuBu7ZehkDx+dDy1nZldwziK6naA
         Us2AiLEb8moRiUpDhirP4z6v+Q//+aN4HtcP5zGDTEdujgcUWCgwI9IIbapc9GUd7vo2
         3cYv5JQ/XBsCojmRMkpI6jBcnIXjI5/5foVRkAgMulSOYUU9hZH/GEAHGO7O0+NvFtY9
         V5DzuWyTrC9XuXj3757M5QpQj/yRpDmy+IbWq8Z6EHBgPtMHvFBHZvJFdgkzVg/tCuS3
         QnAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756244537; x=1756849337;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/ziTFy0qWYUHkOnmnDYPfJ9/OX077TWG8OUp/ob2JjU=;
        b=PjwpTG0KAj6g6j6fpv0wnxkJn/Ula9zGwWu/HJ/rHub7p3XMOLLK1rzuIYRKXpnViF
         1EJdtTGp6Sr9gRTk5/zuKsD/M2bfCtgb8BW6DRA674p1+0oDY3YuK9fTqJVvuc/i6V2m
         kqNvZp5D+ohXU8Woua34U8jtwKktgnJ9QtMuwJ1bSin+mjPS2/Vz9s/Q6qngbGGZ5o8z
         pDmNfs9B3o69ASxaPRrebW1v+yWWsM/SkMAJ1x4uO9yPdWZyyWh/AFLsQpdrIER0OVdo
         VKD6J1PIwCzD/DZRlY2oOPPd5vwBWyWu2S/lE81sjpwgWoL56d7gsJJJOljhuHzqQSio
         6V5A==
X-Gm-Message-State: AOJu0YxRGPHdAu1LTZsJSjkopb4IcdKI6FTBeN2a47/da1uXVcQronfE
	Me9wDyPricErsXfh4QJTHjuFm1xoE9G+TJtJ2Cc89oGd4DnMEAB/WJ0wFRpPPmlkOpg93aeLHre
	RGOLD0nI=
X-Gm-Gg: ASbGnctVpTuTo6CYRO2KvUbbh7TC2/Vpfj1+6bTH1AN5dm1aP5TRz2Vo/Ij4Hs0LKmf
	TXSefbHyhrBIhXFc1hk9+RCKHq2mK0sutQWVzlLKTNq6MMAwSmUxzx/wo/ceqSh39NPPyj0BfrO
	2AepdE0/WVlofA7HMO1G/RgXqp5TvQnBVLZuHgzgDizfKXxlLcnxFGOPXyXRG8Ppdlp+HZHvmhB
	le42abaxlJdcOYIuuu0RGgOYs9bk+Ety1D6+Jsf8DDU7Vpb35AIgevoQ5T5lelK+6JskPNoC+Td
	fDi0OBSZXy6L0Z6veBTenX+7NLNpFI4Ub1QVb9yEwIW1i19+XQjYXRlCVUYzQX4w/xzPNOQHkpF
	3afqx
X-Google-Smtp-Source: AGHT+IFMD2I5vJsPSyYvVWIbV1aFspKHnInGEqx2XUtAHgttUFaXkBDX+F1Hxlde3E0WMkCrxu9vXw==
X-Received: by 2002:a17:90b:4b86:b0:327:4fab:1dd9 with SMTP id 98e67ed59e1d1-3274fab1fddmr2209630a91.5.1756244536869;
        Tue, 26 Aug 2025 14:42:16 -0700 (PDT)
Received: from telecaster ([2601:602:9200:4a00::c7f7])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b49d858ae34sm8064857a12.47.2025.08.26.14.42.16
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 14:42:16 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:42:15 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, August
 27th
Message-ID: <aK4qN43NFVTjlaAV@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
August 27th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

The main agenda item is again status updates on porting crash commands
to drgn. I've been tied up with some production investigations, so I'm
behind on code review but will hopefully catch up in the coming days.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
