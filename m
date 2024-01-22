Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C2AD6122
	for <linux-debuggers@vger.kernel.org>; Mon, 22 Jan 2024 06:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=77.93.223.253
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705904895; cv=none; b=Db5s5BnmJqk/37dxVV+Bs4HjXx/uo8ZzNjIqYzSaEBzeHhKPs27R2gwU0Qi0dW2Q5lYCO9nB5tGQsaTMIglvXt+ujnQo772h+2abv6fQS5XfzEaSpv1sd2I6bM9jajgPRh3dlPJz1jKf/bvQt/s3aKL4vRVH2mpt2rBgr2taj7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705904895; c=relaxed/simple;
	bh=wzeFczZApBIaI4b45sItv+JDvHkXUgZKkdFTGNUB8M8=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=cpORQxdEzgxrzUYFm4R8FJwKbN05X48QxvbHt0VT1J6LqeGmpCW1RK+0YrAB6H92ZL/MMfmpzUscqwAmyhQFVq8WoNrPw3+79dY/ZbwGo0qJ+pwGta6CXXDQs7kSUfMHQFY8UrB7AluRNb0DSkPPeaD8MVY2hpE+rakvyGhNfwk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tesarici.cz; spf=pass smtp.mailfrom=tesarici.cz; dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b=PbAQEI8p; arc=none smtp.client-ip=77.93.223.253
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="PbAQEI8p"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id E86E9185FA6;
	Mon, 22 Jan 2024 07:21:15 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1705904476; bh=wzeFczZApBIaI4b45sItv+JDvHkXUgZKkdFTGNUB8M8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=PbAQEI8pPjSuUtSErGqLClKabixzagO1iuTE1NtlxYcB3LLvYnTbeZ2YkzA1T32GD
	 /YZ2blECxIupzh1LJi7ioEmoIRiHhfvjwxRyGDJ/fGONAjQKZkWqeC7R2i9f4Q6gS9
	 kYdicUkp4/FA1HJSX80311LmR2Rz7cXFQAo8S+7xE5be93AZeqP/DSYm1d2zjJ35BM
	 fH13ZSzdVuDNTRLYQT1GrDhTklrfHgWUp7nnQ5aIuprN8/KZYd42mARIOhh3oALM6w
	 cCdPzHWsPoaoYgmF94kytbliJNoSvlN8OFXTN6fMrKFuqb/t/EwXcTLMxAm0WrKviU
	 celB3yfLCGaDw==
Date: Mon, 22 Jan 2024 07:21:14 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: linux-debuggers@vger.kernel.org
Subject: Re: [PATCH libkdumpfile] tests: skip tests which apply to disabled
 compression
Message-ID: <20240122072114.56792cbb@meshulam.tesarici.cz>
In-Reply-To: <20240119195224.3000110-1-stephen.s.brennan@oracle.com>
References: <20240119195224.3000110-1-stephen.s.brennan@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Stephen,

On Fri, 19 Jan 2024 11:52:24 -0800
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> If configured --without-libzstd, for example, the diskdump-basic-zstd
> test will return an ERROR code, causing "make check" to fail. Even using
> XFAIL_TESTS will not resolve the error, because the return code is
> ERROR, not FAIL.

Yes, this has been on my agenda, but with a low priority, because people
who run "make check" usually also configure all available features.

Thanks for taking care of this. The patch looks good to me.

You've earned extra points for patching an m4 macro!

Petr T

> Instead, conditionally include the tests based on whether we are
> compiling with each compression format. This way, we don't test
> unsupported features.
> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  m4/compression.m4 |  1 +
>  tests/Makefile.am | 17 +++++++++++++----
>  2 files changed, 14 insertions(+), 4 deletions(-)
> 
> diff --git a/m4/compression.m4 b/m4/compression.m4
> index 6755ef1..8cb7ce2 100644
> --- a/m4/compression.m4
> +++ b/m4/compression.m4
> @@ -32,4 +32,5 @@ AC_SUBST([$2][_REQUIRES])
>  AC_SUBST([$2][_CFLAGS])
>  AC_SUBST([$2][_LIBS])
>  AC_SUBST([$2][_PC_LIBS])
> +AM_CONDITIONAL(HAVE_$2, test "x$have_$1" = xyes)
>  ])
> diff --git a/tests/Makefile.am b/tests/Makefile.am
> index 0c03b20..8ac90b3 100644
> --- a/tests/Makefile.am
> +++ b/tests/Makefile.am
> @@ -196,10 +196,6 @@ test_scripts = \
>  	diskdump-empty-s390x \
>  	diskdump-empty-x86_64 \
>  	diskdump-basic-raw \
> -	diskdump-basic-zlib \
> -	diskdump-basic-lzo \
> -	diskdump-basic-snappy \
> -	diskdump-basic-zstd \
>  	diskdump-flat-raw \
>  	diskdump-multiread \
>  	diskdump-excluded \
> @@ -331,6 +327,19 @@ test_scripts = \
>  	xlat-xen-x86_64-4.6-bigmem \
>  	zero-size
>  
> +if HAVE_ZSTD
> +test_scripts += diskdump-basic-zstd
> +endif
> +if HAVE_ZLIB
> +test_scripts += diskdump-basic-zlib
> +endif
> +if HAVE_LZO
> +test_scripts += diskdump-basic-lzo
> +endif
> +if HAVE_SNAPPY
> +test_scripts += diskdump-basic-snappy
> +endif
> +
>  dist_check_DATA = \
>  	addrmap-single-begin.expect \
>  	addrmap-single-middle.expect \

