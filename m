Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4798F4A1D
	for <linux-debuggers@vger.kernel.org>; Wed, 19 Jun 2024 06:01:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718776890; cv=none; b=GIbnAIh2SOTZNFz5ElWUTR2av7ZliqGsGzwnaYxp1WdWzyBtWbmzxUgqm7zGLmk3FiJs1kM/U2DZQGfnTcx34CwG1kLpR4qbfwgCk/Tqi2pWcVAffJJ2wwkNMYlQjlt3tbNwPX8ug6U1SODBwsQW+zuGbwEKGyKtdLFsDRm14X4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718776890; c=relaxed/simple;
	bh=Jl8XRD88vxqlgLPmsrz18MXLmbreby+TGRNVbDYd04E=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=UCopZudMycBSyP1MwnVx0eu+Y+UONp4/44QyxbL0r4UQHCE1u8wf0zf1PEFclowRS8v6N1/AVFHyC5dQDbsBHEXCm1jTN5yp4Lj6GWftHQiZ6hOGdsQDSNMjDbdx/vC8IVaVX84lxjIIL4PNOzttihfYQ0vDTAzogsGqp4MKQms=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=IW6LKAwi; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="IW6LKAwi"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1718776887;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=0Y0GtWcMX2y0zaI4VvqROSIOoPgBAf0RqtH/WOxhJiM=;
	b=IW6LKAwiXXkjpuHFFQw4Pcm+2G2cRBzqYWFdgoMChZ4mPBPUn5aOMVqU8H9gsK+IGVjCfw
	RqApveaGWx0GATD3b0dRaVCFMll/IfEyDHSdYGs4RLzREfr4iKJKEC5eIsGbunvQB/FJzT
	Re1JCH/Ln7mGPNCdq8WpK+qih2yGXes=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-515-am1EBNVHP0W4slLGvPgtow-1; Wed, 19 Jun 2024 02:01:25 -0400
X-MC-Unique: am1EBNVHP0W4slLGvPgtow-1
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-6b5093b20d9so1698326d6.2
        for <linux-debuggers@vger.kernel.org>; Tue, 18 Jun 2024 23:01:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718776885; x=1719381685;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0Y0GtWcMX2y0zaI4VvqROSIOoPgBAf0RqtH/WOxhJiM=;
        b=X8OyWsvsY8pIRiCccJVmIE935OfnenN318HhweWZVr4hIi9NNKZFHKthgD0kF54oGG
         4E4Mt7Sg2Qwyf/vDDTmRu9qTNhR8UWkkQ+0vblka4xS5mEwgdoqMnDIBN1TI6aFNZo1Q
         ffSOrf/4U39UqfkvqrX8QOAdqACVxx7Z3vyz5qno6I5K0JpS/HK5r9p2t5BzwsX2flvR
         U2N9dv8kuFHVXDaCIxBMpjBPm5ib3KKw9ijFWiMD+h3l6zhmG7j8g/uq0pE/S88mO5Rj
         jN7bRYqfpuzqOk37AamGgE1STK0tVs2knPJ1jefH4Ns/R1M6WKQ9nxAliN2qH4spdkDt
         AtJQ==
X-Forwarded-Encrypted: i=1; AJvYcCXIFiAKYeZjWRZeMXDEj+azdVY8fbUNmpwfhJiGwTbDsIUfRiPMYcTZ+3aW6k5RWMyUO3INSkG0hOwrJhnnRhUnjiBBkJ45L5MceFhf2q20
X-Gm-Message-State: AOJu0YzZYsXqLYyymZxQv1bMPz4Z2byQiaJVcg2znz8RRhAgNQzNBvbg
	V3GPEouopC0Ibxa8nOmi8yRdnoWfYVdAYjfGKc28wkQFzsm330WG7vQZP+J3wrZgextUYpOi56b
	6CYIyZfXVikmodGyHWc+ETPtgjoW6QpqBsumJR3arxhnInpSVtAF8uoSbMJAlTxG9Pk++M6N76Q
	==
X-Received: by 2002:a0c:e0c3:0:b0:6b4:fe1a:eeee with SMTP id 6a1803df08f44-6b501e9f637mr19468266d6.46.1718776884885;
        Tue, 18 Jun 2024 23:01:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHOlQPtOt/WDLisxVRRXxxBkAti9S9bN87HfHM0ed0j5B1K960SeuORXaGfkqnNFcbzBoh5bA==
X-Received: by 2002:a0c:e0c3:0:b0:6b4:fe1a:eeee with SMTP id 6a1803df08f44-6b501e9f637mr19468126d6.46.1718776884528;
        Tue, 18 Jun 2024 23:01:24 -0700 (PDT)
Received: from [192.168.0.4] (ip-109-43-178-117.web.vodafone.de. [109.43.178.117])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6b506e7525esm2400526d6.108.2024.06.18.23.01.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 18 Jun 2024 23:01:24 -0700 (PDT)
Message-ID: <431324a5-d455-464c-a4cb-1b2fc457b31b@redhat.com>
Date: Wed, 19 Jun 2024 08:01:20 +0200
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] target/ppc/arch_dump: set prstatus pid to cpuid
To: Omar Sandoval <osandov@osandov.com>, qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org, qemu-ppc@nongnu.org,
 Richard Henderson <richard.henderson@linaro.org>,
 David Hildenbrand <david@redhat.com>, Ilya Leoshkevich <iii@linux.ibm.com>,
 Nicholas Piggin <npiggin@gmail.com>,
 Daniel Henrique Barboza <danielhb413@gmail.com>,
 linux-debuggers@vger.kernel.org, QEMU Trivial <qemu-trivial@nongnu.org>
References: <cover.1718771802.git.osandov@osandov.com>
 <ac09da04c8e6dd777945219815d1c53b02291b5b.1718771802.git.osandov@osandov.com>
From: Thomas Huth <thuth@redhat.com>
Autocrypt: addr=thuth@redhat.com; keydata=
 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
In-Reply-To: <ac09da04c8e6dd777945219815d1c53b02291b5b.1718771802.git.osandov@osandov.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Language: en-US
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 19/06/2024 07.00, Omar Sandoval wrote:
> Every other architecture does this, and debuggers need it to be able to
> identify which prstatus note corresponds to which CPU.
> 
> Signed-off-by: Omar Sandoval <osandov@osandov.com>
> ---
>   target/ppc/arch_dump.c | 21 ++++++++++++---------
>   1 file changed, 12 insertions(+), 9 deletions(-)
> 
> diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
> index a8315659d9..78b4205319 100644
> --- a/target/ppc/arch_dump.c
> +++ b/target/ppc/arch_dump.c
> @@ -47,9 +47,11 @@ struct PPCUserRegStruct {
>   } QEMU_PACKED;
>   
>   struct PPCElfPrstatus {
> -    char pad1[112];
> +    char pad1[32];
> +    uint32_t pid;
> +    uint8_t pad2[76];
>       struct PPCUserRegStruct pr_reg;
> -    char pad2[40];
> +    char pad3[40];
>   } QEMU_PACKED;
>   
>   
> @@ -96,7 +98,7 @@ typedef struct NoteFuncArg {
>       DumpState *state;
>   } NoteFuncArg;
>   
> -static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       int i;
>       reg_t cr;
> @@ -109,6 +111,7 @@ static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
>   
>       prstatus = &note->contents.prstatus;
>       memset(prstatus, 0, sizeof(*prstatus));
> +    prstatus->pid = cpu_to_dump32(s, id);
>       reg = &prstatus->pr_reg;
>   
>       for (i = 0; i < 32; i++) {
> @@ -127,7 +130,7 @@ static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
>       reg->ccr = cpu_to_dump_reg(s, cr);
>   }
>   
> -static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       int i;
>       struct PPCElfFpregset  *fpregset;
> @@ -146,7 +149,7 @@ static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>       fpregset->fpscr = cpu_to_dump_reg(s, cpu->env.fpscr);
>   }
>   
> -static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       int i;
>       struct PPCElfVmxregset *vmxregset;
> @@ -178,7 +181,7 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>       vmxregset->vscr.u32[3] = cpu_to_dump32(s, ppc_get_vscr(&cpu->env));
>   }
>   
> -static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       int i;
>       struct PPCElfVsxregset *vsxregset;
> @@ -195,7 +198,7 @@ static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>       }
>   }
>   
> -static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu)
> +static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
>   {
>       struct PPCElfSperegset *speregset;
>       Note *note = &arg->note;
> @@ -211,7 +214,7 @@ static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu)
>   
>   static const struct NoteFuncDescStruct {
>       int contents_size;
> -    void (*note_contents_func)(NoteFuncArg *arg, PowerPCCPU *cpu);
> +    void (*note_contents_func)(NoteFuncArg *arg, PowerPCCPU *cpu, int id);
>   } note_func[] = {
>       {sizeof_field(Note, contents.prstatus),  ppc_write_elf_prstatus},
>       {sizeof_field(Note, contents.fpregset),  ppc_write_elf_fpregset},
> @@ -282,7 +285,7 @@ static int ppc_write_all_elf_notes(const char *note_name,
>           arg.note.hdr.n_descsz = cpu_to_dump32(s, nf->contents_size);
>           strncpy(arg.note.name, note_name, sizeof(arg.note.name));
>   
> -        (*nf->note_contents_func)(&arg, cpu);
> +        (*nf->note_contents_func)(&arg, cpu, id);
>   
>           note_size =
>               sizeof(arg.note) - sizeof(arg.note.contents) + nf->contents_size;

Reviewed-by: Thomas Huth <thuth@redhat.com>

