Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B71B2E5418
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 09:29:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761557365; cv=none; b=u6T4V/3rCSWM70uf8cOLm/7KxgkK1tm8KtQTOQWguAs3KxAg/ik4DlalikTOPyN4bsFgNCucch34CIIVNRwbhnE+ia6HB/78S8i3VT4MPCnvhSXW//BX8/mCI/UvGdbYLmXrXSNHvtiVGj9MZQVSuc7zYAI5poYr8Z6+VwghVw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761557365; c=relaxed/simple;
	bh=6LVKuCRMBj9JizvQ3mhlkbwt9+fUtuWKktKfVnk8HLs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Eb1mCTY51VAPgBkME2j9CZr+fuTvYfUzy0iqeT1USkaXvK5sQYOWDqCMLcS2xMxKj63KNiu6IwW7AipJRMbjDdgUb45P18JBHhNnezMMmg0TGtzBRtLyM4OoSWOxKNbPOl2FqRbpf48Mk4SBBgaZJQnRK/c0QycaQpbVbpOCGZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KnjnX0i3; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KnjnX0i3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761557362;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=jl/dK5oSynHQvdUuuR4Mz7gZbj0+FmaCnU04jPDI/7g=;
	b=KnjnX0i3duky/AZCXSbTzV7M7NEvouBXHsuJzHTLrJ+hslxg8FiFX3SxZuNaPCQIa/mc+q
	XOxjsWBsGLAP8CSP1j/wpNt239ZwtY0mcTm0/A5InQhdA8TQvQoEuJ9AH+1KI1oYpH+sty
	/FR56F+a/JJacMbph4EGO3XQtITWsyI=
Received: from mail-lf1-f72.google.com (mail-lf1-f72.google.com
 [209.85.167.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-282-mlQuNiZRM7-WcK-EXbOzwg-1; Mon, 27 Oct 2025 05:29:20 -0400
X-MC-Unique: mlQuNiZRM7-WcK-EXbOzwg-1
X-Mimecast-MFC-AGG-ID: mlQuNiZRM7-WcK-EXbOzwg_1761557359
Received: by mail-lf1-f72.google.com with SMTP id 2adb3069b0e04-592f3372a35so2070778e87.2
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 02:29:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761557359; x=1762162159;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jl/dK5oSynHQvdUuuR4Mz7gZbj0+FmaCnU04jPDI/7g=;
        b=dR06iZRDtF0OcwUxF8AiCKpBKSAec22RdR9PgGLk12jCxfymximgoswGPTRrasK7R5
         2OjGpf3VY6D1toEaUnxYYWrKvtDyAXVIPDH3dZq9u8wIxkgU2RCuD5Di9HKsOcRbGaEe
         CqwY4iKnWGHuZAmcj/Dm1m4tqx+AcnHbm+eloyCkHwrzWk01Ld3MV+HvTW+ofnZGvJbM
         lJGF7kPAkr8zzgiYLVnXve0sOOZZ0Gwk91Strsw6dgpgptj++ISs1/ukBXl/lx88gdqr
         Zw9Yw4PhXoJNBverZIG+4dHtgw8A2cosV4SD5rA+BbZ3eib99U7qtYdgGCNPBQVpMI8u
         g2eQ==
X-Gm-Message-State: AOJu0Yz5gXV2OyioG36gpkGqXn/Wbw10aUK/uzNNTswV7/8oErUTyNiH
	bztKn10PxMGf2xlVEnOdVU5WtVmZu2J0gv+/Xg3FqLajts3Sbg8hP3ELdQ+Qnh1gT9z+ijqjJwB
	oMYS9TXd4PX+rAC7cNhwO77u28DGMeQNwcb6/jua3BZnqlmPIDEGV5TGcgnPCGXbIWE9qtQ==
X-Gm-Gg: ASbGnctB8ny/BxS1C0ow6m473ePll38QkyUcNk/+TYRSlpxZPrHX+RV1GpdyK4LLi+4
	4Hpa60eMhjrXBtPoGCpI51H3WooJuRH2dskr9Up0u9Pc2gW+W+h+NSq1OxUk8GLmzuUsPkhvm3D
	2U1HEAou1FCrinO89CmRyG3PJx6L9PEJLqvltRi/Kr0nWTotgYrsgCkz64N+lGXmG5EmwRbMk5w
	RV1Xu73PsPmpkl2GUDpSoSmC5D5o5gGm0F2wOXN4epAjtID1FW5b/HCg05okHBwnAx9goLLondH
	HjEuwZnpf9QWqkTmg/4rfDW2wWYHO+uM9gT2QdZtI1afnfej5vI80gE0KFvGGa1VKVW9ZMi1lRh
	HPgaczMeLsQezh8qydar0F9HieU0T/am3tK9bMDX8wocxIrHr4pM4dyGskZdm3Q88XtbgkDzawc
	r6bFL5zk3Hs0ECR49MoCKCawMnwuM=
X-Received: by 2002:a05:6512:b97:b0:591:c2f8:9a5a with SMTP id 2adb3069b0e04-592f5a597bbmr4225775e87.35.1761557358911;
        Mon, 27 Oct 2025 02:29:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeFOAW1hrpbsW0eQlRbjQxJr+vhA/fG2pz5sBmADxwmWW7wq6SVBBMIi1ckQnF6/ww/Geqxg==
X-Received: by 2002:a05:6512:b97:b0:591:c2f8:9a5a with SMTP id 2adb3069b0e04-592f5a597bbmr4225749e87.35.1761557358143;
        Mon, 27 Oct 2025 02:29:18 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-59301f5fc75sm2135864e87.59.2025.10.27.02.29.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Oct 2025 02:29:17 -0700 (PDT)
Message-ID: <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>
Date: Mon, 27 Oct 2025 10:29:15 +0100
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
To: Israel Batista <linux@israelbatista.dev.br>, akpm@linux-foundation.org,
 linux-mm@kvack.org
Cc: linux-debuggers@vger.kernel.org,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251026162156.12141-1-linux@israelbatista.dev.br>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4HqDzVT0Oy27vAQJLmQdoMCZvVgpVATI8qoIiCFxwkI_1761557359
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 26.10.25 17:22, Israel Batista wrote:
> The MEM_* constants indicating the state of the memory block are
> currently defined as macros, meaning their definitions will be omitted
> from the debuginfo on most kernel builds. This makes it harder for
> debuggers to correctly map the block state at runtime, which can be
> quite useful when analysing errors related to memory hot plugging and
> unplugging with tools such as drgn and eBPF.
> 
> Converting the constants to an enum will ensure the correct information
> is emitted by the compiler and available for the debugger, without needing
> to hard-code them into the debugger and track their changes.
> 
> Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
> ---
>   include/linux/memory.h | 16 +++++++++-------
>   1 file changed, 9 insertions(+), 7 deletions(-)
> 
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index ba1515160894..8feba3bfcd18 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
>   unsigned long memory_block_size_bytes(void);
>   int set_memory_block_size_order(unsigned int order);
>   
> -/* These states are exposed to userspace as text strings in sysfs */
> -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
> -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
> -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
> -#define	MEM_GOING_ONLINE	(1<<3)
> -#define	MEM_CANCEL_ONLINE	(1<<4)
> -#define	MEM_CANCEL_OFFLINE	(1<<5)
> +enum mem_states {
> +	/* These states are exposed to userspace as text strings in sysfs */
> +	MEM_ONLINE		 = (1<<0), /* exposed to userspace */
> +	MEM_GOING_OFFLINE	 = (1<<1), /* exposed to userspace */
> +	MEM_OFFLINE		 = (1<<2), /* exposed to userspace */
> +	MEM_GOING_ONLINE	 = (1<<3),
> +	MEM_CANCEL_ONLINE	 = (1<<4),
> +	MEM_CANCEL_OFFLINE	 = (1<<5),
> +};
>   
>   struct memory_notify {
>   	unsigned long start_pfn;

CCing Lorenzo, we recently had a discussion about such conversions.

The states are mutually exclusive (so no flags), so I wonder if we can 
just drop the (1<< X) setting completely. IIRC, these values are not 
exposed to user space, only the corresponding names are, see state_show().


Won't the compiler now complain that e.g., kcore_callback() does snot 
handle all cases? (no default statement)

-- 
Cheers

David / dhildenb

