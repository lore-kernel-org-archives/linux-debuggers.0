Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87F9458AD0
	for <linux-debuggers@vger.kernel.org>; Wed, 19 Jun 2024 05:57:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718776680; cv=none; b=fZdKTjTb2hXJ0HtuS8WVi5MFw5he9Jsie95CJn/UfzX1T6xLYZZaPC2SUOY/4JEgXlpKhs+n5Su3uGNbUQDznDbKctt0b6M/od40DHfSIcaIkillzFvCDapocf8NBmgRBXjYvJq6kvVnfWx4E3B0gZIspiRVvQTi6E1qu86ShvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718776680; c=relaxed/simple;
	bh=D/tidrx9NC8axcIL/4IrK2ajJwo2q+ydwt9xjH2w4G0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r+5xvpwL15FjJk1GLf3FUd6HfNEJWXBh3Fp/ZR9wdL5PPd+MCIl/te8iBGuhLyCkhBnhYZNtJsoYutlDtoNFJ1yhqINm9uttfYe8+dfDbhWcmd51JjI8zjDbrzm4EPwrjwhRl4OTxVJr+dZa2QTqo8I+oimylVwbvG4FGW5MK+U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=SRVswsTZ; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="SRVswsTZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718776677;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=BW0f/jx+kDhhZS2H6o9qj2psvjx8/jWoOCoGT7/QvAg=;
	b=SRVswsTZhjSzHQNp4URrPgJ0flp17yG10BUXlhM9iE7hlhFgPi6bsnApwrzk3t7IfPNv+3
	uVii3A/B05WxT3PWxBQT0qrXwrUJhe5PnbLOlDQgf4NzXsAmcGclomi1QoQ+xYcPJl0gkR
	sAkmRZdOTxo7bBMT0toW7DBPuH3sl8E=
Received: from mail-yw1-f199.google.com (mail-yw1-f199.google.com
 [209.85.128.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-130-UdjMlNXUNV61vPiQfx0WEA-1; Wed, 19 Jun 2024 01:57:55 -0400
X-MC-Unique: UdjMlNXUNV61vPiQfx0WEA-1
Received: by mail-yw1-f199.google.com with SMTP id 00721157ae682-631b498f981so96834907b3.0
        for <linux-debuggers@vger.kernel.org>; Tue, 18 Jun 2024 22:57:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718776675; x=1719381475;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BW0f/jx+kDhhZS2H6o9qj2psvjx8/jWoOCoGT7/QvAg=;
        b=kkjKVWapeH/dftBAj9m8A0kfrC1Pon8+4zQohLSpinZ3gFndQ8P7QZwNoVp4deZVSR
         YiTyx8RpxAKz3er3K4C9sHcTNuC/1uajmzrG7gN7Cx7mUmWsvuPoqmBw+GlvTWzgkCpy
         RyyOBKf+QN7zaGgPVLjCg/WnSu0YaAf2fRyrGikCoyuM/a5CBlFM3M/TxZcyexDWgZSQ
         cjevjwJ1alMxGShM2wbl/kTeqNTbYy5/Q6Vmx9zwEwlwNVBKt5wGqw5/J1zbZ+d8lgZt
         6t/Fgt8MIINgF7H2Rl0PL4xaSx2mnZrptKNdqYQIZjFxGpYrkySWVpE+tDpYq8fKaq8w
         PqFw==
X-Forwarded-Encrypted: i=1; AJvYcCXmwsPsW0yvBnOk6M51uxtXyUjK/qHRg2/hAXEcCnoRpcBiFlyHQrDjXXjvJ2cVYGrv55l+qMxF721NQyKN7WoOhr4A2cd7lh0sH6WJ8kqo
X-Gm-Message-State: AOJu0YzxcxhosO8J5ElEnjFLvh6ffFDpHt5raGQFWrrhv0gicV5tqrnI
	+xKfc8q2rpNgW4BmIlU/zVSejqkgBesmcqhkd4zTMsBS7LJxGsEEsyqleq6QJAd2ETstU7G7ZhH
	kX5FnCqthFRTK0PWrl9idsjvuTTA/vKSKhuzJO/GBK6b93VIjwIKJhzv+nD3DXlXaKA==
X-Received: by 2002:a81:9e0d:0:b0:62c:c65d:8d1c with SMTP id 00721157ae682-63a8faf2eb6mr15316027b3.52.1718776675039;
        Tue, 18 Jun 2024 22:57:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFfdXU3DmXCfiJkGoBKT2c7MqL3WPW2xtqGkz9n54NjK9uaNzQI9DAZdpp0JE6Pq0XV+lOz+w==
X-Received: by 2002:a81:9e0d:0:b0:62c:c65d:8d1c with SMTP id 00721157ae682-63a8faf2eb6mr15315857b3.52.1718776674643;
        Tue, 18 Jun 2024 22:57:54 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de. [109.43.178.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b2a5ef497esm73881606d6.124.2024.06.18.22.57.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 22:57:54 -0700 (PDT)
Message-ID: <4687c59a-1427-4215-a58d-cb84dd27f9ff@redhat.com>
Date: Wed, 19 Jun 2024 07:57:49 +0200
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] target/s390x/arch_dump: use correct byte order for
 pid
To: Omar Sandoval <osandov@osandov.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 linux-debuggers@vger.kernel.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <cover.1718771802.git.osandov@osandov.com>
 <5929f76d536d355afd04af51bf293695a1065118.1718771802.git.osandov@osandov.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <5929f76d536d355afd04af51bf293695a1065118.1718771802.git.osandov@osandov.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2024 07.00, Omar Sandoval wrote:
> The pid field of prstatus needs to be big endian like all of the other
> fields.
> 
> Fixes: f738f296eaae ("s390x/arch_dump: pass cpuid into notes sections")
> Signed-off-by: Omar Sandoval <osandov@osandov.com>
> ---
>   target/s390x/arch_dump.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
> index 7e8a1b4fc0..029d91d93a 100644
> --- a/target/s390x/arch_dump.c
> +++ b/target/s390x/arch_dump.c
> @@ -102,7 +102,7 @@ static void s390x_write_elf64_prstatus(Note *note, S390CPU *cpu, int id)
>           regs->acrs[i] = cpu_to_be32(cpu->env.aregs[i]);
>           regs->gprs[i] = cpu_to_be64(cpu->env.regs[i]);
>       }
> -    note->contents.prstatus.pid = id;
> +    note->contents.prstatus.pid = cpu_to_be32(id);
>   }
>   
>   static void s390x_write_elf64_fpregset(Note *note, S390CPU *cpu, int id)

Reviewed-by: Thomas Huth <thuth@redhat.com>

