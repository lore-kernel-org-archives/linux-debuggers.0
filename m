Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793215315;
	b=QsjR2WpcJKHJ8NfAxf17dqaRfn/jnEJ4HNh9/zsgAhXJGWyzPrArWU7dg3zT33ZOP+ZG
	 jbQKvSyPkbwzWlFPiOfOjZElg4BZKE26adnNSgGpLoz+a9iXFvv1exq6rQ+orFVIQ6WrP
	 IwzueOHLeYqgQkUhe9y/mRWT4FmFoEKdlhua5YEsYqj+6QL9/KXz9xAFWryVB98eZHWrb
	 W+59N0eruV4qjNpVdm0S6vP9wNxW82X1Bs/YWxrSrBoC26bYTMW24ryYRGg2/3BLlhwkq
	 k/9QMctXUUP4K9jTqQElC0YF5UObl19TWcszUJKNr2jUSEi0+AuxvIp3KAChDnL+pQQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793215315;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=j+TdlUCeNQoTewKERKCxJZpB2yRANzghmHzUdrtmn4Q=;
	b=5VJapJNwfrV64sIojnqbSstmcrekzrZwzFrkQ1nMEn/06Tu3ZvEXy8g9prCjmAhiplYV
	 HpQE8tOpzoS6xmB/X0akckv56akgeA7NxlYsf0hbr0Lx+XLqecgQtXcNxp0W98FLcPGSw
	 ad4GxJi9A/TgK9VpB3ouK31qs9VqgIkoi7d3tmxR9A4pi8ywRPEgMgUzkc4JPsCu50yhS
	 n+KA2WQxUHwTzIKFyFcptG2hotJ2OoWXF7ZsFSzyviNU9EntEvEiJw5whDUw9AlBdga67
	 +Dy8S3V2jc2NJfQXhiFf0QdXxvaOzNxWkPHl7sqthGFDNrMVKMjH85EQdwBtYB62GEg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	dkim=pass header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rLXJ0Ovc;
	arc=none smtp.remote-ip=209.85.161.46
Received: from mail-oo1-f46.google.com (mail-oo1-f46.google.com [209.85.161.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8297606A31C
	for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 19:21:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B8297606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=rLXJ0Ovc
Received: by mail-oo1-f46.google.com with SMTP id 006d021491bc7-6f94f1b4076so94811eaf.2
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 12:21:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20260707.gappssmtp.com; s=20260707; t=1793215313; x=1793820113; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=j+TdlUCeNQoTewKERKCxJZpB2yRANzghmHzUdrtmn4Q=;
        b=rLXJ0Ovc4iujus0kkhQwXMeOW0RQfdQ+gJgYdX0uEGUg28INlMpAQV3DxyksezLKTd
         g9C1TJfDenrG5fmF4NHMHWKXqlYL4Ov1d9bVDBXsPjcC/JRKSzcSohoLqJsALoodV9la
         yy2c2pcpK5lbLQRKesrW6U0zs+XAhdhZDvnhBt5w4zIBUf6RyP8GpZkSQNXIh8g3mJLE
         6stKGW+6I7RI7LxvvPxHCR0NCMkdeIID0ekZxhCSDZzEBqhP/5Pg3tM3W2JBHEc2ENV1
         GZpLMd3R6XAVdbyYCSAnnuSWMz2Utay/OlsM/+sRBGLDtJfwnuihU7raXChcHuq0ptRE
         b7fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793215313; x=1793820113;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=j+TdlUCeNQoTewKERKCxJZpB2yRANzghmHzUdrtmn4Q=;
        b=WjtyFMHyz3R2bzMB2DQ/v16z1H0vmQrSm9bCfBmfkg/rWOwVp5e3xa8w45xVVzbBn8
         VnWEhGqKC4Kay+lOJiEK5wH9MRdLIZHf2LlIFakaWImBHrORHXo7F3hHKolvA/74/jud
         rgC7WPCPnaXt/sTJMfXt+lICo88U1GgtA7oEjZ+JjrN5KrwyhFzCVbGVP2kiQxnkQQNs
         ++TACU9UoVJh0N+zoTL6URxY6Lht3ZfesWT9scCt7TLzyLxrz74kxP9ZZ1xhTt4k4uPr
         8nK2nR1pB4bC3WfezGqF23ir8sZfTJBUwBfeFIaZ2adAia8+2N2dZMpKDlYzXuUx+8Ew
         eFTw==
X-Gm-Message-State: AFq9FYLd5Ydi6U/q5zEGbFXDjcZbFUuykZCD11tfF+FHIr0Mk94m4vby
	7vWUwBLrn2r7ai06N8mvXiV+s1sxbe/+Z2y8ygHlcdpSw1xMR4g+zSX+yVwSs60q8yPNwPOMZmb
	/RoT8
X-Gm-Gg: AYBFou0SYXcFsAEkSs45+lOugftzvfPNknS3kk/nEDbEsRwAgG9VqyYAcEza3nfGl/q
	6mpuV2Xmz6LMjcwZYHGtDBwNMwEbcqqRXQxEVqEB2bAnCggY2c4O3NaC8R1dHDJGJ1hup5ALinZ
	UaYXUiqYyAao+WsKsDFGoY6X1i20uTbSa7pAuM7wvJFrslYlxZh2y9DQmC9vJ3kKGjiheDxF90f
	SrJ4BQUdFbuwiTUj6p57QzQU8BCvteqwyovmjMOeDLo66LAUUSbg1jgqDN0yZYtoEyb42TBI1Ks
	sN1A3o9tNgqF2lInFjMxq4nOeGpnuI4M8zwTfjeshgydX9YUQle3HaJBOcNxmmzQxT6TLJdCGSL
	KwpR5NYVOWB1LaLvQhm4jot3E2/ji47JPJYNeCWUi/5JKihyO+CE7pkGO+44QX3vQfrQWX3wsPH
	xd46S01BuLp3Jg8dL1VQA/G7qDQj0ImOxPpcugfTMRt3s7yGiBoIh5Oyl9HihV4/riXN1rSV3vJ
	yKQC4vkHqVbT3XmJIeWxu1yREwiaT7z/IRF6DNcOxP2SFXslSYPTQAqwO3bHPtGmsM4p1VQjUmd
	SUtAbCakIJ6YBST1/Mi8JSLalqU4ItV6Ej4Un+pwU3jSTpbh9cX7Xztvbh4ewWHwSh9PSfW0cby
	Nrqc=
X-Received: by 2002:a05:6820:1c09:b0:6f6:5595:9170 with SMTP id 006d021491bc7-713ef631603mr2599029eaf.2.1793215313675;
        Wed, 28 Oct 2026 12:21:53 -0700 (PDT)
Received: from os-N5J97HY9XQ ([208.184.142.138])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-7142c44730dsm2117777eaf.6.2026.10.28.12.21.52
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 12:21:53 -0700 (PDT)
Date: Wed, 28 Oct 2026 12:21:52 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday,
 October 28th
Message-ID: <auJLUP2cAfjx8uIX@os-N5J97HY9XQ>
References: <auEJ6HR8g3jNLIIa@os-N5J97HY9XQ>
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <auEJ6HR8g3jNLIIa@os-N5J97HY9XQ>

On Tue, Oct 27, 2026 at 01:30:32PM -0700, Omar Sandoval wrote:
> The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
> October 28th at 11:30 AM Pacific time. This meeting is a forum to
> discuss development of Linux kernel debugging tools like drgn, crash,
> and more.
> 
> Note that the meeting will now be hosted on Google Meet.
> 
> Here is the agenda so far:
> 
> - Threat model for kernel debuggers. Philipp, Petr, and I had a
>   discussion about this at LPC that would be nice to run by everyone
>   else. I wrote a brief summary of my take in the drgn release notes:
>   https://drgn.readthedocs.io/en/latest/release_highlights/0.3.0.html#hardening
> - drgn AI contribution guidelines.
> 
> Please reply with anything else you'd like to add. As always, if you
> would like to attend, please email me offlist.
> 
> Thanks!
> Omar

Followups:

- Stephen to submit PR for something like
  drgn.Program.set_userspace_custom() to address the AArch64 PAC mask
  issue.
- Omar to add proper threat model documentation.
- Omar to add basic AI contribution guidelines to documentation.
- Alexandra to submit PR for GDB command that calls into drgn to get
  kernel stack trace from user program.
