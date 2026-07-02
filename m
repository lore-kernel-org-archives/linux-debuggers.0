Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4795D317160
	for <linux-debuggers@vger.kernel.org>; Thu,  2 Jul 2026 15:51:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783007507; cv=none; b=RjW2P2+5NI2dNi0jwwkh54X2oF5LOPT84AH6OAtzpjcgnmkUlOsOQlodTO0uYG+655Io/481413JdR5eJuWjbRHh761VevB1kBa2O9gYAofJCOpU9l6U2S9iwX1jww1pn+RYor5o36BnZ7bHsWGavn0kRdDwTWGA3m0NbnQB4gY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783007507; c=relaxed/simple;
	bh=Rvu+Q6KQYJvTPorQg1zS6AK1mbNg2YGLOb/FeC6mHlM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Lu8ERxKezjJEb5f63e+GxPa4qmvIrSV0Ul8VkyF3HlZEyTvSHkprox6/XeusOTPvaYUarNiqFtg66V0nKVVxZfI0MrREkInd2iU596nESHsFRjESekL1++ZARPzwQOM9cyy/uvRjtwDK9EpWmWsUiPOvaLdVmEjOpZHs/7DG7Q0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gg3QMKvM; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gg3QMKvM"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-922ff615c14so163559785a.3
        for <linux-debuggers@vger.kernel.org>; Thu, 02 Jul 2026 08:51:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783007505; x=1783612305; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rvu+Q6KQYJvTPorQg1zS6AK1mbNg2YGLOb/FeC6mHlM=;
        b=gg3QMKvMqZFWI8irF2B9PaZB6550/PUd8ey3GzEaa3/4ZfXS1ysOegw5wrFu967gas
         E0RYGMhe/IyvgSr8S8jdtJ0KO5jDV6pwtPWuP8uf1WiszAHZSS3xXpZVBC5a8ADshgDc
         02cDt+4s/mnFPxlVG3uJaEg15dOUqtcfiCcS4QyhBSxLVCFxx/AOQvwY8Q4Y0osoGZu8
         CfD8MLy6giOQLvEIzIWRJ3GJTgiYVOtFO7AUTEs7gq9Ogh4I2s41CnHd5Yz0yXdDyCR0
         Jrdp6+PKlmQS05SPiWgsLeIbsgA+rcUI8GmLe8lq5zy+BtUtNIRbTV+MNlOUXw7HSakD
         aZmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783007505; x=1783612305;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Rvu+Q6KQYJvTPorQg1zS6AK1mbNg2YGLOb/FeC6mHlM=;
        b=jnSiDJYDvDE8FRe64HhD9X/oBjJVpt0LmV7ZCQesIoLX3XupLoq0z6yrO8nac8xrCy
         7IsvfpkwyI5Toriq+ccfvv0v2MvJ/j9VNoKs/xyy6UjYv1M9Ci9bR8dIN7fNR7WHpMEX
         zt9Gs+YYOFbjifVnWVedqthGZ7cRAN47q52KrdK/3XmfGapMeEo6LIm8YTxxQc+4kW57
         bukgnLhhZbzIt1nMjSrOysw6CPjNWj/UKuLfUoeqXMJxNgAdy7jXGxJunMW2X8YHoypy
         X4TxTaJVHZFaGpOnJwCwmNg77dygE1WxR7xUL8vMDobJ0b8f0UjdsP/1yq/TLWJ5nRe/
         29ZA==
X-Gm-Message-State: AOJu0YwUYLakNd1wZzZ2w7/eE9CVuFY9JBaabrxvnuaRKyoXPHGHWbdr
	CFMMN4SjSq5lwv+MWst4BGFDceWTj2hFeNSwAhYaJw1rA3sFqkXHu5PQZ1gP0A==
X-Gm-Gg: AfdE7clJ8jEFN1O4pXKFxmYivOuWwkCTPwx9OafMmnq5NpAv1qjxgKXpLUGrukOUKUh
	10wyVC54EdlU1wvxyYZI1s+U3NC2Htpyj2HCVFskfHHUHdV3+TcFwtPRPb6hagtYr8g2CCVwC+F
	GAsdVVlGdjS9wJoD682FSTRJqKPEVcGgFWlLv4e69Dvjm8EH7joVwRtfA/nSPFW/3OahQ7afMxI
	TLLf/Lb3e551cA+gmcseXQnwxm8KKaoH8mcSJwCnufVODLxjkIZdXC0AOkkde26grp/8VxQZIv0
	h95S/Blom7K3UrfP/1RixSEXyNhjqUy9liQnHD5KP3DurcBm/gqzkpOxPqGEGYhwCRKtWX2wHnY
	ldPzs7uyVHxQJ967APj1Y2LTMSj6MMEzJzyi1qDxOQ8e1gFKxa2XxW86pEAU4ZSGXjSAkSZrZks
	AXLeSH3sWYxbsFlDsjzpRlunlvIoDFKmwDIgPyzI5/F3D7MwaLy8HA6G1j3OwvRLUtGyIzrmciY
	vlJNl8=
X-Received: by 2002:a05:620a:4411:b0:92e:6a0e:a192 with SMTP id af79cd13be357-92e784ed1c3mr898184685a.49.1783007505231;
        Thu, 02 Jul 2026 08:51:45 -0700 (PDT)
Received: from CW-FL20TJCW03-L.tailb3cd1a.ts.net ([2600:4040:9121:7700:107e:2ab3:f57f:619c])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e801bdb0esm245520585a.41.2026.07.02.08.51.44
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 02 Jul 2026 08:51:44 -0700 (PDT)
From: Serapheim Dimitropoulos <serapheimd@gmail.com>
To: Omar Sandoval <osandov@osandov.com>
Cc: linux-debuggers@vger.kernel.org,
	Usama Arif <usama.arif@linux.dev>
Subject: Re: Debugging Microconference at Linux Plumbers Conference?
Date: Thu,  2 Jul 2026 11:51:42 -0400
Message-ID: <20260702155142.87874-1-serapheimd@gmail.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <akP8g_SiT2H2VwrZ@telecaster>
References: <adaxdvQvJX318oy9@telecaster> <20260409144144.72399-1-sdimitropoulos@coreweave.com> <akP8g_SiT2H2VwrZ@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Tue, Jun 30, 2026 at 10:27:31AM -0700, Omar Sandoval wrote:
> Serapheim: Usama, who is one of the Monitoring and Observability MC
> leads, expressed interest in your topics and asked if you could submit
> something.

Thanks for the reminder Omar! Just submitted a proposal for the MC.
