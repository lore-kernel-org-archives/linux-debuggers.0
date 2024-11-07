Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54572218306
	for <linux-debuggers@vger.kernel.org>; Thu,  7 Nov 2024 22:23:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731018210; cv=none; b=jSJnTVVEb/xvu7v4rLq0wdtV1te/99JEszhePkrZZ1sKcLh8rcTX8XLw8Kvs+kLQw8sYLMRCgQe2/x0fpgBLgbLBiSc2UYXGIUGCCv4uYpawQ8tPrG+aL+vmWT1wl4++wdE9ESTI8yxDPQi/VpuINNGEBLMj/+Y2CcY/XryhOrI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731018210; c=relaxed/simple;
	bh=6Lhr4Ig4vdtORmSzZyxjxLEmvplrUOEwk98lC37NBGw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JtbNiGg19/NCk21tpR4nn07SxuIz8LH69AtTNDai1w8L6WPSKOnZ+cjSWfZ7Qt9NrB8V3xPrnd1tj45LiIQiXnmRnZ39aHa7zNiST7D3gWaWBUndok1OwTm8nKbfcXFWu/SaQWok+M8cz3UA/abYO1iXYWu5u+zILEs6D1HVpqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=XRVaBfIm; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="XRVaBfIm"
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-7ea7e2204d1so220344a12.0
        for <linux-debuggers@vger.kernel.org>; Thu, 07 Nov 2024 14:23:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1731018208; x=1731623008; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=6Lhr4Ig4vdtORmSzZyxjxLEmvplrUOEwk98lC37NBGw=;
        b=XRVaBfImfgVdzGPybDbjx9Ko3L/TX9COGh1zRfQ1rQ52nO4iUhAsFuQiDPXjm+Kgr8
         fpHm7enz5XFpwKZOR/r/Jm6E6zke9vSqVcy13sDH6T52AabAxBvW1BlbOAJUZcmZveza
         8lfYbHGcwf2juN476C61+7qbieRqBvgy2HZOudLEKnzVoW1lPhB+uPqThgkddocadMZH
         WTzpzI1j/bM6rmE9Bj8eSGsPyaF5z80qaqEmdnWtdX0c3W/V1NmhJwai4RXpM11OAlmO
         +Odp7sSG9u4tTrbB+lNhhB0MkghAioWHVv7d8iU5XyOFuNZlmJqbLEMkfHDX44b1RGKM
         Q8QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731018208; x=1731623008;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6Lhr4Ig4vdtORmSzZyxjxLEmvplrUOEwk98lC37NBGw=;
        b=gHLBmsEToBG3tXp3YxjhZQE/bwjXavKNnwrpJU91lXcy1Ivipdk3YwPvme0JgEh6pX
         g3saLY8sOHuag62DBRhD1kBMdxZ8s24vfrdUBCpB5ce+JyGsh2X0n/lgbiGOP2T6aqty
         rndlpXpnEpMhUYWo6ETqRPKzHaq6Aflen40yh28NdCsctCKkD0k2OdUqZWiQGhwkYv8i
         Hde8COoc/GMdutIYF1Q75XmfW8x92/OX6Ke49IXrrrAva9qGCXPVeBtt3I0YNitoRGzV
         Obyu6Sy5RYruxX9cvE8iPB+mwZn2NtK3uJT8jEUoSuBRsOLWFo3awZmwO8iYSxxoKoNq
         a2+Q==
X-Forwarded-Encrypted: i=1; AJvYcCV6V/e6p4gFw45jDh9EcxCD3azL1wahPJLmnfJE77tfH4xGEGhmvVVSfmPOBTdSANv11OkEksWfi2HUcmWC3Vw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyGUdV/u2Mh3Hf43sNqr3qV+nXJZBLC+6WCffE6KW78tRwUkP4i
	YXCwoVbhOsTWCbA3d0T5yxd3FdUoZxue9NTHJITz5gx4V5LHOJF3uqHwH52IKYs=
X-Google-Smtp-Source: AGHT+IEhv0g+JbUWUkr1DA1ltW7FeqCwkGTOzUqI8gzsR8reCMxyXMhw4vFXWCdDSf0fI1Y4fO/smQ==
X-Received: by 2002:a05:6a21:6d8a:b0:1d9:9de1:b2e7 with SMTP id adf61e73a8af0-1dc22ae2a9emr425006637.7.1731018208580;
        Thu, 07 Nov 2024 14:23:28 -0800 (PST)
Received: from telecaster ([2601:602:8980:9170::5633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72407a15493sm2206288b3a.139.2024.11.07.14.23.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 Nov 2024 14:23:27 -0800 (PST)
Date: Thu, 7 Nov 2024 14:23:26 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Douglas Anderson <dianders@chromium.org>
Cc: Amal Raj T <amalrajt@meta.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	linux-debuggers@vger.kernel.org
Subject: kgdb replacing newline with CRLF in custom query response
Message-ID: <Zy093jVKPs9gSVx2@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi everyone,

Amal is working on adding a custom query packet to kgdb for getting the
kernel's vmcoreinfo. The rationale and details are available here:
https://github.com/osandov/drgn/wiki/GDB-Remote-Protocol-proposal:-linux.vmcoreinfo-query-packet

vmcoreinfo is about 3kB, so we were hoping to avoid hex-encoding the
response and doubling the time it takes to transmit over a slow serial
connection. Instead, we were hoping to use the escaped binary format,
which escapes the characters #$}* and leaves other bytes untouched.

We ran into a problem, though: vmcoreinfo contains newline characters,
which the serial core replaces with CRLF; see commit c7d44a02ac60
("serial_core: Commonalize crlf when working w/ a non open console
port"). This effectively corrupts the data and causes a checksum
mismatch.

We'd love some input on how to work around this, especially from the
kgdb maintainers. Here are a few options, in descending order of my
preference:

1. Disable the LF -> CRLF replacement while sending binary data.
2. Escape the newlines using some other custom scheme.
3. Give up and hex-encode the response.

Any thoughts?

Thanks,
Omar
