Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794164398;
	b=B/jA1QXE+iltp5UO6WZQ6uZj8Gpw1UdvqMJYTdwOC6rSTNsZqvF/RB4jm5HWp+ZkMR24
	 qYv1Y9MgBpJYam94kYoSSP8M0OW+3e4Ex09lNylv/CyY87nSnSURIq/JGQIoPYkrELlER
	 G6dIQoPuRtaQ3KkpCmcWKUBlmbSElPry10N0dt3WdtVXoXgtLQ50uZjikVlPbWEITqnrZ
	 x2eyfymYYSQuQHGd2ZBf6w5h+QTGvWaK0t2HL+V6a22xbEGu66+L1heUalGfXa8/v/icH
	 NFoCWibwEJtzdtNPLspuHQzg7q/LFa8l932KZj+SgIDR/KQIuZAjdxJMEgNzyHA9VOA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794164398;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:X-Mailer:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
	b=Eur8NOk5ah63I+Ox/ykD+Y7fnd0NfjwBj+oBuKL1xdQPrmQ0wFyxOtqzH2p49XHSzAa5
	 yTXr52er6L69rQH5jKusWtWqVmCbOCEyylvo7ZRnR3rUhDJWG2oW21E9vNELQHKV6X2ou
	 vACom3leqt4i6gxLm242srSJiurtI2jAictzoCpzPM6S6LN7gibilW/YTnjsMdCL8gdqB
	 VmmundhD6mSjpSe14qvUiH+M3d8po3V55u5otxwWR0BohsS16dFFCmF+B59xpqHNyhRtV
	 gwlsSJzuTOgJN7qgs9wE1FAQKJPh5d3BPlLjT3Ofi9uLi2vMZ9fmUsZUMYIjBt03vnQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU;
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 385F3606A336
	for <linux-debuggers@vger.kernel.org>; Sun,  8 Nov 2026 18:59:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 385F3606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=XrEUEgHU
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a35ac4475dso1148445e9.2
        for <linux-debuggers@vger.kernel.org>; Sun, 08 Nov 2026 10:59:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794164397; x=1794769197; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=XrEUEgHUwv+lt2Z0T4RzlOQuYT1yMbnY/MJrtF5HY2pc8m0ujKE+1IGJbqc3A1SsPJ
         Pz+po0Wh7ECcrOl1hyNdZBme+OsO/r11IeCA1lW9KMbstFhlOkC0Hm7Ef+TTavGsfrDk
         7T2AE8nlcorDhYFpLo0KTCt4xOv09AacMRilfH2h4PS2mZ0iBReAF8XAcgtI3iT+qlRY
         EJQPYUIUlDRCCjadf1+24R8V0flZyhCZpLCroCVsidoQ510350k4POOaAcSXgGRrBTWF
         rbpUnz5O6K0TOR8uz/zwLHiObwDAqnCJFWP0+ssCNYCBYnXJwQ2yMfUqdKkv6ro/lp/q
         XMaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794164397; x=1794769197;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=JLhUwzup1lwefYy8NOOFjthYnrByVfTsqIe79kkV+Lk=;
        b=wqNtG9Cj8P4WqkvLoXRXldDZh8Vl2TLBI6w3b2KMKYBag92scQJQNsL1k5FGPZdwmc
         /iEpJCGkImHJRXnAL7Ipo8gG+XDXlpRacU5rAVkNDST0F7L192EMbrw0tFxlglLFIFxM
         bP4OQMzLkwQg6lkDXcMMspfxhMJcwvYca4741v6tVJHM5hxRGzDPFnJMs3nabst/8Nh+
         w+TtekN0Cxv/UpBO6YhvVVW+1943kLlfum9496f+Mj6FtGlDc6vvAB4ZSJ0UXnBIgEAq
         yQIQh2r3QG+pJ+346bpCDE4aklAI+GdJJ/4C3cyFw5I/bmIKuVk0DfN0fqd376MGorPg
         GhwQ==
X-Forwarded-Encrypted: i=1; AL+hErFcIfJBGENnceZLNW9vPJmyCqmikD6Ug8hshXZXRIT/pxuW0Xb0OMvLzV1E5LcqO8SSWkpC5yKxKFXcr6CLNP0=@vger.kernel.org
X-Gm-Message-State: APuU4Z+ydaG6WTjjk0m3FzXrRGc/UUZtcfFtmXcI/Q5TuBSf2gUwcGXa
	sqFwxE6yJuCdKJ279e4viCM56srr1Lo7AfGMiLHJvCHiCQlC9PyFQmio
X-Gm-Gg: AYBFou24+ISHus/54B4GiVcbawLa11V1a8VJLUdqesCW3hq5TTLGDCUDCqPNlBhWtuF
	56agvlP6cqATPxxh5nWn9kaF5hRmj5YqvBMNzLIF+LOOmCASNEKGKpOB4XgKNd4dFzD3YxmKt2d
	71Lg+3GOJzFMp/+lsDMVPW2UG3Za5d2Gfu0yptBUIzb+KqU1zv/svLqXIDVmW5cWfcs1f/p9v7d
	gWN7Q6Qn4cWhDl2dYMcxqGXMoy2n0tl+eTu3JUFhHjuJ3dQWmgnZZo79I8jrdr4JBIk44MIGavR
	KuAN1w3ijVA3A6kagGW3bvaFJiG65hbpY3uxaGeGA7GbU1tX4qRyEwmavtlf1LK/pyo8Pq71y6G
	DgVom0dl7/uEsIFhLuUcJpjhBxMTKFbaEOuGoNVgKTUtQiktAJl9crOrMPtz7MN0XCdkvm4Gc5P
	Al2bED9veF71dSurX/TjTguxsgXx0FBhsK6m7Z9XDBBr0YCEGdA0i0dFyq+9il8MroxWOF3w1Wh
	10rJc3Cqw6Eim0NgvGQbQbyFkKP2aKC66h+8kj+Xi4FjBgrNm1k9c6ErlpaPK2bm6fFic6evCf9
	H+KvZWbWDluzcJgANPgx3AYv0XjrjHUOFGVcF7zEO/N/wAxnXvvENU1jAYJCqIaz
X-Received: by 2002:a05:600c:468f:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4b960d9b170mr35982125e9.5.1794164396406;
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1f3acsm185228445e9.14.2026.11.08.10.59.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 08 Nov 2026 10:59:56 -0800 (PST)
Date: Sun, 8 Nov 2026 18:59:53 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Christian Brauner <brauner@kernel.org>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
 linux-fsdevel@vger.kernel.org, Linus Torvalds
 <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, Josef Bacik
 <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, Jeff Layton
 <jlayton@kernel.org>, NeilBrown <neil@brown.name>, Eric Dumazet
 <edumazet@kernel.org>, Thomas Gleixner <tglx@kernel.org>, Al Viro
 <viro@zeniv.linux.org.uk>, Jonathan Corbet <corbet@lwn.net>, Christoph
 Hellwig <hch@lst.de>, Greg Kroah-Hartman <gregkh@suse.de>, Joel Granados
 <joel.granados@kernel.org>, Kees Cook <kees@kernel.org>, Jan Kara
 <jack@suse.cz>, Jan Kara <jack@suse.com>, linux-kernel@vger.kernel.org,
 linux-nfs@vger.kernel.org, linux-acpi@vger.kernel.org,
 linux-kselftest@vger.kernel.org, linux-s390@vger.kernel.org,
 linux-scsi@vger.kernel.org, linux-um@lists.infradead.org,
 linux-wireless@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 netdev@vger.kernel.org, ntfs3@lists.linux.dev,
 platform-driver-x86@vger.kernel.org, coreteam@netfilter.org,
 kexec@lists.infradead.org, linux-pci@vger.kernel.org,
 linux-sound@vger.kernel.org, netfilter-devel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, ibm-acpi-devel@lists.sourceforge.net,
 jfs-discussion@lists.sourceforge.net, linux-alpha@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-cifs@vger.kernel.org,
 linux-fbdev@vger.kernel.org, linux-hwmon@vger.kernel.org,
 linux-mm@kvack.org, linux-sh@vger.kernel.org, linux-usb@vger.kernel.org,
 samba-technical@lists.samba.org, sparclinux@vger.kernel.org,
 linux-m68k@lists.linux-m68k.org, linux-doc@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-atm-general@lists.sourceforge.net,
 Takashi Iwai <tiwai@suse.de>, linux-input@vger.kernel.org,
 linux-raid@vger.kernel.org, linux-ext4@vger.kernel.org,
 linux-modules@vger.kernel.org, linux-debuggers@vger.kernel.org, Chuck Lever
 <cel@kernel.org>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
Message-ID: <20261108185953.28054fb3@pumpkin>
In-Reply-To: <20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
References: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
	<CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
	<20261107-akteur-gemieden-eckdaten-21304d085e35@brauner>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 7 Nov 2026 10:48:35 +0100
Christian Brauner <brauner@kernel.org> wrote:

> > While at it, I think it would be good to use this conversion as an
> > opportunity to replace "char *" by "void *", which will probably let
> > you drop several casts from users.  
> 
> So I tried that too. The thing is it drops exactly one u8 * cast in
> ntfs3's label write. 

Since char is now unsigned that one isn't even needed...

David
