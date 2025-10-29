Received: from glass.ash.relay.mailchannels.net (glass.ash.relay.mailchannels.net [23.83.222.70])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6939525A65B
	for <linux-debuggers@vger.kernel.org>; Wed, 29 Oct 2025 20:04:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.222.70
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768269; cv=pass; b=LIK9Meu+qiUoXtIKmfuptBgE4r/lHo308N9QDP1my1QjtYis0KtbzmLctA3t5Sg+nbQxA3B+UMu399zfaKPwmrDuQdYjNC9fE2wXbKiVW2LRKew7UvFUotkJ3bTln5+46i+PcEIHx4/65SQclbZMbipTd4W8dKhk2B9Qtl88EII=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768269; c=relaxed/simple;
	bh=4Q4fJl62+hUz2YF5h1jIuBuskP2B50pHLYfxcpA+hPo=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=tJlacIxZKN009ER1IWXPnoWJy1zosCaaZgs74Tpcg/pJFzI8PGgfnPCAJXFlqGokASO1gk+QrENAxoeAlSErX3HoFcQ3eQyPqov2YhRqFSqqL4GxrkvTZ3W69eMdaaTtFJbj0Fd2neFvSjCyAXHC0Qb+y/ZolMI07ygYI0Jyu8w=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=GsLDk9BX; arc=pass smtp.client-ip=23.83.222.70
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="GsLDk9BX"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 16BE780181C;
	Wed, 29 Oct 2025 19:56:32 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (trex-green-4.trex.outbound.svc.cluster.local [100.123.213.201])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 155518018F0;
	Wed, 29 Oct 2025 19:56:29 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761767791; a=rsa-sha256;
	cv=none;
	b=hsSyeLyAZUaUqvhEKqGttZ7Um/HsYAE4yqF969AJkZqanc7BToc8amJ1MOkOYP3XNuyeRi
	rxFCtwMpVnFvk6S1tB1igzfqObrE7FUV+ocmnVTNzjSTY/RMw+rK1+gr52U3SZhdSYK4nO
	ZPMu9HC7lIBGoiV+9vrKHLICLAMaajYr2lP/OgKFnLFiqP4r7yDtFaFvcd37ZQbK4WdmSl
	TMmEUuzSKwtpMLBdN3VYBy7/WAMUgHWIkS4pvxXf3Yzcx6VLhwGGOIEoc4yUtSsbu0co8Z
	DXFjjGRVI1kcu+gHepEd7vnHTfFOMdJsF7q/1ueTS0ZakdBwebujs24Y6OS3ng==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761767791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=iOVpfpUU/b66Q7BqV2Y7FdOoApZw5OhJbALf+kfwupU=;
	b=W+12k5+UkM8ggnAhjEtIiEuFX2sUJRlzMOs/lalnz4dwulYdJblDUKuAlV7FZk9f54vPCw
	2LXsqlzKsg9UpnCia+wS1JuxmOBpf/K6Fh3qLGLsWe46Y/rDU3JmfO78rqVGjmyqaSUNHg
	8hfNRLbM8P8y1CloCbq3lltiGoZvFSxvagq5I0Pe1hc/pCzLel7RXmbTmdm1OMKh4OuZoF
	JKLZ3jbISpulcR9/ZhGXcqoe8dlBPDjqfO9WsjLvBfXdxQId586UAmoxUBj40OOViWiihv
	pCD+PB8DbjJ7/QPlaptRsOPdxVloQpbxU9XxBySWS7vctd65TvAwDmQ2IFHcXA==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-gc7jm;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Bottle-Hook: 46cbbf2f0f33f695_1761767791681_4186826510
X-MC-Loop-Signature: 1761767791680:2911721417
X-MC-Ingress-Time: 1761767791680
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.213.201 (trex/7.1.3);
	Wed, 29 Oct 2025 19:56:31 +0000
Received: from fedora.tail0cc0bf.ts.net (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cxdKk2Nyzz1yHN;
	Wed, 29 Oct 2025 19:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761767788;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=iOVpfpUU/b66Q7BqV2Y7FdOoApZw5OhJbALf+kfwupU=;
	b=GsLDk9BXD0DAIKMCyZAXDIPKc5byJHUhByzbQMTeB4/lL/ysOOs31jMNDCT1YJeVfdTBww
	tFbKodL5ZOA1ixUNBBqkBqnN2OMnugNBJD/Msd4YbE9uUsS4Shbc+/ViRPR9ha7BifoRZx
	HOZ590hshoEErbbyDtQsW6TyyP0dufSALLV9JrBIWAv2PEvfqWV9iAzcerVlk1VQa90YoU
	H8ZpG0W+7gf6CNG6rVN5entYy5FQhuJtt1c4Td8v4JlFVQrjgMMuwo7FyioxVHFND9QPXD
	4T9TJrtD3hv20CSNuvhC9mFQB7Xg7T4nrppSWw69xbdZGs6z8DFF0DJXiFrOlA==
From: Israel Batista <linux@israelbatista.dev.br>
To: david@redhat.com,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: osandov@osandov.com,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v2 0/3] mm: Convert memory block states (MEM_*) macros to
Message-ID: <20251029195617.2210700-1-linux@israelbatista.dev.br>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 29 Oct 2025 19:56:26 +0000 (UTC)
X-CM-Envelope: MS4xfNxB7is5iVJ4cDdISjM3VWYEsNwLgsLtk8I0VrOBFCLj1TyKUdfKYGYLaaQHqti+vLQksoTwYQrvC3kd/xW9BA8anZxFlE4hQLQbfeoQ+EAnxbJNqmlj FObSoFjqidIq+I4o1ziwqxLqSUb1G/V33dDH4YhIYK9Dnzx+RpQ8R4lgcdBkptqz/Vj4f1QKFai7fyW1kGv0Nqnr+474Plje5y0YrAHVt7+NL670+u3Kn+ig bCsLRc8CZVKO567CJFpAMyGzILjRPLf4D5FV1tU313RgypcshLnvLcZKRJy/G3/ZdlIQ0hjYU8R0zPNebdeQK/CemEOJtoodEr3sKf9c7QA52AILpx828xym 3wF9JNv98F6DVam4Qyl0YB8rnObjXpmz7SNdtT+3PairXzja18b7HJ+ed7R4hv3qmh9ejS+KqlBHBUrpxXMUy9j/sQ7Vlq2XUaHoeq/vqjvhdNd/vLI=
X-CM-Analysis: v=2.4 cv=Lflu6Sfi c=1 sm=1 tr=0 ts=6902716b a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=VwQbUJbxAAAA:8 a=GX0AQbHyn9vrm7BpF5cA:9 a=TWtOS45hTxhqQf3p7L_t:22
X-AuthUser: contato@israelbatista.dev.br

The MEM_* constants indicating the state of a memory block are
currently defined as macros, meaning their definitions will be omitted
from the debuginfo on most kernel builds. This makes it harder for
debuggers to correctly map the block state at runtime, which can be
quite useful when analysing errors related to memory hot plugging and
unplugging with tools such as drgn.

Converting the constants to an enum would ensure the correct information
is emitted by the compiler and available for the debugger, without needing
to hard-code them into the debugger and track their changes.

This patch series aims to replace the current macros with a newly
created enum named memory_block_state, while also taking advantage of
the compile time guarantees that we get when using enums.

The first patch does the conversion of the macros to an enum, while the
2nd and 3rd patches use this enum to clean up some type declarations and
make sure that only valid values are used.

---

Link: https://lore.kernel.org/linux-mm/20251026162156.12141-1-linux@israelbatista.dev.br/ [v1]

v1 -> v2
- Rename the enum to make it more descriptive.
- Let the enum auto-generate the values, as the (1<<X) pattern could be
  misleading and they're not exposed to userspace.
- Change the type signature from unsigned long to enum memory_block_state
  where suitable.

Thanks to everyone who took their time to review the first version.

This patch series applies to commit: f30d294530d9 (mm-new)

Israel Batista (3):
  mm: convert memory block states (MEM_*) macros to enum
  mm: change type of state in struct memory_block
  mm: change type of parameter for memory_notify

 drivers/base/memory.c  |  6 +++---
 include/linux/memory.h | 28 +++++++++++++++-------------
 2 files changed, 18 insertions(+), 16 deletions(-)

-- 
2.51.0

