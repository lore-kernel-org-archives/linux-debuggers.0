Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C9E34AB1E
	for <linux-debuggers@vger.kernel.org>; Tue, 28 Oct 2025 17:40:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761673257; cv=none; b=R+AUQHAu3EIUw18wsVuIPXeA0USU1/PE0767w4rv8hRW0ISn1uWOAlyegvSZtxdV2561YN3CrnZpIjyY0+exGla4vMsUmrumzo6dxkCkGuTDihhVz/F4Db8AjnIjsM3c2yV4W5l5tKfCObtiCMsuBnsczYEDOOKadG02FMp7JOY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761673257; c=relaxed/simple;
	bh=XMvb4GZuBGzmX7IowocrYTBh2xBzO1pX6/ozlgz39uU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NFCJIF0bfF9K03cIlfC9qzbNy8a3O5ChRSaKhXa55Cs/qouhl3JOvtr5ZFl5lY7QsL0/1DuPCL6CV9s858DE8Ie2SEBNFZvNO8RC1VmWbUrnYE3iTHzjBVy82jvcM4zDAha3WaOzO8n15iD1fAIliExFm7mupk+dHluNeayAdOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=BWFfeNA8; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="BWFfeNA8"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-29301049db3so9703815ad.0
        for <linux-debuggers@vger.kernel.org>; Tue, 28 Oct 2025 10:40:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1761673255; x=1762278055; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=DVopLmZTDOEubg3fbqWRZo6mnJncBRlkh5KwLtpkxzw=;
        b=BWFfeNA8ec0V0EyK7xtqN0fjOA4j4i9CLeU2A1XIxOyAY22T2PdzSOjmBDB6EEjP9f
         RFI9/kyvcMiGm3PbXNmTESpALiv3VXbodi3za3CwsSh9uoIDNWtSWX164ssN5gIyu09f
         W6KkgkOMnTFcnfAFRf4v7smmD3BFn4Vzxy8W31yO0gQdhoI6xw4ZXp7+1HfwCJO8aMYM
         pZcQky0MncobvTmh5usbvz/gBfm1SID4CgLgGxG5C4/ZRW6lSDi8nM7yJgVoFvlPnDXY
         7f00vVT4Htr09f7M81tFkUpImN0kXL2UdGmajtpuyv4h+oNcRZwRyEW+uxi7M6f3V/FL
         JPUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761673255; x=1762278055;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=DVopLmZTDOEubg3fbqWRZo6mnJncBRlkh5KwLtpkxzw=;
        b=SFRp/F7gMSEDR0hiwcOM8lKZmE8CakCJ598lZuO0P2o/LKj/Y4+RyaomsE9vH7QEZ8
         gEC4grZVckh4P5b3WtpdnUmpenM5V7qxjim1BeI9w1CLfs8rpe5vNetBzHJRc7nUTu2U
         kIpsBaThpxYvWJGZiHORTy+re2/6v6MBJ0nuDXHByDlplGKQmQwdFy/u+grm7eF4EvtM
         BRZMyI1PwVT2aFWIC6QXHbVn3sFSv9P4EpXADT9cMgXE1XEojMqGtMfCEBxuCl7mh8wS
         JvUXXyiYX2gCxwIjyk09BOHeo65RamAT6PEUrDq4uQmL+5HwbIqwsdaqGhSD5LeMApbW
         ma6g==
X-Forwarded-Encrypted: i=1; AJvYcCWFaRt770HyU5akI8SQ6shpokYWCLEPVLImAx+/VRqJxPd/DPpqqOXUWFtVsiIztr6q8zHwFaEQzR52KQyIh/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3CeyGgBJeI5rLQA1njSv55BItZqFabrJWSXnR8LpI/0543zLX
	hYqDM/Qjh98S6GR3bMi9OUKwCYeE4JaVEe1u7Wp2vSbFvKv7hINuuFERZf2aTlgr6AQ=
X-Gm-Gg: ASbGncsRs7mb2xtRtyGtlurzDRloN4+xRZt0pqGp091hLkqa2vWMersGMvghXUISWRQ
	6A9jufzxxuAloee95HDbuPEyRIZYsW+ZqUL/ra6ZkexcbMjtB+EjYxXPpgDYZXw2pwLT2GrDnTj
	+xoP+AYrnzghlF+ViHuL5d+dWuDhJrq5/lMb2oPHw6VuxgFlJk92vwjvOgPfDwRBWvG6o97aGkF
	uqePbJD5zG0kLdK1K3Q9YeHRH5DLfsM80l3Gwn+osHaT+5pElz9CxpBs3PMUOcoDH6djVl+vAsd
	uiDnxfJegoS43zxxHtlOByK+SJSQDTnfkBjlLFWzJln3WFcM+gPA5OU4QXm2qhgBYuIQ8aAONLa
	hBmCArH0y3Vho4/wjZxlj1sx3rHQ21sAQKq7OOTacVPsXJXqAtQGlhtlbYg==
X-Google-Smtp-Source: AGHT+IGLnKJ6Jj69RQwIIMchu5h5MkeqjXzbXQh6dtkz5j1ePmwYZovsH4iKAXHndPBmmR4iy3RfBA==
X-Received: by 2002:a17:902:d2c1:b0:273:a653:bacf with SMTP id d9443c01a7336-294deb398f3mr295865ad.0.1761673254580;
        Tue, 28 Oct 2025 10:40:54 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:59c6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498d274b6sm121931015ad.59.2025.10.28.10.40.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Oct 2025 10:40:54 -0700 (PDT)
Date: Tue, 28 Oct 2025 10:40:52 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: David Hildenbrand <david@redhat.com>,
	Israel Batista <linux@israelbatista.dev.br>,
	akpm@linux-foundation.org, linux-mm@kvack.org,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
Message-ID: <aQEAJHvO2bHvaEy1@telecaster>
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>
 <aP-2x314BKks2_N9@telecaster>
 <3d3bfa52-3e13-4d23-8ef7-6cb8b1ab7d79@lucifer.local>
 <aQABhaMC8xfO2Vem@telecaster>
 <bdf568ce-0e60-4a63-8d67-8d272e05fab2@lucifer.local>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bdf568ce-0e60-4a63-8d67-8d272e05fab2@lucifer.local>

On Tue, Oct 28, 2025 at 04:33:39PM +0000, Lorenzo Stoakes wrote:
> On Mon, Oct 27, 2025 at 04:34:29PM -0700, Omar Sandoval wrote:
> > On Mon, Oct 27, 2025 at 07:46:43PM +0000, Lorenzo Stoakes wrote:
> > > On Mon, Oct 27, 2025 at 11:15:35AM -0700, Omar Sandoval wrote:
> > > > On Mon, Oct 27, 2025 at 10:29:15AM +0100, David Hildenbrand wrote:
> > > > > On 26.10.25 17:22, Israel Batista wrote:
> > > > > > The MEM_* constants indicating the state of the memory block are
> > > > > > currently defined as macros, meaning their definitions will be omitted
> > > > > > from the debuginfo on most kernel builds. This makes it harder for
> > > > > > debuggers to correctly map the block state at runtime, which can be
> > > > > > quite useful when analysing errors related to memory hot plugging and
> > > > > > unplugging with tools such as drgn and eBPF.
> > > > > >
> > > > > > Converting the constants to an enum will ensure the correct information
> > > > > > is emitted by the compiler and available for the debugger, without needing
> > > > > > to hard-code them into the debugger and track their changes.
> > > > > >
> > > > > > Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
> > > > > > ---
> > > > > >   include/linux/memory.h | 16 +++++++++-------
> > > > > >   1 file changed, 9 insertions(+), 7 deletions(-)
> > > > > >
> > > > > > diff --git a/include/linux/memory.h b/include/linux/memory.h
> > > > > > index ba1515160894..8feba3bfcd18 100644
> > > > > > --- a/include/linux/memory.h
> > > > > > +++ b/include/linux/memory.h
> > > > > > @@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
> > > > > >   unsigned long memory_block_size_bytes(void);
> > > > > >   int set_memory_block_size_order(unsigned int order);
> > > > > > -/* These states are exposed to userspace as text strings in sysfs */
> > > > > > -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
> > > > > > -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
> > > > > > -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
> > > > > > -#define	MEM_GOING_ONLINE	(1<<3)
> > > > > > -#define	MEM_CANCEL_ONLINE	(1<<4)
> > > > > > -#define	MEM_CANCEL_OFFLINE	(1<<5)
> > > > > > +enum mem_states {
> > >
> > > Why are we naming a type we never use...
> >
> > As David suggested, naming it means that we can then use it in a way
> > that enables compiler warnings and documents the code better.
> 
> Which compiler warnings?

I was referring to a situation that David suggested where:

1. enum memory_block_state contains distinct values, not flags, and
2. We convert struct memory_block->state to enum memory_block_state.

Then, everywhere that does switch (memory_block->state) would get
warnings for forgotten cases. Maybe desirable, maybe not, but those are
the warnings I was referring to.

> enum foo {
> 	X = 1UL << 40,
> };
> 
> static void blah(enum foo foo)
> {
> }
> 
> ...
> blah(3);
> 
> Doesn't generate any.
> 
> Nor does W=1 or W=2.
> 
> Nor with clang, etiher.
> 
> The better solution is to do something like __bitwise with sparse.
> 
> Also re: type, I'm not sure it is all that safe, or you certainly lose
> control somewhat as the size of the integer you're passing around is
> 'whatever fits the values'. Technically it should be restricted to a signed
> integer (e.g. 32 bit) for C11 but I think gnu c11 is using some compiler
> extension stuff to just make it adapt it to the correct sizing.
> 
> Anyway, this is all probably moot as I believe David suggested these
> _aren't used as flags_.
> 
> In which case I'm fine with it.
> 
> I'm just confused as to why we're still debating the flag stuff?

Right, it's irrelevant in this case. I mainly wanted to know for the
future what MM's preference was for cases that really do need flags. My
bad for not making that clear. It sounds like the answer is a __bitwise
typedef with bit numbers in an anonymous enum, which is fine with me.

[snipping the rest as my question has been answered]

Thanks,
Omar
