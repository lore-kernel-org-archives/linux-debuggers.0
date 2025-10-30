Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80A1B2E8E0B
	for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 11:32:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761823961; cv=none; b=VeAuwqOiSYGXf6SV3Av6WAQ+dpKcwzo8bJjDUGUwCv9CvolABpq7M1eUsZv27yqBzfxz2AKNgDMx0cNsrPlHNORw4Erev1gqFbdoAzrXYg/TJO0YmtIEqk07mUq6QXqmgo3t8WEFH4g3ANCPKRJxFPTIcJYy+0TNaRo1Okc/82g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761823961; c=relaxed/simple;
	bh=OXKbWENWl1YD+44q/rUMq5UxBNAzjmFRBgMMj86eyaY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P0d2QbzBTyws8RPiXRJZItgpcZYUhqcJBeBTvv4avtNPXx65qk/RJvAAO3ogQEpHg5BUukt6hayu5gneMl11c7vC0omYRzKIbfkuM6wr4cE2yMzZfFDQQkH9tu+fwO91r4TKpRkxMVIggwftg/ZWn6+15sCsRTjYRUjMRVp871w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JWtwWSHH; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JWtwWSHH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761823958;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=syt4FTvtbdwiswAZ/fDirrMVwTV5UaIUqPiBthAi08Q=;
	b=JWtwWSHHtf+q+UpvLqGn0vChzg0Q/76yh6d/oIfzVa3upIvmzGgpVQSaNASo1l8NVjs5DA
	WCE5NH6/D5GeAJnKI0cOuUPR2aeRoFdKU3L/kd66K0mzfFQ0uuni3ndMm4VmkgX6GNyuPM
	tPAfncvcLdTmQOeTrHiZQq+ZMudQJ0Q=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-159-uzvTpuemMMW3qlyVZvs80w-1; Thu, 30 Oct 2025 07:32:37 -0400
X-MC-Unique: uzvTpuemMMW3qlyVZvs80w-1
X-Mimecast-MFC-AGG-ID: uzvTpuemMMW3qlyVZvs80w_1761823956
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4278c82dce6so546768f8f.3
        for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 04:32:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761823956; x=1762428756;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=syt4FTvtbdwiswAZ/fDirrMVwTV5UaIUqPiBthAi08Q=;
        b=LdIX2eGtQxam6s9QcnSak/gZ+MdmSgzwJsO6HqnLIKBARsN8Jpei7DHZpZ4OoBTiAH
         La1ZiaFs3ajkQSvhlwYqK1hFCS3qfjalM8ODq+fPeJK8rwIoz4sMxhaoIWkBJ2hO8hp2
         uz+6Qnxdvs9gUKEHRgFet4PwSEeJ3u4bRG5phpqhOYhYtwfbxoDs5IWXfH0hCa9S+bSh
         90PDmjXS03jmzsEkzhL2UXRDUJAFsP/13u28xARFgzCJ3W8g9GOGgV1csAn635QeJll0
         mPTcHv1zghJzZifKLiHtYH0vJTi+5x5YCUXoxtwE0fnK8Tn8nyKulqinpCxW17JBd1hQ
         QeRg==
X-Forwarded-Encrypted: i=1; AJvYcCVwxvFfDeffBq1O7mGx8DXvWPLIPdjz0LELhb9SGTysDlTgWKXL9rU5kF1f29ne5rQX+422XIWI3hUQ/1SHl1s=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUvCv1kpvUo5HHskkeo3eCq/Jq0xoqgt2EnnhPCumEy9wRfkGY
	Ju3zfCW0F1aGQB9F8jjXxiN5rcL329oegZ62tM7yHcS7yrVpj2Nj1gLXl5CPcn2wcOJ+aNcetuT
	YTcsYBosA/rW0CtSAMWgY/844BdImWr8I9B09UJewsyJF2deX0G6irFC/DOqSx6lcJLwbuA==
X-Gm-Gg: ASbGnctk8cm4gIxLfICecoR8fx5sUtILaiGBiBDXR1+T+g/e/O7NrbpfssG9Ev3/hm7
	p2rOsLNVzghCm3r7awryEwoFZm0YZO8LrZ1KaqMk+ln1HWA1t4pnj8PxYd8e3t0M9r7r6lPTWb1
	rGOD8Xon3SP+j1UzqrpsHK1+B2Nq7KapQIHeWr3BC8tAa2dq4aVimXQ9+wP5l1EYusRt9d/16gS
	iXG4DIascHVByDSRDHRMK0JM5i5MbQEnvyAzyf+4/hMW0gUQDUaqdRtfEYNrBMpugY859m2ESbp
	xosDE++cjQDUTAB+UaaS+iKV5ljBICxk3UkE7OCiTeesGYymVsTv08G4cEaqiIDpDaMAMxKIcoK
	/RIxPTq73rnX1tBfPpKPx6M5BDpdfBVgcCGFvsjL3MF1l33bWPp/i8FVEw7TLm5SYq+m2IP88q8
	avMWmEu/+x6sJxuIeyan8HoeRMqtU=
X-Received: by 2002:a5d:5f84:0:b0:427:490:68d2 with SMTP id ffacd0b85a97d-429aef77885mr5304852f8f.10.1761823955801;
        Thu, 30 Oct 2025 04:32:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEDnTvQ9OrjFxRFD1/geNzCwFgc9KwHnl7pB3XSjGFmYobltgmRk2xkTvmuOYysl1iukCDRuA==
X-Received: by 2002:a5d:5f84:0:b0:427:490:68d2 with SMTP id ffacd0b85a97d-429aef77885mr5304818f8f.10.1761823955337;
        Thu, 30 Oct 2025 04:32:35 -0700 (PDT)
Received: from ?IPV6:2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169? (p200300d82f3f4b00ee138c225cc5d169.dip0.t-ipconnect.de. [2003:d8:2f3f:4b00:ee13:8c22:5cc5:d169])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-429952df3c7sm31046327f8f.40.2025.10.30.04.32.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Oct 2025 04:32:34 -0700 (PDT)
Message-ID: <b40f638e-dbe9-48b1-a431-b3ba10c893a9@redhat.com>
Date: Thu, 30 Oct 2025 12:32:31 +0100
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm: change type of state in struct memory_block
To: Israel Batista <linux@israelbatista.dev.br>, lorenzo.stoakes@oracle.com,
 akpm@linux-foundation.org, linux-mm@kvack.org
Cc: osandov@osandov.com, linux-debuggers@vger.kernel.org
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
 <20251029195617.2210700-3-linux@israelbatista.dev.br>
From: David Hildenbrand <david@redhat.com>
Autocrypt: addr=david@redhat.com; keydata=
 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
 qIws/H2t
In-Reply-To: <20251029195617.2210700-3-linux@israelbatista.dev.br>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: D4OaAweRA0MrSnGBbHRmoVFFK8_1Q4xJI9fpNc5JU5I_1761823956
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 29.10.25 20:56, Israel Batista wrote:
> The state of a memory block should be restricted to values specified
> in the documentation of the memory hotplug API. However, since the
> state field in the memory_block struct was defined as an unsigned
> long, this restriction was not enforced at compile time.
> 
> With the introduction of the enum memory_block_state, it is now possible
> to incorporate the desired semantics in the field declaration and
> enforce these restrictions at compile time.
> 
> Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
> ---
>   drivers/base/memory.c  | 2 +-
>   include/linux/memory.h | 2 +-
>   2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 6d84a02cfa5d..3d17dd774947 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -198,7 +198,7 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
>   		break;
>   	default:
>   		WARN_ON(1);
> -		return sysfs_emit(buf, "ERROR-UNKNOWN-%ld\n", mem->state);
> +		return sysfs_emit(buf, "ERROR-UNKNOWN-%d\n", mem->state);
>   	}
>   
>   	return sysfs_emit(buf, "%s\n", output);
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index f4e358477c6a..36d733283329 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -78,7 +78,7 @@ enum memory_block_state {
>   
>   struct memory_block {
>   	unsigned long start_section_nr;
> -	unsigned long state;		/* serialized by the dev->lock */
> +	enum memory_block_state state; /* serialized by the dev->lock */
>   	int online_type;		/* for passing data to online routine */
>   	int nid;			/* NID for this memory block */
>   	/*

With comment alignment fixed

Acked-by: David Hildenbrand <david@redhat.com>

-- 
Cheers

David / dhildenb

