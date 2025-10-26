Received: from poodle.tulip.relay.mailchannels.net (poodle.tulip.relay.mailchannels.net [23.83.218.249])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11E9A35B13C
	for <linux-debuggers@vger.kernel.org>; Sun, 26 Oct 2025 16:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.218.249
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761495740; cv=pass; b=IiALTCeieNWc2w+NwYi4lwRj3TGqMvtTHFZwOdIB3+BjWZb0K047UOfegxRnyPAv8wxT6LXk/wwsteRGoRFhYtmz9h96pt/4B2rXPx4U7PetiM9QUf8A21MGrXiYKkr4i4uOGthx7U9fQ83kcZ7Tu/NPZY6eBtj3qRXi1tK9mFU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761495740; c=relaxed/simple;
	bh=OAifzP/PNtXjUTQ4MAUs9mfu9k4sx0eyvkwxEh0f2CY=;
	h=From:To:Cc:Subject:Message-ID:MIME-Version:Date; b=oJjN03tzJchb633MObua4nbsXIpnBEpmKjAKTiT50A1rfR8WJ1nzgvT4UbiICXvz4TqHtGEMOhpfZQsIr10nWjDIOD4UTIP+nI0RwEeEWpRQKi0gbLKk3sw59intStXQAL9MOb6LE/L7LxLZaBqQcosRk19ZG+kyNMkcFfbdyoc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=gl+m3rbk; arc=pass smtp.client-ip=23.83.218.249
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="gl+m3rbk"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id 0CCB9362137;
	Sun, 26 Oct 2025 16:22:10 +0000 (UTC)
Received: from de-fra-smtpout2.hostinger.io (100-120-23-87.trex-nlb.outbound.svc.cluster.local [100.120.23.87])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 3E114361B05;
	Sun, 26 Oct 2025 16:22:08 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761495729; a=rsa-sha256;
	cv=none;
	b=BfSrpQ7obPY04xoNL0gAfYkAZVkVnU5RK49Dz9iphXualZezzKbELAQC57YzdnwPcoZzwo
	SWkUHBkocmGJA459vHbaAjRJJuGYXe/01GVWHPbsHfSUI5CKwbnthxfcOiyZ0nlvl/8rOu
	05XwvVke8cfe8mOb1wZW39UYuQi94lzRu2qgCLdniOuybrGfC9+blUvYW0Di0EDS/J8lDU
	08b816+aHvDoOISeXJ7nrtAk/49xwkP6IE78XbPfzpflo4dPpY8euH9w0TCMErY7zyomzr
	VWRA37jocymQPZFf6vH+H3G5AIhPq7FL4Ym42zEXnlOlew672t9XWafCF/1w5A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761495729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:dkim-signature;
	bh=MM88zLJ5rxpHST/Heh+0Np7jYGHxRTupznLlA+uOGBE=;
	b=N4fEQpE95EnVLMAH+EwnQ2ioK3PlBNaBAbMLSf2LNyUwgFSWe9Gjx3nIvu0JYEe/waOuPb
	8dfLM3Tz6FE5gQyuuAdKxl84oupbY9MZWoV2oKNRSv05AHY6eolGBejUYOvgliMsDXkLKw
	H6myH4izaW5fgxLf+cMLnJpwsGYeNbF0rSMq4Z04/GA7L+SCKzhjywSKUT3vXDBn6AYpsK
	plWncSqXk4lPANBbtLn5MFhpSfiEscbfW4qao1jxz691oWOoAxOps0sXvLU3DKS4C7piW4
	OPo87aVbLdaD0UcY/iC2p3rFX6eIEBZXdazRkSwDT2VOXUk8l5bPMSzxxzt0Yw==
ARC-Authentication-Results: i=1;
	rspamd-674f557ffc-8hdz9;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Thread-Thoughtful: 28aaf1236a54f91b_1761495729250_785022570
X-MC-Loop-Signature: 1761495729250:3874482419
X-MC-Ingress-Time: 1761495729250
Received: from de-fra-smtpout2.hostinger.io (de-fra-smtpout2.hostinger.io
 [148.222.55.5])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.120.23.87 (trex/7.1.3);
	Sun, 26 Oct 2025 16:22:09 +0000
Received: from fedora.tail0cc0bf.ts.net (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cvhjn1PJ6z3wbs;
	Sun, 26 Oct 2025 16:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761495726;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=MM88zLJ5rxpHST/Heh+0Np7jYGHxRTupznLlA+uOGBE=;
	b=gl+m3rbk2Gujv+1wLAFmd6mDlAY/Xy70SKXZkd7lRmhWBODteq5Xx3B1Q/GCzURYbSe/PE
	Z9QNdBnUGLXngeTolLUkpGLyEV+Vs+YjpmZpf2Utt89W/O3/UJl61xKpCgcUc1tBmNylGL
	r6RxVcg0Zkv07Jyu/UILuz6Hj8qGYfORSvtrXLEuZ8cOKr090KZsq+y1+p9U/oQNqo4x6A
	KQt0lLOqhsbtx5Mjv/k3/kTayPAVW2XoogLjoppiHqtB1Qjz8UfcAo+PAPbV9Itjcs8Ldf
	1j9luxM2OIm0yOXj3HgPpwXKvbxvE6JO2ukHeAr4e+naGjMxbJHE/oitQ6UnrQ==
From: Israel Batista <linux@israelbatista.dev.br>
To: akpm@linux-foundation.org,
	david@redhat.com,
	linux-mm@kvack.org
Cc: linux-debuggers@vger.kernel.org,
	Israel Batista <linux@israelbatista.dev.br>
Subject: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
Message-ID: <20251026162156.12141-1-linux@israelbatista.dev.br>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Date: Sun, 26 Oct 2025 16:22:05 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=Ceda56rl c=1 sm=1 tr=0 ts=68fe4aae a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=vgun6L5qt0XZy9YrhB4A:9 a=TWtOS45hTxhqQf3p7L_t:22
X-CM-Envelope: MS4xfEAzvQr/tVdCv/Pvsqfxu03jvQZ9r4K622GFFLllRo+gOZuz8VrMe2eXaMabqLDMI/I593auInNWEXoFjW0t19MwcPQPrPWTI/1JBDlNJvYPp3146tPN h36mLo84GmlwAe31XvcTV8jV8doezGSotbYg2lAsKFt1lL8UR7IdBjBI3vAErmRthKjDgtY3rlmLNJV1j4q9SmbJ+sW/8KnDU0+gQs5L62RL7LpRbfWSa8Np PKdSPoCrRI4qKNej1QBdrFcXd21dNu1OzjADuyA8+Cfiiexa0jtr9HyZ4UA9XPS/PV/9sriReLehl8ba1wwZu3YHI1agK/TvSU0lXTIYiLeeVlWDQrfyAZiC +j/zAbBPK892lvH+JVbPVZtQOBPClop8BHAKTqzLFst0Sou8/VaOpDCvuPvdx3ymoQ/7r0RY
X-AuthUser: contato@israelbatista.dev.br

The MEM_* constants indicating the state of the memory block are
currently defined as macros, meaning their definitions will be omitted
from the debuginfo on most kernel builds. This makes it harder for
debuggers to correctly map the block state at runtime, which can be
quite useful when analysing errors related to memory hot plugging and
unplugging with tools such as drgn and eBPF.

Converting the constants to an enum will ensure the correct information
is emitted by the compiler and available for the debugger, without needing
to hard-code them into the debugger and track their changes.

Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
---
 include/linux/memory.h | 16 +++++++++-------
 1 file changed, 9 insertions(+), 7 deletions(-)

diff --git a/include/linux/memory.h b/include/linux/memory.h
index ba1515160894..8feba3bfcd18 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
 unsigned long memory_block_size_bytes(void);
 int set_memory_block_size_order(unsigned int order);
 
-/* These states are exposed to userspace as text strings in sysfs */
-#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
-#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
-#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
-#define	MEM_GOING_ONLINE	(1<<3)
-#define	MEM_CANCEL_ONLINE	(1<<4)
-#define	MEM_CANCEL_OFFLINE	(1<<5)
+enum mem_states {
+	/* These states are exposed to userspace as text strings in sysfs */
+	MEM_ONLINE		 = (1<<0), /* exposed to userspace */
+	MEM_GOING_OFFLINE	 = (1<<1), /* exposed to userspace */
+	MEM_OFFLINE		 = (1<<2), /* exposed to userspace */
+	MEM_GOING_ONLINE	 = (1<<3),
+	MEM_CANCEL_ONLINE	 = (1<<4),
+	MEM_CANCEL_OFFLINE	 = (1<<5),
+};
 
 struct memory_notify {
 	unsigned long start_pfn;
-- 
2.51.0

