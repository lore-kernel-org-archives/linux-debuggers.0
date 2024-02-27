Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11D0E1D6A8
	for <linux-debuggers@vger.kernel.org>; Tue, 27 Feb 2024 20:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709065499; cv=none; b=Z345o4vB2oTS7DVbwLZOsTYcxgm8sGX/tT3E+kNTCgZ8+CGVKC8lTyUKq+Qv/zjYZ8aJZno4xwT4WfpiNyN47dTQ00W00faEZ4GBTbONp6AAaJwC7pzhMSPOIbfrPGUSabjdTv/ynf17WnYcOEUba509I1nIZxwPW7oUDV3G698=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709065499; c=relaxed/simple;
	bh=DWsqJcNXE6j3UtY8n5avQVEhc+chrog7QXU+CkIgt+o=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sDXDjhePe1oWKQ4CBTM/Vtp5KAGCzm1tyT8IuDOpQRWG+aw6vJHg53JDb5nfeXq6Sb2SPCw7GnooZKl4h3/b9JxzPbbH7G6xN8hucS+479Ie+oavI87JtlUir++PbeTusKEuqCrpoDJ0T+qkNI1DiEZXK4GWlZfMeniBjybQMEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=Hm8hhomH; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="Hm8hhomH"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-6e54ffdd0b5so598476b3a.1
        for <linux-debuggers@vger.kernel.org>; Tue, 27 Feb 2024 12:24:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1709065497; x=1709670297; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/zvLR0J/cqh9s9wyOPPbVMTjvlepHOtyp1iHXe9jU8A=;
        b=Hm8hhomH2yKGjB+Yh5fMeTnQ/Anfr9lzuuHsxnzl7Rr2Fq26gkZ95qQt8djLGv0OWP
         TAcfop+NV1G3Ie/skd1ilhQOiKupW47UN1yq3f7a28YT5c2v1yenVl/DLE4LJUePEfXy
         TbX3xeUJyvaDBuOijgAELmhwwBB0gInSg277mbNVhEC5hJdWBOTGF33V+0mHrmQMY8eI
         75cTUb+z1dd1aZSNAckOcWld0UQCmcAQxmmeW0vL1iL7OAOqihrch0DguJPLW6yCtw/8
         Bl2HwuJXZy82D1ilMdHuyhU1IAmAv8uNHASKOPvf/Jpd2r5jYkUVCWtsSNhdhETveXvj
         /Nvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1709065497; x=1709670297;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/zvLR0J/cqh9s9wyOPPbVMTjvlepHOtyp1iHXe9jU8A=;
        b=EzbcKl2XvaWZGvB2SxRCJ6ksB/5Vir4QNy94n+3RNpMN2xyQ02PNAsOQl3ASWfe/dy
         AjYdo6hprLXS00dtjmxvYR366Egp9Wbf/2ky0NoRRTevPoW0oDl9/pUUkEYUoZHgEVjm
         vxmRtN3BwWumky0XP6NH3RiLAhzXmLYFjl2CaU4n28uV4AahX2WWUf7Wqn3ki/D4USmN
         Myc01MEHC7pHD7vtszFNlVFviZbE8AMoBIlLunAdixgjhUzxr7sSST1f1bP41fOUJjgj
         y59jfRMBeE2XSG6K3o2O9TojqHWRLhMBt0X1oFire1OdSTwqAn6+uun1CYWDIi1sqe/F
         harw==
X-Gm-Message-State: AOJu0YwmUct2nc+U7GoOKFbnZPeUIkaIjNs2shp4/Yz06EOKCd6+X7Li
	CkaFpy+slIaDCiRyZiGs5BMosojtUG0Vy//ELL+LKE0kcYxv0xF1AkSKz2z9UsnCbUCWR0NJJVE
	h
X-Google-Smtp-Source: AGHT+IGqEmmBdNEeWAP+im1grNPPCI6X7KNSgF+aA+lJVnaKrSYpzcDeSDkm2EbhFozHq1GWwla8rw==
X-Received: by 2002:a17:902:cf0f:b0:1dc:8c27:9a07 with SMTP id i15-20020a170902cf0f00b001dc8c279a07mr9986519plg.31.1709065496861;
        Tue, 27 Feb 2024 12:24:56 -0800 (PST)
Received: from telecaster ([2601:602:8980:9170::a9a0])
        by smtp.gmail.com with ESMTPSA id p3-20020a170902e34300b001db8a5ea0a3sm1929735plc.94.2024.02.27.12.24.56
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Feb 2024 12:24:56 -0800 (PST)
Date: Tue, 27 Feb 2024 12:24:55 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, February
 28th
Message-ID: <Zd5FF1aTvhHWcHhY@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
February 28th at 11:30 AM Pacific time. This meeting is a forum to
discuss development of Linux kernel debugging tools like drgn, crash,
and more.

Here is the proposed agenda:

- Problems with using debuginfod for kernel debug info (see
  https://github.com/osandov/drgn/pull/380).
- Stephen's drgn changes to use ORC for stack unwinding without debug
  info.
- Maybe migrating off Slack to something OSS (Matrix)?

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
