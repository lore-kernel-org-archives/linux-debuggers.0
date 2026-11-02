Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.167.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793642733;
	b=SGEx8sN3fGqhU4mAEIZkbSvyVTpaNhom35GLg6hb9yXqJ4F6YAV3mHQ5+2+BTHomY869
	 d/gGVfUTdu42Xt7VTJ1Yrz5rVCL5hbZZl/Yy3zTnxTxkBUtwWE8vYMszMzRyxHXtTrksP
	 k25LKUxXHPkRD9FbZb+NdicNBNZKV2eaEhVYVWghjdggzLm8Ptz0FWNmoLZ0RxKP1AoOP
	 d3piS+UW4b6fo/d8lBnN5WT9B+7J8ebtynyUc2BwksdvLcAxmdHwwtwsnUpcL7D+Sg0yl
	 rfZy60r4MFwnqWqPKVnzPIk9d9ARTQFb3njT+2EHu71sWtxYvVVO2m+R/CtQExtxwXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793642733;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
	b=xTa6e6p36OxToAH2vk5Q6/R4BCdNeoKxCWw6WizkGWz6zSd48C51RVJMkjbg0GGRDWJU
	 0L4IHJx5zfCrXhy5I5Dhw2l7qmFJ3ACafFRZZ9RozDODmrldaNwSeeROcqxCONo9XQFcC
	 /7pjyIHz2Jsft5Nrh2Gp7c4Oy9JOPd72Ue5CZiJGLmKGvXBjhrQdiwr7D2pqmDpYMq9ZN
	 0KcwsPExv4+eehJTAOluUWRGPAO/eFrHtHlLJqhZ9Tg/xhNzvFz1UXQacirK5OiXT7D4F
	 JEaqFB0YgoOpwa5oTNl5cukX7CJnSoRz1cUUjs/WcPeEDxesSuFXTAE54fuhlO2o3EA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-foundation.org;
	spf=pass smtp.mailfrom=linuxfoundation.org;
	dkim=pass header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=D9Q6St3f;
	arc=none smtp.remote-ip=209.85.167.53
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A2CC606A5BC
	for <linux-debuggers@vger.kernel.org>; Mon,  2 Nov 2026 18:05:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7A2CC606A5BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux-foundation.org header.i=@linux-foundation.org header.a=rsa-sha256 header.s=google header.b=D9Q6St3f
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-5bcb440d1cbso2155566e87.1
        for <linux-debuggers@vger.kernel.org>; Mon, 02 Nov 2026 10:05:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1793642730; x=1794247530; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=D9Q6St3f+7KRZRdXp3tfajTEHqoar8kadmU7qZSVCcpQfVIL9mrz55DIUcslGpdziZ
         1bkDEsX+aWlkE3b5tB77sFXC4CCTsCowFa6Lud2DeUm1jsTkzg8HD7ymhPGL7iZYSUC6
         EaCSzoEMA6tBHhC2KSGcPSGRNNS+GLW23iFK0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793642730; x=1794247530;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/vXXDZI2TLqXD/tqTZGHj/cF0YcMq0fXP1TpWYkM2ME=;
        b=xWEdydqHMwFCs9WguFaCw+fge4YqXX+nMTDQUyZR5JK7n0gO9/6UmSBQMv+vI7jmDY
         6DBpXWiT34iyuML9exnHjk8UuSL7dJfbtkvePH0YsTKroSdyd57N2j1ZtB23amFF6KIR
         GZIqoLrJTkbRyuW6HpW45dSWV31fRZoup9ATVSK8bPpg/HclzPsM4foWUGJKquUJjLI9
         BvSw7gIx1q/24s7DQtRrIb1SGmwZe15tArS+xFce0nLEXXN47tD/lh1M8lTj+C85hs30
         +sQj2i5radztw9awimKdt+ni0TV/HFQt3R6ejZrONvvJdlwq/67QGI/EeolBBm82sLe4
         azEg==
X-Forwarded-Encrypted: i=1; AKwUvBw1d+is9VjQGk5ZfMtliV6YeR4qz+ylUxsdEzdTKKR7TiqGUcPiuvjUOwdplmBhP0sxoThBUcovFBkzrhyL3hQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z/JdXP0jNkmRGQlC5+5oJGh5QYdrfQ8Xxdak7klGkRYGWk/YAXi
	VkriaRSqdKYpm4id117OpnlXEl3OOH8iTrba8gwwYq4s/ClqnYn8gs5Al8vz4IHiWsHmCyyDEX9
	MgmS5G1EByQ==
X-Gm-Gg: AYBFou0ZVgkAo5gFwlQkeVFa+XWGE9v54ONU4jRD2qpq45lsZCAKBdKfLePxlR30LaQ
	Sct0WysAezQYX4U8kjbgJIj0YIjdXIcX3xAuwebD5K5GcbPHglaklDjzHZPO3qG7mUFzUINCZG3
	uLrZnJPnPb9mTbfwdma/j9MoNrCDCmxI0OtYe9lN321mz1XfX6rz543Mko7oc78RU2KG2JHel16
	J2IjnNI86B2mpvoS2RdOkTB4aQ0VjjG3uyts9QLDTOxUbf8kI6Vo9BXsyMsmWvPFv4V1qbV252M
	XDY+ZDDpeW2TbAdm7ML++LmECA7BrHMl2jrVFsGz1+Od4Dc5BJjSiffP+2AI87es8zLT+B+KV17
	G6Qnh05Y9jQ6hWRg1/fLsW04s3jvDZ+WQCwWFJN0POLYmT6GuMMCXGVulWn+r/OjhD3u1o87yvK
	dKuf8gsSlFmIKMJSImNNetzihrtm9xxc1oOe10xDdLewlaoG8xgb3EZDhCV65BuwquihpfvJmfA
	smR+JyeuAPzhmiaEDEcEJvXrKtkSrUiQx1K0x7iuhxnDbfDpbttwGjsBv0PYQq4mQyahR3+nH/f
	nLAukv8pC3xS0ssd7OS/ueXBB6RJwe9SnXaIVfEWDUtoJL0qWg47EQEISu1jmDL1PH3y+sLIRTT
	s0cRSpEEkHFezBrXhithn/98=
X-Received: by 2002:a05:6512:3e0a:b0:5bf:c79d:68f with SMTP id 2adb3069b0e04-5bfd118c56emr4439136e87.2.1793642730258;
        Mon, 02 Nov 2026 10:05:30 -0800 (PST)
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com. [209.85.167.41])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5bfe072c8a5sm1773650e87.36.2026.11.02.10.05.30
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Nov 2026 10:05:30 -0800 (PST)
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5be4fea434bso3801669e87.1
        for <linux-debuggers@vger.kernel.org>; Mon, 02 Nov 2026 10:05:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvByuSpjyuAt3WiQFIp97MT2PBT+6aBRA6QweS1uWgOMDEKW2SBbXAX+8OlP76rap4/IbWvfgzCOl92XG5QwlJAY=@vger.kernel.org
X-Received: by 2002:a17:907:d94:b0:c2d:c80e:8366 with SMTP id
 a640c23a62f3a-c4ca7426f6emr874452266b.0.1793642348398; Mon, 02 Nov 2026
 09:59:08 -0800 (PST)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102-work-procfs-bugfixes-v1-0-59422ed3e465@kernel.org> <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
In-Reply-To: <20261102-work-procfs-bugfixes-v1-1-59422ed3e465@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 2 Nov 2026 09:58:51 -0800
X-Gmail-Original-Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
X-Gm-Features: AclHuK_qZTBVsLQIdymgRHScSFenC6XsGggUDmcuOugjrSTbuVkeASUmC_hYPZo
Message-ID: <CAHk-=wiSA7-mqmAjTQDaU7UjUyWt0TxYwXHafL8ZAPudy+B_uQ@mail.gmail.com>
Subject: Re: [PATCH RFC 01/38] PCI/proc: don't truncate the position of config
 space accesses
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
	linux-debuggers@vger.kernel.org, Chuck Lever <cel@kernel.org>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 2 Nov 2026 at 06:22, Christian Brauner <brauner@kernel.org> wrote:
>
> proc_bus_pci_write() truncates the file position to an int. A pwrite()
> at an offset like 0xfffff000 turns it negative [..]

I think this would actually be better with rw_verify_area() just
checking a per-file maxbytes.

We already have that logic for lseek and friends - using that fairly
hacky combination of s_maxbytes and !unsigned_offsets().

We should combine s_maxbytes and unsigned_offsets() at file open time
into f_maxbytes and check that not just at lseek but in
rw_verify_area.

And then things like proc_bus_pci could set it's size limit in one single place.

Hmm?

                   Linus
