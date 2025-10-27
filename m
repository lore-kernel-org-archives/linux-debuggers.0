Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBDE31B824
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 19:17:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761592632; cv=none; b=lDx2n7ab6+/DzHcW0VfEmmW+DX45an23n2AOMLpz/6nR1HjNjY4kCoGsKx+hArsSkXpfqBSQ8RXUSOMhF5cQAHSEVgD/YqDCjC88OkMNLzAEvlZ+hTKYvJ8ffMfS8hUxPCAztXCIE/KkQM531+SqqFEcKipT1FJgivRwXca56WI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761592632; c=relaxed/simple;
	bh=+jMu4E9dIN2HFrMhlipru6WxdIINvqSlO2x7AgLGd7g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RBRntVoXawQckQN3tTQil/QKd5BearF3ePbWBK6sb1gazud3X01oNz/3QW04Ezgxqsj14I2wdHhmtz/Ql0Fks2kwnYRPDmnW2IPVah/R+4FI8zukmBrT4RwGwKF85wgV2PLhNv+nD9+vJOsLLMtDAtxE6/AWh4P74i/W0jDWT78=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=LxGalJfj; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="LxGalJfj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761592629;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=k68tctDaos2r7S2/tugCy531UZpNh5YbiETzZ7k4MIg=;
	b=LxGalJfju0lkE0B98sm4sNOR30+MezInMbwRfbPpOuDUEt0g/YYmnyMqfw3/6D/IUtkO7+
	DoUuB4eRrnL2Z/LGyZ2uLjdIgDv+OkRGbOzVRh386VhRGxqQwc6P5/R+JkwF7hgPQCtBuO
	h1gc/YQtIBd+CCFH0FLXdCWHZW7Hl5o=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-YIDc4IqXME6e-KXC2TOp1Q-1; Mon, 27 Oct 2025 15:17:06 -0400
X-MC-Unique: YIDc4IqXME6e-KXC2TOp1Q-1
X-Mimecast-MFC-AGG-ID: YIDc4IqXME6e-KXC2TOp1Q_1761592626
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-475ddf7e925so3109595e9.2
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 12:17:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761592625; x=1762197425;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=k68tctDaos2r7S2/tugCy531UZpNh5YbiETzZ7k4MIg=;
        b=pXyit6L0G1RI4g78Md47Au3RpdsVCGtHP5XFrNR70u99HPduzFDys8PL9qCjMYGEX4
         X79HW6qrbSxapMpAPuOXJxdqLWijoFLbGBZpAs5w/5hofVShld9gVGRwohW+89So+TOz
         5gzw6tnkG7dMUWKFG2bIzJaLMWEtYtIngYV7B1KX+pAWx0AYufHQFOusrlxsiUuWSSPo
         bXFyRuRug9XJhr+odLKceg8zdKHuC671M6KxA0fdXAe6m5+wrY1cOaWlLUqWISDayiFm
         ILwAxh+KEvhZLHWV9QazB93uwEKDOyVBcOHkspNP4i/3weS3kNuP6wlJnnsPwNfDZrjO
         Es6A==
X-Forwarded-Encrypted: i=1; AJvYcCWsQtc3Qaio8l7QjAtRSh4BeS2kWjhSJR9Q1gRpBi8p4HJyn3ReYJzTP2tVEZHlsfwVyfztCAXhT3+HWXbSYho=@vger.kernel.org
X-Gm-Message-State: AOJu0YyV2vIopbxy/WjKndrlY5HI3YvPGTCV7Z2akX3t8lyChGIRe1/7
	Cz8qcy4V8toDYqan8YmczyGD2mi6UqTnwyBfNq5N2l021Y5qu8MupxFyV0u52d86ShRBjWYi3/f
	kfvsN0fbbE0hrTl/6Bl4fGz/d26NdWcIFEa01rT6/+U0oMlVaBSUNeG6uyAlvx+h3dhng9A==
X-Gm-Gg: ASbGncsPL7cIRvRFpKQ5yy42lycvgxdGF7vI0vQFt5D0h5sJswVU8Qj6GDF2bL6Fsye
	fOqUH+HxwbkwAaJmgUTmXrNmAC26et4b6UNq3/EoP67VFk54IaZPfo4ldOyySCVEzbtYISlcgKi
	TZMQNEZ69wveFeHUU+w1QplCNCqXhABBoobZNBlIHho17JLB4dq9McFkly1/kECNpAjXJTIhPXu
	tdcJ8auWNkaT3i/lQkPPlm39AE1V4jnpU9yzuvLFbT1BUkMC0tS5VH6+4KyWacNMr6wSeqDjDEf
	zEFynr9taPUc38dAX4e9IzGHXUX6FUYzQOzQLYYGr93VCYlgwmlKKb4QHOr7iPulE6kiHH5TWpj
	LLIRCJbGKr+SddnHRsz3FbXV+DH0WKQtCwHC+e/1Qpu1p5qLEcD5Ojm6fsuCRTnYx4Z+yq7ebZU
	pdyW4sCNE+Q4/n6iaJIho0wUbCrws=
X-Received: by 2002:a05:600c:530e:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-47717e41487mr7111765e9.28.1761592625624;
        Mon, 27 Oct 2025 12:17:05 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF6A2ms8gZTaN5GeqRUQRthpN1XLh7Sry8dQ+oUPP7Dy1GpsfL+yHR8GnCvPgFOi8kufaaMnw==
X-Received: by 2002:a05:600c:530e:b0:475:dd9a:f791 with SMTP id 5b1f17b1804b1-47717e41487mr7111525e9.28.1761592625179;
        Mon, 27 Oct 2025 12:17:05 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-475dd4cc596sm155530485e9.15.2025.10.27.12.17.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 12:17:04 -0700 (PDT)
Message-ID: <e899be34-ba23-4769-b159-2fa85e1c1876@redhat.com>
Date: Mon, 27 Oct 2025 20:17:03 +0100
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
To: Omar Sandoval <osandov@osandov.com>,
 Israel Batista <linux@israelbatista.dev.br>
Cc: akpm@linux-foundation.org, linux-mm@kvack.org,
 linux-debuggers@vger.kernel.org
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <aP-3dauwpc-Kq5Kh@telecaster>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aP-3dauwpc-Kq5Kh@telecaster>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SvQQsmrbJrKDBWXiyff_H3_3RR309jdK7zvIWXWSCvg_1761592626
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.10.25 19:18, Omar Sandoval wrote:
> On Sun, Oct 26, 2025 at 04:22:05PM +0000, Israel Batista wrote:
>> The MEM_* constants indicating the state of the memory block are
>> currently defined as macros, meaning their definitions will be omitted
>> from the debuginfo on most kernel builds. This makes it harder for
>> debuggers to correctly map the block state at runtime, which can be
>> quite useful when analysing errors related to memory hot plugging and
>> unplugging with tools such as drgn and eBPF.
>>
>> Converting the constants to an enum will ensure the correct information
>> is emitted by the compiler and available for the debugger, without needing
>> to hard-code them into the debugger and track their changes.
>>
>> Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
>> ---
>>   include/linux/memory.h | 16 +++++++++-------
>>   1 file changed, 9 insertions(+), 7 deletions(-)
>>
>> diff --git a/include/linux/memory.h b/include/linux/memory.h
>> index ba1515160894..8feba3bfcd18 100644
>> --- a/include/linux/memory.h
>> +++ b/include/linux/memory.h
>> @@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
>>   unsigned long memory_block_size_bytes(void);
>>   int set_memory_block_size_order(unsigned int order);
>>   
>> -/* These states are exposed to userspace as text strings in sysfs */
>> -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
>> -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
>> -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
>> -#define	MEM_GOING_ONLINE	(1<<3)
>> -#define	MEM_CANCEL_ONLINE	(1<<4)
>> -#define	MEM_CANCEL_OFFLINE	(1<<5)
> 
> What kernel version is this patch based on? It doesn't apply on mainline
> because it is missing a couple of definitions added in 6.9 by commit
> c5f1e2d18909 ("mm/memory_hotplug: introduce
> MEM_PREPARE_ONLINE/MEM_FINISH_OFFLINE notifiers").
> 
>> +enum mem_states {
> 
> mem_state is very vague. enum memory_block_state might be a more
> appropriate name.

Agreed. That then nicely fits "struct memory_block".

-- 
Cheers

David / dhildenb

