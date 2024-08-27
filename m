Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D86581AD2
	for <linux-debuggers@vger.kernel.org>; Tue, 27 Aug 2024 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724786556; cv=none; b=aGkeclLasbuZbx6NM6TZxIKwKMYNVzfywQFbuARRZwVw9pgawJ6SNiRD7YszVbx0oLkelhy9iawstGbRdVm7Nv8NG0eax63esnYd4csX6v1chumcgvc418qgvk2o7fny2kdW6n9js1NrCigto0TnbhR81k1h7pIm+55FO7JaXMU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724786556; c=relaxed/simple;
	bh=jjWB9m4BBDOycBcnHlG4HlhF6lG9QNfkLnOHWS86HMM=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LYoVi1gfubT9gi3guVmK5aBgIbdoKSVTXgL7qTjivBEhn2Z1x1AZJNinD9KKehK+VLWyq7eGsSwu2R/vxk0JytMdgK+iWjPmWQ9rmmiVGXbLLEypUReAijolfHTc0pkAxuAkkBkdDIzxB1f0YM2Y5wAz7qxgtMqmm2+llzG8n8w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=P/YQA5Wv; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="P/YQA5Wv"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-7cd894e2adfso783126a12.2
        for <linux-debuggers@vger.kernel.org>; Tue, 27 Aug 2024 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1724786553; x=1725391353; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Rp/2HaMnYhaMC2NynpGRHMh5TyHJpWJc/3hL0pDr/lo=;
        b=P/YQA5Wvl3cU5DG9NDFDq9SKGyOzfgWeh42zW97HsvLtDr6gg8ls1J3B/+TdJEXGeG
         Uxl763c5YpeRH95XMB/xcGqPzGHpFM5/V+oiwJGCZamHmsq5zgxeKzoLUNOFscFz7rDq
         /22AKgR/1eIfGirE7Zy4JK/PFf4ejFSJuhC0HQBphr58mVeNuqsuu2M0/FPoRcpxpbmz
         71iaudCdLdlKDZ1z93DcNSUko4XEHm8m7YEMQVYEa/wfq92CrR6RQwh+nxBA0QMv7u/b
         8JNE2YUeVuC54obhgqA5Gvxs+Kfe29/p3Phf/pWWqym9Qa+f3LPnzeIcB5n3y8D8VMqD
         FgXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724786553; x=1725391353;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Rp/2HaMnYhaMC2NynpGRHMh5TyHJpWJc/3hL0pDr/lo=;
        b=MS9CCocBvikGEtwKU6QGGPjEJ4lfhUAFQ3BU/JbqBsnkJpHk4ujfqMD28U9xEQxqoB
         i6+RQzXxzz0CeFi+k1cST6Vt5dr+9wJzhuisZQh4ynL3N/0pGsu9sKxbxPotc0mkfPng
         2lNrc3ftMwjz8MYSD8xD2qn9Adr3pQUQu9L3/5rjyOsweWAO2lt9HzUH4YitHWA+Zd+/
         /3u79bc96VNn/R7e/p4l2VfxksL0PvbOvwnpx9sYcaCiU5dxaxv/6cSDGqID0HmSuSC4
         CiVMnPvGUknM3xnAflS2dojKAZV0F8Up2+IBp+8j/c7R1HJTzPw84RdNNd0AMOvc4KoZ
         lv4g==
X-Gm-Message-State: AOJu0Yw5q9+OSmaNc7qynF526+GFnLa+m8wWy5ky9EliIB60csqXs0kO
	TgmtXR/Kdk20vMap98vAMbBWzImt5QQx9LT9uTmwIktbxhKd/+gczTWsXZAt+HCe0frFLIeD4hH
	k
X-Google-Smtp-Source: AGHT+IFxUCE4LOt8Xf+rs4xrMhF5sT1OJMZjkeNm53RSKhALu53kWEbVrD5FOI84Numrgidjg6PuNg==
X-Received: by 2002:a05:6a00:9152:b0:70b:705f:dda7 with SMTP id d2e1a72fcca58-714458cb5d9mr10280139b3a.4.1724786553508;
        Tue, 27 Aug 2024 12:22:33 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:400::5:a876])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7143e524a34sm7851209b3a.85.2024.08.27.12.22.32
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Aug 2024 12:22:33 -0700 (PDT)
Date: Tue, 27 Aug 2024 12:22:31 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, August
 28th
Message-ID: <Zs4nd_wG6Wj0LPoY@telecaster.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
August 28th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- Should we have a drgn/kernel debuggers BoF at Plumbers? I will not be
  there in person but could call in if the time allows.
- Should we create a wiki page for best practices for debuggable kernel
  code?
  (Inspired by https://lore.kernel.org/all/20240819155901.416560-1-stephen.s.brennan@oracle.com/)
- makedumpfile on 6.11: does drgn need changes, or is this resolved?
  (https://github.com/osandov/drgn/issues/421).

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
