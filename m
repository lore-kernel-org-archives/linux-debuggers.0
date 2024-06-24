Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 329FE1B964
	for <linux-debuggers@vger.kernel.org>; Mon, 24 Jun 2024 06:17:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719209830; cv=none; b=GA3FhAO2xzxMb3kYG2VcMNOs9aWGYl8GYH5Sw0DuPSyNkfg5iwmGvDNH+oeKCereQQmpGV43kvCPb+ehX67C2oheW41HVa8KMvcm+DsBeckj6zeS1H3mBEfLo4G5qg2PVCjFMPv/nlefl4BNH3hVAUXyYFYhGbuKW9PvDMniJCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719209830; c=relaxed/simple;
	bh=RUDRFuU1HJtCgye7STljOv4umAn0pouqsiSY/R68ElQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Akf+4EBAayvxGmZHPI3o/237n0/YQMy57sQ88gzzflqY9OfnGwiEqiyuuiV2/2rBZ2/kH9sPaFuvsJWc3QHFGudymTOtjL5kpkuNT8knxT/B+WhdHh0/R48RF5o7hj7XKs9bFtGhG0FBnSGDJhkb7WH5adkpOqgfaG0x8nFN6HI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=TnlttaS4; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="TnlttaS4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1719209828;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=gQ9TejqQPcfiIa9UnYEvu2AinTtN6JKCii4WtSCB+Ko=;
	b=TnlttaS44BSTuTHuLFSkg1k3OgbH6t2lA0mMtzWhDdRd1AEf89F+UWxet2PBcFfDLn9zmU
	hl/LV1/hITnHwdK0P/V0dLlHbuF0/Dwdj0Wz0LbKmBKoA8sC2avY9J8hsUBWIMC0lTI3Ae
	bhjz2iCaw4U+vWud+YNSl8whOYUMBwU=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-471-KZtXS8ZuPKWphFEt6ARptA-1; Mon, 24 Jun 2024 02:17:04 -0400
X-MC-Unique: KZtXS8ZuPKWphFEt6ARptA-1
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-a7251e7f53fso29100066b.1
        for <linux-debuggers@vger.kernel.org>; Sun, 23 Jun 2024 23:17:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719209823; x=1719814623;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gQ9TejqQPcfiIa9UnYEvu2AinTtN6JKCii4WtSCB+Ko=;
        b=qbxTs9O+9GhcxfTtkpPammydem+vHGh8ydD1xW4T9TmIC0PuSSWNIECL0g9ZIRFLoS
         Zz/U3LLpxw6SM01aS+guy93YKZafrKYJwNaQ5y8RGjT4KBqq/o/WAPURAhVPCEyll8FI
         Ko+hvUtrORZaxwZtKUBMUmp7D+or3m4UbG3PBfjZ5jijO1pW2DoUlMqbU33aRu5viImb
         9COXFYHPQrlozoMyt2zvobxDWPtcCNHTGItnjQliU9ErmAg7YPLhoiKsalQ34+fS+V7j
         GQZLAWXyj/iUv05pEQxg+XlZhU9k28w218Ty5zRhc2yTYLCbUKeH/2PDUVBQVlxceiwl
         mtBA==
X-Forwarded-Encrypted: i=1; AJvYcCUWR1e/Zpf0xWQCIkd9DIIPTXxODkjpD6rbT7u20CC92u+2jsJUIE2VgVwcsakEDjOfWbkXhy50EAqBlk3Hf2vtnXecZKxwJ972613EghMo
X-Gm-Message-State: AOJu0Yxiyeskfy5E8q2aLuyFmRjX9yDPlMUgDxX580FY+NQRq7alwxKY
	aF0dKMbMAIWgZmMn+EC3Zu9ej5188IGuRkACjK2bOqpFQzCQh8PPdU8imVeASqKA8RRcp8/7bRX
	Yx3dJeygJ1si/uguVUykVzwW5af4xJ8emCBlF5yvoSPZ2ziFMCiMNbbnyV6q7BOzgrA==
X-Received: by 2002:a17:906:e215:b0:a6f:b78a:b39 with SMTP id a640c23a62f3a-a7245b6dcafmr192789766b.1.1719209823516;
        Sun, 23 Jun 2024 23:17:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHh4NsBe0Kw1exxvdki2RPXrD30P0JNZPy5P1/2jgyHm7fpw1Wmf3+xLl8Di2oudEMNmhSnew==
X-Received: by 2002:a17:906:e215:b0:a6f:b78a:b39 with SMTP id a640c23a62f3a-a7245b6dcafmr192788266b.1.1719209823136;
        Sun, 23 Jun 2024 23:17:03 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de. [109.43.178.117])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a724c83fad0sm128052166b.168.2024.06.23.23.17.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 23 Jun 2024 23:17:02 -0700 (PDT)
Message-ID: <e07b1538-98b7-4ade-88d4-71707b6d84e2@redhat.com>
Date: Mon, 24 Jun 2024 08:17:00 +0200
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] arch_dump: fix prstatus pid on s390x and ppc
To: Omar Sandoval <osandov@osandov.com>, qemu-devel@nongnu.org,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 linux-debuggers@vger.kernel.org, Harsh Prateek Bora <harshpb@linux.ibm.com>,
 =?UTF-8?B?RnLDqWTDqXJpYyBCYXJyYXQ=?= <fbarrat@linux.ibm.com>,
 Glenn Miles <milesg@linux.ibm.com>
References: <cover.1718771802.git.osandov@osandov.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <cover.1718771802.git.osandov@osandov.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2024 07.00, Omar Sandoval wrote:
> Hello,
> 
> I maintain drgn [1], a debugger for the Linux kernel. I ran into a quirk
> of the NT_PRSTATUS note in kernel core dumps [2], so I looked into how
> QEMU's dump-guest-memory command generates NT_PRSTATUS. I noticed that
> on most architectures, the note's PID field is set to the CPU ID plus 1.
> There are two exceptions: on s390x, there's an endianness bug (it's not
> byte swapped if the host is little endian), and on ppc, it's not set at
> all (it defaults to zero). They're both easy fixes.
> 
> Thanks,
> Omar
> 
> 1: https://github.com/osandov/drgn
> 2: https://github.com/osandov/drgn/issues/404
> 
> Omar Sandoval (2):
>    target/s390x/arch_dump: use correct byte order for pid
>    target/ppc/arch_dump: set prstatus pid to cpuid
> 
>   target/ppc/arch_dump.c   | 21 ++++++++++++---------
>   target/s390x/arch_dump.c |  2 +-
>   2 files changed, 13 insertions(+), 10 deletions(-)

I'm going to pick up patch 1 for my s390x tree ... for the second patch, it 
would be good if someone of the ppc guys could have a look at it first.

  Thomas


