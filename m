Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFE323126D9
	for <linux-debuggers@vger.kernel.org>; Wed, 29 Oct 2025 20:59:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761771557; cv=none; b=DNq0CsIT0m0n5NxLUM/8MtffGUT9YfYgX+efZKhZgWcG8ZT+RT+ItVN24pWh+8eB6Cix9ZPRQcZkcEnd6+K/ePWDuWGe8DeXZ78C+jyHeLgHtj3AlF6EPhcLdYtB/z2RSVgX5eNCH6gwIjSuli/0hq48+vRaP+P/09ASTnvzwFE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761771557; c=relaxed/simple;
	bh=u/xzq7RjXCM8FALxIX8FCFmtXoajiKlMwWgQB2nxmZ8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=nXRLkNv0IFVfA5AUzZFYuX6CcJVvTkUUIcnwHWHHtzbCx0akK3p+TZJ04xwPsYuT4U0/Ynj2wBWroM5fcPGFo3ehQydYLz1/odma9jT1CFY+Z/viqtc1FXI2Y67yW83FncsZwYve2abCJj4kY4xYTAiJXAIk3bW3CKE1DUvf8Lo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=udYUdv8L; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="udYUdv8L"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=uj47k14sXLy1VSzlZ3Wr6I7tnhfoNk7VxiAKYjOMT1s=; b=udYUdv8LXQ3PYBTk7DjvAbHa+X
	ZeIiCUSmUBXpdlQEQYY/94VnHRsU+5L8Ss+2AxNRErCzDdpBaC5uzTHQ1NbXwhUhrZxJzdoQI8k/q
	WCjJd9d53rjX2AWu6B6DP7V7FHkhzuEs09ypSEqTKcSaEYkbke3sdrzOpp59N8f9iM8scBH2CJPJV
	QD2dHPJQ/gLb8U71Ec1ndRX/iRdoXmbZPv27jxZq0bK+BxZkXlAJeCj4GqsHtmIAisgOmtkIAU1V9
	dH7x+LkTwlu1h/2MCGtSB3K7RNJVmylyznJ2Pi7fTxpsXBmMuZP1Nq+f0tO001YVBvin15Kn85iho
	A23xQVaA==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEDGB-00000002sii-0pWK;
	Wed, 29 Oct 2025 20:59:11 +0000
Message-ID: <4b7e1be3-6351-421f-b483-3fa433cd994f@infradead.org>
Date: Wed, 29 Oct 2025 13:59:09 -0700
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/3] mm: change type of state in struct memory_block
To: Israel Batista <linux@israelbatista.dev.br>, david@redhat.com,
 lorenzo.stoakes@oracle.com, akpm@linux-foundation.org, linux-mm@kvack.org
Cc: osandov@osandov.com, linux-debuggers@vger.kernel.org
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
 <20251029195617.2210700-3-linux@israelbatista.dev.br>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20251029195617.2210700-3-linux@israelbatista.dev.br>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 10/29/25 12:56 PM, Israel Batista wrote:
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
>  drivers/base/memory.c  | 2 +-
>  include/linux/memory.h | 2 +-
>  2 files changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/base/memory.c b/drivers/base/memory.c
> index 6d84a02cfa5d..3d17dd774947 100644
> --- a/drivers/base/memory.c
> +++ b/drivers/base/memory.c
> @@ -198,7 +198,7 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
>  		break;
>  	default:
>  		WARN_ON(1);
> -		return sysfs_emit(buf, "ERROR-UNKNOWN-%ld\n", mem->state);
> +		return sysfs_emit(buf, "ERROR-UNKNOWN-%d\n", mem->state);
>  	}
>  
>  	return sysfs_emit(buf, "%s\n", output);
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index f4e358477c6a..36d733283329 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -78,7 +78,7 @@ enum memory_block_state {
>  
>  struct memory_block {
>  	unsigned long start_section_nr;
> -	unsigned long state;		/* serialized by the dev->lock */
> +	enum memory_block_state state; /* serialized by the dev->lock */

Use a tab after the ';' please, instead of a space, to align the comments.

>  	int online_type;		/* for passing data to online routine */
>  	int nid;			/* NID for this memory block */
>  	/*

-- 
~Randy

