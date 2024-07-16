Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E812F25779
	for <linux-debuggers@vger.kernel.org>; Tue, 16 Jul 2024 22:15:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721168126; cv=none; b=gIfcSvl22QIU4YbiKIGjPkTPot1zSfFBJAyxa2WgY9s7Qo5MBeJUY8vAJ49E9mPd0MKJW8xHWMQOcUjzOBGf0/713yXoUMXeweTmpR4NrxcDUlz46SZvT0VdklsekbPKN8Y4PmW7Ps8V3VTP7yza7BLXyezaTAfvrlpRUGZyrgY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721168126; c=relaxed/simple;
	bh=mqlXma9dZEcqonGQZwf3dnj9zgaaOR8sCVatl9BPcjQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=Jr4GOpP0g1RtLN+tPSO4ODPvV0M6IDatNbphw6mgIOOEjR7FAV3nd7KZCC4YR45j5JPcRCRzGbtEfSJtCx7dbTwJp+pqIqGirOfvW+SQDlOB+c3rOIXzQYPt3a5s3bH4On+bmvBjGDr75kMOa9cZLtiq9KhQJEfKiTdHMHSrz1Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HF0HzfQj; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HF0HzfQj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721168123;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=5Kfa3g98Ja8UT//UUNuvfae44SlpBtxp9frwBgfiqeo=;
	b=HF0HzfQjOoXu2Z1CGjzsFU8A3LBQriNnnVLoip97ULNMWml9CG8NpIihgrydD0u+ugAj1+
	XzRGUdPzAZ4ca2AD2wSQ5XC8eBJK7EL0HzBSdRSj7G1bo9CAYQ8jFW0nDD7jFtbGKq9zDp
	1wOpZHqG2Y+TiQ8ALEFpJSjOn36kU2w=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-470-6Y5-dR2LOOiXd75gfUoIcA-1; Tue,
 16 Jul 2024 18:15:20 -0400
X-MC-Unique: 6Y5-dR2LOOiXd75gfUoIcA-1
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B66421955F42;
	Tue, 16 Jul 2024 22:15:19 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.20])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4D7E21955F40;
	Tue, 16 Jul 2024 22:15:19 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1sTqS5-0002Eq-32; Tue, 16 Jul 2024 18:15:17 -0400
Date: Tue, 16 Jul 2024 18:15:16 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: "Frank Ch. Eigler" <fche@redhat.com>
Cc: Omar Sandoval <osandov@osandov.com>, elfutils-devel@sourceware.org,
	linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2 0/5] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <20240716221516.GD7214@redhat.com>
References: <cover.1721037200.git.osandov@fb.com>
 <20240716201601.GB7214@redhat.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20240716201601.GB7214@redhat.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi -

> [...] I'll send it through the testsuite
> trybots here.  [...]

There was some success and there was some failure. :-)

all 11 runs:

https://builder.sourceware.org/testruns/?commitishes=&has_expfile_glob=&has_trsfile_glob=&has_keyvalue_k=testrun.git_describe&has_keyvalue_op=glob&has_keyvalue_v=*&has_keyvalue2_k=source.gitbranch&has_keyvalue2_op=glob&has_keyvalue2_v=*users%2Ffche%2Ftry-xz*&order_by=testrun.authored.time&order=desc

in a grid view:

https://builder.sourceware.org/r_grid_testcase/?trid=9b0340db2a771c5b6483132afd75139699c4f8e5&toplevel=True&vertical=source.gitdescribe&v_limit=5&horizontal=uname-m&h_limit=10&opt_keyword_key=source.gitbranch&opt_keyword_value=*fche%2Ftry-xz*

e.g. failure:

https://builder.sourceware.org/testrun/2550ae9a06868d7e7f4c62176960c04f4534d8d0?filename=tests%2Frun-debuginfod-extraction-passive.sh.log#line657

- FChE

