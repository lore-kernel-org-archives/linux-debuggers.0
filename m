Received: from mail-oo1-f44.google.com (mail-oo1-f44.google.com [209.85.161.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CACD1DDD6
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 22:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721773159; cv=none; b=koi1lKCNFm1JJrdVH0r9fTVWpUNbjCiZ/ITyXU9b86kU3QRhTpjRruhd9fYZyLTZ05+tLhLA1P54LG4zk8VoxxSDsXabeIspr4VUzfYYBY4Zy7dkjlcfUjr4SQhy419H2dTU4puAUFjHqCpcTzv5a8VWZWxWjuL3zabda0yCpSQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721773159; c=relaxed/simple;
	bh=ks6I+oBL95pL+sZWr8K3PBvB/7bICCmv1NEhqOe0I5k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SKOVzK7rUzvMKdeZNHZfP3UuXY/LDtLEUl1ad182Ks2VCtuiU8hbiw8UgNYZxTSeThoBxW5v+Ohv1n5hWZQ8c7bi4RTDraDEpHT0fTMK7KbZlluM59aR/yPUlROVlqBuXwC8iHtaE5pco4o3cLJP9HPHqirG258MDU+U5EL268Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=N+MhfU4s; arc=none smtp.client-ip=209.85.161.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="N+MhfU4s"
Received: by mail-oo1-f44.google.com with SMTP id 006d021491bc7-5cce7626c87so2486051eaf.2
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 15:19:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721773157; x=1722377957; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=pKLQPtVGqMgglm0Xo2y94X8q+XbNiJJIi5eDUrBhAGM=;
        b=N+MhfU4sflPg/u+IajmDqwrVGU2HMlcC9oMdKzJZ8aQD+lPZumQBRBAp3ed8DCkYAq
         jakQuJbeX/CZcYFuHdDMi/BnQ8TJyG7bGYyHwM1DhWj2g3jR1+zlXEK5TBBmB/KVey2f
         3IYxgp4mPUj9DStErifoloPwImSr9xplbvnKFHIQt2EPEZtKKtT8V7DZxyXNVwj+tPUk
         XNb8lx/owvU5RVaK3LHvYUVC51w+QD1biv3Q5SIZFIrHfynhKNFFBZkSps/womvq3AIq
         Ge0/cPYSoaPVT6cAdjmoV3pPEW/z6fsKHrvX184dqkTqqGbNkXgmNoY295O0CyvEhSWm
         Qqfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721773157; x=1722377957;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=pKLQPtVGqMgglm0Xo2y94X8q+XbNiJJIi5eDUrBhAGM=;
        b=WpfyyvRiqV0ZhbV6X5Eov39ACEuQi5LJ0SNHVYaUb4BffvluxQNYv+4vj/wjD5HvZW
         lZyxibMN1MJH4BNlcPEmtfR7f1Bk9TyXpqVw7W7OUqgh1D6PrESjvnCePTSH6iCCPeZC
         IQ+QZ46q22WhpnVVNJCERjOJC9n9LGtbqF+xfaOstXAnkT7WQEUxZ0qVvrVZ1d4ZW4Xw
         RdFyjMoQxfiZp2WDAOU5vPy6yCfomgBW7K0MLYRePqvN+WMzcY82j+vYrgKt0dOzgzDl
         QE4EAs7/2/JBCknc5IZKUXvmQl66CNNjvCQKL+3P57hDJGgw0AvmXD3SslBLeFFrUoPJ
         LTIw==
X-Forwarded-Encrypted: i=1; AJvYcCUbxeFVo2V5vKZCQDJ+1Sow+xhyhiPujHVC+cKje63hd4Z1HQZKF9UYB0iIhUe+mgU9OSKqNUl8UGBgxiFwz3CVmEteOOUT8RdYmBO19pWv
X-Gm-Message-State: AOJu0YwNzX51slxcy8cLScITx/W6hM5goLf1Y8ugxKajFv9bWttt3y3q
	exw85JCaQ7cuLozV6BvMpKUEHhSfhFHPphGDAjrBg83umlvWNpi4RbP2iRci9d8=
X-Google-Smtp-Source: AGHT+IFqTKTooHYQCwLFor73VQ0oSn2NZ3XXJ/9PmPTiY9nr5ilqYxPWhOtr1qMnVWZHdgRrczyYcg==
X-Received: by 2002:a05:6358:5f03:b0:1aa:a27c:aead with SMTP id e5c5f4694b2df-1acec3c5dccmr89717955d.3.1721773157037;
        Tue, 23 Jul 2024 15:19:17 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:500::5:b6d3])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70cff4b2e3csm7446094b3a.75.2024.07.23.15.19.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Jul 2024 15:19:16 -0700 (PDT)
Date: Tue, 23 Jul 2024 15:19:15 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Aaron Merey <amerey@redhat.com>
Cc: elfutils-devel@sourceware.org, "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v4 0/7] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <ZqAsY-zcSh87lAY9@telecaster.dhcp.thefacebook.com>
References: <cover.1721413308.git.osandov@fb.com>
 <CAJDtP-TSVVk8mvjBLBVOqW=MOq-SgtSKEQp-_OZkZ=XrZgRNPQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJDtP-TSVVk8mvjBLBVOqW=MOq-SgtSKEQp-_OZkZ=XrZgRNPQ@mail.gmail.com>

On Tue, Jul 23, 2024 at 05:47:50PM -0400, Aaron Merey wrote:
> Hi Omar,
> 
> On Fri, Jul 19, 2024 at 2:24 PM Omar Sandoval <osandov@osandov.com> wrote:
> >
> > From: Omar Sandoval <osandov@fb.com>
> >
> > This is v4 of my patch series optimizing debuginfod for kernel
> > debuginfo.  v1 is here [1], v2 is here [2], v3 is here [3].  The only
> > changes from v3 in this version are fixing a bogus maybe-uninitialized
> > error on the Debian build and adding the new test files to EXTRA_DIST so
> > that make distcheck passes.
> >
> > Thanks,
> > Omar
> >
> > 1: https://sourceware.org/pipermail/elfutils-devel/2024q3/007191.html
> > 2: https://sourceware.org/pipermail/elfutils-devel/2024q3/007208.html
> > 3: https://sourceware.org/pipermail/elfutils-devel/2024q3/007243.html
> 
> Thanks for working on these patches.  I ran v4 on the sourceware buildbots.
> The new testcase fails on debian-ppc64 [1], debian-i386 [2] and
> fedora-s390x [3].  There was a 4th failing buildbot but AFAICT the failure
> is unrelated to your patches.
> 
> Do you mind taking a look at this?  The patches otherwise LGTM and I'll
> merge them once this is passing on the buildbots.

Thanks for the test run, and sorry for the churn.  It looks like these
are all failing with "error: no fdcache hits" because every addition to
the fdcache results in "fdcache emergency flush for filling tmpdir".  I
see that run-debuginfod-fd-prefetch-caches.sh has a workaround for this
which I'll copy.

Thanks,
Omar
