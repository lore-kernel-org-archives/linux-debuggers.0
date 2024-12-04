Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com [209.85.167.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9AB202C34
	for <linux-debuggers@vger.kernel.org>; Wed,  4 Dec 2024 23:07:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733353665; cv=none; b=smuXjDQ7KFyg05WtxhTo9EBXjhmYSQTWyUJl6u/3WHlhHTj8bdgVKA3/UppHBzTtmFdDiLFDcX6Qvtf3Gs/349nkZwdBCakrM043SmcUkGSDFo4OgSFsuMp5prJxY2j+7aHO7rGY70jkdudCZPblcgJNM276iJ76SzStN7AsiNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733353665; c=relaxed/simple;
	bh=dp6g/Bz2+KGQRtp1f56uI+qAkNeYW1oxVHGPNZWp3Qk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ELU9i9XPrvrTT/uK4P2f3vkAdDFDy+z7tXNCpRlwsFjRANILep3Pya24Zzr4C7c84IpCvjNMzP3P+C0SP6h4fv0dMBkFHHyuhcAfih88kqvJ8RJcxetVbN+ezPtJRUdtcpJ9GLIAq/q0fnAzM0cfkMSoLbcLc1OAtR/W0orwmK4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=BkA4YIg3; arc=none smtp.client-ip=209.85.167.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="BkA4YIg3"
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53dd57589c8so1573030e87.1
        for <linux-debuggers@vger.kernel.org>; Wed, 04 Dec 2024 15:07:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733353661; x=1733958461; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=;
        b=BkA4YIg3k16PdfIpiJdFMKg0jhpxajxcV8CdDwVIE35bknfmYcIlPUZstY6k0c5tmp
         BXvoP9pYen1WcHaUhvXZABcMP/su6GRLfblHbi6LA8nBlWpmmy1JsZNIFswFF/3eBFEz
         2GvpztQiU7TlfVY5NVPeVx4PwrIjPFxVBSSKo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733353661; x=1733958461;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CGqvSPZ3QIpZsykiZguhFk0cjVECVeKJ3q4DQqsIrHY=;
        b=gaM5pT8pZyScPbjCukWcyynGgyhNJgH1/r61kULXRJzz+XeyUBRvAI4TFV+X2RdaJh
         23c927HE/Ut8LGHAr/5e7rnYpfnZlKYQm+JilfF/i8cTCuXRnQTPORFZjA9RjEKLb1Lj
         L9HeCx03lnV/WVbHSlY59v5Tcbk5JCZ2vwC1O+6k+HMzAGYEW+bgO9Q6ozQbT6ECBxSW
         jK77xguTyszE50t4VE8HdXsfqch+OLOoQEojJLgOLQCjqw/Zyefo70PSHxZymdRHMlmr
         0KI7xFbZrqe0ejEh7xmFZktSRGGeIgpQQPB1/3WHoz379OsNVBPZKPnWK8DKkh/h6/m8
         +6Ew==
X-Forwarded-Encrypted: i=1; AJvYcCUZOIg2sMVGZUC6EvcZhGaN0C5orKhoOHsRiO9I1Te++GcshAH4u1PNLlIn4LXlRkawQfSJeuBUO1rNsoDejkw=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyc4NKGG0Pgp3NQ9WMSc7EHmctNstgEjrrvJrjVATG6LkVnlqSJ
	nIIXvrXsvhYDs2sgJLkrBtlsuqtWZgtEpnefo8XOkQOfFRBT4cWRq9PM/S3b2b/X2VUZUjv2zBi
	ZDVaw
X-Gm-Gg: ASbGncuLXZSeRkz+xEXs7pqbXtjz5+ONKlvNnSnJAFX3yTVvSknXiKToQD0X9KG/auV
	wDe5DwAiixRzFSdcmEbxliDtElbnVIsg+3/XS51INIrdAYlDNgVDifDzGj6MiuQmNSvyl0Wwxa1
	pPGB5KhGUnLbt8h6odDgglwMiLh5wnNwC9n4b/UENZ0xwUFou0X8Lvb7KZenCM4vDx5p1ffEirT
	0Qi27HB/RAGoAiZMSKl6BF+F4Hi+B/2tCewZmfmYD3gPzk+XjVxlf3n20JonoxWB/19YT06OI0F
	RaTR1NW5AjiAlQ==
X-Google-Smtp-Source: AGHT+IG/Nh7lUn4Q8SQQGOCynnJ+/Y6YxUV1/V5G/F+8OvB45kcqQd22oMg7qBrtIN2+xQ6vcAJwPQ==
X-Received: by 2002:a05:6512:3ca5:b0:53d:f583:81df with SMTP id 2adb3069b0e04-53e2192c4f7mr336330e87.28.1733353660636;
        Wed, 04 Dec 2024 15:07:40 -0800 (PST)
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com. [209.85.167.43])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e22974f54sm31943e87.59.2024.12.04.15.07.39
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 04 Dec 2024 15:07:39 -0800 (PST)
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-53e203d77a9so316045e87.0
        for <linux-debuggers@vger.kernel.org>; Wed, 04 Dec 2024 15:07:39 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU0bdVE9/QZZiTGuXgqyOXvM2zV8yPkF/WdrVYv0sMBGfBizbJRvpzBxZHw5qkmzgS5ocddNg4sivKo3mJpawM=@vger.kernel.org
X-Received: by 2002:a05:6512:2392:b0:53d:f73c:d630 with SMTP id
 2adb3069b0e04-53e21702ca6mr365280e87.14.1733353659083; Wed, 04 Dec 2024
 15:07:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241204221720.66146-1-rdunlap@infradead.org>
In-Reply-To: <20241204221720.66146-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Dec 2024 15:07:27 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Message-ID: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to process/debugging/
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Jonathan Corbet <corbet@lwn.net>, 
	workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <danielt@kernel.org>, linux-debuggers@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Wed, Dec 4, 2024 at 2:17=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: workflows@vger.kernel.org
> Cc: Jason Wessel <jason.wessel@windriver.com>
> Cc: Daniel Thompson <danielt@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: linux-debuggers@vger.kernel.org
> Cc: kgdb-bugreport@lists.sourceforge.net
> ---
>  Documentation/dev-tools/index.rst                                       =
| 2 --
>  Documentation/{dev-tools =3D> process/debugging}/gdb-kernel-debugging.rs=
t | 0

After applying your patch and doing `git grep
gdb-kernel-debugging.rst`, I still see several references to the old
location. Those should be updated as part of this patch, right?



>  Documentation/process/debugging/index.rst                               =
| 2 ++
>  Documentation/{dev-tools =3D> process/debugging}/kgdb.rst               =
  | 0

Similarly `git grep kgdb.rst` still has several references to the old locat=
ion.

>  MAINTAINERS                                                             =
| 2 +-
>  5 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/=
index.rst
> index 3c0ac08b2709..c1e73e75f551 100644
> --- a/Documentation/dev-tools/index.rst
> +++ b/Documentation/dev-tools/index.rst
> @@ -27,8 +27,6 @@ Documentation/dev-tools/testing-overview.rst
>     kmemleak
>     kcsan
>     kfence
> -   gdb-kernel-debugging
> -   kgdb
>     kselftest
>     kunit/index
>     ktap
> diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documenta=
tion/process/debugging/gdb-kernel-debugging.rst
> similarity index 100%
> rename from Documentation/dev-tools/gdb-kernel-debugging.rst
> rename to Documentation/process/debugging/gdb-kernel-debugging.rst
> diff --git a/Documentation/process/debugging/index.rst b/Documentation/pr=
ocess/debugging/index.rst
> index f6e4a00dfee3..bc4a816e3d32 100644
> --- a/Documentation/process/debugging/index.rst
> +++ b/Documentation/process/debugging/index.rst
> @@ -12,6 +12,8 @@ general guides
>
>     driver_development_debugging_guide
>     userspace_debugging_guide
> +   gdb-kernel-debugging
> +   kgdb

Should the list above be kept alphabetical. The list you removed these
entries from was _almost_ alphabetical...
