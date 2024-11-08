Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97876EBE
	for <linux-debuggers@vger.kernel.org>; Fri,  8 Nov 2024 01:09:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731028160; cv=none; b=gyjFdIWQ6YRMZ/6JZ1+3tkbe6HTMBM26NGWIYVF/8hWUZlVl39+gw7VGxHhsSf4scBzy4v5b7aqIfxeCqOnk61GE5BQg3UrL6FpvMqvo8mFr7SQzjZT6etLIVy+r/fNZsGo0txXZIaX49U9Kce5TuA9b3m13b+9NOHFYYBthkoc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731028160; c=relaxed/simple;
	bh=IiUoSmHd5bYwz4Q4CGLTZdbl6ziZuSdTMUPJSqxAeGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Y63rkTDEroL12Y2cL0w13w+Op2+GUjILTFDeoEdJoryapaPWHpl2LQrTJ+fWWIgb4ek4JqbVzGCZ/SR2WO2dNis6SwDHGqZ6TEFGsMFbm12Ud54RouvqR5XNBDzbsdgGeoan66BeUOHsXxXu2ACwZqa84GsGnn+8mE+3uWR/J2Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=SBe1BAVx; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="SBe1BAVx"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2fb4af0b6beso25930441fa.3
        for <linux-debuggers@vger.kernel.org>; Thu, 07 Nov 2024 17:09:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1731028155; x=1731632955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IiUoSmHd5bYwz4Q4CGLTZdbl6ziZuSdTMUPJSqxAeGI=;
        b=SBe1BAVxWUWgviod/hpBtCz2YApcpExyTk8IvANXvyvY5WDCHCuW0Sg1OkJzs7tFfp
         iyIyMgrYVbXM1YLn/vXwAj9N8Tqotz2wvfGsCxAOJzhCTmddhPONqlAe7v1zji3AVJEb
         hh8nRtJ26p9/x5LCsWIej6yFYpBn5eoeZmv5M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731028155; x=1731632955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IiUoSmHd5bYwz4Q4CGLTZdbl6ziZuSdTMUPJSqxAeGI=;
        b=npTgubeOQl1gwTCl0xIGv+bLaSvmkthUcWh7anwoivznLwqLjzl+GFQ+MgB26LVeSl
         lrswqKxdPnajXSyfGPeMSPfpslRxG9tx98WkviDsM2aZacLa5NbrZD32eF73dn0SC6yF
         oIGQdUJudB8hmoLqseHxbfXf0+Oosgl/kxy6sJ9wG2D6pYDVOGq9PbmiXYZz/WqwaXx6
         YXT277ec4rt8djK7l0UFHQJRaTHTDnw4hMyOydp2OkQkkrWzJvBYuqX+KuF4Oibm0wBe
         ZeTeT+0XucERuYNFKIKFiCQJazrZJIi0ajyTeN8DNX5y2iwvol4gTLC7Cw4bUKuXyeQf
         /7fw==
X-Forwarded-Encrypted: i=1; AJvYcCXWtxG4aRvxdQXFJLkk73iK1ZdHbr48KWr+IUWVG7cYRzls0d7w4Cqo3KBm/WwU1j2aXe4aYZSaxinqIgXTdI0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzu7ZXcKeRRsgOt6kP/NW45KHBqH4ajdJTyhBXK1/BgIKQ19/oQ
	EgZm9LsbbW2Qs59LYmoQgMtysJDtGsA9jfEbc3HSZ9wZJZhVsxeYbEbo54Ge87+bUsmn4hyWb3s
	LaQ==
X-Google-Smtp-Source: AGHT+IEUp/UViW6cknSaKANrLX3G/1UR+n3/85pbdCAOZ1RQzeMQo21YQ6hiP9NsL6ShJ9saIaEn/A==
X-Received: by 2002:a2e:a995:0:b0:2fb:5206:1675 with SMTP id 38308e7fff4ca-2ff2028a9a5mr7399361fa.27.1731028155301;
        Thu, 07 Nov 2024 17:09:15 -0800 (PST)
Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com. [209.85.208.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-2ff179918a0sm4329311fa.81.2024.11.07.17.09.14
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Nov 2024 17:09:14 -0800 (PST)
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2feeb1e8edfso23778191fa.1
        for <linux-debuggers@vger.kernel.org>; Thu, 07 Nov 2024 17:09:14 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWUeG4f7IDn4RPaem56v2Kv0O5Mv3sz/pvIbJUUoUpDi3/eMRPCqhiNR5AlXtrgtFpanmx0/zsWotxk+CeXqSk=@vger.kernel.org
X-Received: by 2002:a05:651c:b2b:b0:2fb:3960:9667 with SMTP id
 38308e7fff4ca-2ff2018a7e6mr7981491fa.14.1731028153615; Thu, 07 Nov 2024
 17:09:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <Zy093jVKPs9gSVx2@telecaster>
In-Reply-To: <Zy093jVKPs9gSVx2@telecaster>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 7 Nov 2024 17:08:58 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
Message-ID: <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
Subject: Re: kgdb replacing newline with CRLF in custom query response
To: Omar Sandoval <osandov@osandov.com>
Cc: Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <daniel.thompson@linaro.org>, Amal Raj T <amalrajt@meta.com>, 
	Stephen Brennan <stephen.s.brennan@oracle.com>, kgdb-bugreport@lists.sourceforge.net, 
	linux-serial@vger.kernel.org, linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 7, 2024 at 2:23=E2=80=AFPM Omar Sandoval <osandov@osandov.com> =
wrote:
>
> Hi everyone,
>
> Amal is working on adding a custom query packet to kgdb for getting the
> kernel's vmcoreinfo. The rationale and details are available here:
> https://github.com/osandov/drgn/wiki/GDB-Remote-Protocol-proposal:-linux.=
vmcoreinfo-query-packet
>
> vmcoreinfo is about 3kB, so we were hoping to avoid hex-encoding the
> response and doubling the time it takes to transmit over a slow serial
> connection. Instead, we were hoping to use the escaped binary format,
> which escapes the characters #$}* and leaves other bytes untouched.
>
> We ran into a problem, though: vmcoreinfo contains newline characters,
> which the serial core replaces with CRLF; see commit c7d44a02ac60
> ("serial_core: Commonalize crlf when working w/ a non open console
> port").

FWIW, the problem predates that commit, but that commit at least moved
it to be someplace common. Before that some serial drivers were
hardcoding it... ;-)


> This effectively corrupts the data and causes a checksum
> mismatch.
>
> We'd love some input on how to work around this, especially from the
> kgdb maintainers. Here are a few options, in descending order of my
> preference:
>
> 1. Disable the LF -> CRLF replacement while sending binary data.
> 2. Escape the newlines using some other custom scheme.
> 3. Give up and hex-encode the response.

I haven't tried prototyping it, but what about moving the LR -> CRLF
code to kdb_msg_write(). It would be really easy to do this in the
case where we're doing "dbg_io_ops->write_char()" since we're already
processing character at a time. It would be harder to do this when
also sending the output to the various console, but may not _too_
hard? You could loop searching for "\n" and send all the characters
before the "\n", then send a "\r", then send the "\n" and all the
characters up to the next "\n".

If you did this then you'd lose the "\n" to "\r\n" combination in the
gdb stub, but _probably_ that doesn't matter?

-Doug
