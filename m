Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792432383;
	b=5QUijeiBSoxYZJnmUlwUQtVYJ7ZHt+wNqISMEo7u8B2upPHnG1VMpkFqzz3yrUXtWjdn
	 iz9BFM8MyPCXud/saFfuX8vEnbti8xOAaOEuayT/JEosv6Kdc02GWoF7lOGZ16Df9IOL8
	 Im+kfEixc0/bTmU1ZxnsfCvTXoag3wz6kygaJiBkYhRGGILOuGQnJOjnsFXwki+yMjsF/
	 04auhz39/QeZkq22n8heeHhG9erEh86zaXrn42cCHthX1qTJzv6/aA/OjvqsvA6lVpzjr
	 hjuvJkb8g8IH1RJpJKjulnfezYPHEyzzBde+cKpRFKmKNsw9E++zRj+Drbs9sUhV4hA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792432383;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=Q5JRI55ksfduTv8VbwlW8NqcdrRxT6u30r5b/RP/P9k=;
	b=CJjemJ/eyiPRyNFgB6hJNrCFzxVKOYOPqJ6oGTjQYj4z59jV8kT3moQwZaQAOuKx19or
	 JyMJ20N0nqRuyqaBNpM2vZGqSAbDoCND7ZVHKKiFCyTvTEvXyZ1dlQkR5aYSO/PT5ZxSS
	 zRhPF9pw9sYj4654BaLmEd6OFwZ5/7xPN0lfo1iG8dozgE5RvPNG3PNds4+uP4oyTSPsh
	 3kjjyz0a5wfdB64MvXHk7BFb6mQe5zdBR0zPLG2v8IMRhhkLvZZ21/nijk5UtGUQmr+wy
	 FWnXHmTMaSxNAoQzo+rtDcdAu00qbaH/TqQYHpL91bXOpQv480UkKEf0fVCGFlZQ/qg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	dkim=pass header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b="vUL8E/8C";
	arc=none smtp.remote-ip=209.85.216.45
Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B1C7606A31E
	for <linux-debuggers@vger.kernel.org>; Mon, 19 Oct 2026 17:53:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6B1C7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.a=rsa-sha256 header.s=20251104 header.b=vUL8E/8C
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-3ab2cb02816so350026a91.0
        for <linux-debuggers@vger.kernel.org>; Mon, 19 Oct 2026 10:53:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1792432382; x=1793037182; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Q5JRI55ksfduTv8VbwlW8NqcdrRxT6u30r5b/RP/P9k=;
        b=vUL8E/8Cg7eTwsGAZbgTM1D09VB3zHOryjAMBlfY+Ht5oFZhuGz+EDUhzZbHl1Av6d
         yMasxPw6AuVVrneR5D59LFJwjq8b13NTtwYfRcOT8s2zWjrUBAFnklgYdrIxtcay+f2r
         i0pRZMonz2FHCZ3j1fO4A08WfgX6IpaXvja1Jk9+vtUcIdUOtBhy/E+B3R9mFtRAuxSU
         4aK42LFvHxpneij/e2uQ/PvR1fOY5DodgsyqXnRk0ju4qXR7VvsMjf5G07xSQP5og+LZ
         Vvpx8aFZLXVTg3TPzOw/8QGFxPsxQ+T8qeZB+hiVI8/vBEutXDZPSwMPoKpyC+x8fs+q
         sUQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792432382; x=1793037182;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Q5JRI55ksfduTv8VbwlW8NqcdrRxT6u30r5b/RP/P9k=;
        b=aOBtNtZJAn5gu+QiLG2foh8ae0q4IpNwOzbBx9P5MRBamWTpZ6Ygdlj4h3vJ6msSPa
         IdHTw+gd+2n5mj0Q0/qpUbVONCTaxjIFvVfPN7WSQEj0nYd9mkpSxnSay51VP2n9g1Cx
         R+13/0XZaEREYvQ5rYnGh51bKKoZVW0MJ4hm3KyQjGQ4lXET82Dhy8ohSabVr0HkttmU
         M3Qxpv4XGiddRglSl8k5x9y5a9/neLj0LDNT2LrwMwQHFXVk9AZAql1QLK2Zz0JuNPgs
         rcmGqlfrPPjhuvkFum6jmx+gSbcmkW5553qPW8L0B9SoOVeT5od+YsYLOZXRUV/0f0ct
         NBWA==
X-Forwarded-Encrypted: i=1; AKwUvBz4AdYaE9Hfuc8976lwiNS9qbzJEBfw8eUNIIfXEOG+EzkkgpgS3dEwTzarl25Zzl2CEQ1DjPnOcHgNy3QLzus=@vger.kernel.org
X-Gm-Message-State: AFq9FYJjoljtJZ8AwKBM0vns2Ig1LMAET9zPrwahtvxwccy6pwctu7UR
	72xlapBgY2wllmY/IajAqT5M52vlS99aepp7agUQBGr8LA6oNRMiP7vuLo43gdB+E+I=
X-Gm-Gg: AYBFou3SOsycRYEQUem4mqtV0Cl1RWVGAIr7z4ZjO4itrxuEW+iX30ANcJDqFGE1bZs
	JlgQ4z/w/3rqq+u4WXkeVVhDwXbqsGncAMgDrMGE/nKPNUkFuGPAS7wTboHM3gbHzzL8hdmVK5J
	48iC1bfMKGPfg8jKS+Ct5FWwuTO9hO4+GNzU7PGx+SnF8KM86NvpVBeCSinFCXH1FlmypPp2+t2
	pWFmm/NCQ2AClPbVjaKvXOQ53RrYCvZ1WsR4tkR+C/zmXoXIr2sQ0RY6EP/kFa3Q9TsCb9oeWpP
	5TIoqp9R9xji1RJRlZXvNlkr15l0oxWXwAyBd/UebEdL1e5/qnY6FDJHm14mI59uCUIGzIfwSgq
	SM51PhhLDPo/UyrEZW2GCBl64EbS+Q/SO/mSl6nx//WpbmgCjwQ5jwzJt2nNzmM3vkc4+60bNTr
	6rb/UWHEvAIZRGITcvYJ3Z1DDrIeFmYn4lUi1vmX/8jLJs8RDH7us8GH4Q9tXS3fUqe0Yo4/1Eq
	D/0Tnmg9SDHe2dehXfAHNpyHRXKbLQF7tukLDLx3walVrLMBiJS7ergpVwDk16YqNtSaZWktA23
X-Received: by 2002:a17:90b:1a87:b0:3a6:e1d1:e511 with SMTP id 98e67ed59e1d1-3aceec3d0c4mr12674532a91.4.1792432381641;
        Mon, 19 Oct 2026 10:53:01 -0700 (PDT)
Received: from os-N5J97HY9XQ.tail2dda0.ts.net ([208.184.142.138])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad5da2d6aasm452560a91.13.2026.10.19.10.53.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Oct 2026 10:53:01 -0700 (PDT)
Date: Mon, 19 Oct 2026 10:53:00 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Nickolai Zeldovich <nickolai@csail.mit.edu>,
	Christian Brauner <brauner@kernel.org>
Cc: Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Stephen Rothwell <sfr@canb.auug.org.au>,
	Baoquan He <baoquan.he@linux.dev>, linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] proc/kcore: advance the vmalloc retry by the last
 copy, not the total
Message-ID: <atZXrXkNm1Do1V1_@os-N5J97HY9XQ.tail2dda0.ts.net>
References: <20261017034739.793431-1-nickolai@csail.mit.edu>
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261017034739.793431-1-nickolai@csail.mit.edu>

On Fri, Oct 16, 2026 at 11:47:39PM -0400, Nickolai Zeldovich wrote:
> A readv() or preadv() of /proc/kcore fails with EFAULT, although every
> byte of the destination is writable, when the page of a later iovec is
> not present at the moment the copy of a KCORE_VMALLOC chunk is retried:
> swapped out, migrated by compaction or NUMA balancing, write-protected
> by KSM, or unmapped by MADV_DONTNEED from another thread. Only root can
> read /proc/kcore, and the read must use more than one iovec. On an
> x86_64 defconfig kernel (v7.3-rc7) a preadv() of one vmalloc page into
> two 2 KiB iovecs on separate pages, with a second thread repeatedly
> unmapping the second page, failed 77701 of 200000 calls with EFAULT;
> with the fix all 200000 succeed. Affected since v6.4.
> 
> read_kcore_iter() copies a KCORE_VMALLOC chunk with vread_iter(), which
> writes to the user buffer with page faults disabled and stops at the
> first iovec whose page is absent, after the earlier iovecs were
> written; the loop then faults the rest of the buffer in and calls
> vread_iter() again for what is left. It keeps the running total in
> `read` and advances the source address and the remaining length by that
> total:
> 
> 	read += vread_iter(iter, src, left);
> 	if (read == tsz)
> 		break;
> 	src += read;
> 	left -= read;
> 
> In the reproducer the first call copies the 2048 bytes of the first
> iovec and stops at the second: read is 2048, and src and left move by
> 2048, which is right. The page that fault_in_iov_iter_writeable() then
> faults in is unmapped again before the second call, which copies 0
> bytes: read is still 2048, but src moves by another 2048 to the end of
> the chunk and left drops to 0. The third call has nothing to copy, src
> moves by 2048 once more, left wraps around, and
> fault_in_iov_iter_writeable() fails on that length, so the read returns
> -EFAULT. When both short copies are non-zero (three or more iovecs) the
> extra call also copies bytes from the wrong offset of the page into the
> buffer before the failure. A single iovec is not affected: its nofault
> copy is all or nothing, so a short copy is always empty and the advance
> by the total is still the advance by the last copy.
> 
> Keep the return value of each vread_iter() call and advance src and
> left by that; `read` stays the running total compared with tsz.
> 
> Found while formally verifying vread_iter() against the kernel binary.
> 
> Fixes: 4c91c07c93bb ("mm: vmalloc: convert vread() to vread_iter()")
> Assisted-by: LLM
> Signed-off-by: Nickolai Zeldovich <nickolai@csail.mit.edu>
> ---

Thanks for the fix!

Reviewed-by: Omar Sandoval <osandov@osandov.com>

Christian, do you mind taking this through the VFS tree?

Thanks,
Omar
