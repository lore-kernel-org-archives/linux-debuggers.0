Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AEAE129CB4D
	for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 11:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761824054; cv=none; b=rHOXafZ+qWwVz1JKGFetJVv4tOlxvN35PPsQpp2sd7VssWvIo7ol/dgWt4olcUMlYyf9vaipCh/9/w3eSV7Z2IaZQP+OdXQGPxC3fPz7RxwcWawptW4KO0Ovt5lxCpVnBJvAxnKSHOvgL+zW3fDs3wEOAGcf40KJqkpy2OwOfYQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761824054; c=relaxed/simple;
	bh=rR+vii6f6CcSrgd7e2osPc2oOZopz11TFFx3CPUH2LY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HBBSKuzH0m4Fu+A5bTQKE1c8KS6aTxgdwXGtne4tk4uv1wT1+a7CcdijrDT1zriN2Fu+P3tV/R8+yKKRcwPcWMvO2cDlN4VX8A4BuXMqhirqHuEZKHYVLpGvPUV8fkmY9yvc1hW19wDKli9s5SCH9T4CFMtZEI/YNPjXqdKK5nM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=XJcWVEJV; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="XJcWVEJV"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761824051;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=9w1uQN+XHy4hQ/YXkw4AP0gfZ9jwPVf23hTV0vL2o3Q=;
	b=XJcWVEJVuElPZ6tjWJHThoWdOCDDY9CGJQFMX3kAOc6kU4ugoSbHtmE0ogGPTX+QglxXlo
	NXbhlDqiNQDsC9l1KC5h0oHKADFYlI1dxco3UXxXpLpOG5ezZuEaNyoXmPR16bcJ0xiXXI
	bFINvRez51HQYAgkMcza1wOO+bwUXuo=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-441-LQFq_04iNBG1XLS5_Tu_FA-1; Thu, 30 Oct 2025 07:34:10 -0400
X-MC-Unique: LQFq_04iNBG1XLS5_Tu_FA-1
X-Mimecast-MFC-AGG-ID: LQFq_04iNBG1XLS5_Tu_FA_1761824049
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-46e39567579so4473855e9.0
        for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 04:34:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761824049; x=1762428849;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9w1uQN+XHy4hQ/YXkw4AP0gfZ9jwPVf23hTV0vL2o3Q=;
        b=mEp/Px+2JwlIZVgP3xBvofT0Ghmvcimja/SSHAWsbdBHtW7vWQCLxjabGKqy0nLdMY
         yMXTwq6cGWf19YiLju/o/p+HwUnPRs8thIyNaInJiRfHyGwzz6DNZDGpihbQxAVb7f0z
         y1d6k2B4mU8Bmaye1i9oKFdrIAGzvZfzSa8eYP0nF4T34di3L9lTcPY2+fxKykcBvQPp
         tyHQIeFwSHwop6o4sSk1eHzY7LYIsJU2As8a15tp00cA5ptk+f2Kca9giqBJ+zOtseRm
         a7Py3GMGvoSog9t93Y1vtoXPLCkCWE406OR8MlpQmknvZEPpj7YCkYxWzfD5YlDZFLVf
         XmYQ==
X-Forwarded-Encrypted: i=1; AJvYcCV/tQ9TMLk7kdqCIMo2fKGhFno3zHqiaaQBP6q+X4XUhO5FT+sPzj2SAFwFNrvm6JUvxBQXKG9AAJKeWMwRifw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyCMHy2y2nXWEq+sJZ+1tEzLybqbX300Vg+lHxrsMkMfy8dn+Sl
	OblEntnhRlS8MsmCVlwV2i+ACEgibslhHxn57JPoh8J+0Fd7nmZvkYDex6Oa1WKjKXSq6/iMECi
	bXcPy+1lpz98lqGYjSr5kZ3vD4io+iLvNfpvrJ3EU8SLnAaYwDMHj8T2XWB41lHgwaJ1ZWA==
X-Gm-Gg: ASbGncvMfre7D4vbAKorhG7XmnXFV+NNjthmhIcbmfWilw66D75G4TtBbTgo5TZrFOj
	xoqejXFPAtZTOxENZVBiCzxbZw0hOP/gqu3yPYgH6gkLgT6iRDUpoTy1gNHwgN+nA/Qg2ThDDYQ
	BUSCVTRw/NlZJWMLeaswYjPbNqYfLyLPLj/0B4W3NetQjXKWjHwuqdj1p/cSO/sQ/h0jWVDZEJq
	GqC1GK3C34Fl++/PUOTyC29hp2xCuCo6Y7jJBpQxygrtb3sFkfTpcBETe2XRxLiCZ7zxGjw/kS4
	/SFJgp87s8mQZhuPzLOhSAi/TtCXquGBbGc4Z2go2jSXqSNjG8EMRfOAy/jVtLZWZFmxayI9d6O
	Y8Po3yRenDiZC2Wi66v69p+Jsr6pVUnEoRFj4qaOVj5TQBOKlkiRMqI8zbNM43fKq5KTb4bEDc6
	mMWHCjpyvHUfokb/+wgEMSs6NuYww=
X-Received: by 2002:a05:600c:1ca5:b0:471:6f4:601f with SMTP id 5b1f17b1804b1-4772686efeemr32236385e9.19.1761824049092;
        Thu, 30 Oct 2025 04:34:09 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiZFuRhX8Dwhv/z7p5mtCfdnZxWjcz8QOPOy9GE4BDcvy3635c3ogWbyAUBHwqCjgRyFyBPQ==
X-Received: by 2002:a05:600c:1ca5:b0:471:6f4:601f with SMTP id 5b1f17b1804b1-4772686efeemr32235995e9.19.1761824048586;
        Thu, 30 Oct 2025 04:34:08 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4771902991bsm63465535e9.7.2025.10.30.04.34.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:34:08 -0700 (PDT)
Message-ID: <9385ec9c-c002-4781-8f1f-a9eb29b2ff40@redhat.com>
Date: Thu, 30 Oct 2025 12:34:06 +0100
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] mm: change type of parameter for memory_notify
To: Israel Batista <linux@israelbatista.dev.br>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org, osandov@osandov.com,
 linux-debuggers@vger.kernel.org
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
 <20251029195617.2210700-4-linux@israelbatista.dev.br>
 <004bb148-a818-43d2-af04-2f2ed85cbd67@lucifer.local>
 <f7dd549e-7dd3-4fdf-89f7-ef6993376809@israelbatista.dev.br>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <f7dd549e-7dd3-4fdf-89f7-ef6993376809@israelbatista.dev.br>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: Z3CaDxmENMHLaDvFkJHgWfsRqr2H6UK2xYIoxG_RDWg_1761824049
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 30.10.25 12:16, Israel Batista wrote:
> 
> 
> On 10/30/25 07:56, Lorenzo Stoakes wrote:
>> This seems fine, but I can see a whole bunch of others like:
>>
>> kcore_callback()
>> mm_compute_batch_notifier()
>> page_ext_callback()
>> reserve_mem_notiifer()
>> etc.
>>
>> So I think worth chasing all of these down?
>>
> 
> Yeah, I figured there were other cases and was originally planning to
> include them in the patch series. The problem is they are notifier
> callbacks and changing the type from unsingned long to enum
> memory_block_state would break compatibility with the type notifier_fn_t
> found in include/linux/notifier.h:
> 
> typedef	int (*notifier_fn_t)(struct notifier_block *nb,
> 			unsigned long action, void *data);
> 
> So I think it's not worth the trouble for now.

We could just cat from unsigned long -> type at the beginning of all 
these notifiers to have us then work with the actual type.

-- 
Cheers

David / dhildenb

