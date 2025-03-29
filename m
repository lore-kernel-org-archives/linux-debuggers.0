Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE97E2AF12
	for <linux-debuggers@vger.kernel.org>; Sat, 29 Mar 2025 03:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743218701; cv=none; b=hVL8TW7cS8xrrWkRJstGXqQxrUW0Sp0aSxaxL73Rwo8OSHiLGhP0pSUtYBMFtRk3thAghMOuiRts7KOp6tHS/tji88e8k7kmm4qqXWcvPHdMbqplP/3xFhkxL6Zue4aClMDSWuYUK7qs6yaFHLQ32e5qv6n6Z5JC9qa2WsqHqQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743218701; c=relaxed/simple;
	bh=F+PWfSTDG9MGV+UQf1vmWzCvVv7FHisQ5K2RdyyB9W8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Content-Type; b=tbLlVXOhWQhQYNOm6t58fWMpW3DLpbJETDnizwmZidtTWWqbOnhBJWtElhLtYC7QC0oxdHkadydArAGMiSuM9oi9umvt1kU/xuv/4IHubUFBO9dtF1ZO8E8TI1ceg0Ia1wR6n5li3H5moulqDxkYQYAhcwjjrZ04y0tCXJBK0MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bv/8P5Ss; arc=none smtp.client-ip=209.85.160.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bv/8P5Ss"
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-4768f90bf36so30577151cf.0
        for <linux-debuggers@vger.kernel.org>; Fri, 28 Mar 2025 20:24:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743218698; x=1743823498; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :from:to:cc:subject:date:message-id:reply-to;
        bh=r9MBqjmP9Y32IQftRtToOTmIJQkCpORmwF7KORMnqXg=;
        b=bv/8P5SsDA/fTYUE3sGu8TXvMnEwaI55Ns8djYHKYm/KNUgyecnh6JPwADRS24gQq+
         DicK8bhL1EieBhkU2DmhQEqmgKucDS45eSPirOIy62c9MuhpRoN+OGpgsTBn75iwDOYX
         J+OzCpy6KIOOsevc48U0cdl/O1bbA+YyIT9oikVyUVDthOgRc2tV+86e7fwquIj3z6un
         dQJxm7JfsJLuZu9YWui021qvdK/l3EuBaE/6WIAcKeKV4XYbUoK14evfbcWvmuwiRW23
         zFLt4bJrqwzDGIRb5b2bvC7wadxZKDszjzalL7ElyoKWxi7k6W3O+Cf4tfoQjj65eZsb
         COjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743218698; x=1743823498;
        h=to:subject:message-id:date:from:in-reply-to:references:mime-version
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=r9MBqjmP9Y32IQftRtToOTmIJQkCpORmwF7KORMnqXg=;
        b=s7Zz5CDqlda08qGxJkys+BTf0YxBRfFrZB9VkGcz48kBgL3hvAuTZ9lEy7EiB3shkB
         dGKZ3VG76tao0vQFejjNoN26LVUGSraGzwJ0FvWvZIlHW4jPMa3Cvm6csgplyhyePXUI
         xmA4HsUhXFCW5MM7Bi2lcR18qTp85MX84uFV802LKh9xT0Z4UZHR0D+uO0XOa4DZpV3p
         iEdN7RwdGSigEvaLbH0q2D2ms3zQu71/2WIDkdKtpvqwERE9aKHWrAfBW8C4EhouY5HK
         q93353KB9ToAy0leHS8Faci61OApIoSGLmP/U4tEHJrOKTf+rHWVBUwjcnmGeOFFpExS
         g66Q==
X-Gm-Message-State: AOJu0Yy4G+uWh6QJUzgy9a5I/7WU3v+SPG7f4UeyZPNtK7baFXPMbUpQ
	wA5iK77hy7EKe+Jk09Rrs+Il8NGd4VqDp7GaARb5BX+hbogLlH7HacfULWVupRZIyB0u5W9QqKJ
	BVTCdTVjw40GWh2t854tUjqV67n/eqCbC
X-Gm-Gg: ASbGncvUk9oNZ/6emyZqEXdm4udOr334xi87/H+3BUujCCsNQXVZAouJG0ZGoE/bLIw
	17OqhlkQErx9Pe0m5dQB82hwYeOpY7xcO4wZQiq+38YyBYQ9x0bCCVMtJIq9vvYFGQydI4uCfcq
	JP6H+p2N7cmUf8ulbZdzXJc04rKzVGNfD1YqYjxjY=
X-Google-Smtp-Source: AGHT+IEWc9blLaovDv67O6mizCxCB2VNquqyrxpfj6W96AIP79zx/Id7puIvBepUKn9CpZCAYYnGKFxVlvWwANdYruo=
X-Received: by 2002:ac8:5a86:0:b0:476:7bd1:68dd with SMTP id
 d75a77b69052e-477ed721a88mr28748141cf.50.1743218698414; Fri, 28 Mar 2025
 20:24:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAMtebmKLJ4MaXsNX5zeJN5MoZP+x7_qAru5R+F1WBh10Vzj3=A@mail.gmail.com>
In-Reply-To: <CAMtebmKLJ4MaXsNX5zeJN5MoZP+x7_qAru5R+F1WBh10Vzj3=A@mail.gmail.com>
From: Adrian Johnston <adrian3@gmail.com>
Date: Fri, 28 Mar 2025 20:24:47 -0700
X-Gm-Features: AQ5f1JrSxPmzzqcO8z1xntp5NrW7jbAWdFrF_G08TRyWbp9GZFNiLRTeksZXaF8
Message-ID: <CAMtebm+fzVE6iVst=mT5ecWK66C80pM4eFi5SXtU2F46kaGm4Q@mail.gmail.com>
Subject: Fwd: Debugger for mapcount/reference counting issues
To: linux-debuggers@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

I was just reading an article about the long running
mapcount/reference counting issues in the kernel over on LWN.
https://lwn.net/Articles/1013956/bigpage

And I'd like to make a recommendation in this ongoing discussion.

The kernel would benefit from a reference count debugger.  This is a
debug build only tool that keeps track of the owner of each increment
to a reference count and then confirms that each call to release a
reference count has an owner that matches an increment by a previously
registered owner.  This enforces an ownership match between allocation
and release of each reference count increment, even in ad hoc code. It
would also be able to validate the reference counter independently
when resources are being processed, created and destroyed.

Ideally this tool would be able to show calls stacks associated with
release operations that have unregistered owners and call stacks for
leaked reference increments at system shutdown.  Having this type of
tool enabled on your integration build (linux-next) might save you a
lot of debugging.

Personally, I don't think this is a good problem to have and would
argue that every resource should have a single owner that arbitrates
it's life cycle.  But there are tools that can help if reference
counting is necessary.

All the best,
Adrian Johnston
