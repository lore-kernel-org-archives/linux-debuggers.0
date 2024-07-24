Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E10F13A24D
	for <linux-debuggers@vger.kernel.org>; Wed, 24 Jul 2024 22:20:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721859637; cv=none; b=ucF+fQJbafF3dOE20DqIq3MRVRt6hRJ4wV7v4rBAjKTSAGNm9vZZhQQ8UgmohnG+RHgYwWFJhJKVWy6PWDG2hF63WzicuTDGLe7dHSK5V4rq+kRlhZnzbZcizUxrcX1YX8Fms4RZ8OYI4+dgK6AsJpwp1uESOht1TD4SU4tn7bk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721859637; c=relaxed/simple;
	bh=zzNqmg/F5pt5jbnJ3mF8u/0bs2z+LKaNx6f4QCMALsE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nxj2FxHd+RchQQ6iK7IZ9Tp/IYCypyZJQ2jor/G1euNXpj8UrnG90rEpviDuV6TOJgCX/nITt9/YRKMVOm7ygGg7Zn6FQMi+AvyRi1pZaJRNd2TFwssnWXbtv/tO2/8l9YSM2tZop1UdP8IcIx0Jc+vX/7W/8KRqgJp6dI/hp2k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=I0OPNnd2; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="I0OPNnd2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721859635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PhzfQ9NZNO2IgnFnrcRvAFTtmO2px1Gh7Bc+qiy4lLg=;
	b=I0OPNnd2rSL915c9qgRaizDf9xzqgHzLSvCbueViRQetWtEAateVPVSUkLYu3JKsJbuVKr
	NCUDg6OVp8xVS2zd40NCk9edfvnV0C536t9BYLix/BTbdjYErFwXzC8ECySij4Qh0oTryL
	oQV5LEIdpe/4DJHH5VC4XiTNTuo5cVo=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-225-tjLYs4h0OVu2Wc2CZtCH3g-1; Wed, 24 Jul 2024 18:20:33 -0400
X-MC-Unique: tjLYs4h0OVu2Wc2CZtCH3g-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-397052a7bcbso2578565ab.2
        for <linux-debuggers@vger.kernel.org>; Wed, 24 Jul 2024 15:20:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721859633; x=1722464433;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PhzfQ9NZNO2IgnFnrcRvAFTtmO2px1Gh7Bc+qiy4lLg=;
        b=YaxMqWHmSqeqt7mG9/TxkT3/8cETpU/Ve3NaBJygAeLqBu6gdIyUtki9YqZhzwpfsU
         Vq+8BX63R+LiiJQ3ko6ouqjCv6rZ+yT9GqAt/rserSVoVi3qyNzbXjMXV7gJ5reyYT0y
         aabNbWdgeDOYqDxksYJ8jX76Ok1aacfdNFskYFDdzNJ0UG9rk4tTWWXd3JVEd6bXCOP6
         XPU6YUPGd/oR69Lb/Cuk/gqgPemKlEgFtv79M/0pDXNRhLVIj8wpxDBaX4yWdgVY4hSh
         OgaWvGuJJajddREtTg8oNrheoQavFw+KPIhNB5td36+AtGj5VVhs7KwR3vBoUNCE2b6p
         YWCg==
X-Forwarded-Encrypted: i=1; AJvYcCWAVRkuIAmAsLpVNy8mJngXSqu6MGyZI/8M1/8LWlSv50n4uZuBKz3bOscA0lx3Ep2t7w/C8ooEQXeXQOMVvO4y+uq6/tmqN2RqdnK4PCLK
X-Gm-Message-State: AOJu0YyRXBzmwd/TKpQmdgGojavvUqFd5vMc7NJUxfFM9gYZxtN8lppI
	FslDfNbpwgjPX79IKOwTFa2In+RQ7defEBghdl6SHnAMhaYE24XWGPDMl6tELXRpR+P3uWLreRt
	1kJmVqjy7UJjRQJB+ZOjUq01v5bgyOzpoLbS0xoB/QNvcYh1NSa8QLaw/8Yee2IYpEYHmnS2EWY
	QiOQ8aQit+bhCFGAmcl8yos1D3C7Cd0igxDfM3/a1m/Camsm0=
X-Received: by 2002:a92:c561:0:b0:380:f340:ad66 with SMTP id e9e14a558f8ab-39a2185cc91mr12659825ab.26.1721859632735;
        Wed, 24 Jul 2024 15:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHke/dak6/nbM4NXyLIbA8jjz9YIm4sOE/lNS/xkHRvIJ7bY7iKcz/Dwg4XRBVk0bxfesqX2k/ZSLwx/WKodWQ=
X-Received: by 2002:a92:c561:0:b0:380:f340:ad66 with SMTP id
 e9e14a558f8ab-39a2185cc91mr12659625ab.26.1721859632427; Wed, 24 Jul 2024
 15:20:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1721773977.git.osandov@fb.com>
In-Reply-To: <cover.1721773977.git.osandov@fb.com>
From: Aaron Merey <amerey@redhat.com>
Date: Wed, 24 Jul 2024 18:20:21 -0400
Message-ID: <CAJDtP-SRdXuBkGaswrNXhyb5HhOWE5Fty2WBJJdmhTSfOpFhEQ@mail.gmail.com>
Subject: Re: [PATCH v5 0/7] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
To: Omar Sandoval <osandov@osandov.com>
Cc: elfutils-devel@sourceware.org, "Frank Ch . Eigler" <fche@redhat.com>, 
	linux-debuggers@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 23, 2024 at 6:40=E2=80=AFPM Omar Sandoval <osandov@osandov.com>=
 wrote:
>
> From: Omar Sandoval <osandov@fb.com>
>
> This is v4 of my patch series optimizing debuginfod for kernel
> debuginfo.  v1 is here [1], v2 is here [2], v3 is here [3], v4 is here
> [4].  The only change from v4 in this version is adding --fdcache-mbs
> and --fdcache-mintmp to the new test to fix some sporadic test failures.
> Hopefully this version finally gets a clean test run.

Thanks Omar. I've gone ahead and merged these patches.

Aaron

