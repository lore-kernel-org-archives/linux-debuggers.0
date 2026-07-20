Received: from mail-qk1-f179.google.com (mail-qk1-f179.google.com [209.85.222.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFB7E480DCF
	for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 19:35:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784576126; cv=none; b=HgBO7XOfi2C+jp7olHkzmOHkSOgEJDKIQgt3zYyBvbSmrcVOIKi+QPe5JmKBoWSRiSMStzLAai9SIi63cJohm4vXkzoqUlzNKsJjeRLfHgWXwc2VzsIjGdqSo6G1ejPVpM3o+Sru0BhIBYmH/Gqj2lf87Cmhfn1tyo3iwYEmFyM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784576126; c=relaxed/simple;
	bh=rTGbsGvKQACnJtisxUC5ZLec44efZiXOSNd4OQNTaLE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iMVPR1AqagbPyFjrKVA9rKqIMfbeIYVNJp/QRLOje8TxasmE3T24kQ0r8VwU/gbOdn3vGe0E6Ah7cPBIJvItqAl+ja5v24Bx1KwUNovLp5bKucxfypJw1wvmRAFPT3w+MLzh9raCh4t92dO12BS4b9yBv4nA2RXLGG/NIbXzJSk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=KNaHn0u5; arc=none smtp.client-ip=209.85.222.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="KNaHn0u5"
Received: by mail-qk1-f179.google.com with SMTP id af79cd13be357-92e5b048375so757530285a.1
        for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 12:35:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1784576120; x=1785180920; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=t6FOiK4vob/RxKMxAQwNd3dgf0KAGjN7gNG/YIVjxjc=;
        b=KNaHn0u5ops1R/lZeXIDAUO/x4K11AG1ePxAFRbUhd7TfbL1t9LgN4aTaaNKEmTtjs
         nzppEVg1Q9PX8Y/szIAZHRhmAsCyhFpgETvciNAsYAr7YVRUqsFYcRkrJ1cA0BJYzfV0
         5h3TZYJehbb6t4kBKpCI8ZB2jJZyseGHBoqYgwIuBjPkOZcyiIRzf/kcFdewtJpLa1/O
         2fFQ4cCSeO51sw1iCLcCFiOoCVvSqtOi4L7NkYOIn9TUVDV6s0gfypiwDr5EKWb01FiR
         oFb3+M5V2dmD9yoV/rPUoLqy4kniWwtmd/ATQkFdRXosc90P3z/b9WVijvCzfsZAgfXg
         89tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784576120; x=1785180920;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=t6FOiK4vob/RxKMxAQwNd3dgf0KAGjN7gNG/YIVjxjc=;
        b=jXL3nobf7nhFwG4J1B0tYc6xVuTcj5H9R39Lay7moCH00eDAuifrQEMBRqABRGO4Fd
         vnt4fX4npLahuMj+wbV8oWErjOpbQL6x/zbKSKM4g1eT6iIrF8ZLNAcS/bZJzCDXuY/O
         9jFMcvlIkUx8r5NhceIOpEJGQXZUakXPhvBv6JBYXpA4Pm3Jouh0JrE5r4CjyeQw3lmf
         b88A3rpZcxudwIV5urDPH2L9oNo9N1NZYjOPlNB+UdhOuyk9Dxt5QJC1gC2mQicCPBLD
         IokE4d8UKFWgUCBL+kNIRmQTBraUoF7qjS+wIDZ336jRJHLtfpVpzsbmsmVeP8fwQEA1
         WGqw==
X-Forwarded-Encrypted: i=1; AHgh+RpgQDFBmQ25rmO5Xd/vUG2/sGYxXqXUiUkqo1+Ea2oBDARUSswyidFocLTMYU9xEDKAiz3WcqiVM711/x9+wF0=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5RHGJMEm4p2GLO/CfJd1/Zfbei5D3fqE4qKJpUXpu+GLjsxb6
	ayE63q6UlCSh+M/se9c3iiOTi4KLkyKw8iXhbM5KdsbeLumyRg4zqBF4mIEuzzi62Kc=
X-Gm-Gg: AfdE7cnwmhrwJW75I4P6R7DeKms4IuN4u7hQz7MAOMYDhS+YQDQORthsl/W9UsA7cXR
	i2ZPKTwi0vfwohCJV+kUYVuJY9vmxwcJ3qhB6gWpEOqj5bW6u1pXc/3zUZTclgLZ9rlpBS+vcLl
	+H7Izxs3W6HKrv5bX+S21qXBV4xTGLSD9Z0uqc0r7axqty6mHuNsqzIl/M2YAFTCjH57YT1Zszr
	ngO5kBsoGl7ezvEtXBMEE6pnzdlbvFqdmOklDQsEiy0Sm/TRih5AJ/NnspExTRWxZr4RZ0H87ay
	CZmirCHmsV8R0oMYGLywPTaN8DHjodyzUe6sQbNyywBCEh+X99bmfpqzaiQ7EZnvVP2XV39wmTE
	J3H6xEKRAnkke1a5inHrJ6OKmjvw1PBcp/i/RU+8abczRAZ0d92Vbb1jdu0wkIWXAG/bc9LqYRl
	jqJofjzjFuVE1Dsd3Rw1s/UfiGtlUlmDsH3w1uQxT69YdQOdK7rFSmrFeeo8EQFZ0=
X-Received: by 2002:a05:620a:290a:b0:92e:7745:9a3a with SMTP id af79cd13be357-930b3e4e1f3mr1582641285a.18.1784576120209;
        Mon, 20 Jul 2026 12:35:20 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-930b545e47bsm957792285a.35.2026.07.20.12.35.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 12:35:19 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: Zhigang.Luo@amd.com,
	arun.george@samsung.com,
	balbirs@nvidia.com,
	brendan.jackman@linux.dev,
	yuzenghui@huawei.com,
	apopple@nvidia.com,
	alucerop@amd.com,
	matthew.brost@intel.com,
	akpm@linux-foundation.org,
	david@kernel.org,
	ljs@kernel.org,
	liam@infradead.org,
	vbabka@kernel.org,
	rppt@kernel.org,
	surenb@google.com,
	mhocko@suse.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	gregkh@linuxfoundation.org,
	rafael@kernel.org,
	dakr@kernel.org,
	djbw@kernel.org,
	vishal.l.verma@intel.com,
	dave.jiang@intel.com,
	alison.schofield@intel.com,
	osandov@osandov.com,
	jannh@google.com,
	pfalcato@suse.de,
	jackmanb@google.com,
	hannes@cmpxchg.org,
	ziy@nvidia.com,
	pbonzini@redhat.com,
	osalvador@suse.de,
	joshua.hahnjy@gmail.com,
	rakie.kim@sk.com,
	byungchul@sk.com,
	gourry@gourry.net,
	ying.huang@linux.alibaba.com,
	kasong@tencent.com,
	qi.zheng@linux.dev,
	shakeel.butt@linux.dev,
	baohua@kernel.org,
	axelrasmussen@google.com,
	yuanchu@google.com,
	weixugc@google.com,
	yury.norov@gmail.com,
	linux@rasmusvillemoes.dk,
	longman@redhat.com,
	ridong.chen@linux.dev,
	tj@kernel.org,
	mkoutny@suse.com,
	sj@kernel.org,
	jgg@ziepe.ca,
	jhubbard@nvidia.com,
	peterx@redhat.com,
	baolin.wang@linux.alibaba.com,
	npache@redhat.com,
	ryan.roberts@arm.com,
	dev.jain@arm.com,
	lance.yang@linux.dev,
	usama.arif@linux.dev,
	xu.xin16@zte.com.cn,
	chengming.zhou@linux.dev,
	roman.gushchin@linux.dev,
	muchun.song@linux.dev,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev,
	nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org,
	kvm@vger.kernel.org,
	cgroups@vger.kernel.org,
	damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org,
	kernel-team@meta.com
Subject: [PATCH v5 16/36] mm/khugepaged: skip private node folios when trying to collapse.
Date: Mon, 20 Jul 2026 15:34:10 -0400
Message-ID: <20260720193431.3841992-17-gourry@gourry.net>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260720193431.3841992-1-gourry@gourry.net>
References: <20260720193431.3841992-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

A collapse operation causes new THP allocation to occur, and may
migrate memory from one node to another.

Handle this the same as zone_device for now (disallow collapse).

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 mm/khugepaged.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 89ce6bcbc376b..fb4378cc17b10 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -700,7 +700,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
 			goto out;
 		}
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(page_is_private_managed(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out;
 		}
@@ -1687,7 +1687,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
 		}
 
 		page = vm_normal_page(vma, addr, pteval);
-		if (unlikely(!page) || unlikely(is_zone_device_page(page))) {
+		if (unlikely(!page) || unlikely(page_is_private_managed(page))) {
 			result = SCAN_PAGE_NULL;
 			goto out_unmap;
 		}
@@ -1944,7 +1944,7 @@ static enum scan_result try_collapse_pte_mapped_thp(struct mm_struct *mm, unsign
 		}
 
 		page = vm_normal_page(vma, addr, ptent);
-		if (WARN_ON_ONCE(page && is_zone_device_page(page)))
+		if (WARN_ON_ONCE(page && page_is_private_managed(page)))
 			page = NULL;
 		/*
 		 * Note that uprobe, debugger, or MAP_PRIVATE may change the
-- 
2.53.0-Meta

