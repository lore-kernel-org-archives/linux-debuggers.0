Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793872945;
	b=rvsL/iyN+VwE5gBz7r//Rjh0adoPLP41EM+DbK/V8FjpxE4wx1uckV1dvShOF69A6QS8
	 f6so9ZDpxQrTPY50+vvGWDv8UmGV+dLWvdyEhLnYHDb6/SPZTSGkmP9S4UKSG2NUMUlQg
	 BD0FAVwAr6iCgHZK/UBC+NIdKNRreue+qQpIkk913ns4ltNut5VTekqottmYokWWvYntY
	 gIVA69kvJFy2caXDwrezZRU49PLSOfHtJrHulYMDDNK08kAho3G5EJfgberFg0gTweqt+
	 vl0kQON5EgawUIYe7V9t8QWWcFP56mjJ8Muxo0If5vq10advVYe2fojDuEdf3p/qIlg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793872945;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=+mKdlgKO27T7zaM0EZirUNSUHhSIV/TKUV4SSUSBbFc=;
	b=1aWDTWnlMBuAVUqTCFLdhXoxvy2w5aFRj9F7YJU7P5Wcj03YGNNZEgqM+bEqJnze2G05
	 C2oAFoMLlAmMYORxDs5qr8eaz4lTBDdbwkAX1QdJv80O1min/wUyq8EyBjy2W86Lg+a8U
	 BLRjrxEUr1rULWPqzOs6sHD2VLje71fWWhgPRgmTDlZ+6NXqtY/tIIwIppU98raihwn1O
	 DHNn5/Jbdm3BzLp5dNdeCgNMUIZrWzWWB394aV/AgafeSKrUSjNLaSEMZEmhVz507LxPq
	 7JhZfC/nT67at/Cx24DxcxySGXXKc/udvl7FjJB++Z4+jaam4karnfNfx/tujJ9szRQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.160.48
Received: from mail-oa1-f48.google.com (mail-oa1-f48.google.com [209.85.160.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8499606A32E
	for <linux-debuggers@vger.kernel.org>; Thu,  5 Nov 2026 10:02:24 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D8499606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-oa1-f48.google.com with SMTP id 586e51a60fabf-4a76f0cce5fso797085fac.2
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Nov 2026 02:02:24 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793872944; x=1794477744;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+mKdlgKO27T7zaM0EZirUNSUHhSIV/TKUV4SSUSBbFc=;
        b=MZ/S3DUsxq/gwNdugkAfPbsYKci0iJJr3n1W5UAQBUaGq98AT3sCfYcMJ9GQJI4VQH
         QTLs6U8pGE6j504zDxUef0f/LBCI++Cvez0YlE3PyFoKHEws9eFzwG6kCU9pT8YJobC1
         DXROmCy5jOMNFy/Mecsf5IemHj9yibQZ+wT6pWNWIrl6nywVgwr+roXa/iWGvXs4j0k0
         rmD+HIve5rE3f0AEZdUMV2BNZChZLfmsMhjl+A25MEw2yydBON8HnObrDYFiDwQIuTLA
         jnJfet4JU5e/XH1JSIezSWh9kxVSWkYxZl1XfDMOsD/g8HcKBwEm3rx82VYxIVqm2KD/
         6GVA==
X-Forwarded-Encrypted: i=1; AKwUvBxLWgw+H9VL3XxZp10QXw8ggCMlZdxl5llENfhN5rIm58moipYXDsGt3H65IJ83udIPaCCqLPKluFPEuZ/LRGw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/eHWnfJdXRkb9vzCYr7GLTvE661BMcvf1KF5z5+2RycBvS8nsc
	Xi0nG/vvGv0V34r6Y0MsQGi+16C1ZjFABdcCbojgH+ElZ2cZjS4XTXe3NQZFEUzrZjo=
X-Gm-Gg: AYBFou3kFCLemwyieF+flNHV9lC/GkBt9G/1RwCa5MtG6aWTKgnPunizQOZvHTpgb0x
	z+ZixKuiGRtM35cGlAbpoIjciD5hmhkf+PEYLYDxN34npwG6XALxzmeRj5Iisnm2TJGr/7VUxEX
	FAl5wtuct1UFcOqaBY2EV8L3R/AOH0VqdeIExtHKAKVKzcBwAF4wp6lVZcpRTDJeJxz0ltBPyC5
	HjroQBGghR8VS98Kfis6ygcN8UqaYwgLsCO8Z0W3OLlQZg2xFsHhw3ZFYQtGfPdVnQwEJB+eefB
	NGvdgRgTv8sg+ahZ2T/e4CYrHHyChgZUwtIPhLetulICy+YKaXUp6X3oPzf1CyECm12Vy+XrznA
	H6CBkQQYMiowBTJzbVh+lswzjrwFqF9jFfloIUUxJKrYtfYN7zLLsNFAiP5YZLpgDN4O0L0Pjh6
	nJcGjMwaMBwHR8qNB40bKqcwed1o5p2mtqEmOWeRNqaxNZvLGcAkG5YsY0hDKx4uDw9nUeF/fD6
	EiWvh7SyePeuH5/9hX794Q5cu88ZLt534BDmk0O7w9ye6dVL6wF3OMu8LLDEdm2xuMMjfzziYOm
	qnFbnuKxdBQv+yNjxn+Bw72tuESWQQWL4nw++47Chvvyhek6qARzZX+u0QwG+Hd+iA==
X-Received: by 2002:a05:6871:5226:b0:494:8220:8349 with SMTP id 586e51a60fabf-4a90769959emr11440289fac.26.1793872943573;
        Thu, 05 Nov 2026 02:02:23 -0800 (PST)
Received: from mail-oa1-f46.google.com (mail-oa1-f46.google.com. [209.85.160.46])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4acea5f93b7sm4399845fac.12.2026.11.05.02.02.22
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:02:22 -0800 (PST)
Received: by mail-oa1-f46.google.com with SMTP id 586e51a60fabf-48ed0b68895so1038752fac.1
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Nov 2026 02:02:22 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzpDzj05k+D1admV12fcU09mwUpKdCShJiEXalnwkDZ3xZdOso9wMj2c7/x6JXM1L8kzpwFTsF2ZITWdws8pwA=@vger.kernel.org
X-Received: by 2002:a05:6102:950:b0:7b3:8f0a:f76c with SMTP id
 ada2fe7eead31-7d072bb3726mr8218716137.13.1793872596997; Thu, 05 Nov 2026
 01:56:36 -0800 (PST)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-cleanup-v2-0-1e6687e226b1@kernel.org> <20261104-work-procfs-cleanup-v2-5-1e6687e226b1@kernel.org>
In-Reply-To: <20261104-work-procfs-cleanup-v2-5-1e6687e226b1@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 10:56:26 +0100
X-Gmail-Original-Message-ID: <CAMuHMdWkL=-oCgLA3HB0_Js_TdJ+P9FDBPF-u2z7uHrL+m7g-g@mail.gmail.com>
X-Gm-Features: AclHuK_YSG69l_UQ8CXymziWm2hhXR-Ce9gvdG6ZGXmuBEE26IV_RBgt33sxH_I
Message-ID: <CAMuHMdWkL=-oCgLA3HB0_Js_TdJ+P9FDBPF-u2z7uHrL+m7g-g@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 5/6] proc: drop the _buf suffix from the new methods
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

On Wed, 4 Nov 2026 at 22:16, Christian Brauner <brauner@kernel.org> wrote:
> The _buf suffix told them apart from ->proc_write(), ->proc_read() and
> ->proc_ioctl(), which copied to and from userspace themselves. Those
> are gone now. So drop the suffix. ->proc_write(), ->proc_read() and
> ->proc_ioctl() are the methods that work on procfs' buffers from now
> on, which is what kernfs calls its read and write as well.
>
> Done with sed. The flags and helpers in fs/proc that go with them are
> renamed to match.
>
> No functional changes.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

>  arch/m68k/kernel/bootinfo_proc.c                   |  2 +-
>  drivers/zorro/proc.c                               |  2 +-

Acked-by: Geert Uytterhoeven <geert@linux-m68k.org> # m68k/zorro

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
