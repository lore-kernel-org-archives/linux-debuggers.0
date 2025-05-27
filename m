Received: from mail-pl1-f195.google.com (mail-pl1-f195.google.com [209.85.214.195])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 936DF2566
	for <linux-debuggers@vger.kernel.org>; Tue, 27 May 2025 21:47:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.195
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748382435; cv=none; b=tjsdKccU03OsAS/zKzT09/ciwlDbFuKy9u4mxWzDh0Q5VAlqGf5AIPy0kF6aQ8KMZyFeICQIbie561L4jlBtQnSdT2pmxbOlxtNXPfOCkSt6Gq6O7jHnD0G4N+Y9LXWIConZjfsDTH/95bviIXykK2t27MkIf+9aV6sDKgSsqmg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748382435; c=relaxed/simple;
	bh=vezx6Mx3pLvvHp89qVzGqo+N2wtNMmNblKocKvDl9kA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=AbbHVMvA6brFFBB/WepQsVeaC6uOd8VVyT+HVKLckPgjkbufz8c2LtC7+WClkP7rBeofDzHMTj4M2ROnzHtFaBtgc3jgVezOs0gjN+zJwdkZESpEByoBp7JNUxzxW7mtNlLfl2R/QOyQe8eEYGiYpze4pucdnKpazUijB5ezp3c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=QKwNtLrD; arc=none smtp.client-ip=209.85.214.195
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="QKwNtLrD"
Received: by mail-pl1-f195.google.com with SMTP id d9443c01a7336-231ecbe2a5dso3861145ad.0
        for <linux-debuggers@vger.kernel.org>; Tue, 27 May 2025 14:47:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1748382432; x=1748987232; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ra9xIu+5mqffW78SBQcCGrEnq3NPDOBYJs0ohLfRFck=;
        b=QKwNtLrDQFBt3oIL9+mm/6FXVJdtnSZDPalXy/jR7LxOhXNF9tPZFT6X/BvTh5GszM
         wULp/t1hHW77iVn8Cp1Ooq+Q0m7ttxqdiUU25TI8nT9U3KfpPMQGYjHumXKBPc6VvK+N
         7jwlSvMfB2LJVJcvFmRkbIZbobh9qrzf67dQtq7m3Ef9pESMahtWzTAnRvyRjgJD4iAx
         RWoj94oyoyF+7HMXiNEQf6uh5dOljDyqILeW7g8A7InzUWr+hleSkcsfAIZcDl/LVSX+
         Xaxx8wfGuxjfAdEWTLx9hYIZQfZ5/kEzHvgYrx4icFq/wfvzGLVXolggnoHUWBQOk/q2
         QkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748382432; x=1748987232;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ra9xIu+5mqffW78SBQcCGrEnq3NPDOBYJs0ohLfRFck=;
        b=BiXZ2VLVMObBkVfxVE3RS/U4P/roPJ5dU+q4a+4IGXxpGv32pM/REfeAqXMvubLRtt
         RzxDOlliLunnp1rjMAzaEcc4FfVp9bXkjXLPkQg1Y+PvzHRyTLaZTVDATwfJIpc0uafJ
         41JiNQ/HvCBJXIEgQrhPkh0uttCyjJf2n1X2UiN4xCVa+WOC694SPhOQVE25F/8jRDDJ
         iqoPs1QyT6NfJ9edXxSYjTVpMi7OpsmWULn7AFJKoJnHxQFzW15lLQuVfQJWTcU9V7/h
         QsmN7oMF/7ic6DN8qxfO0tJpU9Wj9O3edyQo29H5HSWS3Uqy7kWEQavTKbWTgPP6AtkP
         rlFw==
X-Gm-Message-State: AOJu0YwvxrjPuBPgMNSvOaOWZOsOIJGC/+8oyRAJoRZqjH4yvhnhcrRh
	BtxYWWgMvOsYiWN43mfjMkqepgXA472EQ+jBrI+muiZq00ed32TFYxQ+PPPYUcMYYA1WDQr2xuX
	gh+/fx4MrgA==
X-Gm-Gg: ASbGncvCYJVkSGIMk2n+wWnUfkg7HI90NOuoSSV1mXp+LysgjtLu/YeMbwsQUD+v+eq
	6RrXQ6JRxIVxC2qRdzhMWuI4+MZiZobMy+F6UvQGfFCt+7fiPP4H7ncmwvu5ikQWPW/oZ6MfHqe
	s6wKjlzil22u+wHkhLe14IAFwvDG76VeCXPk3Qf21NyOvFrUxQYOwXuoowUO13LpKr7rdQ7KrMR
	TDZJ9+MqDfEOyudQ9ivp72qR0uZAxWVMREfZ4DhfDnin50RJ7BSSilKcibYYkJPTsg4L5Ik1Ode
	G1qDTad5A4azBPhYB04KbDy9aR70w4jSB4MT4/Rd6GGlAg==
X-Google-Smtp-Source: AGHT+IGl2LjXnxxlLDKd7AUQKN4REcfMS0geXDZBIkzRgjW0Rzc5mxgfqWO4Nm0apE0ull/2RcId7g==
X-Received: by 2002:a17:902:e881:b0:223:5c33:56ae with SMTP id d9443c01a7336-23414fbda52mr79014495ad.11.1748382432502;
        Tue, 27 May 2025 14:47:12 -0700 (PDT)
Received: from telecaster ([2601:602:8980:2c70::9e05])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-234cc24e5e7sm509045ad.214.2025.05.27.14.47.11
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 May 2025 14:47:11 -0700 (PDT)
Date: Tue, 27 May 2025 14:47:11 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, May 28th
Message-ID: <aDYy37NBkt7mdaJY@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
May 28th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- What to do about drgn --debug-directory and relative paths:
  https://github.com/osandov/drgn/issues/500
- Non-contiguous kernel module address ranges drgn bug:
  https://github.com/osandov/drgn/issues/501
- Progress on porting crash commands to drgn.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
