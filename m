Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E17962EBB8D
	for <linux-debuggers@vger.kernel.org>; Tue, 21 Jul 2026 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784667295; cv=none; b=cpQHDv8jBDItbIBqHCImkv2KsiuhAHq0TMukqnhEbRSrtAFF8u8U92zlUWrM9wXf86xHC4ogYe3qEqIZ7/w4YKDX+GmAgG1tadFQN0vC7dGBTjTFAsHzYKN4/L2NzNOH98VLTmAYZ95gAjtiuuGb5+XQTK9NOWUl1bQCx4jPGEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784667295; c=relaxed/simple;
	bh=tpg/Bwx9yMqcBocTPbiK3DmI8UBaFFmdOxWB9+jRy94=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=umpcDMbeCpbiWPgfEiH2kmfc8cdSDkIUUeRX+qEvAWikMo1Oz0AyNrwp5qmNXROVL1pHGu5/PtAFeH2xUCyFDrM/6pYoRQ2SzXoyTkVBL3XW3tToyi04lTIqEpBhSl2hGu9i1pYCWJv8RFCjUVLG1G0NR0VMlLBNO8BnY2L1I3w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=ihx+aoyN; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="ihx+aoyN"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-38e5918a0dfso509338a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 21 Jul 2026 13:54:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1784667293; x=1785272093; darn=vger.kernel.org;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OVjlsphodRXEywqHJwPFP16yEDesqQfaq8XIsGw5N24=;
        b=ihx+aoyN42q0iuzav/mG0B5YUeU0BW6wKurzdWZagJMIOMwT2kPkzmtgpAc02h9+F2
         ya8WfQ7ilCtbr30qjv/pRSgKU8uloZIWmuLuZfHqEtm8r9EUuaC9vyEtgczhPdm2ZzWk
         S77JCDAj8yIFFEOFNOJwhEry8tKIUXs9mM3ZfLWEHcx+OQzOVZxlqroKFdNTFE0IElmA
         QcE4BJoq4p/3pKF4D/cY2YY0U6AAvZBBtEYBU+2shdfwmCTn1KEr2dcgDrSpmsBhTRhs
         bIyFFLARmc1e40r6jpOw1RF09MOPppDF4pXWXNXj9wGLV1qkeIKjX3Godb+45FrWWoMj
         Rpxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784667293; x=1785272093;
        h=content-disposition:content-type:mime-version:message-id:subject:to
         :from:date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OVjlsphodRXEywqHJwPFP16yEDesqQfaq8XIsGw5N24=;
        b=NR2xd1bOZNbDZxB3XasDQi7eq6F6jh0lEq/AskL2BF4YXDXgDax6UEk5VXg5stGnYQ
         o1Y/VxdFPt8etTkC+3j06nsJ7kR/h9zyKDiuWZ4KQfIvGolyf9Z3ns+5EwsI60QakxFt
         pDtiWozrSaKUBslM44U64eQu9RuHp2JuKsQ2exnhfIUqYgu3SNuUVlYKqQ7ylbNbvaIr
         XRJ061KAIg1rdov6imULvkkD8JEtD6NLhitg6DRNrXAbWgQMGH+Xk4IrXj8lz8FxnlwB
         hV/th75X4dLql1jwOmQL+S4BWbq8/NkRkg8I+EG1bBGGCU7VuP3MPHPmqQB2LzwP/Kzf
         1Jig==
X-Gm-Message-State: AOJu0YzAYSGhRuPrAw3PAENU44+QC1dXf/O4s8grr4M5q/wDHA9FwCjH
	/dSCJ+n1jjmDFWhT7i8oidHPLuVTq58dpfnkr48gY/ZcQnxuNKITf3ZbFxs4DLUiEHni4L/PLhj
	NWrPVUwE=
X-Gm-Gg: AR+sD12vRgf0RKpqzgBoHWa+7jkr2ARgoGhI2+a1KpiaOsy8FfZhJgn6TX5ipXE4yN+
	5DiFc46oDGelgBDSFnDfdZu2iMb4p3DVZJXp2xvq5SyMm7rlMVfsILsP/136g2SNs7GhsMZlaai
	n0wLp2+DtmkWwiW6OZYgM1CkNaXvFerwsBaVOwVEFGuY9l1fLwmBXLFvpnlGdL4z3P4DNdJfiw1
	o8XWpExVEszasqOK+Gfb9ULz0Ml6VQ6Oa5/cZK3UZ/twjHWdUsGpzThWBauzTfQgKNuZYcZDu97
	PE3obRSTa+is9vsMqhye3tIGh5b/KEZSl0UVo55dn4qqJUncxRxgJzk3n3ombKYosdLQF0y5q7U
	VMU0yywX0E7v5OIi3hXqPQKTJMqtuHsa94GDqC5syZ06y1vHtF6jciBHnc2F7v7Oqz7sjqnHEal
	C19qorHxjdJ6gKhmqe5+TJqFAjRCrc19I42iKyz7EoEoyqE5AU25lwS63a6hD0rL0wXdxo6A==
X-Received: by 2002:a17:90b:2749:b0:36a:5438:cff4 with SMTP id 98e67ed59e1d1-38ea4ba4e83mr523339a91.6.1784667293181;
        Tue, 21 Jul 2026 13:54:53 -0700 (PDT)
Received: from telecaster (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-38e9208f6bdsm2223844a91.5.2026.07.21.13.54.51
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jul 2026 13:54:52 -0700 (PDT)
Date: Tue, 21 Jul 2026 13:54:51 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, July 22nd
Message-ID: <al_cm7s8p4Lqan4v@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, July 22nd at
11:30 AM Pacific time. This meeting is a forum to discuss development of
Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- VMCOREINFO fallback path in drgn:
  https://github.com/osandov/drgn/pull/627#issuecomment-4919424131.
- Reporting main module section addresses in drgn.
- drgn BTF support status update:
  https://github.com/osandov/drgn/pull/625.
- drgn execution control/breakpoints status update:
  https://github.com/osandov/drgn/issues/626.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
