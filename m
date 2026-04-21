Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E59284693
	for <linux-debuggers@vger.kernel.org>; Tue, 21 Apr 2026 20:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776804761; cv=none; b=euAfsFZN0TE244OLWHek8jKuJYlHpq8yUz1DNSSbjgKx88Wx5FRZadteAIFDTuB6RxQGrXlfRAQK2zJZtHyzlVxGvXjIOXgus/YZ2SdWuW8yWOTPjTqWF+6cfN7YZ3x0mYEB2AVpB15rJpufhfgYGZJGLUhBLY89xPpE9LbWos0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776804761; c=relaxed/simple;
	bh=k434JVa5dquGZSwQjzp9kKbyxCSGWtwnfBlKsN3/tzM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=d+I6wWbT/FmY9I4Hbo0fPtcrLJEzdhwfZwigFPnEcVA90W56tvlQqcrD83qC7mmlQfzLr3BEcF12nKIM+QStD0fvIrGZZxJnY1XQA8/jebREt8PS+NKZmGHELXk4bipFlyqYOM8Ad/TFMWh1me7tmlSTQRMiVfDpJfCyYAAWiTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=xFiP5abt; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="xFiP5abt"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-12db2e9b3bcso163192c88.3
        for <linux-debuggers@vger.kernel.org>; Tue, 21 Apr 2026 13:52:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1776804759; x=1777409559; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=f+4xqbzDIRLVInUa3LCIqwlzpW9z3o2Vk6qrW1wASsE=;
        b=xFiP5abtUOD1MSmYOmXAmDYuRC+xCvcqe4LQkLtJDodn80VvnPX8mPmNrHmy8Z2fRQ
         dmE6nEXsqHTnCH5AzjtgHQLEktpX4EpIDGdThgW99IkULWLm+X/qyBlIr4JVPmZqreOr
         0UuZb1tyie9d+Eg8j2xnGxboDDIXMI8+b749sy+qNMP/aqRyrp5K2UrG/eCuSodlTZlB
         ssDpsyJhoAy/dnMu7h8TsIQLB4Ax0vYSQYiUaGLY4hsAEkITvXhtUAljwSy9akXhggy1
         nhKm8WMXb62UZ6ssD97nbvzveCeIci6RkzAvZxqxIlparu2K7BQllphSgltf7j67kLBi
         tsyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776804759; x=1777409559;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=f+4xqbzDIRLVInUa3LCIqwlzpW9z3o2Vk6qrW1wASsE=;
        b=lNDfeL3K0sqDqG2HRB1KcxFey5SUWv0ir//V+p3AsLeoje01THciXV5azL5TWsNMfw
         foHPUC+iuMXKbyjcSwkYv0nIzxSbNYE3BFe1rR6WBnArCwsR6Mg2tT+Mc7FhbUkJK4W0
         XTJ0GBN12PLXDQGnqGTXlXjcG77pbUQM2Tj0yY1sFfgxu6AD3r4LfbrNEf+1M1Mq9fVx
         ToQYsWBDP1VK6XNcVw1EqIUkHawmKV/Y5pFH2keGWHtZjCWzkiHOqWPaBmlMYrqkSWM2
         JIZG4mwF3bmLer4YgvPQtII556hCLqMvCmVSfU+smX2tmDHMdNKIK5UNvlhfEBZVtGOC
         eOtw==
X-Gm-Message-State: AOJu0Yz2LVYGqsTr9INVY6MX7wdLXBiom+HlpjWcRoTTbUcoN6RAs8qP
	Ay345WH9/yGxZR7QTNuK2+breBFJDzPKdWzBkYodO3JA4pZefW5FDTz1jlel5e7wsGGDaIsjdv2
	WKCrC
X-Gm-Gg: AeBDieuCqO/r7WMIMVk7BeYtpgg93ZzG9j+MXLxbvO0b1oD/k3FiUh1E3E9h+mcIz3d
	3RzGDa4KQ5uFh4btnmxdTVe+JDqcEc+Tn3zUtpbfN7rbf+S/PD81zv+dL5Q9opgVLKvffsLhvhy
	i5zFiK6nWo2c5b3F+Q2O+GyyLAEIAkQmxwCZtgrWTHY/A0AqVil4tG8sKo92z1ReHHnN3XX/GAR
	nro4bokKYYLsDPB55qZoVHfaVvq0R7HRxmgoQrlSjODtgtQVU8v6VdgWcWAweS6SRRGJbp4FyPz
	uGDcDfvE2ezLkuuKIqT1WO93AHEcU4fvfafxTKtF1iUWEsPNxD9rNrCa1WvFUY6gMfZKlt6Ou0f
	zYm3Ga3LkirWVDGxD0XPYzVZhFg8CoYVTjKUmgAizdnfWAptA0bcZeGkyT/sLbNHx9qbI9v2Edd
	RbgWrGpHYJNATp7y9Qx9GsqbDnZ/KD0ZrnCC5aKyqLHvl+cThR
X-Received: by 2002:a05:7022:223:b0:12d:b6cb:bdb5 with SMTP id a92af1059eb24-12db6cbbf74mr497668c88.0.1776804758729;
        Tue, 21 Apr 2026 13:52:38 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:7605])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c74a2ac32sm21011681c88.15.2026.04.21.13.52.38
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Apr 2026 13:52:38 -0700 (PDT)
Date: Tue, 21 Apr 2026 13:52:37 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, April 22nd
Message-ID: <aefjlU-59mWDaeMW@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, April 22nd at
11:30 AM Pacific time. This meeting is a forum to discuss development of
Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- Progress update on breakpoints in drgn.
- Decision on doing a Debugging Microconference at Linux Plumbers
  Conference.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
