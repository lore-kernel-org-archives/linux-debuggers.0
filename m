Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8BC6E266EFC
	for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 14:57:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761836259; cv=none; b=plQCp0L1yduBbyCxf9wT5CyJ/LyiOMpJQsfiN3s2SIC8PNRUEDxsCht2KZQAb05v5oXzqkohYlc4wITZT600VsGRZE/gmdpEoPhYTVBei2TWLtMzz0MCMtf2QjqIjvsIj92uwn+CU2yxNerU9M6KRCtsUMzoelD03mwhtIYp/Ew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761836259; c=relaxed/simple;
	bh=Lxi83mnenqLXD/dEkFyBMrWO5ZOIAm9IWeX/LclGy1s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ld5xhxQSEHvU29xX+98Wi56VRGXQ/DiMWLVh6EARkpyMz2Gi1Cw3Ocp/CG9Zo7N1EWI5iTAvE4UDrfWtU6V5TldmMfOT8YDNjN6BW6nZ689Jqovdrh/gb9XuUVOJusZOGJVmQE+A1Gqn+AfadtOSe6NDY6V1J+EvmtOd7lhCQBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qyOcKUG6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qyOcKUG6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43774C4CEF8;
	Thu, 30 Oct 2025 14:57:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761836259;
	bh=Lxi83mnenqLXD/dEkFyBMrWO5ZOIAm9IWeX/LclGy1s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qyOcKUG62E+yPf6Qu8h8SVxChOl/54Ncxu1UhBo6qIUcWOg7Tfm8PKDrSR8u0wcFW
	 AXPERmKPm8Jyf2jMk2J5PMehc9X4/UxiYGfpAq8yYv3DcbUFQdQxO1Mj23g4F750++
	 Ll+Nuq5E3vn6qgR2A1homCiXBPQJj1uL2lJE/bJlCD37mZsQAwO2NRnSZIvgZ1qCW3
	 ps+PUo2j+Z6eSFxSPYeCkxaNHqlcAgdMo78VKk8YW1SOnnHmRFeZtj+/uGpjGECNk4
	 MeCGUp1yFJa9spTLErk+XJRiNI0Vesz42IuV13X/HCJHV7a0v3MGK1vZkDMZn+aVNo
	 tH6vfNMzDLX9Q==
Date: Thu, 30 Oct 2025 16:57:33 +0200
From: Mike Rapoport <rppt@kernel.org>
To: Israel Batista <linux@israelbatista.dev.br>
Cc: david@redhat.com, lorenzo.stoakes@oracle.com, akpm@linux-foundation.org,
	linux-mm@kvack.org, osandov@osandov.com,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2 0/3] mm: Convert memory block states (MEM_*) macros to
Message-ID: <aQN83UYU60nVnEcc@kernel.org>
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029195617.2210700-1-linux@israelbatista.dev.br>

On Wed, Oct 29, 2025 at 07:56:26PM +0000, Israel Batista wrote:
> The MEM_* constants indicating the state of a memory block are
> currently defined as macros, meaning their definitions will be omitted
> from the debuginfo on most kernel builds. This makes it harder for
> debuggers to correctly map the block state at runtime, which can be
> quite useful when analysing errors related to memory hot plugging and
> unplugging with tools such as drgn.
> 
> Converting the constants to an enum would ensure the correct information
> is emitted by the compiler and available for the debugger, without needing
> to hard-code them into the debugger and track their changes.
> 
> This patch series aims to replace the current macros with a newly
> created enum named memory_block_state, while also taking advantage of
> the compile time guarantees that we get when using enums.
> 
> The first patch does the conversion of the macros to an enum, while the
> 2nd and 3rd patches use this enum to clean up some type declarations and
> make sure that only valid values are used.
> 
> ---
> 
> Link: https://lore.kernel.org/linux-mm/20251026162156.12141-1-linux@israelbatista.dev.br/ [v1]
> 
> v1 -> v2
> - Rename the enum to make it more descriptive.
> - Let the enum auto-generate the values, as the (1<<X) pattern could be
>   misleading and they're not exposed to userspace.
> - Change the type signature from unsigned long to enum memory_block_state
>   where suitable.
> 
> Thanks to everyone who took their time to review the first version.
> 
> This patch series applies to commit: f30d294530d9 (mm-new)
> 
> Israel Batista (3):
>   mm: convert memory block states (MEM_*) macros to enum
>   mm: change type of state in struct memory_block
>   mm: change type of parameter for memory_notify
> 
>  drivers/base/memory.c  |  6 +++---
>  include/linux/memory.h | 28 +++++++++++++++-------------
>  2 files changed, 18 insertions(+), 16 deletions(-)

I wonder if we need three patches for this, but regardless

Acked-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
 
> -- 
> 2.51.0
> 

-- 
Sincerely yours,
Mike.
