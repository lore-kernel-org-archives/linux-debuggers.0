Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B0B189BBB
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Jan 2025 18:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738001594; cv=none; b=SWGU8JTIZ+1jDfkVEfREvYggZShNIg5sRE0LxAO661S4R5v/xTn8lgA4xrYChX1aMyXA1mubYXjzL8SpsT/dLsIYJXIh76j7HpozJB8reVF1ouRQrKNqS5maFtd55HLnRwkra+Q9BsBR4oEwo4LN16KZ6IRVynOTmT2PppYmmF4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738001594; c=relaxed/simple;
	bh=l1eACB6VOP/K5eHnZbXpEqIFYHkMBahEyK2W7oIxoQA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sg13+PDtYQkVEdHqjw33dg8T/UCVxhnhKOX2nrA1xtvdczcCyyun0sdT4RbytlLqpcCf5k4riqTSFwe7Ugdns3AXdJdJ/osOOROFEm996D5NM//WmnMbFBGk3I3Xd65rR4KCbpN6QtaAAy8TD96ez0uu5EKTZ5PMRSPOrps1rDE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=lgpq6aZo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="lgpq6aZo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21644db9f3cso9367305ad.2
        for <linux-debuggers@vger.kernel.org>; Mon, 27 Jan 2025 10:13:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1738001592; x=1738606392; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fnLx9RRbje92P4z872lWJ7+dC+DyQSwf7FphHZKrZFY=;
        b=lgpq6aZobiZWT2kKb3aoog+uXAT2dL+QaQ0iVAeSvSKh4Ek3gWo0en0DU5SPf59vUq
         SThFzXeycmpdOblTQ9JisIukDSgo54i/eFhTkB4oMEEYUIpfzCUQtHbRfrNTXjXxq7N6
         IwDgyUnbHDNCrm/zirU18Jgp5nbGkyU4dgJ6pRkvh0ACizYYoxjUN/mi0q/ykAGyMyfn
         K2oR8QuTOsGXRi4JcanEDgInjNjwc7IReGSGPICZBb/NgBMHMYaG7OMBimzLgZ8pXkLS
         9BXXbO66Wu5SpYslpmIOgkJRyaN3XMySv6F7TV1x8h3cw2iTu0n4ZJlunVP4CTGcV3Xp
         M+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738001592; x=1738606392;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fnLx9RRbje92P4z872lWJ7+dC+DyQSwf7FphHZKrZFY=;
        b=MFgkASZwqgtKuBEGgUY/BMA6TbaCBXJoMasfgbBJEquClgKF1iSVYeKVPUmncd4gF0
         hdI/kzAyr6XUmh/7OkzvwPNiWKOmxAQh36+HQzWMOp9ST++Om5UbGlFaO1UoHV+8uK1+
         CSRT7U9bdO+3ak9j1zkGVUBe0orAxawavviebsj1ZS5TTp/j31Q4MMOdZn5NbUNhQgJ8
         v7GudkCOE1/80duE69fQUQCAYHS4Zi9XqorMk8GzPKpHtirTln28l/oi4Ap8sS1hs5CU
         kzYQt8QSkCekYFnaRi4sHXxPadfEcyFTgp48Iw507D1BMctXL60DdV/PbRvvcMvPy+S2
         Hgqw==
X-Forwarded-Encrypted: i=1; AJvYcCWL9DH4jvEHKkBj737SSDmQPiO0c5vvSuLnn6GyN4+imyRUaq/VeqUs56Bu/cO62Wfb7fHxNdtFBv+mSoF/3i4=@vger.kernel.org
X-Gm-Message-State: AOJu0YxrlElHmKVqKrXLySTEKAByKVpwb75yYYDt08UQRoVSjC6nXsNB
	jPRKdZB/u6fovuLivxqpIzKKevmmKmWrczGSvTPLm1Ch1NyKTG9av9FbkpspWOM=
X-Gm-Gg: ASbGnctyB7oNy1u/UN9UL8YGsbWp0grGw9r5Emxf49EaEH82CKeGvwiY3cKGoPh4VlJ
	y6GVGdJv95Sk2aK0e3J/yymXrcpbByoWkF50rsz7QmAooOwZRk77BahlFmG+1sfKEAYpAT5TxI7
	pVWtqaM/8OrRmPV0H158dqFicXxUA69n7XEIWoTxxQdfGseG77ZpC24oa7IKcl+7pJdb84s/R/s
	0Mxkvm8J8DoS8HjzfT03c/6ZQVSx2beWFHokBfkcmNwr5u2ZYqCxT/huQ+doAU=
X-Google-Smtp-Source: AGHT+IFWsQ1hlX3mWS9JaFfWM8KKgebPj+qlMBX9Cq6URG6Ti6gAM9WwWG9ffAHaihBdDY1n1E4/og==
X-Received: by 2002:a17:903:2449:b0:215:a3fd:61f8 with SMTP id d9443c01a7336-21c3563f1b5mr248314405ad.10.1738001591852;
        Mon, 27 Jan 2025 10:13:11 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::6:926])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414151fsm66588995ad.121.2025.01.27.10.13.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jan 2025 10:13:11 -0800 (PST)
Date: Mon, 27 Jan 2025 10:13:09 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <thomas@t-8ch.de>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>, gdb@sourceware.org,
	linux-debuggers@vger.kernel.org, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
Message-ID: <Z5fMtZOoYaV6aXwf@telecaster>
References: <8734hmtfbr.fsf@oracle.com>
 <766010fa-49a5-4e86-a730-bf79bb73e928@t-8ch.de>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <766010fa-49a5-4e86-a730-bf79bb73e928@t-8ch.de>

On Sun, Jan 26, 2025 at 07:07:47PM +0100, Thomas Weißschuh wrote:
> Hi Stephen,
> 
> On 2025-01-13 16:22:00-0800, Stephen Brennan wrote:
> > I contribute to the drgn debugger [1], and work on debugging the Linux
> > kernel a fair bit. Drgn is particularly well-suited to the Linux kernel
> > and contains a lot of support for it. It currently supports attaching to
> > live targets via Linux's /proc/kcore, and core dumps. We are looking
> > into supporting remote targets via GDB's remote protocol.
> > 
> > One piece of information that is very useful when debugging the Linux
> > kernel is the VMCOREINFO note[2]. This is a free-form piece of text
> > data, typically around 3k bytes, which contains information that
> > debuggers would find useful in interpreting a Linux kernel memory image.
> > In particular, it contains the KASLR offset, the build ID of the kernel,
> > and the OS release. With this information, a debugger could attach to
> > a live GDB stub (e.g. kgdb, or QEMU) without needing to specify
> > debuginfo file names or memory KASLR memory offsets.
> > 
> > To that end, we hope to extend the GDB remote protocol with a facility
> > that would allow the debugger to request this information. We've written
> > up an idea for this proposal at [3]. The summary is:
> > 
> >   'q linux.vmcoreinfo'
> >      Retrieves the Linux vmcoreinfo data.
> >      Reply:
> >      'Q [DATA]' data is encoded as described in the Binary Data doc [4]
> >      'E.<text>' with an informative message if the data is not available
> > 
> > However, with the candidate kgdb implementation taking shape [5], we're
> > becoming concerned regarding this design. It seems that there is an
> > implicit maximum packet size which is not described in the protocol
> > documentation. Many stubs have small(ish) shared output buffers. It
> > seems to me that data which would be 3k bytes before escaping is too
> > large. We've noticed that there is a 'qXfer' query packet which allows
> > specifying an offset and a number of bytes. Maybe it would be better for
> > us to add a new 'special data area' for the 'qXfer' message, and reuse
> > that command?
> 
> Do you need to transfer the full vmcoreinfo data?
> Wouldn't it be sufficient to only include the address/size of the
> vmcoreinfo note in memory and the debugger can read the data from there
> with regular memory access commands?
> That information is enough for QEMUs vmcoreinfo device.
> It would simplify the design and implementation(s) significantly.

Oh, that's a good idea. I guess the downside is an extra command round
trip.

QEMU and KGDB also only implement the `m` command for reading
hex-encoded memory. We'd probably want to implement the `x` command for
both since it doesn't (usually) double the transfer size.

One more caveat is that KGDB doesn't check the length passed to the `m`
command and will happily clobber memory... QEMU's gdbstub does seem to
check, and also advertises its packet size, so we probably want that in
KGDB, too.

Stephen, what do you think?
