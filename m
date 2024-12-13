Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF0224B26
	for <linux-debuggers@vger.kernel.org>; Fri, 13 Dec 2024 00:56:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734051420; cv=none; b=TcbNuD8aFf5kq+jJs17yyfvYkDvsg0d18hmCmNzrK3NhFmytQ1KMQRbOvRjSBDY34sfOzwmqqbsW9CZVkvgXbPpvW7VkTvmuCw6yI+pF+YJKyf7XLCdIsHjw1Q77BbDoWsHK/JUf8Q6M+1DbL0rnzWUso66wBVocNtd7IgoQ91A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734051420; c=relaxed/simple;
	bh=I2m5AflMhWm3zmkRWqfnN0lACjX8ab4rmVs8XbgL3TA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fYAxgoWBNn03qySuJn7Spt10g2M5akOHa0mHjm1yEqT2ElS3S1da9Uoj6cSY1j8nC65uOMdwIvfcjsSQjiggzxrc4/Wd04KCi6IzbvUQ8snaW5+79pW8oQjjG0VBqbshqXEJ9vf8I0sooTs/hHz+Ly7cDcBnffYGL9zbQ4JnVYI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=l0qDEbh7; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="l0qDEbh7"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-5401c52000fso1188379e87.2
        for <linux-debuggers@vger.kernel.org>; Thu, 12 Dec 2024 16:56:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734051416; x=1734656216; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jzmJ+pCUmwGTQBjg+zFWh/ARKLDiOAynXsdh81IlS5k=;
        b=l0qDEbh7gMwy9fWtINsvhbJyre/5Tt5p9deMpHsQdTA8vUalGFtgV1jKW0ejR81iAs
         uHPMq31C1sh8GrZHccZZRPZOyildVwKDT/JORh3PdA4RReNAzIGuTfdUE6hVM32OrpoL
         gvUioWGrUSYkRioSGQUPG1z0TM0jr8PWTnquI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734051416; x=1734656216;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jzmJ+pCUmwGTQBjg+zFWh/ARKLDiOAynXsdh81IlS5k=;
        b=BtUmfpp5jDappQ4hiWBKo1G0y0yXFbwYdnO62X7bVq3HfdYoO7Cxhf4mKtq/JieTjI
         +sIZBcPMkxA495tOzD1Fxv9faTuNr4OhDvvZRRa6oAXzjwEuhUpf+4H5g2nGqFgZA6C5
         ygLhg8mwOgJ9ICuvJoWR1PVhUdnde1OQS874xYc10jAOVqLf0ejYCo/OPQ4lADMq0BKk
         idSGmPIm2Q+AYnf8NHPbGYdLKatI5NLkHJLHYYIvXeKlsIAdof2b9uciOPFNBXTfCVNI
         pzVEZGIPTJljSNmsB21vCAQ+S9rl4jX7Wh+qE/Aau8yxe5DZjayH2jviFO9Adj0EBcFU
         JMIg==
X-Forwarded-Encrypted: i=1; AJvYcCVyvrO5L6UX7pRAT59SCMxSP9dXUD83mahU8ZiAxIcsRm1RVrRNk0X8cY8K2r+RnDTiQy4MRcrWGbdtNlv2xsE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxfKRkfzns+Ay3Q+kJVEOs04MkPiTzo4oGirazE4RidCKU9LXR/
	USXcgw92Qy6E4ch3J1w5AKQgW/J5AUxT/Ho7kHOzcjvKFi/kSRqVZPBOAYDpeZey+KyzYeYNeev
	fQg==
X-Gm-Gg: ASbGnctGbmEucm1V1C2Q0R+T8zI7OydGLSl80giY+Hklq2GyuEwm/3uY0cqee4B4poI
	Iw1r8oyoE9OX5nRX0gMiERd7F84QJ+/G26LRfgdYxGXYFf9bP5Ms64apd/gW1Ba7S6kNcb8TdTd
	BEbw1FUk1idImrhT8SvN3khZKNEVRZi0myG2Bai4Mrcrx6ofRw0ltejPeA2bb9YvZEyIO05b0dA
	hgzbWNkwtXhFtQfUuGPlXVUUkrQ8+ACexGl2aQ2jdnqyD85KQzg9I9ND5cmaB1OvBDfEKJcESQ4
	g727OV6Fztnmcp6c9ZhGXST8
X-Google-Smtp-Source: AGHT+IEjG2iGJGLImDgP1KRNwNCxzLbCS3ALCWXACkD40pRCtDm+2H+xp38b1EYS8B22PsUWxd5HjA==
X-Received: by 2002:ac2:4e08:0:b0:53e:3804:57a4 with SMTP id 2adb3069b0e04-5409054b446mr96512e87.13.1734051415579;
        Thu, 12 Dec 2024 16:56:55 -0800 (PST)
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com. [209.85.208.181])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229c22d6sm2494406e87.219.2024.12.12.16.56.54
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 16:56:55 -0800 (PST)
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-30229d5b22fso11403041fa.2
        for <linux-debuggers@vger.kernel.org>; Thu, 12 Dec 2024 16:56:54 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCURL6rUpaTBJqH70tE70JdlBOR5rowr79UMFhqYWxJhAdUvMpFolA/TX8zXhLfKiqVgVBiGqWPY4bxdelqxlfg=@vger.kernel.org
X-Received: by 2002:a2e:ab07:0:b0:302:3508:f4ab with SMTP id
 38308e7fff4ca-3025447d9dcmr2268471fa.21.1734051414355; Thu, 12 Dec 2024
 16:56:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211153955.33518-1-tjarlama@gmail.com> <20241211153955.33518-4-tjarlama@gmail.com>
In-Reply-To: <20241211153955.33518-4-tjarlama@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Dec 2024 16:56:43 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WMb5cftA7vBWm14HA9cjMMJECZbHWvVnvkSDwKBmYiBg@mail.gmail.com>
X-Gm-Features: AbW1kvbe0dw5XDbEnMkEkuS05NwlhGfOZ6MrQyJM9RhDk2_fuFMXInuRbV1-Das
Message-ID: <CAD=FV=WMb5cftA7vBWm14HA9cjMMJECZbHWvVnvkSDwKBmYiBg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] kgdb: Add command linux.vmcoreinfo to kgdb
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
> Add a new query `linux.vmcoreinfo` to kgdb that returns
> vmcoreinfo to the client using the mem2ebin encoding.

Can you add more documentation about `linux.vmcoreinfo`? Is there a
GDB patch that goes along with this that does something with it? I
assume that GDB patch would need the same magic escaping sequence
you've come up with?

How does one end up having a VM core for kgdb to serve up? Does it
automatically get generated before we enter kdb due to a crash now
that we select VMCORE_INFO, or is there some other mechanism?


> Maximum size of output buffer is set to 3X the maximum
> size of VMCOREINFO_BYTES (kgdb_mem2ebin() requires 1x
> for the temporary copy plus up to 2x for the escaped
> data).

Can you explain the 3x more? Specifically, it looks like the temporary
copy doesn't take up any extra space, unless I read your code wrong
(always possible).

Let's assume mem is '}}' and count is 2.

When the function starts you end up copying mem to the end of the
buffer. Thus, buffer will be '??}}'

The first time through the loop, you'll end filling in the escaped
first character and the buffer will be '}]}}'

The second time through the loop you'll have '}]}]'.

...so I think you need 2x the escaped data (or 2x +1 unless you remove
the '\0' termination from your earlier patch).

Oh, I guess you actually also need 1 extra byte for the 'Q' in your respons=
e?


> Signed-off-by: Amal Raj T <amalrajt@meta.com>
> ---
>  kernel/debug/gdbstub.c | 10 +++++++++-
>  lib/Kconfig.kgdb       |  1 +
>  2 files changed, 10 insertions(+), 1 deletion(-)
>
> diff --git a/kernel/debug/gdbstub.c b/kernel/debug/gdbstub.c
> index 6198d2eb49c4..5bec444fc6d3 100644
> --- a/kernel/debug/gdbstub.c
> +++ b/kernel/debug/gdbstub.c
> @@ -34,13 +34,14 @@
>  #include <linux/uaccess.h>
>  #include <asm/cacheflush.h>
>  #include <linux/unaligned.h>
> +#include <linux/vmcore_info.h>
>  #include "debug_core.h"
>
>  #define KGDB_MAX_THREAD_QUERY 17
>
>  /* Our I/O buffers. */
>  static char                    remcom_in_buffer[BUFMAX];
> -static char                    remcom_out_buffer[BUFMAX];
> +static char                    remcom_out_buffer[MAX(VMCOREINFO_BYTES*3,=
 BUFMAX)];
>  static int                     gdbstub_use_prev_in_buf;
>  static int                     gdbstub_prev_in_buf_pos;
>
> @@ -768,6 +769,13 @@ static void gdb_cmd_query(struct kgdb_state *ks)
>                 *(--ptr) =3D '\0';
>                 break;
>
> +       case 'l':
> +               if (memcmp(remcom_in_buffer + 1, "linux.vmcoreinfo", 16) =
=3D=3D 0) {

Is there termination in the `remcom_in_buffer`? If so, I'd rather see
a string comparison function used. Otherwise
`linux.vmcoreinfoWithExtraStuffAtTheEnd` will also match.
