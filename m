Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 382071A01D7
	for <linux-debuggers@vger.kernel.org>; Tue, 16 Jul 2024 20:16:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721160972; cv=none; b=XNOV/iDvd51fLq6qeCnGJMTLkAV32xCeHPf6JJ5zv2nIARP8l4V2afJFuI+kSJoXoSjGgumQ9OYQ4d70x0XqPBhqNF4zJGFLCMBq6QDdPcMsZtjLceWritRzt2tWfdvdH65go9aES8Cl8FpAwBplMkAChswFYpTQFhz8Adb1s8Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721160972; c=relaxed/simple;
	bh=oDCJmvqwT+I+DlgR9mz0ODVkHjPONEqrxtX4lgMKQ8s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 In-Reply-To:Content-Type:Content-Disposition; b=GV0cz4QcqPa2ImAP+ZR5f2oKhZfJuhNzrgmTRAvTri7rk3k619qReuxFxFPPSqgv7oFYg3TLEAyUfXEeteLtiQ4A5Erw5Xvcc93FDLqqY9ClK+RH64wTqe6BiXEKNM63YehVA0XvhyT0Cp200u8eWR5Vyy4RIUPjmjwftvpa8i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ClVsEAFL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ClVsEAFL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721160968;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=t1hwHmbGFOTY4dqwG6pUPbto//tEiY42hvdusK+JNsU=;
	b=ClVsEAFLtZjkIHHDPLs8sH37akGYELQ6A7pIbiPA9hTQRYGc3eWHBI7KHfqML4z0E1rQZz
	iVoD4hHu5W2DUluo2iUFhLm1gNgyAS3ivwttP1YrgUtKnykjjhwNmcJKBjzxNYVnV66fRG
	WWmQ6kQV84w4n1IbBADXfmlFFKhET5E=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-512-MJhMcd91Oi6KXHmDqPWkSg-1; Tue,
 16 Jul 2024 16:16:05 -0400
X-MC-Unique: MJhMcd91Oi6KXHmDqPWkSg-1
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 5F0FD1955D4F;
	Tue, 16 Jul 2024 20:16:04 +0000 (UTC)
Received: from redhat.com (unknown [10.22.32.20])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E3E823000183;
	Tue, 16 Jul 2024 20:16:03 +0000 (UTC)
Received: from fche by redhat.com with local (Exim 4.94.2)
	(envelope-from <fche@redhat.com>)
	id 1sToaf-00026i-NU; Tue, 16 Jul 2024 16:16:01 -0400
Date: Tue, 16 Jul 2024 16:16:01 -0400
From: "Frank Ch. Eigler" <fche@redhat.com>
To: Omar Sandoval <osandov@osandov.com>
Cc: elfutils-devel@sourceware.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2 0/5] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
Message-ID: <20240716201601.GB7214@redhat.com>
References: <cover.1721037200.git.osandov@fb.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
In-Reply-To: <cover.1721037200.git.osandov@fb.com>
User-Agent: Mutt/1.12.0 (2019-05-25)
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi -

> This is v2 of my patch series optimizing debuginfod for kernel
> debuginfo.  v1 is here [7].

This generally looks great to me.  I'll send it through the testsuite
trybots here.  But there isn't an xz-y test case yet.  Is there a
smallish seekable-xz rpm file that you have or could make that we
could jam into the elfutils testsuite?  (A prometheus metric counting
seeked-xz attempts/successes would be cool to assist testing and to
monitor it on deployed servers.)

- FChE

