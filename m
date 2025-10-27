Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 15EBE21576E
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 19:16:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761592592; cv=none; b=LodmyMcKyrutCulvlwTzr9TkW9svlTU4fmfbHix+1N1J8zEMu1rCcVXyuxnqzSKWLxTsLBKTw1BEEIy+PMWHVHBxhx1oXIDobl7PA4///GJB0Cf54CyJb9tBsv0dq3QZ2c+0o+eGXTqA+pZbzltGDTIULQeN3rIPmWMp0/8ewFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761592592; c=relaxed/simple;
	bh=EmY0yNxrJpnsrqVFbIfkOAYkAIerOa/VWQSgutaZ+Xk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=u1kpsXrAJzi3VhK3fLex1gQkshWuk9FVHTZzy9/M715tals424mTjmQ0gcoVqVlNd++O1JnE36TSNFh22nkgCDqsPr70qTOqTuCmgafpXfRKi103EaDjch4dmWdv/T8vhOopeiH/rySZ83L1qMH1x0Wk1U9pOkDVI6gUxqQYJeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E23WllTF; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E23WllTF"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761592588;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=biEqkPiWZ7skPB3ZUYN7GM347nSsM+EvIC+QGhJXhFc=;
	b=E23WllTFh4ZS0xHEMCPWRR4DK9/MfCX9UM+qQNxAN/TsBQCx9ZzzaUrfhA/573fk/ZjnGB
	trl3fgoo0lj+GXFp9WJv1RAM12c046w+ZOtyscudSujmcGqYLWejaTD1gGH7S/r/9IO7Ek
	u3zji3ccHhG6+TUKRqtaLHEuyQnD94Y=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-296-4tc2G3FxO0G1hcJsaBYB9A-1; Mon, 27 Oct 2025 15:16:27 -0400
X-MC-Unique: 4tc2G3FxO0G1hcJsaBYB9A-1
X-Mimecast-MFC-AGG-ID: 4tc2G3FxO0G1hcJsaBYB9A_1761592586
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-428566218c6so2303744f8f.0
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 12:16:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761592585; x=1762197385;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=biEqkPiWZ7skPB3ZUYN7GM347nSsM+EvIC+QGhJXhFc=;
        b=I2+pPRSPUbtzI8IYLGm63VEhXw7rgWrmrGxJgYd+qqylemEJX5+A4uliKLfar9qynt
         DNV5HH6hQqIIT5uMrhFWfUTr3goXk8u523Qh3XTgW0FJ3g7GIWQOswXx+eB3SC3gwQpG
         lSJDlxlio8jwhsDlws8d6vJnVpe03OtYCOCf1SmI0N/s1jcnc2F5jEu6XT/KVHk7gTrC
         t4X1QZ9o/dcq26ail7mOxJ+1CE+4OHK6vCYulHz/a0ymywIm2DEiQjzXVtN7UnJQ9CzT
         JUYslMBhgJeGrBK8EYNB3K377Fqq34M7gviQpvs7+oDHsxASuf43lP0JmogItDQ//Zhm
         vvlA==
X-Forwarded-Encrypted: i=1; AJvYcCWgTBS2xX+NiXdx54YFQMqs710g9s2lQam7cvqTId/2Z3kzl+xkhINhEiF5lUa90yXXzoZULGD5nSyrm7sV2sY=@vger.kernel.org
X-Gm-Message-State: AOJu0YyM01D5XcscXd/QhEdbRocXCde1uAIZtOkHGabSt0A68Y0RZamD
	geI6LsiBdfGbJUZLic8/AoYEAHl66GkVNzeVboZvJ2o3mxnpYqHw1tUEdINPYywHk9td7s2p0Ba
	7Tn9AEy7TC7oTxUNnpGqH7txsLToBtH1FBN8uN77T5TjpMH6oV+hb2PW3UxfzcQ5vB0fBTw==
X-Gm-Gg: ASbGncu2VxRY+gE+i1AWjG7pumR6mONZsOuoYFcjTEyMQqpUmxKQTYdRzl2RlkVavnh
	KavPk6rCW/yfVrMsKQ73oSkdT2yDFHe5xGr/okzmSu16aX9gu3DAxheqxDoWnVxokbn/eOG0jl/
	S6ULeVAgwd1eFQ4W/EJg+XXVZJRbqNWlTuLhbGLEBmNvv5iOw0eEWhfjxGXBVmu4C/ogyEcQtYt
	+BUPR+hZDP0SSOmQKnwVMiFoOJfYCiZIFwfaZ4EFBQu//4V89GSD92XyOX/lWbqmhyfuPrTjGt5
	0luJspIQaxqFo2BN04DBJBSPdYLfuHClf4MAWYfaLRSTgCjf1XC1ZTlLu39120+a4XHKVUPggZV
	VdLhMIus4LVqflrik7vvpifjGd7Yx/QGGu6xH7BIDAy2FEeEmFRbUbjY4++mIC98A82JmMFNqcU
	JvxDLUBtGH9C75XSwfRrUreE5R5Vc=
X-Received: by 2002:a05:6000:2282:b0:428:3be9:b465 with SMTP id ffacd0b85a97d-429a7e82d65mr735442f8f.51.1761592585239;
        Mon, 27 Oct 2025 12:16:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEAbcxPet5KDK4EyDqX4B1ENPi0b55gto2Df397tHLhHRC58HpBYcH56FL5Wv4AO4I76PFYEw==
X-Received: by 2002:a05:6000:2282:b0:428:3be9:b465 with SMTP id ffacd0b85a97d-429a7e82d65mr735425f8f.51.1761592584792;
        Mon, 27 Oct 2025 12:16:24 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df62dsm17170002f8f.45.2025.10.27.12.16.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 12:16:24 -0700 (PDT)
Message-ID: <99e795fa-ba7e-4334-98e1-c17ba8ce5e3e@redhat.com>
Date: Mon, 27 Oct 2025 20:16:23 +0100
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
To: Omar Sandoval <osandov@osandov.com>
Cc: Israel Batista <linux@israelbatista.dev.br>, akpm@linux-foundation.org,
 linux-mm@kvack.org, linux-debuggers@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>
 <aP-2x314BKks2_N9@telecaster>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <aP-2x314BKks2_N9@telecaster>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6RL8bwUgrsMFl-CHv4ZycBkoNgvAEyavNEgk9K_OqlA_1761592586
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 27.10.25 19:15, Omar Sandoval wrote:
> On Mon, Oct 27, 2025 at 10:29:15AM +0100, David Hildenbrand wrote:
>> On 26.10.25 17:22, Israel Batista wrote:
>>> The MEM_* constants indicating the state of the memory block are
>>> currently defined as macros, meaning their definitions will be omitted
>>> from the debuginfo on most kernel builds. This makes it harder for
>>> debuggers to correctly map the block state at runtime, which can be
>>> quite useful when analysing errors related to memory hot plugging and
>>> unplugging with tools such as drgn and eBPF.
>>>
>>> Converting the constants to an enum will ensure the correct information
>>> is emitted by the compiler and available for the debugger, without needing
>>> to hard-code them into the debugger and track their changes.
>>>
>>> Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
>>> ---
>>>    include/linux/memory.h | 16 +++++++++-------
>>>    1 file changed, 9 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/include/linux/memory.h b/include/linux/memory.h
>>> index ba1515160894..8feba3bfcd18 100644
>>> --- a/include/linux/memory.h
>>> +++ b/include/linux/memory.h
>>> @@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
>>>    unsigned long memory_block_size_bytes(void);
>>>    int set_memory_block_size_order(unsigned int order);
>>> -/* These states are exposed to userspace as text strings in sysfs */
>>> -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
>>> -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
>>> -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
>>> -#define	MEM_GOING_ONLINE	(1<<3)
>>> -#define	MEM_CANCEL_ONLINE	(1<<4)
>>> -#define	MEM_CANCEL_OFFLINE	(1<<5)
>>> +enum mem_states {
>>> +	/* These states are exposed to userspace as text strings in sysfs */
>>> +	MEM_ONLINE		 = (1<<0), /* exposed to userspace */
>>> +	MEM_GOING_OFFLINE	 = (1<<1), /* exposed to userspace */
>>> +	MEM_OFFLINE		 = (1<<2), /* exposed to userspace */
>>> +	MEM_GOING_ONLINE	 = (1<<3),
>>> +	MEM_CANCEL_ONLINE	 = (1<<4),
>>> +	MEM_CANCEL_OFFLINE	 = (1<<5),
>>> +};
>>>    struct memory_notify {
>>>    	unsigned long start_pfn;
>>
>> CCing Lorenzo, we recently had a discussion about such conversions.
> 
> Yeah, I've been asking people to send out these conversions as we
> encounter them in drgn, but ONLY when the absence of a value in the
> kernel debugging symbols causes actual problems for drgn. I want it to
> be clear that we're not spamming these just to cause churn. This is an
> unfortunate corner case of debug info that leaves us with no other
> option.

Well, I think we use the opportunity to clean all this further up, so 
all good :)

> 
>> The states are mutually exclusive (so no flags), so I wonder if we can just
>> drop the (1<< X) setting completely.
> 
> FWIW, putting my C standard committee hat on, there is nothing wrong
> with combining flags in an enum. 

Right.

> C11 is silent on the matter, but C23
> made this explicit. Quoting 6.7.3.3, paragraph 16: "After possible
> lvalue conversion a value of the enumerated type behaves the same as the
> value with the underlying type, in particular with all aspects of
> promotion, conversion, and arithmetic." Lorenzo may have been thinking
> of the stricter rules in C++.

Right, it was around semantics.

For example, instead of defining the flags as an enum, define the actual 
bits in an enum.

> 
> Of course, semantically, it makes more sense to use distinct values in
> cases like this where the values are not actually flags.

Right. And that's the case here, we just made it look like flags for no 
apparent reason.

So I hope we can clean this up in the same go (same patch or addon patch).

> 
>> IIRC, these values are not exposed to
>> user space, only the corresponding names are, see state_show().
>>
>>
>> Won't the compiler now complain that e.g., kcore_callback() does snot handle
>> all cases? (no default statement)
> 
> Only if the controlling expression of the switch statement actually has
> the enum type. All existing code uses unsigned long, so the compiler
> doesn't care.

Ah, indeed, inherited from the notifier_call implementation. Which 
brings us to another topic: likely we should see where we can then 
actually used this named enum.

struct memory_block -> state looks like *the* candidate ;)

-- 
Cheers

David / dhildenb

