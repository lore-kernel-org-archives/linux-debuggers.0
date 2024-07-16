Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B306625779
	for <linux-debuggers@vger.kernel.org>; Tue, 16 Jul 2024 22:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721168244; cv=none; b=BbLzBvif+xgJIGpLxBSocEbJVXcgZko+IZADwsBef6rbXQgC3N/VWQ9hSHcVF1F7pyLkY6Z7MDB8HPFw1xoFsfY/kI92uXHSCqq+4mFHvSTbq2piA4aj5mxcVlKCiBrb8GsjcxgjQQ/z9NgTACGcxBpedfWA6HUtn8v5wEHaZ68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721168244; c=relaxed/simple;
	bh=ej5/NzmwGFr1DPOvHpX3bD0dOiNe5latxHjIw8ZAmlk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cRwJ3oK/dF+zV13krRzQbUJ6VTs+eLG6cSRONGotqKiC/mUrgEz5BB6pHAQxJs9yguvH/ERrB1xMRXgElVDhutAbD3jcotqAwq8Ign8+TVPKlX/ktNjmBNxvfa2Eu58HWJO4EYnBcaaK70YIUFnA9L412/avQUnS9T7bdDCg6xk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=dN1ZMYtM; arc=none smtp.client-ip=209.85.167.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="dN1ZMYtM"
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3d6301e7279so3906823b6e.3
        for <linux-debuggers@vger.kernel.org>; Tue, 16 Jul 2024 15:17:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721168242; x=1721773042; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=JCWe9IjKTzlskpFhoDECLZvwkzWCRNvFSptTuVFxj2s=;
        b=dN1ZMYtM1aRxqjOo9mQ1AcAEAsKVQDjdna5bHA94cQOEvqSU/HGXBVi3GeLAFxfMO0
         4GxJYsPlPLwz3pmJMunl+F7ib8t81xfxPxtEGqzSqg6RyqOFA5WypXPTGwo849TEYjtr
         georV29VJVFUbFuaILtBiR2fJu3pMlikrBkAtkkKaP9T5pFr+Hc4b10QHvmCml8iW0P6
         qmPp3NvgNhUgwQFuxtgYs0DUpeZd+OTX4TvsjrauuBa4rAml6HCueEExEyE7xmqYFQyA
         WkK+TYBa0p3ENYTorc2UyfdtAKSirnUFfXDCEhWn/xuMxXPKc8ZPKsUJNfgrdk8y7rsI
         yhhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721168242; x=1721773042;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JCWe9IjKTzlskpFhoDECLZvwkzWCRNvFSptTuVFxj2s=;
        b=qB81OnPDajR1V+VWBMF/x5yn6lFe2fk1rgIJpQVlyY0dvP7uan6IKe+nJAoOkm8okQ
         10553BdFn+mxZ1mxo/9NAKHD2R8jOXz49EC87sPG9+jdyZK101FIUHnj+l0BtAHp6v/f
         C8gSmvbGZnFk0CkTB0j1mCbYnr1Mb+iHd3DQUJA38IMWKM0hMVthjJ7hfIs8sO+Q3igA
         VS6hnemfOYxyc2iNz5eVgL7YPSOJkXVfS4FLh/pcOlH7RMaLqnacBd7wHp+QdM95bsJW
         KtOA1fx8TblKSsdlQ/BVqJdsufZwn8AYeKBxY1OkSHHiR3EnvyBjjTaYMuInFQyFliTx
         dC/w==
X-Forwarded-Encrypted: i=1; AJvYcCUi1D+pd77OSQ4GVVUIhLqVpGhGF1htah5daZHn1UX+yYB0R5jur5a4h7X2OjTkYY8H3Xx//QOiAxEB1U9a3yXyIjqiKfTbrCgGGSGyaICx
X-Gm-Message-State: AOJu0YyBHKfL/gZ+8/JJBR1UrLb+RsrZLY4KdrnIsydUbHJzOVOBQmKu
	V7QTDlippteOlx94PAC0OssM2sJqz4x0bs5P6ZN+D+qUc6TB3ZzmfEeMbxUHl2S586I8Cfwk8Dq
	i
X-Google-Smtp-Source: AGHT+IHHVPUVDRriEQ7UtnTGfhu+wvnUL3pVifIFAu8YIPgQotsyD2Yd3m3wbGxZfRg4PPxJ8k5eDQ==
X-Received: by 2002:a05:6870:158f:b0:260:71c4:f33a with SMTP id 586e51a60fabf-260bdf87978mr2918598fac.39.1721168241735;
        Tue, 16 Jul 2024 15:17:21 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:400::5:fb6e])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70b7eca7545sm6856430b3a.153.2024.07.16.15.17.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jul 2024 15:17:21 -0700 (PDT)
Date: Tue, 16 Jul 2024 15:17:19 -0700
From: Omar Sandoval <osandov@osandov.com>
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: elfutils-devel@sourceware.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2 0/5] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <Zpbxb5aVu3yIfrZ4@telecaster.dhcp.thefacebook.com>
References: <cover.1721037200.git.osandov@fb.com>
 <20240716201601.GB7214@redhat.com>
 <20240716221516.GD7214@redhat.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240716221516.GD7214@redhat.com>

On Tue, Jul 16, 2024 at 06:15:16PM -0400, Frank Ch. Eigler wrote:
> Hi -
> 
> > [...] I'll send it through the testsuite
> > trybots here.  [...]
> 
> There was some success and there was some failure. :-)
> 
> all 11 runs:
> 
> https://builder.sourceware.org/testruns/?commitishes=&has_expfile_glob=&has_trsfile_glob=&has_keyvalue_k=testrun.git_describe&has_keyvalue_op=glob&has_keyvalue_v=*&has_keyvalue2_k=source.gitbranch&has_keyvalue2_op=glob&has_keyvalue2_v=*users%2Ffche%2Ftry-xz*&order_by=testrun.authored.time&order=desc
> 
> in a grid view:
> 
> https://builder.sourceware.org/r_grid_testcase/?trid=9b0340db2a771c5b6483132afd75139699c4f8e5&toplevel=True&vertical=source.gitdescribe&v_limit=5&horizontal=uname-m&h_limit=10&opt_keyword_key=source.gitbranch&opt_keyword_value=*fche%2Ftry-xz*
> 
> e.g. failure:
> 
> https://builder.sourceware.org/testrun/2550ae9a06868d7e7f4c62176960c04f4534d8d0?filename=tests%2Frun-debuginfod-extraction-passive.sh.log#line657

Yup, that was a goof, and I don't know why I missed it on my local test
run.  This is the fix:

diff --git a/debuginfod/debuginfod.cxx b/debuginfod/debuginfod.cxx
index 6fb4627c..08114f2e 100644
--- a/debuginfod/debuginfod.cxx
+++ b/debuginfod/debuginfod.cxx
@@ -2737,8 +2737,9 @@ handle_buildid_r_match (bool internal_req_p,
     }
 
   // no match ... look for a seekable entry
-  bool populate_seekable = true;
-  unique_ptr<sqlite_ps> pp (new sqlite_ps (db, "rpm-seekable-query",
+  bool populate_seekable = ! passive_p;
+  unique_ptr<sqlite_ps> pp (new sqlite_ps (internal_req_p ? db : dbq,
+                                           "rpm-seekable-query",
                                            "select type, size, offset, mtime from " BUILDIDS "_r_seekable "
                                            "where file = ? and content = ?"));
   rc = pp->reset().bind(1, b_id0).bind(2, b_id1).step();


I'll fold that in and include it in the next version.
