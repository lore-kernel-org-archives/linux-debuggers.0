Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 360192AD2F
	for <linux-debuggers@vger.kernel.org>; Tue, 22 Apr 2025 20:49:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354962; cv=none; b=Ix8iakyEOhAGlRvosShrIXIgaLxWBWt7RfYGp+t8skVZwC4HYcI4atZGwWFvjg+6n3fVssqWIv009NaSzzoL5D5MSJkwobGrwBOj5qwADr2yhItoqRQ0R5DtLD2yMhSOrcGZuti83sgOcShwde3FOzSZtiaW6kglybh6kfO1Veg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354962; c=relaxed/simple;
	bh=fKrBF85/dHqMQSWxa2/eNij5xoK90zlmD54RG/cHEbY=;
	h=Date:From:To:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=F6BOkN+UtZcJ+MH45NtGUigww6Vx38ZFjSCJnQBxmMMmuGAIWmtcRs/e+eziqXbxasmbo2tWSYEjvg2NoQULWfvZlgmkvuHRD209altFOtYdG55bDM/QIdKcHsaT92f7MnLaQXhwMeALKjVS0MeYixFYX1SiCRQT8VBYJwGPuWI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=ZgAKA3y7; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="ZgAKA3y7"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2ff62f9b6e4so757134a91.0
        for <linux-debuggers@vger.kernel.org>; Tue, 22 Apr 2025 13:49:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1745354960; x=1745959760; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6G5bcE6YwesItF4a6vQuyFsyqhzhBWsmhFEF8xO6Alk=;
        b=ZgAKA3y783G7WgBFU6DGz4Q1RMbaVUHan8WSjFaYvkX/M7A1LGxsD08wNqqHSxLhaJ
         xyY8Ks7yqMhhV1F5TIlVyX7xiC0UHfpneKkEPMvEM7q7XeYiVLMjnwcEYJmroGOWkyPF
         IYMCwhH7uFpYrTMpi7N0Sw5nYOPRo4gg4OVpQUyGfBLgp5B72/qUp6Lo7t1V3rw6oJwS
         1p6gd51rNekqIkg/Ig9F9v3EVGyGpiOHlyBlS6RWwtID4xk6XZMhDCTc+mkg1tTMPkoO
         nf3B4LhQW5b43K+U0fm1zujmRmmUY9vovMhB2GU2wq8DRLFJyBVZC4TSa+IfYUjMdRc5
         dZkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745354960; x=1745959760;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6G5bcE6YwesItF4a6vQuyFsyqhzhBWsmhFEF8xO6Alk=;
        b=eHUht3UsBroNAWfCaa/fb/PbpYvEgiY7VkbuZ2hqXU50J/Tp2xI97zRUsLyphk/ler
         xhu9I3JYW8M5NmmC1mzxEm69c8P1x0w3eOd7/OiFj9Tz6syskbLKk3PdKkSGiVcAoI1y
         wYTBTUC2LYwuA2JLTruqiCsw7Szd5tFYa8NmzKyll64wznFo2DyNIKCx4hjxzQ84za5u
         ZeYX+7XbI2RGnKkUeUeZLo0132Gsw5CKp4lcEtScwmdrRhtGdKH2LbLPTYr5oDZZynP9
         l3L32K7NfCbL1+oZ8sm5ajTjLGRqFvzY1eIFHKJqVTEIIGjM41Iflv8LQBO0mvgNf4Dg
         Y4iw==
X-Gm-Message-State: AOJu0YzBi1wsj04dArWQ32OklsPY0YVr7Zoecr2n7i3S6KDhwr1q6wh4
	KPswrTbWOxPsqKwLs7cY4OLlvlbFJBC1a72TfaViMBtbR61TFfMdXE/70DjAKfGpt1jJoaHlfnq
	1
X-Gm-Gg: ASbGnctD6otEvAWRyT10M9vV8XqrDb9L2D45fWOqNBDk9TtLNXxmuX6PlftjZbVsaa9
	VMlaBWFa6viIN3b8N5iy0WmsZs3z1tENYX3pcdMYABlUOh8sPBXjajXzdIRwt/70ovCvn5vTeax
	diw5fMCPRUyKYAE92vS3OMjBb3RC+OMImf0qACd5QyeFE4X0mMq8XaZEyb+4h91ZKCjijSkVURk
	doxjvV09Ib8ip3R4DTJrjgC3ShoqwpqzE7WCYqUdX5rBRobkYkn4pCHFOGWER7JGTvIpRoYwU91
	/hSFzrypBxEPdqJFBPMN3Lg=
X-Google-Smtp-Source: AGHT+IEaqNICTbtxvEOJCHcHOM5G96vxN/dmnCi7CdXVKtLX2/bMGX8PCQw8y0ldG9Hqt2NTIfWkNA==
X-Received: by 2002:a17:90b:1c82:b0:2fe:b879:b68c with SMTP id 98e67ed59e1d1-309dee5db21mr245137a91.6.1745354960071;
        Tue, 22 Apr 2025 13:49:20 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50bd99d6sm89810385ad.41.2025.04.22.13.49.19
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:49:19 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:49:18 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, April
 23rd
Message-ID: <aAgAziQYt4-r-I9j@telecaster>
References: <aAf_UDW8imnXvowu@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aAf_UDW8imnXvowu@telecaster>

On Tue, Apr 22, 2025 at 01:42:56PM -0700, Omar Sandoval wrote:
> The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
> April 22nd at 11:30 AM Pacific time. This meeting is a forum to discuss
> development of Linux kernel debugging tools like drgn, crash, and more.
> 
> Here is the agenda so far:
> 
> - drgn module/debug info finder API first impressions.
> - drgn vmtest improvements.
> - Auditing hard-coded constants in drgn helpers.
> - Plans for commands in drgn.
> - drgn kmodify ideas:
>     - Kprobe-based breakpoints.
>     - Injecting more complex code (multiple function calls, control
>       flow).
> - drgn review backlog.
> 
> Please reply with anything else you'd like to add. As always, if you
> would like to attend, please email me offlist.
> 
> Thanks!
> Omar

s/April 22nd/April 23rd/g
