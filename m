Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F70A23DEBD
	for <linux-debuggers@vger.kernel.org>; Tue, 10 Dec 2024 15:16:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733843797; cv=none; b=ZwoDsLzfkZuv1Oes+/bRwOM0pGG/dk4KxSA1FCl9aHkoPPqjXmhJEHCDugJlY5kEZsx4Qbh/LNb5RuCcFhWWJ8LYAWj51Tu/6wV8Dw102VWQPuOL+VXPoBTJEJfKkwN2YndSgQ+CyaN5aRMOQmO7+ADHj15uyjpSdLW9UN6fznQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733843797; c=relaxed/simple;
	bh=cMEx2gf52bAp6BVsDAEzu6IQF+0HBT6Ws0MACSlPHkA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ejH+7u9cYAyHq0lGSjPJLJVZvRec8gAyZc7sPNjJ6H/TgWFGH8Wbj6B/vxcBjyR3ZE8V8S705qivgCwJ/LTCNIlzMESnytL142dhc8JTU1znOUA1FajoVKtHd8H0OumK2QEB57MITZYx3KJTfUiPRpE8bx6nODK3FZoOPwf34TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com; spf=pass smtp.mailfrom=riscstar.com; dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b=qqldTwGz; arc=none smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=riscstar.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=riscstar.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=riscstar-com.20230601.gappssmtp.com header.i=@riscstar-com.20230601.gappssmtp.com header.b="qqldTwGz"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-3862b364538so2436084f8f.1
        for <linux-debuggers@vger.kernel.org>; Tue, 10 Dec 2024 07:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=riscstar-com.20230601.gappssmtp.com; s=20230601; t=1733843794; x=1734448594; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=3/Hk6Ku9xV4vYVPZ0mEkrD1qjVxMUjhQA0xZ6o+cH5w=;
        b=qqldTwGzXRHHpqXhnM9hHbNAaFWAL1WTB9KYrDkBO5pTXRZmwjeFI3ydxj5kEGXyOz
         jutBtLKMiKrBm893DEsz9/5dOW0pKR6vVX6N61ov6B67JTxLJKZz3nLytH1WpAF/MTqO
         gvSEy/0mldWkb/WNfDCsxP9RPiW7UlojdivkPqIAGjSXdqlUch/TWRvLA7cVtTMfdKbH
         1jbJ5ZLZdxPHaSx4Japbfe6MHsgGnGMB7CpNuvSuNNoFjWQiWB8J+LL3n3zqCgHyluOn
         mBPbQjUEAHdo+Fz42CbNPM2dZNcJF22SNV/ekbhI8CkoFrsh7ImCa5ZY9WWjfZh6I4i1
         tMtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733843794; x=1734448594;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3/Hk6Ku9xV4vYVPZ0mEkrD1qjVxMUjhQA0xZ6o+cH5w=;
        b=fVwE00X3Aaui6lSP6VK6t3BwgBbk/vtakWY66nwSfIlJZPFo3ClCY5IZlrAt/V5D+P
         i73fge96vp0Uh2yjzdDw6d0qr4Z61DgAEQ7T64COkwwXKhtQBos590ZUpEJqszGs/Hjb
         SbAtbTh9/AehrDXqmQPCaSSXVFVUKd1qjHytv5nn9yHWGAt+oakQmKP1bTBV+HEAOqXb
         Y2Q0XMc1bbjAY28TFMnoRtpJmEUMV6maAUOpJ2JqKnIg9X6X+Az0Rqfd99R/VmGBQwR9
         rxQP+RobblJg+1eAlA+hmfH1OHJueP0WkFW/zhi3OTrkQpvN5/goQlZD6CpomT68tqnH
         e5bA==
X-Forwarded-Encrypted: i=1; AJvYcCUQGDrd7llPGqODzB70jI/ydiicBqRXpalcD9pUFb9qtLa81UeZEfW3RoGgoA87nLzont71xKFvjV5rOqpDb68=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQK1xlbt0GYh/TN3o5EvsPrT3vHhfwRYs1I9T3iKwMZfibWyxo
	g7FbYVptol1bnBDJNKCh3rD1jD0t335ho2YM1FKe8LIK0JGaQPnwSE1pWcI6qnE=
X-Gm-Gg: ASbGncupPKLCzVgrEp7Yjaj+pTPGV1dsVcAwbxXYPrOsh6a8BH08HfEftQevbBVvFnq
	1WZtTd5XCqDbZAnamlCXmnGbOHLmSgr5tnPXd8RgEZ19fY3ollybediQlAgyUJSu6Wjy40WA9vr
	xH/43pUm6JCx4+e4CU1dmgbnvmCBIDenHawJqLyYSB0J90rAcz0QLP2Uu0OyhPFqhhOghBDeXD+
	iTTH3tAckhbT+vgtu+JyQe/WvjS5I++Tewy5rb2/2vST04gQX2wqYIDniTWopUAX7XZeN+sUPw6
	9fcDjsxNxbbj28+Fbq15/XRIrfQMQYBn/TbH
X-Google-Smtp-Source: AGHT+IEZYgzuNEX0Ja8JZykHzolp0rxxgNyso24X5bGyQrupgg8bLOxUA1VlNVk3vdf2QdgJ1/xovw==
X-Received: by 2002:a05:6000:20c4:b0:386:2ea9:800 with SMTP id ffacd0b85a97d-386469d5155mr2165720f8f.18.1733843793561;
        Tue, 10 Dec 2024 07:16:33 -0800 (PST)
Received: from aspen.lan (aztw-34-b2-v4wan-166919-cust780.vm26.cable.virginm.net. [82.37.195.13])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3862de365f0sm13005754f8f.3.2024.12.10.07.16.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 07:16:33 -0800 (PST)
Date: Tue, 10 Dec 2024 15:16:31 +0000
From: Daniel Thompson <daniel@riscstar.com>
To: Amal Raj T <tjarlama@gmail.com>
Cc: danielt@kernel.org, dianders@chromium.org, jason.wessel@windriver.com,
	stephen.s.brennan@oracle.com, amalrajt@meta.com,
	osandov@osandov.com, linux-debuggers@vger.kernel.org,
	linux-serial@vger.kernel.org, kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH 2/3] serial: Move LF -> CRLF replacement from serial
 console to kdb
Message-ID: <Z1hbT4OtEO9gz5Dg@aspen.lan>
References: <gmail>
 <20241210133448.3684593-1-tjarlama@gmail.com>
 <20241210133448.3684593-3-tjarlama@gmail.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241210133448.3684593-3-tjarlama@gmail.com>

On Tue, Dec 10, 2024 at 05:34:47AM -0800, Amal Raj T wrote:
> From: Amal Raj T <amalrajt@meta.com>
>
> The current implementation of `poll_put_char` in the serial console driver
> performs LF -> CRLF replacement, which can corrupt binary data. Since kdb
> is the only user of `poll_put_char`, this patch moves the LF -> CRLF
> replacement logic to kdb.

This description only explains why it is safe to change
uart_poll_put_char() but...



> Link: https://lore.kernel.org/linux-debuggers/Zy093jVKPs9gSVx2@telecaster/
>
> Signed-off-by: Amal Raj T <amalrajt@meta.com>
> ---
>  drivers/tty/serial/serial_core.c | 4 ----
>  kernel/debug/kdb/kdb_io.c        | 2 ++
>  2 files changed, 2 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/tty/serial/serial_core.c b/drivers/tty/serial/serial_core.c
> index 74fa02b23772..ed18492b7f8f 100644
> --- a/drivers/tty/serial/serial_core.c
> +++ b/drivers/tty/serial/serial_core.c
> @@ -2142,8 +2142,6 @@ void uart_console_write(struct uart_port *port, const char *s,
>  	unsigned int i;
>
>  	for (i = 0; i < count; i++, s++) {
> -		if (*s == '\n')
> -			putchar(port, '\r');
>  		putchar(port, *s);
>  	}
>  }

... kgdb isn't the only user of uart_console_write() though, right?


Daniel.
