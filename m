Received: from caracal.ash.relay.mailchannels.net (caracal.ash.relay.mailchannels.net [23.83.222.30])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E292286405
	for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 13:20:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.30
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761830433; cv=pass; b=BxinJON/z7tQFr9FvdSFZtaWHh+xMoxae1y2/xtlMGEs5B8NG0DUvtCvcGS9KUNVEfpzCD5R4fSt7cYjSCJgwouf/eWS5xppRO3bLD9WrRn9GY4lhF8JU6puW4rwH17ZuqktuOmSocvVRhscnj0ELKrNRyAmCESElGEoai/ouQs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761830433; c=relaxed/simple;
	bh=KLKO8tuupN8sPiyBYTcZL1eO+xHTwfeYmrXRc3oDThY=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=Eycjym3ZQAxMGCPfBXzIlglyxHO6B1iVN9xWBMxsay0etjCqfWoXJeEf1c9h5idAiDKwxBx6TPO38gwZ984cqRc+Kb1SLkIfpu8M5AAW3ptqbedl1c1SoPrmvKo1ji1gtD8gA/me6MXarw5z6uDumjLNG8Asbn/oM8vfKjLVWiM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=nVbdWkTz; arc=pass smtp.client-ip=23.83.222.30
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="nVbdWkTz"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 29BE76C18B5;
	Thu, 30 Oct 2025 12:01:03 +0000 (UTC)
Received: from fr-int-smtpout27.hostinger.io (trex-green-7.trex.outbound.svc.cluster.local [100.123.217.203])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id BDCF26C0E0C;
	Thu, 30 Oct 2025 12:00:57 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761825659; a=rsa-sha256;
	cv=none;
	b=S0XRe4/6e3EXv0r+q+blYtcUkOAZZ0Z90qSrKO+SWzA2+aSckEl7GL4oZfGCJuvHZxeJfu
	ZVdL/bkce+h2dG0VBzBNgcsa1cXd4HNH9u1eZPPZuokkPEYdTVlwi4fIsVpPRMpnoW9r2E
	6rXsMKUCuBDRLCaO9rt5T8n9aU4RBy5S1wDaSUHGSMOxLxGAwoqY82A6W5/7R+E9jAc71j
	agF0MBeFn0p8nEoDiLOBBQDrdOxkwDYuB4qESC1fbc9bpzNmdY3/nwjCUpXBJ5vz6Rrig0
	VPJIIdCIqFH1+gn2i5hMkncZpl3K5eBEXMDnSecq62ALAUml1reyFsjakt8hPA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761825659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=NuWMJV1liOd3TUD9avVTueshZ59unlTwwCorV+fKC+A=;
	b=KPqFDWot6ePG8G19AtNBoOfwMyfhYg5ddAt0u0VxJ7BMsBWYPywQCV6A7Javk9Y6HO2rrD
	84wxdBY1JicMN46/RPDyNtPvRxqJx28Wh8UTlxcWb9yj1RHxCBweedVCbMSq8gkWaKmNiG
	K4ffZF4o3yqDCPOAgp918SJFN1+p8ga8m/hZpArlub6ZM1+BKyohbxZd/9hijT8ZeUrHXU
	sFJFla9BQVFmf6/9mnpOYxjs9LUmOEk+aLEs1PIxpqJjRO9X1vt8lzzgwx06J+58+8bHn8
	rd3Z1asoklKc8tmejKnOAhRqqu7Uh/Uc9WUFsNrUyAROonCizqXHqDZbJf+rqw==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-jf6ff;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Befitting-Company: 175df83262db599b_1761825659426_2467219174
X-MC-Loop-Signature: 1761825659426:3308522558
X-MC-Ingress-Time: 1761825659425
Received: from fr-int-smtpout27.hostinger.io (fr-int-smtpout27.hostinger.io
 [148.222.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.217.203 (trex/7.1.3);
	Thu, 30 Oct 2025 12:00:59 +0000
Received: from [IPV6:2804:d59:8970:3b00:5f26:e2da:68e6:2358] (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cy2kY6M1jz2yr5;
	Thu, 30 Oct 2025 12:00:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761825655;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=NuWMJV1liOd3TUD9avVTueshZ59unlTwwCorV+fKC+A=;
	b=nVbdWkTzYp+oeqalz7eskZrgKXZFVrPQ9MovDhB5PZxsG3wEK0INDQ3fxt9dxEeT+l4g/Y
	fSQZJoEsTeFa4xluPQTE0vHa9l8ENtmLibmRwHpeHvjO18JJt7AMA33qCS9BnZgNYVoqps
	oijIzV94Jz/1c9sYcW15PtEvyVVmipdcpyzH35uhFx3Xy7eOTEhGO3Fw+BY84ujVp2BVdy
	e/v5fDfz7ECpnmDo8o0qO43JA/Ln0+X0gokePcQZQyBsPLE8Our8wQACLO3bWrvCwdAZpk
	kjnq7hOmrHYppnvI7daNPEceZnKQiXSdSQQ++k1RqN1pfyLx7C2zMyUz6SHfiw==
Message-ID: <728445ef-d1e3-4494-bf73-9d0ccfc95d75@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm: change type of parameter for memory_notify
To: David Hildenbrand <david@redhat.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, osandov@osandov.com,
 linux-debuggers@vger.kernel.org
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
 <20251029195617.2210700-4-linux@israelbatista.dev.br>
 <004bb148-a818-43d2-af04-2f2ed85cbd67@lucifer.local>
 <f7dd549e-7dd3-4fdf-89f7-ef6993376809@israelbatista.dev.br>
 <9385ec9c-c002-4781-8f1f-a9eb29b2ff40@redhat.com>
Content-Language: en-US
From: Israel Batista <linux@israelbatista.dev.br>
In-Reply-To: <9385ec9c-c002-4781-8f1f-a9eb29b2ff40@redhat.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 30 Oct 2025 12:00:53 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=69035377 a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=m8KhvXbMWUCy6Yi4DU4A:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfIMe2t9eYzfYusouuRAhnHqzUZyToVh2aEy5ZotFemE/q7vTTqYejFJWwuivKR5giJLyI1E1GIlAyhzau91Z68ZzJYEFH32Nf9osUurWdOywyXL5RCKH jOgPl8ZV5AqzdfKl8NmmoNMjC+yK04y5aukJbpQiYDetyPfMq/GkKeL6k3iWQJkiJuqyjAxXt1x53hYB+T31vi8rtXs1twOl09YI/QPVN00zLaIB2brIFRLR 6q2CDFbUajlmgkJ6PxvJ/9BiZpv5CuRg5Bhy8ttMBPadwTnIFYNKJC7F9LZ7XrJXVwfX+S6CfcRfg1TiHonIQsM4GEWSnWHUb9rG3T1EmafNzye3EHO1MSJE JkB3fsnr3MH35+pUjXfiNtq7tCPNTAcas73Ys6oug7BGcMRDDp9+dT4HcZn8N+bAE6QjGmyugmUX6Bm1j/K9UUbxsNW8f+7MsEObUxy4j/6vi8gYZd4bhZsM o9CSkAZ7Aqo+dEFY
X-AuthUser: contato@israelbatista.dev.br



On 10/30/25 08:34, David Hildenbrand wrote:
> On 30.10.25 12:16, Israel Batista wrote:
>>
>>
>> On 10/30/25 07:56, Lorenzo Stoakes wrote:
>>> This seems fine, but I can see a whole bunch of others like:
>>>
>>> kcore_callback()
>>> mm_compute_batch_notifier()
>>> page_ext_callback()
>>> reserve_mem_notiifer()
>>> etc.
>>>
>>> So I think worth chasing all of these down?
>>>
>>
>> Yeah, I figured there were other cases and was originally planning to
>> include them in the patch series. The problem is they are notifier
>> callbacks and changing the type from unsingned long to enum
>> memory_block_state would break compatibility with the type notifier_fn_t
>> found in include/linux/notifier.h:
>>
>> typedef    int (*notifier_fn_t)(struct notifier_block *nb,
>>             unsigned long action, void *data);
>>
>> So I think it's not worth the trouble for now.
> 
> We could just cat from unsigned long -> type at the beginning of all 
> these notifiers to have us then work with the actual type.
> 

Right, that works.
