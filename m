Received: from insect.birch.relay.mailchannels.net (insect.birch.relay.mailchannels.net [23.83.209.93])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7809D311587
	for <linux-debuggers@vger.kernel.org>; Wed, 29 Oct 2025 20:13:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=23.83.209.93
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761768795; cv=pass; b=ULf4lLWdNg7H0oGzmlILzcIK7PHTv3XMQzS+c5vmuI4qHOPNJZedNazsqWUfE9X4DEwDg6x7OIGCtcFkwBS9/pnZFU6ZGlUk/KDvJKW2AMEwvlVFoPz6rUC4lVwXXfnru9cRFxNt16S/LWCmmImcBOpT0kBDx5apv5BqeVHK9Vc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761768795; c=relaxed/simple;
	bh=j7pgVOdYW1cr00m4vzSQkXIHsy3gnM+4UN1nwcW/CcQ=;
	h=From:To:Cc:Subject:Message-ID:In-Reply-To:References:MIME-Version:
	 Date; b=qT7GksG8Np4Afzg4wRqCbX+Rk3mhW00uivy1eAJXg3b9XWwOge3qQ6L5geDEeyv1BZDtL2r54rq8rjiHJea/WcaQXwRJN32Mge9Ef9g5j8esZ1uKfE7vfRltC1SQnwl28xBIswxo4kDig2hsQ2peQOgH+coGsf+uAN9O5G0msDw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br; spf=pass smtp.mailfrom=israelbatista.dev.br; dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b=KB+JTHc/; arc=pass smtp.client-ip=23.83.209.93
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=israelbatista.dev.br
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=israelbatista.dev.br header.i=@israelbatista.dev.br header.b="KB+JTHc/"
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
Received: from relay.mailchannels.net (localhost [127.0.0.1])
	by relay.mailchannels.net (Postfix) with ESMTP id E2070161D05;
	Wed, 29 Oct 2025 19:56:37 +0000 (UTC)
Received: from fr-int-smtpout17.hostinger.io (trex-green-8.trex.outbound.svc.cluster.local [100.123.122.56])
	(Authenticated sender: hostingeremail)
	by relay.mailchannels.net (Postfix) with ESMTPA id 7349216208D;
	Wed, 29 Oct 2025 19:56:36 +0000 (UTC)
ARC-Seal: i=1; s=arc-2022; d=mailchannels.net; t=1761767797; a=rsa-sha256;
	cv=none;
	b=mMn/wZoqxjELg0tQWCW+4/5hSgNvher8OX7jmam6tDYgcr2BQ7dbFOwOwBaKfrXat5+CtY
	HLM1QOObsbo+i4/3bG9PpyQP1duXkbQDLkffA4EO7R4jpZxjLoZWMaCy45xKfEGeA2htDD
	TODsYUbmRHmk+F340xEdKek103jiqbSPynokg+j0S1pB0o2TjTu1AWyJJBq4L5jFE131rG
	N061Me5rrue4FPsqyClzGpVYU/FiY4SmeEJs6U04jb2tg5Ww8h2wc58UVh4Cz4CkQGyMiF
	Wl1/PfrAfZ0dtV+KGM9rlb3HTv+1aAQ7naBPRcOGw1QX3CYtXkBt71AncoxJlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed;
 d=mailchannels.net;
	s=arc-2022; t=1761767797;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:dkim-signature;
	bh=+yJuOJUlXKdKViOtv+OYoLNyuk04aqpugJBZxV8M2kA=;
	b=xU47KWX2ljXbccvF/mfq+vClsuGlfEc5C4hFaMLLYGg44hN0w3NKPgyIA8xjmCMra1vDnA
	GmbXSWgWqYehAItdPz/yuFCpgPWW+zFxOWX4OyMh0eYPKHXvWiDbAWnft9zt64pK90C13a
	+Ah+84ut/yau+MeOlwDzpmlmooMv9JGxLvS71QmMqBT7tFhh/YS467NDe9btkU2iJSgmBN
	XMi5ee9E9ofRCXKmlczc+egb+tYkVcAQgFxtwcVHbTu2Pr8BLhMDuDkrsp7rrKBtz17X1V
	loYPXQoOhsFTcF8sYWsuVlSKbauywvHywa1+I5Z39djz5AAOdmPPL5t6BW/yrw==
ARC-Authentication-Results: i=1;
	rspamd-77bb85d8d5-8fc96;
	auth=pass smtp.auth=hostingeremail smtp.mailfrom=linux@israelbatista.dev.br
X-Sender-Id: hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MC-Relay: Neutral
X-MailChannels-SenderId:
 hostingeremail|x-authuser|contato@israelbatista.dev.br
X-MailChannels-Auth-Id: hostingeremail
X-Abortive-Fearful: 23ad77a02f87fdf6_1761767797823_3549134956
X-MC-Loop-Signature: 1761767797823:3821853701
X-MC-Ingress-Time: 1761767797823
Received: from fr-int-smtpout17.hostinger.io (fr-int-smtpout17.hostinger.io
 [148.222.54.37])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384)
	by 100.123.122.56 (trex/7.1.3);
	Wed, 29 Oct 2025 19:56:37 +0000
Received: from fedora.tail0cc0bf.ts.net (unknown [IPv6:2804:d59:8970:3b00:5f26:e2da:68e6:2358])
	(Authenticated sender: contato@israelbatista.dev.br)
	by smtp.hostinger.com (smtp.hostinger.com) with ESMTPSA id 4cxdKp23w2z1yFc;
	Wed, 29 Oct 2025 19:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=israelbatista.dev.br;
	s=hostingermail-a; t=1761767791;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+yJuOJUlXKdKViOtv+OYoLNyuk04aqpugJBZxV8M2kA=;
	b=KB+JTHc/KSth5URNiy8KvCQo9aBJlQFxHxadqMqsisE9jRxRX0CsmDekw8ZYWHmdx7WPXH
	oI9Rdi42HZFWltuioPxr051Yvsjm9tbZdjUsBp3HLMnf/EhvPD9CbCl6AP1nK30SsRORLG
	eej+x71WkIvZRI7DimKVS8+uWHiedEfrJsBydpammzG5T+p6z3B2dHXQWgIql+vPv/0e2H
	daxO58XjfMTswfJCM1yBV0UHdDGfABVm7JwC1gwRVPuSPtGybIwsYSN6cm/27JZEjL5n6C
	/HefeJsCzLgnnNrOEalulydT+a3SEK44f/UulrJUHM25R9vmg7kR5eyQbWAbbA==
From: Israel Batista <linux@israelbatista.dev.br>
To: david@redhat.com,
	lorenzo.stoakes@oracle.com,
	akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: osandov@osandov.com,
	linux-debuggers@vger.kernel.org
Subject: [PATCH v2 2/3] mm: change type of state in struct memory_block
Message-ID: <20251029195617.2210700-3-linux@israelbatista.dev.br>
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
Date: Wed, 29 Oct 2025 19:56:30 +0000 (UTC)
X-CM-Analysis: v=2.4 cv=DJTd4DNb c=1 sm=1 tr=0 ts=6902716f a=WIeu/gG1zxr2CnNbFFeIHA==:617 a=xqWC_Br6kY4A:10 a=DtwXHJUFikXtE54jZx8A:9 a=TWtOS45hTxhqQf3p7L_t:22
X-CM-Envelope: MS4xfIkluH79V4IjV3WQC/76OxLvrpG/ldOucB1qUH8rgoijdlrawTPSKVyHdLBGlxue7CiqyJNzleaKJonTXFm6V9PH7CzxWWxRM54B5ymEOiK2xePXbZrg qN937g6oFhEljn2rE/8vldXHLC0VU4viXia+lW7luHBqAfTtQ54RWjxGp14y5Nw7AmLqutTvTwEixxgCGwrfwckadrL72cdA5zEeWrXD5GZwb7jixuAgYqnl gttG4dqIz1zQDgOwzMY3NFHwBbr62fgs0im4nplx3rsKm8Y9H2FcJIl/Hv2acIux4SKvHfWXdzVdnpwledue417/1wxSNDn37Y/w30tHtEFmtI1JQ9u9MP+w gEaCDK4/NTY610xa8BXsgRCo67+VVuaCpyXkT/1kDKh8jrIvwqR7wtYfYjtftdvp0y8+40OYvzcBJXt4onb2FC1au8CEZC7MFPA9t4d+Vd3F5ZlcFEc=
X-AuthUser: contato@israelbatista.dev.br

The state of a memory block should be restricted to values specified
in the documentation of the memory hotplug API. However, since the
state field in the memory_block struct was defined as an unsigned
long, this restriction was not enforced at compile time.

With the introduction of the enum memory_block_state, it is now possible
to incorporate the desired semantics in the field declaration and
enforce these restrictions at compile time.

Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
---
 drivers/base/memory.c  | 2 +-
 include/linux/memory.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/base/memory.c b/drivers/base/memory.c
index 6d84a02cfa5d..3d17dd774947 100644
--- a/drivers/base/memory.c
+++ b/drivers/base/memory.c
@@ -198,7 +198,7 @@ static ssize_t state_show(struct device *dev, struct device_attribute *attr,
 		break;
 	default:
 		WARN_ON(1);
-		return sysfs_emit(buf, "ERROR-UNKNOWN-%ld\n", mem->state);
+		return sysfs_emit(buf, "ERROR-UNKNOWN-%d\n", mem->state);
 	}
 
 	return sysfs_emit(buf, "%s\n", output);
diff --git a/include/linux/memory.h b/include/linux/memory.h
index f4e358477c6a..36d733283329 100644
--- a/include/linux/memory.h
+++ b/include/linux/memory.h
@@ -78,7 +78,7 @@ enum memory_block_state {
 
 struct memory_block {
 	unsigned long start_section_nr;
-	unsigned long state;		/* serialized by the dev->lock */
+	enum memory_block_state state; /* serialized by the dev->lock */
 	int online_type;		/* for passing data to online routine */
 	int nid;			/* NID for this memory block */
 	/*
-- 
2.51.0

