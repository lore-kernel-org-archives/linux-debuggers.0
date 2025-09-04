Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C9C5C8F0
	for <linux-debuggers@vger.kernel.org>; Thu,  4 Sep 2025 15:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757001152; cv=none; b=fR4s8J3C+/HRdzkzFqaZkb434LKQiSZSL3FylGhv88IaYX7iNxSg7ZS3wmGoCAGWAD89S+SNYV7mxOfvnRkvy4srWEQtUdUrUqlu8o5hMqmTBLZiEes7z4Y+GpewhqipP2oeODWjybfdZQNIJONOAgk0suG6+PZ7HU9kA9zhH20=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757001152; c=relaxed/simple;
	bh=SsyMf0YeU+4wG3glWJqroefUkGJSLTFQYT44KukGolg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=psVkD3E0WKB/basTZwkgPr9J5iVVYPk9sbk4ZobLKZ1F/ZBqZbJk2wfECrk5qonoaFxq1vho21y1Xzibl5hiHg92MVakKJ/4Extw3SmdWyGxlYrlMpXltrkyomz/Dng1iGAkVbpuXsoMVQeleMV8phOgLUFY1s/PhGta+p1X7DY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=DPDzKK9F; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="DPDzKK9F"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-77250e45d36so1105464b3a.0
        for <linux-debuggers@vger.kernel.org>; Thu, 04 Sep 2025 08:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1757001149; x=1757605949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SsyMf0YeU+4wG3glWJqroefUkGJSLTFQYT44KukGolg=;
        b=DPDzKK9FcmDnVXAiKxHTIVrh1fftds9b1wASutEMFUjUGf/r/OhircCTVGWvglA5pN
         8rNF7PyvWxc5gJQK3Wcg3En4gXbPQ7vZLAnTUPgJK6bWZIU0q+lgzV8OFvVaLbfz6pfS
         /SsCDrIpNxw6jfb8k9toAsA6v/R7JgX7BnMZ4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757001149; x=1757605949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SsyMf0YeU+4wG3glWJqroefUkGJSLTFQYT44KukGolg=;
        b=b2jVM37/vBVg6Bvn8VK4jt4+VFh1e+d56W76ha7sbLtzyc33n/oBQs0aX0uBlqELtY
         xGB6A5aqonITd0GuY+t10xw0gm0ttsKHjnYbP/SzLThtzpHdO+9Z/rzUdWwaPgb/CbZM
         lN0hlfE3DbDHIWMvPLJp0efBSl2A4eAm6eFM/YpiNCZXqA4d8ksgyeRG/7e0vddKqU1L
         qT08F2phJaKtshIw6bPI+IwmhwEhzVd7fT/m7mZ/YCai5DJwv/NimWuqvBkIFyGawhLL
         RHOJIkUSM1irPsDC4LjFIjWmMvRCTJpg99C/f7OweS+E+xOH4PAlpd2i+/t3RyPeAiMK
         ZCTg==
X-Forwarded-Encrypted: i=1; AJvYcCVM4akyHo5N3iOJ8Jv5xzusiPTk4NfIYCICAY72QR3lca2tzA4xwzQDr3Ao0R4WAIf1r6U6G9Z936A/3vVHitI=@vger.kernel.org
X-Gm-Message-State: AOJu0YxMbFBH+qQCAhoAvwuyoAoEmMBU/T2Gssz5K93+Lf2vvWXsZshw
	eMYdQeHYjZjFHfH+QvlT1tQ97Z/tidPV8vORQgJ2NfzehsmhjrHWVc6qI8Rud2SowgLiUMwNx6w
	pUlo=
X-Gm-Gg: ASbGncv36mobR7e3agcj1UsPiLhsXHMXXHDLj7fCFGWidPzxEZr62aqLX+SsKIf1rS0
	Dg+9AUe4rKoGUqyoqT5E56YDuUg0UIPIJZQkOy+iKFVscOqShNSf9O8axw8EMftysUTztnaGONO
	9fBjai6S5Jm4sqZxJuFyNlwH6y0yJQeMGSUpXXnogjJ2K5zJkA9xsa3RCMLnoS+kAh3EaAZFa4F
	CtjqtXqVatmc832/6N58zWiBXRi1l8Ev1Kk6Yld0dEBqTJj4r9yVeqRjzfR4EhwhcNGEliP0u2T
	TOPy5Hm8H0LCs0ZR9EHB5ubVLqf9At38BeYKUAefNUf9sTT2cFJM9bjsTeONaJ7Mqm4p5p6vpqe
	VOdARl9DzZ+mPx1O4cLGrxdt39blI3Q9yqKyb9tCw0T8ZQrDAGdUamjRjlsZfRSubVR6kqj1Nev
	O/
X-Google-Smtp-Source: AGHT+IEnIBJTXEvkJl//QnA0JfeH7ylsPp0mkDWAHOtXqqHlT4USbK9/0b8xpG1VsdZKtwulnM4GZA==
X-Received: by 2002:a05:6a21:3282:b0:24a:1b2d:6414 with SMTP id adf61e73a8af0-24a1b2d74e1mr5852922637.18.1757001148934;
        Thu, 04 Sep 2025 08:52:28 -0700 (PDT)
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com. [209.85.214.181])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7722a5014desm19778926b3a.92.2025.09.04.08.52.27
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 Sep 2025 08:52:27 -0700 (PDT)
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-24b2de2e427so9298655ad.2
        for <linux-debuggers@vger.kernel.org>; Thu, 04 Sep 2025 08:52:27 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCWn+XMrAeSQlS3ebgcnDQZ5cyQNMrL6Li6t8GqmIEk+I2i2/2bXx4kBK5KrSUEz+NlDDWlU0oU1ShoFJunvp1s=@vger.kernel.org
X-Received: by 2002:a17:903:2c0e:b0:246:92f5:1c07 with SMTP id
 d9443c01a7336-24944b01822mr201057315ad.51.1757001146438; Thu, 04 Sep 2025
 08:52:26 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAFF3m8-OTGwzYz26dvBg38xq+v=emLA53Y=qGxcWrsCB6nsVLg@mail.gmail.com>
 <CAFF3m89PtnQ3iKDsfq6ZeS9VNJWt8z=eaJb0tOE+q8BSpyXAsg@mail.gmail.com>
 <CAD=FV=XrYxzX+_3JtE=jCyGHnye=k+tL0zqs+VjiC_ee=FH6Jg@mail.gmail.com> <CAFF3m8_+tz=Wm7SvQwrKmP+R6y2oADvCO2GhnfpXfkPwBTnQkQ@mail.gmail.com>
In-Reply-To: <CAFF3m8_+tz=Wm7SvQwrKmP+R6y2oADvCO2GhnfpXfkPwBTnQkQ@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 4 Sep 2025 08:52:13 -0700
X-Gmail-Original-Message-ID: <CAD=FV=UCoGVYXDiCwMZvajx2kPXLqNETD3FNaBAkCYVXzxUHFg@mail.gmail.com>
X-Gm-Features: Ac12FXwWro2G3oHn7lmvLyzC7lOX9HG3Cy376y1HuQyt73KdqbyCT4IA38Q8GCw
Message-ID: <CAD=FV=UCoGVYXDiCwMZvajx2kPXLqNETD3FNaBAkCYVXzxUHFg@mail.gmail.com>
Subject: Re: KGDB support over network for Virtual Machine
To: Sahil Khan <engr.sahil9@gmail.com>
Cc: jason.wessel@windriver.com, danielt@kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Sep 3, 2025 at 6:56=E2=80=AFPM Sahil Khan <engr.sahil9@gmail.com> w=
rote:
>
> Hii Doug, Thanks for the reply.
> I am aware about the stop mode debugging of kgdb/kdb. I have worked with =
kgdb/kdb on
> 1. Qemu hypervisor.
> 2. VMware esxi/vcentre.
>
> Now, I know that on Qemu ( if you have access to the machine on which it =
is running) Virtual machine serial ports are generally mapped to some tty d=
evice on the host machine. Data can be relayed by socat(ing) the ttys of th=
e 2 virtual machines( target and debugger). But the vm serial port to tty m=
apping is not persistent on reboots, tty is reassigned most of the time.

The problem of the tty being reassigned feels like a very solvable problem.


> Now for VMware based virtual machines, we do not have the access to the m=
achine running the hypervisor. So the above method generally does not work.=
 Things are made more difficult when the serial device support for virtual =
machines is disabled by the hypervisor.

Figuring out how to get access to this serial port also feels like a
solvable problem, but perhaps there are politics involved so who
knows...


> What I think should be considered for kgdb/kdb is :
> 1. Provide nework debugging support similar to serial device based debugg=
ing.

If you feel like you can write patches to make this work in a way
that's not too hacky then feel free to post them. This feels like it
would be quite difficult, though I suppose if you're trying to
constrain yourself to some network device that's exposed by some VM
then maybe it's not impossible. Almost certainly this would be
impossible for 99% of network devices. No way are you going to get any
large percentage of network devices to work under a stop mode
debugger.


> 2. Allow user to choose the frontend b/d kdb and kgdb, since kdb is the d=
efault from unless we want to switch but that switcj requires kdb prompt ru=
nning.

I'm not quite sure what the big deal is here. If you just start GDB
when the kdb prompt is up then it auto-transitions over, doesn't it? I
seem to remember there are a bunch of options around this too. ...but
if what's there doesn't work for you then feel free to submit a patch.
If the patch looks good/useful then it can be landed.

-Doug
