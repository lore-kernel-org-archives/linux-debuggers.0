Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DD25712E6D
	for <linux-debuggers@vger.kernel.org>; Wed, 19 Jun 2024 05:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718773232; cv=none; b=GcS/RhGVvo3kWNes+qlAmt8422tlQXSipRAt0tbEsadfJaiiD0TktcgY/JPwTQaPnV4Kda/HIH2CsDP4S4/J8rP0jeuOEacbR6S2wPCjWyjBzrwzM2xKKAHgqPJ+mux9gMcgxL46xQucfXYK6uQDTBIp9gZ8hS/dGBnlTsqDNVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718773232; c=relaxed/simple;
	bh=pYE0gJCDDKKkmIPoabVxQ9BAdVX3u8QB/n4cc/zOZLY=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=e05HOGF1MPfWXwez6e1RF2EmLanzkTiJGv6rwc44ZwoeCyOt8yuWjOGeqQ43d2NK/PRs7PlYMfdAd6w06I7jIAFk10HSQqVHwczNza/vz06G2LlBaABHyxUHN03wL4eAyonyFF5bAxHicSr1+mNYKvug2LWXbI7kNJs+bCwCftY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=rtKrxwyD; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="rtKrxwyD"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-2c2c6277ef3so4975461a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 18 Jun 2024 22:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1718773229; x=1719378029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wdqYdzGELW4IMh8dvRt2slYw0DUpWprPFoFZwvvOnhg=;
        b=rtKrxwyDR/JaWqWgDUr/FPDhUtjJxupRHm+8wH2P+hN40S46MfegGRELWqLMAvjZT7
         0Y/YIy98KzpD5O7nQUFaNUp1w0oL7jn+JbUwQcB2HWsXYxk4xPP2uj56/VTeG//NC8Cl
         rYJNuDSJe+tKU7w6yDuhdR7S7Q7P3np1VRhl/LTxZ7bA90fY92HvSpz02Mh2JfX2aizN
         7t1+QqibKAWTs0Igj2nS8q35xeFh/0NHbWbK/qhuzHO4lEL1aouPEbDsNdzi4eS/LD9x
         S4WH6uxAoPDY87dGhPEtUiVKqWJpfEgUpeol4CWI58E5vsrMqa3IkkA3KbVZKh4ebwgS
         lP0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718773229; x=1719378029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wdqYdzGELW4IMh8dvRt2slYw0DUpWprPFoFZwvvOnhg=;
        b=Ppc9NRcT/inLBcsgoP//95mJdyrWIp8H9tYwj/hRFM7oijXFkYAULL4W1wO42uSjiJ
         6iz/UhT7EohhVoaU5zYf6sxiMMzyzK4z4+7pUx7ktQPxxpm1mWvpjZn/Tqwkt/9X/9d/
         p9w2uOHloHbk/Z21NQM6itbLO+h5eJStDG5nVJfzY6g3TVaQagfKi8bQAIcbhWElHIkG
         PF3Z/jqWboD9U3DOwEWpc3sBgJ7iNk4Mz1klwAwZJ4o6xPM1L6vzMI7e5xWq4onvEjm9
         zxrLjzmW6jfG56igtvx1zIMVh1Pe/oksef6gXgFYNqFKj6AmCpFmGR3TCUy/w20pqtZk
         96qw==
X-Forwarded-Encrypted: i=1; AJvYcCW/IJGBlz7EVTkT9m1xfEsKbl89q2V+rYcZCq0b33Zatp+H28gN3YGSIupXny2eSYvSZ0GJtT8lFQamWbWuyjCYatcNp5JNTloGLd6vUc8q
X-Gm-Message-State: AOJu0Yz5rVU/xKR+gIvWE2TjehFivUMiorACk12YAlHQKG6JFR9qpSZR
	lNEdxVcTq/0G1B2Sqco2gi3UO7XP1Uezux5H+reG4TY1Pe+OsHr9+AdEERfVcFc=
X-Google-Smtp-Source: AGHT+IFGKOapms3+4yZP/y65VOPCtRvSPTLwXvy7mVzgCYouExeFAtg/CMJ7sjj/S52Xdj9Wns6vQQ==
X-Received: by 2002:a17:90b:3552:b0:2c3:11fa:41f with SMTP id 98e67ed59e1d1-2c7b5daec84mr1538586a91.45.1718773227597;
        Tue, 18 Jun 2024 22:00:27 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::2f17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fedcf36be7sm7457523a12.1.2024.06.18.22.00.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 22:00:26 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: qemu-devel@nongnu.org
Cc: qemu-s390x@nongnu.org,
	qemu-ppc@nongnu.org,
	Richard Henderson <richard.henderson@linaro.org>,
	David Hildenbrand <david@redhat.com>,
	Ilya Leoshkevich <iii@linux.ibm.com>,
	Thomas Huth <thuth@redhat.com>,
	Nicholas Piggin <npiggin@gmail.com>,
	Daniel Henrique Barboza <danielhb413@gmail.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH 0/2] arch_dump: fix prstatus pid on s390x and ppc
Date: Tue, 18 Jun 2024 22:00:11 -0700
Message-ID: <cover.1718771802.git.osandov@osandov.com>
X-Mailer: git-send-email 2.45.2
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,

I maintain drgn [1], a debugger for the Linux kernel. I ran into a quirk
of the NT_PRSTATUS note in kernel core dumps [2], so I looked into how
QEMU's dump-guest-memory command generates NT_PRSTATUS. I noticed that
on most architectures, the note's PID field is set to the CPU ID plus 1.
There are two exceptions: on s390x, there's an endianness bug (it's not
byte swapped if the host is little endian), and on ppc, it's not set at
all (it defaults to zero). They're both easy fixes.

Thanks,
Omar

1: https://github.com/osandov/drgn
2: https://github.com/osandov/drgn/issues/404

Omar Sandoval (2):
  target/s390x/arch_dump: use correct byte order for pid
  target/ppc/arch_dump: set prstatus pid to cpuid

 target/ppc/arch_dump.c   | 21 ++++++++++++---------
 target/s390x/arch_dump.c |  2 +-
 2 files changed, 13 insertions(+), 10 deletions(-)

-- 
2.45.2

