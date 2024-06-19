Received: from mail-oo1-f43.google.com (mail-oo1-f43.google.com [209.85.161.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A662139D1
	for <linux-debuggers@vger.kernel.org>; Wed, 19 Jun 2024 05:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718773231; cv=none; b=Zg5sHELJ6xlTn2cZjCJcjI2X/sleofET+co8Z4nl/HnJpZqq1xW4aAGF74U+QD8oHVHshkCjs+NnRedMjAu7K1VhpUB8GsQ9czHk/weA9kiWBrcwNAm+sjMlkp+r41bcPIrMDsL1zmNd8ar+SkQa7xsQWE2W7C7+mY+eRKJ4H0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718773231; c=relaxed/simple;
	bh=9ebGMCuJ6JyHf8sylUNs2qiUmGPwFUPPpKR/nsrZUBE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=p3ch311qv2yzZgEdySWH66Nigf078iwJelqzwJw+dPSunjDSzPj57R8ShuCqCkZv8cZq+CusSj1TzFACZ2BfyUkcQvs6dHWZfp/k9qPlcgvSZmIgNT0lICx008zql8lKZjqeNEoBjmrf5VesoGPuxbOklIuetn+j7lFChF+PMwg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=aGcF8kgQ; arc=none smtp.client-ip=209.85.161.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="aGcF8kgQ"
Received: by mail-oo1-f43.google.com with SMTP id 006d021491bc7-5bfa5f9bbe6so1747430eaf.3
        for <linux-debuggers@vger.kernel.org>; Tue, 18 Jun 2024 22:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1718773229; x=1719378029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wxOU2UBK31A2MsvvrU8KfdPolr+I7zX14JcLUR83OuY=;
        b=aGcF8kgQ6t5+x7evwHiil9Fm/PVXTgBS2ChXDqaVk4oM2GRp5ThiaYg7SlEBUBBG9d
         FkAQPUAnDyr194upvQHg6ySnyzPTq2dhJW16w8x7W59H8tuSun8oZFzWN7sn4Sl8Vi4+
         zUshrWGV9juiUQEP/KMcXbMYukJBzGJjZWXBJlugWGAWwuFJh1P4cdiwnwezib2p1yWW
         u7i3CwwlcwnFOOdg7x5PB44yxvGrRMYJt7zuGXYtbtLX3F+T2rm2jv34k2dbta2gZiol
         cXSRC351XJh/SIVMHJTkJvtasWXazfplFtzN9wNQ79IOkgaMXXWeRBulz+OlmvdTqjqE
         ENUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718773229; x=1719378029;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wxOU2UBK31A2MsvvrU8KfdPolr+I7zX14JcLUR83OuY=;
        b=U6NtiCIQBqxRMjS9bwUkk6EZuDiZoqjdZJxOJmoVIcK5PPKIy+pR/DK4pvwMt+csmc
         JOtUO71BcSO9abdWfWfn+l1ieFHkW93aIESx7vvB/3S0g83OydBEV/AbowQ8QY35gkh1
         r2hiEWKzk4Y8yWJ3Ex4dZNSIxzxUjBOCZCCOByLpeRcOu0zA57erAlL3ExUMn70XrG10
         qbiyKjHFlGWsYrJg1HIRbEtJebMGQ5dFV0l0LLwRn/uANxjAZQF+ozj0CvEp+4IgpZFs
         jnk2ReMrkYpAAIRNdNchMpcAENlojph1gaSFFMiEiciPr/sKshMlpJtiAlPO/SKsOG+n
         XvHA==
X-Forwarded-Encrypted: i=1; AJvYcCVRHRMjmAezFaRUWXau4iqTbnrGDiBgN7Y0GFfUj/rqQTKew9NPUJlZPp2UtvjgH44CiOEseseO4J7UkHJpZfxCK1f+/9f+WTHMws43z8lr
X-Gm-Message-State: AOJu0YxFYCtat2VvadSh+yTAF+NCPlAMKJjaL8P8iXZAk+0dCvOvMdTR
	XqLI9RB6og2wV90ispODR2R29a4Ob6WVOitJsC+Ro8FK5/PesygFoWXg9Vl3shw=
X-Google-Smtp-Source: AGHT+IFnRK+olC27LLdSl+gitic7LAbd0SqQcny58N5Rx0UD++iUFr60Z1/P8h7FqL77+abhYXrbkg==
X-Received: by 2002:a05:6358:5207:b0:1a2:46b:9278 with SMTP id e5c5f4694b2df-1a2046b95e6mr48914055d.19.1718773228755;
        Tue, 18 Jun 2024 22:00:28 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::2f17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fedcf36be7sm7457523a12.1.2024.06.18.22.00.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 22:00:28 -0700 (PDT)
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
Subject: [PATCH 1/2] target/s390x/arch_dump: use correct byte order for pid
Date: Tue, 18 Jun 2024 22:00:12 -0700
Message-ID: <5929f76d536d355afd04af51bf293695a1065118.1718771802.git.osandov@osandov.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1718771802.git.osandov@osandov.com>
References: <cover.1718771802.git.osandov@osandov.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The pid field of prstatus needs to be big endian like all of the other
fields.

Fixes: f738f296eaae ("s390x/arch_dump: pass cpuid into notes sections")
Signed-off-by: Omar Sandoval <osandov@osandov.com>
---
 target/s390x/arch_dump.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/target/s390x/arch_dump.c b/target/s390x/arch_dump.c
index 7e8a1b4fc0..029d91d93a 100644
--- a/target/s390x/arch_dump.c
+++ b/target/s390x/arch_dump.c
@@ -102,7 +102,7 @@ static void s390x_write_elf64_prstatus(Note *note, S390CPU *cpu, int id)
         regs->acrs[i] = cpu_to_be32(cpu->env.aregs[i]);
         regs->gprs[i] = cpu_to_be64(cpu->env.regs[i]);
     }
-    note->contents.prstatus.pid = id;
+    note->contents.prstatus.pid = cpu_to_be32(id);
 }
 
 static void s390x_write_elf64_fpregset(Note *note, S390CPU *cpu, int id)
-- 
2.45.2

