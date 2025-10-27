Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3FC202EDD62
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 23:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761608994; cv=pass; b=PIqc0qu5O9M1e8dReIBlFCXg0mWttAI4dRdHEdbsHPTq0wELeZGyFGYUw7UDOMJpM+mcysc7+rnjg9gdW3jhjGMvoPbSOymMSNrp470mmFzhJaonr0as7d/IOesuIDObsgtfQ2NgIxY94L9sRqY6gOgLRSm/YHjBK/Z1SKr2csM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761608994; c=relaxed/simple;
	bh=pX8lx8oL0PVM8XR1IDBmIoIt73mDCkj8Ku82mEvXUO0=;
	h=Message-ID:MIME-Version:From:Subject:To:Cc:References:In-Reply-To:
	 Content-Type:Date; b=ISYqzlD/9fzp7QWKotO6qIkk2sB6vqyIwxzHpbtHHmAm0GbOfS4gHuoVLFq7i0ZUbkvJTYi5XZyQr+IO2fqSFHfmEUNs+++4boAeunTBMG/654ForFwnvU4Njg2Eq2mK4ihv1T9XTzF3QutRgIcbMMsmKDS8HmWALFLGJMyHBrw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=auF05oNm; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="auF05oNm"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id B46E5421E21;
	Mon, 27 Oct 2025 23:41:52 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (trex-green-3.trex.outbound.svc.cluster.local [100.121.22.161])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id A62B3421E7E;
	Mon, 27 Oct 2025 23:41:50 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761608511; a=rsa-sha256;
	cv=none;
	b=m7xkr+ca1NqFxV42Z7mS4rEbu6sPMYlCU2JWEe+pCHNRhJqJL/AKiBYL1AoLfE+bEjuPEz
	DXLr4nvJfna3DOxziEmlEbM96bapgTekc36nrvOzXQzGYKkdoVBdWM7ObgT55wcG1LMCNB
	uPJmwWz76zJlg7hviCFdEVZWLGhfKq7Ss3lvZXzqtYngPkW89erCRSJx2sknUfr0rlsewc
	oRTJkUAJdw2DWGBOHVttTqo7z89LahG5iQRiYUz4QsQeDteDruXF6ncPScoxSm9yPMoK8c
	maau8tU3D4fobFX8sfNZKquZvN/F9ttsHASx29yA8N+n7Qo1miv6ScCQ2ybIog==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761608511;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=UF2FEr/ckedYBRJkD+m/g5x+lv+k26BHP65ZAf74xNQ=;
	b=uvh91yRiU/+dKUBdaoEPtr5pxu0Yy0/Rs/5bzVOfFuqdHz3XZeYlgUSno2CfyNkrU9PNjN
	cfp8/lKr28+LA0hTnSg+moq/PpZQ+wJNPQB2MJ5f21hffkCQjP0tqVs0Oj0iWKNcl4+yXe
	XKKWirdWgDwXFyMRZSJBcxIBi8Ej/MzFHLOBmRVaCucByRJt29+7Y6oYiHo3BT2lvT6QPR
	vEIw8Rb2O59nuw/L34fV3ufneW0afhpXbF8UdWeltW/FaUoW0nEMcHWy6rvQs6tie2gWgB
	DBL7Zwa7FMiHV60ds/vjeXeFYejbDIy/Pa1PlbZfta0e259iNDpvA1AtkiPmNQ==
ARC-Authentication-Results: i=1;
	rspamd-674f557ffc-j5ljt;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Spill-Arch: 54bd9cc055e65ecf_1761608511816_2982394158
X-MC-Loop-Signature: 1761608511816:1182732274
X-MC-Ingress-Time: 1761608511815
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.121.22.161 (trex/7.1.3);
	Mon, 27 Oct 2025 23:41:51 +0000
Received: from [IPV6:2804:d59:8970:3b00:5f26:e2da:68e6:2358] (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cwVQh09wBz1ymV;
	Mon, 27 Oct 2025 23:41:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761608509;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=UF2FEr/ckedYBRJkD+m/g5x+lv+k26BHP65ZAf74xNQ=;
	b=auF05oNmU6sYaz9qm2z9Em6ubZJJ/uM6uorE5H9wKKlo2qh428/CODReNMz9anX6EenwHp
	Nm3imuydbGHNO4aY9HU2jwUcn3G/awHDfmV3S7TDhBGRGzhvFliISm+on3cjQcdtmn9Gyv
	IWIhoByb0/Ls7KovKUHiDqWg3nTt4r4/BKOWXGEdmfwL/q+mHATlJUHeVQwGi3ZlZPoU++
	47V9qmdeCoi3phUrjaa99ILdvbECX1hJ+TmDmJ81Qeht74aPrWZrHFdCFD77D0fXlBATUx
	t2ToOAGXCKFfnQM/fl1GordU5mUab8QmYy8bAE2Lu9scpJ+qDXsJ9a7Y7Du/JQ==
Message-ID: <391c924d-b6f4-429f-8190-b33e3b6a3942@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Israel Batista <linux@israelbatista.dev.br>
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
To: Omar Sandoval <osandov@osandov.com>
Cc: akpm@linux-foundation.org, david@redhat.com, linux-mm@kvack.org,
 linux-debuggers@vger.kernel.org
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <aP-3dauwpc-Kq5Kh@telecaster>
Content-Language: en-US
In-Reply-To: <aP-3dauwpc-Kq5Kh@telecaster>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Date: Mon, 27 Oct 2025 23:41:47 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=6900033d a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=_ZKPHTLhK7m246hEAoEA:9 a=QEXdDO2ut3YA:10
X-CM-Envelope: MS4xfLgx9kVtAxys6ymeasq03EQxMVirb1+nJXGZwAg3ORbMcDKG5wdrMLa0HedftkBrxOx+/jUR+EIXYem2+TTvLv1Z5ReIzc+StfggC8dD7+y10KFzl/dA +6wFkLI5bvgiKsFkrh3bEKV+ACC6VMe1h/ahP/ORloIijiYnMGQIOExxSzZzAGZeal50ib6bgzfv1SQEzI6JHBFyQbolR30/KpPF1DlF+KabGkqiUhteN4cX ZaFEyFQUe7OdprxS8Aa57Qbcy9zEDI8bi6FlGyU74gFJL5im7/p8Pzhpe9Q0VwGhvqiUwOF9uJNxNpXpZfcOKRWOPdaNpBV7wdvGnSMQD45ugbqNvFbrLCAp zXTXrEgBWqs0DlfAOivC9jgB5KamHh+SZrx81mJWdbm+1aFV/yxwJMioEjhcH3n9tYDVbU40AyxslR6/KDOA/doq0zP12g==
X-AuthUser: contato@israelbatista.dev.br



On 10/27/25 15:18, Omar Sandoval wrote:
> 
> What kernel version is this patch based on? It doesn't apply on mainline
> because it is missing a couple of definitions added in 6.9 by commit
> c5f1e2d18909 ("mm/memory_hotplug: introduce
> MEM_PREPARE_ONLINE/MEM_FINISH_OFFLINE notifiers").
> 

Sorry, my bad. I mixed-up my local branches and created the patch from
linux-next rather than Linus's tree. I will create a new patch with the
proper changes.

>> +enum mem_states {
> 
> mem_state is very vague. enum memory_block_state might be a more
> appropriate name.
> 

Agreed, I will change it on the next version of the patch.
