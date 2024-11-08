Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E32012FB0A
	for <linux-debuggers@vger.kernel.org>; Fri,  8 Nov 2024 16:17:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731082653; cv=none; b=lh5R5ZdtY4V3MOlSen2Al1hoieHD+kggGcYqOZ1g+62sRlueETSvjAeetgjDTMmjFSu3nXWfK8lPvpKlsQlEW6ODFo2LSgweSqwy1o+p+mSiM2bAosAcOI+48SA6yqYTeBWbddsCgxLMp++Yyx6sSSWKkP0DMxtitah8c7ogCvw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731082653; c=relaxed/simple;
	bh=1s2m+Jx8baRUPppXYgE59cG8ipPSuXxxW3QtwXYSD54=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=FEapY1ihOd1l4w0UIEPV7vB5Iqgi8ZjJK2dltiiEdRhgK2WkOk1UgI1sjVvbWe1if0BaadeCzXJQoz/hoG4smh5R2fOrm8/bFwzXd8tpf428oeJkZ78jKt7Xc/4hgTDEnwwOA/iGquFkOAgRtaTgII+znEVd1Vh7KFAw2meg85Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=tLAQE38l; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="tLAQE38l"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-71e702c0ac2so163423b3a.0
        for <linux-debuggers@vger.kernel.org>; Fri, 08 Nov 2024 08:17:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1731082650; x=1731687450; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=gmm+q476f72MHLtcFsjZzuyMesDYO3FqEt9dQKfG5yE=;
        b=tLAQE38liauxFOVK+BrByKMjui4jvin0xlwaMnKhq5c7UC73tOh2Aoc/kvw6caLamA
         nUtLjE05VZezXsMdRQyylFd3TLVQpEWmX/FlFV3x4dSlwuGCJ/MDX1zwBl9dHaWExjSD
         AmMavSxFH9461DEql6w3e5MAANNKKJIlt2yr5kbOh1r6hSFBnC77HDl+Ec8FhVOrcaZZ
         Fon86/2ONTgwlYOmphInwbDRCZVykdnsRcb7nFC+IyvJKcuZX8Tfj0Uhkj4uCumQTQZ6
         7WySVTqPull06fqAFbms454KGAFPeMJSJRe1l85oIqG31WCTuUqAb12FWT2wJcJCeaLZ
         nDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731082650; x=1731687450;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=gmm+q476f72MHLtcFsjZzuyMesDYO3FqEt9dQKfG5yE=;
        b=sUloxp8598gvxXn81EvemIBEQgOYFnW9AYY779hlnyhbyiHtqjPxONwMXGUPsfALE6
         r3TGvjRnIebC5c/L8Euy6qRYR4viNauxJRQdI32VWvOoEl4gylZHluEo78joZF+dwF9E
         Sx1WGgoIlwByE4ASiuwQK8Uq52bA5z3dDUmiq4CIiF6886kFjcoXSyJkSGK7XAGP7RZ8
         z7LvIzK2nMF7fl4faLwTRzKXKF4o+q/srOWBdR2F0sH5o4Tj7ffgiOCzy7rwnrxj6dap
         MXtlTBg8bdTqJCf+R10drHoby3E2cfWLn7KLeAQ23Vspcl4nKE5xXpD3J7xJcsO7Ami9
         2WZw==
X-Forwarded-Encrypted: i=1; AJvYcCXRjBYltg8FZLsOOXZ+1CUScsala3X49XfapZqp2AUv0Hhp0xtIaG/IFjRCoFBHV8FsCI+cWRuZf8PwxA6kh0g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyHtUy3QgsU7yXwXHSmBu0R68gjV+4cseAJoZ9+lz1TLjlrFCuj
	Mog+pn6ESZWv0Celd9LzlqOk83YMSRD9Z3Ox9R1BweGx7niyA0FBes9iRpvRXeo=
X-Google-Smtp-Source: AGHT+IF9vtfcz+GKcCZv9mxgHRYFgXxvNl0pVkHXdYD/xQXDT6rWIl+9zhmntJ+JL3qmTPOaBO0Owg==
X-Received: by 2002:aa7:88c4:0:b0:71e:4842:55fe with SMTP id d2e1a72fcca58-72413360475mr1947977b3a.4.1731082650321;
        Fri, 08 Nov 2024 08:17:30 -0800 (PST)
Received: from telecaster ([2601:602:8980:9170::5633])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-724079a404csm4007314b3a.126.2024.11.08.08.17.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Nov 2024 08:17:29 -0800 (PST)
Date: Fri, 8 Nov 2024 08:17:28 -0800
From: Omar Sandoval <osandov@osandov.com>
To: Doug Anderson <dianders@chromium.org>
Cc: Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <daniel.thompson@linaro.org>,
	Amal Raj T <amalrajt@meta.com>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	kgdb-bugreport@lists.sourceforge.net, linux-serial@vger.kernel.org,
	linux-debuggers@vger.kernel.org
Subject: Re: kgdb replacing newline with CRLF in custom query response
Message-ID: <Zy45mCCGZ9sHsXTT@telecaster>
References: <Zy093jVKPs9gSVx2@telecaster>
 <CAD=FV=UZKZ_RL73+JLjeW2FmAfifSyXqLV3M30XzmJSPE9Trzw@mail.gmail.com>
 <Zy1lyACVnZK4xwuW@telecaster>
 <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAD=FV=U2eiG1TuTq48VL+kNCxN6qp_ZcDk3o_6p3B_ENOspQ9Q@mail.gmail.com>

On Fri, Nov 08, 2024 at 07:31:19AM -0800, Doug Anderson wrote:
> Hi,
> 
> On Thu, Nov 7, 2024 at 5:13 PM Omar Sandoval <osandov@osandov.com> wrote:
> >
> > On Thu, Nov 07, 2024 at 05:08:58PM -0800, Doug Anderson wrote:
> > > Hi,
> > >
> > > On Thu, Nov 7, 2024 at 2:23 PM Omar Sandoval <osandov@osandov.com> wrote:
> > > >
> > > > Hi everyone,
> > > >
> > > > Amal is working on adding a custom query packet to kgdb for getting the
> > > > kernel's vmcoreinfo. The rationale and details are available here:
> > > > https://github.com/osandov/drgn/wiki/GDB-Remote-Protocol-proposal:-linux.vmcoreinfo-query-packet
> > > >
> > > > vmcoreinfo is about 3kB, so we were hoping to avoid hex-encoding the
> > > > response and doubling the time it takes to transmit over a slow serial
> > > > connection. Instead, we were hoping to use the escaped binary format,
> > > > which escapes the characters #$}* and leaves other bytes untouched.
> > > >
> > > > We ran into a problem, though: vmcoreinfo contains newline characters,
> > > > which the serial core replaces with CRLF; see commit c7d44a02ac60
> > > > ("serial_core: Commonalize crlf when working w/ a non open console
> > > > port").
> > >
> > > FWIW, the problem predates that commit, but that commit at least moved
> > > it to be someplace common. Before that some serial drivers were
> > > hardcoding it... ;-)
> > >
> > >
> > > > This effectively corrupts the data and causes a checksum
> > > > mismatch.
> > > >
> > > > We'd love some input on how to work around this, especially from the
> > > > kgdb maintainers. Here are a few options, in descending order of my
> > > > preference:
> > > >
> > > > 1. Disable the LF -> CRLF replacement while sending binary data.
> > > > 2. Escape the newlines using some other custom scheme.
> > > > 3. Give up and hex-encode the response.
> > >
> > > I haven't tried prototyping it, but what about moving the LR -> CRLF
> > > code to kdb_msg_write(). It would be really easy to do this in the
> > > case where we're doing "dbg_io_ops->write_char()" since we're already
> > > processing character at a time. It would be harder to do this when
> > > also sending the output to the various console, but may not _too_
> > > hard? You could loop searching for "\n" and send all the characters
> > > before the "\n", then send a "\r", then send the "\n" and all the
> > > characters up to the next "\n".
> > >
> > > If you did this then you'd lose the "\n" to "\r\n" combination in the
> > > gdb stub, but _probably_ that doesn't matter?
> >
> > That sounds reasonable. I was concerned whether this would affect
> > anything else using the ->poll_put_char() tty operation, but kgdb seems
> > to be the only user, does that sound right?
> 
> Right. As far as I can tell, kgdb is the only user of poll_put_char().

Ah, one other concern, though: only uart_poll_put_char() does the CRLF
replacement, but there are other tty_operations that don't, like
hvc_poll_put_char(). So if we move that to kdb_msg_write(), then we'll
be adding extra '\r' for other tty types. Would that be a problem?

Thanks,
Omar
