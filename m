Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B030EF9F
	for <linux-debuggers@vger.kernel.org>; Mon, 22 Sep 2025 13:15:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758546910; cv=none; b=imdv+waYFZJ4t29jJVu5IsUMyiyFEHawPiepgbzbvR+j2JolJz07/7ougPBzV+BTDWBwMmjdXooVBAtb/y9rVf7iP57rejxD1rFm3DaWsC/ElXXgLbO53JcH9fYMlvB6LQ1nacUrPB+2xKfTR78lxwqwx7N2tuEJ6x6wnEsMy0Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758546910; c=relaxed/simple;
	bh=w0BgZ/0PysnMar/u7LAhZ9GfXOMmoJnFFf/iWDEkfiM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=qv7Kt1GZlDyv4LBKe78Xs6NqbC4yPFElE7xgy6k25WqXyV4W3hP6B1v/zjFfTBniJvkm43LzB6qfQXEOwjD8g45F+/DS3Q7f15rardb7ywMkErH/Pq7zKBWZdw513o8mwbVf/bNjxmPcYSaSlP/YH03uXW22nhS1gFi7FOzP/w4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WHytwIDZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WHytwIDZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 41A18C4CEF0;
	Mon, 22 Sep 2025 13:15:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758546908;
	bh=w0BgZ/0PysnMar/u7LAhZ9GfXOMmoJnFFf/iWDEkfiM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=WHytwIDZe5D+QvFzO+KrhrqFEJmBwnN8l6c14HrO5UkiNkICTXX/X+ukHk0D5svKg
	 9V8CWy12ndQ8543BWsrWgmdmyxnxd+ssqglrRQXygC2nk9fD2sgl6cwg9ckf5qMWI0
	 evI7jBREbXGoFg+dLPetUUY6qUD/PxEA9ONZoURHqOKQxom/CefUjZRLrjhGFLjV2W
	 pQBB+1MgpO1g4tEhky7IwUUe+4g9AUNBjTKm+nCNdP9mH1qs2WvWUHpeYXy0BajDa/
	 dXAypbx+Yl7aBvQr4NiD659O6HCXeojs38B1A76zqazfiUeMBK0QFP3M79x9/btg8B
	 LeFPyuxAumA/A==
From: Will Deacon <will@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	Omar Sandoval <osandov@osandov.com>
Cc: kernel-team@android.com,
	Will Deacon <will@kernel.org>,
	linux-debuggers@vger.kernel.org,
	kernel-team@fb.com
Subject: Re: [PATCH v2] arm64: map [_text, _stext) virtual address range non-executable+read-only
Date: Mon, 22 Sep 2025 14:14:48 +0100
Message-Id: <175853869848.3126168.11981509234580321695.b4-ty@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <93a6f8e47cce118493e250b719a927f517be12cf.1758316750.git.osandov@osandov.com>
References: <93a6f8e47cce118493e250b719a927f517be12cf.1758316750.git.osandov@osandov.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit

On Fri, 19 Sep 2025 14:27:51 -0700, Omar Sandoval wrote:
> Since the referenced fixes commit, the kernel's .text section is only
> mapped starting from _stext; the region [_text, _stext) is omitted. As a
> result, other vmalloc/vmap allocations may use the virtual addresses
> nominally in the range [_text, _stext). This address reuse confuses
> multiple things:
> 
> 1. crash_prepare_elf64_headers() sets up a segment in /proc/vmcore
>    mapping the entire range [_text, _end) to
>    [__pa_symbol(_text), __pa_symbol(_end)). Reading an address in
>    [_text, _stext) from /proc/vmcore therefore gives the incorrect
>    result.
> 2. Tools doing symbolization (either by reading /proc/kallsyms or based
>    on the vmlinux ELF file) will incorrectly identify vmalloc/vmap
>    allocations in [_text, _stext) as kernel symbols.
> 
> [...]

Applied to arm64 (for-next/mm), thanks!

[1/1] arm64: map [_text, _stext) virtual address range non-executable+read-only
      https://git.kernel.org/arm64/c/5973a62efa34

Cheers,
-- 
Will

https://fixes.arm64.dev
https://next.arm64.dev
https://will.arm64.dev
