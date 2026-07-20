Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE9C7432E7E
	for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 17:35:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784568955; cv=none; b=K3Lu8kT6BQkoH4Y4p8FsiOq5TFzgNcu1kwst79U8X3BjQ9JO+s1E2Npt9Lmb/wYNoy64IBNXg3ZoVzGkpq7orUM4qRhCpqooZ1nxTvNpmTQ97+zJtNt9KUINrzOFhhd/jhIJoZX/yV19dM2qMzQRjtpwELeQeCyn3MQuJCPLaUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784568955; c=relaxed/simple;
	bh=FptR5+zyvPCiwl0Ho2w20omX6TU2GDK5SnRBEViSGyw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tRkE32VOKz4vYmioWi2j9QMdoaVHz6+kEQxcU8Vvk+KqjMElNjkZCZYKODK+WFa5YDhayDKMrUwz9jmi5r4QB1fIh6q9KRh+Flm2WmWMGegIAwj05tIAF+fuVhTOvi3Ox20dQO9ulyrm1P9y3/9ZuKJdf0aq01Zgp/W4fBDtsDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b=ypVfEUIS; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20251104.gappssmtp.com header.i=@osandov-com.20251104.gappssmtp.com header.b="ypVfEUIS"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cf420670bbso3478335ad.1
        for <linux-debuggers@vger.kernel.org>; Mon, 20 Jul 2026 10:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20251104.gappssmtp.com; s=20251104; t=1784568946; x=1785173746; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=fcxOfDsXTcakJrNFPmSVKWlmd6kcWw4ERDrOVBmABaQ=;
        b=ypVfEUIS23GYAcWtG9D9iOPfQdPSYN5PNvuqDasj1pBMgKFdPkId2MIxRIYughkyER
         Tli52lOkUz3kLXWtCcELI35gs7BvDwCeEr1K83tHMDtJzH2X2ZGsGXJZ8CrK2pB7F3nd
         QfuWsFN3frrlSia4+dwMjE6SGCVxhZ3b23f+usWaQLWumvq8SAUcKD3fhWSO2Gau3BNk
         viXqHLEohlkmTZAkfpBMHmA/G9JHDEUoUI6eAMttQ7AUE7AEkGuvKwcP+kFVTZMPBri2
         BJQz3ApxXv1oXTMPltP6L6BKgCHUZoZ/C84vli6SeclLpbIbvB+gX83KS6Us0DvyU3ff
         jLeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784568946; x=1785173746;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=fcxOfDsXTcakJrNFPmSVKWlmd6kcWw4ERDrOVBmABaQ=;
        b=aI3MuFwC0pctL5bvESwpoGg/sQmcK90qm6dkrxuYAcSpUf3GHdCkyrPlB+v7PCRp2k
         a7Xe3hOLIipKdAt+3uOxNxXmFjAkeeiNHQzvmCFiICzCgZwNDVFyBfPJF7q9I2sg6TOg
         IZhrphnC3UlzV+gkF+JgGZPGxIkE2wN68NJEVmfmCMh4LCq+HcTFAQ37cPxgzWW+1A7Q
         NCN1pBW05qzAjOqrAOBrn59j6kzofwXlmkpFVuopm3xhlwA6vpusSyo/aYyWYCMHYw30
         GsepJY+bTpjCVlg6tPiIU3NJwf+EvcmBdAaciSTEzJPEOlfElxLxl/1+kjN48SVgfQmW
         O++g==
X-Forwarded-Encrypted: i=1; AHgh+RrHDWLHCxaYgw7omOMe5e4v4T9TMZYZ1qQHKf6UVuS3cYl1PHS8g6yzFMF8yziQ5DH/IlnZQC/sVHVSFlLFzqY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFVHWFJdq04tvpWMk7dG7YO/aIenySEO5Pd/BjKuWCRRDDOh3
	26aukqAEG1Zs7UakhOT5IcYuksRPnM5MH3Z8plOvriBjIUMYJ0y3RI5eDWiYWvqm57A=
X-Gm-Gg: AR+sD10qUogpXXA3FH/3xnfZq/gsX3BfXSawiinPeAvV6XKF3lnwZUNohjPgrL5DGDq
	mADrYb7jyF3ObPaMcr2Q8iqtHG5C9mL1oZqQauIqFOWZ8cHsFu33td95Nkg7q7GP2opkzAk0gWI
	SxvYBoIFlPpfQFn/FfS57ghkKC+78t94g+ZsmzkeLdKfj64zPe8bbV+AjZGHenATVZjtPQ7gM/D
	NA7V+jMqdiKBJUEjsVx/Ur3M7re8O3lPA8gBBTbzcBKdLMuY4mibRBpGQLp833KW/3sKAKdn+nm
	wGGS4Q7yjSUY7zBpDbsZGFB5Y6GDYIM2cY5Vh0W62ZAMHchCiYliav9sKWthgWZCPCO97/zbAR9
	SPI/4lPfk5Q7H9HXMfCtE3YUcfSMECjuBoBFMjQMRToXB//p+gcpzidF8YFirWfszRdMyzXvyL9
	QVqhSCfDODSAWicLV1
X-Received: by 2002:a17:902:ef48:b0:2ce:aea4:5e80 with SMTP id d9443c01a7336-2cf7bf7814bmr11505315ad.6.1784568945998;
        Mon, 20 Jul 2026 10:35:45 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:500::5ee8])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3142a20b037sm40732696eec.27.2026.07.20.10.35.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Jul 2026 10:35:44 -0700 (PDT)
Date: Mon, 20 Jul 2026 10:35:41 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Baoquan He <baoquan.he@linux.dev>
Cc: Mike Rapoport <rppt@kernel.org>, Pnina Feder <pnina.feder@mobileye.com>,
	Simon Horman <horms@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Dave Young <ruirui.yang@linux.dev>,
	Jonathan Corbet <corbet@lwn.net>, Alexandre Ghiti <alex@ghiti.fr>,
	kexec@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-mips@vger.kernel.org, linux-riscv@lists.infradead.org,
	linux-doc@vger.kernel.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH 0/4] vmcore-tasks: export per-task metadata to vmcoreinfo
Message-ID: <al5cbYMD18UbKe-6@telecaster>
References: <20260622211430.4008899-1-pnina.feder@mobileye.com>
 <akybBoCAm-kJbfHL@kernel.org>
 <20260720091927.GA1736709@horms.kernel.org>
 <al4X300UObXawEIJ@kernel.org>
 <al4yeHrkDHFoo6A0@MiWiFi-R3L-srv>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <al4yeHrkDHFoo6A0@MiWiFi-R3L-srv>

On Mon, Jul 20, 2026 at 10:40:43PM +0800, Baoquan He wrote:
> On 07/20/26 at 03:43pm, Mike Rapoport wrote:
> > Hi Simon,
> > 
> > On Mon, Jul 20, 2026 at 10:19:27AM +0100, Simon Horman wrote:
> > > On Tue, Jul 07, 2026 at 09:21:58AM +0300, Mike Rapoport wrote:
> > > > On Tue, Jun 23, 2026 at 12:14:26AM +0300, Pnina Feder wrote:
> > > > > This series extends vmcoreinfo with struct offsets and sizes needed by
> > > > > the vmcore-tasks userspace tool to extract per-task state from a vmcore
> > > > > dump without requiring kernel debug symbols (DWARF/BTF).
> > > > > 
> > > > > The vmcore-tasks tool reads /proc/vmcore (or a saved vmcore file) and
> > > > > reconstructs, for each task:
> > > > >   - task name, pid, state, flags
> > > > >   - VMA list (start, end, flags, backing file)
> > > > >   - user register state (saved on the kernel stack at kernel entry)
> > > > >   - user-space backtrace with VMA/filename mapping
> > > > >   - kernel dmesg buffer
> > > > > 
> > > > > This provides a lightweight post-mortem crash analysis capability for
> > > > > production environments where full debug info (DWARF/BTF) is not
> > > > > available.
> > > > > 
> > > > > The companion userspace tool is submitted to kexec-tools:
> > > > >   https://lore.kernel.org/all/20260622205550.1087163-1-pnina.feder@mobileye.com/
> > > > 
> > > > Sorry for the delay, this fell between the cracks somehow.
> > > > 
> > > > The kernel side looks fine overall, but to merge it there should be an
> > > > agreement from the userspace side maintainers that vmcore-tasks is
> > > > something they are wishing to accept.
> > > 
> > > Hi Mike, all,
> > > 
> > > Sorry for the extended delay.
> > > 
> > > I will send some minor feedback to the user-space tool patchset
> > > but overall, yes, this is something I would be happy to accept.
> > > 
> > > I don't want to create a chicken-and-egg type problem here.
> > > But it's probably worth mentioning that usually features
> > > hit the kernel before the corresponding code is accepted
> > > into kexec-tools.
> > 
> > Sorry if I wasn't clear. 
> > 
> > I didn't mean that the feature should be merged into kexec-tools before
> > merging the kernel bits. I just wanted to make sure there's no fundamental
> > issue from kexec-tools perspective.
> > 
> > > Let me know how you would like to proceed.
> > 
> > I'm going to wait for Baoquan's review and once that's done I'll pick up
> > the kernel bits.
> 
> Oh, sorry, I just noticed this series, but a quick look give me a hint
> of 'No, I don't like it.' We have had Crash utility, Drgn, now a new one
> comes up. I have some concerns to Pnina:
> 
> 1. Exporting maple tree internals (maple_node, maple_range_64,
>    maple_arange_64, maple_metadata) as vmcoreinfo ABI is problematic.
>    These are private implementation details, not stable structures like
>    task_struct. Any refactoring of the maple tree will silently break
>    the userspace tool. 
> 
> 2. Without DWARF/BTF, the debugging scope is inherently limited — no
>    kernel stack backtrace, no symbol resolution, no variable access.
>    That's essentially "ps + /proc/PID/maps" from a vmcore. Have you
>    considered enabling CONFIG_DEBUG_INFO_BTF on your platforms instead?
>    BTF is compact (typically < 1 MB) and would give drgn full access
>    without needing vmlinux debug packages. That seems like a better
>    return-on-investment than maintaining ~40 new vmcoreinfo exports.
> 
> 3. Beyond the technical concerns, I wonder about adoption. vmcore-tasks
>    targets a fairly narrow use case — platforms without DWARF/BTF, where
>    you still have vmcore but can't ship vmlinux. Is Mobileye currently
>    the only consumer? Are you guys already using it widely and fully?
>    If this lands but doesn't see broader uptake, the ~40 exports risk
>    becoming dead weight in vmcoreinfo — nobody actively uses them, but
>    kernel changes still need to keep them consistent, or they silently
>    rot and give users wrong results. 
> 
> Regards,
> Baoquan

(Adding linux-debuggers mailing list).

I agree with all of Baoquan's points here, with a couple of notes:

1. drgn's BTF support is currently a work in progress, but it's shaping
   up well: https://github.com/osandov/drgn/pull/625.
2. makedumpfile is also gaining BTF extension support:
   https://lore.kernel.org/all/20260617051834.95404-1-ltao@redhat.com/.
   It's lighter-weight than drgn while still being much more general
   than this series.

Thanks,
Omar
