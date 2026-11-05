Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872200;
	b=R/bN3LNC0aLiuTtcEjNoYs6E9cS1YboK96O82N14A3aqCSocyM6QI+WN8R8DTnxl0EQK
	 L/9Mm/VMyUrqtEZLKLsq6+zDHImmcieXjAdZZQJQSF7PxMAj5NZ9SDMEHMRbisiRGwe5t
	 IaA9bRE3iiH4NpnvwxSjrhvTVj+VkCp/KrR5oqq2ZgDCYzs8W7o7pZB0JWHSCyp8KRDtz
	 WHkzVn1/2TDx9exclgmL2093VmR9nL03oBfHl3om8ZDVz0GNeM2bjxx54frx926PEWOxq
	 8bo2+I9cG3nnUHKfrI3W4fZLClY3hJQzdVWzDXwBc//MEEXkqI5S5WzjGhsKV72oLQg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872200;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
	b=I9DldlYCUxdekzrvI/RS3Gm428CJRfOk1pLKWAE3DkENmlrc/wUTj023b5H2nWH/VUPN
	 1MzkOuz7VJ8Xr9uPadBvOiuQIXSlviJk9BxifrnqRz0UYcSGCw7hkihBJqIn051tyom4H
	 ktlAlO7rF2uukyQVQWA+PsWU/Wyzt+1B7cjXRDDyk/3feIzpcGQ7Ng+arRqxPjyyd/Bew
	 5YewMkgjYjNBBi497Pv6pUsQCEbIcSH6oIk9wcDWMZlVeITT+iLmw89FbFA6UdsgbneP5
	 8L5v2rG2EkdklJJsJoeWOVQFfEpoSDeBf5WCfSvAIFF6ibDKm3nn0EGeqj4a2o0ogSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.179
Received: from mail-qt1-f179.google.com (mail-qt1-f179.google.com [209.85.160.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130D8606EE96
	for <linux-debuggers@vger.kernel.org>; Thu,  5 Nov 2026 09:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 130D8606EE96
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qt1-f179.google.com with SMTP id d75a77b69052e-533778ab0bdso18424921cf.3
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Nov 2026 01:49:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872199; x=1794476999;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SqrTjgENN7Dfs+HehxbKPgACeb32UvvfMAFijNHd6N4=;
        b=RN9v5f+Yy1bx32nzLzCXEIdYW9qMPQm7j2iQ7+GJBRo8o/gOXme0NoWdP6FV9sqmR+
         vXVWjLxNGqoemSghMNtdg2yrlU0HkA4VaZMdoSteBIWxID/KYHU+2MsKBo5ysrM36ApH
         yhpPIg5c8QoI+cQsOpOvCXuWVqkRcGC9xXuT/Kw+ZdEZE2T0HcP81PKWbHLMB6Tx5Cy+
         9pfBu5ROTtrS4PWjQIMXgEaFfazz8boP8eGwJsfCknO7AO/GzDGnNBGLfY4cqsPKK49B
         CC0toALQI+GVNBGRrS39uxDEKqYdL5MdX8tm4BpXEToLMIEGSwdM85nL+zCD3nmEkeJg
         EF3Q==
X-Forwarded-Encrypted: i=1; AKwUvByfXe8IxECNlfcmS0LST8qpPj3gkZx3uk7X13SWXCeJTmr0eaJsPCt49X5CrteY+SA8MwbQ8a+muNeDW8Erg/g=@vger.kernel.org
X-Gm-Message-State: APuU4Z9pITDTwCVhePcKOhIaWmXtk6Zs5JVBzPwfZMmRq05tVLyLMQ+s
	UNScjjC5K0cyj9s/fm0vOCSOxGnhIs8gRYguc8hnxmb2gdh1NSN3BWdsSdkXmc7Euiw=
X-Gm-Gg: AYBFou0bgPi4Jz71i1toRpB+WU+tTiKW2gbjQTf8GH6ibVOb7Po3mw8SIyg+pFmRvaq
	cgMIjQI3ujzEst9yj2EOanDVHLChkKABnEAJXPVmyp6O2ApHIArpqwSE+8MVpY9/3BKX6jwqiCW
	JySzZrLAJgP5HUS6B8N2w0WOivLtttI+lmng8MdFDFTck8/rJ1fUnF2AH4OszgXCsY8P0SY36VR
	ETX3Ch0wDodaIWn8GoGsq+A7w+J8KFevrSQFYSUTnSKL/fdyf+x+bUGbtReLDflSeIypSj7Z6uC
	3sX74EN8PA4eINm1LMnevtbLL0gM4vRehpvXqZQzci9J+zBPZIeSr6RAOIfTps/PmnZKK63/o24
	sQEX6WFPg5EfX2/ZQHZ4F8BA4E2MJi5S5tvfftgUHjE+wNyJGaPjEPEaOhr1G49HCGX6Y5xquAl
	joA9dG+rqQNZKpwccxjJYPFx0iP0C8Ut7UL1+Ukkw0bBXXsHlWU4fTRm8teObJznOynM7WE4nJu
	5AvLsSpnc5GG1PW4knFS/0jEmjTQ4aVrbjC5Z+G/RYEO4lq9kPRWUnz1BZcOFlCnIac9TeZLsBX
	or0xjk40dsqVsl/cImaTwYXg4q5zDt3pIUvTjE3XFhwxsjv7VVPHxV4/AvzqUuczqFL5yw==
X-Received: by 2002:a05:622a:420d:b0:535:21fd:30b2 with SMTP id d75a77b69052e-542b6f4fb31mr312777721cf.42.1793872199014;
        Thu, 05 Nov 2026 01:49:59 -0800 (PST)
Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com. [209.85.160.170])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-54b10962a29sm46791951cf.12.2026.11.05.01.49.58
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 01:49:58 -0800 (PST)
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-5365f9a04c5so23442561cf.1
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Nov 2026 01:49:58 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBy6IUeV6tEpf9Q1LcmF7k/EAmb62gxA+3Dgvy2mEC+DVNmYv+ulmuRUu+D54c1IEHm7CkVjjGKW05Axobz254k=@vger.kernel.org
X-Received: by 2002:a05:6102:3ec5:b0:7cc:2bb7:131d with SMTP id
 ada2fe7eead31-7d072baa484mr7324212137.9.1793871885062; Thu, 05 Nov 2026
 01:44:45 -0800 (PST)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-bugfixes-v2-0-021c84d852e0@kernel.org> <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
In-Reply-To: <20261104-work-procfs-bugfixes-v2-10-021c84d852e0@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:44:33 +0100
X-Gmail-Original-Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
X-Gm-Features: AclHuK9D-nB8icBns0zdoQH8fV1cfUPJ6LOey8o_VlUZpDIGqKC4cFf8-j5-HdE
Message-ID: <CAMuHMdUy1RYKG0g8OWss3AD-jyYx3DXL0K7ABYkFUdxTxZ9VdQ@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 10/51] zorro: size the proc files like what they serve
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

On Wed, 4 Nov 2026 at 20:18, Christian Brauner <brauner@kernel.org> wrote:
> The files under /proc/bus/zorro hand out a struct ConfigDev and seek
> within that, but their size says sizeof(struct zorro_dev). Say
> sizeof(struct ConfigDev).
>
> Fixes: 1da177e4c3f4 ("Linux-2.6.12-rc2")
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
