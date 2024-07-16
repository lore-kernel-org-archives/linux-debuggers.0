Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com [209.85.167.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 47E8578289
	for <linux-debuggers@vger.kernel.org>; Tue, 16 Jul 2024 21:15:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721164543; cv=none; b=LgWbOXbQQU/dPNzhknBfFT6tlzL0Tpm+IOixlsZhzlxlvF6t6pzLGEYMngIJDmpsi3OT4igBBS2E5aJlskT7vlbSeXWxC0rKUj86eZ0ydowdIVheemZh4pnAOSp2AMySE0GFI6pKKiZXz/oj7f5EN1gZH4xjHiK+K87G1W4a3DU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721164543; c=relaxed/simple;
	bh=WM2tmKpAwuCwfSqKhY8GgzqbU0Ml4Y8pDh9pjAfZSb4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bfGXHM7GwdhdQVXY6eE21KdlMzlZ6+IGrzaDbhvVogV+qSfdK+rjKEU5UZK1XFydP+0Rd44eCt1E3v638EcYCHe36lsjOwJTY1z88qqL2MUQdYrdkR4GAFZ2pzNPdhqY0NqXRF478Mtw4htM9DLmVzXMFyw4iX0Tk5T5abG+ug8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=bEXhkBl5; arc=none smtp.client-ip=209.85.167.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="bEXhkBl5"
Received: by mail-oi1-f172.google.com with SMTP id 5614622812f47-3d92d1a5222so3629530b6e.1
        for <linux-debuggers@vger.kernel.org>; Tue, 16 Jul 2024 14:15:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721164540; x=1721769340; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=bGJ+s9culCWiguBknsjjGY0NMAhz/KM84VB2zuBzHrM=;
        b=bEXhkBl5Y3i2Hzdesh5ac83lEeJy5lT+sDRdo3M/Ap2wYcJggiqfDvzQ+gbiSxAnTH
         AISBzVq7vZGoWT0FrOBQmPEiiQL3cawfE3vcwRPwAmv/GXI+TilHmNS7jO/2hik0X5fk
         Be3g4TLKLEhRrCq3omc7g8fAUWEZiiKhiFrI5q0mBv9NsXFryUvolmGevpukMOtccOut
         Z/Va7x5yywI7P8IsAdOLK7a9/Q59ltvWYQNJ5F9jtUavf7pVfbBuzlRBP72jgrZkWXln
         MVsmskcQeVHn1504sd46b3B4xXgOBVSXIlGK60/rjykQ7XacbRXd3lObFhR1Aa7KBroW
         xZwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721164540; x=1721769340;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bGJ+s9culCWiguBknsjjGY0NMAhz/KM84VB2zuBzHrM=;
        b=MkLf2jbYYxg+N89j9gk1HRsLAsREovNbQDvdsdZ88THGQ+Rmu9I6nqz2zQEmsM+95H
         d4NVFIPlgcNTiyap1gNzCHcBlCnSwTcCZJrLcylR24I+cmmFG/AM/+kWZU1NF/bN4zwP
         LfUIFOulni9YQ/wFpVRjUWBb2sJW3Wf/lu9I8eK/ns5FYs03irKCaV01rZIMPblx+1qx
         /WI6xfX4KUyPcj0gwnkm5CBgui3YXeLxjMOS5lU4BDLbKG20Uy/a3SzWTklbolqMPaUD
         5cigFZml/u4Q76T9cXJPjaZ44pqvXvwNXVsXJrkOn9AREt/GjYKdInRdlzD3dOpetHOW
         3IFw==
X-Forwarded-Encrypted: i=1; AJvYcCVNYh2Xx94zin8Gy4xrgl9WvmB5rdZ/NGrCrYeetyKKEekX8CwazxsusmBVaQYYnyrTsI4d26A2hO3LKJxguSwikqVE/MSXDiH93iUNKp6Q
X-Gm-Message-State: AOJu0YyOYPMnjfjqYrIxnGKIDmlvqtnSHHw/Jr79O3TBMk65ysBquphE
	+qsN8nC+/1467gZgakG2gaToRwh/rfd72BjcE1vNzHXaFpR5LRYxFh2XMDYe57s=
X-Google-Smtp-Source: AGHT+IHgea5/K71MovKCGWj9v5uzs/J50LHRaScpjRuIgH+JRwoNFeK6QM7usAk2yfpHjHYpVvcr/Q==
X-Received: by 2002:a05:6871:331f:b0:24f:d9bd:2754 with SMTP id 586e51a60fabf-260bdf9ae88mr2557076fac.40.1721164540209;
        Tue, 16 Jul 2024 14:15:40 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:400::5:7866])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca8303sm7030677b3a.173.2024.07.16.14.15.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 14:15:39 -0700 (PDT)
Date: Tue, 16 Jul 2024 14:15:37 -0700
From: Omar Sandoval <osandov@osandov.com>
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: elfutils-devel@sourceware.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2 0/5] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <Zpbi-VXYv7dmP_8H@telecaster.dhcp.thefacebook.com>
References: <cover.1721037200.git.osandov@fb.com>
 <20240716201601.GB7214@redhat.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716201601.GB7214@redhat.com>

On Tue, Jul 16, 2024 at 04:16:01PM -0400, Frank Ch. Eigler wrote:
> Hi -
> 
> > This is v2 of my patch series optimizing debuginfod for kernel
> > debuginfo.  v1 is here [7].
> 
> This generally looks great to me.  I'll send it through the testsuite
> trybots here.

Great, thank you!

> But there isn't an xz-y test case yet.  Is there a
> smallish seekable-xz rpm file that you have or could make that we
> could jam into the elfutils testsuite?

Good point, I'll add one.

> (A prometheus metric counting
> seeked-xz attempts/successes would be cool to assist testing and to
> monitor it on deployed servers.)

I do have:

  inc_metric("error_count","lzma",to_string(rc));

in lzma_exception and:

  inc_metric ("http_responses_total","result",metric);

in create_buildid_r_response, which gets called with
metric = "seekable archive".  But I'll add another metric for attempts,
and name the existing one "seekable xz archive" to be more explicit.

Thanks,
Omar
