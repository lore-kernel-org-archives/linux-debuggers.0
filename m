Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7ED8A33080
	for <linux-debuggers@vger.kernel.org>; Wed, 19 Jun 2024 05:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718773232; cv=none; b=s1d1Ac50+h2DjWQNagZT6eTlupbliU6QoUnC8Dk0y+VSQaWULKM29MCpWArTm7Ny6BENRbSQ08eZ7NuqvKm5FJ4aovgQ+Ba/zWoey/aAv2f6WyTK8fiitPUJjmLq5qCKwgVhcuMufGbSu0+p9HJUkbv0M/jqz49cHQpotdvVmR4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718773232; c=relaxed/simple;
	bh=8xGL4S6GF1cL94/BvzL1mCa6xsW2QiJjYy6XjaVEvFo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QcSpDiNHOm3PaALMJSK6q22FJhLI2Mvqyvc4FB+gFagvLHt4mG/mZzGmynrITcQ9Jyqk0LcmyZdymwt60N0Zj/EZGilwl/Nk2VbOy8aT9d3zI1mRs0XULFRcg1HMkQIproXccq4jRwm+KghGBNvSRAqFb7pDRzwXBSqqcxiiWEw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=wHuO4Sak; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="wHuO4Sak"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-705c739b878so428755b3a.1
        for <linux-debuggers@vger.kernel.org>; Tue, 18 Jun 2024 22:00:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1718773231; x=1719378031; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CnHosSMTlhyZy4/smUQmVXiKBF37sEAO5boId4LvkC4=;
        b=wHuO4Sakgv6GNhsehKhSBUoZdsSIdsxJHFePTPUxG6GaksADUiO12hPLvLi7assYJB
         CI7BejETp4INsI29eA2m3sb+NIPfTVMxw3rIBcjgXKI/TX+UVWIb/GD1MfSoDRLOpL4d
         Z8E7vyy5oSPLVpIVGVTO6dJ5ANUrKKseAFsHst9touJ8JtcLO5eNSV4D0j1/EfNAuSd9
         E/60krQU0wvgv3Gns55bRgMavA9OEhEvXLYaGRG945y5Ibawy9MSNgYSXhdeaV7RIWYb
         Wgt7W3sdyZODuvE+tYNhyS9CI7it9HLecv1YYtitCH0wzSK7HBoq/MOBGnr2GalxY+RS
         wZOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1718773231; x=1719378031;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CnHosSMTlhyZy4/smUQmVXiKBF37sEAO5boId4LvkC4=;
        b=f4X/XONJYMAIf9o7oBQFGC4OQzeItqh7Jo2Hu7vMmAVCF2RMYaQm9/1dGxulsSg6+L
         zBYE76cVbGyusIYQUKS/6zTIyzwdf5rMym6YtFF3q/DNP+Yiju+ZcvJycNm5C2YM0QJP
         Q8uI+uHFm6xdAVdfJtFBLH5cFs/AUuoewxCl6wFjIROvYgbkDsPfSmNvrJKx7jXHYxZV
         MuhpRMHfuLIb5KTuohpmGwHoK5P4L4p4HYZdEp1jHHRen7jAQLNctZOTsmCNIrIRMuMF
         iugwhbjdjOF1av8ftoabENDVH7MFZDtZERQsibffD0bot7gh/JedO9xgOm1tb9/lpwF3
         b4/Q==
X-Forwarded-Encrypted: i=1; AJvYcCVBLLmSAhFVPA974gV8p0aBeuYBqNpy6p8vgFeIlD7i0xbW3H3MfWkRCFounWcuo7GjXxLBqRG2ugKClGv/PCcFMwN3rwxcU+/FGWybwa6L
X-Gm-Message-State: AOJu0YxOEaRxmRiGAnE8Wctl4P5L6fTJ59m5wRAH961jOTzHA5ubCuTl
	WdGhiFd7vv2BgeFoD8e+58akkA1P9HsZLs3AiIS6OWstxL0fh1YcUyDnwak+wZs=
X-Google-Smtp-Source: AGHT+IH+pD6pdddjXgKRvRm15zJ2fCm4wOHzm9P4Y5A1pJHZtGupGZ0FTYlkdIu+G+aSj8d3m5wyXQ==
X-Received: by 2002:a05:6a20:c31d:b0:1bc:bada:a9fd with SMTP id adf61e73a8af0-1bcbadab018mr1978857637.1.1718773230570;
        Tue, 18 Jun 2024 22:00:30 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::2f17])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-6fedcf36be7sm7457523a12.1.2024.06.18.22.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Jun 2024 22:00:29 -0700 (PDT)
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
Subject: [PATCH 2/2] target/ppc/arch_dump: set prstatus pid to cpuid
Date: Tue, 18 Jun 2024 22:00:13 -0700
Message-ID: <ac09da04c8e6dd777945219815d1c53b02291b5b.1718771802.git.osandov@osandov.com>
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

Every other architecture does this, and debuggers need it to be able to
identify which prstatus note corresponds to which CPU.

Signed-off-by: Omar Sandoval <osandov@osandov.com>
---
 target/ppc/arch_dump.c | 21 ++++++++++++---------
 1 file changed, 12 insertions(+), 9 deletions(-)

diff --git a/target/ppc/arch_dump.c b/target/ppc/arch_dump.c
index a8315659d9..78b4205319 100644
--- a/target/ppc/arch_dump.c
+++ b/target/ppc/arch_dump.c
@@ -47,9 +47,11 @@ struct PPCUserRegStruct {
 } QEMU_PACKED;
 
 struct PPCElfPrstatus {
-    char pad1[112];
+    char pad1[32];
+    uint32_t pid;
+    uint8_t pad2[76];
     struct PPCUserRegStruct pr_reg;
-    char pad2[40];
+    char pad3[40];
 } QEMU_PACKED;
 
 
@@ -96,7 +98,7 @@ typedef struct NoteFuncArg {
     DumpState *state;
 } NoteFuncArg;
 
-static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
+static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
 {
     int i;
     reg_t cr;
@@ -109,6 +111,7 @@ static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
 
     prstatus = &note->contents.prstatus;
     memset(prstatus, 0, sizeof(*prstatus));
+    prstatus->pid = cpu_to_dump32(s, id);
     reg = &prstatus->pr_reg;
 
     for (i = 0; i < 32; i++) {
@@ -127,7 +130,7 @@ static void ppc_write_elf_prstatus(NoteFuncArg *arg, PowerPCCPU *cpu)
     reg->ccr = cpu_to_dump_reg(s, cr);
 }
 
-static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu)
+static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
 {
     int i;
     struct PPCElfFpregset  *fpregset;
@@ -146,7 +149,7 @@ static void ppc_write_elf_fpregset(NoteFuncArg *arg, PowerPCCPU *cpu)
     fpregset->fpscr = cpu_to_dump_reg(s, cpu->env.fpscr);
 }
 
-static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
+static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
 {
     int i;
     struct PPCElfVmxregset *vmxregset;
@@ -178,7 +181,7 @@ static void ppc_write_elf_vmxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
     vmxregset->vscr.u32[3] = cpu_to_dump32(s, ppc_get_vscr(&cpu->env));
 }
 
-static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
+static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
 {
     int i;
     struct PPCElfVsxregset *vsxregset;
@@ -195,7 +198,7 @@ static void ppc_write_elf_vsxregset(NoteFuncArg *arg, PowerPCCPU *cpu)
     }
 }
 
-static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu)
+static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu, int id)
 {
     struct PPCElfSperegset *speregset;
     Note *note = &arg->note;
@@ -211,7 +214,7 @@ static void ppc_write_elf_speregset(NoteFuncArg *arg, PowerPCCPU *cpu)
 
 static const struct NoteFuncDescStruct {
     int contents_size;
-    void (*note_contents_func)(NoteFuncArg *arg, PowerPCCPU *cpu);
+    void (*note_contents_func)(NoteFuncArg *arg, PowerPCCPU *cpu, int id);
 } note_func[] = {
     {sizeof_field(Note, contents.prstatus),  ppc_write_elf_prstatus},
     {sizeof_field(Note, contents.fpregset),  ppc_write_elf_fpregset},
@@ -282,7 +285,7 @@ static int ppc_write_all_elf_notes(const char *note_name,
         arg.note.hdr.n_descsz = cpu_to_dump32(s, nf->contents_size);
         strncpy(arg.note.name, note_name, sizeof(arg.note.name));
 
-        (*nf->note_contents_func)(&arg, cpu);
+        (*nf->note_contents_func)(&arg, cpu, id);
 
         note_size =
             sizeof(arg.note) - sizeof(arg.note.contents) + nf->contents_size;
-- 
2.45.2

