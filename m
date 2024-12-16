Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22624207A25
	for <linux-debuggers@vger.kernel.org>; Mon, 16 Dec 2024 19:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734376299; cv=none; b=lM7rTx1IjKffBaxTQqU0scjRju/IMkVgbw9jJpOLuiUTbTT5pbWaWSaD8OafyDMa4ncckG48YgNQVuabBik+qmIxhM6QQOzuETL7GNUIJGv2hZPoueSxSkg3/89Jvu7cwaOMs+ljhO+GDNujonBY9+FkJwF/qQkS29ykBVT7+OI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734376299; c=relaxed/simple;
	bh=buhp0woq4qJeu6ve9t/FzOPOdmZVvURJadfnI63OM1k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tkjtnL0x8rDu9WyUKGmttFgP1J1ELsGJrAUB+vFJJESiW2aSO8i7uzHZYqKLv/LIwRd2L7iWj2aHgQ2nNOrV6kUYsapioISCimYKmqfR6mSF0ZJSRrgn7rmJV2Q68QXX7KPIWKm6ge4A6LfnOycHRogUDuRmErWazO7owdgPj/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=ZLkLYjrC; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="ZLkLYjrC"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7fd40b80ae0so239688a12.1
        for <linux-debuggers@vger.kernel.org>; Mon, 16 Dec 2024 11:11:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1734376297; x=1734981097; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mGuO4nX0fJOwZr3RaLgHoLzwJyCS8Y0h41CfJcpk7Lw=;
        b=ZLkLYjrCoYrEAgCoz1D6vhTopWot8ozr1aj4D05Kog/jF76AZTzDS6uKZFBZxSr3Hx
         aDNaPRGWq+3f3/TvEGQf6i/WoL/iLdi9ByqxhDfoZk0GAg3Fzk9joR3IVY3mtYvzH87I
         eP/FQSM8MO+e39w4q/RBV+RmyLgUJU0lZSgoCYevJpJUXw8CRPhTk8vTOP0JGW09lA9Y
         7Vhdom0MRZRrncJ7aZ4NUbQTsLEAIlEKfoRXsUahY4TFv5uGXdDbgfb77IjqMBpEmPc7
         hOn94sCp+ME8XyVEy75XQh5KTR1H9WpfxQjx0iKeg03DJtwztqsphzDGEruMTC9fs5Il
         gyPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734376297; x=1734981097;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=mGuO4nX0fJOwZr3RaLgHoLzwJyCS8Y0h41CfJcpk7Lw=;
        b=jxDddQ0Qp+nRAHVcu5MMqMquN27v2wVbzFLPS32SX9dmwq+I/FnaKT87fsh0N+H22r
         qss85yYwgMdy1FCKwLpsTx5UezNxCVmu49YF61t1dXMmnsxbV9vsVBgwrkM+tfM5PRgO
         3AwdN5GNjdTg3yIyic55HqTB4LIdFNm41Us4l87MlrAA91XSBUkUVToHowyN/PWc/dZS
         DKLzYzE3zLz/awJqioJ3LsoCSNwyotl8rvUGeD6j0BpJPBr9yfq50OfFGam85nf3iWs3
         2fdJ50cC3wSYyOCZxzR07C5vSI+k8n7hYdUxZr5s8asU+1hRVgzc3dYyWGfHMhoExmjc
         w9tg==
X-Gm-Message-State: AOJu0Yz38dsnR9lPO02DPPntgmmj5hMQc6Xn75jqa37XhLNkr6/Kisnl
	dvBHx1avR3WrxgYkErEbWSZyDXdyZ+a9Mspt11kIzr4iNctnfyGNXb9AuoBKzqY4kNffG3T76+O
	c
X-Gm-Gg: ASbGncuZE2gu6sryVGRivHOvHS1Na0CThmzcwjAE2DBJ+0zkHYgdTi5wLwZawOFL4Tr
	mHHax2m+K21bzkOPYex+iUtcyb5tMHFcCZc0kpwENNGQnM0LdEGeKIEYa8b7dvX11K7vVIvUyAe
	PUU72h3ndivJvGP9rWDxe7cN0S5goYvmq/u9T4rkqidmEJjrub+3eQ62UqufDi0KpLwXooYTJXH
	dOKsRZSOp8IiUTSoDTn0QG9g3OVFAJn54YJbhOz
X-Google-Smtp-Source: AGHT+IF6S7NdLwI+9lYD+7Woed0/HD/rrlvu2scRbKabEBte7X0yR0R2Q/lG63wOCCRiMJmdwTeIuA==
X-Received: by 2002:a05:6a20:7285:b0:1e1:94e6:db0f with SMTP id adf61e73a8af0-1e1dfe1652fmr9104310637.8.1734376296770;
        Mon, 16 Dec 2024 11:11:36 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::5:fdd0])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72918ad8f34sm5123815b3a.77.2024.12.16.11.11.35
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Dec 2024 11:11:36 -0800 (PST)
Date: Mon, 16 Dec 2024 11:11:34 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, December
 18th
Message-ID: <Z2B7ZjjtRPzO9v1p@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is this Wednesday,
December 18th at 11:30 AM Pacific time. This meeting is a forum to
discuss development of Linux kernel debugging tools like drgn, crash,
and more.

Here is the agenda so far:

- Status update on adding VMCOREINFO to kgdb protocol:
  https://lore.kernel.org/linux-debuggers/20241211153955.33518-1-tjarlama@gmail.com/T/#u
- debuginfod optimizations for kernel packages have been released and
  rolled out to Fedora! Need to check on Debian and Ubuntu.
- Status update on drgn module API: https://github.com/osandov/drgn/issues/332
- Discuss next steps for drgn after module API, especially re: debug
  info plugins.
- Bonus content: Omar complains about 3 different build ID-related breakages:
    - https://lore.kernel.org/all/20241104175256.2327164-1-jolsa@kernel.org/
    - https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=f7ba52f302fdc392e0047f38e50841483d997144
    - https://bugzilla.redhat.com/show_bug.cgi?id=2331487

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
