Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D0B23C5535
	for <linux-debuggers@vger.kernel.org>; Tue, 26 May 2026 23:07:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779836856; cv=none; b=Qe475Aq7+3ty4yqIRC6KqRJBJPxOblaJ2TOIrb7i9M7L/gEg+zaARVFvceEOEXIe5Toh6ExgCWQZGZiiqg3Lr6byJg5O1oSTqYDJF3Ds9BmbTVR7DSiJQruJKQOpPauUA/hkqTpEPZubTLSTHE79R++Mg1vNmqBloqbACK33MJ4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779836856; c=relaxed/simple;
	bh=UgDcZYBbbJhJ7GoA4oR4MNi14DUGv5E2GLAxgeIbUu4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=sk5yXywDA1RpgsOqXcC+yqIUDbzPQi7F85C39YAyaZ5CdG4zRvn8AEFZspE3m9Voskaxzgpfo/yfKtcOegH09fKmAzeCygCwK2DClQNMXJGv7OQ36fzO0jqh3dwS4utMwjHBA/VcFy8y4ubzW303XzZqW+8PheNpNmAB/OToYok=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=uvFd+yA4; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="uvFd+yA4"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2b9a1896db5so18348825ad.3
        for <linux-debuggers@vger.kernel.org>; Tue, 26 May 2026 16:07:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1779836854; x=1780441654; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=QmVTmUc/kedIGrUb1sWfe6X6waqJTlt7pnoZbUPoGK0=;
        b=uvFd+yA4KoybDYHVywCsRgu6ifC4qB2c9aMwznZa1XIsqFVNT66wuM0h4thlD8GgHr
         cE5CfS9jMlV/UjIJ+MCh97ilYRWDzmDJto6aTCGu71YxJQPUJOKBHcveug7kz3v4ZZqw
         sYk3q9Ny3hLQVrp4MB7/UGDkSOIOxs0vvYAa964JH3fn7uMO3mNX2nkm9LQRzS1MGrV0
         qVWQuFl3kM3+k4+jnxz+uejeGNlXQ8kZ/5vHbX7Si3ljDH7MBRd/yQ4Qof5J72jSLJAU
         T4otjFga9AcEZUzxdCLutWdAVqB8FfFvlQUewMiP5FWxQCsM8VA/QWWrQNVOErf6JKc6
         2Tmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779836854; x=1780441654;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QmVTmUc/kedIGrUb1sWfe6X6waqJTlt7pnoZbUPoGK0=;
        b=INI2u2T3YTFtPtn85G8wKW87HidGwVgNGGZDMzlBzzyEkyR7ave9ivqpZfalQDZuWw
         uQ/e9Fg6gAZg3eLbBSWwgqH7q2i260pi7CvdVhSuefqIYRyZWulUeLjb0ewr6lvwQAfv
         t9a3gzNeCPUCZGd2Af3kU30vJrd+VxICr6JaYLZGa4+zOj+B4ggvfEU72cQ8EZYVfk3/
         maSlPeYUTB3/j9q/llUI70bzLbYVQiAGpgrsvS4dnQVzuisibNo693VRGtPEEpc0cf84
         Os/wGXYB/Kr0frPyGqzW0UdRVs3GfofZFUq40cSmAjR7RjJYAYtMAD2A2G3HkezC0ICN
         667g==
X-Gm-Message-State: AOJu0Yxa7pMxrEFJKk5ygQYyzB1h2h3d/NaXu6Njjeuw5tneMNiKtE4e
	DXfgXuJITekSznFhl9ImtWWFW8U2VI3lvx0wxp5KtjOZi8wylDE/YwWi+AOcXxe4sFxucscL/ZW
	dtGP/
X-Gm-Gg: Acq92OEI+c4I00uJC2fradKIlYQJV1lVRpXU9LA2LyRa5Gz/wDSTcW6JBT6+l5G/C0S
	dT8bGit+G23dj75JfcbS9m/q9cQ4kGmaStDh9ELr7lBweQoPkFiwLMGxkcGijy+DVjFKvSo33AF
	mdCgF22CiMLvKQefyZUYgIzBuASYxXjlwXgCEIDKRq2RNUXeZL6nmngW1toYW0mlNLSJNFuInTo
	3WXim6DJjE7X6VQblB0RLscMTVWB5q2ceUFDsJG3ihcxjVz29aBVGnG1GEkJwoxVVl/Ni7pa7uO
	6JyuLO3Hm7lMdPzRZh3/F6EJCnm1K8CtoqsPQbgaw3O4WPZfk9FQJcKJLYNAI6MaNvsDh3YGhUV
	kU4MuS+RcuevAmSxx6t6kmJ4bu2OvVga9CnO/8O1Uq06WqGbogVSikwwK2Bi5IWJtPX3sQquzFQ
	ea5MrUuS4g9fLRPstoIPzebJxKF9GNIf98FfKNyIXD2ZWruLzScuXnthenln8UCIR7b/+Xtkz7D
	CLbZGPOZrlnjvt7zcI2aArK9/I1Kg==
X-Received: by 2002:a17:903:1a70:b0:2bd:9576:daad with SMTP id d9443c01a7336-2beb037d627mr116892035ad.1.1779836853796;
        Tue, 26 May 2026 16:07:33 -0700 (PDT)
Received: from telecaster (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb58b2ebcsm136526785ad.49.2026.05.26.16.07.33
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 May 2026 16:07:33 -0700 (PDT)
Date: Tue, 26 May 2026 16:07:32 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, May 27th
Message-ID: <ahYntEJemw4P5dBi@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, May 27th at
11:30 AM Pacific time. This meeting is a forum to discuss development of
Linux kernel debugging tools like drgn, crash, and more.

Sorry for the last minute notice.

Here is the agenda so far:

- Another progress update on breakpoints in drgn.
- Linux System Monitoring and Observability Microconference at Plumbers:
  https://lpc.events/event/20/contributions/2327/

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
