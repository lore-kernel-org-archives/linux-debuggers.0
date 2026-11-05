Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872816;
	b=OJIwR1r8SbNByqASWKv7PQICM97OpWiKfQ1axo3ouD/QVxL1JJox2KhYjQEpaXNpFQvB
	 wMCZsA3yt/YHHfzSHYYa7hM6rTI1XGLJgWhbCG/26rcrq2msWv8WuymO3mBQ6L2oj5E24
	 3XtX2omqmSKuepHjGJuW+n/Edqiq9UNawhxy366+3QsTf/7dUKRV2aVPBvBQKo6ZuEUHt
	 jYtjA5Pw+EKYEFYnD3lpFJ2DIbdg20SMDH43MffWnux8vNVNAxWn1keNlZ7liLNVcUKzJ
	 mBeGpfc5Q49ELRrISmN+qRsDcZZQRal8uAbnGFmoc1oF4LgCJXkaVHrZHguJ0VtmgNQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872816;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
	b=JnZJwcf23TmjcYBDYR8Y/hVvspm1K8qY2vGFGSNenh4oHgWnlyC43GsEj6dcNJw63GN5
	 LuN9pMPqOhV1kWC6x5YXSPDDxGtRtNfAdzhBdvmjzYcJ87QlsI0zCcO8jVSOdM6KuMRqf
	 R2XuHQFUsGhap9Wpyx85n/6madaanHxy3ekfLSYnr6nTwvmHI/PldL8L6xFPPyiqBT06r
	 EYK1M5Z//Efu7AiHdybNmwWnOctAAHKY0ta4zmU2AMnI282CROo34oI3qN6adw/kjGqdB
	 tYt0tXK5cXnHhXijJKSgnVB0SNXB+7IKnlOqeo968DmSCvN9NUiC0IW+nlgjj9zk+Iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.43
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 630C8606A326
	for <linux-debuggers@vger.kernel.org>; Thu,  5 Nov 2026 10:00:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 630C8606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c7a0c1617so23359076d6.0
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Nov 2026 02:00:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872815; x=1794477615;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=n+1lmuZTLENNkpqKh8T8PUriZ63OKZ7RGcjsYNzzAGM=;
        b=L5MOByyIXDssaGiKUdcg0b44j5DpXWn9Q//tx4ezO/JFl9IKNEN4dvbh4eub2IYKTb
         MbxrWanaBTwvwgIEPg0sDIct8nn82UEcWT2mvc+6cu/C+9iFf9PyjqmxVoxAlFgUqkcN
         OmjNJn8c98VJmKJkNPTKOBXd6qUjg80M+jejA3VQREuN1ntNetPjauIVBHHasR7uHgFy
         rQX/mfFy3s3DYhm9SPzFKF/uewWWV1XIZ0Qwjyf6IPfVC3g7psNRxWP/p+uNHMkaKkXp
         sqW6veIK4w38aCEcqRyoqQmDf9FiH6OKjKY94j/XA/0P2ZO3WOxLeqxatyEK4R4MGmG/
         +Ocg==
X-Forwarded-Encrypted: i=1; AKwUvBys/Y7Hkd/xC5VKlXbtrc1pcu3Jc7/b8MIJVVH5pPmRiC8/Z4E3351y+BwQ4w7Ucc1sGbRt6ysqz7M5rZ0DARU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/YkKbRWlGhyG/93sMmtIJJmc9k+YtPXIXUh8P+JYlUblak5vDd
	49095M3Iu9PgY+85l9Smd7tawErXTzSD4UM9dv0GXFzwKDc7fy1w/BaGjeMqqjQwP0U=
X-Gm-Gg: AYBFou1nkYwHqGD8vPpPTbBmCiE198402T8fODn9/LYfI2OezuQpD5drLz/kTbEvaFn
	PMO3O25jRYYiaL46cbV4TUrT0WqG7LGeEJzITnb+etpfqsG9kClg9aGd3bm6R9WpRcYVoSTJoWF
	Gfdk+fEiVqFbfKZgl0ar5+lud5vPMgQtzLykMkmvrTr4uI0rjtzsQ2nc2P9n0jEJ2cLFYd/ZSFc
	HhesQocf8yfBEmk/u+IY3TGl3UPhOumIf7aslYGpCvKWjZ7edOzAWO4K4wrdI/xPzST1A4PzFzQ
	l8UD48z8Q5+ANBOHNvO/kkhQVFCCBKAL/+eh/1IjMM2MWpI5dic49w58B15fE0HwycHnSflLx+Q
	PKbiRRgQPuuZ12+u9CwOt2SaVPHPN2CksfhsJj0PnCejpl+LpVT9RQM2+gUHmAv10QtrwNmq4ga
	OsG2bt2NpMLBvjp+UJpefmgSOs1SXVZjfguYnEpDCNmku0vgHQjb/oGWKXRD/6w1bSX08Yo/0Ki
	s8wh9F1NB6z2bhAUWNa1mufJzZy1V9MvnaRHvqHfX2ziAmzM18cn/e02wk/TayZe/m5zUM8L5gh
	UckxMOtIw8UDzqeHr2IhK7Cknwv14mIqa5Zf/+yDbCpz9VcrjqPlGOCH8uisn/JFmy4Ekgq1mNw
	7lf9As2l4NjnO5yc=
X-Received: by 2002:ad4:5967:0:b0:91c:a33b:36d with SMTP id 6a1803df08f44-91ca4b4c436mr305438676d6.36.1793872815344;
        Thu, 05 Nov 2026 02:00:15 -0800 (PST)
Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com. [209.85.160.182])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e9378dc70sm22303876d6.37.2026.11.05.02.00.13
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:00:13 -0800 (PST)
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-53c4b82919fso21103061cf.0
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Nov 2026 02:00:13 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBwvesMeZcVG5pvRe0b+EgFFOOE+imfQwnWDZwfqMj+37JDqFAK83ZWmywBvA7x3jZAc73+9kTfTu+Pm4KaU7TI=@vger.kernel.org
X-Received: by 2002:a05:6102:6449:b0:7cb:bc5e:7dad with SMTP id
 ada2fe7eead31-7d072baa450mr7614890137.10.1793872492413; Thu, 05 Nov 2026
 01:54:52 -0800 (PST)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-arch-v2-0-2aeb952c9597@kernel.org> <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
In-Reply-To: <20261104-work-procfs-arch-v2-4-2aeb952c9597@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:54:40 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
X-Gm-Features: AclHuK_RsrcE7hVRjmpZezBV5tMd490Mza2XAQiqUTgUNqAiHAzRP5z7NIbtMh8
Message-ID: <CAMuHMdUNBs_NyhFpXonirMXkYptUWsAizMvVpGHUDLzto1LGJg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 04/23] m68k/bootinfo: let procfs copy out reads
 of /proc/bootinfo
To: Christian Brauner <brauner@kernel.org>
Cc: linux-fsdevel@vger.kernel.org, 
	Linus Torvalds <torvalds@linux-foundation.org>, Jann Horn <jannh@google.com>, 
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

On Wed, 4 Nov 2026 at 20:36, Christian Brauner <brauner@kernel.org> wrote:
> Implement ->proc_read_buf() so procfs copies what is read to userspace
> after it unpinned the entry.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Reviewed-by: Geert Uytterhoeven <geert@linux-m68k.org>
Acked-by: Geert Uytterhoeven <geert@linux-m68k.org>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
