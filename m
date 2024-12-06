Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 009121FF60D
	for <linux-debuggers@vger.kernel.org>; Fri,  6 Dec 2024 11:45:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733485514; cv=none; b=KYYSnZ2j3f5fSFQmI9DCy0DlbHCFanNXTW+ObcVDg5uP9wQHxCptPaDSm/6Wio/iANZ0lCLk9cOSryceGFWlcyrsyT8o8wPjo9QH1e0u1G643++J5GDSySJ3bj+kP2u+4PrkkfhwbDIDcwpPv+VgLQi6BraXB6pcoHzgDP9EeyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733485514; c=relaxed/simple;
	bh=0vnHgmTteWwStYK2xueEcHJF8y7cqiqshwqveL6+ly8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HeOnyRoslk0pe+9VGoZLMORtgIcklH34pvU+n9r8TLxitWfCTTtydaYsV3efvdXFUQZjhFaA6/jwH4K7ZjrtKV9l+ebZowuTi73VQoaLHhlDLn7YfiUjtvLSfhIHotJrKoTu//i3qKJXsQErOElTEuVK2RvIbQaMjYTfJk4cPJ4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=txV1F18q; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="txV1F18q"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-434ab938e37so13152745e9.0
        for <linux-debuggers@vger.kernel.org>; Fri, 06 Dec 2024 03:45:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1733485511; x=1734090311; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=0vnHgmTteWwStYK2xueEcHJF8y7cqiqshwqveL6+ly8=;
        b=txV1F18qwM1inlcZ4qHWWCvwUEnqoV46kUtwtpVwrfP7NcM8Tsl8TYV0iVP33XCzni
         QD5c9H5Jxr+LLfsZ/zqByDjgpD8sEneGngkEBu9RyKZ1hQ5NMmw5OQctw3wJONWOzpoX
         W13Vz+I2Ps3jL6oMzcxV2S0Nelid/7bye+mpZ+WxEQU27+vAy/4P8Xe/5myTnrF4/GBT
         VfYBqIibp6qkNfd1tKAmeH0OvRWD+vG8gAD5cGtHN9/s3g7Hm4LmOebi/HZw65bq9OwF
         QxbaxCJcp0ToIDtVx5970WPtlgTkk84CX1UeB9m2tikSV2eEykEz4n2TRUOf9TV+uwKB
         2Jeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733485511; x=1734090311;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0vnHgmTteWwStYK2xueEcHJF8y7cqiqshwqveL6+ly8=;
        b=kcRJfgehdVZBY67zyaQxMferDy4firDoguFgQBcBZKEFnhBR52rW9vfDbzsJUNUqez
         mFBLvkiijsT26MUFYdappQfj3ynvqtp1qGiRHJZbcYZXJzikUofZlPPUXw+V8lgBs+D2
         m/Ra4RYhzYGDoPfYMj9qfhaKpIQtB7XxQNBSYk1pmM45k3ouy20t7LN1bhVksiltzDiM
         vS6FNzA15Y+5QUDQDN58N5amyZ8gMRMiHA2FYct7VfnDk8hFCxaCEBwkMsoAFIP+WdjI
         4nb74tONPg3F3h31eB0Qpoo01O2WZDOJbohQnc1wMJ/FlOZKfFQJiuppJZlRC0WIwnwU
         xdPA==
X-Forwarded-Encrypted: i=1; AJvYcCW2XEMihlBWfcx2VbOV0lFEgIVLi3M2if+6Cmvyzzg73qOtg/H4OGJgOJU224RUBu8tMu5jy9W15IzY6SI5C+I=@vger.kernel.org
X-Gm-Message-State: AOJu0Yww/qQv07Iemqmjs/H/gBGP2Du+JiG+TUuHwKQVcKetnWe6e/e6
	qeLVAoSQX38hZ3s8/Fm3WTIzvR66Cct46o/501m1gz4CXQCczjsoztwNaZs9QxE=
X-Gm-Gg: ASbGnct/gHPoazfwy+y9WSK1Uh18QHRs3v8Gbf5X83yCFZ98BGV54KQOuJ7mP7wOqyV
	hAd+IwcGMZNRA+KC111E54aKjerWbWMWxiUO1OUXdLnYCB7EhQPseUCPe7q1Czn/N6Ss5kYvbkx
	E6HOk4ljcN+6Ll1IBDJMWphmulUzOZRqrLMSN8bMtwzKN+0dops0ZH3s5IFyEWN+gDS1hvHqjeN
	FZvJulMTg4OvBnVF8YjnTpC3OHveBhhw03ajrwL5DRc+lmqBEPna0yt1XW0Or7mTKyM6llt7YFH
	JZunmApzz/KlRuvEhTwe7gaBRq45nlc8
X-Google-Smtp-Source: AGHT+IFbfiIP2KuUea3jGE5UkSPeOtMPPzWfBogEPMLNzQHpsRB7OE3HGfnqUX4rWOqyvsqUfHyK7w==
X-Received: by 2002:a05:600c:1f8c:b0:434:a1e7:27b0 with SMTP id 5b1f17b1804b1-434ddeb5379mr21659095e9.11.1733485511137;
        Fri, 06 Dec 2024 03:45:11 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-434d52cbd16sm90040795e9.41.2024.12.06.03.45.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 06 Dec 2024 03:45:10 -0800 (PST)
Date: Fri, 6 Dec 2024 11:45:08 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org,
	Sebastian Fricke <sebastian.fricke@collabora.com>,
	Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-debuggers@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net, Alex Shi <alexs@kernel.org>,
	Yanteng Si <siyanteng@loongson.cn>,
	Hu Haowen <2023002089@link.tyut.edu.cn>,
	Andrew Morton <akpm@linux-foundation.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-serial@vger.kernel.org
Subject: Re: [PATCH v2] Documentation: move dev-tools debugging files to
 process/debugging/
Message-ID: <Z1LjxHHbFl1qQfIn@aspen.lan>
References: <20241206003100.38142-1-rdunlap@infradead.org>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241206003100.38142-1-rdunlap@infradead.org>

On Thu, Dec 05, 2024 at 04:31:00PM -0800, Randy Dunlap wrote:
> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Adjust files that refer to these moved files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Note: translations are not updated.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: workflows@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-debuggers@vger.kernel.org
> Cc: kgdb-bugreport@lists.sourceforge.net
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-serial@vger.kernel.org

Acked-by: Daniel Thompson <danielt@kernel.org>


Daniel.
