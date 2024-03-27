Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com [209.85.167.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 352E72C197
	for <linux-debuggers@vger.kernel.org>; Wed, 27 Mar 2024 22:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711580079; cv=none; b=ZTU+dlIQ2Ngv6jx0Ttu9x0OQ5676ZTAXFHZvos32+PcUMy6jN/L+04sXdOVEW9oQBWewcPgZtAu0g7em1EAAvca0kGC9VAv6Fy0EXajkdQv9ydrmeahusz+UoxWq+e2Pq61OWcmfiBhv9tJtPnZwuTJ56JH8zn/AUaii4MeXeQc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711580079; c=relaxed/simple;
	bh=ooRYn9x3dfl2lRj3elgLBQ5yHRXLUERYjXgknxU6zDs=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=HgHwbpjjJ5WL9LPH9y+ssswNhRhB2Bk2MWSPIx6C0MlDpOUya6x3L7E8dM8YxyXZObPGv8MgtyOnSZibN1D4H2qPRBhB6uPbtdj6jKqTKcZjjXlrQWvZeF5sou9AUUwG9gIb0/FuphJfP1Xes4B4HuFmbI4lGupeCLjPuH9uGHM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=R5jbQk8Z; arc=none smtp.client-ip=209.85.167.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="R5jbQk8Z"
Received: by mail-oi1-f178.google.com with SMTP id 5614622812f47-3c3ae8fa863so266335b6e.2
        for <linux-debuggers@vger.kernel.org>; Wed, 27 Mar 2024 15:54:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1711580076; x=1712184876; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ooRYn9x3dfl2lRj3elgLBQ5yHRXLUERYjXgknxU6zDs=;
        b=R5jbQk8Z6cVnRk9ELSfSx/V/9U7OCD6QvUEWyb36wPw3O4gsnIHecVnl8ddbwMKBn7
         ojIlOGdex1nqXvVb8dXLnBuh/8r1w3jbXfE/WEazqjWgi8eNgCZD1kF0qN2IMLXjGZbP
         POpyx9DdBMKqeLsaAU/2RCYnh3oy+/YJMrI+N7moWOd8gb0oBQW2eQKL0Pp2tIQDJzRA
         sO2t+fp9r8CEuSdhqIslJAPcHPgkShAuI+yg/j9Py6Cbmg3AdLpdy9tIVRIGU7JAaILF
         WWdlIxlFn5wy6AK3zYP7XXZdjicgRdXRoOtAyJrkRKrH9ennn/rGGf3L/eRl614yB6hl
         UwTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1711580076; x=1712184876;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ooRYn9x3dfl2lRj3elgLBQ5yHRXLUERYjXgknxU6zDs=;
        b=eDOCfi1LMUveYf9da41f0qt4jR8jugoQywyuXpEdbXpgnaAFAvcdDRpjwiKof4nd+K
         2kh7XYWNAkNmHuNAJOIu7+P77ujfmA8lMpx9juy/XuBjv3LoUhl27vlvgdIRunx9C+Qf
         VcHM5sqFqsBbCvnsboD1hqj9uPf4uRR9eYtD3EjiMUZ9bHHmg4tS2obsKUtJHD1qXLQK
         XtWZGkQzNlUoC8xDX3OC6+Cv3h5eWGeQR2w+tK6jC2PcxCHfH5R74G2GPRRxFsBGq5op
         cIkqPIhT+VMuUfXMDu+iuLiuXAMqrnIfybIuzze9RZZzFhkVIXQkHdUpRHGey13I3wIo
         Q6pQ==
X-Gm-Message-State: AOJu0YzDuiWkQk5PWuRoMjwFG7a9iyShmweObVaJdpmmUGM4vw18/e2N
	LEd45rSlx41RFJqxxLywb+z4WDkwoGeWcOqZNAtOhprcgCZHkfT+5qfu3f01lK3bUAdJNfrig0s
	F
X-Google-Smtp-Source: AGHT+IHJykwhdZWc5uu1e830bHoH1t2CT8wgNS0X8aHq7HsmIu6CifJ4cXPVlqT/SnY2Wov9H7ju1A==
X-Received: by 2002:a05:6808:15a6:b0:3c3:7a97:3de4 with SMTP id t38-20020a05680815a600b003c37a973de4mr1307533oiw.15.1711580076686;
        Wed, 27 Mar 2024 15:54:36 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::6:42f8])
        by smtp.gmail.com with ESMTPSA id m5-20020aa78a05000000b006e9afb31e4bsm77790pfa.12.2024.03.27.15.54.35
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Mar 2024 15:54:35 -0700 (PDT)
Date: Wed, 27 Mar 2024 15:54:34 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: [ANNOUNCE] Linux Kernel Debuggers Matrix Room
Message-ID: <ZgSjqpIpJTpGO5bd@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

As discussed in the Linux Kernel Debugging Tools monthly meeting today, I
created a Matrix room to replace the Slack workspace that we were previously
using: #linux-debuggers:matrix.org. Developers will be using it to discuss
development, but users are also welcome to join.

Follow this link to join: https://matrix.to/#/#linux-debuggers:matrix.org
