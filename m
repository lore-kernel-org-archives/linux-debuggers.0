Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9B7217D2
	for <linux-debuggers@vger.kernel.org>; Thu,  5 Feb 2026 20:31:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770323494; cv=none; b=meP8guTaapnJwQYcvd+7g3CiMb2G3HbLy6jO9OSZUTRb+vSlhLpjQdlfiWNbvr7Bz5aj2j9I9v8D3yEaK99olq4L4JX8/CGeZDD5HvB4nSAZhP5EQfvOys1M+82WMVdcC2Eaj8f7wgK4IT58x8giEmoIq+19ypCi6P1TmNyl6Yw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770323494; c=relaxed/simple;
	bh=r7rVXJO9xD9m9Swaywg2N7Tbud/OvJAXA/9DvpVGovM=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=OzCkIlLhSAJf0urvRm89TPfnC5Ak2cRdbSmmN7BP4zCBzY6E9DkZmDlzMzTBg0A+/imsKWFGixkAGkCCQsY6iDsAYXOHY1GYhzQWG3Gsdh/5S0iorSbxEHYLl/yXt+0vsl0k8aaN8i2Qk6COI+s9GeV1fKY5QpO6qo/7uXiaF3M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=ZLjpxpYi; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="ZLjpxpYi"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b71e7dab12so102432eec.1
        for <linux-debuggers@vger.kernel.org>; Thu, 05 Feb 2026 12:31:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1770323493; x=1770928293; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HzClJnGlt44P2yPmX0JZiLGOhhHGcwbrHUAf8MpuC/U=;
        b=ZLjpxpYiZnBt8xUZLf0N2WVCI9morO7gwjXDXl7epRn1KZs0FJqU3GrGb3p9AILymC
         e0j1Cu1NnpAEsjMYhzQDQzOc51EW4eLQwaV3mrjWqLQGyYpq4xDOjxVqYJBIENMObxQ5
         0J13u7STTj/uDuS5kN3ybigPyEcxmxR1CuBWqdOEY+L/sC+5xelCMnRaTqg8SAYfZwnQ
         Q6DJL5lww/yWf9NsGfeIuYdflMIWPBFByujH6MNCer0ebDwbXXgMmprO9Qt9jCE256Vy
         eMvCSJGI/m5vturjG2MZGhDzfliwUfeze6sxCI3Z98uk/Ek5Z5Nb6mCFdvzHOW/2PKR7
         28mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770323493; x=1770928293;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HzClJnGlt44P2yPmX0JZiLGOhhHGcwbrHUAf8MpuC/U=;
        b=F/L+WCxwhK8+SCobAHcMiunevvHRbmx0tphREfLpJj8bN4DrskQoIdr8AKpciAQYpw
         bvC2szCct1dMsTur6C9qmwbl676ZuIbtcFeBqIsfUDOui6RmH7tTC4LswE05/gGPOWZV
         buuIQRM2nlw7geUIBpk1jprm0JGvnjAh/ZQ9lakuhV/ei7dDYuIj8wDyMr4zjg1QN7zk
         3Sh0g5oZS194dW5nBscgNHLI1cqEgTwu7f87welzVWUR7ehOtJeyqVkR/r3o0RV/z+15
         Zyl7M5y2fpDFThbe/4SECZldxRjyieYLC061dSJE4AYFoqQLL8ZcnhhtM3ripc0jb0tx
         k12g==
X-Gm-Message-State: AOJu0YxIKfUFtqr+Ov/LtUSN4yEBFp0fzwVK5BXS5cGK00RfZPINAMGC
	XAZJP27Dij8n0IknRGx1cNvZmbaVGF4ySHev32916snT6w1nGs+Mp8JTFopvIIyPHsk=
X-Gm-Gg: AZuq6aI9myDGsz/TfkvYRu7hK7T54mM87R6AKFLM4sznDTXuKqBn0iF8QGUTa6KrDeu
	+DinIC98XB2C65Fxm2BryMC1CK/7PndU32Vqs02EkB04lUFby1iTns4rhTzZtwCk+PJjkClSKV4
	kcuwijkZYHphSsQL1Yh7RRdY3KNgeEj7xWaQNOI7WJxZvtyuc0Zrjhklyh5UkHl+ULBdboEgNyn
	y3YAr5UQY01928lHVX+pHGnA0UbHySVpLp0XuhPRbOx+XzYiKyn3eebSgwdaAriNEifcSYj0o7b
	2ULDFBgKl9W2QafwuH9jpoIYJYvRlAp7bw6cVw2oIL5naDU/OqDYHtaq3PdiPBnwoHSwi8RuJLi
	evI2Q/2TBZ7jLUtzzDiR2hu8FGHl3F8stTANEX4xoaqHqmJYmHGOIDUYUvHJtpi4V14dXhNnCmk
	tVkohjqjZ2sx8quDaXPzoKSfogrRau+5M=
X-Received: by 2002:a05:7022:525:b0:11b:862d:8031 with SMTP id a92af1059eb24-12703e57c21mr139517c88.0.1770323492651;
        Thu, 05 Feb 2026 12:31:32 -0800 (PST)
Received: from telecaster.lan ([2620:10d:c090:400::5:5887])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b855ad9a42sm401177eec.1.2026.02.05.12.31.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Feb 2026 12:31:32 -0800 (PST)
From: Omar Sandoval <osandov@osandov.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	linux-riscv@lists.infradead.org
Cc: linux-debuggers@vger.kernel.org,
	kernel-team@fb.com
Subject: [PATCH] riscv: fix vmemmap and vmalloc offsets in /proc/kcore
Date: Thu,  5 Feb 2026 12:31:20 -0800
Message-ID: <5273041dacfde780bbc917660537783c354e0598.1770323325.git.osandov@fb.com>
X-Mailer: git-send-email 2.52.0
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

kc_vaddr_to_offset() maps a kernel virtual address to its file offset in
/proc/kcore. The default definition is (address - PAGE_OFFSET). However, on
RISC-V, the vmemmap and vmalloc regions are below PAGE_OFFSET, so the computed
offsets for those regions are negative and wrap around to a large u64:

  # readelf -l /proc/kcore
  ...
  Program Headers:
    Type           Offset             VirtAddr           PhysAddr
                   FileSiz            MemSiz              Flags  Align
  ...
    LOAD           0xffc0000000002000 0xff20000000000000 0xffffffffffffffff
                   0x0040000000000000 0x0040000000000000  RWE    0x1000
  ...

When userspace applications like drgn attempt to read from that offset, it
overflows an loff_t and results in EINVAL.

Fix it by defining an alternate kc_vaddr_to_offset() that masks off the
high bits, which is what x86-64 does, too.

Fixes: 07037db5d479 ("RISC-V: Paging and MMU")
Cc: stable@vger.kernel.org
Signed-off-by: Omar Sandoval <osandov@fb.com>
---
Based on Linus' tree as of 8fdb05de0e2db89d8f56144c60ab784812e8c3b7.

This method doesn't work for riscv32 since VA_BITS == BITS_PER_LONG
there. But, I think riscv32 can get away with the wrapped 32-bit
integers as long as userspace is using _FILE_OFFSET_BITS=64. I don't
have a riscv32 userspace environment available to test it.

Thanks,
Omar

 arch/riscv/include/asm/pgtable-64.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable-64.h b/arch/riscv/include/asm/pgtable-64.h
index 6e789fa58514..a52d60dd80fc 100644
--- a/arch/riscv/include/asm/pgtable-64.h
+++ b/arch/riscv/include/asm/pgtable-64.h
@@ -403,4 +403,7 @@ static inline pte_t pmd_pte(pmd_t pmd);
 static inline pte_t pud_pte(pud_t pud);
 #endif
 
+#define kc_vaddr_to_offset(v) ((v) & ((1UL << VA_BITS) - 1))
+#define kc_offset_to_vaddr(o) ((o) | ~((1UL << VA_BITS) - 1))
+
 #endif /* _ASM_RISCV_PGTABLE_64_H */
-- 
2.52.0

