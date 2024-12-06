Received: from ms.lwn.net (ms.lwn.net [45.79.88.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA6D5206281;
	Fri,  6 Dec 2024 16:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=45.79.88.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733503113; cv=none; b=dmEMF1sx55UeLxC9WYhIz9Xj34gPAVv2g1B/Kx6gtkCTj6PpDupLinfXQR+DesaXRdxP9cvA44NdilRN5hM7esNdaNKrFpO+23Cq6OrTSCrTomkcihgU5IJJXZ+niMAzijF8cHB9C7LSfavml/dfUqWlFqII4BtD8s/g6gv9sVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733503113; c=relaxed/simple;
	bh=44RstDLIBgZc6YUco4PvY/CItRXWaJSKwObpJmFLMjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=bbKqJL78yJ/NM8I4WAsCSd0El58Co+bPme9oGxRS+oSEaasuzZJ8QfYkJ5a+8WUngFXryNzkxjJURJDp2GnN2dZqm3mRyjjnVckLRNL0MGIMSPXiwxhhf3refvIqkfGYN+Oj0W/XsTnIhVhnxiqFT795Ok4aKnskYmiHhaE9Cew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net; spf=pass smtp.mailfrom=lwn.net; dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b=NncN5IaR; arc=none smtp.client-ip=45.79.88.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lwn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lwn.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=lwn.net header.i=@lwn.net header.b="NncN5IaR"
DKIM-Filter: OpenDKIM Filter v2.11.0 ms.lwn.net E90EC403E1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lwn.net; s=20201203;
	t=1733503111; bh=44RstDLIBgZc6YUco4PvY/CItRXWaJSKwObpJmFLMjM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=NncN5IaRkCZI6HOA/CKM7MXSNWYSieCyA+mKZJTEbvJf6c8UE9O4HULgoQe3PRCnv
	 6GV9VQTGwXgtaUJRd37Dqiu+GR7n9xDriZ+kBvYCIgFtjji3n0/7KGAy1PmFDTYvvc
	 5oiBG6eT3O18Ka8O+98uZrg8DZSW48ZpkP9FVxUYe1guImWz4VjuuRyXePQP0oxXrh
	 YGloU5YuY7+iuRjX3W0QqV1Kq6lwWIhHouiOvt4xh0f4tjE4Zo6dj8bcDiQe+6xY7L
	 IrX+oWKvFxEozTPbjuOdpHtdjG2o+/qKdL3fllIVHRNumMUZJ4WOVQ4bg8vyYS3h8n
	 9xoxEIoZCZVXw==
Received: from localhost (unknown [IPv6:2601:280:5e00:625::1fe])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by ms.lwn.net (Postfix) with ESMTPSA id E90EC403E1;
	Fri,  6 Dec 2024 16:38:30 +0000 (UTC)
From: Jonathan Corbet <corbet@lwn.net>
To: Randy Dunlap <rdunlap@infradead.org>, linux-doc@vger.kernel.org
Cc: Randy Dunlap <rdunlap@infradead.org>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, workflows@vger.kernel.org, Jason Wessel
 <jason.wessel@windriver.com>, Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, linux-debuggers@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to
 process/debugging/
In-Reply-To: <20241204221720.66146-1-rdunlap@infradead.org>
References: <20241204221720.66146-1-rdunlap@infradead.org>
Date: Fri, 06 Dec 2024 09:38:30 -0700
Message-ID: <87h67gu5q1.fsf@trenco.lwn.net>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

Randy Dunlap <rdunlap@infradead.org> writes:

> Move gdb and kgdb debugging documentation to the dedicated
> debugging directory (Documentation/process/debugging/).
> Adjust the index.rst files to follow the file movement.
> Update location of kgdb.rst in MAINTAINERS file.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>

So ... since these are indeed development tools, I wonder if we should
leave a reference behind in case people are looking for them there?

jon
