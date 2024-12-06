Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com [209.85.167.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217A4148832
	for <linux-debuggers@vger.kernel.org>; Fri,  6 Dec 2024 15:27:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733498829; cv=none; b=dA627sdcYsHdW0GjiDLFlK7lkEnOSgLvS76VFTaiQevGSFnKwjPi+g/wG5TUXtvUVtuKo5ooSy0XrcjMmXEM3J8b7+cgEA9XrrMCWGO2AIOghC0dE/L0pIARbh9hWjykFUr4o2dmAH2x+GpOZJpLg/IIoJcqd94S0B9q/9uBjRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733498829; c=relaxed/simple;
	bh=DZ4iBJ/iWM8KSa7H29avWC680AIZt2rf5AWA6M/3SAs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Umaq3skmvVYTMAVC0ybcwsSArQoKGEUfPwYWR+1BHm6HNeiGRJIZw6ouiqU+nG2ZpBiprq7QzVf3JfOWOr6Wq/VJV9lBdWFJGnkDIcz/+vftXLCR+3TdZZzQAsPUly6Y8Wm5yrgZ8UMnrlGUDaNlJmzdERlU46E7R4fQAGGOIik=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=lWc1IZGV; arc=none smtp.client-ip=209.85.167.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="lWc1IZGV"
Received: by mail-lf1-f48.google.com with SMTP id 2adb3069b0e04-53de880c77eso2310424e87.1
        for <linux-debuggers@vger.kernel.org>; Fri, 06 Dec 2024 07:27:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1733498823; x=1734103623; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=;
        b=lWc1IZGVzgOULjBdDUf0VtaAnKBv0FVAimNIfEeHXlM2QTWDx2jh6GPeqb0pXGqnfv
         xh6ReG38HIO5eZf3Yp6EncXUJEBwcu3jKSiuirc7LRnqmeJ9F9k2W5MejbCY9ETw1i1Z
         52yzARay2ZoyTNtsbHW/ZGDChD5OxraA+1o/s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733498823; x=1734103623;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tZUn4bZBalbJgAp7xW/bITYcNU46rh/GtC4lpWqRHs4=;
        b=NO6/2uiuuYyp0lr4s7/G7PbDsD1zzc8aFLgM4rUMWBrGxzt1GpLzRVoIy0WSeIhQTs
         SJxkHl+sd8ukO/YECUPCWRqvubAZVur1Rkg4Gg6oDkUPt0XWi+bupzvL6poY/3HmN+er
         igWRcLSV1UEUGi52g3Aok6NJduNR0cAhGcxTzRGTrvRM9WN5qmS2t+A8bhgVHwmimHDK
         0WWMUsRBcBgVposh0Tb/7ygAdrxclbdeGakwrMItJ6Wmo59UpdW86qdMo4cfVdjvNXnb
         jOijaOnWWELeUbg64r2hg2avD0oh2idMFOKpvTzFvZpKVHkcg8yqkJUQRypc0hHdAKiU
         /y9g==
X-Forwarded-Encrypted: i=1; AJvYcCWC9Lc+a3QyaTaFDiDC6mHyBqzG4luJ8fkQT3D8SsRtWThnQK+mJsEwEfCHSe2KpkzfW/aYj1nk+okXb0jDR5k=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRJDCihlsnE7R5tP3/SWrbGuuoEQFiRq5hX1Dxz3SDPyyzTs2e
	lc8QzDSqqLtwAF3mDjWZj+35y44tN2cIfrIm7S1qUKjTd0dRQvHCSVDUwpvR+eh51Gdd+iSISMg
	M2w==
X-Gm-Gg: ASbGncuBN9cOhQDp1m2VpqsSFhKnDDrlB2/W4LeM/DwEkjgiZ8g9HNI3+D+sluFh7+/
	EqfkXJHaWBl2OYp1rCOvH/oMuiMsLDFDw1qwwo4iWOfijo4ak8Ov3NZNFWL11GnFiyJDNcWTFe7
	FYmTzaXk9rhmrxaL2cBlxtT+OQr4zoneHSJJ5mFfoZkg1RweFdkg2tx2sgwWht5QApxyrkvSOC7
	bfnfKVL3XnuO5phWQd4clySZL3Lxqa+ujD8tWnUN9fdutlfGiz+9K2g+j5IQliUQY887DhLv2tw
	/dwfql7pXrBRHm5d7A==
X-Google-Smtp-Source: AGHT+IGDHbnMTN6fw/6Ixg3YGLyK7NNfPCqBNJY9vHiKxgiumaaoGXgxvdCMRcec5EXIyBFxtRMEUA==
X-Received: by 2002:a05:6512:39c8:b0:53e:38c3:5f7e with SMTP id 2adb3069b0e04-53e38c362b3mr306934e87.45.1733498823458;
        Fri, 06 Dec 2024 07:27:03 -0800 (PST)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com. [209.85.208.179])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e229ba5a4sm532578e87.150.2024.12.06.07.27.02
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Dec 2024 07:27:02 -0800 (PST)
Received: by mail-lj1-f179.google.com with SMTP id 38308e7fff4ca-3001e7d41c5so18728611fa.2
        for <linux-debuggers@vger.kernel.org>; Fri, 06 Dec 2024 07:27:02 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVW0TIvHyls9lVXgebyPYkfmsvV5RMdDkFqHohzxD45Kc3Opn/od4VSmny4ghBvmYDeg/8FNgD2t1fPf2fXOiM=@vger.kernel.org
X-Received: by 2002:a05:651c:2119:b0:300:18ed:4313 with SMTP id
 38308e7fff4ca-3002f8bd5ecmr10190331fa.9.1733498821759; Fri, 06 Dec 2024
 07:27:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241206003100.38142-1-rdunlap@infradead.org>
In-Reply-To: <20241206003100.38142-1-rdunlap@infradead.org>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 6 Dec 2024 07:26:50 -0800
X-Gmail-Original-Message-ID: <CAD=FV=WzC=AA7MVX_qN1fsPL3Y8JA__0_cL5UWGoea0kJj5PVQ@mail.gmail.com>
Message-ID: <CAD=FV=WzC=AA7MVX_qN1fsPL3Y8JA__0_cL5UWGoea0kJj5PVQ@mail.gmail.com>
Subject: Re: [PATCH v2] Documentation: move dev-tools debugging files to process/debugging/
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-doc@vger.kernel.org, 
	Sebastian Fricke <sebastian.fricke@collabora.com>, Jonathan Corbet <corbet@lwn.net>, 
	workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>, 
	Daniel Thompson <danielt@kernel.org>, linux-debuggers@vger.kernel.org, 
	kgdb-bugreport@lists.sourceforge.net, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <siyanteng@loongson.cn>, Hu Haowen <2023002089@link.tyut.edu.cn>, 
	Andrew Morton <akpm@linux-foundation.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	linux-serial@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Dec 5, 2024 at 4:31=E2=80=AFPM Randy Dunlap <rdunlap@infradead.org>=
 wrote:
>
> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Adjust files that refer to these moved files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Note: translations are not updated.
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
> Cc: Doug Anderson <dianders@chromium.org>
> Cc: Alex Shi <alexs@kernel.org>
> Cc: Yanteng Si <siyanteng@loongson.cn>
> Cc: Hu Haowen <2023002089@link.tyut.edu.cn>
> Cc: Andrew Morton <akpm@linux-foundation.org>
> Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
> Cc: linux-serial@vger.kernel.org
> ---
> v2: Make process/debugging/index alpha by filename.
>     Update references to the moved files.
>
>  Documentation/admin-guide/README.rst                                  | =
4 ++--
>  Documentation/dev-tools/index.rst                                     | =
2 --
>  .../{dev-tools =3D> process/debugging}/gdb-kernel-debugging.rst         =
| 0
>  Documentation/process/debugging/index.rst                             | =
2 ++
>  Documentation/{dev-tools =3D> process/debugging}/kgdb.rst               =
| 0
>  MAINTAINERS                                                           | =
2 +-
>  include/linux/tty_driver.h                                            | =
2 +-
>  lib/Kconfig.debug                                                     | =
2 +-
>  lib/Kconfig.kgdb                                                      | =
2 +-
>  9 files changed, 8 insertions(+), 8 deletions(-)

Reviewed-by: Douglas Anderson <dianders@chromium.org>
