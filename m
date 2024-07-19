Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F81C39ACC
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 08:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721377937; cv=none; b=hPEEuJlhl43T1bz8FLuXit3geFmBwRFhTkaYWM8GiZZR0B5bqD1l/guMUvvH63yeXiUlfKqw6UUwVX++DuZYrRjOzu+28AtYYhkVkd8tC7FCRK0sKHKlrXgC/SCvprsbp+bUpkwi9KMhoY9mbRRKSVQHvcINNLvYmJPv78+gGDk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721377937; c=relaxed/simple;
	bh=UesB4qXCNMCR6NkFYSV2Ruj7Krbns+hMD3/e7+wTjGg=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QjGD6GdhJ/EFjiORw+pzawaNgRROuoXAYZuVyQqvz2lGWGehdOB+JkO0nj7bRvdbuf/ABUl7AYdFJJW0mX3PK91haAaiaQCcJwUHiRxpkSDZ+nc2OJm4nfkvhANODpGqgVrmSk51J4CNVqSaimIgP/tht4gSgkr7s+E1043JXYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=jShoGyEQ; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="jShoGyEQ"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1fd66cddd07so2551025ad.2
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 01:32:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721377936; x=1721982736; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=biAXgVGe01xXLaCXVejULNfAEwYuUbE6WaXaRROeriU=;
        b=jShoGyEQTQsgqBb3afr+WCVj1UScdtXOfhLvOoZ9nEh7ASuSN7oFud8LkGidsMbgQX
         YG6o0wa0vjgTOkLmA661+nMrCiM8vyiB7t2cuIWmeaBil9Sy+G3iopWfqQhCT8/7jeSm
         W8ePPdbEdTVtMU7BfTt0SxJv0cJPl1t7ByRyNkbQn9j+vZC1AO15KHlglexajpgPdNbx
         XAsGTr+q9so+NWZ+dYUVwV4omcVKDmpcGxeLORNdUh6NwSjivY01VQ0OwmW0kRb5Z0OV
         5iNCiyd0TCxfXDJ+J9tOXBjJkLX9h1waYetLFdi86nT0LVJhrLwFQ1OSZMcXsL1RT4w+
         C/OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721377936; x=1721982736;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=biAXgVGe01xXLaCXVejULNfAEwYuUbE6WaXaRROeriU=;
        b=WVBvs0dsowKHWFwv33U+/6Uom5nHzEE5YBVydpqYzCYluOJouc5R79pWNZXcGklejo
         uTe2PM5VDJf21eUcyzbKPM/O2TWAPhvHwXOBfD+QrnbVZzRskJPlZpmGLEe7mGcEvOq5
         i49U9vJW5ghdMHkkb3P8VLWDMJAtjgyTX0aD+JDKA7FS5QEkZrUo6A6AApPdV/ZFeEaI
         LilQJeRzEb+2LfnDTykjzbcdW/xJxbZ6aSIa92SA8oCqWRS5FoV/qPgyeNsU+5QOa7uj
         WoSOFJd+Gc/4NWnDzh18LHzqTnfDEdMpJ3K9i6VFMnMGF6DR7jJhBo3coIhA04vdeHFO
         Igww==
X-Forwarded-Encrypted: i=1; AJvYcCUt0LjFAmXZcS7+pJcJ7wEosyZlql251es+23DEZHan31pgzZQeMnYo+Xgp/mBVygHJjvutYRY23rhKhlxtEre8Ruz6I4mQr3+F6dBjLR+Q
X-Gm-Message-State: AOJu0YweoCkYrE9kVBJ3afNKXhXuJXqzG60GzJhIU5K8IPfZ+fgQ/SJ+
	66yUXCK7rmQ8gBzez15j6FUl5NxwQqEQLRQDmbgloOXLCxx559Vxg/7EL2KyizA=
X-Google-Smtp-Source: AGHT+IFKrNAA55fYu1MOSU5KYZG9YoBD9JaaXcw/QMMl6vqVVghWubTnCneeWqhOG2JLhfhurCNVdA==
X-Received: by 2002:a17:903:1cf:b0:1f7:bcb:ce60 with SMTP id d9443c01a7336-1fc4e6dea9amr56090625ad.53.1721377935643;
        Fri, 19 Jul 2024 01:32:15 -0700 (PDT)
Received: from telecaster.hsd1.wa.comcast.net ([2601:602:8980:9170::7a8e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd64b49467sm8832375ad.6.2024.07.19.01.32.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 01:32:14 -0700 (PDT)
From: Omar Sandoval <osandov@osandov.com>
To: elfutils-devel@sourceware.org
Cc: "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v3 2/7] tests/run-debuginfod-fd-prefetch-caches.sh: disable fdcache limit check
Date: Fri, 19 Jul 2024 01:31:58 -0700
Message-ID: <25a614b0087021659ed917527b3513a5cc6dc46c.1721377314.git.osandov@fb.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <cover.1721377314.git.osandov@fb.com>
References: <cover.1721377314.git.osandov@fb.com>
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

