Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793074880;
	b=hxuaEd92RfHBhbF8Wr+xZ+mBQhhn4PtEntLsDouBjM7qvw34CDc1FUUz35r6FdBM3OGR
	 etaVsFKDaDudpGz1AvsQZRdhC0d+Kdk2FdptTsTllKE5oxP5662J8Z64bOsV4B7FfkLZk
	 TuRWZnjuVcXJQVZstKBjajEzTTSq6lFwWAG8lsTKWCdzlQajFBMAanqQdkgwXrxPQuMIS
	 vgKeyqe84+hxQvTd3rK3wSbxBsjyAD+5ABxJvXJcPLRm17U23mM9pJbliLEKpTeRP7rxM
	 XpIp6UNc1VrYu7mt3nezMdY6PbgnR/xoHaGLohWH3Phma614OCKX1hYh/EX19jWlHXw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793074880;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition:User-Agent;
	bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
	b=WWZo3/wIlWDgzH8JuHdUzWxtpHM68iulVAE1dSLddNRRmSyGkYUVavH1tOpPA7DQJimD
	 Ehm5R42XnAZdmPdXDdkAY0bFB4gD3dKh2t+BIUxJLa4rb6sSy9ApIn0Qvx2afnGgwniF8
	 InMtaNhaZhk6TCcj0JhGttnHfm2JmOT3K4ZIFNcOJvohe90A6Np8sO+fho4jeggHRb5za
	 OykTOirKMlt63uCTReItaZHN/k1ZWvbO5MzUW2CO6QfINlhsXJRZMNwXpeXn+Wqd7TfPa
	 cXjzkOLEh/AQq56BaqlVYwhtJlzXGXdhJqpbymbcddmBFYizTNMBscOAs+Oszkt2mfA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b="U+webZk/";
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67769606A31D
	for <linux-debuggers@vger.kernel.org>; Tue, 27 Oct 2026 04:21:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 67769606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=U+webZk/
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3aded3c6103so1203354a91.0
        for <linux-debuggers@vger.kernel.org>; Mon, 26 Oct 2026 21:21:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1793074879; x=1793679679; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
        b=U+webZk/UC0AmEh8JfGeN0MsgqZ5s35ckHlqcQZGpqM5matT9IESNMyqgLlqhn8+LU
         62r6mR2RVpK4FKHh/WYKLLfw4IkyeBL78s9aMyPY/LBrc/ElrYJXV4FSqAoO8HPIUfve
         57DIfcFTgwcH9ibOsaVbpBayQsR7iIg7tLxZE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793074879; x=1793679679;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=IbKbkm2FCu1dJjWm0bA0zRZkrHajWkzVG1UGfJQ9bvA=;
        b=Y+yfO86cHcSjVvxrxCyGZrbmFGfpPp7KwbGUaELuDtU/KGl1Rqv+EXtEiDh/DmnI5K
         07KUhMSnlCVuO44PoQ+wekjzL1UXag43kcLddJnnwuCU1xTu3HdtoQC/H604iLC+h7aa
         ge9yyVigstqgGjeXr6fBatMiKpWytzcflRiP+cGLxCRo83DauaxX7TrNQdn40iE/0tyN
         T2PS1gPsxfBOhKLe48RXytBxelyrlc89moP5FCIBpdUshYhqlmBIW7UIS2RLKSKQ4UmS
         racKusuIMkG4JZiAp+b5rY4DRp8sJrw672TA+Sw2dMUMaK9IlSAwZqJqu8VgC09Uyv59
         4uBw==
X-Forwarded-Encrypted: i=1; AKwUvBxFcnThW5daQXajSQDKG/aw60emCmjxve41CbpIRoP/yV0TMlr7SHZDMod98mKmMzC+GGvmguMqjUZb2jAv08U=@vger.kernel.org
X-Gm-Message-State: AFq9FYIQS1eCme5nGbH6UYNg0UcGeYpsKgVOWJkVEoZssvZV3pT8bEsN
	0fjfI+242DKy48fpQYI9VuQCUFq/n4niccnqYgBVNvK4gsWpUItKnmCPCjQO7cueyKJwgnOTJ+/
	ML+EyoOqaoXm+zyk=
X-Gm-Gg: AYBFou3lJU7TGU6IG8tws2yMqiPFYJ9U3e6iaEGDrCjsVpk/yzliEjN7P+RXlvvfF10
	jyuPAJdaBMe3CRsSIwTlDeTJiEUvvIOCqFyYCI4fdHDNdhRlVEOGyWEZrdiqz/dKlOkdL8uhf0x
	DDe9XPBm9YGXByMsj7Hpb5YaISMXXYNp8KfIF55Re6hcO8IvZ7YDYJEuvxDPtpP3uPt8KFXRukP
	4Qyz8zriXZR3JMR5X+6HfLb8J0FnhHvENy+W9a6ss7y0muw9DLqSGlwuDo0yaPYcPSc2qvwQ9wT
	dBsSHfXJn6SmLtJkvdMzLBSDYN0IXrT4spZiAMjLJNlgFbU+F6xi9VHM0PQGqQeVWvoPznwFIyy
	FxyoHtS7oMQcXb4PZ5MFWkdm0K2TL7HdapIt4ii835ratyy99kdX2WapXir9cIHNZX22c6hpFif
	sWLCjbeB0lxzULpCTkjvx/3xeuEyvsjbrIv13U/+WW9VLTEft9HlPYZNzJ84gTihOw4poA1R60G
	yy4PrcbXK9klhLy4+Mj7uWGLJ834RfMx1NmEx0pvicgM6WA85d6lLK7zdoKfK3w+HYFY6nRYNs+
	SMpJXSe3BwnKriYrgYCfXPtnR+/IEUkJPr8wxpnoHwdeGH4Q4gsAqHImlxk0Zc6iR+zpwcJYIgR
	n+FZV55vI1BjzhHyGMZpu7lN+S5CpvGwIRJSUqNBKqgEZ
X-Received: by 2002:a17:90b:2d86:b0:3ac:17c:6e89 with SMTP id 98e67ed59e1d1-3adeae6d79amr6903972a91.19.1793074878569;
        Mon, 26 Oct 2026 21:21:18 -0700 (PDT)
Received: from localhost ([116.86.153.182])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ae40427bf1sm1790327a91.6.2026.10.26.21.21.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 21:21:17 -0700 (PDT)
Date: Tue, 27 Oct 2026 12:21:14 +0800
From: Chris Down <chris@chrisdown.name>
To: Omar Sandoval <osandov@osandov.com>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	linux-debuggers@vger.kernel.org, linux-fsdevel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH] proc/kcore: Allow disabling /proc/kcore at boot
Message-ID: <auAmuqZyUodq3iqk@chrisdown.name>
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
User-Agent: Mutt/2.3.3 (9073d26d) (2026-06-12)

/proc/kcore lets any process with CAP_SYS_RAWIO read all of kernel
memory. That's a pretty large read primitive for anyone who obtains
CAP_SYS_RAWIO (and it also gives away the KASLR layout).

For this reason on some hosts we want to turn /proc/kcore off. However,
on a kernel built with CONFIG_PROC_KCORE=y the only ways to block it
today are lockdown=confidentiality (which also disables many other
things we perhaps don't want to disable), or LSM. That's annoying,
because on the majority of hosts we do want it on for things like
drgn/crash, so today we build two separate kernels.

Let's add a "kcore=" boot parameter so that this can be disabled at
boot.

Signed-off-by: Chris Down <chris@chrisdown.name>
---
 Documentation/admin-guide/kernel-parameters.txt |  6 ++++++
 fs/proc/kcore.c                                 | 12 ++++++++++++
 2 files changed, 18 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index e75344f4e0cd..d8acce2878ab 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2915,6 +2915,12 @@ Kernel parameters
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
index 390547b992ac..6a29a3e0ed92 100644
--- a/fs/proc/kcore.c
+++ b/fs/proc/kcore.c
@@ -69,6 +69,7 @@ static size_t kcore_notes_len;
 static size_t kcore_data_offset;
 DEFINE_STATIC_PERCPU_RWSEM(kclist_lock);
 static int kcore_need_update = 1;
+static bool kcore_enabled __initdata = true;
 
 /*
  * Returns > 0 for RAM pages, 0 for non-RAM pages, < 0 on error
@@ -720,8 +721,19 @@ static void __init add_modules_range(void)
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

base-commit: 01146870c415f6ff70a469fb7ceb962a3f2c8c52
-- 
2.54.0

