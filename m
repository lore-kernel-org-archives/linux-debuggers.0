Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.50
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794273660;
	b=xbnX6kEKKcj+8r9GSphfePI4EvtgPsIwalfsWApjIc2VuaM8xj0YbXsLTLeBKbHfeOY2
	 Y9LR2ymskW1MCr5G3KPctZWALIYKHy3FVeRZiG5Jokr3FtKRmw17sW/fwl1DrXLW5m+LD
	 nEwUanYuOrZSKJkMORJqarIBc9RJC5Gp1t+09SNAZJMLyhHnoGXpNRDVvbEOCB9kczTQL
	 6o/pzy+wmOJPGGVI1mXyrLKglYEMVjSpwSyDykMN7dIU4u4/6wf1yU34Wi5DSf1pFcSLN
	 iO6mYqTh91ttbERmBipqXx8FGHKoD/iz1hmbDhkyMmWMnLmNw15+r3Nq4YmZJ4khqjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794273660;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
	b=ziSbj/apP9bm0UridFYcXD1xq7aWHk8Q/0lBaAob/N3rMRuVI82tYxGz11ZpDspviuSb
	 hoUJ4CI9b+dPkl/1BijY6srTbDh9yThC6RtkZTPL50AAJ+y9UvdhxG7LPYzSXpZ7BSjOH
	 m0VnqmJkAA2gtBnTdmaN2BzYfDX74Xs0iX2wmXSTVDfW3ar25d7jeqQp65YC6maDpDXGX
	 FdcgNCCEByjQiwcw8JfwDVCuwl/I97B3FzVNRoi+8zJW9l+cw4UIJA9ixy+vYv9MxW1Y4
	 NxLH7GPJX3pTN0jlFi0lss/o97R0IdSbpeJCtIyR+NsHOZon8vSs67TWI8+sv5QaBew==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Rqy2X5Sj;
	arc=none smtp.remote-ip=209.85.218.50
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D922560A2612
	for <linux-debuggers@vger.kernel.org>; Tue, 10 Nov 2026 01:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D922560A2612
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=Rqy2X5Sj
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-c450ab1483cso245795466b.3
        for <linux-debuggers@vger.kernel.org>; Mon, 09 Nov 2026 17:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1794273658; x=1794878458; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=Rqy2X5SjGuDYx9Dte6qHLMzNRYHlo1J3rlmD9W6hkI6kjs9PnlKLqt+2Z2Tmy0Jmso
         zK0AhVVlDd5bcUVIFpeBX+NX8ZM5EnquZ0EnHA+CfJMTBaXlQtbwBvX0b3hIMsqOXS9I
         OPJKsSGjLrSjr5EUn59cIMGKkHJZIiaPOFNzo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794273658; x=1794878458;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=m2qXctBTC0OPADf0V2KkMb6r2GA0JgabIuFAMe6ERzQ=;
        b=TE3K7zjSIIQgCamJzdH3wPW7U1nTKcGLtX09ZeCRPxoMFlEykZHpd0CLh7pxsi3tcr
         j6t5m0qqOYCyCrviTdZpIGxw2ZaQtJKwChXDhlcyOswwfLAQZKM4tlSNl/aDk1nMl1O8
         wghek1W7VW9pIhBldTM7sF+xPV0mLt0K1NEre585u8ecYL3W1B2ov/vUclRdDHzPCgrN
         p+5M02Lp6KvZ2aDnVWYyStr3Vhmxk8UX1vtr6phQR5ggUOQ+nwlFBxCuxrdiTQSIQfgz
         5/kaPvSbxPGw4WVnLvWCAbcrYV2NPJQtR/FRkEGW7VzOpRa/1RX9zuxbCb8GZXTCrVWS
         W/6Q==
X-Forwarded-Encrypted: i=1; AL+hErEgntSJT8z5bwzBmuhaCeepASo0nji9MrpUr1yTKHbMRjByIcpKjwuB+mHyzhMEw9PLFpQjKYji3xG1HSSUA/s=@vger.kernel.org
X-Gm-Message-State: APuU4Z/9h2IoId9YcqYkAP/bylbH88KMXLOzpzCmFSz8xoDYRyLnxi6j
	tYFJztaLKD83VLNrcm86Qny/3WrNGSwHO1bl8VhMgNPjEOVk4iHAOpfPRGZD3gJMZNPuykzYalq
	MtCf08pslqg==
X-Gm-Gg: AYBFou0D+aTevj3kUESWPOZALIoROgvLpEzu7V+G6qtHiFsYQoVnCfkWhdVdNP69L0C
	1VX99gOaf/zo4QeSgsaOJi0M9AHqfoz+gPWQcB8ymbY5TKDXNqeAMWdMjxfs7pIQCmXs+EydZbg
	OZF4kA6WyRsnN8vnxsviRJAP0y2jxVayty5pNQ2eH89GaoRYlFxiJs0G5hBvdo0BrKh1rFRadJ2
	j8j5lCXK2DAoxC7bKoyRAveyWUqRDwI7Q3cbfCXYvVMvkqOWQUzhWw8XvFM/f1CJtdOoUPAWwuq
	JUKtIpJT57rDQftHo0obFbcJ+yz49rFKfsD4PItnvi8sGIZlY15P5mg/pB7q9QN1+ahcWmD4Nan
	fsVm4snNbczFdMlIwjaSgBNOpWvFPBpZIrnDdtj8FJbrQeofq6QYApJpTpRxJa9+3dx33jpDM6W
	oYmREK9xvSVbHdylFHe6HfLqoftuGcR4pGmKd/MEHuPEYlAAEIxpiGoPIX1IaIQVJXSjUZZDwQS
	Si6onucH7PD4oXWoDZq/wKB93KKOG9Zu8fe/qwZKlxfTynNmkhKbwnPZOlr8YKWOJUT0WGNvsTG
	VbolSuOEI/S6+WCzQmTIILG8gJ2wLbpM5HotYEw08GpMhQ1ZW465J59Qd76clHpbYoWsnsLWN7U
	GZw==
X-Received: by 2002:a17:907:8993:b0:c41:960c:8c62 with SMTP id a640c23a62f3a-c50496a41d2mr74956966b.30.1794273658212;
        Mon, 09 Nov 2026 17:20:58 -0800 (PST)
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com. [209.85.218.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c504a591492sm40831866b.31.2026.11.09.17.20.58
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 09 Nov 2026 17:20:58 -0800 (PST)
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4d2b741ed9so242336366b.2
        for <linux-debuggers@vger.kernel.org>; Mon, 09 Nov 2026 17:20:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AL+hErEo0raYPIBblrx9masMMEUcIKL1tFkkxxW1NeFJp9dZmdLyOTH4onJAY38u5Wj86CuEik/usPMWtg28RgsLwjc=@vger.kernel.org
X-Received: by 2002:a17:907:9451:b0:c41:1750:59a2 with SMTP id
 a640c23a62f3a-c50495dfbd5mr87253466b.12.1794273275844; Mon, 09 Nov 2026
 17:14:35 -0800 (PST)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
 <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
 <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner> <20261108185953.28054fb3@pumpkin>
 <alpine.DEB.2.21.2611090504170.17804@angie.orcam.me.uk> <20261109214558.0d9d5228@pumpkin>
In-Reply-To: <20261109214558.0d9d5228@pumpkin>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 9 Nov 2026 17:14:19 -0800
X-Gmail-Original-Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
X-Gm-Features: AclHuK-x8jcOOQUqd2amGoGEAKER9jIFGaeL4LxxWAd0cGV7dz_RR64PtDogpPU
Message-ID: <CAHk-=whsA3tKcUCBJDj_vmJ11rVGT9rivgnKjGRgMO21CPmCxg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
To: David Laight <david.laight.linux@gmail.com>
Cc: "Maciej W. Rozycki" <macro@orcam.me.uk>, Christian Brauner <brauner@kernel.org>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, linux-fsdevel@vger.kernel.org, 
	Jann Horn <jannh@google.com>, Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
	Jeff Layton <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet <edumazet@kernel.org>, 
	Thomas Gleixner <tglx@kernel.org>, Al Viro <viro@zeniv.linux.org.uk>, 
	Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, 
	Joel Granados <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara <jack@suse.cz>, 
	Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org, linux-nfs@vger.kernel.org, 
	linux-acpi@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-s390@vger.kernel.org, linux-scsi@vger.kernel.org, 
	linux-um@lists.infradead.org, linux-wireless@vger.kernel.org, 
	linuxppc-dev@lists.ozlabs.org, netdev@vger.kernel.org, ntfs3@lists.linux.dev, 
	platform-driver-x86@vger.kernel.org, coreteam@netfilter.org, 
	kexec@lists.infradead.org, linux-pci@vger.kernel.org, 
	linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net, 
	jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org, linux-mm@kvack.org, 
	linux-sh@vger.kernel.org, linux-usb@vger.kernel.org, 
	samba-technical@lists.samba.org, sparclinux@vger.kernel.org, 
	linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org, 
	linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net, 
	Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org, linux-raid@vger.kernel.org, 
	linux-ext4@vger.kernel.org, linux-modules@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>
Content-Type: text/plain; charset="UTF-8"

On Mon, 9 Nov 2026 at 13:46, David Laight <david.laight.linux@gmail.com> wrote:
>
> Just that the cast would have to be:
>         u8 *foo = (u8 *)bar;
> where 'bar' is 'char *', and I don't think you need a cast there when
> char is unsigned.

.. and just to clarify: 'char' is always unsigned in the kernel on all
architectures since commit 3bc753c06dd0 ("kbuild: treat char as always
unsigned") back four years ago...

            Linus
