Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05A7B86337
	for <linux-debuggers@vger.kernel.org>; Tue, 28 Oct 2025 06:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761634289; cv=none; b=D+H6/5ZwOLjf9vt6LoKwXDpaiySL770WjbgQaPvwm6CKJmmmCLBPfVWa1D8UyxhBuRtmi0e+QV73Sgfi1TuQoFsf9SxjFCDfF21Yj1Mt/v/pMquhh8WOIWhWsvSJUSZHsNv9vk2Y9M7SBGB5ktidbV/4ICYpBbgRCZY3NX6UkcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761634289; c=relaxed/simple;
	bh=r0MDH7Vu7YrdxvCpmCSj1aPQjI6ZvfhJQ4+9p/NIKuw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sRLAs7euMgAm53X65GZCkLRyK4CUR/y9MkWuVQihMLPzAYQQ6uVB6dRoDaXa45zyuMKLbNitt9Ll4oVXVb13ltDo9/V4eJ0SQi60fS9ax+EfwGOGrxiYVLVW1ueDZ4deDTpuMQEda59aG3fCsVWosgCgxUfYK9sXfxtBrG+gdfI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=gvQQiKmD; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="gvQQiKmD"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-33bb66c96a1so1647486a91.1
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 23:51:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1761634287; x=1762239087; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=psj4jXCemJsZZUfGmvOoOf/gazxcdY/IyYfCWFGurIk=;
        b=gvQQiKmDZAE0lQ72dbcc7pGpsXbLhHv0sB2INZGgXe6tYAguqCD8o8JsdcDSPhTHvh
         bbGe03wZoUk/zFqU4OHGOv0BD6C7WDMmzrMeHl3a96qvg8XXxWa4maeGd4qmrD89qod3
         vlyK1Z5a8k26M9cAfDk3Q7C47IwPW1hVM+X1CqgzFBCG3XoBI7fxeyD5n+GQghPUTvdl
         XP968rcgZNDnA83xg3iRXV+ROVyCnujcjpmkbQauhurwAQtJFiCZDShWXUEHSRXjSCPi
         VKjAZK8sk4E1G9FpVwgXjsWt9m36B4jtZIujMiKnz8SOn7RCM8EYJ3papEbdmx7tydvg
         XxvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761634287; x=1762239087;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=psj4jXCemJsZZUfGmvOoOf/gazxcdY/IyYfCWFGurIk=;
        b=KirK5tc0kUBvX5Zvx/2dKR/c3GV37U/uTjxmqgLjNkuw2guQ73zIe77VrqKdaUweOC
         GIwlIGBO0AVTrZ0oR0lPO1+HiEIh526t0rWF6XAlmgg+yAOGbhCriC5yIm9GCyaKDN6a
         MqSlVyFAQl68W84uB5rtqFhko3pLXHV/YM33otGvehMbEW7Ujc6yIkNQYxrmQOFYExdM
         lDGxRNGxCV0gMzxFznat1U1eIwpD4kXR3T3k3vt9O7Px5pbrh3wdv4SKVzOBnA7aZY7t
         a4LUeE27aeYamE5tJa7sXvtK6Qp5jb6wJG/WKaORjJegoiLDwMRoIejk9hUsLpfJIQGY
         Vx/A==
X-Forwarded-Encrypted: i=1; AJvYcCWq7GWxBLQtGlKP9p7ArKl8RZFVGqgcF3HG1z7/77v2CxkL9J33/BUm0sd2cXz5IMCWiXBhbi1BqBxcMPBYmrI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx79oDhHP+tuQVQwoZB9zNavtVYoj37yzZ3ao6Ujq46QNBQPsNo
	bNfligJe6H9Mu/dsloR7Xq3BU0KN84KCzh6Jukw5ckPFRzzRaVEKYJFdHW6nQHiyYVM=
X-Gm-Gg: ASbGncu5Ou5q+1Jrqxgp206PcriT6ZfKjfGnPaJOv5pKUpEQWrnsdHf3qWDcl6NBQ3y
	D3scBHyWb+YdosKijQBrEEhG4TKQtNtdBdBDPHu2nQue1zroQFzTUbBpOjGNT1mp598Dx99laHy
	vOe5fptiyqgQoRgDm6+z/A680PQtFJJwv/KwSnBvJpsl1LIBhs6TiPDtaqp5P867bFYl5lxkQom
	sCVwsJnki0HhsJNB+N0Oz+pGC2Yh5ZpA0z96wWPRE/0eFzxvq3A/Kc/pwr+puFqu0NXWEnALcEP
	/jtFXh34Ipo5rYYGLF2+nEAUaM8DlEzYLmgR12RalzP7JqO2MNDDtgK+hLKETTmJcb7m2hHCfbH
	F3uw6FcAIYNs0mUV3aeir8uqgrR6mHtA3TrEAyxvo4+MV3VtdVPozqDGuNg==
X-Google-Smtp-Source: AGHT+IFexfDJiwsqeon/6lRgY/61fR03YmnIDMpYALp3seN/ceKZ1SeYGsExlHLpW7rSPgb1Om7wdg==
X-Received: by 2002:a17:90b:3912:b0:33b:cb9c:6f7b with SMTP id 98e67ed59e1d1-34027607154mr1674832a91.0.1761634287183;
        Mon, 27 Oct 2025 23:51:27 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:1183])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a414049a44sm10331539b3a.35.2025.10.27.23.51.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Oct 2025 23:51:26 -0700 (PDT)
Date: Mon, 27 Oct 2025 23:51:25 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Israel Batista <linux@israelbatista.dev.br>
Cc: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
Message-ID: <aQBn7Xsx2qi6YDWp@telecaster>
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <aP-3dauwpc-Kq5Kh@telecaster>
 <391c924d-b6f4-429f-8190-b33e3b6a3942@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <391c924d-b6f4-429f-8190-b33e3b6a3942@israelbatista.dev.br>

On Mon, Oct 27, 2025 at 11:41:47PM +0000, Israel Batista wrote:
> 
> 
> On 10/27/25 15:18, Omar Sandoval wrote:
> > 
> > What kernel version is this patch based on? It doesn't apply on mainline
> > because it is missing a couple of definitions added in 6.9 by commit
> > c5f1e2d18909 ("mm/memory_hotplug: introduce
> > MEM_PREPARE_ONLINE/MEM_FINISH_OFFLINE notifiers").
> > 
> 
> Sorry, my bad. I mixed-up my local branches and created the patch from
> linux-next rather than Linus's tree. I will create a new patch with the
> proper changes.

Oh, linux-next is usually fine, too (different subsystems have different
preferences, and I don't know mm's preference). Regardless of what tree
you base it on, it's nice if you mention the base in the patch email
under the ---.

Thanks,
Omar
