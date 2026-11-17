Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794910843;
	b=m/p+XemRu4AbuO7zMFruXqRKoj0wVj0+MAqb/CnLrJZeJpg6giXq4H0f5gguFRjAn+/S
	 a3LrtJkiLMNvUfslAQEEzInb7XsHD3v8tyfDo7UjF6q3WJAGdyEFHSGmCcl40Mlfk5qYC
	 bHPus+aMf/FoXB5RHJLtD6SRoCpxjFHtSTLnUq1a8tbsnOfIsIZjFegiuG47PqvcC1sbT
	 ssMcrJb1ySu/5R83ZWxlnvEZFfqDFjUC/017aI9dorwrOl/brCDDIVwF4fcKvEPTw2WE3
	 5hsAG7w5ngQ9F+suZhUqJK532sBGo51owCdBN+zBSJM+/CzPv2cVAMpA7y/6gSJtYqw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794910843;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=wUKnxB9Hkf5UlddOBau8h4TCwsj7ZxWVW5uuyUNe2fU=;
	b=BmJ6yXXqSeMm+aL2QwJJTh7OMCB8Fb8j8Y2t1LnKXe8j9JMJmy/g8W7eELI8zMnSat4v
	 /NPubJBb2oXtsL82xA3Rkxzd2wG16+F5InCBCq40M2zSs57RSKyesqfXaSsycOwqBi8Db
	 O4Br5Bnd+WOqH/AM0QYkCJ4fnZ2JA7iwlN81YlKarLxwO4KBeFfVr0szsjdnCneYH4/a4
	 VvfxwMr/FKALRe1Nr8Rgset8i+usQrJkHNVCfgBBkouA6ra/A/5Zrm2UP9HQaSSuVbNRP
	 czOpfgHuFt9lOYiGvVmUHp6ilpp0oXGrOZyOwGN7BFi1jOthjp/WiRx6Sj3A+juNGxQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=E7RLDg11;
	arc=none smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 059FB606A32A
	for <linux-debuggers@vger.kernel.org>; Tue, 17 Nov 2026 10:20:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 059FB606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=E7RLDg11
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b37951a397so2227933a91.0
        for <linux-debuggers@vger.kernel.org>; Tue, 17 Nov 2026 02:20:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794910842; x=1795515642; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=wUKnxB9Hkf5UlddOBau8h4TCwsj7ZxWVW5uuyUNe2fU=;
        b=E7RLDg11WOEqbE8nOBbR9Wi21WCPxa6PZYpNS33bFEgcNRLlGLk8GZJ+wMBUE8RniO
         YuDug5jx+4b4Sd6W1bevIMgmHpvzco0R8u3w/EF89vuX/C8uQK7pbooAuV7TKqc5ncp7
         e7D3mQFs3aygUuhaHL/JYlQASpdLPnu6wCzh0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794910842; x=1795515642;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wUKnxB9Hkf5UlddOBau8h4TCwsj7ZxWVW5uuyUNe2fU=;
        b=IIru8PT4Ra1ISH8osM6ByOks0pz55XjuH7JvECmR+8XJoBHfnCjpoTLqtyDJAM9YOb
         XqjnOktgFEk4S8DHrncxK3pvo5cUcNM6tLYyT/kC1/ds+jZL7VOz5P6jitsAu6ywDZut
         Rf7PIMqwJQCgB/RhD/64OvgrjlZgc7YnGwvkL6Ct/haATDQy6Ezco+5IOmRLFijfV1pH
         QfSvqJmVxyoo0vyw2uMrohhWF7p+POnWGkTL4bfk5nj570ZyyvHboOUAJxQyPc5GJiiX
         5wsKMyFq2ln8ArRPk2ATAA7ffONZMyNNLSkv3BT9436aFaxxwWyd8VLOTjN4TNrQ185h
         SU8Q==
X-Forwarded-Encrypted: i=1; AL+hErF79zKwg6EUakl5B5Wppc3GM5ldlSyAWur+NI87b9qJtI750kliUg+hiX3bCMCZejN350gS8x3LbD9ExC7C8Qg=@vger.kernel.org
X-Gm-Message-State: APuU4Z8dYgNmcq7LRXQr/7GrhRy4wwV5kNJxA7u7j9PlGuMmPQ48lplP
	G+rD8VCkxmm+I0metJBFYG1wfadjkuxrEmnxknjV80uwEiYX8xpijqYvhld4+um7Ydnbra65dkU
	YLT3B3YA=
X-Gm-Gg: AZFdTZeZnpMVIX+Llv6Gf9qMqj7lplt4w0rMcwrUEQlV92ut+2DNPnmELYqr+E7TMRn
	bIWdpTQG34DlIaQVftLFC68/ZBoeJ5M0v/ImNfLWs7ZAysz/icpwDV0AqiAzboUbl5ToGWZ+21P
	npSMoxTgK7JqyNW7C74QCl3iLw5bay7nx1+0LstyTPDUc8ucTJFNQKNsOYXm/yfa1pSBYmXpyYF
	dbN5PF+Iq6QH3LBULSgIAlPiInOQ+Ud8Xc34DFpTfG3mAQY8lNiglBjE4eEK3x9MPavoBaHaNFp
	aVBV91QJtjJhA1tEaiLLvNqvN8mD7NBSQ27QUoYncyRPXo6sCYmz7tXR53Z3wos2sMKC2MQ2qM9
	KSvij7NI2wbHO9frNXBkv9DOueNUT2Jpeew/ufRmxn3eNg7t1fIU9PzS70EJYcSW8aU+w9qy0ij
	AwjlPAc6PSPx30eka8kR7zpteNojUz/EfkzZyeM/AXEqs8smQNUUQwxqtVoT/5PnZ2OmnOM2gVK
	i2C6xrl+Od4LPsPn2M2zLs1G2GjE69f6jM50l3HsUZMwAya+XlNlFDJUz6F7VqqGY8pfN8QDzmV
	Hk/ZfzY74LL6m01btUfYpFAuprkaNp/YB3FRk5PRTfzbDjJ3HqBnz83PWbiiv7CRfBOTLTljN5X
	jkxKdKvhu+xGSssw6biRs6EKfhGE7a/CPgTC3pk9GEXd4PU5qNV6A9+Hs1mzA38NWAShusVTRK2
	BAvdMslP+kVTFe6o6aoa54cbIvsN+vnyXOHcqpohQla3hxttXqtQEgqiQ4UuThWPmX
X-Received: by 2002:a17:90b:5112:b0:3a8:10e2:ad08 with SMTP id 98e67ed59e1d1-3b1b0cf4395mr13922231a91.48.1794910842256;
        Tue, 17 Nov 2026 02:20:42 -0800 (PST)
Received: from [172.20.0.2] ([172.56.235.113])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b3a7657585sm1927180a91.2.2026.11.17.02.20.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Nov 2026 02:20:41 -0800 (PST)
Date: Tue, 17 Nov 2026 02:20:38 -0800
Message-ID: <7c10f2e01b6f19229c83e81d887a87f5d1151841.1794904698.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v3] proc/kcore: allow disabling /proc/kcore at boot
To: Omar Sandoval <osandov@osandov.com>,
    Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
    Shuah Khan <skhan@linuxfoundation.org>,
    Randy Dunlap <rdunlap@infradead.org>,
    linux-debuggers@vger.kernel.org,
    linux-fsdevel@vger.kernel.org,
    linux-doc@vger.kernel.org,
    linux-kernel@vger.kernel.org,
    kernel-team@meta.com
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

/proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
memory. That's a pretty large read primitive for anyone who obtains
CAP_SYS_RAWIO (and it also gives away the KASLR layout).

For this reason on some hosts we want to turn /proc/kcore off. In terms
of what it can read, /proc/kcore isn't any more concerning than other
ways to read kernel memory, like BPF with CAP_BPF and CAP_PERFMON. The
distinction is that a process with CAP_SYS_RAWIO doesn't necessarily
have CAP_BPF and CAP_PERFMON, because CAP_SYS_RAWIO may be needed for
hardware access without necessarily wanting to grant general RAM access.
CONFIG_STRICT_DEVMEM already makes that possible for /dev/mem, but
/proc/kcore gives the same capability to do general purpose RAM reading
anyway.

However, on a kernel built with CONFIG_PROC_KCORE=y the only ways to
block it today are lockdown=confidentiality (which also disables many
other things we perhaps don't want to disable, like kprobes and
bpf_probe_read_kernel()), or an LSM. That's annoying, because on the
majority of hosts we do want it on for things like drgn/crash, so today
we build two separate kernels.

Let's add a "kcore=" boot parameter so that this can be disabled at
boot, which lets us preserve those choices while using the same kernel
image.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
v2 at https://lore.kernel.org/r/a8474f0e2d0ef5ea9d53aa6649c7e9c9ea6f15c2.1794800574.git.chris@chrisdown.name

v3: Make kcore_enabled __ro_after_init (Kees)
v2: Give more justification in changelog (Omar)

 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 fs/proc/kcore.c                                 | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 176648941aec..205228294fc2 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2902,6 +2902,12 @@ Kernel parameters
 			parameter KASAN will print report only for the first
 			invalid access.
 
+	kcore=		[KNL,EARLY]
+			Enable or disable /proc/kcore on kernels built with
+			CONFIG_PROC_KCORE=y.
+			Format: <bool>
+			Default: on
+
 	keep_bootcon	[KNL,EARLY]
 			Do not unregister boot console at start. This is only
 			useful for debugging when something happens in the window
diff --git a/fs/proc/kcore.c b/fs/proc/kcore.c
index 3264c99bd68a..786c1209e224 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -69,6 +69,7 @@ static size_t kcore_notes_len;
 static size_t kcore_data_offset;
 DEFINE_STATIC_PERCPU_RWSEM(kclist_lock);
 static int kcore_need_update = 1;
+static bool kcore_enabled __ro_after_init = true;
 
 /*
  * Returns > 0 for RAM pages, 0 for non-RAM pages, < 0 on error
@@ -722,8 +723,19 @@ static void __init add_modules_range(void)
 }
 #endif
 
+static int __init parse_kcore(char *str)
+{
+	return kstrtobool(str, &kcore_enabled);
+}
+early_param("kcore", parse_kcore);
+
 static int __init proc_kcore_init(void)
 {
+	if (!kcore_enabled) {
+		pr_info("/proc/kcore disabled on command line\n");
+		return 0;
+	}
+
 	proc_root_kcore = proc_create("kcore", S_IRUSR, NULL, &kcore_proc_ops);
 	if (!proc_root_kcore) {
 		pr_err("couldn't create /proc/kcore\n");

base-commit: 666539eecdf4db623f5e3c3e55cf9f2dfad24aa4
-- 
2.56.1

