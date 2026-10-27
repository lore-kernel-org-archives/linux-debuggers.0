Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793133035;
	b=b8vre4jtBDkHi7TjYqQOjmPZsvOS10qde0OP5CortwHyIbyAOvuA9/A0J4vHFzNAZHcI
	 zkX+lpKM4uDyG9IvVRlVRYjsY+T1iZJ5mxrqFQ0HzJ/blk31svH2MUt22bHNL5Q/9Te6O
	 vKHP+HZzOaI0s4M4KeUfBSKFhOofLmY9gTFDG4trZxwNZtMBSOepq5KR08aQHW7fRsyUk
	 ZelpkKLBVy9eL409CBR1EkeC57OgBH7QfR67N0hzd4Ls0QoUoqg4jljybKOodMjLug5B+
	 JMRKcP4IzqPaBRx+eEgQJZa3d68JWlhK4LFmfofHKD0zLfZHvDl/qsU6yKYIMy7YIjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793133035;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Subject:
	 Message-ID:MIME-Version:Content-Type:Content-Disposition;
	bh=Duk6oED4hgDZwglRAbJZSRFlPbTMY7SpApvZZBvSezw=;
	b=UmrIOKlyPOUwgsvqsor6/OcFN1r1f11vk2WMiUjZ5Cyj8Dd44mAvihJfVjTHokJYJ8XL
	 HEwbic41edNPoCKPsZ+66EM+bFQw/oPtxamR5J0dhy/brAokU4PKW+jg9ZXe+9CFeEtsw
	 G2i0bgxdOYkOqo7YNtzksiv3rbF+CnLL+aauFFFEm4nKR4+wAavUMI/BBZ+SW0et113sT
	 oy0l1KXsIkHOFJG8QqdE2U+EHikzyc5KTqQicGuLvp4oTrtI6Z0AiwOzYeNrFM0ZypdSF
	 MP4v33LUyqTJ+vjYic72ZngSQBNB6s/ScnMMbdVIRVXI/EnTrcZ9Ozhf2oWkstFeMZA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=osandov.com;
	spf=none smtp.mailfrom=osandov.com;
	dkim=pass header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=r1TM3mRc;
	arc=none smtp.remote-ip=209.85.216.48
Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A87C606A924
	for <linux-debuggers@vger.kernel.org>; Tue, 27 Oct 2026 20:30:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A87C606A924
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=osandov-com.20260707.gappssmtp.com header.i=@osandov-com.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=r1TM3mRc
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3ac6971aaebso35762a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 27 Oct 2026 13:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20260707.gappssmtp.com; s=20260707; t=1793133034; x=1793737834; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=Duk6oED4hgDZwglRAbJZSRFlPbTMY7SpApvZZBvSezw=;
        b=r1TM3mRcrIyLAWWBnl9/E6Lfr6UghAolFqNqOv7Rrgx5rWGB3BJPQvBD8Wy2LVd+3W
         fxSTL4GKV2cggb3XisMyZqAwrX3rYZnseMk4sZQq6ZMCPFJlBN4VKJ8RDOQU5bHH+K9F
         6/rHT9OT73xMoM0WvUBstGdmg7zZoOv8hZUrMwgZP2xcNzXLAkSLi4sTZ1+oki9MR/69
         QcpSnNP2uT2VFKJryJ/h/0W4fYVz6dKCHx8Nz/RsGlf0nlJYQ/1ahs4+yil8igtBbIgb
         hfKyHY1FwPBWwDz+qUh+1sndIJiRgPGwccYTkbyLc1nRLOXXyk7l2Iuto3CqJREYArHC
         2xOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793133034; x=1793737834;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Duk6oED4hgDZwglRAbJZSRFlPbTMY7SpApvZZBvSezw=;
        b=pHzfyTPRIHt4thCUZyrfE+XiwSoMAyxnXjCbCFxDJgh+FHdfsRTalVJjyIqljF24L7
         T84Ep3eHwEq00yBSS5U2s94bNjJnC3J4Oyk35Y31ccyCnXjAaJnlyziIlVn4gTbZZKDU
         mF54HAYsP5EmbqXlxR9oUd2qm3gQPn3hmHSUrBFHr2phxflnn61sZfLzlOaSQduhWR9m
         9e9UdWGliiKLRa0XouLPdCt+ozKrsXFlftvBL7OJtfcpKxHsCzJkxmacw6ZN0yagbJDw
         FFFhm/uU4XvrQGwny9siPyPEMY+0xxed0wzqIB2St7AMl5bNU82NWAKI+oxJkdDZl2A0
         w4oA==
X-Gm-Message-State: AFq9FYLybffyuCnkiIN24QWpnPGNFC4RC9L7F96JEHxz3qsx41XhdGJK
	ctUD6gBvEEx+tEdt5AJNiwXCQ1ehaRa1uqmwQeYS1uq6SQAa+E9GZ24lx549g7o9EpsQLIdSE0B
	qdZEKQB8=
X-Gm-Gg: AYBFou1DtvkZLPOLNuO4RQxITYIJKct8mMJvISH13CFTMDCndGrEYsprEmbTph+F9+y
	xefxnEBsCciOwT8pZSNSbfbjzBuDWM6g74w2TaE3UH4XgbhUjlEvX9qajxqJKVJn1YT4rrfepAW
	8/K4rp5qssXQemEy+1ugcKWJDW7ePuYLYDy/yfwcQFRHt1bhjrOO3LdRsyTvvSxHFH3HXalE/oc
	s8jMF1Hi5vRmf/cy5r9rec+GZv4UAuHvVjnNERnmlGYD30jUImvAJc5ohKUHuQRba2bwuk0QnaB
	go78pjD9hWgmUhJxp0sdec1nplJO8ab6JxXdZjmsTnVU5JhbRbyxOxcsXV8VwzuGiGucslFlEKj
	OLQT1+PBTAEqPXOFXuOHy+EaVrBVmgqDzOxydle6ivab3RujUj+sF+lu+YdKR+go6E2RvbSSyxG
	LE8xyBXlOzuDEM1jAMCvchcctG9sCl5OOgZQktr9EwZwtF2w9Dt+WxOospI+vmGFyuAEaqe7SmN
	tv4EpmUKumOM4P7hg0thzjCUWNepjzaXKNhKqNkTL78+aRpM1hWNc/4wr538xWJWeab7RsFtaPw
	oPk5P6/dPoRgBIu75WM0lwmOt+Cc/zfgT39MVCYLc+dM0bXkt2RRXrPwUrD1xFvT69g=
X-Received: by 2002:a17:90b:1cd0:b0:3ac:a11a:7c88 with SMTP id 98e67ed59e1d1-3ae581cece4mr222869a91.3.1793133034225;
        Tue, 27 Oct 2026 13:30:34 -0700 (PDT)
Received: from os-N5J97HY9XQ (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae57bc6d38sm306618a91.5.2026.10.27.13.30.33
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 13:30:33 -0700 (PDT)
Date: Tue, 27 Oct 2026 13:30:32 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, October
 28th
Message-ID: <auEJ6HR8g3jNLIIa@os-N5J97HY9XQ>
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

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
October 28th at 11:30 AM Pacific time. This meeting is a forum to
discuss development of Linux kernel debugging tools like drgn, crash,
and more.

Note that the meeting will now be hosted on Google Meet.

Here is the agenda so far:

- Threat model for kernel debuggers. Philipp, Petr, and I had a
  discussion about this at LPC that would be nice to run by everyone
  else. I wrote a brief summary of my take in the drgn release notes:
  https://drgn.readthedocs.io/en/latest/release_highlights/0.3.0.html#hardening
- drgn AI contribution guidelines.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
