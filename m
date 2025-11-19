Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3D21C8FBA
	for <linux-debuggers@vger.kernel.org>; Wed, 19 Nov 2025 00:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763511601; cv=none; b=jTco15C8tF6ihGzGFzT6nFtE95Q8bk9lxHMFx9+3ML94ACPpT/yz8KmZVLUy29pq6vRxNOTgpp6qW2gVXdytd1bF4S09uPVEzJoyxleqea3YGOKWEiMHmpS3U3KEfPBPqEhWnej7wyc/oPuLr5k5+9DGjRjqngsY/pBpMPIC1QM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763511601; c=relaxed/simple;
	bh=kC2iFkzJF2m3tfOQTB0qy7HJsSz8M2QeKU3B464Oh5w=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=O71tT4WJc01x5oH0peuUWMldOAm9saWaKkRc8lVkkX5GkD8jIToFp8Cv+4GuCvfJ7YSaTbpmhVBz3j4q0AwHvu9t+fA6MRV0CmM8jyB57G7H1pZxzTqOy97D45G8ogtTGCIYHxP+S/disjFoXS+yTilzqzTwSDKq35TxWo0USp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=b41xlhHk; arc=none smtp.client-ip=209.85.216.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="b41xlhHk"
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-343e2e1a580so1139182a91.3
        for <linux-debuggers@vger.kernel.org>; Tue, 18 Nov 2025 16:19:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1763511599; x=1764116399; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2eP74xCvUuJgmSdQF6kA5GSOanYtMGSk7PYCYhDuQgA=;
        b=b41xlhHkLQyAlu2PLqs2W4HFhJNIgReB7dZ0yPUmNh2np0k0h5IReVNE/y3ghZ2IVe
         /rWLZQ7hQRTSWrFP64ywFhFyBAcgZezcsASwrrsss/eBEHd3dydY/b9xuvPN4Yw3HgCC
         NXNAh0fkTNoH52TWww/qLk6AJ/ChpK5TuJMCaEsDS35pY+Od5dB9YxJ8YsKJzAzkyQGA
         5MVhw38ag2rPPoe39L755TBFTuQUpcoRQvAnvjZo/Vzz1XSQG5s0FyKYnUXdgtPmPq3Q
         ykVYYMtHo0tSafqU3nZPdms30ehCgNhm85jc8Awe/bn2B4EGvnjClBC/Xd3Kl6aVyQ7m
         AVVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763511599; x=1764116399;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=2eP74xCvUuJgmSdQF6kA5GSOanYtMGSk7PYCYhDuQgA=;
        b=ZjNAgCxjWUHn7HQQ97vNRyC8qb5l3CsV17IyUv6FtzgjJz/jrFYP10j0eFfo1B93W/
         MdUOGUpXAXdUWVS6HMGKLG+1n1XQiMXtl1yrWOEun0kr58R+7mPacUOLAEIENUQKl+w6
         bjUeVsjHvW/wnzukqTQTY47EQxJJnOCa6Kqe+oo6kAGUvsKF52QqXFBSKbLe0rzD+uZ+
         UPYA1GIuCkzLuesnz8o5Q2tdjprLhcNFcWCJpUgAIYdEjsNFI6m+oh3cQvDWqjYDkGmR
         5QG7lOy/lwPZs8xOCshTHuYiqzG5PYwfG6iXJomnVW1fYWzqOq5IyGpxzyAhwqGJn5DQ
         2DpQ==
X-Gm-Message-State: AOJu0Ywa/ZyYopkTCVSnGFsGgN9jFoAAJZAp1WsqU7CrfjG5a08Ggt2r
	CfQDWVpWrQfvMdpKPr6jSIQzrHI2ifODVSaS/2MCW0ZzKoBybzRzRQB8nHVUAOzbPZHl0LBM/xp
	NCJvh
X-Gm-Gg: ASbGnctlAXJT3QBCZV/a8i8i+bpoPvpMT15YKnDwoRVXDRtwa0ucyxAhPNbbBv6oTkO
	xvtBkwSMEU395u/QNcQeKNtVXMmC19EKWOl2NH7UcLUHmRW16wE1iT2JM/L9Rr4+eVcC2wtZvfg
	C4XUG2qThAFAaHVD0NqBZNnKI0tV6gImIgF7H1AmF7aLcDqX9q1y+q8N/S/YhvBHCzDBGsbymaH
	9/6kHGYiJifhQ9dGqkDy/NrzcdwHP8VRtOMWXlZ/leoRQIhlfgkv9+3RMRnHtXv0Be/h0LgfuKi
	FQMqr5Ov98ZaPD4pb5ZSKoOvy2ukbE35XG6a+ejTzbeia1SoENI0oq3+s2AhQJYLmjk9ECJxKAT
	h/sqAJHtXL/3XgFzAxTR3R6KFEZ8fmhwPP50pFtBMqk5hbigibrfSkjwgntHjJq99tjijD3htSp
	VuE/PIcIt0B0QbguSsYmj89G36
X-Google-Smtp-Source: AGHT+IHy0O1G4cDDqtPruYQpjn1e4pAIE0lv1piSaegthlpDtI6ePeT0VkL1bwqxLKPYaTH7Xri0nA==
X-Received: by 2002:a17:90b:4d87:b0:341:88ba:c632 with SMTP id 98e67ed59e1d1-343f99dade7mr11124511a91.0.1763511598923;
        Tue, 18 Nov 2025 16:19:58 -0800 (PST)
Received: from telecaster ([2620:10d:c090:400::5:f096])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-345b01d934csm2042952a91.1.2025.11.18.16.19.58
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Nov 2025 16:19:58 -0800 (PST)
Date: Tue, 18 Nov 2025 16:19:57 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, November
 19th
Message-ID: <aR0NLeGc0SP-h_Ts@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
November 19th at 11:30 AM Pacific time (one week earlier than usual due
to Thanksgiving). This meeting is a forum to discuss development of
Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- Monthly drgn crash compatibility status update:
  https://github.com/osandov/drgn/issues/507.
- char signedness confusion in drgn before debug info is loaded:
  https://github.com/osandov/drgn/issues/569.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
