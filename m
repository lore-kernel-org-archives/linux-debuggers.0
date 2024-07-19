Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B8FCA1474AD
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 18:24:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721413490; cv=none; b=G3WVzh1/3+RHI5cQyPhHqDxFqVuS3YMw4uDtpxa1V8hwmm4xBEs6CkYCYB6oOJcoRGm3dbi2Fo5cucsuUK+b8DH9vJYiiiopwPv/xBmdA/yKHcADXGVPJMCadsJjwLw0CuQ87xTvtPbBJLboN024CHvgFNctcYLF8Fc3PsG/Dtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721413490; c=relaxed/simple;
	bh=UesB4qXCNMCR6NkFYSV2Ruj7Krbns+hMD3/e7+wTjGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=E8m4AeBUarxGdnY6Tw2D9KK5B1rIP+M8AVgdqoP+yPHBzE01Vd0opbWxTCG8pEqa1ppKm/O5ZDq1EqkMBUwQO/V/QjsJoAheOHnEA60I7u2CfSobuhzq9l5dUKWKJ3ijDmMw+apl9ls6cLDJMDPKnj6IQPrwF1Xl9aJ4P+BBR/M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=yviYD3rA; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="yviYD3rA"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b0e9ee7bcso935765b3a.1
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 11:24:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721413488; x=1722018288; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biAXgVGe01xXLaCXVejULNfAEwYuUbE6WaXaRROeriU=;
        b=yviYD3rArakCFiyw62NG0m6lW0TicvhWw3WL47MNymkalLw/G9SJnFx9gpzy832GTv
         xmw/1oKZfsmEE4kii1Uh3Ba/d3QByLbJ+gKYOkO18n3GgWNtxHI/GABkAWEfy3DPP5Np
         ivDbgXSsGXAsXtX9J9K5cKHz2aOCBNDTcCYLcJ+x5rnK8J0hZrprCFAX/+/KWXXK1BFO
         E15Uk4g8Vk5bupgsS/wJ6DfLSiBX2RrXF4x5sWybUIhpHwruoNuASYU+sovfQAB4rJQi
         y9huoc7bS9BdXIHHdOTPGLpLj/5iiatRq6F15msGUnk/AGI0IYOgsWiUNADkiPfSjRo5
         HC0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721413488; x=1722018288;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biAXgVGe01xXLaCXVejULNfAEwYuUbE6WaXaRROeriU=;
        b=dcSHe+BGIHxwedAmRZAZiF8/CKSV/lwMY2uSueR4EVOqTVkR/Rw5ysG8BTxszJ7JLJ
         VLEbQftFC8XudD9eR8sTNrF7hc2eqeY+gkvX5ibtFVEySeaQ/Gfr8IThwQxLYgQS0+/W
         AyCUk9oTFhdCrSQ0ft0UXpSPqSPAD9pIkqtxGDZIp8i0ruFz78r7Eqq776HbK2Wzd1sI
         3vldNTDn+XgSVFjedOQQOgutH+FQ/1xcZNp1yChlkMoPNvYtDXjgS0GYn/fh96IrfSM3
         PuF8OxLj8WyXR0rVu/aMaZwMaz1W8TOz9mfNW/Z9sDcrpxv0fjQr7AzO5BRJ7rgQirHk
         TehA==
X-Forwarded-Encrypted: i=1; AJvYcCVRzaK5mo6cXybygwEUYF012cY5YpRwiOKEIqalpsJhG8idRdy/Xc/oI+IreE5L8wnObBaKK//d2Oi1HqVa1C25lNQlmQxGoigA4NI1CVOB
X-Gm-Message-State: AOJu0YxR4S0hVUz3ZXt4cF1mrJE3wUUDXY+MaXOAtnGV7Xy5T6twoJem
	H76T3xo2y+8x38m6g8ADzOyKTRDoSHGQ2e5qW8sJNibtwFc+EAtTnKaxBoUHIzKtdJE6c7rDAzH
	V
X-Google-Smtp-Source: AGHT+IHy80N86XVVyNpAqATHzcrXD5bBd+CqSvVLXmqRE3/XN79XIaoRfcQnijzfd9TtYEo9xP6/qA==
X-Received: by 2002:a05:6a00:3a0b:b0:706:7943:b9aa with SMTP id d2e1a72fcca58-70d0847c961mr1120394b3a.5.1721413487944;
        Fri, 19 Jul 2024 11:24:47 -0700 (PDT)
Received: from telecaster.thefacebook.com ([2620:10d:c090:500::7:5d79])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff4b2f40sm1476344b3a.63.2024.07.19.11.24.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:24:47 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v4 2/7] tests/run-debuginfod-fd-prefetch-caches.sh: disable fdcache limit check
Date: Fri, 19 Jul 2024 11:24:33 -0700
Message-ID: <25a614b0087021659ed917527b3513a5cc6dc46c.1721413308.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721413308.git.osandov@fb.com>
References: <cover.1721413308.git.osandov@fb.com>
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

