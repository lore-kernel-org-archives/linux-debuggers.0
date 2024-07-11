Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08266262BE
	for <linux-debuggers@vger.kernel.org>; Thu, 11 Jul 2024 20:16:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720728994; cv=none; b=Gc2OUpn+TQNCkbiAuYPGxVZ21xQg9DdZBLOAK+Ufj+ZWdNxfrVJZXCE7E6KyLkhj3p6fyVsOqplTmGpDiceAFV8cmd5AjA+ll4vjgUcvz9MAyqm02gKGSQsc3qmo8sp5AGagNlrthhv24gu7J5qh/xAcrIbFivbkBw18ZjYp/Ek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720728994; c=relaxed/simple;
	bh=VsUvBPrFFss9jML3CqU2sXu88rHYrkUISInJFF5Q+lU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=XggA2fsqdBLzeMUwFf70Ef6c2AxeQVfzFWFgNcsH+r7dmM97ohhjGsRLEcxvoBqZT19MUHNNmmuqFm3K8msGtlIzOOn8mbct/F1OwUpI0Z8XSvKYv/nVHrKCIJRlBhq67h0WDcLw4DTmgDASFYfkTMD1iYOtIBd8xRUMJ0cmPbs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hgAtsSr+; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hgAtsSr+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1720728991;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=wHC5tBoI0dzK6GJsua3mAIO9sZ9hkLj6i7M91HJbSms=;
	b=hgAtsSr+cwXSyuIJmAG5EbePhc+l1zlF8Xp1gUyRAzekE6wmcp7Dd2omtnNMWu/Fqyi8oz
	uT77iA9oRAEF+nU6FvX44tDpboXkWdHnsOXCeuS2Z7VEN0dHx6QlAi0r1keWYfhYlcEYjz
	cxgjYRoOUwmprg4xgg0MrEItnL/VUUA=
Received: from mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-303-oyqn9HHZOI2FdUbs8xeaUA-1; Thu,
 11 Jul 2024 16:16:28 -0400
X-MC-Unique: oyqn9HHZOI2FdUbs8xeaUA-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A59ED1935853;
	Thu, 11 Jul 2024 20:16:27 +0000 (UTC)
Received: from redhat.com (unknown [10.22.16.10])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F8D51955F3B;
	Thu, 11 Jul 2024 20:16:27 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1sS0DJ-0002v3-G2; Thu, 11 Jul 2024 16:16:25 -0400
Date: Thu, 11 Jul 2024 16:16:25 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Omar Sandoval <osandov@osandov.com>
Cc: elfutils-devel@sourceware.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH 0/3] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <20240711201625.GD2826@redhat.com>
References: <cover.1720644134.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1720644134.git.osandov@fb.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi, Omar -

Thanks.  I wish this sort of amazing kludge weren't necessary, but
given that it helps, so be it.

I'd like to commend you on the effort needed to match your code up
with the stylistic idiosyncracies of the debuginfod c++ code.  It
looks just like the other code.  My only reservation is the schema
change.  Reindexing some of our large repos takes WEEKS.  Here's a
possible way to avoid that:

- Preserve the current BUILDID schema id and tables as is.

- Add a new table for the intra-archive coordinates.  Think of it like a cache.
  Index it with archive-file-name and content-file-name (source0, source1 IIRC).

- During a fetch out of the archive-file-name, check whether the new
  table has a record for that file.  If yes, cache hit, go through to
  the xz extraction stuff, winner!

- If not, try the is_seekable() check on the archive.  If it is true, we have an
  archive that should be seekable, but we don't have it in the intra-archive cache.
  So take this opportunity to index that archive (only), populate the cache table,
  as the archive is being extracted.  (No need to use the new cache data then, since
  we've just paid the effort of decompressing/reading the whole thing already.)

- Need to confirm that during grooming, a disappeared
  archive-file-name would also drop the corresponding intra-archive
  rows.

- Heck, during grooming or scanning, maybe the tool could preemptively
  do the intra-archive coordinate cache thing if it's not already
  done, just to defeat the latency of doing it on demand.


What do you think?


- FChE

