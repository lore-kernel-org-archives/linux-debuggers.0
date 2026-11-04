Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.218.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793823059;
	b=yaQ72XVukRGI9hvli1NiuGiJNq/XgsfcgdPLtXcVzGr8yZlldauzIdzdbb+E9+OZnu7R
	 xVG1lvEE+0XFJ5+1qK4l0g3LcDcSg3UZYZhBk4+mlWjZr4FgfnojiOqG5/KaKx7x6kfAn
	 fUrOxnMIHfp+5Td41fUQRWzULF9k/kbjeZTL3D5EovUl0yP4qwUDZ678WNQVl+uKox6BP
	 qXS3cHJ9l66zptAJdMzZYPV4zzH1Mh22Dz1PdyRKJQGVCrI+wBumK2YcTWEurkEV78ccd
	 V1kCvsOgsSmazmLdhjthg03SiUW13bgl2G3URvPdX//u1WYAJH2vAgtEAkNeFydQufA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793823059;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
	b=oCTQyS5tpRIX60O9qMM/IHfkLvbuiZu97A/vldcGsniqgAfrExRucvq5EMOoPxdX22wJ
	 0uG1W0XC09uFTDSpo5dnDnhg6xkWycUI0YKrRLzi/pAuACtGPKtfN2zDV+SLYgNdCJXyk
	 M6NjCBRNxUUoL1eWMLCugAZBQhVIqKZ8+9GZ6JTla6q+unJWSIVZVTXsPNBdVXjUXbIqP
	 GlivmWP2yeF0D4piLRXTxaM4NzKofEsFuInd5YkYYq0ifVJfaUJ0H/BoqqB0Ezlz/7MGn
	 1DdIC0E9rfu2Z4jOtwsYc22BNy6fWKOCh4MNAuLZsAP9kBtm8Dkzuvp9yGIi7QBQY+Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=P3aBW6LF;
	arc=none smtp.remote-ip=209.85.218.54
Received: from mail-ej1-f54.google.com (mail-ej1-f54.google.com [209.85.218.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B004D6070F2C
	for <linux-debuggers@vger.kernel.org>; Wed,  4 Nov 2026 20:10:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B004D6070F2C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=P3aBW6LF
Received: by mail-ej1-f54.google.com with SMTP id a640c23a62f3a-c4550d8ab15so176741866b.2
        for <linux-debuggers@vger.kernel.org>; Wed, 04 Nov 2026 12:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793823057; x=1794427857; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=P3aBW6LF8TPWECbmOza9UqmC5qzN0iKD7EiznWifSk4NBRsAwcvNIgn2W8kA5+SBz2
         YGQa7JdInj9fc1c4LtAGfJpWk0+89bi7DWXVTE03lz3O24NaVVxBTlbcOMR97tZANFjn
         VHmTW8D7SW8TTV/puA7xRTe81+ukLxyRSRczU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793823057; x=1794427857;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=LCqiLHf1DIbfKNXx3ccWkvqxBhOdwo3yYkazQxIGarg=;
        b=Y2bnMOkfmoIxpLOn5zLz3/OcNbpmbEgS31d+oLDznuFQyq0ROnU7TjkWUMLs8daZsm
         +cOLz7H2kpVWG4bN7MfIHsxe63YuSb4LIPd6nhPMbfKyQiN6jiERmFjOmSQa5QH8XepM
         pU3h3hYgTAcqyUt7Bsqs7jW1HzGSMjhmJY9y3ASO41dqTiruFGqQwyJuAhDJzMKf/vbe
         PTjchGIL3URBIma96+mswdw5dOKBhL734u8mQKZaYzvYsz1+MWN9897uSmLYGQNwRj0r
         a6EK9evaKaZAv1M4LUTa7rlGu0ewcDedq7zjENO84dHIfguWP11bAWnql7EWdE9FZTwG
         cKmg==
X-Forwarded-Encrypted: i=1; AKwUvBwp4jcf+aD0i/zqq4KWvDt0xnvTe5LriMR0c7g868H4INUNuW+TKV6YRJlyBk9OEdfc8C10C6s4968qLe3Z4kE=@vger.kernel.org
X-Gm-Message-State: APuU4Z/592sceQnKfqVJyCtd1ZEi+nzB1R86jiJs4dqPJv4DO6hSI9B7
	yBHS2vft9RPsm5RIiP0Uce/RtCjibEtGtwJNafw5WXguH8GCUb+tkEPBHDRW5hBvLt/QwVXKbmo
	S5MxBErgrCw==
X-Gm-Gg: AYBFou0vSBmvTXUhQnRuMWuYXdR8YSgNXX2qE3tsz/CZX5NcMF4jXmx+goq59huv0vT
	uTN1VjxYVfNI3X8ENzMPD+iATUfBkJ7aIUJGIk4/Bkhavmm4f2l8/8NnAG/EJgcXuOkyhH5OUji
	y9BTCPr4xG51/eRP3/Ho3jrW5BmbyF8ZARCC7l+rzaZGiUO7GBHdedciaKuy7BMM5NJPNMUhwoo
	qieouRLE5qikl0PQvln5A6dIJ2Qh5Pbqnqu70iGPmMTFvPbwnnKhM0DtA3MSyMlYjKePAPc2I0f
	GXHcTEiSP3X6tH/9MPQErbT1Dipn3LxWjPUfoXFyf8QwgEJZ5YMAFfK1NuArt6AyQLR+XM+U7xS
	HMz1plxX0yJHK22xdtK7DPw5FQXvah+N8aJVyZx0mjlBS96eYtGJ9rOaR1vA+ihCQfliO5Ln7cU
	kFEd8CkzUVh2+oL4JF3zsx/z14RrczKc37ef/8kxkozQt2j3Yp10hduz2nCMRluzcegL4CWhRu0
	awbGxGS3sp46So8LZu4HK38v2CqXxuL8zqFX3k/xZWEk4ZSadlqzVtBFITWLSnYQknXzEmxn+8L
	rwxW7nT2nHCWk+04e/51Em05brGaO1nUmisQvQMf2nPh4Vz9TL+tGtQxJ6X6rz0wEd6HwPcD+xf
	UfA==
X-Received: by 2002:a17:907:724a:b0:c46:645f:cee1 with SMTP id a640c23a62f3a-c4ca7ae41ebmr1614149766b.42.1793823057150;
        Wed, 04 Nov 2026 12:10:57 -0800 (PST)
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com. [209.85.218.47])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c4d0e46876asm105266666b.57.2026.11.04.12.10.56
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Nov 2026 12:10:56 -0800 (PST)
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c418e215671so167513366b.0
        for <linux-debuggers@vger.kernel.org>; Wed, 04 Nov 2026 12:10:56 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzjDAkbQldZlOxO1ZsHErnEH7T3E/o2A3IvB3fRcbxi9DRxqCV+yTLxGndDYwTn8E1leC+g5VIhuYZb+XlOsi4=@vger.kernel.org
X-Received: by 2002:a17:907:60c8:b0:c49:a4b1:9cb1 with SMTP id
 a640c23a62f3a-c4ca795fa50mr1973235866b.3.1793822725121; Wed, 04 Nov 2026
 12:05:25 -0800 (PST)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-v2-0-b45cd5789ac5@brauner> <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
In-Reply-To: <20261104-work-procfs-fs-v2-0-319e0f9a8aae@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 4 Nov 2026 12:05:08 -0800
X-Gmail-Original-Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
X-Gm-Features: AclHuK9j_YIgrwhhpWOlnull6heAULBd4dgTqoOhUQQjFm_MgoIgrL1vgPfefvI
Message-ID: <CAHk-=wj9Y9NcOesBBm+jhPjYa7qO00fD7g7uwX+H-k0-R2difA@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 00/30] proc: convert the fs, kernel and mm
 entries (Part 5/7)
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, Jann Horn <jannh@google.com>, 
	Josef Bacik <josef@toxicpanda.com>, Chris Mason <mason@kernel.org>, 
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

On Wed, 4 Nov 2026 at 11:49, Christian Brauner <brauner@kernel.org> wrote:
>
> Part 5/7 of "proc: move procfs to what kernfs does", on top of part 2

Christian - way too many patches, re-sent much too often, cc'd to way
too many people.

Nobody is going to read these repeated resends, and all you are doing
is clogging up peoples mailboxes.

             Linus
