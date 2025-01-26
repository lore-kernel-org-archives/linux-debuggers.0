Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0FFF2AF0E
	for <linux-debuggers@vger.kernel.org>; Sun, 26 Jan 2025 18:07:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737914872; cv=none; b=eWt85oNkzOADVWLKKzHNGwcCxQKuErrIWYryrxLCI7tJiwwZ7+KGB+CaYpG+VQ8kGQAJ1AnRFJSWu4zra2xnSf8NY/da0k64+DMwWlz+LWDX0pdUbP5sk7+o30svS+JUE6jPAYDhi5fidsZp6qVpx6KHcc9INx5A3PIYEBIoGqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737914872; c=relaxed/simple;
	bh=rufpAubkhVdWLtYkBli46xMbmsqpcQdctDvsH7/NeUw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=l2t7/gVjihSRmtBAta429diTc1ILhPexp1UjLkSsPxSBFpyrlKmcEEaZYk5a4UCFOtfXMU0fx8334aXKXF64R4tb4/AtWlxeHmaoG161kROdGEsseYow3YDtcB3zH+rV32XLScpesoBnB+EA1Wi7pp39n/1kCd4ik4n5nxU3/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=dHXmVJWa; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="dHXmVJWa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1737914867; bh=rufpAubkhVdWLtYkBli46xMbmsqpcQdctDvsH7/NeUw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dHXmVJWapGmL6gAoSJnRKellsIMNbgNwtHTvfyEuRWGNvDKBLASdYZJaLHCfr9dxU
	 9kdhPiykjggdwLTceZkDPGGw2zW6Mc1bVie9cWvWfy6ohMO2q4F6hXo8FRpJar8BYh
	 huC08q+UW54/mqwgoe4p9tj+6dGbYP2ciLWpwI2Y=
Date: Sun, 26 Jan 2025 19:07:47 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: gdb@sourceware.org, linux-debuggers@vger.kernel.org, 
	Omar Sandoval <osandov@osandov.com>, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
Message-ID: <766010fa-49a5-4e86-a730-bf79bb73e928@t-8ch.de>
References: <8734hmtfbr.fsf@oracle.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8734hmtfbr.fsf@oracle.com>

Hi Stephen,

On 2025-01-13 16:22:00-0800, Stephen Brennan wrote:
> I contribute to the drgn debugger [1], and work on debugging the Linux
> kernel a fair bit. Drgn is particularly well-suited to the Linux kernel
> and contains a lot of support for it. It currently supports attaching to
> live targets via Linux's /proc/kcore, and core dumps. We are looking
> into supporting remote targets via GDB's remote protocol.
> 
> One piece of information that is very useful when debugging the Linux
> kernel is the VMCOREINFO note[2]. This is a free-form piece of text
> data, typically around 3k bytes, which contains information that
> debuggers would find useful in interpreting a Linux kernel memory image.
> In particular, it contains the KASLR offset, the build ID of the kernel,
> and the OS release. With this information, a debugger could attach to
> a live GDB stub (e.g. kgdb, or QEMU) without needing to specify
> debuginfo file names or memory KASLR memory offsets.
> 
> To that end, we hope to extend the GDB remote protocol with a facility
> that would allow the debugger to request this information. We've written
> up an idea for this proposal at [3]. The summary is:
> 
>   'q linux.vmcoreinfo'
>      Retrieves the Linux vmcoreinfo data.
>      Reply:
>      'Q [DATA]' data is encoded as described in the Binary Data doc [4]
>      'E.<text>' with an informative message if the data is not available
> 
> However, with the candidate kgdb implementation taking shape [5], we're
> becoming concerned regarding this design. It seems that there is an
> implicit maximum packet size which is not described in the protocol
> documentation. Many stubs have small(ish) shared output buffers. It
> seems to me that data which would be 3k bytes before escaping is too
> large. We've noticed that there is a 'qXfer' query packet which allows
> specifying an offset and a number of bytes. Maybe it would be better for
> us to add a new 'special data area' for the 'qXfer' message, and reuse
> that command?

Do you need to transfer the full vmcoreinfo data?
Wouldn't it be sufficient to only include the address/size of the
vmcoreinfo note in memory and the debugger can read the data from there
with regular memory access commands?
That information is enough for QEMUs vmcoreinfo device.
It would simplify the design and implementation(s) significantly.


Thomas
