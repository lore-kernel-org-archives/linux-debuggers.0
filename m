Received: from mail-oo1-f54.google.com (mail-oo1-f54.google.com [209.85.161.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B870D1E484
	for <linux-debuggers@vger.kernel.org>; Tue, 26 Mar 2024 22:49:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711493346; cv=none; b=Uyyd2C5NW7XV1160dfyCA1nw2gQc/0CESp/nA1xl2vZWY6aEEmw5z8IK0yX4VXNwzdctsUVZzMaIwZQjR0KO4s/zZFOAWlMcTANS59uVuCoNlFif5WEzywr+xMR6r8YLH9db3L0IWDdphHByXPf+M1B+LbTyUgWyuTWbKC499RE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711493346; c=relaxed/simple;
	bh=1RZSGqV0tBcxFLpFANlje8vFlUZmG/iqqDYA7Kv3o4k=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ettRzvqMOXQwcCvktrAuSuLOFiwJO8sV0zyGFOr5KZ2sG7YwJIB4xnDLmLLFbej03o+eKWS/sMjz2LPml9RCh8qa9yEfVMuAyNBgOTfaM6ZSZqXFADtBNR5H/N+EcEh7ViBJziWwPd7sc7YY7PiN8aDrteZ3U16m762JWnu84pU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=Lqs6BslF; arc=none smtp.client-ip=209.85.161.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="Lqs6BslF"
Received: by mail-oo1-f54.google.com with SMTP id 006d021491bc7-5a485724ddaso3534748eaf.1
        for <linux-debuggers@vger.kernel.org>; Tue, 26 Mar 2024 15:49:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1711493343; x=1712098143; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R4cotcBTYZnRW4/er7cjxEkhVrccH0ukgUGYVYzibjs=;
        b=Lqs6BslFkPVe95Zre/l8Ltef4odr3QTHgRm3D+rqofNf8NuwLbdblFaFMtjZQwjTmT
         amNXYWlqrJAqm8qf/uQFiDCBquKqKjQvKvn3ouBmfBluqtmmxNyqCavuYH2iyOR4BgQ3
         e2MmZnvjNywwsWRYjLkdyzvT41gV8UGcdBiihwimNC5pJ6AxkwU2HaQ/Mf1sT1HLfGOu
         g3K3ijWAP0AtQLVT4w+lyToZeRLm8RlF0nC/yPP/6YjQDFfdphPTiCFZWUgW4nuWOljt
         WkHXk/vgtrv8CSLev4yMfowGvAG6CoSVPgMjqdyFZz6fSl8qbj6AR3QAW3YCbpbpTLh2
         AXCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711493343; x=1712098143;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R4cotcBTYZnRW4/er7cjxEkhVrccH0ukgUGYVYzibjs=;
        b=kZWfJ19dPl8IMEl0NGLTGPdskR1B71VQ1U32Hyt0C7R73aIUs4cvHuD3Pd00NrMijQ
         U2R+aQgtFO7r/iaxRx+kVmRafg8QlEUob0M9xXfiOr3R1Iypi3GNVMGPtJa3TBNu5XDF
         0LVfRUqmVdLHyA3Jeu9WB+q3f3gFRZBJd4FhVoRy99aytsyXbvcjPTLciY5g5p7eUP+j
         Y8/0yMais2DY/bKR+NKrR574salOSHUcz0wyqAOw4AXF+rSahTSuc2n4vtVsBAnTv6A1
         t3lRTk8zQsXDeJLPHD5cDtyR86vGe4lv3kosjGTceOZFCVvV4AVQ+uFRW3vsK50vEhf+
         eg0A==
X-Gm-Message-State: AOJu0Yw1qwLYOeq+f+Ygpu9znNE1GAiaYQ+CbiUuHIIc9w+sevdWgI91
	iJpmgIaBfHM/SVYziG0iyvgz+UJ84DBcmJmV518yCOsOT/o7/+bh3U871GfovqUYnV5oJKweXmj
	H
X-Google-Smtp-Source: AGHT+IEp6+BgBN6T8a/+/ozbE8B7t1LZW0QSRyuojVHOh6YGS8zSmGkRCoe/FarBiibuOCRxRcPFWQ==
X-Received: by 2002:a05:6358:c017:b0:17f:5f96:4acf with SMTP id kv23-20020a056358c01700b0017f5f964acfmr2806482rwc.11.1711493343102;
        Tue, 26 Mar 2024 15:49:03 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:fd1e])
        by smtp.gmail.com with ESMTPSA id e31-20020a63501f000000b005e4666261besm8020263pgb.50.2024.03.26.15.49.02
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Mar 2024 15:49:02 -0700 (PDT)
Date: Tue, 26 Mar 2024 15:49:01 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, March 27th
Message-ID: <ZgNQ3Q0UGRJ0oNP5@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
March 27th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the proposed agenda:

- drgn module API (https://github.com/osandov/drgn/issues/332) progress
  update.
- DWARFless debugging (https://github.com/osandov/drgn/issues/176) next
  steps.
- Maybe migrating off Slack to something OSS (Matrix?)

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
