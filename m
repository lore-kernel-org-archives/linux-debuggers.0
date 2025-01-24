Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2642D18A93E
	for <linux-debuggers@vger.kernel.org>; Fri, 24 Jan 2025 22:55:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737759353; cv=none; b=d2RFY9dB1RUp+K4NQ4lJdWk43acNhqscSYXhiruGAS0VdwPWeIpNA3woKeXS+zOM1EVo3tDqJKkEplsmP+HtbokwKDBaKGfs2o+Olv5JYx2d+LphUP75LbWShmTiwGUu37BTa9o5JcL32QcIFWqXl3zJiILLh4f61+WWGtJXRUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737759353; c=relaxed/simple;
	bh=kCyOKPx9Vs1i6LLFZaKNlUjqggHdygxNLEDk5y3a6RU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IKXmG1kd4/JFNhe78uoNekq/CIUEfeQrzKvwrl/4awLGbbqJ+6fyURNo7Q9UXOQKVMfoelTnCj4WRKqJY0pswrwlbyO7X0ZLuRog9mHbRlT3vw+5ZV6yU6tC0Pr937BLkUAsJ2NWmOo6K3sOp/ZEDcbCDRZS/W0cPQ1Zdwo5Br8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=Y1LFYlFI; arc=none smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Y1LFYlFI"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-54021daa6cbso2892889e87.0
        for <linux-debuggers@vger.kernel.org>; Fri, 24 Jan 2025 14:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1737759349; x=1738364149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sDzAUQkLK+ll9FT+a7j+7HPNHM41+1WxQWQh7x0Fr48=;
        b=Y1LFYlFICUTwd+5L6pZJ9J5lQy8R8TiIvklFIpnDhq8ZZM9kczB1NhDPRbCwWpoxEG
         SsUK8utHY5oGMO8+sD3teugStBgG7+yfV6wn+1mzY3IqaftQDXBQX0JJdZy71V3VyKhX
         D1vlPFChJprXdbpTX4K07b287SrPlM+4M6/YA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737759349; x=1738364149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sDzAUQkLK+ll9FT+a7j+7HPNHM41+1WxQWQh7x0Fr48=;
        b=FpdQsL5yLM3q4C7FuiiznislDuydCnm1vs6/EdclvzWXW/upQGqwAMgoYm+CvC4voZ
         4SP6+JlncGH4u2t13mTGuHeLKDxD+KNJZaoDQtqMaAOrDZXJjoXzVbGEuuQduImFyWFY
         HJyNtVn8Ao9243s6HGNFLKy+UVn7F1K7a0Uij6gPTLAwCjaoRqNLIrIR0V6hy5AjBYto
         CL5secIbkMUUh4TndGYUgUTMx5/PnP6Jcak1rsyEwIVsDjzpJzGOlCopQFrHOxGSbaZm
         4x2UmYN4XC3tHuXn0dEFsy+6E46Ch4SyEHEERTVEWu2CcCGbhI5vTEGnCko6ISWFCGb6
         tYcA==
X-Forwarded-Encrypted: i=1; AJvYcCUuOlAMp4+QSXhkxCH06+5n4Rx/C10mIqEH0xSIS+TNFb9N/JkGO5Yx2YEtvIiT1r4rbTBHPdBw3hwbD8ILyXw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzmlmNYm4W4Q6Icc4u0RF1ADsESonJLCuGdtImLujFqwD/h94/E
	RJJ/wmThqH227817oyjjtneh91EniFTKNqFXhM33m3qN1joroYZvyw6D0vh1iN+sjrgB/GBERta
	zvg==
X-Gm-Gg: ASbGncv7b/D9RtrS0jJ/w7PAZpiZ8Q+omRqW8SOp+6ky8/twVnXSEPjBjGg88deUo0l
	4FsQJTl/WuSFcfoirew7NXvPIQ1XefpLTDYI/NWnL8sA4sUx8qrNN2qhI8q8zHK9kYwy739t/lQ
	oebw4Nw20g227+Y9a+h3sweukHfUwTaW6sgR87UttCYyeuT5vRdHGVUCi9d2X5KSk78YS0RrJbR
	EsXrGuxpENIrMakFbeUppo6IuD1aFFSWokNllWMv2PFQWKn8cxmisJBpYLA8yTh3zktMGrzkIh+
	MIKYrhJI0cTjUeBZH5+XrGXG7VE12/+dryywC4H7+b/tWvciJsJJjRs=
X-Google-Smtp-Source: AGHT+IE3W7Pbpl6F9SLNROrbted/BWygrUozB605qz0C2wLYfR6Ote5AwNwq3HeRPhW+StXGaU3Cgg==
X-Received: by 2002:a05:6512:10d0:b0:53f:a8c0:22a7 with SMTP id 2adb3069b0e04-5439c282546mr11442027e87.38.1737759348661;
        Fri, 24 Jan 2025 14:55:48 -0800 (PST)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com. [209.85.167.45])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-543c8381811sm430048e87.250.2025.01.24.14.55.47
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 14:55:47 -0800 (PST)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5426fcb3c69so2201569e87.3
        for <linux-debuggers@vger.kernel.org>; Fri, 24 Jan 2025 14:55:47 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWQf4mXPv9GxOxMl0KscgpZ7M5IJ3YKXKrxjlpoTquRaDQRS2/jUGqC5QAEieQ50tx9xy6bjZMtYby79r851wE=@vger.kernel.org
X-Received: by 2002:ac2:4c24:0:b0:542:6507:9778 with SMTP id
 2adb3069b0e04-5439c22cb95mr8643147e87.11.1737759347161; Fri, 24 Jan 2025
 14:55:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250113172936.1434532-1-tjarlama@gmail.com> <20250113172936.1434532-4-tjarlama@gmail.com>
In-Reply-To: <20250113172936.1434532-4-tjarlama@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 24 Jan 2025 14:55:35 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UnGvwk7EVjDrqQdwUGX43Ep_BaLTbYy6SPNY26=QoLvg@mail.gmail.com>
X-Gm-Features: AWEUYZl5QQEDOJe9pjO5xpM1fvE182XEZ7q11PrSp6eM-M1_YsoDAPLI4evlW54
Message-ID: <CAD=FV=UnGvwk7EVjDrqQdwUGX43Ep_BaLTbYy6SPNY26=QoLvg@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] serial: Move LF -> CRLF replacement from serial
 console to kdb
To: Amal Raj T <tjarlama@gmail.com>
Cc: danielt@kernel.org, jason.wessel@windriver.com, 
	stephen.s.brennan@oracle.com, amalrajt@meta.com, osandov@osandov.com, 
	linux-debuggers@vger.kernel.org, linux-serial@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Mon, Jan 13, 2025 at 9:29=E2=80=AFAM Amal Raj T <tjarlama@gmail.com> wro=
te:
>
> From: Amal Raj T <amalrajt@meta.com>
>
> The current implementation of `poll_put_char` in the serial console drive=
r
> performs LF -> CRLF replacement, which can corrupt binary data. Since kdb
> is the only user of `poll_put_char`, this patch moves the LF -> CRLF
> replacement logic to kdb.
>
> Link: https://lore.kernel.org/linux-debuggers/Zy093jVKPs9gSVx2@telecaster=
/
> ---
>  drivers/tty/serial/serial_core.c | 2 --
>  kernel/debug/kdb/kdb_io.c        | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)

You seem to have dropped your Signed-off-by? It was there on V2 [1].
...and speaking of V2, I provided my Reviewed-by there. You should
have carried it forward since there are no differences in the code
between V2 and V3. I can give it again, but it would be nice not to
need to repeat when you send the V4.

Once you've added back your own Signed-off-by, you can also add:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

...also speaking of V2, I did ask if you could maybe add something to
the commit message pointing at the previous discussion. If you really
have a reason not to do this I won't insist, but it would be nice to
include it...

[1] https://lore.kernel.org/all/20241211153955.33518-3-tjarlama@gmail.com/
