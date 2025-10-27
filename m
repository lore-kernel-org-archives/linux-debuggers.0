Received: from buffalo.ash.relay.mailchannels.net (buffalo.ash.relay.mailchannels.net [23.83.222.24])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39D5519D08F
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 23:54:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.24
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761609254; cv=pass; b=eBVyVcn+ZlTVtnIg9h3uWGZm6hUjsrXps+Z2bFqL3yDvUomWu7nVR23v48+BWT3p1mAlxTPVcurzk19aV5RmGerEIV5z9OMXGdwPC0UsCPZ8ylEOccTCVOa5XDGvBhZylmTJDP+afazKGrPUm52m0tbcEZM9uMPm/tCMcQfhbNU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761609254; c=relaxed/simple;
	bh=yBSXdwn6LuwpP1fTE4zXBh6ljDEPv17eBxWEtpJnXeM=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=UNzn1LA9jpNZpQ9ozTqiw9pyKQk3wPJggMN2DVA1130TENtO1vWTqLPxF+7da/8fSLtrHjQLiiVcNGMcQdbGcwQwVB/yZxAkwbyhvZHuCarxPf11Jr3+RB+YIB594Z/oyYZi6pMQI0eYI9b3bgj2867Cse0L2teJ5Q3+qOMOdPA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=V5psUi7S; arc=pass smtp.client-ip=23.83.222.24
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="V5psUi7S"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id DDAFC901A48;
	Mon, 27 Oct 2025 23:54:01 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (100-117-132-18.trex-nlb.outbound.svc.cluster.local [100.117.132.18])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 5E8569019BB;
	Mon, 27 Oct 2025 23:54:00 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761609241; a=rsa-sha256;
	cv=none;
	b=rqJYtCvOCDrcpx+2JXR+s21IGNL4tnaczAC4qk8qCqvkeObLIMkYj7oKUA4LliVRD+omto
	8A2BK/J2/s60dZbHb5LN7QKVpktXLNAOyuXhqV4Ne3+EDrA4mJOlT4/Zu/fyXgXO2kRQu0
	h0G0B4JvZBfHWP4RQBUAzGtHbJmA1erLm8c6vwBMK6Im/F84BvqXFpT/UlFbf3YXjyjbRG
	dQyWQvpm6+TEcR9Gk9lgUzx7sptboO/t+6MFcidclxHEZj3OJONi6laVs0UyRCc+S/juaT
	JzHspExZyKBGGsdto55qRQVqRJQtIM22ik2W0033YtTOhQud+M+BJdifwK9Y7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761609241;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=2hHmlaz+cO6ss8rEa7DEhaPgSA8+zPxoNmKUdon4sxE=;
	b=btoGfdvgYQWCXN2mQe+cj94s/JJlvM0x7UJL+tocq6fxyKKZDZMXo0cRkkQZX23vP4pP7E
	8/6ClyeC6V5riLpuGDip3b9/xvTHrLyYP5+Q12zJklvPDXLgUmvh9a64p77NfSkKHBUGtU
	Tz5WkP+P39uaVfHapHWUd4sDYamJTjsw0AAgb/uv4ea6H8O24suSxfDsyFpLWNelSkZKN8
	N5BgAKhhLHzNh5fzM6X1VTk18m01iFOmBifnbrTA9nwUiCxXK9r1uI0mYjcrJhWxz8+g0D
	AjIUKBLwFE250aSNbssi3HJPOjIh+hDHng4JpextzlnOS4EOFyQcbylk1HMSqg==
ARC-Authentication-Results: i=1;
	rspamd-9799b5d46-sl7bq;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Sponge-Tasty: 2a24e5a130323413_1761609241797_968232376
X-MC-Loop-Signature: 1761609241797:3855391038
X-MC-Ingress-Time: 1761609241797
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.117.132.18 (trex/7.1.3);
	Mon, 27 Oct 2025 23:54:01 +0000
Received: from [IPV6:2804:d59:8970:3b00:5f26:e2da:68e6:2358] (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cwVhj1cvnz3wbj;
	Mon, 27 Oct 2025 23:53:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761609238;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hHmlaz+cO6ss8rEa7DEhaPgSA8+zPxoNmKUdon4sxE=;
	b=V5psUi7SswikmUfPKEutE0yIsvu2VGZ+xjWmYfqp931bUUfCe9N1zlVkRNexCtpndWJfVJ
	CRpmFL1ocRNbABJjLvpNmCR1tnTPWRSHPSCdXJsaZSrAlXuPReEfy6iLC1RmPg3PWxiF9K
	HsXwrTvgaK7TwLYPT6NOjgewy7rLx6nebbX1iPie7zK+w7fk3/rPn+LJCRlyCBFBfRnqNn
	zUP/73qk61pRNud7hT+09B0uRHAqh7CQ2LH1nVRozk1ExLcqSzZjT8XEvQ9iBGvsfce3rU
	wwLDlZjibqmDzIH1GNkTy6iB6MgDM5CwBm0OB7maXoNkaOVcPbJE86a3hRTIlg==
Message-ID: <aaff172e-8fdd-4ff3-8161-1c7afb1f3e64@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Omar Sandoval <osandov@osandov.com>
Cc: David Hildenbrand <david@redhat.com>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-debuggers@vger.kernel.org
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>
 <aP-2x314BKks2_N9@telecaster>
 <3d3bfa52-3e13-4d23-8ef7-6cb8b1ab7d79@lucifer.local>
Content-Language: en-US
From: Israel Batista <linux@israelbatista.dev.br>
In-Reply-To: <3d3bfa52-3e13-4d23-8ef7-6cb8b1ab7d79@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 27 Oct 2025 23:53:57 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=69000616 a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=a51BL_R8RzZOHhO6insA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfGXM2iX6cMtMD4gYf0VOTxgQxMkzqQMmPBhXrc8K4Diye1+jZk1x7wGKANwGY+9urEwZMQM3ns/EtmRuuUYlLZdM3cwal165PTsGCkd633bO2GCHibYT zWrR/CL8l6CQzAPCVwfzuLVTrSCa2kuulzAi1SqHlCdjj2DaDNJ0qUAbMGB37y85D04QJeicJbIvS/81lNnmV4/IPhjUrXOSZWDPRizTuJJsZtVoKWCdFgtC F+k9uiWKETeqmUD7RetGmzQhIOGcNGMTeGJJaQaZz99x5KBDzdau2dj1EUzTa1e6fa4g7ddozP8FR1jsFonn253b38BqtZL8at/mu0fMUlJ7Iyc3VYFMm0Aj C2NKdxnsn/XnJ36rlX+vPH0z1t/mbUyExx4x4V+mgvPsgVnGJsyDgE9j6PBqT+yw5OTCuazugVWkPmEGrsKOBhazwG/fesvPBktjnb+o4Xfvl489QT7krt+C UbHuITY5+AzOiZyK
X-AuthUser: contato@israelbatista.dev.br



On 10/27/25 16:46, Lorenzo Stoakes wrote:

> 
> So why are we naming the type... does drgn require it?
> 

It doesn't need to be named, but as David pointed out, we could find
where these values are being used and replace the type with the proper
enum. I quickly grepped the codebase and it seems doable, I'm probably
adding these changes to the next version of this patch since there are
some things to fix anyway.
