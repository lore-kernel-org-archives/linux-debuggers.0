Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96DB714387C
	for <linux-debuggers@vger.kernel.org>; Thu, 20 Jun 2024 23:34:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718926461; cv=none; b=sVP7oO2ycjoqVkrZ8BJ8GGk+Jx+Pl+p0s3mQShjaKqAEHadTg242J+QhNQZO2bJpwdXDp4g1dHMXxF4Pa6mT8FpWxpG+AYIGxDMZWWOEBpFIdM5FbEV8GkSKuxcUoE+xLV2WI7TUorA14RCQRwp2nyJ5YafR7RoJ3IcR9XLvszg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718926461; c=relaxed/simple;
	bh=sM0wDBCUvzFW6IKmAWX5aMLcRpg1A5LDTG15Z5q384E=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=op3QmaH7qfuP0m1zVHBwPT45xtTiduyp1JHKRnsdKOEgAqDnWJ3tjfZ2AYqSyBs6zq1jQ7hr99ofdghWaSV5MEk0lk7FpFAqxPdpP1wDRfe/HlDhZEOqytkAmyPkSM8gWXDRU6evSXm8JyqBQrZcGeiEz9MKprR2kyDOcoaX0o0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=0j6Yq+0Q; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="0j6Yq+0Q"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1f9b523a15cso11326405ad.0
        for <linux-debuggers@vger.kernel.org>; Thu, 20 Jun 2024 16:34:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1718926458; x=1719531258; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D82mbCQ1hFRo0hz6PNhbEMszTiXYVNT0XyGJhGQyIO8=;
        b=0j6Yq+0Q9AfR89+BtbvknfZCCBac8DTYIXO9FBKOlh8aXgtv4J84oLPLAL6RiuwVrK
         TDYFRlz8VE/CxPpoL4ZdZtVsnm0bE/uLxgxl7HfECGLeaJMqQumM3DP/Vc1IEXLoanJO
         eAK7Arl452VRsYpizqC+lvOpDZW/A+I7vbS8VGE/MHgWiMGuBbht71BhnzZ1f/fGNPnR
         LjRRCmoqNUrlGRBs94IbHRKsx3bHDe+jayAkG8A1g+POzr1xK2Xqas3ACg6gsqxyXugT
         lRhGaQlAe31wrz1+PVkr3+oQ0xZ+MEFVXe7wtJG/euVxOoLRnMCM+b6sQGU6JhD4Z2jt
         6HgA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718926458; x=1719531258;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=D82mbCQ1hFRo0hz6PNhbEMszTiXYVNT0XyGJhGQyIO8=;
        b=WPgQlJRbxrcd9JMGF5MHuVAgH4wWC3pqZqzdUB/QPLsB4UcPrU5Fed1INK2vGR9Wjt
         FuXcbad04+P6Y0iEvzvDt1maKbOVoxiuUwV598hYYv3E5flKyQTdXTmzE/vFcoUhi/oD
         RVoJoGCYyWvsT9/LtGD7S5iNP45Dhvwo/naJYymWHezv9WXHfZnBk+97CDidWdZxnDTU
         kQOhtfI3nuWQS4CKJMoY3IAlcVhuf6K7p9e4XWkUdhavHC/PUwrdeUQJS+k94SE6BYoQ
         Z3XAHW9vZUAut0nnuFjHH4CP0FCAaudkOjHdrhNfC9/ZLxcuMtehqpfv5/3yhJTXd9Zh
         D/sA==
X-Forwarded-Encrypted: i=1; AJvYcCUzy6+J+y+EU8o5WNyrnge6rrzQS66xoJrOAVXqCY5phCkd7L6xUDPJhUJcRVADw4czWdC3E3SdZ0HEv/lXkP6iRd6qbkUf73sP+CxXfvAr
X-Gm-Message-State: AOJu0YwI1s7pcQwocCH6IcXOGlzInoOCzpAWSh6LCMcUpIKxlRqHgR/z
	XxJiX1VtZ1c3rKOHgupOtGdcYhqcowo4TsqFwNmagpHq3MK/xcOWlNXBTOS/qzU=
X-Google-Smtp-Source: AGHT+IFYE8udYTsdUs/CYZbmfGTH1vYJWVb2BSRDHy77cnmwp15gQEA40iJRHfm6QOtynyXzbnzLpQ==
X-Received: by 2002:a17:902:ce05:b0:1f9:b19c:2e3b with SMTP id d9443c01a7336-1f9b19c2f2fmr91153975ad.15.1718926457795;
        Thu, 20 Jun 2024 16:34:17 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:500::4:ecba])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1f9eb2f134bsm1761765ad.34.2024.06.20.16.34.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 20 Jun 2024 16:34:17 -0700 (PDT)
Date: Thu, 20 Jun 2024 16:34:15 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Alexander Gordeev <agordeev@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>
Cc: linux-s390@vger.kernel.org, linux-debuggers@vger.kernel.org
Subject: Incorrect vmcoreinfo KERNELOFFSET after "s390/boot: Rework
 deployment of the kernel image"
Message-ID: <ZnS8dycxhtXBZVky@telecaster.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, Alexander and Sven,

I just got around to testing drgn on s390x on 6.10-rc4, and it appears
to be broken. I bisected it to commit 56b1069c40c7 ("s390/boot: Rework
deployment of the kernel image") and narrowed it down to an issue with
the KERNELOFFSET value reported in vmcoreinfo.

On my test kernel, the ELF symbol for init_task is 0xc96f00:

  $ eu-readelf -s build/vmtest/s390x/kernel-6.10.0-rc4-vmtest30.1default/build/vmlinux | grep ' init_task$'
  72273: 0000000000c96f00   4352 OBJECT  GLOBAL DEFAULT       18 init_task

And the address in the loaded kernel is 0x3ffffeaaf00:

  # grep ' init_task$' /proc/kallsyms
  000003ffffeaaf00 D init_task

0x3ffffeaaf00 - 0xc96f00 is 0x3ffff214000

However, this doesn't match the value of KERNELOFFSET in vmcoreinfo:

  # eu-readelf -n /proc/kcore | grep KERNELOFFSET
    KERNELOFFSET=3ffff314000

It's off by 0x100000. This causes drgn to compute the wrong addresses
for all global variables.

For context, I'm testing using QEMU emulation on an x86-64 host. Note
that it logs "KASLR disabled: CPU has no PRNG" early during boot. My
exact setup is:

  $ git clone https://github.com/osandov/drgn.git
  $ cd drgn
  $ python3 -m vmtest.rootfsbuild -a s390x --build-drgn
  $ python3 -m vmtest.vm -k 's390x:6.10.*' bash -i
  # python3 -m drgn
  >>> prog['init_task'].comm
  (char [16])""

That should be printing "swapper/0".

Any ideas what's going on here?

Thanks!
Omar
