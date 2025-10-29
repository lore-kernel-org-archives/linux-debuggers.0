Received: from serval.cherry.relay.mailchannels.net (serval.cherry.relay.mailchannels.net [23.83.223.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2DF35BDC6
	for <linux-debuggers@vger.kernel.org>; Wed, 29 Oct 2025 19:56:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.223.163
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761767803; cv=pass; b=mxBD/8/mzdMYhAO75Zus2eqPpWoOqdXlDQUfZyfhBgmiCO4HgJKqmVNDXJ/ZREjmfyU/cMpmzCn40sv+pFgo0PvfC5BRFWaIB73vCQ2pFMcHScIhQZa0UqBnfK1foK4fy1AxDPs24nKUq+eXUmtP/OgIXxuWLUglLIthUjvkEcM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761767803; c=relaxed/simple;
	bh=8HtgXg1MmcvU5ciOSCAQ+LKOxpz05zErfrp15RAxCYg=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date; b=JfGums9cbar4N62tSf+dCXDLffXzUAocDzabTLdD1wPrY/vQu3LcwIyiIcsY5PpwMae1QPruALyg1OaWwgFdCVFibOU6jPpLTtVmsWBKIaLvC2EgwQ5EedMl2czCG9ZHBv89U9M16UZF++lhCI2nWnQ8spcwNKx82nuPVPX2esk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=SLyEyZvW; arc=pass smtp.client-ip=23.83.223.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="SLyEyZvW"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 05F78581A89;
	Wed, 29 Oct 2025 19:56:34 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (trex-green-6.trex.outbound.svc.cluster.local [100.120.23.87])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 8A6B0581B1A;
	Wed, 29 Oct 2025 19:56:32 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761767793; a=rsa-sha256;
	cv=none;
	b=MvdKsWQYOMXmJ9KJxpc0G1doQwdCvu9+yDrKpt5IV+09hpyPy3SIZbJ54wBbtQ3NOunmaG
	MZdh7rpLFXbWEm6nwJ3itD9XwlxMt94M/e1RNbZy0uDf2pDg08tHvGP22NsCD5qWz3ou1S
	mF/UXRky/o7Yu5dcJuH1xebP3ZWqJmSBC00J7vIxwSIaGCQWG+3RJkMklATZ3AMn2AoTOq
	fu4CuiTRr0PEuX/HkELc7q7iP2YgcMNT94E6GRY3/0iDMcKrV41Cx/M24e9+X0RJFgi6LX
	kVZSjEnWLhCrSYcTSGpFKu/GN0y78ulD4JrvNQnBpc1xabulfYr2B/aO7egeYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761767793;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=MCV8d8hkCWTgJ3eAolDw1gbKzjB4rwTY7mZr1G7gEsM=;
	b=hnzqrJju1va0dw7TKJyyujXAm6ior4L3IqWpNjFXPgoCMdGBtJe+kYiXKL8oMSxuroZ5d6
	0fCpL040wh/h58rPyADiFxD8Sd3oIz0eb7Yz+77njhufAQJexd6jD0xvTyqkf6hYmmF5yE
	1Bd0iwq/hMTGzGUDTtCnR1LOPioXEd4kVxnKY3eGw74mbujTYgTYwGPfD2APx2RJNzbHK2
	e6jnPJwgZFnzJcVY6Hj1wvGK+cdrlXfYeBCnKNng3OMQ+6bxTyn95Omhlx7Viuklf2wNx3
	OkFjs4YHzDVwRL665wBEZ6QZuDytOIMNUiT/J6lXHFcpR8D5kp5Trmk6YeW82g==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-99j82;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Duck-Oafish: 4eeac15e4e8eb738_1761767793902_3281705601
X-MC-Loop-Signature: 1761767793902:1346860316
X-MC-Ingress-Time: 1761767793901
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.23.87 (trex/7.1.3);
	Wed, 29 Oct 2025 19:56:33 +0000
Received: from fedora.tail0cc0bf.ts.net (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cxdKm5YC2z1xqq;
	Wed, 29 Oct 2025 19:56:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761767789;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MCV8d8hkCWTgJ3eAolDw1gbKzjB4rwTY7mZr1G7gEsM=;
	b=SLyEyZvWTNKz+voO/tYDzZmoW7Q+E1GwTZewG1JC59taQy3ovpR11hkseTq/3LtMuLPDqI
	lBbo4CTimtnVSsGUYlwgiFuSuTOxvfKR0tkprDnyAYhU8raH1kMdX9uJpzG2VDLqQ3OYHu
	esfT3rBAjMz5eaqS2S+neeGjbi19R421oI9GoJEAhYXKdcfiUZaiq87rO2E6vC7o3I1aAh
	HTk3Da0XjNcIHtXEenILmoLRm+uc5TpUUpYAssweEdhMLhp9Yw+dciWI5iUXFrI7to4Ql3
	ytFpRvAACp5c/McpeDmHYHhbiYtMkM8DQRmHFiy5sOF8Tq7dor4PPnA2E2OinQ==
From: Israel Batista <linux@israelbatista.dev.br>
To: david@redhat.com,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: osandov@osandov.com,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v2 1/3] mm: convert memory block states (MEM_*) macros to enum
Message-ID: <20251029195617.2210700-2-linux@israelbatista.dev.br>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251029195617.2210700-1-linux@israelbatista.dev.br>
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Wed, 29 Oct 2025 19:56:28 +0000 (UTC)
X-CM-Envelope: MS4xfGAOrk74A6FkVNKPp0W8ZdrhTgTvM9P38meGAhcWO3zTB4iIK52VPVYe6/DIKtEC0UsV09Ru9DcRC1wn3y6VxlJFCOOdyGySRMrb4wz+gCUAyZqdqglG KY2IbCubxB8CrHo5LcO/fnr/ydQBCY15Zu/MWVvjJl+RjigXgaPZNoJ3Xtr9zp0qyRxkPYljcxEix/XXm/9jY4BmMd+Om7ELIxHaVj2xQAuSbxtb08y/LJa7 BwBVxPG+oq67GD/jMUCL4NT8aso6HdKBEzGjhZ+tHFSvdjCvGD/qnvgflWrvZHHplQ+JP4GgzdSdQeEjRsReDv22uZgQV5Bya2+fmzgEZzB9uY9iaIrtrLeb cLTclJVKie7ZBAw8UF5ZHZ1KkI3OxRfNWWJ7zFN0Kxmkhe65XOn5MJRN42Nh9W2/0DQYPu6VUsSQxfHMI4czB6nPic3LvNGhQrxD8znnoWi/YGMzzX0=
X-CM-Analysis: v=2.4 cv=NuiDcNdJ c=1 sm=1 tr=0 ts=6902716d a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=_i9uciKyxjiCmyIxm1cA:9 a=TWtOS45hTxhqQf3p7L_t:22
X-AuthUser: contato@israelbatista.dev.br

Converting the MEM_* constants from macros to an enum ensures that their
values will be correctly emitted in the debug symbols, making it easier
to trace the meaning of each value when debugging with tools such as
drgn, without the need to hard-code the values.

Since the values are mutually exclusive and they are not exposed directly to
userspace, I also dropped the misleading pattern (1<<X) that made it look like
they were combinable flags.

Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
---
 include/linux/memory.h | 22 ++++++++++++----------
 1 file changed, 12 insertions(+), 10 deletions(-)

diff --git a/include/linux/memory.h b/include/linux/memory.h
index 0c214256216f..f4e358477c6a 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -64,6 +64,18 @@ struct memory_group {
 	};
 };
 
+enum memory_block_state {
+	/* These states are exposed to userspace as text strings in sysfs */
+	MEM_ONLINE,		/* exposed to userspace */
+	MEM_GOING_OFFLINE,	/* exposed to userspace */
+	MEM_OFFLINE,		/* exposed to userspace */
+	MEM_GOING_ONLINE,
+	MEM_CANCEL_ONLINE,
+	MEM_CANCEL_OFFLINE,
+	MEM_PREPARE_ONLINE,
+	MEM_FINISH_OFFLINE,
+};
+
 struct memory_block {
 	unsigned long start_section_nr;
 	unsigned long state;		/* serialized by the dev->lock */
@@ -89,16 +101,6 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
 unsigned long memory_block_size_bytes(void);
 int set_memory_block_size_order(unsigned int order);
 
-/* These states are exposed to userspace as text strings in sysfs */
-#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
-#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
-#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
-#define	MEM_GOING_ONLINE	(1<<3)
-#define	MEM_CANCEL_ONLINE	(1<<4)
-#define	MEM_CANCEL_OFFLINE	(1<<5)
-#define	MEM_PREPARE_ONLINE	(1<<6)
-#define	MEM_FINISH_OFFLINE	(1<<7)
-
 struct memory_notify {
 	/*
 	 * The altmap_start_pfn and altmap_nr_pages fields are designated for
-- 
2.51.0

