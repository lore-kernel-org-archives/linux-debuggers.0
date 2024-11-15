Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75471D63F7
	for <linux-debuggers@vger.kernel.org>; Fri, 15 Nov 2024 17:57:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731693437; cv=none; b=DM8kjDmhWna8WI9k+txw5h5wSqDtJm2YcTr4ZqL3Ww7xaPowWIwoNbcEKQ1tOfuSCDq/ah1Zn+bMfyh1W+boRJy4VuVTZqNq6DIQxtZUrK0as7nTtiiUdv3kHa26bmHllOkj3CVRs0UGL1wTjDGb4FBfsuMWXLfJT91RgpOkFM4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731693437; c=relaxed/simple;
	bh=tqUC4NRe2FsZbgMAFBDs225f2ppUqDIgLL2znENzBRw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GyaGuwv8b6wjweNNdjIfGr9bLKIHX4UnBRtcv8fIKr9fo2ElMZ0zDyv8FqqPoEkZfpROyurwhLbf+8vFg0ut85xc22Mz4s9Hg2SozIVbXlIcRcfKKK5r9Wu8JpjlLo9qo44k76SU0DSPDcx7f0RKzqkRhniFp9V8o8nRe0ciAF4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=T/rdvJQU; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="T/rdvJQU"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-7edec25102dso254969a12.3
        for <linux-debuggers@vger.kernel.org>; Fri, 15 Nov 2024 09:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1731693435; x=1732298235; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=pPMynzIfXj/zMSO4ZhSnrSnqX/mfMYS9/DB2RGzQRzQ=;
        b=T/rdvJQUTHLsmWGbo7np95QObUpRI7HzN7DwcwkapWC3cVURRfPlF5yCMHzAidupCo
         KW7wzO6PWfF8LtZdPnTbT7IYU9icWSwOwjPUlrvVqU+gX5lPUnuYnyCFNOSjXkuf+ffd
         77KOlLcpjP1br6SfalzKrqdl3TyQrAKtIFI32NVUy0cVyHLH/W9Ud22XAbOX2gO0jqBH
         eHqrJp+2JojcEHl0VjXLm7TjaFVmtxf6jbo+BbhWdiVF9xEvyDe1RClK2Xn2WTGZb+ZR
         IoLigM9uO9RMLGQ0xnxAxsJGlCz3Dxxrgq2lyYJKc+/aOIokFed5aBF6vCgYfCaYbm0S
         UjgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731693435; x=1732298235;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pPMynzIfXj/zMSO4ZhSnrSnqX/mfMYS9/DB2RGzQRzQ=;
        b=PaKR59H6Q/9FeLIeTn6dhFY6dajhAC0bsNPLVcezkfgsl6TYB8vmegSzquCWkbpefU
         lPCHdQ+/x6NHwytrRd4vH+2y0K/iPYwCLZwVfcYKwqAC5JU9+lHLVG6vzhcKSnhzl3J9
         gvHqQ615ZkzpdGd/oUBZfCf8bEScNzBLHEVmdmPdKwfZq/9vPgP+VEzSCMNy+ojU6aSr
         QdZHbWrCxYnc0DoMuO+eD+eozMMfQI3UglACqAjzTKm0K8pXcb9xgKZ3DtyPJPQm5oI+
         W1y4SpeyoPu3NF0WhcORq+8f+Wk/aD2N5L4MVj9jfUxHQSC+WFhRwfGNWg2YfZE8N59n
         dw1g==
X-Forwarded-Encrypted: i=1; AJvYcCXhGqvz7IMy7Qhy4NXe0rPWbwIjfQb99tltK9qMBN/p5CKOTSHoy1GvWtwAoV7i+qNtABugJv4ZQZYyC4syt9Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7UJyRjyNYgPw61hKLKD9mVNBWz0P5ArsAEwLxTzVsdBz8QIGf
	D7d8HKla/u90NYsDiOQO2iTh9WjZCRDpEHM+Srg9hII4gIPqmMcSHtII6/Rsoz4=
X-Google-Smtp-Source: AGHT+IFxT+B+vMFlR0BBju7TkQiKChJdJTO0QJor6trNTdWqEqoACrtnOTxsAxhAkxPiZV7G9qlR0w==
X-Received: by 2002:a05:6a21:6d92:b0:1d9:14b4:9bf2 with SMTP id adf61e73a8af0-1dc909b622amr2399351637.0.1731693434983;
        Fri, 15 Nov 2024 09:57:14 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::7:3740])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-7f8c1c2c505sm1542663a12.18.2024.11.15.09.57.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Nov 2024 09:57:14 -0800 (PST)
Date: Fri, 15 Nov 2024 09:57:12 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Daniel Thompson <daniel.thompson@linaro.org>
Cc: Doug Anderson <dianders@chromium.org>,
	Jason Wessel <jason.wessel@windriver.com>,
	Amal Raj T <amalrajt@meta.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	linux-debuggers@vger.kernel.org
Subject: Re: kgdb replacing newline with CRLF in custom query response
Message-ID: <ZzeLeFcMtx1ipt9R@telecaster>
References: <Zy093jVKPs9gSVx2@telecaster>
 <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
 <Zy1lyACVnZK4xwuW@telecaster>
 <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>
 <Zy45mCCGZ9sHsXTT@telecaster>
 <CAD=FV=WN5Nzjs2KowMbTij8CZ+T_eZxJ5rLdyyBDk-1H_Dj3cg@mail.gmail.com>
 <20241115144933.GB4408@aspen.lan>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241115144933.GB4408@aspen.lan>

On Fri, Nov 15, 2024 at 02:49:33PM +0000, Daniel Thompson wrote:
> On Fri, Nov 08, 2024 at 09:37:32AM -0800, Doug Anderson wrote:

[snip]

> > Bleh. It _probably_ wouldn't be a big deal to do the LF -> CRLF for
> > all these, but I don't know for sure. I guess worst case you could add
> > some flag in the "dbg_io_ops" and figure out how to set it just for
> > UARTs?
> 
> I find myself in a similar position to Doug.
> 
> It sounds reasonable to move the CR synthesis into kdb_msg_write() but I
> also am not certain the other polling backends will handle this correctly.
> 
> However I did apply the following patch and run a few tests and it all
> looks good. Specifically there are no regressions from the kgdb test
> suite although that's unsurprising since that suite exclusively tests
> the serial port. I also fired up the kdb,kms polling backends on x86
> and verified that I didn't get double line feeds in kdb (I did not).
> 
> That means I'd certainly accept patches based on Doug's idea and if it
> proves later that we have to revert and add a new dbg_io_ops pointer to
> switch the handler between binary and ascii modes then so be it!

Perfect, thanks for testing this, Daniel. Amal will include a
preparatory patch along those lines when he sends the VMCOREINFO packet
patch.

Thanks,
Omar
