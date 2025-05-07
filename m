Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD571215F48
	for <linux-debuggers@vger.kernel.org>; Wed,  7 May 2025 23:44:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746661475; cv=none; b=M41X9C2hAlYLGyyZz3a9ZCNEQwt9l5Gfx0PUglotRFTUGC+eTXjsND4UhkCfOoU6uvbpQGklUmD+mrHbWeej8R8mq3Qc+YcE6HD63A4k2V9XHwgkxwV04eTQyEPp0P92BHCHrZF/vGlhBOfsWPHB6dWtpkfgaiUc7ud8eWOOZGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746661475; c=relaxed/simple;
	bh=McqG76/nf8MlLfDjpSyC1XiVVjV5pcZ15cXB50q0bXs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sXNIUgImDqNisD1Lewm9mP8uWeZk3Y+W1vTKq375T1GGgS2AHV/4+3mSwcdPaPh7IhLuZ7fAgVgM6yxF68jaUfrzKwyejsoXL1opARnhPF158rRD0z+kJEmGVWIlMozBv5YGQuqi/K6C7JsxQruGE7BXY/KckFuWAoNovxeu+yE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=viGyaoWz; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="viGyaoWz"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-22e1782cbb2so645645ad.0
        for <linux-debuggers@vger.kernel.org>; Wed, 07 May 2025 16:44:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1746661473; x=1747266273; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Tfb3bAOsMFCJhaUq67lrZsZgh4mtlw/i42GKCd/C1R0=;
        b=viGyaoWz4C9ZOhnyu0yqK/HsPzGv883rgWGglv+SxBQmF1tiQFifIoZUHhYtrdgl+S
         rtCEhEnb/RBEetbesQnQn4vowP9RhOOwuQl7WJn4ZxZbTE0lo4AdmVEIX5LhUBadBn/c
         A3qtxwVHu7BTvZ7O/VPqM6k7RIzU9YWYuO8RzHHx/rnJxfV2X0ke39TGQC241Ou6idfv
         nlH/8WrjcqSxFj4f25aiv4nI0SlJfcpQBeczM7WFcUtDXmbZVEJV0CVj1B9q9tPeYGtl
         erX5t6JphpEZ+/sneXIQbif3GCYzyP1NSsnTlRrVkE0lOvz056gNrMLvldXi3yvrN3ki
         TrNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746661473; x=1747266273;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tfb3bAOsMFCJhaUq67lrZsZgh4mtlw/i42GKCd/C1R0=;
        b=UHAEJCMZsaklrhoc46qOxk7EvXdKOPy00837db4r4N8f9DY4ELF0za0xRhh4MxrW33
         RI9Z452u7Pw7+rNYXd559wPIJhbTPdl/oAEIwiOZoL8scq6Vrf4uWRgf7wlfJUDdMfEG
         BGJVx0pKV1MHRX+wkmD/n1mLBr7PZksUe5vRd5devaNhDAHz5BgPvkMMaG/if7/NWJjT
         3urwR30DVpy18Kbqk8Ypu5b1+sAbL59veJR0WNZ1bDpiU9hrgJBioekgVLX1uOfGQUw7
         8ZgdHyt+ArbCgOGuMFbgfwTWcmZnlPQ4HEtFYwe6unQK/zVroyWYOr/8xh8bN3Ia7OfN
         qc2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCfLlLhL6a7Ui1LbEAE+tPmArDfv+wi4HgaRlMp/xsueSk4HQlBp/iMBOUfAmassKFAt3rtc29B10y6Wx18Kw=@vger.kernel.org
X-Gm-Message-State: AOJu0YyR6DcClKP2gYu7a2d8oGAK4eTjjkkR9qLKZYn7ucTsIhzsiV+s
	arNxZkrAJqcd/T3tRi1+T71EI3jXe2VtMpCw05v9TyTRV3r9lsAjBoFJuje1ozs=
X-Gm-Gg: ASbGncs+pTkub/y58IP5NYHKgvlCjKSMj8UwyV3WuouulhR7QX351JnZOcxugLsFf0+
	6YTatiw+Tmax1tQvfECqk3GjlPtJNePiKGIdf5534skKzrDdseOE8k3tkhBRUhDqqvD0QsKr9q3
	yjCvhPT52e4cj61yP4TWGAzH49hn6ewYVRWpNENERu6j+I+MjYnc7zkLB/7atqG9wFjGtHuWNxn
	3lveq6m9AycrjCQEU/d47ZiNAO3GZQFr0sijLA8vWw7PNoorjoZieMQFkqwuLziZBScwLjaWCRg
	U0XNN4BD8L9dN3Jdwtg7TbYh1pWFSmlYEA==
X-Google-Smtp-Source: AGHT+IGsw/kqtJ5YRr5g0wNhluC5yR3HEHTrO/ETSJlGHPSk6zfdLjLmP4vMyotPP+sP55DiHI/tJQ==
X-Received: by 2002:a17:903:2352:b0:223:5124:ee7f with SMTP id d9443c01a7336-22e5edf9fdemr30230265ad.12.1746661472908;
        Wed, 07 May 2025 16:44:32 -0700 (PDT)
Received: from telecaster ([2601:602:8980:9170::71f1])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22e5369bea0sm32015845ad.117.2025.05.07.16.44.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 May 2025 16:44:32 -0700 (PDT)
Date: Wed, 7 May 2025 16:44:31 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Al Viro <viro@zeniv.linux.org.uk>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>,
	Christian Brauner <brauner@kernel.org>,
	Mateusz Guzik <mjguzik@gmail.com>, linux-kernel@vger.kernel.org,
	linux-debuggers@vger.kernel.org,
	Sentaro Onizuka <sentaro@amazon.com>
Subject: Re: [PATCH] fs: convert mount flags to enum
Message-ID: <aBvwX_QaVgBNpedP@telecaster>
References: <20250507223402.2795029-1-stephen.s.brennan@oracle.com>
 <20250507230511.GA2023217@ZenIV>
 <aBvo_-Ee7QQtd3YU@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aBvo_-Ee7QQtd3YU@telecaster>

On Wed, May 07, 2025 at 04:13:03PM -0700, Omar Sandoval wrote:
> On Thu, May 08, 2025 at 12:05:11AM +0100, Al Viro wrote:
> > On Wed, May 07, 2025 at 03:34:01PM -0700, Stephen Brennan wrote:
> > > In prior kernel versions (5.8-6.8), commit 9f6c61f96f2d9 ("proc/mounts:
> > > add cursor") introduced MNT_CURSOR, a flag used by readers from
> > > /proc/mounts to keep their place while reading the file. Later, commit
> > > 2eea9ce4310d8 ("mounts: keep list of mounts in an rbtree") removed this
> > > flag and its value has since been repurposed.
> > > 
> > > For debuggers iterating over the list of mounts, cursors should be
> > > skipped as they are irrelevant. Detecting whether an element is a cursor
> > > can be difficult. Since the MNT_CURSOR flag is a preprocessor constant,
> > > it's not present in debuginfo, and since its value is repurposed, we
> > > cannot hard-code it. For this specific issue, cursors are possible to
> > > detect in other ways, but ideally, we would be able to read the mount
> > > flag definitions out of the debuginfo. For that reason, convert the
> > > mount flags to an enum.
> > 
> > Just a warning - there's a bunch of pending changes in that area,
> > so debuggers are going to be in trouble anyway.
> > 
> > Folks, VFS data structures do *NOT* come with any stability warranties.
> > Especially if the object in question is not even defined in include/*/*...
> > 
> > _Anything_ that tries to play with these objects must be version-dependent
> > and be ready to be broken by changes in underlying code at zero notice.
> 
> That's totally fine, we can deal with breakages as long as we can
> reliably detect what version we're dealing with. We can see changed enum
> values, renamed/removed structure members, etc., so that's why those are
> preferable. Macros are invisible at the debug info level (since no one
> compiles with -g3), so those are no good for us. We also avoid version
> checks as much as possible because backports in RHEL and co. make
> version numbers mostly meaningless.

To clarify, we avoid version _number_ checks (i.e., `if (kernel_version
>= 6.15)`) as much as possible. "Version checks" in general are
unavoidable, but in drgn, we try to base them on the existence of
structure members, global variables, types, enum values, etc.
