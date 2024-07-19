Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96D6E2746B
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 18:04:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721412260; cv=none; b=r20naAO2fYnHs22jTn8FnlOaUk9/WTU40yPG0e7LPSxbbcPD2berTWDY8U7gHnMmOBh2WOYLhOSt+tj0NIOmwlF7Qx3AP9FLfDzygphi6dXFLca1/7wLIPbOFazI09Ql28Ss61hy33REnA+F1oxrBSqxD0bFTo5CuscjYUVKPls=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721412260; c=relaxed/simple;
	bh=Su/IbI006fHwPiLuMREMA7fj3aKWP9/FS7+13+weZxM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M7Bk96FEKoN48i24cjL7r7+Ufsih4TRZobCEdC6xLVmQtfv988qGhledrEIL0gR4mDuGNFdCQmFQe3mQ3Z1NZQYqRxpiya722kNtP21Zln3+drdI8En/+cz7b+n9vonubfXPlQ1tsxgitW+dtj3Boa+d0A80vm34ZVHs1/Kmq2Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=lBakQwzh; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="lBakQwzh"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1fd65aaac27so5601785ad.1
        for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 11:04:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721412258; x=1722017058; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XUJ9YnvAzO6RrS5j0TM7mrmBUrdjvkGL51lyymIOF6s=;
        b=lBakQwzhjoCOnppoJzAAL9/3hXHqhfMvnp53X2Rsu9+ygZHrVZqrxeWDLEIFdJcsQE
         b84ROjRZSYh165KyCYkMpyamdjcR3f94IhCy6pa4RLf9JY8G9toi2T+23QUtnnxQrU/C
         u8YcYl2HU6/oE7LIr6wPmBbTYIx893jhRLykMWjl7wZjmuhRS+vhqCyJ1zqhT4pic6nx
         brqH9zQBnHOKGVwokUoyJskEerudRXZCH8e6Gf6bzm18TvHuJNDODdL0CZCuabYTbuXN
         1D/9l7wqIgsIBFl6qRoO1ftqGiltBeaEtvXDKA/7cSXqZJNarAhZwXRL/ECsZjy82Cuk
         a0fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721412258; x=1722017058;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XUJ9YnvAzO6RrS5j0TM7mrmBUrdjvkGL51lyymIOF6s=;
        b=QEapxE710Ani22kY6/sJUk3X3yjH6cfdXOE5YzfZuGZMtJBqXwvmfwAEd3DSjbqdGP
         QErAFyrUBcIKNWbcGP43J3LAP9ie49uqu6T+b+RzM4LDBZn+wTJWE0Vg4NVQFo0sVo79
         q31jlzpnyj/D60y/ArEzyl6g8jGdmmsyJYmv5i+WH85+Nv/NjA6aZIH2jg8zbqqNhBej
         qZpspTodZpFpkrLg2I5ypumrO3gLB5wX+dxAHB9EwJ2s3xINq+7TsreyoZFC+jCGb71u
         I5VpYnOWso8qAT0GenPT72n2BPQj0fpvQs9dwfoOcGqpGS3ugMjXduY1WbSv3p5a8ZaR
         6YHw==
X-Forwarded-Encrypted: i=1; AJvYcCWfSdFFGbnbeA4TIRBh4DBhv8sOZDiF2yirJ2M0WazdtDQqA8W3f1xDtVTj8lmVCsyKJBZic2Jq62j5sutDoDOXjJHUySnKsV1ET+OWGtS4
X-Gm-Message-State: AOJu0YyKd3aszlltmy0r1EVBbc74rX3PXDp5pQLdIdbFwCab8Czx7Xe2
	3VlEs6N/Xr3TgFZ+tJc7zvFwOZWxIHYUDEZPKHMKXx2o/wpGDGdAqDaE538mhfU=
X-Google-Smtp-Source: AGHT+IENAIWuwBfYF3xe41a5JQUjb3TrN5Fe+yEttjen+ePDRv8UAinaPq9zHqaVINr3d67daV6eUw==
X-Received: by 2002:a17:902:d4c7:b0:1f9:a242:c3a9 with SMTP id d9443c01a7336-1fc5b60a901mr87487775ad.24.1721412257687;
        Fri, 19 Jul 2024 11:04:17 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:500::7:5d79])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f46a516sm7585895ad.253.2024.07.19.11.04.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 11:04:17 -0700 (PDT)
Date: Fri, 19 Jul 2024 11:04:16 -0700
From: Omar Sandoval <osandov@osandov.com>
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: elfutils-devel@sourceware.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v3 0/7] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <ZpqqoB3bNbVTx9DZ@telecaster.dhcp.thefacebook.com>
References: <cover.1721377314.git.osandov@fb.com>
 <20240719173448.GB27443@redhat.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240719173448.GB27443@redhat.com>

On Fri, Jul 19, 2024 at 01:34:48PM -0400, Frank Ch. Eigler wrote:
> Hi -
> 
> > This is v3 of my patch series optimizing debuginfod for kernel
> > debuginfo.  v1 is here [7], v2 is here [8].  This version fixes a couple
> > of minor bugs and adds test cases. [...]
> 
> Thanks, LGTM, running through try-buildbots to make sure.

Sorry about the distcheck failures, looks like I forgot to add the new
test files to EXTRA_DIST.  I'll be sure to run distcheck next time.

I'll send v4 shortly.

Thanks,
Omar
