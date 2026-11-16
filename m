Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.171
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794801474;
	b=a0s/xUe97I4wJjx3Wd7OWhsCHhBaKqA2M7AmECQK2IEorR9/3gnlatq+bp3CJQA0KyvB
	 gqJIEItGfnOM5rQDhkSIHsNbD7L+4ptLh2z8IF+V7eXoyzpIB8rvQntlcjyl3vb+VXu/P
	 nSRq4ZE2bRWAxBx/piNE2msfZPOYJBFZJMvq6l64RPTeMEWWh3rOQSLZyrxTroX/ZJM4Y
	 GrciPbjg7eYknTq82afzous7etG0Ca+jscVBzqQ7Xftw9HsIAunJTSaxlY/r8/0NoWoue
	 tXTRDLS3YnLZ17Kv0m/X954j65kk13f//C1x0LRIxqsxqtcq8egHZkPwEDzn2XbXmSg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794801474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:Message-ID:From:Subject:To:Cc:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
	b=Ot0P7VqKwj7pqDCdheX4OfddXUnkPiJVw7/Tw3AEuHWKqO1tvAELs647o9uyVaKRY4JK
	 O8U1wzcKp2aOfn4I4KQc/QwIXoSHtvtmnEOz8384bDZa/cJBQ81ydFFcyJOqTJFP6sQj5
	 1GKVQf6pvAwSgh0lPpRO1pGC3m16P7p5IaUUqUuR16MtLQaSTrCMgZxVooQoATPl9Rcez
	 lCjV4qSJUt8ltu0gOQlOytIUN1LiFPEjerbyRvMTzxBbHOfnoWjfIxpjj5hgp+yK8r7bj
	 UsSCZGGlhOHXJ9Bx0z8UvjTWzvN4brqU3WU93s1Mu1M75eq9clS47s31ivTMvlsBMVg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pXUuGH1T;
	arc=none smtp.remote-ip=74.125.82.171
Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F494606A32F
	for <linux-debuggers@vger.kernel.org>; Mon, 16 Nov 2026 03:57:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7F494606A32F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=pXUuGH1T
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-3791619605cso5852949eec.0
        for <linux-debuggers@vger.kernel.org>; Sun, 15 Nov 2026 19:57:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794801472; x=1795406272; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
        b=pXUuGH1T9exwQcrwhbSZrLclSn0IWrK+PCRBc/KdKoTlWFPxdjgreeQ1+APKhspKwS
         HmqF1BZdKZR9OP7azT5beKtMmat/vhp6olqwbUZeGf5u/1b39oKZbvVK9EqEv5J8rQID
         24wNYBs8s+ihpD/hp4t8V0NvT5OMsgDTX4FQw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794801472; x=1795406272;
        h=user-agent:content-disposition:content-type:mime-version:cc:to
         :subject:from:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=iwVZGsgKAQDdbtbiaa6vbIgpmM6oKh5tzoDRi/Aw59E=;
        b=xIfqD5+jCqH3IdcnzJJ5AqGfEBgw4DBMnznr1gBNlIAPnPx74nIoszljU/uXPl+0Ts
         rWwMXfuXnWbwdgaMzp67En3IwG/JPOUDYs7l4uO8aKS7+FRsH8uSty6YNSriRkqDrdCt
         5KZA5Yu00Qh7lFRDrbrLHgWKuNLNZU7tQh2lrYOEip253olGrZpYb3pIJ+mhXbAEwCNc
         SoNID9BRbsVNyEnjVxqapidT27NwohWIDhS5INbS8qg3D//An7yfbXIz/sPIfcUk0NtG
         WxF4qtGyny9EX/Et44rNvK8q7Yn9awfzgWMKmXM/Q2B3Pe6OF+qpiOUFGHdrolxwhQ6C
         DzeA==
X-Forwarded-Encrypted: i=1; AL+hErEF+CriNdVs2Vg7nUbFNpChu84yJL39WWd8gevu77CCtpQc1e56rjmzD/xAAWBq80GPLIbrywCvmwiESBBcuOA=@vger.kernel.org
X-Gm-Message-State: APuU4Z9ObKu7rZnkBsJFh+fYIZR2vDDEFEFI+CLfcJ8X0c9F1/FRyWSS
	3Q+qpczE0HKJqUppdMn4gqnRqLsuca5fMDt8d4tn2gINo6w89SFh0/Y3aGYyo/Hipxo=
X-Gm-Gg: AYBFou2UyZYEKKwQuyluFR0vVWK6V/1WvGRTp8f/f7dhAcUI7aUMdplZ/9+KOowI7Bs
	+kM1ITg3eQREYl4mdSuoRnBva+NPrlr910c1Fkf0liK8rrE3A/xykgHDJ1WdRrnSV5emBdAo51S
	mlk7tEY9u+yshoDQJv4WOTXmYzQcdpik9aZ4MxgHwAtUqG1BfCG3KbQwX6NEJ/cKieApeJ0qCt+
	JAzfQkyd3WF316RgZJALr/hf6G3rTaly6fZJ5ZoRJV78+6Kzq+qczi5zbrUcOg9FiQ/yXjBdgo0
	B6TPEUKlzsPQlDMt1lNq5/gXdaJSeAKFkY+UXVT7XxTSUNO4g1o3ptvIqQX4wVs6hQl5CdLdQnz
	/Kku1lsPVyVAFWHIx6GfAyWlK4Uw+npyTgDNeaylg64KZIPRRrPp3+kOl0IxL6GcZxFYY7WeVUj
	X2Hr6eGGEh6lHMN68ZWueCsx5jRu9FxnlgbuMMcONNeVz6TBoxAiamHSLXtOC7/gy6ZziUUXhKC
	mkEI4k0nvLErj8pVjsbk2iaRWpuQPamVnBAPzVvZ8otqH+mwPUezj+aFfnvbts7lY+Vp+85vXqp
	H3vGvTWlQ07zMOuRq3HUhy7DXwpW52dFCeauei63AbwTURZow5mfBKBg+kpUprIpcKJhJteb0H7
	GrrB6HWXgjXe6T0OBROEUU2Bo1yxwhBMgMClFXKNtSyWIaejMOaeGQ6Z97zlsNAD8VrYBg+RM92
	9PH/JVfocgTyn7mZuBB1MoPpMPaSlJd79XPemDKKszpstQNWMbmmGLK4U3g0bp1jRR
X-Received: by 2002:a05:7301:b06:b0:36a:1089:9836 with SMTP id 5a478bee46e88-3796628ce32mr8377652eec.15.1794801472427;
        Sun, 15 Nov 2026 19:57:52 -0800 (PST)
Received: from [172.18.0.2] ([172.56.232.151])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bb0919sm29451214eec.29.2026.11.15.19.57.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 19:57:51 -0800 (PST)
Date: Sun, 15 Nov 2026 19:57:48 -0800
Message-ID: <a8474f0e2d0ef5ea9d53aa6649c7e9c9ea6f15c2.1794800574.git.chris@chrisdown.name>
From: Chris Down <chris@chrisdown.name>
Subject: [PATCH v2] proc/kcore: allow disabling /proc/kcore at boot
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
v1 at https://lore.kernel.org/r/auAmuqZyUodq3iqk@chrisdown.name

v2: Give more justification in changelog (Omar)

 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 fs/proc/kcore.c                                 | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 0b3c140babd9..b4c43d2cae03 100644
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
index 3264c99bd68a..4251a9ef868b 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -69,6 +69,7 @@ static size_t kcore_notes_len;
 static size_t kcore_data_offset;
 DEFINE_STATIC_PERCPU_RWSEM(kclist_lock);
 static int kcore_need_update = 1;
+static bool kcore_enabled __initdata = true;
 
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

base-commit: 7e1392a42ea288d70a266f6553fe06f57f8647ea
-- 
2.56.1

