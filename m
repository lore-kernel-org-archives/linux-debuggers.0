Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C277E1BF38
	for <linux-debuggers@vger.kernel.org>; Wed, 24 Jul 2024 22:48:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721861329; cv=none; b=o6CCHadMsHdOxryQsb80J2MJtLZm/qVkHx/4uwc5hN6e+aGOzCCQvirMLxtx9n1ujdbiTNXn9a0SoCpONtE90ZaoFZ1DXaYOV11ekh0a6cAdiIVoJvqf2mPL24bD0Gd+T0gzcQTGC5l54GEaUqeLtMuZOBinTAcEEuFV6Y1/4OU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721861329; c=relaxed/simple;
	bh=E3AqdK8A0tZ4AN5v5rACkumIM/my9an/nvy7h7niaOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Cs2gS9a6ESWnDUrjQ+Dt41L+GqY2vyRc5HZjXaRJVVGLrsv40Z3z9DDSf/cuTA68unWR4g82T8bN7zeefj0TFW0pNUogvMgqhttpFPkml10gV2xKPB/fQu+7MLxRTDPS0jD1s2WfpqIEdoEXRLyotLTdc6BmkEdPPauWJ4hvCxk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=gVvVTfKE; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="gVvVTfKE"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-7a130ae7126so248050a12.0
        for <linux-debuggers@vger.kernel.org>; Wed, 24 Jul 2024 15:48:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721861327; x=1722466127; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oYI8rG4goFthFFongefRYA8QVwLhPCwF/KRNsBOsMCY=;
        b=gVvVTfKEaDJQwBatPgoEfrNxlpVF3vQvsyaQA+g4pqidWSTe3oYtCINQCZtFEGP1qZ
         TcR+cQTl9QBC7GQP6kzPL9MQdYkfisYLjuZAazDFblGwfdlOgwlM+HFUJiOAArkGa9Ub
         SZiO2gSOSFitWI6kQOMoXhim44jdjFa47QcdGTWARzVMVKwI1/5NGhiyK1xb4XWqyJ7A
         o+s9BbXUkYXOdXlJHwcQfzNOzSxRkgbdSLAlRjaTYvjhZEu5DZUtJnNybI/F+unZHquw
         e8k099Aldol/sIq18PS6qV68JvGooNyI5kRmQ0Z3U0PINLr6gi3m3RAWwTkbPU/9uZk9
         bqng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721861327; x=1722466127;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=oYI8rG4goFthFFongefRYA8QVwLhPCwF/KRNsBOsMCY=;
        b=u5FsM0K/DxCZQHn97aG8uuBsWrRktzIKEs33KnMOCOjJALBzmaCLUvbizM3JXbzDI8
         LhVHgMut2ON+Wbe9uiCzImx8wn7NbzS5hAZONoT0R5n6Ek69DbCZXkM1weyIA+dN4vbH
         xs6Nc3F+BUjt3DNh0IWTJZDf6CBb81pl5fLCSWaOCWrRCwjBcBez3/koOxUbvXK3F/b4
         bbeUnjRnG21jVqPbdCDdM7J8fopvcrAwm145SM5oWzTx1Tr2fiN9tjA9nihvjPbiWIHS
         DSbHWfWgp9QZvoycWJsChXRqW54EAzH/G7kql6fENn4CniVXoPqq0vTQ1SoYwtnQ0kcs
         wznw==
X-Forwarded-Encrypted: i=1; AJvYcCVK4sZ/zKJi9PnEoC3XBqyRF94knzfhKKJ8VmDBN37lOOsXFr88UbYVJmzuu6HXDSz84fe87gRzH3xcNPFXr57nAyAN4PgZzMwB05tplb0K
X-Gm-Message-State: AOJu0YzVLx8tkYdsi5JYwcNr1KcEh6IH145zYrqsfG6VMs63lLUbU5WX
	ZTWbI4RBaF400UszJDgOJV5HSXzyi5VQoGO7GpKmeQbk9TXNG+cOM+NErWJ5ubz74s0Ilq9KQLi
	V
X-Google-Smtp-Source: AGHT+IFYsyn3EG9fX3zC/u0btMd2fYXJx0HhgfFtCvV+g6relMzRKgPSOhqBD5UWHF96/6pINdZrKw==
X-Received: by 2002:a05:6a20:72a0:b0:1be:c4f9:ddd3 with SMTP id adf61e73a8af0-1c472860ac4mr1886010637.24.1721861326955;
        Wed, 24 Jul 2024 15:48:46 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:500::7:2e16])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70ead72ba2csm79536b3a.93.2024.07.24.15.48.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 15:48:46 -0700 (PDT)
Date: Wed, 24 Jul 2024 15:48:44 -0700
From: Omar Sandoval <osandov@osandov.com>
To: Aaron Merey <amerey@redhat.com>
Cc: elfutils-devel@sourceware.org, "Frank Ch . Eigler" <fche@redhat.com>,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v5 0/7] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <ZqGEzIDwoCiI3t6C@telecaster.dhcp.thefacebook.com>
References: <cover.1721773977.git.osandov@fb.com>
 <CAJDtP-SRdXuBkGaswrNXhyb5HhOWE5Fty2WBJJdmhTSfOpFhEQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJDtP-SRdXuBkGaswrNXhyb5HhOWE5Fty2WBJJdmhTSfOpFhEQ@mail.gmail.com>

On Wed, Jul 24, 2024 at 06:20:21PM -0400, Aaron Merey wrote:
> On Tue, Jul 23, 2024 at 6:40 PM Omar Sandoval <osandov@osandov.com> wrote:
> >
> > From: Omar Sandoval <osandov@fb.com>
> >
> > This is v4 of my patch series optimizing debuginfod for kernel
> > debuginfo.  v1 is here [1], v2 is here [2], v3 is here [3], v4 is here
> > [4].  The only change from v4 in this version is adding --fdcache-mbs
> > and --fdcache-mintmp to the new test to fix some sporadic test failures.
> > Hopefully this version finally gets a clean test run.
> 
> Thanks Omar. I've gone ahead and merged these patches.

Thanks so much!

Omar
