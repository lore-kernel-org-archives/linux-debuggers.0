Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com [209.85.167.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 839DA143C6B
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 22:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721774158; cv=none; b=uJQMb75UlqokVHUTNAjAfGZjGyuIR8KV7RGQInvH3fo2rbfybIzbXrMEDt8rdyZcKCLbDUJ1VlTU+LdyKccUlkMGNPsxydVFu+0yd2N339bdMtxknbcw3ZmQ+YZZvkcCuz2S6T6sIWyCyquv1JC1Ojwy2Bj5dwawPRCpHGa0oKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721774158; c=relaxed/simple;
	bh=UesB4qXCNMCR6NkFYSV2Ruj7Krbns+hMD3/e7+wTjGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=tMfWprisEFli7tXejuRFtkqr0no8as9SejvuIg2/RgtjGHaVHfgeWibkBQLHOaEGWfvTtDK+VB4HROyrjuODG4t5alg7h/cp9ugYHp8cSEQuhl/cjJSvec0b1zZD0ZSE2uBvpodp+KRFHayejiCtLYNtuuLbi/F5zQ3I50lyb18=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=WUuyz+V4; arc=none smtp.client-ip=209.85.167.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="WUuyz+V4"
Received: by mail-oi1-f177.google.com with SMTP id 5614622812f47-3d9e13ef9aaso3708820b6e.1
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 15:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721774155; x=1722378955; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biAXgVGe01xXLaCXVejULNfAEwYuUbE6WaXaRROeriU=;
        b=WUuyz+V4oT2XYb8/86WcxBauQWzeF00aGAmJjxj7pWzpS6uTzmg2vCTwgjlFY8mwNl
         ct1TFRe1j7utVNjBRYOndj+QDzrTiGItTo628flFhoSDCJOKJbXHqxYVNC1OC8ZacOrc
         CyqfwCRKmrnYZC0jtxrPE4nILo50GyJ/AJWGHjMJGCZG1HQtgHZwGvs8ra3eHJj+sOiK
         DEaKp5Y2rnabTilq76B0C92982X5rKZkRB66MEB554br5LPkpb+o2YNS6zAQtsfcw4sP
         NSkGtWtmlC6mShLJ/v9etVeJfKL45Yt5o4W8eFyd4Gz+bXg8bSPqLG1ivIuKerYhZMp0
         xC7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721774155; x=1722378955;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biAXgVGe01xXLaCXVejULNfAEwYuUbE6WaXaRROeriU=;
        b=GSqVnYI6rikvpDeYRwZd5l56ieEc4HuFh+RKMZPcZ6DkCP2HRWW8Yb3lNlhhj09esO
         C4vEuvoP1U5GNg+iioDcEVL113jQjkFQF9LYluQcNd1yP2GNcZTzRE3D6sGez71PUAp/
         my95nmPkD1EdyoilJVm2934wUynqnF445I7uL5vHukzAynIusNcbFMC0kl5QWKUJTho0
         hN0beLrNbbAFzpxqI4qxWlzD0l/pzK/blKWGeHVtvJCELzSK0NMtkLk+kREQ6gaLYRHm
         wSyzARdIfdkC++efpTIZaW2HvhAcyL7WZk3Fy/SXWVTRpXl+j59DBNBhIG5lVnxioPzW
         q9Hg==
X-Forwarded-Encrypted: i=1; AJvYcCUj+FKgJmxas8Zf+GMiV9c0j3JBZjnblyQA+3FaKnGFp8IPRoNjGHTPd0XP0u/LWI33WEmsYpqVBn3kxh+9K8D+gJA9CMibOO4UmZV30o6b
X-Gm-Message-State: AOJu0YxTppZx4RFVN320bHWFrJprRn+anbXqWXQoVMFD8QCE3cFT4yvA
	mDzVpVSvbWfTZM2PWv8k3+xG3a3CDY2IQYd0HE2R9i6vHr9yZFbiZs+fZdt68KU=
X-Google-Smtp-Source: AGHT+IFpKUhoIS7QW5vxkxCVm/ZnxxuwBPIA41UuPdN0j8VE/gvWlVxTEKffWgA6zC1P56pCFj4WLg==
X-Received: by 2002:a05:6870:b41f:b0:261:6ce:b805 with SMTP id 586e51a60fabf-263ab679b23mr10666989fac.44.1721774155698;
        Tue, 23 Jul 2024 15:35:55 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::5:b6d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d241803fdsm4308079b3a.220.2024.07.23.15.35.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 15:35:55 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	Aaron Merey <amerey@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v5 2/7] tests/run-debuginfod-fd-prefetch-caches.sh: disable fdcache limit check
Date: Tue, 23 Jul 2024 15:35:38 -0700
Message-ID: <7095c9beb10b5495ddc08851e678995b8825217e.1721773977.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721773977.git.osandov@fb.com>
References: <cover.1721773977.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

From: Omar Sandoval <osandov@fb.com>

Since commit acd9525e93d7 ("PR31265 - rework debuginfod archive-extract
fdcache"), the fdcache limit is only applied when a new file is interned
and it has been at least 10 seconds since the limit was last applied.
This means that the fdcache can go over the limit temporarily.

run-debuginfod-fd-prefetch-caches.sh happens to avoid tripping over this
because of lucky sizes of the files used in the test.  However, adding
new files for an upcoming test exposed this failure.

Disable this part of the test for now.

Signed-off-by: Omar Sandoval <osandov@fb.com>
---
 tests/run-debuginfod-fd-prefetch-caches.sh | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/tests/run-debuginfod-fd-prefetch-caches.sh b/tests/run-debuginfod-fd-prefetch-caches.sh
index 3db78ade..90730555 100755
--- a/tests/run-debuginfod-fd-prefetch-caches.sh
+++ b/tests/run-debuginfod-fd-prefetch-caches.sh
@@ -99,6 +99,9 @@ kill $PID1
 wait $PID1
 PID1=0
 
+# Since we now only limit the fd cache every 10 seconds, it can temporarily go
+# over the limit.  That makes this part of the test unreliable.
+if false; then
 #########
 # Test mb limit on fd cache
 #########
@@ -148,3 +151,4 @@ kill $PID1
 wait $PID1
 PID1=0
 exit 0
+fi
-- 
2.45.2

