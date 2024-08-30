Received: from mail-lj1-f177.google.com (mail-lj1-f177.google.com [209.85.208.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F61F23B1
	for <linux-debuggers@vger.kernel.org>; Fri, 30 Aug 2024 00:27:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724977633; cv=none; b=tEH0+cMEbazh0of6+LUNmh1wvjVpdU8OGOaR6Xi+SbLJpQfPfnmYc9CquAjXvfjEX/CDARLsOdz+Q4slO9/4hjhiFd1GHLPGkDyefiGzw6Usn/ZLu8IyF6UUXa83g9AaWHcgrGwwVOJdUNStxj/xXHd3YmLhmqId4wlUfDyZ7NQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724977633; c=relaxed/simple;
	bh=bJd9I32v7Otg4KdUboUZFduUF4MCAqDOB8cOCWhBtsU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WO0h/DGr3QMxq+8n14xqlCL/hO3dlfTlBfUJ6sJWkLSsAVEX1n5l67iRQ6cKdnI0jZHM1N3C1AB6xbxZpJ6t+Q/jtg8+NnU71lNy3kx3yOs3b9lS8UbFXfoStyfIjS80MFncnagQewKFvndMCCTG1DMz2EwaN1oMs3raa7Ghbgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=W9rPqE/Z; arc=none smtp.client-ip=209.85.208.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="W9rPqE/Z"
Received: by mail-lj1-f177.google.com with SMTP id 38308e7fff4ca-2f3f25a1713so14537511fa.2
        for <linux-debuggers@vger.kernel.org>; Thu, 29 Aug 2024 17:27:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1724977628; x=1725582428; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=0U2GctD6QRgRftcHbwdJFZ3yjPiOgv4RiUO/asYgyGY=;
        b=W9rPqE/Zr5zlfmXkb42q8EjBvSCNp0os45rzNaiq5I97nExyat1eXbe3tOFMT1n/WR
         AG4xveJ8nSrIRbfyGeLqdE9fJjwHg8oDQma1kHU5z7lU7EXct8qaehGS3rKlj3YGFU0b
         44SrLEmm1tz7M8/eUOSpez279rxyTEqMEJWCc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724977628; x=1725582428;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0U2GctD6QRgRftcHbwdJFZ3yjPiOgv4RiUO/asYgyGY=;
        b=gtFXqmtjEt824Xzd0J5vYqzUpF3eAXV9sqlYoQ6+XdrnLOVtMSnJLs9vRpjkJanpGg
         8L5OmBSxNzsjO3QedSUgNuECwmqOvGlgVOg6hdmxOfiwqLO6aiip6bYsu0bvzp5g/+GI
         5zSSyT4njaukroOrWTUbQWTAuw6lBsm/nfiJu3hCM1stt+Y1jcyRyj52xwvrJOHGRItd
         Wa/qxRI4Az1dGeyFnoEWI/hIVvnN34DMBBQHJHKi9K3E775lFtIsstp5U+ZPehuHEptc
         /bTCD3JdoVu8D1Z4LmLKBDHofAHXINJMjqvaVwaKWY84eq1JqTwevfBAp4ns5woZIkyn
         SDTg==
X-Forwarded-Encrypted: i=1; AJvYcCX1UA5TIdp13NqgurqE6yDrEzEvOq3lNpvDVtLuUXze/MOkkAZux7EK6AhPsWGNpFMWkOTsu2oFffY7DWjc2xs=@vger.kernel.org
X-Gm-Message-State: AOJu0YwlXDzZY8WE1N8wvGMUuwzvcAh+FNI6XE7jL3i0qLVvdUXxbJyD
	cjdy1sUqICdazz/9ioPeCGE0FvU8qp/zE94Fe7woBD+8XL7t/qzhJUGmNzXNf+/1gkS164jfJPg
	IEQofWA==
X-Google-Smtp-Source: AGHT+IHyRLfq+YHSerLCKpIXueBjFzPgaxlgLpv9l4Xj3trIRDX7Sy/5GoOt4K4EFvnBuBZHFVjnvA==
X-Received: by 2002:a05:6512:3987:b0:52e:6d71:e8f1 with SMTP id 2adb3069b0e04-53546bb5f59mr173140e87.53.1724977627652;
        Thu, 29 Aug 2024 17:27:07 -0700 (PDT)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a89891d6d88sm142147466b.151.2024.08.29.17.27.06
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Aug 2024 17:27:06 -0700 (PDT)
Received: by mail-wr1-f50.google.com with SMTP id ffacd0b85a97d-371ba7e46easo836431f8f.0
        for <linux-debuggers@vger.kernel.org>; Thu, 29 Aug 2024 17:27:06 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCVeg9KuuI+a4DZlGjIlD8ZI6iMRnEROPp9El20znExmCf1jSZ7sH2ZhvOKJL68VnlwSFj433tooaZGd45IXTV8=@vger.kernel.org
X-Received: by 2002:adf:b647:0:b0:368:526d:41d8 with SMTP id
 ffacd0b85a97d-3749b548673mr2714437f8f.23.1724977626257; Thu, 29 Aug 2024
 17:27:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240829182049.287086-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20240829182049.287086-1-stephen.s.brennan@oracle.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Fri, 30 Aug 2024 12:26:49 +1200
X-Gmail-Original-Message-ID: <CAHk-=wjKbgRY+Jvu2GNaDXaAhyydOOW-R=0qCzM3mTLrZZg+iQ@mail.gmail.com>
Message-ID: <CAHk-=wjKbgRY+Jvu2GNaDXaAhyydOOW-R=0qCzM3mTLrZZg+iQ@mail.gmail.com>
Subject: Re: [PATCH] dcache: don't discard dentry_hashtable or d_hash_shift
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Christian Brauner <brauner@kernel.org>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
	linux-debuggers@vger.kernel.org, Jan Kara <jack@suse.cz>
Content-Type: text/plain; charset="UTF-8"

On Fri, 30 Aug 2024 at 06:21, Stephen Brennan
<stephen.s.brennan@oracle.com> wrote:
>
> I know this "fix" may seem a bit silly, but reading out the dentry
> hashtable contents from a core dump or live system has been a real life
> saver when debugging dentry cache bloat issues. Could we do something
> like this (even making it opt-in would be great) for v6.11?

Sure, applied with fixes to the comment (you seem to have dropped a word).

             Linus
