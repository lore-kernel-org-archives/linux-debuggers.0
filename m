Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com [209.85.167.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8D2B10F7
	for <linux-debuggers@vger.kernel.org>; Fri, 13 Dec 2024 00:55:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734051359; cv=none; b=mxaMW/7bqkZlA+JUgV2GW+r0pbAUi9IMUznQo1ztrYvcsJSnkPHCVKAeTmbBS6cSM3NhfeWEhytfF73L4paZzk2RXSFscU3mMGGIf8dOyjlg1HcKJx51ApwJ1XS5YggPsUTCwjdQYRZLJWvrUc9pGpkp9qaExhCbhF7RyW63phA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734051359; c=relaxed/simple;
	bh=kVwcluLE032tqgMZ5HCmVVcG1bXOZ5sD+ANaaaLviWI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mFnXDA7TDdaKql/vso6hOkvzVgBxUysqFC0267x8sxHKSUgUfjnJklGEwXze1o7N9tE/bpQqmYbI0MK36UxktQRt6LudvvgKoaAJqxZRCFGCU8qF+IP7T8eL2kwxvBkwdPDe85Z89OZt85w2D7qiRWLpBavJlWvsYHUlwGtaQIg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=WQWQCm8v; arc=none smtp.client-ip=209.85.167.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="WQWQCm8v"
Received: by mail-lf1-f53.google.com with SMTP id 2adb3069b0e04-540254357c8so1136022e87.1
        for <linux-debuggers@vger.kernel.org>; Thu, 12 Dec 2024 16:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1734051356; x=1734656156; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fXGrN9zDEEsnJysMYit4acN2irkFENJw6tU7ppFprrw=;
        b=WQWQCm8vRHaTwSkCaa1iVO5UwMe5dBGgbqw+F3iJIMPiCcqHOFuNrVby7yVJzq3ysf
         EUtrMsOLt56tP+yd7arDn4/Bea1rrWZhMGoUFZVJRbfyyZbRYZDObKvjq5cOcyZ3UQaj
         ilRqXrLCMcU10AZ1QXmC7ZdZOioHD91prQFNs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734051356; x=1734656156;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fXGrN9zDEEsnJysMYit4acN2irkFENJw6tU7ppFprrw=;
        b=bdHYO4y0kjYXhQKBD76YhAFQ6dfwdc5p0oIOhTkkyYBUXEQimABZb8gT9GgOEwkI7k
         k9ApIZ5LUPNjm6dBNgIGG41M7BgS0xFfgA2LEmHPGB/6/v7+G//Om4n0WLsZB164x9xi
         DNXvyOD9GS3VHgM7ZaIpoxaVDerbkjxYZmNbycbt0vxm77Up5mprE/W+0eJjF1TA1BdV
         cf/fuUey/8OqeQnIFAWBhPu3Uckn9uLTTC+hXxniDMBJ1OnoYonCErJIFUDryn2rRvxG
         C5/x5PzP0rT9zvMrPmo52FWn3xqstM3XJ4WRMFudQItRgZ4Ongieun5/qmputMrem/Ze
         QubA==
X-Forwarded-Encrypted: i=1; AJvYcCWwXfBf9oK4hBrrGMyYHF+X5wejo644SG7FSQXhe9QCQu+hxwjkYKS71TtYWf7ihp5mDHZVrzI+b3g8O2OA1To=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw5VEMLQRXddE58xs2xSBKnItEn39GoaPS19jLKUhipXI4BAlSK
	TwexcJt9ve813Gm82V6ALGTpH+MR7tE5t81a6zKEZEhD0ctwCY9c2qztvsJ273FUYQGWoERhkpS
	G8g==
X-Gm-Gg: ASbGncuHQYL6XgcJQ55317+L2lDpKP5dC37mEAHtQbQuAVYm3/sBKBbraTqrHxdGxmi
	HGryWGMBEMMW2f8ujnr/dg5i2QH58s5/qs6aAoBAzlv/ROcQfXwWoimUK/87rTB7hUo7BcbwTzv
	vbzZ+Z6dOkcIsK1kjaVdAbkHp9mALkjNbJKlxf83UHjqKhSvFPv78T+qmHJXjDunapJH/zr4m9h
	Jq4CIsZdv4nhD93JD4P0HXXI7hCDl5QoMOyqrnwPNIAi4clIyt/3eu1A9rnXZI4VP6icEUpVW7G
	Gq9iehqUxvYb4PsTCOnc
X-Google-Smtp-Source: AGHT+IEKRnhAB2oIYI+ScT54YU0+PsN0u4/OeC64a25PG8AXEMxEfQpx3Wz4WhtKifBKLlrG0t5ckQ==
X-Received: by 2002:a05:6512:1092:b0:53e:395c:688d with SMTP id 2adb3069b0e04-540917cb6c4mr120865e87.43.1734051350734;
        Thu, 12 Dec 2024 16:55:50 -0800 (PST)
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com. [209.85.167.44])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53e38e08361sm2041894e87.23.2024.12.12.16.55.49
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 12 Dec 2024 16:55:49 -0800 (PST)
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54024ecc33dso1403701e87.0
        for <linux-debuggers@vger.kernel.org>; Thu, 12 Dec 2024 16:55:49 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVR00RXoszlHA9PmZYsSyRb4A9mPZkAta6rFL1M3Ra97eqD4EdRk9ZVaxGZaBqmCHlb8Gzte+PbKVGkgHTFowQ=@vger.kernel.org
X-Received: by 2002:a05:6512:3a88:b0:540:1dca:52bd with SMTP id
 2adb3069b0e04-540905680c2mr99501e87.29.1734051349295; Thu, 12 Dec 2024
 16:55:49 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241211153955.33518-1-tjarlama@gmail.com> <20241211153955.33518-3-tjarlama@gmail.com>
In-Reply-To: <20241211153955.33518-3-tjarlama@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 12 Dec 2024 16:55:37 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XZA-16JJU-CZGBtqZnQNhZ3Uv29VUdPhbDp1x2Mforcw@mail.gmail.com>
X-Gm-Features: AbW1kvbUF595ctLi_r_y4OzGLCoepX601ov6HOKOsSq80mpxxsyGl0fjgF1PuZs
Message-ID: <CAD=FV=XZA-16JJU-CZGBtqZnQNhZ3Uv29VUdPhbDp1x2Mforcw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] serial: Move LF -> CRLF replacement from serial
 console to kdb
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
> The current implementation of `poll_put_char` in the serial console drive=
r
> performs LF -> CRLF replacement, which can corrupt binary data. Since kdb
> is the only user of `poll_put_char`, this patch moves the LF -> CRLF
> replacement logic to kdb.
>
> Link: https://lore.kernel.org/linux-debuggers/Zy093jVKPs9gSVx2@telecaster=
/
>
> Signed-off-by: Amal Raj T <amalrajt@meta.com>
> ---
>  drivers/tty/serial/serial_core.c | 2 --
>  kernel/debug/kdb/kdb_io.c        | 2 ++
>  2 files changed, 2 insertions(+), 2 deletions(-)

Looks reasonable. If someone comes out of the woodwork and says that
this breaks them then we can try to figure out a solution as talked
about previously [1]. It would be nice to include a link to the
previous conversation in your comment message...

With the reference to the previous conversation:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

[1] https://lore.kernel.org/r/20241115144933.GB4408@aspen.lan
