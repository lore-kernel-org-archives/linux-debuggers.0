Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793873607;
	b=FCO6JzClQDr3+cDOUlVxYz6QJxr2EGWjoixfQyJ6x3dGv2/AvviVNiB0qkUd8AWyru2/
	 oCMY7IVtXdsfRU9DGtsSk/vxHudHG3YVJpTTen6J+LsPVG8qUZm4hqGjAZPLhvnXSS2p6
	 2zQXfMuQV+XeUXLPKh4QNykMeg5Q/BIX7b1vLh/r6+yoxfNtfN1jVDlSzykzaz4J9TQ/t
	 phg7bx8Sj+4pbhwomnbyfgTX7HgaUF6NiW4FFCQu+8ykDpdt/JavbXu5idjl/yl+i2J16
	 h/wKO+RD8eBF1dCHZdQYnX7eP4wMxoyBgYY407lYw9d0uErJbKpqKZ2oIQVIhZNSqsg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793873607;
	h=DMARC-Filter:Received:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Received:
	 X-Forwarded-Encrypted:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type;
	bh=HRfPjQi/EPajP85bp44Mrjs4W2fVG4O74jaEjdHYdtc=;
	b=urQMKoxYp9+unkzEj5//7Sk/jKx1T5JPRcsR3p0G1V/kJwpvsvXvqcxb4684iUB/Ogb5
	 fxpp9KGX076o1CymmRxPJJ22t+TlV1rRBEpu/rAhDsvgXpIrFBmBDPSKuQr6DGw/Xg50P
	 UwV1WoZfol6Y4keTfFDTSI4ueTEFXoPffsxKY7ihwDxlixNU4VSAdJjBKsUneLh/dw53f
	 ImpHs+0zI6GnZmsTmcAa/Zm2Qjps3x7CKKvswX6a6Rz2/DNhgfC81EHhLK+jQWvQGVxgO
	 VOObPHKwYKhlruKRKhhxH6r9DJYNN3UtEkyzh/ZWgPGQL6fWqUGjRB9WbL+zAMo5O4w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux-m68k.org;
	spf=pass smtp.mailfrom=gmail.com;
	arc=none smtp.remote-ip=209.85.219.51
Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDE17606D804
	for <linux-debuggers@vger.kernel.org>; Thu,  5 Nov 2026 10:13:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDE17606D804
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-91c8fef5ce2so18630826d6.2
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Nov 2026 02:13:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793873606; x=1794478406;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=HRfPjQi/EPajP85bp44Mrjs4W2fVG4O74jaEjdHYdtc=;
        b=rJsq73M/3SNVZqkXCv6TeII0BRGMDpGrqvaycAqJZA5A71rjQ9asxxeaK2QFNXUKBk
         Ejtlwt1QxR2Wmo5fEhsP7LswaKDM9/N8pZIEBtojyKkk7jVmutAeN52DrCzjsOJbNuJY
         0sqdmcDv7OZUUOAYQuHUbtnGF0tH8ViVBy/6sMCU8SD9uD5JBkxFqsamyDnnAYizhLX3
         zJ4bj5DvagW4ktT5teaLwqa9dzD5A+ie7hBmR4ULNtRA37d8nF3wai7LvMMEEEe+Z4Tw
         jrLHLjCXy0+54KtfyyHvupmiItgAXM89GgrrxatMyiANWNlOA1DZ4KGh5a7+mFPhOBjy
         NCAQ==
X-Forwarded-Encrypted: i=1; AKwUvBzEfe4Yum8xtJnXuLX70YQGnIkinhDDC/4Sm2KqvqXY2kDh/o2Y6/l/qpCZyYhDmNNAeQ0V8W493txbNKKf+xw=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wJJKofDe6GnZALgo+2NgkngDIrNS0fGNdOZmqm0X4VUwb6db8
	uiJta8VCeLzu4wlNtgzwJAVZaM87SW4cisl0EvYJ8MMKQYDzf3CQe6JTdiCG8oAUMH0=
X-Gm-Gg: AYBFou23XHOe62vOyEvpUXixLk/h0oAukpTlZ4pGD8rbit1sYeojmvYqkJdmi8kjhCt
	i8+5oqT3basI/vB5lgkzgf/N/4jPyVFETUUXlswAlrpKWSrmzQPJVT2Y2zuvLw5pIFAE41PIV7F
	AoF+jiCSMtdMDMEICnNRBzdExFBDAJJ7NN7KVAQGVzDSnxTinm3lJXGRmisWZyciNGnyUyGExZK
	PZLX+oKDvZoNCcgOHUNIheTJuKCvS+9XsVl8vh1rgGtOGGyca5m/coKnnkEYQE53w7KxEGJJvTX
	Iw9fZ7Je9k9x0aXN2KQZoIcoOUHOFTwGl/MfAfN32IYm1kKo05c+ZU+t5us98OVEOXXTA/nsyfx
	vBXnXjpN+fwoLNs5ID2iU+sLXvZGY1HZPm4Sl+ebOuViJSKfIRmD+I1mCKwQ5H1OYWmMQY6dElG
	VGY9hymNb4C71imshzxvvj4zl87gQx8JCY29jyhopUmMIW9FS/dxXXjZtlL/9IWsynZ2qdpmJnc
	pto/K3+Ri4i5EpXzoT9diyBx8JVM3y/aanLQuSwzURKqiPFKcr/teY2zBS5GcnK56Hf6dRky4/w
	8pyWEpGurXbT5hPTXb3qsmyIW3LO9xSPdVVpLJMBg6rI6nWpIDoyj1K/OEOysvY8JlM=
X-Received: by 2002:a05:6214:5095:b0:91e:a124:d7a7 with SMTP id 6a1803df08f44-91ea124d8bemr2244566d6.4.1793873605674;
        Thu, 05 Nov 2026 02:13:25 -0800 (PST)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com. [209.85.219.43])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91e962b3fc2sm17933226d6.4.2026.11.05.02.13.25
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 02:13:25 -0800 (PST)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91c719669a8so17270366d6.0
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Nov 2026 02:13:25 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBymg84a7+N1TxewIQTLZT/mXaeBnjX2NzeVdNcRT5WjgeP8ig7+uJa1TY/e0Fq1R24pTmxpeJo8X+hRMVW8Wlw=@vger.kernel.org
X-Received: by 2002:a05:6102:374c:b0:7cc:1a41:20e8 with SMTP id
 ada2fe7eead31-7d07227a940mr8060714137.5.1793873263361; Thu, 05 Nov 2026
 02:07:43 -0800 (PST)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104-work-procfs-core-v2-0-76ace653a773@kernel.org> <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
In-Reply-To: <20261104-work-procfs-core-v2-14-76ace653a773@kernel.org>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 5 Nov 2026 11:07:32 +0100
X-Gmail-Original-Message-ID: <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
X-Gm-Features: AclHuK9naqg5CZQ7lhJVrMhg9TNH44f-SpA5WbUGCGBsAlcoOw2midTd7doJSmk
Message-ID: <CAMuHMdVfakapgBK6TBhO1iWX8qzvLDk8jzRS=t2MVa5G=MCUeg@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 14/23] proc: let procfs copy in writes before
 pinning the entry
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

Hi Christian,

On Wed, 4 Nov 2026 at 20:32, Christian Brauner <brauner@kernel.org> wrote:
> proc_reg_write() pins the entry and calls ->proc_write() which copies
> from userspace itself. A page fault in that copy can take as long as
> the writer wants, just like the copy to userspace of a read, and
> remove_proc_entry() waits for it.
>
> So do what kernfs does for writes as well. An entry that implements
> ->proc_write_buf() gets a NUL-terminated kernel copy of what was
> written. procfs makes that copy before it pins the entry. The copy is
> capped at ->proc_write_size bytes, or at PAGE_SIZE - 1 like
> proc_simple_write() if the entry doesn't care. Larger writes fail with
> -EINVAL. The proc_ops go away with the entry, so procfs remembers the
> limit in the entry when it is registered, like the size of the seq_file
> state, instead of pinning the entry just to look up a number.
>
> Entries that take binary data in pieces, like the PCI config space,
> ALSA's data entries or a firmware image, can ask for
> PROC_ENTRY_SHORT_WRITES instead. procfs then copies in the first
> ->proc_write_size bytes and the write comes up short.
>
> ->proc_write_buf() gets the position like ->proc_write() so entries
> that write at an offset keep working.
>
> Note that procfs copies in the whole write before the entry looks at any
> of it. So a write that is too large or whose buffer can't be read fails
> before the entry's own checks run, permission checks included, even
> where the entry only ever looked at the first few bytes.
>
> An entry that implements ->proc_write_buf() and still has a
> ->proc_write() fails to register.
>
> No users yet.
>
> Signed-off-by: Christian Brauner (Amutable) <brauner@kernel.org>

Thanks for your patch!

> --- a/include/linux/proc_fs.h
> +++ b/include/linux/proc_fs.h
> @@ -67,6 +74,16 @@ struct proc_ops {
>         const struct seq_operations *proc_seq_ops;
>         int     (*proc_show)(struct seq_file *, void *);
>         unsigned int proc_state_size;
> +       /*
> +        * procfs copies what is written into a kernel buffer and calls
> +        * ->proc_write_buf() with it. The buffer is NUL-terminated and holds
> +        * at most ->proc_write_size bytes, PAGE_SIZE - 1 if that's 0. Larger
> +        * writes fail with -EINVAL unless the entry asks for
> +        * PROC_ENTRY_SHORT_WRITES. The position is NULL for a stream, like
> +        * for ->write().
> +        */
> +       ssize_t (*proc_write_buf)(struct file *, char *, size_t, loff_t *);

"const char *"?

Seems like you have to drop several const attributes during the
conversion from "const char __user *buf" to "char *buf".

While at it, I think it would be good to use this conversion as an
opportunity to replace "char *" by "void *", which will probably let
you drop several casts from users.

> +       unsigned int proc_write_size;
>  } __randomize_layout;
>
>  /* definitions for hide_pid field */
>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
