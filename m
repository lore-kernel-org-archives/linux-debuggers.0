Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2553B786
	for <linux-debuggers@vger.kernel.org>; Tue, 19 Dec 2023 21:43:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="YeG+n5fc"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d075392ff6so891305ad.1
        for <linux-debuggers@vger.kernel.org>; Tue, 19 Dec 2023 13:43:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1703022199; x=1703626999; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BptmGGTDMQGKD3NjxSdPYbEpJOjIdeHV2Q7D+aynrlk=;
        b=YeG+n5fcJe3Q4uf2MjbqGAmmEdd8h2YFCXd5vX74+cEDToC/g92+I6JopUd9g36SEX
         VHzTlUo3XlGziq17q6+y+7beWvPkNSl5d773J+zb2lllsqso9PRiPMj8d/Atlk5b9huF
         vxSh1Tm60yBbuMjXoAGpMYcmjwAVmK8QulYbiRUWJVsyAYB+4yN+FZ2Fm/Hfa67oJXzY
         sQOT1i6dKE1KGW+He5jfZnOv4+dqEpLt8sRw9S1x85kJRt+rhb2yj37JCfpvZeQWKycF
         1sWI/2wiLDwdFHGzga9T+qnyEd8joEpOcdZKKWDyUC607KPjhta6CqJEQnZP2v9j37Mh
         PrCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703022199; x=1703626999;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BptmGGTDMQGKD3NjxSdPYbEpJOjIdeHV2Q7D+aynrlk=;
        b=d8+KMOF5BLDwKgSEOeO0dQ6RnFfskVAe7pTrUX9rZj2VHzTp0PQFaFHyfmGV4vP4LF
         zREJLU4vfDvfg7z66nhiMvPjk+HCpk+/Ods/2Cwh/weq1DrPfFkHWBNApoJWxMHMx4fA
         ByA9WPoa6LkS8P6BUb9HkNE9ynxzf4CXhK2WbFJFWru4rxyj9kay4MJk39T5i6YosjJT
         ErfYEYi/+nzCN42ri9t7HKOoPBomSWnnWhvRZqesyrZ8jXxhXPajpIeVtVO2R02/vkra
         Kf/2Zws/IGIspsXBdX1BBGmUDNPi6dm/81lJ7Bt6u5R65wY8UScnGkxpmDzyZEGGGcbW
         mo8A==
X-Gm-Message-State: AOJu0YwHXzbFvzfri2Mg6rLc4sK+0nB1ecVE0oMO8yezHAPkOLnHurtb
	PJLxYCi/r1l9bhKQiVtKvqUbjNSdrW+iZiL6uPtb4KPfyFM=
X-Google-Smtp-Source: AGHT+IE8bKABtXuVWvss+cFUUQtHZ7eZ0tXBy1xvWB6l5OtkRvDBF5atEyRFIDXCv0XQY3ae9q1g2g==
X-Received: by 2002:a17:902:e810:b0:1d3:8bf1:9add with SMTP id u16-20020a170902e81000b001d38bf19addmr2653491plg.36.1703022198820;
        Tue, 19 Dec 2023 13:43:18 -0800 (PST)
Received: from telecaster ([2620:10d:c090:400::4:649a])
        by smtp.gmail.com with ESMTPSA id q18-20020a17090311d200b001d3867b6424sm8468101plh.113.2023.12.19.13.43.18
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Dec 2023 13:43:18 -0800 (PST)
Date: Tue, 19 Dec 2023 13:43:17 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, December
 20th
Message-ID: <ZYIOdf5Mpzyswll6@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

After a Thanksgiving hiatus, and just in time for Christmas, the next
Linux Kernel Debugging Tools meeting is tomorrow, Wednesday, December
20th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

The agenda so far is:

- Debrief on the Plumbers microconference. Should we do it again next
  year? If so, what do we want to do differently (or the same)?
- drgn updates
	- 0.0.25 release:
	  https://drgn.readthedocs.io/en/latest/release_highlights/0.0.25.html.
	- Default program/optional prog first impressions?
	- Adding built-in commands to drgn
	  (https://github.com/osandov/drgn/pull/367): if we go down this
	  route, how can we bridge the gap between commands and drgn
	  scripting so that it's easy for crash converts to adopt the
	  fancier drgn features?
	- Dealing with `-gsimple-template-names` for C++.
	- Omar's plans for next year: module API, QEMU/gdbstub
	  integration.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

P.S. I've been busy with production issues for the last few weeks, so
apologies to everyone waiting on my code review :(

Thanks!
Omar
