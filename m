Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D95CC1B4233
	for <linux-debuggers@vger.kernel.org>; Tue, 21 Jan 2025 21:32:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737495174; cv=none; b=JcFS/Bv+AiJ+XzRiGPkzoCGybO01irsrt59HIixLaja5u757v3jsUQ5uxMtRB/VyjW+Z5GvQKsSTGVJ0v6TTpBqV3TlIwQZYDAVwIE6gl5uZQHkjsdOeA4fHGPBoUBzOQd8bna5oKDkMMjAmzWGyKcFYr2J+9I945HgWS0yapp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737495174; c=relaxed/simple;
	bh=19AxgO7StQhvO2n5EAxYZqduwq+7pYK1YpM36RZmMHA=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=UAR6n9L3q7Ji5tLq63ohv9sD+a4D3iNUZxGFILT4OJ1Q1c0Zys/e/B3BwhipxAP5LjAMQeRIqa5q5/1scpgmH//nH69g5IxJmv/MnCh/hlDGBB+TKWwR+byIahXltPE494ZEPKoOjWb6ACVvj6dxOMAFG3knpszkpo512+pCAXE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=LaapeTyZ; arc=none smtp.client-ip=209.85.216.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="LaapeTyZ"
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-2ee9b1a2116so1332103a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 21 Jan 2025 13:32:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1737495172; x=1738099972; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ua4v0BR1KM8EZEJkjYkB9oXW6q7vB2KNFbn4C2KHjoc=;
        b=LaapeTyZpS0N52PPveNPhgo9QK4tghoWKPSYY6cju9uEBwh8dyrnEWLU0TfTAjZoti
         IlMlXYJ1ouE5oSqC/4c+httFyEM2uMGVBFuczKmOdzduZLLnEVfwhaX4rJUGCapqJL5h
         q454xdaOFesXxQ9Z8D9Y2UMPPQ+NmiGOMazKvU8lffzthvlhvJt/+Q4rJgyN/Xwq2tMk
         RZf36LxyBqR9iPCmfKNJN9CCR1HrHz0EIkIlJxiWnyRl28/g63rYGejVn+JFxKh9ZAF/
         4XqF5NZEBvcN0mLWtvmwCjJID0gEp2qoENomF6Pk190VhEHgZ1T1jeZLtqGUvt+EQh2D
         IaJQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737495172; x=1738099972;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ua4v0BR1KM8EZEJkjYkB9oXW6q7vB2KNFbn4C2KHjoc=;
        b=igNn6FF8T3uMvZlVFPzG/iLLCIl4Dg60BQiaWjWyYL0VY+tnlQpgnwR596a9EGwB+x
         lSw7dc4Mic9eoQM92MVykN1b6SKMRCrdkgquLHu2dHN4CsDMpLJQqCwQleEwPxvTLd/a
         /yK2Ij1ZnWifFt+1BbpJLVIx+iTqVQpu5y9g/tXJdf54+3MT10AJE68+Hbm73/BZKPQl
         D7f8OABgNMPt9UpljNej4fOz9QGXFxAjeQBF7PBgXnZxavlCkOo2KIicYGLHoLDcS3/2
         eCoXx6nQG6QOqLRLGs/yIJNQ3KhRga/oyOSTPv4+Viv8GfjGXHYsmD83q/olfQZM0m4T
         +W4g==
X-Gm-Message-State: AOJu0Yw/x2hM6J8uVK0jkWBArxTi4Yrxv7BG2CK34+yY+0lghCCuEcRr
	q7pCTzz+MJ9DcEupywTWjSJ+NclXzFyShPqZtyRDBVNHsetOzEepkOoqntWAwb6ljQI1DycPVeN
	d
X-Gm-Gg: ASbGncsEC1E6aoyUZ7tH/e3ys4adHXtwQIFv/iPcfNVjHzjbRKPMeT0XOBzSW2Zfcgj
	lncgYvvReQ87pDUpjwMHXuZ0PahcO3q/1Pne8FVKu0x4xqucZ2WUeK31HXS2rZmt2RK9Tz84xj4
	F1jAA+FF8R2LWg7w+0uHQNonbd9iegWYotPkcJuFjUf2h5bhVIma7r4tNYAJq3SKGLfZEdXg7bz
	o7AhNpakT7WQ6WnyZIW2kyzLXn+f6dBM9KwuALuPXX1FSG+o0G5XQ==
X-Google-Smtp-Source: AGHT+IHKowRPi7y4EtEnl98CpvuYiOrzdT83/L9yY9fZSEArKJE4/5eB1ARy3F4SuDNSDSyRK3Epng==
X-Received: by 2002:a05:6a00:991:b0:725:b7dd:e665 with SMTP id d2e1a72fcca58-72dafa6b1admr10242851b3a.3.1737495171729;
        Tue, 21 Jan 2025 13:32:51 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::6:ba15])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72dababc2bfsm9752688b3a.175.2025.01.21.13.32.50
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:32:51 -0800 (PST)
Date: Tue, 21 Jan 2025 13:32:49 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, January
 22nd
Message-ID: <Z5ASgc9ELGyiuyyx@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is this Wednesday, January
22nd at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- Another status update on adding VMCOREINFO to kgdb protocol.
- drgn plugin system RFC:
  https://github.com/osandov/drgn/commits/plugins/
- drgn unwinding using built-in ORC next steps:
  https://github.com/osandov/drgn/pull/460.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
