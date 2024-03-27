Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06FDE13B59C
	for <linux-debuggers@vger.kernel.org>; Wed, 27 Mar 2024 20:10:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711570216; cv=none; b=KU+i8hqs4NTfr+zY6TjLr2WsRSS0NhM+ASWHN523ZVPY9KK+6qqVTRrr5fzdveBnpj5XKCJ3L+wxMJldodbfOA1QCMIPWgBBSqhrZjfqIp4afBlidoTyRLnnaf6D94gZ31Br6fR55ewGXno24VnTgrKiS2+OfGLInRNZzatGTSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711570216; c=relaxed/simple;
	bh=fOPcn0YOuUEgZesDLJu39LpXTzAgqmYJ3aHEz+KW/bM=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=m+lBI8deIYcCpYpIKGA3N6T6H82c69cr4qr1lWWW8FOceKNSIccNo8b8iiyQf5aHLJ7h1GKVDilEVemYl0u+WVXEmuCGTh0MK00Vd8VM1gH4Ecq+XGF6y2eohfeiivG5yvlfxWkUCqeT3KDIjGAiS8g+h4AGydf6WIGuMPOWfX8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=rtietEbt; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="rtietEbt"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-29f6f8614c8so216119a91.0
        for <linux-debuggers@vger.kernel.org>; Wed, 27 Mar 2024 13:10:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1711570213; x=1712175013; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gx0FVAQAmZsyC8WsdISdSDpD4l2Ms3y+oVbra+emJVg=;
        b=rtietEbtENAANKpUFpBJJZniIv3CpeC0D6wbZ5uJEOanHhwe52KoScAdiVr9w83XbV
         4E3fKoV+SaqK0JKalu5zvmML3Hp0lnJe44EJS6tEje31KCVd2q+ahAqsDV0lEK2Z0sU+
         N5jSZIsyDQDThrwJ/FwGD8msb8iOyXCtXVSGsAPSFCBFfTPQATNHvAk9Nmm1JVw6GXc3
         DIkZXU42r7xVouKAguXpWyIztOnrjzevkd6XqZqFQp9pNfWHsRtLx2u0pdG7vW/Fqrz5
         cUAdSfM2CzDRnKBUFQhLkLez5XCp+uXqz3PLtavFvlKadPEnDg/376lUHHQLZBefwvpP
         /gNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711570213; x=1712175013;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gx0FVAQAmZsyC8WsdISdSDpD4l2Ms3y+oVbra+emJVg=;
        b=EhQqnUGmwvd9FJMpnevvMWkl/m2EkdeabCbWwhjeoXpOnd7TwDlfkymH/6+neAot8S
         XKag9+d11MDMId2ao4T+IATxAv9NsRcNPzPe9Ujyny8UldT22VXZsyPdWIFEpivH85O7
         epXj7Zzz9mtYgeRNdNfdnzQ1FAxlFLCINT4Rp16MAg/573ngS4Dyh1w/HLs94YKWFYVC
         Md+Qwk8VAk5cMllkkeQMRYsIyj2k30+9j1jU9PuseQwgcWFVoV41bIeTeyvGwZBM1aMe
         DFuRXr7sd2dOagGOOW/abXanuNKNSGPMxyDMJkodZTRBMRQ8E+KfsCIgdxwGXzVrt622
         KtTA==
X-Gm-Message-State: AOJu0YwZLoG5y0OKX/dHY0rBx8yHsOd3dvk9ZR36U7j7vKqzqsrCR/0D
	ZiSCeXgkV2BusH0pconZ0b+GYmjbS5B/IhGT6/Ea8snrlhgLg+22AfO/QexkiErhZeW8Jx0/wSZ
	f
X-Google-Smtp-Source: AGHT+IGRLWf3vQa/aA3dK/5zPfJf1zhJl3B7TNNuj6IZc1xwLK7KridQBXz23fOF4TPqjjv5n2ELiA==
X-Received: by 2002:a17:90b:38d0:b0:2a0:3c2b:7f22 with SMTP id nn16-20020a17090b38d000b002a03c2b7f22mr748880pjb.29.1711570212818;
        Wed, 27 Mar 2024 13:10:12 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::6:42f8])
        by smtp.gmail.com with ESMTPSA id hx20-20020a17090b441400b0029c61521eb5sm1618832pjb.43.2024.03.27.13.10.11
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 13:10:12 -0700 (PDT)
Date: Wed, 27 Mar 2024 13:10:11 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, March
 27th
Message-ID: <ZgR9IxhRywJKYX3H@telecaster>
References: <ZgNQ3Q0UGRJ0oNP5@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZgNQ3Q0UGRJ0oNP5@telecaster>

On Tue, Mar 26, 2024 at 03:49:01PM -0700, Omar Sandoval wrote:
> The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
> March 27th at 11:30 AM Pacific time. This meeting is a forum to discuss
> development of Linux kernel debugging tools like drgn, crash, and more.

Meeting notes:

- We discussed whether we wanted to do another Linux kernel debugging
  microconference at Linux Plumbers Conference this year. The consensus
  was no, at least for this year -- instead, we'll do some BoFs to share
  debugging demos and tips. If we do decide we want some microconference
  discussions, we can submit them to the tracing microconference.
- Neal Gompa brought up the lack of educational content about debugging.
  This is a problem we're all acutely aware of, but many of us who are
  knowledgable enough to create such content tend to be busy developing
  the tools instead. Help is needed here.
- We discussed sframes, and particularly how to avoid distros and
  tooling stripping them, which tied into education.
- I shared that the drgn module API is nearing completion. The two
  biggest missing pieces are documentation and ELF symbol support.
  Stephen Brennan shared that he already had code for kallsyms that
  could be adapted for ELF symbols.
- Stephen Brennan discussed his latest drgn PR for DWARFless debugging:
  https://github.com/osandov/drgn/pull/388.
- We discussed replacing our Slack workspace with an open source
  alternative. With some helpful input from Neal Gompa and Jay Kamat, we
  decided that Matrix would be a good fit. Given the low traffic of our
  workspace, we will start with a single Matrix room for everyone
  (developers and users), and we can split it up as needed. I'll share
  an update on the linux-debuggers mailing list when it's set up.

See everyone next month!
