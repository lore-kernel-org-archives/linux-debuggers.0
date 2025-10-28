Received: from butterfly.birch.relay.mailchannels.net (butterfly.birch.relay.mailchannels.net [23.83.209.27])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D9F434F46F
	for <linux-debuggers@vger.kernel.org>; Tue, 28 Oct 2025 19:06:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.27
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761678373; cv=pass; b=DgYj25GgyTEO3lVENhMjrnP8EwKY5aIYl/eL1FXMl8xzHNgNwHIbd0cwaSJLDr14pcLKywFj3ScRS7lmIAp7xP99NNU9CHiMFqLZDagccZkxTqovmNFLh2uvP+TFjqFg3nZsDg/KSgRETaCGiOY7/pqrsId8JD8ey1SkuBjvpwQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761678373; c=relaxed/simple;
	bh=PJ7kPZwFSkxdAaoiqBB3V0crQXB0aDVOcN55il3dPxk=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=ZQ8U2h6c306LIMBJXaYBAf51DxoI4/n87faHgdubeY0A7yrfluoKv4M1Sc97swGDzQnypiWgRWr1a7QW/q+DpKtBhUKDXA0LWWrU51abiBMmuBYiy5radZPAtzyFVEZFD9K5xxHP/SdtGo41sAT5S1ZsyqKHoVyZO8L2YBTQoQQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=hAAyE9YZ; arc=pass smtp.client-ip=23.83.209.27
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="hAAyE9YZ"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DB16E703A2D;
	Tue, 28 Oct 2025 19:06:06 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (100-118-36-217.trex-nlb.outbound.svc.cluster.local [100.118.36.217])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 684407018F7;
	Tue, 28 Oct 2025 19:06:04 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761678365; a=rsa-sha256;
	cv=none;
	b=WKzSYiTEvfMiWE3kWZ0gnq6Lj1QDPi5aePwmcnSH8SzIGimVUsj6bP0sPKH2iXsd/q4QPl
	KmDLjmJp0L6d/FnRbMvQ8hiVHcrz0vpkOtm4SE/1OrB8eKzQ8smcOJD2kpj2kolEe1jd8h
	ZJ1eF621KuFEFLDThQPhvKTOk4C6e9EZT+OtH2eqtBjllbpT1TMJRLLjBR11v1DblCOCH0
	mKT98NV+1t5VOXQhCWQNvE6DjmMX+0upfOQZ+554dGNLUeMdhy10N6VAkJ3Czpl+e0bLcs
	aV7+cEQtF4b9DgREtxpsUGj7K4HDy6q84FsmHMaSySdFnPJevVLzp/uUM1Wj5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761678365;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=K7yMuFnXzZTs27rxsR5yqI/BDHOQRZQBcgCQ/UynaDY=;
	b=VeZ0Pp7WUdG1GPG4NNcxdnmIZ0j08AXw87uIsPrYAsk0ck4GGjIr6AUafBkT1gj5Pd3qaz
	0Dgkdqh1iZ3l3TmSbhDdD1KQRCSNJbaGT+xvVlq4oBK5E0YN3PCBeC06e+L9g9pDvP8l9X
	8dNCqbk5Wq+kevHK+lPOnWrZ4/wH1AtnnmTj5jQzZVK5sQDiVtsycVtKjipZ4x2xkAFXVa
	9x0n7veiNbPQGU3man5h/lTwys76v4PtywS3yp00nrry8faG29BM0rj/1gVEqOfPTKP8dD
	LpBbWu0L0FPgvkFFa4HQHTZoqgASOV0d2z2p7GkHhJIYjiykYCyR3YHCvr0WzA==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-6ldbt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Trade-Versed: 44c630e95ed6652c_1761678365765_1624956607
X-MC-Loop-Signature: 1761678365765:230569200
X-MC-Ingress-Time: 1761678365765
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.118.36.217 (trex/7.1.3);
	Tue, 28 Oct 2025 19:06:05 +0000
Received: from [IPV6:2804:d59:8970:3b00:5f26:e2da:68e6:2358] (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cx0G05f3dz3whC;
	Tue, 28 Oct 2025 19:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761678362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=K7yMuFnXzZTs27rxsR5yqI/BDHOQRZQBcgCQ/UynaDY=;
	b=hAAyE9YZBFJ3sI2e8h5NgrMvFpPAht636ZAKxj9t7TFgBRDgGiasYLk49ZnVezObFRF1Pr
	aLqnzWpFIP4mYIvSq553tSV+Ixl4lkwqKw4JRPi5tWRQUoeLECKOGAbm8etORLUtKxxyCt
	0/vxTO7vMFFdrmME7ybQGXX+tsieR7F3tc2cP14mrX+pwNuFbCt/gCsUfY+8SHqlsLz2Zj
	IugmjvIyXh5G3aMyesBnyR3/2YeJLGkeURoyBqyjaZY0rb+/JjmbeG43Op78qDpJxjhSow
	lPCWFW0znP4bQWstBCH8BEUdJxY791QMkBNvPqWn4k9getgX9oNPTYPJPprB3A==
Message-ID: <7a46f3cf-3256-4179-8ac6-25223908480c@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 David Hildenbrand <david@redhat.com>
Cc: Omar Sandoval <osandov@osandov.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-debuggers@vger.kernel.org
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>
 <aP-2x314BKks2_N9@telecaster>
 <3d3bfa52-3e13-4d23-8ef7-6cb8b1ab7d79@lucifer.local>
 <aaff172e-8fdd-4ff3-8161-1c7afb1f3e64@israelbatista.dev.br>
 <3873b85d-a8c8-472b-82e1-2751c6fef3b0@lucifer.local>
Content-Language: en-US
From: Israel Batista <linux@israelbatista.dev.br>
In-Reply-To: <3873b85d-a8c8-472b-82e1-2751c6fef3b0@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Tue, 28 Oct 2025 19:06:00 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=6901141a a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=1xXcZfXGjt39WaqPgXAA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfCWsKzO+MIZLG4tJPcBkExWHQSwr2NmAEzHTyhaUlMc3dSRdwvGrW0qwZwguU21Y4EKCZSwY1k3W3Okha9lHih0K+s92a/kQ9rGlkjwO5JYpES+6toRU 5RjY3NSyNsyzZ5wtZO53Uh3K9YBy5Pu8yKwjfsOJPmyOmGUkyma1kc2m79RDLElOu0TjMKdAeTWdqXBJsXaq7yxMIkEWR6+Qu1CuII7Lb3gy0zRtxI/EWK3/ UVXW93tTX/llLESPLHhr/oSATlvM01p9z2FCrMnMetfROwQR6JhbZKa8eFhVGYmrYXNFEZ+qbQCazdR/GYnAqERBPmXgtjKpF/IUhsHKymsVhnjqHFSAhRz+ MVTKGNma1bExUFYnkqlZBzpdzqgyEACPeXQktrphqP4tB5r3Tk5eNec1Ol+Kk3/0/Vd3JriqOwMpIIUm+5KRcL0fWM4nw43amwjyccm4U3gV0FdXhWS5ettF hfi6uh5J2c7fpC9f
X-AuthUser: contato@israelbatista.dev.br



On 10/28/25 13:34, Lorenzo Stoakes wrote:
> On Mon, Oct 27, 2025 at 11:53:57PM +0000, Israel Batista wrote:
>>
>>
>> On 10/27/25 16:46, Lorenzo Stoakes wrote:
>>
>>>
>>> So why are we naming the type... does drgn require it?
>>>
>>
>> It doesn't need to be named, but as David pointed out, we could find
>> where these values are being used and replace the type with the proper
>> enum. I quickly grepped the codebase and it seems doable, I'm probably
>> adding these changes to the next version of this patch since there are
>> some things to fix anyway.
> 
> I mean we're getting a little out of scope here but fine, if these are not
> in fact used as flags, I don't mind, just remove the silly 1 << x values
> while you do it.

Could you also point me to what tree is preferred to base the patches
for the mm subsystem, please? There are differences between linux-next
and the current version of mainline regarding these values.
(MEM_PREPARE_OFFLINE and MEM_FINISH_OFFLINE are being removed on
linux-next).

So I would appreciate if you could indicate what tree is the best to
base my changes, as I'm not that familiar with this subsystem.
