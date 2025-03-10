Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6F019DF52
	for <linux-debuggers@vger.kernel.org>; Mon, 10 Mar 2025 20:30:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741638606; cv=none; b=AEoHRoRON4MbuzmGvQlEBx9J1nVBsOmPGauRykHZxby0Z3Ts8E909bxGPvzQ0SFlQRAjZSA76I9ZpZiA7uX9xF0/GPHBLE+n+Z5f94BxWbrZiVe0CZMhEwF5FcAhG3JBV1dT0AGyWsJ5PpUg7Azlp8eO8qQ/yXziUsNURYGUFbY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741638606; c=relaxed/simple;
	bh=NIUL5AbFS030/YsYdIy/v5SRhtbmbuSd3dUcmCLnSIY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ZZ7/VwYNjMo84/HeG8UX+aaBPy1mb788l7b4RUH7+BxbIXRjsSqRZz/R0B6bS94BsI+nHuRm09Dhtc0HKjOVP9NvD0iFWgQHWiP0rrtfZMTtBy6y1ALLzUvamoSqn8sNOlijabH/pB8k82iGy9zJAaTuOkk4xtw5pUoRqSWiPvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=FlhbVmdE; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="FlhbVmdE"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-22403c99457so9402265ad.3
        for <linux-debuggers@vger.kernel.org>; Mon, 10 Mar 2025 13:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1741638604; x=1742243404; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=v90xvGtWPp7g9UDLu/P4Z05TCl2CWI8A4C1rSFoFWVY=;
        b=FlhbVmdECGq/Xd+d9on3VXTnVx/XsBKjK8zfH7zmwHTKJKJJf4b8FPbO/iJ/IBEgGD
         WigOfT10gOiq/HobmdB+bXYlLHavFxGH2bn+XzAnAicrN552IuRyk5KldNSmQcFTbEtW
         /K9XyQtq33u5bYzxaGOd5CBIO4u7s3JW+NlZEQXCGceeBPNcF5tky2atHBdedVGKCFfD
         0V5eV/XPnq15Jt7b5mjaE9ZCJVKhq4XEZtoYuSnoRHQiclZM0q2uapyycuTFAwMPETg+
         5C9c54ZSMBG9SsCFHqkejTRJvn82KNcKrz9RlOPx04wN8g6YY6rbTyZGd2JvbyENozOZ
         lqyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741638604; x=1742243404;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=v90xvGtWPp7g9UDLu/P4Z05TCl2CWI8A4C1rSFoFWVY=;
        b=pH8wGFcBVWHpqVBozBfMoWbmfteTFSxqiwksNVHmB4nt3TsFG7zPTkQ/4YtKn98AHi
         W6huPEh74TGQlEqwnd7LmDfI/oT03hNXYd//jzu2MUItxcDWbmcNwwP/fubC59NnSp+8
         4wWQgFdFZGO1f1CWytFHMrbADx/R+jGAPyDU8dcjPEYMhZ4P3XbLtkFm6vpmt9ittg9n
         1ddpKv/nBpct0AMI4ak+VFKApYb/2mdCJxSja8fVsFExYWkUO3APbD0UsJaAcyFQud5i
         4tpY260J9+awKYblZ7irMpOUhmPpAlxb9HKS2h91GYo3nYMJX7bZQSRWUPg0VeymR35z
         XYPQ==
X-Gm-Message-State: AOJu0Yyfq3HFPUPFCgJvbNrv3ENBTwerFCtNQovT0a7zMTlUv2eF/0hf
	zlXgz+eibc0bOc958GpBnzPNuteyX/nBgJ8l0Nst3qfGZw2tN47cJUkcanb8Mk2ZBr5wKk8sQQW
	D
X-Gm-Gg: ASbGncuj8DQ4IgE1F9dhyEZ7MU0Urzot+ak6hPYCsLr7c38ac0Gux+T2iHqmKxxTxth
	7N2nLiUObWAKQJ3KcUsuXay4944glXDXPiTrP13GpTa2dsqArBEoma4kfOTMf0LF5eJQHqblP9l
	BRkMF48aE0WIIHkNhw6II/75Oezini9T7o4dEqlQqZkEU7R6GjJPrGF9q+UcjREgxLFhrsGSAow
	irD1vdxBumBKRkkjGyd0it2pEnV/WeTw8isYWBo8SeORGX4CNCoAG70EnA0N6VPyr5j9shWCGwE
	ybG34XzC+kW6mRothdzUFAWLYO2ESjpXtRbmdA==
X-Google-Smtp-Source: AGHT+IGLZOG/fbVIQrUgZUBPwwRYu0LqyK4EidWoQKkIDSgwN8hlipiOMkWSVxg9X5et8tRjmFcLGg==
X-Received: by 2002:a17:902:d584:b0:212:48f0:5b6f with SMTP id d9443c01a7336-225932d3c5cmr5368785ad.9.1741638604402;
        Mon, 10 Mar 2025 13:30:04 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::4:54c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22410ab0133sm82354915ad.248.2025.03.10.13.30.03
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Mar 2025 13:30:03 -0700 (PDT)
Date: Mon, 10 Mar 2025 13:30:02 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, March 12th
Message-ID: <Z89LygcVD4relE2G@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is this Wednesday, March
12th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- Full support for .gnu_debugaltlink in drgn:
  https://github.com/osandov/drgn/issues/333
- Support for .gnu_debugdata in drgn:
  https://github.com/osandov/drgn/issues/465
- Stitching together kernel and userspace stack traces in drgn:
  https://github.com/osandov/drgn/pull/466
- When should we cut the next drgn release?

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
