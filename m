Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793295498;
	b=Q9isstwtr6a6YOirdIDTgEzNHbbXh4WExoeA4GJimNx/bSAQFWH/4Rsg4f62ObV7olfQ
	 vx+DjhHqsaG5E938w9Wgqk97LM3Oki9VEG5tvO05OyDAtkO3OJEFkZpXH49fPY9rgTJAI
	 747Nxd5YJ2tJx7J9CSwkibq6kJkQ29dSJKODzZeUkVPuXnCXTlcBHKkOUn4wc/51tF7CL
	 U4I04qX+Xn0wZnrn9/+qEQGOaNihuMRxAOLwHcyINw7071M0nqwNwcR0povuqCdyQFnlU
	 IJ1HJmfXIiAevI/HzvAKFldHOuHX/hZPWLS2BmWCxHSBH5xBW/52wBDJ+BBJSuhdrGg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793295498;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:User-Agent;
	bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
	b=nSTyH12Dnsjg6MIvGt17VY0xJBDp7X1kAbzU7XIJKub/jE/j0f7WSWLgmTx7F0nn60Ru
	 ULtMcar1fGm/ikwjdzDvBRAdWZR9cYHNmj6IiaGaCbrt4usz76c7yL581tbrk1BKur4MI
	 hbH+SuXJsmaevoSPCaqbUEFV8JOJwEU3rdARACSur/nrc6SqT6+aWNn5uq9SMzGfOW6cB
	 6wE19Q2QzXdzbgP7dzqg5/NgYVDlhOH6xf/I9VoSwK0jkQx31aLjY+1qgtAB+Rp6eD6xy
	 zRO5q/NfH42elFQ3t/D950tN2wOddWiNQArddkErGQ2hyN3YkBT5/HIaqN+p6bHyAPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=F0yCYTRH;
	arc=none smtp.remote-ip=209.85.210.178
Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CAE8606A31A
	for <linux-debuggers@vger.kernel.org>; Thu, 29 Oct 2026 17:38:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5CAE8606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=F0yCYTRH
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-8a05e3f0d23so1385923b3a.0
        for <linux-debuggers@vger.kernel.org>; Thu, 29 Oct 2026 10:38:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793295498; x=1793900298; darn=vger.kernel.org;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
        b=F0yCYTRH1KCKgj1wamQyvj2+BZVTNOuWxMJPDP0xqDm8z2AXasRhnLVIjfTJB+urOA
         hYMOTEHqguCWwBanaJwRqINoqTBckwHx8a2498qdICI+n/lBDqGMFaBGSnDJTcqrlXwJ
         6N3EVeIucQlMqzblx8dYqq1ROCDLze9gT6aRY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793295498; x=1793900298;
        h=user-agent:in-reply-to:content-disposition:content-type
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+xEi/FXjAcaiOhZWzJNypC4CeC4XPVjT5VrS5d9n3Bw=;
        b=Tzo3e2zBz9iQim3sxRBPHvL1o5MU64hSGXlSPiFPKwlJ4+TJyiIRKJAH8aEx5uxt/t
         WPvjIzFWC7QfoJfFWy6RxBeD0T0MHuu/PMeXyNwTMFF1bMpdIZv0JN8XpdyeRlztqJT7
         u4Wyq/isVV5IA123loDBVOcb7n8vON7H2Icx6eynm0EVKZdWYdNCmvYtJ6FcYmofPFE8
         gLM+IJL/5Z8dxESV795z2p/32Pj3YjulEj+OmtZtopVRv2RwLP4nn4EmRaF57fzW6hZX
         ruRF+VFvwRefuM6waRC43CW4xvrb7qT+0r9nGYeVl1va7bOm0fQnT4Pums8p+xRqstfT
         1/jQ==
X-Forwarded-Encrypted: i=1; AKwUvBy01WNc2ulyZ657tBEj5locc+WWi+8EA5hLToURx/k9zcqZo4i+G5WoWFt0bhemyzgOjfWkapVJV9hxfBTTlK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYItwzpOXocOQ8hMiCt1W/tNn+mkOCv12u6fQuQiiQbzRKS5CpW7
	HyYpA8s+CXMc/5yChz11fYMvjprerO2a27wZLQ9fI4p4EE0ZyBKx0BCYXu12lMHyqc4=
X-Gm-Gg: AYBFou34qfRpqyTJ35rAkAlJirokbxCzW+di+6Wc5MvybACPk5+NVQp/HkzOZppo/s1
	fLh8YxkOVoYP6Sn5yZKwB9na5h24myH4v7RIurcFTbk9/DvEkyRlrNQZR2zR0Csafere8x2hel7
	IElhRvKE+ydthXKIQLoWAz394n0QDaaac+tuYRhuT0eNv9TKqxm/NJF4UegnY+wgrxhCXuGJup3
	CfjiCQqL5bf7MZdrEEG2RSFoye5VIjSVnQX2Rj2kKWf3Cf/I6BFgnUOQiOGCcIZZMO2cf6ovwB9
	nwyukmGiYfxluPav+ipqSRZQdTe66COONNnJPPiSn4w7kXKhvJvl+llWfjfkAaVKpIngn1ve8y6
	4te6qJxKt2hPDpk8WqV/y8ncyrClth1huZmFxqKRHPyq9wjCEtwxicdZJoAWn95tqhBdg1jHNpY
	Xf5vKrEcATsPo3TMRok7Ylg53uPYWVgNi2svwgig6A9f+TKUb81gwBuURv0MJQznkWReoZZLDL/
	t5WR2u/xA3xYIXeKA0XqgBaJx4gLgbDW+tg7Q4LqUw9aiTrEpW+c4ykt1x91P8+bH9Vs3G+0chi
	f6JAcs31h2PJH9vQJ3B+hCXvERPg9p1Q+AUH6ZOKsnKIpAO/XI32OW5TKb6CEB6PYEQuX4UXozc
	zJb+7v0p+9y6AfL/nz3tdwEHAJUbi85k2t3/97g/jyuTNm1iN7NcUsVctkh2ijm4QPyU2Dyfm
X-Received: by 2002:a17:90b:1d44:b0:3a7:250:333e with SMTP id 98e67ed59e1d1-3ae57f631f6mr4570721a91.11.1793295497657;
        Thu, 29 Oct 2026 10:38:17 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae6e8fb1ddsm5096378a91.5.2026.10.29.10.38.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 10:38:16 -0700 (PDT)
Date: Fri, 30 Oct 2026 01:38:13 +0800
From: Chris Down <chris@chrisdown.name>
To: Omar Sandoval <osandov@osandov.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auOEhTNaKzu8dgEy@chrisdown.name>
References: <auAmuqZyUodq3iqk@chrisdown.name>
 <auKKisespDm1xLLg@os-N5J97HY9XQ>
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <auKKisespDm1xLLg@os-N5J97HY9XQ>
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

Hi Omar,

Thanks for taking a look!

Omar Sandoval writes:
>The code looks correct, but is there a reason that /proc/kcore
>(CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
>memory (e.g., CAP_BPF + CAP_PERFMON)?

Not in terms of what it can read, indeed. I would say the distinction is more 
about who needs each capability and what we can remove.

Abstractly speaking CAP_SYS_RAWIO may be needed for hardware access without 
necessarily wanting to grant general RAM access. STRICT_DEVMEM already makes 
that possible for /dev/mem, but /proc/kcore gives the same capability to do 
general purpose RAM reading anyway.

In our case in particular, a process with CAP_SYS_RAWIO doesn't necessarily 
have CAP_BPF and CAP_PERFMON, so keeping BPF available doesn't make removing 
kcore redundant.  On the hosts in question, BPF tracing and BPF LSM are part of 
the monitoring and sandboxing we rely on, so we can't remove it from the kernel 
entirely, but we nevertheless keep CAP_BPF and CAP_PERFMON away from guest 
facing processes. Nothing on those host uses /proc/kcore, so we remove it as 
one more gap to close.

For that reason those hosts already run with CONFIG_PROC_KCORE=n, while other 
hosts keep kcore to aid debugging, since they have a different threat model.  
This patch, then, lets us preserve those choices while using the same kernel 
image.

In retrospect I should have explained that better in the commit message :-) I 
can update it for v2. Does that make more sense? Let me know if I can clarify 
further.

Thanks!
