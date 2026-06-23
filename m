Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B10973845DA
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jun 2026 18:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782238754; cv=none; b=LZwx9ZE2j5XZS5VdgTYmA4ccu5LfkXz9f+YCMwsXDaE+LiH6oeevAfxw4UzQtvpT3CuP8Pf+MnySbFJ/7te5k9ybL4rDS8phmQNyjAjevkn9wRx1eARUCI70Xxd33BJiybDaqqtoN+mWyDiH/PTlU7UdrguGW4UkOeSzwY3WaiA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782238754; c=relaxed/simple;
	bh=E1gSUibELMUMjvHZBfKVgYdMGVXplUX8iGifwe7kwJU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=a9h9401jep2ekikAiz5oqZRsj1+WMLJ6swL+bh85j1ZJU6smpYJrFc8Vp5sZPe83NQb05TEFoOuV5ljhSJkZyJwiwavcB2Ipv84HWC+mgN2fAwdg+v0fHTJeNI3E8nk4Oltyo7Lal1bzJvkBVJex5rn8tZ0i4JBQoWdabGq7Ls0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=drES+kVr; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="drES+kVr"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-8431bbe3ebcso37560b3a.0
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jun 2026 11:19:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1782238752; x=1782843552; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=DPwLSBcxf7I2/gHBCvUl7W01SswgKJ1NBJEasUPTPGU=;
        b=drES+kVrweNhM7cCMBfeNef/fWXn5pHLsCUYSJcGMPOxD52xhx3qrqZs61ePEc/5/k
         mfiHXwD2du26yE5yWB9GHrNdYaehAVFAd5VajIhlAH7TYoDmvGXVAPOO6S80spZU4Y3E
         09k/TgLiOC3YONLiOjalsFbgz1LEhm94r04wGQLrgsJthmZe7VrAQUKKHs+MXXgxLHVI
         E/SOKta7+injincXC+9ldYJtNHvvs+2WJbSRCxBUyC0aR1Cv10M9M7hxBXhObpKyYYql
         LJTk0aEqhiZyqdQpwi3rVY+OtsYJVsD4KEXl+NOkaxCA999kTOu5LIIMKapr2Va+pze8
         UuTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782238752; x=1782843552;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=DPwLSBcxf7I2/gHBCvUl7W01SswgKJ1NBJEasUPTPGU=;
        b=T6QSCbc4TZv25ZWc0nb1nU7/C6DXrsptfRy+yklxLN25TVdJjX3p666gPWZT40oP1x
         yXpAN36gzsBqLc/T0/s0cRvsSrxXZFnCV8vOHMpk8z3fhTZI0FkXEA8gCAX4oThGh3uU
         kEsHq4cAdTNuDJhutEQ4Ll/L5fsEZUrDcU5zoHqy+FcgJ0MzLGaAJw+hpSrfI4h8WQjW
         oa8DXsDTdILvsATN4iZQr5cXXt2HqghQitFAH5aHQpz/gCLNAZS27rvkMTC7fYga/8Pz
         o+qTOKdfd6nJmQPL82nsouUzqe//odBAZ9lZlBhuE9AIzdgQupthmtYn59FSoxDcaDPJ
         YSpA==
X-Gm-Message-State: AOJu0YxGNklKD3ewukzg5rTC0iPEVZe89kUpUcAXQXd8l3QaquoSd4ux
	I/4ROrQsvykCSAvT4JgO7nlWnIvykdrC7VWeoT8Qsu22mLrDq9WQs4PwLRfLAtv/jLPjtSQo4nG
	gdtOd
X-Gm-Gg: AfdE7clpIF925x88VjqMO07s4otbCyWCF83G4txIniGWjVephCeIw4bIBxz7Wm9uFsY
	4Yv5+7qKzrk7O6ERM3RXg9/Z7aeF7jzl4z9ymn6fqFgqb1HFHscvb5eOEeoNntgGIBrBT1DSA2f
	l4XVm5mVspm4wVhNFi2hcUnp6mtDMXxnSQF+dASUXkUsOTPY4mUELjOMUNFu+Elr1FJ4EpgvCsO
	Uaj6JvIR5qP//hIBAGTNom++F8aVAfzfIyXm/FgcxbkAOnq/akPQeBhyKmCCMchtxy3tngqmV58
	St6PxeMHrLn56idxV2h9NMGsEb/8dqugunIqQFChGZ5Qs3JEYFKR15gD1RhgpUDOG1+5AwvTIzG
	ZbKyOWpCCgRL6p6uJdPFWFvCi+8+S62Z+Zb6xcGVZZnkZlIS4ZaZdyZcI7faN/p8aIqQmpdhgVY
	cG+ESlOM1tzpx1pVgzplwAMlh0m6fDCd5YUG8jO39OxoEe1+p86SK7FdJHVJH14Td0D3smOwywa
	dMHDI2N
X-Received: by 2002:a05:6a00:13a3:b0:842:2d2c:2b58 with SMTP id d2e1a72fcca58-8455fb1481dmr10816356b3a.5.1782238751760;
        Tue, 23 Jun 2026 11:19:11 -0700 (PDT)
Received: from telecaster (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84564ed3bd8sm10746914b3a.56.2026.06.23.11.19.10
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jun 2026 11:19:11 -0700 (PDT)
Date: Tue, 23 Jun 2026 11:19:10 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, June 24th
Message-ID: <ajrOHg56xgeVIhMJ@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, June 24th at
11:30 AM Pacific time. This meeting is a forum to discuss development of
Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- drgn BTF support: https://github.com/osandov/drgn/pull/625
- drgn execution control/breakpoints status update:
  https://github.com/osandov/drgn/issues/626.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
