Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 309F517C61
	for <linux-debuggers@vger.kernel.org>; Thu, 12 Sep 2024 00:54:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726102463; cv=none; b=J3VafxvwYdPXvkOnMaW11MZHcPDf5Hp69/OajppkNdHZQJ5R/hRAgzZmlWRv003Vnim2A7V7v4X5LXBCtAhKIy5SCO2Tf3692SVPgWDxLQmnjTbh+fAokn/fNixpECkUHoduQ9HTyUx9Uu2jxGVvr9yy4/Bmw+0yKrFUsg/RdaM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726102463; c=relaxed/simple;
	bh=G7GLqn0KRULSA/DzBkbf6bmbo4/NSkTPF7BwhLKPfZc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kd2mjeb0vWO2na7LcrGgD+pcGLbsLsd8tDM3NnvltrUM9aRdnqioJg1PRSplWZ3UhKGnOq9KaeFMVWsTVeCZaUfdCysCZ7tIurOFaEt7i9wVzR5JIrY97vEDx57KZHndv7tMEaoCUcZm2GDzAV9jn9QpfuKPEulMRB+JD3+GfIk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=McZcCbfg; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="McZcCbfg"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1726102459;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=b68u0e0/6l3aTcwgwyF4H+GXM1gl+kB/qAh1zau1jhw=;
	b=McZcCbfg5Nd7nNng1NNW0LxHndGbch2wfLdAdMGKRwvy9vf6MfmJrYr+val5XRcc2Vr8sR
	+On6Fd512aFCXKhvpNgNbsizlShd4CVJMxgRYwpy11dd94ICiZYY5EmX4hnrk9YOy2hBl4
	2pH/eb0rwcYSb2QnmQjhd/R2psIKwTk=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-18-xjkabQI1MU-6C18y-nGYWQ-1; Wed,
 11 Sep 2024 20:54:15 -0400
X-MC-Unique: xjkabQI1MU-6C18y-nGYWQ-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 471501955F68;
	Thu, 12 Sep 2024 00:54:12 +0000 (UTC)
Received: from localhost (unknown [10.72.112.58])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DF62F19560A3;
	Thu, 12 Sep 2024 00:54:07 +0000 (UTC)
Date: Thu, 12 Sep 2024 08:54:02 +0800
From: Baoquan He <bhe@redhat.com>
To: "Guilherme G. Piccoli" <gpiccoli@igalia.com>
Cc: kexec@lists.infradead.org, linux-doc@vger.kernel.org, vgoyal@redhat.com,
	dyoung@redhat.com, corbet@lwn.net, linux-kernel@vger.kernel.org,
	linux-debuggers@vger.kernel.org, stephen.s.brennan@oracle.com,
	kernel@gpiccoli.net, kernel-dev@igalia.com
Subject: Re: [PATCH V2] Documentation: Improve crash_kexec_post_notifiers
 description
Message-ID: <ZuI7qkE/6EVEGajs@MiWiFi-R3L-srv>
References: <20240830182219.485065-1-gpiccoli@igalia.com>
 <ZtUrX4n+HPYhyQ9z@MiWiFi-R3L-srv>
 <d954da78-87cf-d7d9-a620-0c2fae5dd242@igalia.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d954da78-87cf-d7d9-a620-0c2fae5dd242@igalia.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17

On 09/11/24 at 05:09pm, Guilherme G. Piccoli wrote:
> On 02/09/2024 05:05, Baoquan He wrote:
> > On 08/30/24 at 03:21pm, Guilherme G. Piccoli wrote:
> >> Be more clear about the downsides, the upsides (yes, there are some!)
> >> and about code that unconditionally sets that.
> >>
> >> Reviewed-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> >> Signed-off-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
> >>
> >> ---
> >>
> >> V2: Some wording improvements from Stephen, thanks!
> >> Also added his review tag.
> >>
> >> V1 link: https://lore.kernel.org/r/20240830140401.458542-1-gpiccoli@igalia.com/
> >>
> >>
> >>  Documentation/admin-guide/kernel-parameters.txt | 16 ++++++++++------
> >>  1 file changed, 10 insertions(+), 6 deletions(-)
> >>
> >> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> >> index efc52ddc6864..351730108c58 100644
> >> --- a/Documentation/admin-guide/kernel-parameters.txt
> >> +++ b/Documentation/admin-guide/kernel-parameters.txt
> >> @@ -913,12 +913,16 @@
> >>  			the parameter has no effect.
> >>  
> >>  	crash_kexec_post_notifiers
> >> -			Run kdump after running panic-notifiers and dumping
> >> -			kmsg. This only for the users who doubt kdump always
> >> -			succeeds in any situation.
> >> -			Note that this also increases risks of kdump failure,
> >> -			because some panic notifiers can make the crashed
> >> -			kernel more unstable.
> >> +			Only jump to kdump kernel after running the panic
> >> +			notifiers and dumping kmsg. This option increases the
> >> +			risks of a kdump failure, since some panic notifiers
> >> +			can make the crashed kernel more unstable. In the
> >> +			configurations where kdump may not be reliable,
> >> +			running the panic notifiers can allow collecting more
> >> +			data on dmesg, like stack traces from other CPUS or
> >> +			extra data dumped by panic_print. Notice that some
> >> +			code enables this option unconditionally, like
> >> +			Hyper-V, PowerPC (fadump) and AMD SEV.
> >                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> > I know Hyper-V enable panic-notifiers by default, but don't remember how
> > PowerPC and AMD SEC behave in this aspect. While at it, can you add a
> > little more words to state them in log so that people can learn it?
> > Thanks.
> > 
> Hi Baoquan, tnx for the suggestion! You mean mention that in the commit
> message? If so, I can certainly do - will sent a new version soon(tm)
> and include it =)

You are right, thanks for the effort.

