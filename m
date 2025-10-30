Received: from tiger.tulip.relay.mailchannels.net (tiger.tulip.relay.mailchannels.net [23.83.218.248])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 610334C6C
	for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 11:16:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.248
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761822973; cv=pass; b=LbYgRbFGqGA0aFXZL/IldjpQc2AgpDUghN5LTBqu++BVfPLOpsrG6TqzBTD1Z0NDB+VnEx/XKb2Ov8SythY3kHmcjn5uv7a3G6HDHQzbx2JiXtFUBLXh0cpPGzLK0GPfIlb9woAUBT8hp94ecKpTN1logyqP38EkRdJIv4vOhKI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761822973; c=relaxed/simple;
	bh=E6wmylzDmjzLWGHj/nYJxoyasSiZ3dhRw+cDPSzqTRk=;
	h=Message-ID:MIME-Version:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:Date; b=OEEX29Lm5p3t7Ge6HATo/dlGvb9fplJjblNVZ1+YtaDa7ctGb20Amuo+GFwxkKzweKzfCW8VMm9Woxxq7RK1wFbamWfTyu4yRw6TXMszC7V7Ods+GOTCzAljTRcjn7DiExeVpB/W6PYExanshANA+F+D2YRTr4Xxv3oKy6zJRRI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=CAcB0saY; arc=pass smtp.client-ip=23.83.218.248
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="CAcB0saY"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 3C5A57E3BC7;
	Thu, 30 Oct 2025 11:16:07 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (100-121-225-152.trex-nlb.outbound.svc.cluster.local [100.121.225.152])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 2B02F7E2A99;
	Thu, 30 Oct 2025 11:16:05 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761822966; a=rsa-sha256;
	cv=none;
	b=BErV2McJc1hkGSdKLyrYzjg+21W0sgLZYoadhHA7h3e2Ok4BoKYyE6PpFt3LdHWQ68H2Hy
	VhG9CcS4qtgt9+RqMv0VijOjlL6waVX4irBKVGWLtIN1p0VPpslO4Gr1gSVMN/1IjrsqzA
	UoJz3ot8X747BCvSYUzZW/fPLyTQumiUJSgpMf7tOX5g7qb6bzmZkUy2LicJe8Q9+qowX/
	ccikcBSgK2BfC82zsfVCwu/mi1u74N8XoUFrB2c0A51/AK5IBjphRLApTO3E66uZv7u9iA
	bmGgaL8bk73GdnB+oM5t6SS5OSfFQzPoTr83Z/BUsi+c4phEUpFYGTMbGi4STw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761822966;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=VDHL4ewZk9zrCDH9K3OikY1VZw90grf8AVfLkeh2kCY=;
	b=g6iAedbE3Dh4huHhq7VoWR7Z/jLKM5YXS08EXE/0H8EiLsWav2WwMvpy/jv8z2Y8ajNv/b
	JXHYhtUBLHZyBhrsW28lbcxkfRL+FBBOioj0FwaJDqfIbxFgnTb1SbX5y/jiPaFc87fq1Y
	x4mUc30UTs1hzuncyHy/IacUblDHvrDdLvCY0782vSWn+SCfcDId8PRpxogg0H+llAPg83
	ePEx/2ei/1zGF3gI13JoBWEeA8PNDAULzEz4shtcwKaO5Sb2qtiyGcA1smc9+c0HZ2m66Z
	cTZwSIexIFPBKZ8MFfqpaNgOI8xq77Y76/OtaBzZZppcQGy1np1f0nq4BwmZqQ==
ARC-Authentication-Results: i=1;
	rspamd-768b565cdb-vxqzd;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Left-Imminent: 2c2af0c46274d279_1761822966546_743931888
X-MC-Loop-Signature: 1761822966546:1214081577
X-MC-Ingress-Time: 1761822966546
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.225.152 (trex/7.1.3);
	Thu, 30 Oct 2025 11:16:06 +0000
Received: from [IPV6:2804:d59:8970:3b00:5f26:e2da:68e6:2358] (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cy1km6VZ8z1xnd;
	Thu, 30 Oct 2025 11:16:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761822963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VDHL4ewZk9zrCDH9K3OikY1VZw90grf8AVfLkeh2kCY=;
	b=CAcB0saYZ0TRqppdT2MLgdkZBHkEpLRpKnNi41nKaGVw4Zc4V+4yj/q6JJ8ukHyc/sZ10z
	HMCGUhwZi8f/AkVhit6pSROeTQM3afJSQB8mjmXUG5SLlSxCGaVJk2pcBCEVwETLmWgR+r
	sN1tICwSs8tZnHhT9HPDTxjAVKFnG8/8pKn3kKWMGlEII1QiLsQrCEm8XxT/S0wgfd2Mmk
	VwekRg2TckNcgGK9dhcRoBIFcR0bF128vuR6EadKu97koXiV+JocpObKj1dFbJHCe84TTO
	3iqdTognOCt+Nrl1SmTPEjGS8V9U1/3HDXrUYdwbs0q5wJHg57hnhTGR83bXoA==
Message-ID: <f7dd549e-7dd3-4fdf-89f7-ef6993376809@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm: change type of parameter for memory_notify
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: david@redhat.com, akpm@linux-foundation.org, linux-mm@kvack.org,
 osandov@osandov.com, linux-debuggers@vger.kernel.org
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
 <20251029195617.2210700-4-linux@israelbatista.dev.br>
 <004bb148-a818-43d2-af04-2f2ed85cbd67@lucifer.local>
Content-Language: en-US
From: Israel Batista <linux@israelbatista.dev.br>
In-Reply-To: <004bb148-a818-43d2-af04-2f2ed85cbd67@lucifer.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Thu, 30 Oct 2025 11:16:00 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=690348f2 a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=D6iVMuFdKyQZPKt9lRgA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfCPijR1zT2gvS2xZDo2skE0BVZOpfRXUrmejQzIgVHzmNSGG+Z7IJhTNf5qdIlEVSroN2MUFFep0E309stSbauB1hA6pwFC8Lbn+6+r8q3zyuc5PG4Kk oth7ABm3rHw482hXBaXHAj89bpcgrIY00zs76Ey8zPn7+sftI4CEVEpDQ67jR8bsPKBhHkQJAyZ7Occ4LCLiOZLbKZdK174UzzjN6w7iVepdXd4Avi0fO78s NZJwzsmkDU9xHBVY6s+AUxP9eLKhyreWVtkYXvqVJeGJ2Za4dYE1vxW1ueOxERbKKEAzD7ermT6JBvVUQ241YgeSte2zqPi41CuqmdOg/j6nLxShVHULtcQ8 Bk0UPr/eVwOsr8RykFWDQ1ixFYgHeHIf3bJtl6wgmgxg9OA4+CKTwiyObnfIYqNcTKNIpQJ61UHJ6BRBJdQfeng+Dol1kUzn7VvERpAwTSJDWfwfvRY1xgm7 n/o2A5msHC+nGMhB
X-AuthUser: contato@israelbatista.dev.br



On 10/30/25 07:56, Lorenzo Stoakes wrote:
> This seems fine, but I can see a whole bunch of others like:
> 
> kcore_callback()
> mm_compute_batch_notifier()
> page_ext_callback()
> reserve_mem_notiifer()
> etc.
> 
> So I think worth chasing all of these down?
> 

Yeah, I figured there were other cases and was originally planning to
include them in the patch series. The problem is they are notifier
callbacks and changing the type from unsingned long to enum
memory_block_state would break compatibility with the type notifier_fn_t
found in include/linux/notifier.h:

typedef	int (*notifier_fn_t)(struct notifier_block *nb,
			unsigned long action, void *data);

So I think it's not worth the trouble for now.

>
> Some of the switches which don't cover all cases will need to be adjusted to
> insert a no-op default:
> 

Good point.

>> -extern int memory_notify(unsigned long val, void *v);
>> +extern int memory_notify(enum memory_block_state state, void *v);
> 
> No reason you'd know, but we have a pattern of removing extraneous extern's like
> this when we otherwise change a line.
> 

Oh, that's good to know, I'll update it and keep that in mind for my
next patches.
