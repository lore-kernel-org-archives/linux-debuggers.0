Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.224.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795414286;
	b=ggyCYiknrXEbU2lFJH//AZXmO92ndzXmBNpsx4n4S3p4aDmNcvBXjOOxyp1er14R5Kk/
	 +4A10AK679RT/4A66ZWIxzYCct/j8XghgvZtRFhcZ+b72IoG+Koy30H4mjX0Owkc6gIF6
	 EiXwiUUGTnTnIDOMi6pFdNeZxKkCWE7e3AT0G2iVhrTEiYGnYaCb74/KSUZm5SRUpX+vY
	 i5us1ro1Z0+k2oY3bkT1VCa3Y5GVdFKcvW563J9sFWa/WB5AvsZbcQBhxacvxfaQ1C2Sk
	 fSPtNexLJvPmreXNyioI1Rm4a5x+E3r83Uo53pg2r8a8i6FeY8A+muBNpjTYaaFOoAQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795414286;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
	b=p/egfhpRdsVxBw6ZYnFLuUVhQ0q3VJdEJ2Yqv2xJdTyMkEA2H6clKetPoqKh2X2v5oht
	 3bPwqIglugoWrsrspYW287HTFFHCHJ3fpyiEF753sk6Jf1/UsnasY5M6G6GgdYU2y4mgU
	 fLlKYToEm4bK5OSy1p1PwhiF93X5E9Z5z2hXSrZN4bMqHQV9ITN4O1bLLoW5TBoI/Hmkp
	 gdVy3MlHrO5R/qQSEvvkYRbGQJOmlk0E/WWAoVFbX9EI46IckX3KwnTRFupZlAiWx9lH6
	 aKzbCJe6Jfazbo+L9zRMsU1F0VfgGJn42IMzsjMWGHJZbEAPkhx/aWZnxEQdjQQWpaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AuJUjnTC;
	arc=none smtp.remote-ip=74.125.224.43
Received: from mail-yx1-f43.google.com (mail-yx1-f43.google.com [74.125.224.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76E7E606A321
	for <linux-debuggers@vger.kernel.org>; Mon, 23 Nov 2026 06:11:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76E7E606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=AuJUjnTC
Received: by mail-yx1-f43.google.com with SMTP id 956f58d0204a3-67da564d9f2so3821803d50.1
        for <linux-debuggers@vger.kernel.org>; Sun, 22 Nov 2026 22:11:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795414285; x=1796019085; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
        b=AuJUjnTCDQjW0sRwRqkQGsiRz50XnJQVN/9h3eRtAnqxV0IaqTgeMpJuWE3mreXHZ0
         u2Dw7h3nBX3Ar9XXtj4bp43M36cLvvdQYcjsAAxJFTaMuMtU3M4puk/LB+8kTFQZupyX
         eyIfE+2JhjPpcsCBYSMq4yMW+VCdu3YJiCIcc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795414285; x=1796019085;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GwvMLEpH06q7oweFh5LKZ8RQkrZMsU7+3f+WbZdQx1g=;
        b=mmheIsFYgHbisNDpnyWZhvzoNA3sX+GRgz5D7WSJ9wIxBD+EHQQc/vtOM1AD2ZzDZZ
         tX96Zs8IAC9IuHi653JnGvVoYlwgdLNdKU8BxyB89P0qGqGonwQVsgaC4+YEckbKCeNs
         TrVSsFs6dLcvL2ldVMsK+a0Cr8ndC8t6C1PkHrVGlq48AlyJNb/FWV6rHySHMbC7OIcN
         jmPDEWDujEg2QhhNFKPaC0UPD580psvZFoBx3f1/HyceNoQfToRN8kV4sDH08c53/x30
         c3Lnsnqk27DxVLi3O2KJ6H7CAynmB7JmoIgiP5qXT3eKPr8P4W6GPoYyHmBE31G9CRKi
         lBEg==
X-Forwarded-Encrypted: i=1; AL+hErH5bX/sHQlP7zVRI8ZxQbCFaJkYPFnyeLTAMvRr7HbbCWYDh6Bmg3iiTejUbQBWEDjG8Fk9KUuPZU/9umqOizE=@vger.kernel.org
X-Gm-Message-State: APuU4Z96CrF9mS5zFxapwd+FQmyS64pcIUwrsvVhpOj1ppdZJdW54pOU
	A/KWN9EYYGqnOXcRiQrtlqLpfZuh8C8qxXSpBmospJJnbzg+3ZkHUSXZND6uXfbE3KQ=
X-Gm-Gg: AZFdTZfrZgxM4ejrXVh2nM3ak3pi8wuOdoAgQ8GYh5TNFob5HttE8cGYC74wFVa/roq
	9Uccqr33JGkBE+NB9FOYuvi0D7fGcO6yWBOQXz6fmhuUKeobKBf1R3z8JGV4rpO3+YY2HdcezEL
	xLHgq0AeFDrf0ZpIwk1pdjL+nF2RMtGXoeySqTxStiPJ3kNULLfalR4Xqm5wzughpJa5hhiNVY5
	eFYj9nZ4ptZHC8NQv2ET2evaQTDmCj9icIXD+NByKlnspMjpXAbfemw/yYwI24pdHIDMpathy1r
	b3xoS3BDcQZgd8WlnihqFfWD1VIYOKyMUUQ1IjImBaiwILe3KrbkPHOw8G0ByUILkcuEmCzVG5e
	Fzgbgvok3Cw7X9A9GCkB8KV81WD+TaJnI0ta63QlDdFGhG8xzRN/muD8/WZj9GF++IPq37yPtxx
	Ni/YZREhUVv5waHjFiQYnSsVhwyjxaOceI1XDANpqj9BebSktwMp9Ymg97suUL0fGSy7ux1B2ws
	vV0/6FJu3sgrXfpgqhoISPHO+ccUqZiXSBuFPMzIIKTjREj4BiJrOeMjG5DoGsuaTdj/r/onE1P
	H4BhfWjK8VoBSTqioGDIJ1QW/AvlRspavcdOGt+QZCkSkaK0NKLIQbBbrSxsrVoPJ5K9tqV8QuS
	B3YSx5rhfAiwqyOIeAsRBrb/XT85g6lKrxFPJEf1NjIXz3zs1l4QFIoRW7tjbyVzgDIG+NUwCWO
	TBUPYq1dSBC5Djk5iRHspL94jHBOPMJz2snywUMD5QNloTv4C3vmjZls7Z9BbGZZDKoG2jYErKt
	OrqA9zQ6IvOCcq+oXBfKta1qCJYxgKomXlcofJ+IU3D
X-Received: by 2002:a05:690e:4012:b0:67d:c046:4f71 with SMTP id 956f58d0204a3-67df43d2bb2mr4679580d50.23.1795414285477;
        Sun, 22 Nov 2026 22:11:25 -0800 (PST)
Received: from [172.20.0.3] (static-host-74-205-137-217.epbinternet.com. [74.205.137.217])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202bc515sm43136087b3.19.2026.11.22.22.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 22:11:24 -0800 (PST)
Date: Sun, 22 Nov 2026 22:11:21 -0800
From: Chris Down <chris@chrisdown.name>
To: Christian Brauner <brauner@kernel.org>
Cc: Omar Sandoval <osandov@osandov.com>,
	Andrew Morton <akpm@linux-foundation.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v3] proc/kcore: allow disabling /proc/kcore at boot
In-Reply-To: <20261118-masken-disput-miesmacher-27d6baaae6a8@brauner>
References: <7c10f2e01b6f19229c83e81d887a87f5d1151841.1794904698.git.chris@chrisdown.name>
	<20261118-masken-disput-miesmacher-27d6baaae6a8@brauner>
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <awPZCeNqLKVpnbKj@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Christian,

Thanks for picking this up!

Christian Brauner writes:
>Iow, it would be nicer if someone took the time and came up with some
>boot setting that is a list of memory protection settings instead of
>spraying ever more kernel command line switches that nobody can
>reasonably remember or use.

Hmm, I agree that would be nicer, but I don't see a good way to do it. How
would you suggest going about it?

In my mind, the model one would have for a list like that is mitigations=,
but it didn't replace the specific switches, right? For example, retbleed=
and mds= have nevertheless stayed. In that case, the list sets their
defaults, but more specific switches win out over it.

These are the problems I see with a list like that:

1. I don't know where the list would live. A list of memory protection
    settings in procfs would cover two switches today (that is, kcore= and
    proc_mem.force_override=). Anything wider crosses into mm and security
    (I have similar switches out for slab hardening and mseal, for example),
    and it isn't clear to me who would own that or decide what goes on it.

2. Lockdown already has a list of what gives access to kernel memory,
    with entries for /proc/kcore, /dev/mem, kprobes and so on (although
    not for FOLL_FORCE), but lockdown= only takes the two levels.
    Selecting individual entries was proposed last year, and the lockdown
    maintainers turned it down because most entries can be bypassed when
    they are used on their own [1]. So a wider list would have to be a
    second one next to lockdown's.

Did you have something specific in mind in terms of a design and what it
would encompass?

Chris

[1] https://lore.kernel.org/r/2vldrnqs6fbljqqp6vbwmkushx6dxcpephgb6svmu5i64lijpy@lg37aflddv3b
