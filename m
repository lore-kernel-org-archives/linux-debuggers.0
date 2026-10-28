Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.161.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793231504;
	b=Q/54cOVlid/QKWoLl1gzXbXDBqW7FU4sJKL4rlCV6Ku1hRQl+motni+ohhpJBgExv0VV
	 VQ9vHgdleSyBJdPIzVLmjgJyRH0WZ7FmU5Nu2H5cPgsJ0gee2faAVwTrRcacQ5rEowdJ3
	 SMFZcC4DMIOGRVCSq2XwfqjdJVMKAvcs2GuBNu9I7k8fQ4G0JyJlGGLw6Jn+NueVV55o1
	 P+fnGzU9xFNobQWhP4ukup0oROpuuYZcaWgkCHGc/6G2wJ7T35ANsD9G+QcGLnQlB/M1v
	 3DqrFWqAZ2sPfpfWASxb4ZutBt6oRmzDwN8Ckxt4T8cC5v10mthmjnaJ0nEAX4HeqbQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793231504;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
	b=FS7iQcL9uI5MLLaX47U1HyVYtrqGG+JTvxvjyDkfPxm9A9oYWiDvuENuMFfS530TL7/F
	 2G9Nz0lXyKEoy/2UPDxMy3xHwe+RUTWmc6oXTUa/UiiO3rg9dqjgGfbPicyVBgl4xcRGt
	 gqDIL+7SfIinRdLm/xGvzd9Nl4CGNYmRCnt2F9Qf9xBF836mo+iv/JMGCYWnvKNqz4t49
	 7EjsNtafmy1oa0l6za14xzYqMHBax/lITxWP/sGJZnSAspu8wMyNmK607Rqn/PpdpTPz/
	 IspASjxo7p3G9XhsfykVpbmQb3euFCbx7jYzNKMLFDB4HAKLN6Vf3LU56lnGN5TN8Tw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	dkim=pass header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C6y1l2pr;
	arc=none smtp.remote-ip=209.85.161.45
Received: from mail-oo1-f45.google.com (mail-oo1-f45.google.com [209.85.161.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6EEF606A321
	for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 23:51:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B6EEF606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=C6y1l2pr
Received: by mail-oo1-f45.google.com with SMTP id 006d021491bc7-6dc6099b5f1so72327eaf.0
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 16:51:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20260707.gappssmtp.com; s=20260707; t=1793231502; x=1793836302; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
        b=C6y1l2pry9W5jC8gMQqyEXs572O1glS7gJwNi5E5Pev3o3fsisHScTM0QjjoEJ4UIc
         q+dXK/EnfJdMD0KGixsCI/tc7DwWwOrMLeB5IWNAEUum9mqVmBb2EQUvqu+GHhNisDP4
         wTJGdbOSOfv10TFbp69zQ+kzsjpMSfaFK6hliupd/RXptVPOclpIHN4ON1CBiGwmfbIV
         eMLIK/GJdvW4bfnY6+m1YuwbTDajAVyLr10mfZv5eV0OhzlsBqN2Qh44Dr/gdhsP5k+Y
         TkXVulmHTkhXdURBZwGvOu9avbrR08xNr2xqvRmt0v/7YkMLxpGq9en9VU0BeDn/wCf1
         JJsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793231502; x=1793836302;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=9aqlUca5Z2Dix4R9/uyjhIevl9A0MEDe7rswOfSHfFU=;
        b=vDzHSQvogU1pdRbcNz4IgjebLwOtrrdT9moD6LaAw1QLNWUI1e7UFdlGCka/7RQTXl
         oQv9dAZbfWG3k3Anlh8raKYQySYbOs7EW0DW+7+SY4nDTnv8XO/lBAnZPMyXdogzglLu
         VDwXb17IWCaQF3FCunwqMtbgyzHlmdNaGI68YUgZmgDkkHEZJyvgys5Bvsz8zgVS0WPc
         8+8OF+aCfJImsXuA3cL5EJRQBp6sRaXHM4Tewuye6cCcrXCCD2UkaPPnyGmla6FhVKUR
         iLccUZ2/smqsx1E2wpUuPPjZbV0ozOaQC2MnBtJJTcG0gq9S4Y5okmwJHmyAqkjpwDwu
         zSzQ==
X-Forwarded-Encrypted: i=1; AKwUvBxSXr2mirxZ3LFj3mazMD1Dt6FK01DaCkk7hifXWR+XlXl2k/FkMc1h8r7V9N/Ff4y1sUo/YP76LUQgFTPbn8k=@vger.kernel.org
X-Gm-Message-State: AFq9FYIDYVaXSWV3vofZO4Ud9jX0By84gFbJYLeU0D9/+rtAhMS/BMS4
	qA47qXJHusJwG67lzOomtZtWHMR9Cgh+wY6aOyyVB6sn2twhcOtWsgLS37diswR4LBM=
X-Gm-Gg: AYBFou2G4zkCBHRnZMeJgD0ebHtFDGklP9Dr54/UkZGmrYY6D/sp4sM3Au5nrRE6OSi
	PZjBVegjU7VMU/vPR+oskadOiG2k4MWsDKDySsmPUMxaX9sn0kSzHlxqMkJk6lAuZIEixHdV7rz
	MKKgWlIxAWpjybNnz+0Cl536C+f6DSkrNtTGPhyM0q3g4KK6Be9NichCZzqtcLEnMDbYyteNWKV
	HcVUXkzfhIWvju0pCZ8k+qCEooDx/f8qemI2Akz2JPNw92SKsrtRhXg7Q46GcQeGEL+anZMbBI6
	nyfEkkUOP5sfWA4tJCBPd4Vrf/yUjMldnAPEWVBtb0EE1bbGz7aP229LSNBKo2K743akhohEw1o
	Rzrs3Ua2Gk+5OoXiN4LJYJeTEiPTz8TqbQSHjUtOEPrYF59jRRTi9dqIw8XS0duv/+y9Jm/78x7
	YEFNQGWzrrzS8/an4fmrLUNeOx0hu5MjxXOOS+sVyRqFIm5SkyzAQzhF0+PiWGEpVlb+SLRnU3E
	4x9iHU7R8FLRvvl7TYlO/dVnzMDMfZ+eD4/k6AAbZMQNgfRXUBSzEG4r1qlLMu7kYOJbQo1LnBK
	QnVGu7P7PZToNFgL5L2MpiDT6zlhoFkGWvJc/lPr4prFwv8stwFlpM0N1SnWK4N6HgfiJTXhvNd
	IUlM=
X-Received: by 2002:a05:6820:6204:b0:6f6:5595:915e with SMTP id 006d021491bc7-713ee85fbbemr3135112eaf.1.1793231502506;
        Wed, 28 Oct 2026 16:51:42 -0700 (PDT)
Received: from os-N5J97HY9XQ ([208.184.142.138])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-71426f16f66sm2615609eaf.0.2026.10.28.16.51.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Oct 2026 16:51:41 -0700 (PDT)
Date: Wed, 28 Oct 2026 16:51:38 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Chris Down <chris@chrisdown.name>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: Re: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auKKisespDm1xLLg@os-N5J97HY9XQ>
References: <auAmuqZyUodq3iqk@chrisdown.name>
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
In-Reply-To: <auAmuqZyUodq3iqk@chrisdown.name>

On Tue, Oct 27, 2026 at 12:21:14PM +0800, Chris Down wrote:
> /proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
> memory. That's a pretty large read primitive for anyone who obtains
> CAP_SYS_RAWIO (and it also gives away the KASLR layout).
> 
> For this reason on some hosts we want to turn /proc/kcore off. However,
> on a kernel built with CONFIG_PROC_KCORE=y the only ways to block it
> today are lockdown=confidentiality (which also disables many other
> things we perhaps don't want to disable), or LSM. That's annoying,
> because on the majority of hosts we do want it on for things like
> drgn/crash, so today we build two separate kernels.
> 
> Let's add a "kcore=" boot parameter so that this can be disabled at
> boot.
> 
> Signed-off-by: Chris Down <chris@chrisdown.name>

Hey, Chris,

The code looks correct, but is there a reason that /proc/kcore
(CAP_SYS_RAWIO) is any more concerning than other ways to read kernel
memory (e.g., CAP_BPF + CAP_PERFMON)?

Thanks,
Omar
