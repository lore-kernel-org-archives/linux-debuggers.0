Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C160207201
	for <linux-debuggers@vger.kernel.org>; Fri,  8 Nov 2024 15:31:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731079899; cv=none; b=UYpm63mFHF+xVt7vSJxZIKAQz9wVePJC1IzIpq4P88zzEu/jSo2quX+EWlAm/AVBmC2yOjhAizQ1TuTvswlfGXz7exrz8sWGYMZMfxs5DW5ofEDJRLr6aPkaUh79CHhAcEDcW/sk5F6HefZWYRrGBDdjBB2gbZqcYH2lWwzJOWo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731079899; c=relaxed/simple;
	bh=LguMVM4sVGeBIk+UXhhvzkbgqAyeZTN09fcokG5c3Ts=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=j4BfB7dI8aNEGSuSF3t4viBOtGvvwApbH3SZc+xHCeoX5zfcjm5qeY0H560lk4MVGNArTgJD9UaAMPiIQA9IOTP6LRJ+2Fbfw/Ee639EVcAvS0R1TUEzsPe56dgXdibkRXWdOEZhjANev0EQYjZ1ljwJwHlVHXXxtx5xDmHuXeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=f7R76U5b; arc=none smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="f7R76U5b"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-53b34ed38easo2337983e87.0
        for <linux-debuggers@vger.kernel.org>; Fri, 08 Nov 2024 07:31:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731079895; x=1731684695; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LguMVM4sVGeBIk+UXhhvzkbgqAyeZTN09fcokG5c3Ts=;
        b=f7R76U5bKUEoWBUMtRQbe8BoMAnTFvvIYpYW3v/qr30g+xwuXBc1Y3STRFt99lZ3jW
         1mcpf3HrpF86bUpQXoUH4v1mX4ZIbQX9DAztMxkf836Iend/Ot71P42Xp0yUlyuSmrM9
         oKIp3xmHOiE+tLpyhfvSg2CiDaNQjNr6/slKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731079895; x=1731684695;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=LguMVM4sVGeBIk+UXhhvzkbgqAyeZTN09fcokG5c3Ts=;
        b=GbaDE27qpu8t5+h9qKF4A4pDfMutfPb6jM93VxEfpcDLO/RIWz5iOuMF7CbssxQJUn
         hhMD/58V1ReLsMIPkwCSnh6m/cg6VuoCt+DyNya6L0TaVpgt5RRz4gISOY1g3qdVRRHX
         YtZ3zuvQ2XGQeCIR/hHCWtKgU6tfLZwMYsQehmQPiaFyhUb9VbWc2PNnrHimscapaeKp
         MV6Pwo1ChTTfs9iv4jwUf8zwgYfcD5JhKXiu9tnhGoSfDTeahVqP49zKZ4AUg+4Gnh0m
         SDgW/x2R8i6Vb6+5BriNRowEO32iVy90DhlE00ew/xxjjuz9J/+zuwX8ck/oL53ai5bc
         prDQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw89Uf+49zNML9WbxVdZp5/vk1kKA8U5qvtoYPJVuxvavhWrcCClpeyMtrQzvkN/dilBkoTdlkz7XN0R53OSo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy0TiJduwA/13D1PYEoXFsvnoW4nI/ER7YB1bFIyxV9SVZYxao/
	yY1rXZO/d8EBIVugidrRftBm5KFuHBvbi6Xndc+LX915EkJdorK4YhII/MznIhuJBDW7ei64YaK
	9Ew==
X-Google-Smtp-Source: AGHT+IH8AihWWiO2O/AEDxib/Ebn3sc1B4Y3xORkIqht6Y3iT9GGqN7JzUIyzGulvYmoChXuaHVb3w==
X-Received: by 2002:a05:6512:e88:b0:539:ee0d:2bb4 with SMTP id 2adb3069b0e04-53d862e5c0bmr1943381e87.45.1731079895238;
        Fri, 08 Nov 2024 07:31:35 -0800 (PST)
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com. [209.85.167.46])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53d826af0dcsm646986e87.275.2024.11.08.07.31.34
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 08 Nov 2024 07:31:34 -0800 (PST)
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-53b34ed38easo2337913e87.0
        for <linux-debuggers@vger.kernel.org>; Fri, 08 Nov 2024 07:31:34 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXr5xcHc9/bu/hCvrCARfWbbgo06jCPkfHr/+JHXw/jStae/BQ4AlLdEyogBHtgkYInVNKRCjl8AHdVZ0Og/sU=@vger.kernel.org
X-Received: by 2002:a2e:a813:0:b0:2fe:fec7:8adf with SMTP id
 38308e7fff4ca-2ff2029fed5mr18554131fa.38.1731079893927; Fri, 08 Nov 2024
 07:31:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zy093jVKPs9gSVx2@telecaster> <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
 <Zy1lyACVnZK4xwuW@telecaster>
In-Reply-To: <Zy1lyACVnZK4xwuW@telecaster>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 8 Nov 2024 07:31:19 -0800
X-Gmail-Original-Message-ID: <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>
Message-ID: <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>
Subject: Re: kgdb replacing newline with CRLF in custom query response
To: Omar Sandoval <osandov@osandov.com>
Cc: Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Amal Raj T <amalrajt@meta.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, kgdb-bugreport@lists.sourceforge.net, 
	linux-serial@vger.kernel.org, linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 7, 2024 at 5:13=E2=80=AFPM Omar Sandoval <osandov@osandov.com> =
wrote:
>
> On Thu, Nov 07, 2024 at 05:08:58PM -0800, Doug Anderson wrote:
> > Hi,
> >
> > On Thu, Nov 7, 2024 at 2:23=E2=80=AFPM Omar Sandoval <osandov@osandov.c=
om> wrote:
> > >
> > > Hi everyone,
> > >
> > > Amal is working on adding a custom query packet to kgdb for getting t=
he
> > > kernel's vmcoreinfo. The rationale and details are available here:
> > > https://github.com/osandov/drgn/wiki/GDB-Remote-Protocol-proposal:-li=
nux.vmcoreinfo-query-packet
> > >
> > > vmcoreinfo is about 3kB, so we were hoping to avoid hex-encoding the
> > > response and doubling the time it takes to transmit over a slow seria=
l
> > > connection. Instead, we were hoping to use the escaped binary format,
> > > which escapes the characters #$}* and leaves other bytes untouched.
> > >
> > > We ran into a problem, though: vmcoreinfo contains newline characters=
,
> > > which the serial core replaces with CRLF; see commit c7d44a02ac60
> > > ("serial_core: Commonalize crlf when working w/ a non open console
> > > port").
> >
> > FWIW, the problem predates that commit, but that commit at least moved
> > it to be someplace common. Before that some serial drivers were
> > hardcoding it... ;-)
> >
> >
> > > This effectively corrupts the data and causes a checksum
> > > mismatch.
> > >
> > > We'd love some input on how to work around this, especially from the
> > > kgdb maintainers. Here are a few options, in descending order of my
> > > preference:
> > >
> > > 1. Disable the LF -> CRLF replacement while sending binary data.
> > > 2. Escape the newlines using some other custom scheme.
> > > 3. Give up and hex-encode the response.
> >
> > I haven't tried prototyping it, but what about moving the LR -> CRLF
> > code to kdb_msg_write(). It would be really easy to do this in the
> > case where we're doing "dbg_io_ops->write_char()" since we're already
> > processing character at a time. It would be harder to do this when
> > also sending the output to the various console, but may not _too_
> > hard? You could loop searching for "\n" and send all the characters
> > before the "\n", then send a "\r", then send the "\n" and all the
> > characters up to the next "\n".
> >
> > If you did this then you'd lose the "\n" to "\r\n" combination in the
> > gdb stub, but _probably_ that doesn't matter?
>
> That sounds reasonable. I was concerned whether this would affect
> anything else using the ->poll_put_char() tty operation, but kgdb seems
> to be the only user, does that sound right?

Right. As far as I can tell, kgdb is the only user of poll_put_char().

-Doug
