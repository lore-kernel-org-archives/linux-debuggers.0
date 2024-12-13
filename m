Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2AD10F7
	for <linux-debuggers@vger.kernel.org>; Fri, 13 Dec 2024 00:55:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734051345; cv=none; b=TV89KYr5SUePefQPdQU4NZHDdLPYYU4OfjD7L5BKM9dwYVvqh+th+9xSLesrcWXErtqjU2mBzExxm6acCFuBIIPfSmVn3oPIWCquVip+XcdoClgZvsJSj50QbgTOOMVIH8qwB34+5oySPXQoYa9cdqDwJ5YMlRB+2nFlql5fYbQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734051345; c=relaxed/simple;
	bh=D2Ri12qgS1tt6Ue4FUWRMak4bNjguZ3CDIzSeT5EJQY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fvs8KbB5PAjuaXIFA28OJ7GD6WBbD7Hx2Lwra1qKnR7YDmCY/0QAoljqtLLiL/V6LjQ+OCpzVmSf/TtPEtCOj2y27GOegKG/U517I+/qVnygo0rZKPBtoAWbLbjhytGKsLZ9/o5h4fHNIh0BPfoXPTMQOlfxzxR3nIvFTjDMtY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=JmZcJv4q; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="JmZcJv4q"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53f757134cdso1382606e87.2
        for <linux-debuggers@vger.kernel.org>; Thu, 12 Dec 2024 16:55:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734051341; x=1734656141; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WcTT0FmNV2c5bD1oBd/LU2lmJVRRZF1Sdah2uNcst1c=;
        b=JmZcJv4qbT1vVaN6CzUnEVoxxxhouBUygNvlr1qsRIq6WZ1G6NFdYE7H7Q1a+GDSNr
         /LLsqcEXFytbcDVdnVeINtsPtmJNvZioyIw+8/7g+Cf13TrdOf5Ss19Hq569lzNtQCOH
         pJ8+HRSaehcmcYcZgX/TYgiAOTNHL7SRjpWTo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734051341; x=1734656141;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WcTT0FmNV2c5bD1oBd/LU2lmJVRRZF1Sdah2uNcst1c=;
        b=jc2WtRMj3PVBG5+WsVOBE0qA7k45eecGWWXYaxIJEOSqUV4WjkPYK2pdfrGipheGUX
         4iEuwB/sLqGWRLA3h1g75MCt7HXLzMI70etMu+PIZH2zWy1nxe38bZMTFdRTNsODeAGu
         6F8wU4G+k3D1b/nKZmZY7tBC0/zELvlIl62kwsq3tE7XbQTneakcojTYKrMtsSx4J0KZ
         AY4R7joJhg3DkIhcxbytivyQhHZCG/jhrN64SfW4SJDYLv0d2FdeglgEHtmCdxjYce94
         3CIb7yhgrSWdhVu+bjuOa99a+l+f7yS/NMQuiwxcsorpVzjcnXBHxTw0uYMYbKtDKy10
         KiCQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7bBkqKJj6zsLA4jSfNsqIjNS5LVUkYhPbfUH+43QWhxIL3Z9DD5ean7aF9lQs/frTvr8vqwFTpsHkjGIONs4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+SN3ns/+E2IVj2KNG5cnqFaAihG+cVzKxgfV1LZp4zjiQQCg6
	O/2EGXdqVefYb3LMhL5qit98SlY8scb8DjnQCAmdnjs/uu4k7zGL9eENTT4R07xWQ1Mxe5t5fZz
	FoA==
X-Gm-Gg: ASbGncsfVT6yA2C8jvP0awkXDgVX1Pc3Q3bjHJ78eac1I42PDemDY7lUDL+HVPGQpNN
	/8nx/xZc7EGsbmuorbFgPkT4ohQlhKgBMBYVB4jM/ltIEpMc/8MMMiW9YEaqhZ8gl4IQGD7bHnk
	YtKaM8Yf912gVzkWzWJ8USwqTEp9U14nBJFtfcmwgAgtDZD0QcHWGQ0YHvt8rNo11RpgLvDR6lG
	cY/B/fWeTv4QcEqRZNf7fJhVTdJWuyZLaZ6YEp1IRTZnjbeEdMdxD5DP5Bw11L9c6a4Bk92mGKi
	W93xmrKP+FgPGwXyEMvdXc5l
X-Google-Smtp-Source: AGHT+IFHpPAST/B0xKIx4HPenUqxvafrltEDJvRWWHDmi4sCoaMaGlWhjx3iWEl94FpN8AOD2Y6Bxw==
X-Received: by 2002:a05:6512:138f:b0:53d:dd02:7cc5 with SMTP id 2adb3069b0e04-5408b80079bmr128536e87.7.1734051340720;
        Thu, 12 Dec 2024 16:55:40 -0800 (PST)
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com. [209.85.208.176])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5402960b0absm790844e87.102.2024.12.12.16.55.39
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 16:55:39 -0800 (PST)
Received: by mail-lj1-f176.google.com with SMTP id 38308e7fff4ca-30227c56b11so10799401fa.3
        for <linux-debuggers@vger.kernel.org>; Thu, 12 Dec 2024 16:55:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCW2ylfjr/yZDWaovhgM5lJY1/WuZLutzAePG3mYBoQfcWPW0QVAk2hZwsNY0LtHQCWmpxK4YCAWOpnf2de+qwo=@vger.kernel.org
X-Received: by 2002:a05:651c:154a:b0:301:12:1ed6 with SMTP id
 38308e7fff4ca-3025443fd1emr2004261fa.11.1734051339191; Thu, 12 Dec 2024
 16:55:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211153955.33518-1-tjarlama@gmail.com> <20241211153955.33518-2-tjarlama@gmail.com>
In-Reply-To: <20241211153955.33518-2-tjarlama@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Dec 2024 16:55:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=Xz2QqqTT+1Rmqq8hVEqQeF5-X=vgXKOjFe=y9FQVuDAQ@mail.gmail.com>
X-Gm-Features: AbW1kvbEOd0BlJ40yO5tbFJkxTLqckOiZmGfJuwh68hNQBkDbIpadlljHlKbfMk
Message-ID: <CAD=FV=Xz2QqqTT+1Rmqq8hVEqQeF5-X=vgXKOjFe=y9FQVuDAQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/3] kgdb: Add kgdb_mem2ebin function for converting
 memory to binary format
To: Amal Raj T <tjarlama@gmail.com>
Cc: danielt@kernel.org, jason.wessel@windriver.com, 
	stephen.s.brennan@oracle.com, amalrajt@meta.com, osandov@osandov.com, 
	linux-debuggers@vger.kernel.org, linux-serial@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 11, 2024 at 7:40=E2=80=AFAM Amal Raj T <tjarlama@gmail.com> wro=
te:
>
> From: Amal Raj T <amalrajt@meta.com>
>
> Add a new function kgdb_mem2ebin that converts memory
> to binary format, escaping special characters
> ('$', '#', and '}'). kgdb_mem2ebin function ensures
> that memory data is properly formatted and escaped
> before being sent over the wire. Additionally, this
> function reduces the amount of data exchanged between
> debugger compared to hex.
>
> Signed-off-by: Amal Raj T <amalrajt@meta.com>
> ---
>  include/linux/kgdb.h   |  1 +
>  kernel/debug/gdbstub.c | 31 +++++++++++++++++++++++++++++++
>  2 files changed, 32 insertions(+)
>
> diff --git a/include/linux/kgdb.h b/include/linux/kgdb.h
> index 76e891ee9e37..fa3cf38a14de 100644
> --- a/include/linux/kgdb.h
> +++ b/include/linux/kgdb.h
> @@ -322,6 +322,7 @@ extern struct kgdb_io *dbg_io_ops;
>
>  extern int kgdb_hex2long(char **ptr, unsigned long *long_val);
>  extern char *kgdb_mem2hex(char *mem, char *buf, int count);
> +extern char *kgdb_mem2ebin(char *mem, char *buf, int count);
>  extern int kgdb_hex2mem(char *buf, char *mem, int count);
>
>  extern int kgdb_isremovedbreak(unsigned long addr);
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index f625172d4b67..6198d2eb49c4 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -257,6 +257,37 @@ char *kgdb_mem2hex(char *mem, char *buf, int count)
>         return buf;
>  }
>
> +/*
> + * Convert memory to binary format for GDB remote protocol
> + * transmission, escaping special characters ($, #, and }).

Why exactly are those characters special? What considers them special
and so why do you need to escape them? I guess you really just care
about avoiding # and $ and you're using '}' as your escape character
so you need to escape that too?

Your function comment should describe the escaping method and ideally
provide a few examples.


> + */
> +char *kgdb_mem2ebin(char *mem, char *buf, int count)

One of the two buffers seems like it should be "const", right? That
would help document which was input and which was output. I guess
"mem" is the input?

"count" should be "size_t"

Presumably there should be two counts talking about the sizes of each
buffer, or at least some documentation should be in the function
comment talking about the fact that "buf" needs to be twice the size?


> +{
> +       char *tmp;
> +       int err;
> +
> +       tmp =3D buf + count;

Could use a comment that the buffer needs to be 2x long to handle
escaping and that you'll use the 2nd half as a temp buffer.


> +
> +       err =3D copy_from_kernel_nofault(tmp, mem, count);
> +       if (err)
> +               return NULL;
> +       while (count > 0) {

If you change `count` to `size_t` the above test won't work because
it'll be unsigned. Still probably better to use `size_t`, but just a
warning that you'll have to change the condition.


> +               unsigned char c =3D *tmp;
> +
> +               if (c =3D=3D 0x7d || c =3D=3D 0x23 || c =3D=3D 0x24) {
> +                       *buf++ =3D 0x7d;

Don't hardcode. Much better to use '}', '#', '$'


> +                       *buf++ =3D c ^ 0x20;
> +               } else {
> +                       *buf++ =3D c;
> +               }
> +               count -=3D 1;
> +               tmp +=3D 1;

count--;
tmp++;

> +       }
> +       *buf =3D 0;

Why is the resulting buffer '\0' terminated when the source buffer
isn't? Adding this termination means that the destination buffer needs
to be 1 byte bigger, right?

...or maybe the source buffer doesn't actually have any embedded '\0'
characters and you're using this for termination to the other side? It
would be good to clarify.

In other words, if the input is 2 bytes big:
'}}'

The output buffer will be 5 bytes big:
'}]}]\0'

> +
> +       return buf;

What exactly is this return value? It points right past the end of the buff=
er?

You seem to just use it as an error value (NULL means error, non-NULL
means no error). Why not return an error code then?

-Doug
