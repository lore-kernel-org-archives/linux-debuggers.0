Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B889133EAEF
	for <linux-debuggers@vger.kernel.org>; Tue,  4 Nov 2025 18:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762279960; cv=none; b=OCENBNeEvjegOZVnl/7zW9MTfXjut6ClqXMwYiuXZ8LZtF2uGdRaRJe6JbfW69xJ1Sfiu7GVlW1CSoGO5g3bSWjpOqiYPpmOEFDnBSGBTVLz9bb6p0gfdvdzwuf77VgJbwwFsnJ/PyoUuauh30zpI2lLcNVJCkZzqjEEdhulP6c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762279960; c=relaxed/simple;
	bh=m1uwxnIQgDEvoGlGJEV2cdGCHNy/Jt3/XLouPoDvnzE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GttEBsGrymNsyAzhlkz2Krl9oz7XNed77eBBFV/pM+7vl9IQ8hhBXOkVYSHUiErjQRd1Op985EaTbVEqUnZebzjHj9gUjrInZZ2XHHQYfVVfp5lO9BFbF3Yd07vvzkKR8fd++PO/TgOn4ONmWhbqGnuM/jOloQKZAbv2IS/mWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=0Cs2pGYv; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="0Cs2pGYv"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-7a432101882so311992b3a.3
        for <linux-debuggers@vger.kernel.org>; Tue, 04 Nov 2025 10:12:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1762279958; x=1762884758; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fXMTm+VYzAvY0dzLHfbkpTMRVQ9wHEDxxkapIdIQmk4=;
        b=0Cs2pGYvCe+TXrnys5A7s1RaIOoTeFfpuJFTfj8UdHKz5yzUx+BNmxzdTeVNyNrebx
         Iyy+ygdOjgnVvLIFuMUx2UFBg3DiUve5ObJC3nl8K4wdssDL2+b/wjy+b+yPlo8hKAab
         49AVFhjbZTxOowingm7vuIC/HXxByzOjHOZ5Rqx3bjegKxGQ2SfuXy9x7+crmla2Yx2Y
         a0PITAgVL2WAm/1sYhfALC+TLgO/zubvZzdsGKIIgW9/ZHDH5YrMn61Xt9QY5IQgPCQE
         cCDs55lGWqvJU1H0E0oTVS0SNFu4LCrnPY4eUAYV23tgw9lRHJOecLWSC7x4WuGsSyF9
         ZVPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762279958; x=1762884758;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=fXMTm+VYzAvY0dzLHfbkpTMRVQ9wHEDxxkapIdIQmk4=;
        b=U3ENIetIqd8NzpHYG5YV3pvPVOEjiuKyUpVoqwx7OVTY5x1fm5F4nFRm0OQu7xaKEr
         glGYMrcQySJkLunxB0dBOWQZgkWiZoHowwVJZ7eETd6CX9JPd7zXi1SR4K5QnCmHx6uh
         3SIPok5Drb/b+C6gOQRcLIJ96qgnHeh1O3abftt+Uc626b0sk32LPv/TTx8K6LGxnbDO
         NEl1QeOlwZ0WGNXELciFbDG0DAmUv7xtA3/GcMJrzfLzfESHobUFrdzpNYY22qVVEhPP
         hCsBJHheBf8R4aI+cMbXsMnjFBSQKqFsyVDKno7gfw9XlLB5xBx2+IFnh0CmyxZFCI7U
         Uybw==
X-Forwarded-Encrypted: i=1; AJvYcCVmkPgtkhtOSEqgYCjYlsehezqpgygS0EvxX5pX5W05Q8mZIRmEidnFD9VJsMH6b6ZKR18uTvZyN2ts78SSE4g=@vger.kernel.org
X-Gm-Message-State: AOJu0YxgtB1REHJLZiUJplz5vjA+PuyX/y4TT/UBcnBKULLqw9XfM/0y
	XmWJN3JrHeR8FSslQegS7P1oYijfr6sxI2ioPnmlKYxPeLTk3VAaWBq9ln4U673ZQEo=
X-Gm-Gg: ASbGncumYfAawjanNgcsxMT+FfW+KWsFkV+FDk1KW/XjhXSI5pP4btRAthDtG3hDaGY
	jArtPqr4703P8PuUmL57uqTJuae7M539Aks/Ig6QpJtP+B5xILHbVq3bKgEHFOPcHoABW82uwNU
	0o4jHXmF2cRriPSzzGji+Z9nRvIXxzWuracw7gYrIMHhIHjmbAGJEbq0pJIlS0IXoERXXflucrz
	RqngdB8JYTtOV+xZFozOWaLXseuLsXr56Cm6aYCYFEeKeZ7MAlzyQgpejtR2r9dRBt24g0PGQf8
	HgxlXu0ts9RCW34VMtDlDZH9enbkpkdGhBYT1eM83RZnjtf3XAU28l/ZELcVCl5Cx5xknFPmxmw
	PWuHlkjVGn22rlyclir/bdAM6e4kY3Qt7wlrickXOc3GucZjEPuCtVWn4sg==
X-Google-Smtp-Source: AGHT+IEfMevdEiMdqDvcfkgPhov93sowDZtb/5DAGljcPm4WdOYVS1DF54t90hQB/DDdvYdf8wD0vg==
X-Received: by 2002:a05:6a20:12c3:b0:342:8c38:ed0 with SMTP id adf61e73a8af0-34f87106a7cmr92855637.8.1762279958021;
        Tue, 04 Nov 2025 10:12:38 -0800 (PST)
Received: from telecaster ([2620:10d:c090:400::5:5bc5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f87a6155sm3008088a12.29.2025.11.04.10.12.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 10:12:37 -0800 (PST)
Date: Tue, 4 Nov 2025 10:12:35 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-kbuild@vger.kernel.org, nathan@kernel.org,
	dimitri.ledkov@surgut.co.uk
Cc: Samir M <samir@linux.ibm.com>, linux-kernel@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	linuxppc-dev@lists.ozlabs.org, stable@vger.kernel.org,
	Venkat Rao Bagalkote <venkat88@linux.ibm.com>,
	linux-debuggers@vger.kernel.org
Subject: Re: [mainline]Error while running make modules_install command
Message-ID: <aQpCE_XTU-bZHFbk@telecaster>
References: <7fef7507-ad64-4e51-9bb8-c9fb6532e51e@linux.ibm.com>
 <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <56905387-ec43-4f89-9146-0db6889e46ab@linux.ibm.com>

On Tue, Nov 04, 2025 at 04:54:38PM +0530, Venkat Rao Bagalkote wrote:
> 
> On 04/11/25 4:47 pm, Samir M wrote:
> > Hello,
> > 
> > 
> > I am observing below error while running the make modules_install
> > command on latest mainline kernel on IBM Power11 server.
> > 
> > 
> > Error:
> > DEPMOD  /lib/modules/6.18.0-rc4 depmod: ERROR: kmod_builtin_iter_next:
> > unexpected string without modname prefix
> > 
> 
> IBM CI has also reported this error.
> 
> 
> Error:
> 
> 
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
>   INSTALL /boot
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
> depmod: ERROR: kmod_builtin_iter_next: unexpected string without modname
> prefix
> 
> 
> Git bisect is pointing to below commit as first bad commit.
> 
> 
> d50f21091358b2b29dc06c2061106cdb0f030d03 is the first bad commit
> commit d50f21091358b2b29dc06c2061106cdb0f030d03
> Author: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
> Date:   Sun Oct 26 20:21:00 2025 +0000
> 
>     kbuild: align modinfo section for Secureboot Authenticode EDK2 compat
> 
>     Previously linker scripts would always generate vmlinuz that has
> sections
>     aligned. And thus padded (correct Authenticode calculation) and unpadded
>     calculation would be same. As in https://github.com/rhboot/pesign
> userspace
>     tool would produce the same authenticode digest for both of the
> following
>     commands:
> 
>         pesign --padding --hash --in ./arch/x86_64/boot/bzImage
>         pesign --nopadding --hash --in ./arch/x86_64/boot/bzImage
> 
>     The commit 3e86e4d74c04 ("kbuild: keep .modinfo section in
>     vmlinux.unstripped") added .modinfo section of variable length.
> Depending
>     on kernel configuration it may or may not be aligned.
> 
>     All userspace signing tooling correctly pads such section to calculation
>     spec compliant authenticode digest.
> 
>     However, if bzImage is not further processed and is attempted to be
> loaded
>     directly by EDK2 firmware, it calculates unpadded Authenticode digest
> and
>     fails to correct accept/reject such kernel builds even when propoer
>     Authenticode values are enrolled in db/dbx. One can say EDK2 requires
>     aligned/padded kernels in Secureboot.
> 
>     Thus add ALIGN(8) to the .modinfo section, to esure kernels irrespective
> of
>     modinfo contents can be loaded by all existing EDK2 firmware builds.
> 
>     Fixes: 3e86e4d74c04 ("kbuild: keep .modinfo section in
> vmlinux.unstripped")
>     Cc: stable@vger.kernel.org
>     Signed-off-by: Dimitri John Ledkov <dimitri.ledkov@surgut.co.uk>
>     Link:
> https://patch.msgid.link/20251026202100.679989-1-dimitri.ledkov@surgut.co.uk
>     Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> 
>  include/asm-generic/vmlinux.lds.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

drgn's CI hit this same failure. FWIW, the commit fixed by this bisected
commit, 3e86e4d74c04 ("kbuild: keep .modinfo section in
vmlinux.unstripped"), also results in ELF segments of size 0 in vmlinux
for some configurations, which confused drgn until I added a workaround
(https://github.com/osandov/drgn/commit/2a9053de8796af866fd720a3c8c23013595d391a).
So there's some funkiness in this area.

Thanks,
Omar
