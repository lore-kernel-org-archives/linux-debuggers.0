Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB88C17CA17
	for <linux-debuggers@vger.kernel.org>; Fri, 18 Jul 2025 22:22:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752877372; cv=none; b=IfyJuIrOd3W5g4KUzrOJqT7cXr8lUD2amq7MtzbTkbbs7QeV3VPWO6roI0LboLa22dLlgCEWP/+N0VxHpUrVRrRDuNropYoz/Ex/vBN5c2DH2W4mCtsCOGSSkx2C+fQjknrhIvCC7OFzK8XKFGntktOj+NLNk4i/g+bGlhqPwUk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752877372; c=relaxed/simple;
	bh=+9e6nF1T1X61vq1KJQfoewOeoD/UehHFXgCKG7vMIoA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ADf3h/DMtt1OdUeQGgviO3i263Bpv5Rw3zpF4WTsGtFhqSUV9f3O+RJEYUgHxketDfncihI8Pj1Ehm3TL+sBRCMNiDXH94Wcjyd9g83wU13FVRnI+uRrMMatnhsliiPfZ7pO5TryuIgHjduxNYGkySze1NaflAmukoyOxgSB2i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=2T9Tm3wO; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="2T9Tm3wO"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-313067339e9so448694a91.2
        for <linux-debuggers@vger.kernel.org>; Fri, 18 Jul 2025 15:22:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1752877370; x=1753482170; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=lhj1u82B0F9QPnrxvm/QYu/1ZpMGuVfnk7XEA1Uf5kw=;
        b=2T9Tm3wOcmU+2PEQuzjuzkOtbXzUloZrM8i/91cCmQWSNFGiV5h3lKPI36tuC/EBb0
         6iq9Zjjl8t57VL2rlKgZ3T6qadUl/eHPtHV7wcVKkLL/2UzXFboh9WEnl4FrOSkSj6s8
         9aR0rz3s+GLBvmqeEKvTAOjQkCT3utRlV2AOtXWTDkBKXgYd+MYpeI4aMy9VFtvNOgCT
         kZQSwebFzuEBctLH8+o0aUAn3HN02Ily4dSSBdMEmWdw4BR+SJicjQMwzGu+spaZNU6M
         Exe8B7IPaoboySC9CnO+B3m2PLbUx4bsvQcq+2kTiLZru51LW93o29dT3DREiX6C3BVI
         IRvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752877370; x=1753482170;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lhj1u82B0F9QPnrxvm/QYu/1ZpMGuVfnk7XEA1Uf5kw=;
        b=qGGsT735jv22aQpHYnICt8sqqlQPRUkhZyIm4Te3gPoYtLoSKeJuxkRe8D3vRxWD0F
         N+zugMQIj5Cuv7hqXcnp7U+XIqJR97+U5KmvSHRZo2sRIPv74wJqvLDkA4H4mvfE6zjt
         EnUSSjCLAiEe4ezAe07YWL8cZHxd0fB1CSiMPiR8DFS+OajbqRxnjnQatarAsDI/3VEx
         ntIwp314K1JgY418JgAioxSr0ow4jFJouYLY1FczlqxW+veZaW9vK25yofW6cm0U1JDC
         Za7KnUASWBR8dpYoXw4dUXVgxMvVdAyN7zYhTkmsJ58B/QF5bWQCMVxxu+h1c7wgMpJ3
         g3Wg==
X-Gm-Message-State: AOJu0YxkaWF4xhzET6yucdrkIVAsZPU8cG+KWfAEcXvqpY8ZM1x3r4Bs
	SHNZrSWHrHuqUeafvxQMutkXXCvlS74V1qhskGPd1v3fc/dzf/18yEkfRxXeRIugJP3ullNgOE6
	hWaLt
X-Gm-Gg: ASbGnctchrXcqee0W3ztiRyL0vjH1G1vqUks46LMxgJjupZc4SoF+eUSstT8Ev0w7TB
	hZ3Ro/qshLOgvzHsWGzus+OPNRb4ESImPLPPsE+KOgg1xuJSmFStoC++XRVndJQIg1fFH8s3GLu
	IuqtNj8PBFwLLI42G6eBOo/PFnag2cBdbLkvM04jv5SnxPzELyp74HAk5Jl0m6SPxOydV+Qj4hc
	e5/jlvb62Ua7IhB78CHBpcTwzDZ+Zwb0zA+k35SK427EImED4m+PzgSunBZzWmOzd5vytUNr2vw
	R9BK8DaIr3HGRVGqkZFs62wi0cuYEFURxpiQ3EYSjNAFoIGEOUEs14ra18GFeLPtCpo+8tZst30
	wo+kCNg==
X-Google-Smtp-Source: AGHT+IEHxzDFswgB7KOlJKbmbd1gV7HIM2sotREr5hnTOmzqGT9LUNVlkRPYROqvnJwQYUBEpoynrg==
X-Received: by 2002:a17:903:1c9:b0:224:8bf:6d83 with SMTP id d9443c01a7336-23e24ef9432mr69886005ad.8.1752877369719;
        Fri, 18 Jul 2025 15:22:49 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::5:bbaa])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23e3b5e475bsm18427445ad.29.2025.07.18.15.22.48
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Jul 2025 15:22:49 -0700 (PDT)
Date: Fri, 18 Jul 2025 15:22:47 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, July 23rd
Message-ID: <aHrJN-KZuveubHmi@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is Wednesday, July 23rd at
11:30 AM Pacific time. This meeting is a forum to discuss development of
Linux kernel debugging tools like drgn, crash, and more.

I'll be out of the office on Monday and Tuesday, so I'm sending this a
bit earlier than usual.

Here is the agenda so far:

- Status updates on porting crash commands to drgn:
  https://github.com/osandov/drgn/issues/507.
- Exposing SUPPORTED_KERNEL_VERSIONS in drgn?
  https://github.com/osandov/drgn/issues/502

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
