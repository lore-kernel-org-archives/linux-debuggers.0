Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CB38535894
	for <linux-debuggers@vger.kernel.org>; Tue, 21 May 2024 22:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716329361; cv=none; b=So+fWhnlT0vCxetdwtc4P+DYltmaTVZg5CG22eCoiDoBUD4FzOmzAgBtt0nXpm/6A4eqqBj7va7NmtSdcaSU+QSstBo3aHb4ukkEQajCaJGvcpImWVLbDGi6u5bLRB24o5tQK2+1rdblqp/de6FerpiCptnjIguXJJWi0zt4Ml8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716329361; c=relaxed/simple;
	bh=Rnj669xXHjDbuKX+IbZVYM2f1b0+gRYSWp+5JnubUYE=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RcGDkdIFs5rhEu3aOSy5xZsAv2URmjSZIdiDVvnDyUTXd2ld/lNEssxs9qIm18oIztf6zkkSZ9KhU2dr4Zgwe5F3IYQ4NxM4g0q32lSTNWaX1KutKeaS0vazy5Unb/e1i6F6n+2ZPoAWwRMzftYMYwOC9nrtY7BItboWNCKwPdc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=TkcmTe84; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="TkcmTe84"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1ee5235f5c9so106884965ad.2
        for <linux-debuggers@vger.kernel.org>; Tue, 21 May 2024 15:09:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1716329359; x=1716934159; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=u8PepUpx0qkncY18spxbQ71SpdZ5CGJ5tlZyxlPgjzk=;
        b=TkcmTe84kjoaEggqTkJtlswW0dIuw6ePz1HltK+4QMWsieSOzbqa5KFt7XjZf1n+QM
         Poyld7KLSoDYJEsUTE+a67UD/quIsqhQ6vSE52el90BCxFSkbErEAwDfuytMF0UgLcjS
         6eW8l6DdQHfVZg3LqhH9v/WfGyeaHWzH4sE0/l32ZNszG5B7IRg0/NU/p7fuOXCI7J64
         tx2yT1iEcJJ8dGFCS6KAnkP+83wQTxR3RhDruCPZ4kpuz+ZYDTG062/hmGHwjOG2eTWf
         9TKj2OuYsJMJmpaHAzbvfYYHDzdaBJgD7WtVeyDFYKMMrF8ZUNtbaIyp/qJX1REFnXku
         NJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1716329359; x=1716934159;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=u8PepUpx0qkncY18spxbQ71SpdZ5CGJ5tlZyxlPgjzk=;
        b=gIaMfGp93IuPueEHirHZuijvcZ9Tew8IUPGsmV1rPZ7HI69h8/Q3SMo8nV7LMjoO4G
         N/wuqkxNiX+usccDMvs6t/fGIaSC50RkSsT19rnmsjw36hf9E+cixa98kTbPuq7qzs5X
         VRv/5L50G+II5BTLjr3Xj3iR/yjjmIawCdIX16uMYiAMdukYB9JAMGlTjeny8jPgyQ4B
         yL0iWRg1+k3XvrvsCP5KpT3XaBRhaCARPzZmAywUtql/FC6uZK1WR2aPkzn3E1wmGK5i
         QqbPCEQ54EHkjlFb/PYeCy8ZiqwTA84ak4Yat+yrLWnc2uA7ZiFKjcLLX7Ukb5fQnqLH
         8l/w==
X-Gm-Message-State: AOJu0Yx4DSiCSw+4vhWM90VVXKIIKh+sutXp6RkRPgyGdPU0iD/Ye6KK
	n/d2/p9LiEjU6Ka0WlvHiwmpjd61Rcgr+ii1E+Vf0+QOV/vhVZ+56CBdPWPmu8N9O82GfYcLetj
	cD9I=
X-Google-Smtp-Source: AGHT+IHDSbrMn5aLpDQpqNDYexSP7pVr978uw3Lgb8K8ClhInvpihOrG8SGIpnFlNfRaFM07NbXlXg==
X-Received: by 2002:a17:902:c403:b0:1f3:cb7:b10b with SMTP id d9443c01a7336-1f31c964d31mr2135475ad.7.1716329358739;
        Tue, 21 May 2024 15:09:18 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:400::5:1418])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1ef0c256429sm225048235ad.291.2024.05.21.15.09.17
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 May 2024 15:09:18 -0700 (PDT)
Date: Tue, 21 May 2024 15:09:16 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, May 22nd
Message-ID: <Zk0bjFU2Q2qSb7kf@telecaster.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
May 22nd at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- Symbolizing BPF programs.
- Synthesizing userspace core dumps from the kernel
  (https://github.com/osandov/drgn/blob/main/contrib/gcore.py,
  https://github.com/brenns10/drgn/commit/42ccf287775b5f8bb75546397704872c7d14c7c7).
- Extending drgn's object/type/symbol finder interfaces:
  https://github.com/osandov/drgn/pull/393.
- libdrgn unit tests (https://github.com/osandov/drgn/pull/392).

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
