Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 523DF370D47
	for <linux-debuggers@vger.kernel.org>; Wed,  8 Apr 2026 19:50:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775677818; cv=none; b=I9JLLap1GmvdAKJInF0l9neYVJri4pHDbLzGsUcS+4OLvd4o6mCcmFKIugmqoEbPc4QDm6O4KMfZWR9KYPVGi7Yr/uMrkck+AD50QUGbs5lsgUUhoPIGiMu5KqkPeSmOgPJsaIpPRzaah1DzWsMUq7mg8NvHeDEXOtCHEjx3pZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775677818; c=relaxed/simple;
	bh=+IA5m7ndzSYeppVYzrI5/8EN2PEGwr4deYc5UolMuDM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ILvaXRY5t2mwxej3/d0KIVuaQav++mbzK6Kwob2dXBzb9QHi3MY5ll20oJz5eOyXSB266NHLWEGxPR0qGBWG1wIRSCQKe5/8g1TFiOIwfyLdk6Zj3rDBfXzr2Pillvv6ZtMJC3HavUu4HZlut95L4963qwZwMR7+PAPJVUYtvMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=lckex/tC; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="lckex/tC"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2aae4d2d215so234325ad.2
        for <linux-debuggers@vger.kernel.org>; Wed, 08 Apr 2026 12:50:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1775677816; x=1776282616; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+IA5m7ndzSYeppVYzrI5/8EN2PEGwr4deYc5UolMuDM=;
        b=lckex/tCZ5Gz7YJTLlV9df/0iLXiOxvBjJIi+y0JeWrBs14uHfIJyY5Eeck4G/D44y
         xKbIkcpN4z/6nwp6f64lnO0s7nRta+illbnIJjRh1wkVio+Jen9jEfolfml5vG5zMh11
         lDjJm6NAuRHAc5l8oKQpitj1/KuifxUY1m+aGDOH9Qgu/0GlsDJybxBhQ//di1XUnSQj
         iIoEBKN2XQzgajcnZ4h/mJHp8vElAj/slUW0neCZyLEYmdGWKZFKLsWghLuSLm+ie9Cj
         H/Y3AIQZEFlZv03EDaxbmHZndqZZnhhReslS47ijqeK8bFtpOe7REi+N7Pfe8v9iiZcg
         Ht9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775677816; x=1776282616;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=+IA5m7ndzSYeppVYzrI5/8EN2PEGwr4deYc5UolMuDM=;
        b=k8ziAR3Co6DXwtthbFPwbNgeEA1bWiK7/cufjsx8gR0/rMwYW2bfPutP6yrcpooitt
         PS3QKxvOkWmCuiuOcjagLt89Sp8RSQABNvkzuHc8uBfV7qa0lKfEp+uOpNDxKX0XJ/b9
         GpTHHXPNmPGuYjdLGIpMl3yYG62dj0WFasSrgIcqcFilSbUOo+RpOh81oyhZBdBjdPHu
         kV/Ms/wRmSX6lWzYnQXRSFSH6PcCC4bBbMUTPof0ISuH7OSuAxrZPzjE6FhWLMyBJBPq
         +M5b26ONT8DNeTY4rZw4k5IST2RmuNl59xN5berM7eWQIfXPaXZqPWP7KDyKhZBTPmUY
         21HA==
X-Gm-Message-State: AOJu0Yy18XhiV6UxvRTstTxREVH9PqhonHCKsDYaGsSruuga25rjlE+N
	NrqR36C3N4D01GRwq0T/UyfGSk/6LF4Wq34gYk5MkaI/M3Y0o5CkAIDS63d8M+GcEtwz1QxJubM
	CJ0eg
X-Gm-Gg: AeBDieuDE81qCtuAJ5yPbiSo22dznk6rWaOQmphWBkFze9UU8sYQXk1UG/CC3YUXEt9
	0579vVqgPUnHkawHGzeys9s0beumt8L9i8TmmNmwk2DUxbFvyXG1Hr/2W7IzVxoVrkGLOfR4Y04
	AnECbQcyOefD/gGZfV8A15mfX3F7M+vhcSGZNywWb+g6/hTLmU++9E2PAFcT8L9kUWmjRQU9V3Z
	rDBw/Aqnzr4EJhST6YKaoLX4X5JetA5ZpvIbwkEbolx3Y6bLH4j0/SfhGUiYcuwjwtBIjzjTbaN
	f5R8+lateN7I+8zAGE6Ka4qESd0p+g/prniskCVlulbEHzRuCfC1o5MAC7mJ1pAqLLgTloYfQeR
	C8rPllIiopNdsmgEpSngVPoMXm0IwsTZ+cpE480hc5kcb1FP7JvH7zD+1wrqgc+Xifml0ZDckbv
	C77flWx4bxSBUNV5S3E3HyLWp7zBc1zkZQSV3I2TFK2i+baA17CQ==
X-Received: by 2002:a05:7022:10d:b0:128:d7b3:6c52 with SMTP id a92af1059eb24-12bfb74c351mr4772679c88.4.1775677816321;
        Wed, 08 Apr 2026 12:50:16 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::2:7ae9])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12bfea5f860sm20999103c88.2.2026.04.08.12.50.15
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Apr 2026 12:50:16 -0700 (PDT)
Date: Wed, 8 Apr 2026 12:50:14 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Debugging Microconference at Linux Plumbers Conference?
Message-ID: <adaxdvQvJX318oy9@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

We are gauging interest in hosting another Debugging Microconference at
Linux Plumbers Conference this year. Topics would focus on common
challenges people are facing with debugging tooling: collecting and
analyzing core dumps, doing live analysis, developing more powerful
debugger features and tools, etc.

We last had one in 2023 which went well. The Linux System Monitoring and
Observability MC last year also had some overlap.

If you would be interested in presenting or attending, please let me
know (either on- or off-list is fine) so we can get a sense of whether
we should do another one.

Thanks!
Omar
