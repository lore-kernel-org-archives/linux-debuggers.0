Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 97A3313BC12
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jul 2024 17:34:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721410496; cv=none; b=FZqsktliKFDJdzIn95hnGpoxN6E21uigGn0/0kyNitY6gbOoHXXg/07ckTMm5hDze7Xy5CWZbhyb3J31CecF+oj8z/c0YYgQffCbOmSLUrz7ccn5OVSnZYxSldjcMhZVMp6DkIcTZgAh2AgNIW+hkdHDqKLAlVJ6gtyC78IewOk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721410496; c=relaxed/simple;
	bh=OFNfJovw7uOR69NH7RrriWNWCNA4eP8RMSPVTeP80Mk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=R084vBRmav5MddoC473ms9PDJrMsVf0wC0zzPufz45BV94ZVMJ2dfKlzanMdxQN/uNeaS4nwMYacSPtM2sGZPT4YC4a1CQnpDKz3onA7QNfrWQz28a749IwHFBtTPRgu8N6K3cw2guvUOk/fIqM1WveLKUJK/UZKFfoEzoltOd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=aeEpOtC1; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="aeEpOtC1"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721410493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=E0Ie4PgpX7ShNe8SCv4jwUCymEFHViebBC1gfKqdpLE=;
	b=aeEpOtC1DZLSSztTQBtBqgqXrSiL6UxXhsABh1wWKcgHe16UH2xe8IPUDFW75YfCGi/ZfV
	thgtYETfHul5ZNZTJ4wjJJM9hapvrORywR4pjV1obSAa4jGKzvj+v8V+QNZqRgzZ1rsmK3
	DBtokMIA82XAC7rZrM1NVrh7QsEwUbg=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-206-VdEz5xoUODq_L7P-XIAk2w-1; Fri,
 19 Jul 2024 13:34:51 -0400
X-MC-Unique: VdEz5xoUODq_L7P-XIAk2w-1
Received: from mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.15])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id B66B019560A3;
	Fri, 19 Jul 2024 17:34:50 +0000 (UTC)
Received: from redhat.com (unknown [10.22.65.211])
	by mx-prod-int-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5B1291955D47;
	Fri, 19 Jul 2024 17:34:50 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1sUrVI-0007BQ-94; Fri, 19 Jul 2024 13:34:48 -0400
Date: Fri, 19 Jul 2024 13:34:48 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Omar Sandoval <osandov@osandov.com>
Cc: elfutils-devel@sourceware.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v3 0/7] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <20240719173448.GB27443@redhat.com>
References: <cover.1721377314.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1721377314.git.osandov@fb.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.15
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi -

> This is v3 of my patch series optimizing debuginfod for kernel
> debuginfo.  v1 is here [7], v2 is here [8].  This version fixes a couple
> of minor bugs and adds test cases. [...]

Thanks, LGTM, running through try-buildbots to make sure.

- FChE

