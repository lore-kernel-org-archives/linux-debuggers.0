Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C3ED223DD0
	for <linux-debuggers@vger.kernel.org>; Tue, 22 Apr 2025 20:42:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745354579; cv=none; b=oufyqlerZg5cyUInOUD+bmW5qOCNDb9lM5e+RhKrlfr4XR1/JPGEnkHLSKx9z6hYRi5SzAufNYFmQNThpzgE5RAvuHGto6AqCSop8HJUq1QJ2RJ61QqEqmCYGEmIOX+AAvR8usj2MFxVbDwg39LXhvjpcg88AfOmbYCLdnFIi/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745354579; c=relaxed/simple;
	bh=4tz071/JKkyO8GjyMhP0Yw2DuPgEthWr6AvAcAL6dPc=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=GNP+KS8VHg0M5NY+36vp2J88C7bvoiRuIJ9b+C21cvkMA6aHJHvKSihIrK/swXaPO0tK/U0q5PUADCqyk4YmcNUKf7n1ifMl8xJK3jAe7dEFsbQNVkLk0AGm4yuggR2ImbjOBZSejw+jMrytUU8SgOsNcncKshTBj8sBqnqLP2o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=h5Xc8YKl; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="h5Xc8YKl"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-224104a9230so6115475ad.1
        for <linux-debuggers@vger.kernel.org>; Tue, 22 Apr 2025 13:42:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1745354577; x=1745959377; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=rDnRY28IvmLEsqSBduz7okiIg5Hbce83r+EAG/0qcmw=;
        b=h5Xc8YKlvfaKfcdJPCSjJe2tRBjbCh5OJBMg2AcRx07GqdLlngaT7hVplobVs+paF4
         xs4aSU47tt9cu1w5eNOm9BIGe2XG/kEOttSvO9fxTExstuXbCMPZqNaq2v+5n15LgQdC
         9F/a5drwdCywnAG26TFTVWYhWVOQxaJjQbU9AhYNyc8QLjKb/7ECpEunMp30shTXTw4U
         r/ExOJGkrjp0Z87hhw8M0H95ZY8GHuNBgpaJBReVrbi+wgFUfssK1htw1nOyMJdjcC32
         2l3kj36S//j42kzVv2E/WueTftjsFut0jlugy8rTgYf2q+crSvtWqtWUOnQJLKsH9eQf
         ln5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745354577; x=1745959377;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=rDnRY28IvmLEsqSBduz7okiIg5Hbce83r+EAG/0qcmw=;
        b=NlM4jXPniT5u8qAVWCRRhOkhMfGQofmlgJ+IVq7d8qTYvL4R3OUC/LzipTdOjqOpWM
         nbybYTbuPZriPLip1+xV80kbcHvAbHhT/tShUxGm/Lr714ZRofd9C4w5EG4Qz/o+GqkX
         lOL7chkB/pm55e4BR6BDuQkpqJb9KYigb50+bGcX9DXwsmeEiMeHuqBEmU6LUMclLT87
         jqziYf9k6Zy+efUNnJCqtMonN5Y8aDjI2iomHD1k5LHRMukyqKLfQvKy8KEZJayyAjqY
         qd5b9+ZR2hcBVAUVrWrxQmftH/VpgdQI7vAlfEYoQdozs2v6MCeSqRhRZoRqdBdrCl9j
         m1bQ==
X-Gm-Message-State: AOJu0YxkKqtp0d6ZSzIjX0usDIk8X7G6BdlPlgtLoLXMOHHHIfm/TIKx
	zmTSs5GPF9w6p9jqz7avfUZI7IfORm4R2oOzxV/E2C1XuVnmIR9BCQMv0FDTISGdcKx2y8fx4NP
	L
X-Gm-Gg: ASbGncv0TeaO8x5Zc+jJLE6a6hdl43PjEbKm87trNFTjWE+4wO5fFChhqnMK7K39fg2
	ZJRt0ph3uOqVfv2ic9MacPm2PShpFrh+JCIfWeuIAPwr6dX0Kpl9tw0IKpES4u8wxIP+z19XBFL
	6hZlwp/pub8gEHWWkGC6s8P6Y9B84eUrv7SA9W2/FJN/ekIXmehfuU+zQQXluf5ofTriaX4SzHL
	j+4PD/7gddrpD4cnw96PWhGncr/skhjEWOyb78Ferk4HuJOHIQyuwcGjM8Avv3NV5CQx1JWbq85
	RbaKr4VWcHYvt2PmF5E482I=
X-Google-Smtp-Source: AGHT+IE8cooWJiQxw87tkc5UCPBVbrLvYjgVS2zqrrb1tHyYKr72A32vyUq60bMlMJRbqPEXdqx2ag==
X-Received: by 2002:a17:903:40c6:b0:216:3dd1:5460 with SMTP id d9443c01a7336-22da30098f3mr2734515ad.2.1745354577391;
        Tue, 22 Apr 2025 13:42:57 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::9098])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22c50ed183dsm90390195ad.180.2025.04.22.13.42.56
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 13:42:56 -0700 (PDT)
Date: Tue, 22 Apr 2025 13:42:56 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, April 22nd
Message-ID: <aAf_UDW8imnXvowu@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
April 22nd at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- drgn module/debug info finder API first impressions.
- drgn vmtest improvements.
- Auditing hard-coded constants in drgn helpers.
- Plans for commands in drgn.
- drgn kmodify ideas:
    - Kprobe-based breakpoints.
    - Injecting more complex code (multiple function calls, control
      flow).
- drgn review backlog.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
