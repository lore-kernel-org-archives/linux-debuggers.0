Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B519DF71
	for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823914; cv=none; b=pZvO2GErN8tAoF0ExzDUD/Qnyife7W/5KFm5uDNPhyjpJ3jllMw9iPPt95pwHhqOe+SigwSDW/G1SqUSHoD7XV7GSuPIW+WJ8ZCJ9OkR+p2vgaGuouX3EXen7nrqrUq+FFtxL6h7WPtarzK+fnjDKvE6u8oIrjV53/Wc44ZkORA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823914; c=relaxed/simple;
	bh=3N/cBz5dEi9cA3JhTisou41xH2oPuY92THe9FJL/PrQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Xt/cq3Z89LDWzq0gMKTLVbWt0WCbZeSZXH7bLUZ/sLNVaOsk7L/F1CFbizrqP5Li3KBxuXzuQj7rwqVMAqe8IcFEcC3fJxnU78eqJjy9B6yjsN398YThrgxMhf6r5V98RM6S8/p17ujJbX3DpqaUfnpog6n3l3eteVbZBtQtlMA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PKfFqG5p; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PKfFqG5p"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761823912;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=8L2K4glAjS1GqshDxIkXSBI3ibLLM+9vmuAYmO183Hg=;
	b=PKfFqG5pRb+9vs+fd+M+QmAeC3E1l29yhI9jeYwMsVB+E8b+RBrOkKNHIr1W3M4KwbA5ZJ
	BtZmLRz7xcIYx9HICnMHDa4OaP68f3O+9fKpymrGvI1DOaCWEnn2nJVqXQHhT4S/ypNMJJ
	ttk86+LL7xRDKVHrpKRpF7bBncXckw4=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-632-lcJMcplBMh6l-yOcXtLRuA-1; Thu, 30 Oct 2025 07:31:51 -0400
X-MC-Unique: lcJMcplBMh6l-yOcXtLRuA-1
X-Mimecast-MFC-AGG-ID: lcJMcplBMh6l-yOcXtLRuA_1761823910
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-47717c2737bso4021495e9.2
        for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 04:31:50 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761823910; x=1762428710;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=8L2K4glAjS1GqshDxIkXSBI3ibLLM+9vmuAYmO183Hg=;
        b=RptjhOALivk4yOmG4u+jlMRc7x13RO6j3rXhs07XVh4gttblZRN23NFIsPEmJB8vRS
         FW7YY4eiA8pzKuiQoeLakQ5vVqa6RwfM7k+Uk36E/ZVwIyTmk3B7UkrXNO2eUkSKS/tD
         s+OGa6YS6/vvzUg9MqkdRLXd36J5KYCGqfUBTPk2PZ4qNPkQndUvb7FjgEoG2vWlUYbH
         jfV4gt10QeF5BsFlP/XsyM9my5Pl6aQjA11UdPYRf4wbDgnzHSirNTWPQFMy/7zAciK0
         2OFbYfIAO35pqmWJrZRy/lahGQipLjYHzs5BKnUnPYhnjzijwIBBL1bDeSmbI3aREE9l
         mTVw==
X-Forwarded-Encrypted: i=1; AJvYcCXm8B31u9Hs48dNcSKAca0PX/ijB0iD2GF9bWNt9qWe55ywyIRIHVvB5lILcBRvSLClHs2XV5mZXibcrONR/Tg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWfQp0U/MIdbhty4RNLbBIf0qm+NTxYjZniLl4WXPN2oGeypjr
	gmFSV0m+9EnOmzPYh2hQDoQyk5CKnHtpmKuiDCUNTTtEASurcdCPSku8IUhkGzt/NcKqWQRuSUX
	Qt7FZbj+jMs7nFkObmMXja9KFgJD3hxOyBalrEwVJBJ679GkmvG7/RT8rp3wF1v2BTY/dKBZ1LS
	AqwQ==
X-Gm-Gg: ASbGnct+xH8jx1YOUELvXkyRVX+FKtNMsoE9VfNuacF3nI2+85f8U9XMpM+7bulAjyx
	g5I0m0Uu41pdtrghZwTCuOEJrFEMRIsPphxD/CT5bN80NFkWa0/2YFwHO2sCQMvCfTXyNoiZ1UI
	lvNWA4gvD1fKR1h7VPS8y0EaVIDDBveyyomkNw72JAcqVKSzGMlV720/7vNOBzLMHqSr5I85MxU
	uHXo0ZPQnwNczVAOgsLVn9gbm4e2dqomekbcmKONy9h2YTx5BAPV210IhhVKMTnv9RZSe+Efp02
	dvfzbWhXV4Ni7lsmr90An4pjEICyAZ9C3V+rFuiGZvDsQ84yT54ry1cPSA+zhP07H9nPEXGvVPE
	l0KPaWKYqxIBMaHRpAoKYrhJbIePlGEN/mmqixWqbuPWx4HQldfiIFKMovCXlXI49As1jnqyKF4
	s8rD14+N/ps4xXhMt4KcxnEYeKRqE=
X-Received: by 2002:a05:600c:190d:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-4771e1ccb50mr54756125e9.22.1761823909741;
        Thu, 30 Oct 2025 04:31:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE4zDUx/D1/Z6VhmjEoFZOarwA+Tm+Yvivc7XUkhwgC06MG9b3q83kkfe9dSmDylYKPgnQdnA==
X-Received: by 2002:a05:600c:190d:b0:46e:32d4:46a1 with SMTP id 5b1f17b1804b1-4771e1ccb50mr54755925e9.22.1761823909363;
        Thu, 30 Oct 2025 04:31:49 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-477289b0bb3sm37898235e9.8.2025.10.30.04.31.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:31:48 -0700 (PDT)
Message-ID: <0a241e85-82e8-4053-ab2f-4cf13ccc5892@redhat.com>
Date: Thu, 30 Oct 2025 12:31:47 +0100
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/3] mm: convert memory block states (MEM_*) macros to
 enum
To: Israel Batista <linux@israelbatista.dev.br>, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org, linux-mm@kvack.org
Cc: osandov@osandov.com, linux-debuggers@vger.kernel.org
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
 <20251029195617.2210700-2-linux@israelbatista.dev.br>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 xsFNBFXLn5EBEAC+zYvAFJxCBY9Tr1xZgcESmxVNI/0ffzE/ZQOiHJl6mGkmA1R7/uUpiCjJ
 dBrn+lhhOYjjNefFQou6478faXE6o2AhmebqT4KiQoUQFV4R7y1KMEKoSyy8hQaK1umALTdL
 QZLQMzNE74ap+GDK0wnacPQFpcG1AE9RMq3aeErY5tujekBS32jfC/7AnH7I0v1v1TbbK3Gp
 XNeiN4QroO+5qaSr0ID2sz5jtBLRb15RMre27E1ImpaIv2Jw8NJgW0k/D1RyKCwaTsgRdwuK
 Kx/Y91XuSBdz0uOyU/S8kM1+ag0wvsGlpBVxRR/xw/E8M7TEwuCZQArqqTCmkG6HGcXFT0V9
 PXFNNgV5jXMQRwU0O/ztJIQqsE5LsUomE//bLwzj9IVsaQpKDqW6TAPjcdBDPLHvriq7kGjt
 WhVhdl0qEYB8lkBEU7V2Yb+SYhmhpDrti9Fq1EsmhiHSkxJcGREoMK/63r9WLZYI3+4W2rAc
 UucZa4OT27U5ZISjNg3Ev0rxU5UH2/pT4wJCfxwocmqaRr6UYmrtZmND89X0KigoFD/XSeVv
 jwBRNjPAubK9/k5NoRrYqztM9W6sJqrH8+UWZ1Idd/DdmogJh0gNC0+N42Za9yBRURfIdKSb
 B3JfpUqcWwE7vUaYrHG1nw54pLUoPG6sAA7Mehl3nd4pZUALHwARAQABzSREYXZpZCBIaWxk
 ZW5icmFuZCA8ZGF2aWRAcmVkaGF0LmNvbT7CwZoEEwEIAEQCGwMCF4ACGQEFCwkIBwICIgIG
 FQoJCAsCBBYCAwECHgcWIQQb2cqtc1xMOkYN/MpN3hD3AP+DWgUCaJzangUJJlgIpAAKCRBN
 3hD3AP+DWhAxD/9wcL0A+2rtaAmutaKTfxhTP0b4AAp1r/eLxjrbfbCCmh4pqzBhmSX/4z11
 opn2KqcOsueRF1t2ENLOWzQu3Roiny2HOU7DajqB4dm1BVMaXQya5ae2ghzlJN9SIoopTWlR
 0Af3hPj5E2PYvQhlcqeoehKlBo9rROJv/rjmr2x0yOM8qeTroH/ZzNlCtJ56AsE6Tvl+r7cW
 3x7/Jq5WvWeudKrhFh7/yQ7eRvHCjd9bBrZTlgAfiHmX9AnCCPRPpNGNedV9Yty2Jnxhfmbv
 Pw37LA/jef8zlCDyUh2KCU1xVEOWqg15o1RtTyGV1nXV2O/mfuQJud5vIgzBvHhypc3p6VZJ
 lEf8YmT+Ol5P7SfCs5/uGdWUYQEMqOlg6w9R4Pe8d+mk8KGvfE9/zTwGg0nRgKqlQXrWRERv
 cuEwQbridlPAoQHrFWtwpgYMXx2TaZ3sihcIPo9uU5eBs0rf4mOERY75SK+Ekayv2ucTfjxr
 Kf014py2aoRJHuvy85ee/zIyLmve5hngZTTe3Wg3TInT9UTFzTPhItam6dZ1xqdTGHZYGU0O
 otRHcwLGt470grdiob6PfVTXoHlBvkWRadMhSuG4RORCDpq89vu5QralFNIf3EysNohoFy2A
 LYg2/D53xbU/aa4DDzBb5b1Rkg/udO1gZocVQWrDh6I2K3+cCs7BTQRVy5+RARAA59fefSDR
 9nMGCb9LbMX+TFAoIQo/wgP5XPyzLYakO+94GrgfZjfhdaxPXMsl2+o8jhp/hlIzG56taNdt
 VZtPp3ih1AgbR8rHgXw1xwOpuAd5lE1qNd54ndHuADO9a9A0vPimIes78Hi1/yy+ZEEvRkHk
 /kDa6F3AtTc1m4rbbOk2fiKzzsE9YXweFjQvl9p+AMw6qd/iC4lUk9g0+FQXNdRs+o4o6Qvy
 iOQJfGQ4UcBuOy1IrkJrd8qq5jet1fcM2j4QvsW8CLDWZS1L7kZ5gT5EycMKxUWb8LuRjxzZ
 3QY1aQH2kkzn6acigU3HLtgFyV1gBNV44ehjgvJpRY2cC8VhanTx0dZ9mj1YKIky5N+C0f21
 zvntBqcxV0+3p8MrxRRcgEtDZNav+xAoT3G0W4SahAaUTWXpsZoOecwtxi74CyneQNPTDjNg
 azHmvpdBVEfj7k3p4dmJp5i0U66Onmf6mMFpArvBRSMOKU9DlAzMi4IvhiNWjKVaIE2Se9BY
 FdKVAJaZq85P2y20ZBd08ILnKcj7XKZkLU5FkoA0udEBvQ0f9QLNyyy3DZMCQWcwRuj1m73D
 sq8DEFBdZ5eEkj1dCyx+t/ga6x2rHyc8Sl86oK1tvAkwBNsfKou3v+jP/l14a7DGBvrmlYjO
 59o3t6inu6H7pt7OL6u6BQj7DoMAEQEAAcLBfAQYAQgAJgIbDBYhBBvZyq1zXEw6Rg38yk3e
 EPcA/4NaBQJonNqrBQkmWAihAAoJEE3eEPcA/4NaKtMQALAJ8PzprBEXbXcEXwDKQu+P/vts
 IfUb1UNMfMV76BicGa5NCZnJNQASDP/+bFg6O3gx5NbhHHPeaWz/VxlOmYHokHodOvtL0WCC
 8A5PEP8tOk6029Z+J+xUcMrJClNVFpzVvOpb1lCbhjwAV465Hy+NUSbbUiRxdzNQtLtgZzOV
 Zw7jxUCs4UUZLQTCuBpFgb15bBxYZ/BL9MbzxPxvfUQIPbnzQMcqtpUs21CMK2PdfCh5c4gS
 sDci6D5/ZIBw94UQWmGpM/O1ilGXde2ZzzGYl64glmccD8e87OnEgKnH3FbnJnT4iJchtSvx
 yJNi1+t0+qDti4m88+/9IuPqCKb6Stl+s2dnLtJNrjXBGJtsQG/sRpqsJz5x1/2nPJSRMsx9
 5YfqbdrJSOFXDzZ8/r82HgQEtUvlSXNaXCa95ez0UkOG7+bDm2b3s0XahBQeLVCH0mw3RAQg
 r7xDAYKIrAwfHHmMTnBQDPJwVqxJjVNr7yBic4yfzVWGCGNE4DnOW0vcIeoyhy9vnIa3w1uZ
 3iyY2Nsd7JxfKu1PRhCGwXzRw5TlfEsoRI7V9A8isUCoqE2Dzh3FvYHVeX4Us+bRL/oqareJ
 CIFqgYMyvHj7Q06kTKmauOe4Nf0l0qEkIuIzfoLJ3qr5UyXc2hLtWyT9Ir+lYlX9efqh7mOY
 qIws/H2t
In-Reply-To: <20251029195617.2210700-2-linux@israelbatista.dev.br>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: -7grxHpgz4AIwa7gFIpYgainF1j-8YGes749pdGLANc_1761823910
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.10.25 20:56, Israel Batista wrote:
> Converting the MEM_* constants from macros to an enum ensures that their
> values will be correctly emitted in the debug symbols, making it easier
> to trace the meaning of each value when debugging with tools such as
> drgn, without the need to hard-code the values.
> 
> Since the values are mutually exclusive and they are not exposed directly to
> userspace, I also dropped the misleading pattern (1<<X) that made it look like
> they were combinable flags.
> 
> Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
> ---

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb

