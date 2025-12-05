Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F3BE3128D7
	for <linux-debuggers@vger.kernel.org>; Fri,  5 Dec 2025 10:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764931285; cv=none; b=OAclgVfa4JaPdgZnRFxljLIZvTLewBgRSukoM31lmHsblQtFfTCpZXKutiezJqZfjbJrefjpvuGSLl2OHsxjdzX7q0Lq3ECRxArDe4bCcaoX/wOvLVP1R9yY/Pjsqr4RZqVb9KfPqpQ1JLIp5tuUNMtVlqoZmjfooiGqhRuj1l0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764931285; c=relaxed/simple;
	bh=eGEZCQZsBwS9cLOuWgdhXzk9ihYwqmTLAjViQWWSdEk=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=HB3MZ7rSIjQiZLBgYXqN6l5zSinPGWEsvQGUcaU3ap7DZaFqSV514bVyKPECIyYmqAtKR7qI1/HGjjh96yoMc8lxDOSgydmu4cG+S4NrvMKtul3shh+HrPb8G6JmnOAAIY1n3ToSgKzcRKExiwtl24ARALdDa2KfCnwrPHCKP04=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Gcfvl8UY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Gcfvl8UY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1764931277;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2hKG0vjiPt1DGx7i+HyDcVcJIkL4pXvQ+G74wXn9PEU=;
	b=Gcfvl8UYonxWVcjW2PoZJFB7oOthurCP/tNjenJeBgz5gV+ljzGOhrsKiLpDMqxRd6vYRg
	ZX8x51CL7iiJoUxRZ28NpW5AjWZCN43v8iHP43HnFWNdW7gLu3CKmgNVx9eMHKO96Qo8ku
	OfgrHoyV/tCsJbScOo6tTMJjzvUUy44=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-608-F8MVyTFZNSysUgSLUG40cw-1; Fri,
 05 Dec 2025 05:41:13 -0500
X-MC-Unique: F8MVyTFZNSysUgSLUG40cw-1
X-Mimecast-MFC-AGG-ID: F8MVyTFZNSysUgSLUG40cw_1764931272
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A0D2A1956052;
	Fri,  5 Dec 2025 10:41:12 +0000 (UTC)
Received: from rotkaeppchen (unknown [10.45.225.39])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 26EB01800357;
	Fri,  5 Dec 2025 10:41:10 +0000 (UTC)
Date: Fri, 5 Dec 2025 11:41:06 +0100
From: Philipp Rudo <prudo@redhat.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Omar Sandoval <osandov@osandov.com>, <linux-debuggers@vger.kernel.org>
Subject: Re: Unknown ORC entry type 5 on RHEL 9 kernel
Message-ID: <20251205114106.07848df1@rotkaeppchen>
In-Reply-To: <87h5u6j9k1.fsf@oracle.com>
References: <87h5u6j9k1.fsf@oracle.com>
Organization: Red Hat inc.
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: O165h0kdmF9S5z92DntR1rVQ0EzXCNQqzzuIDVvOI2c_1764931272
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Stephen,

thanks for letting me know. And yes that is something we need to fix in
the kernel rather than drgn.

I took a quick look and found that the change was included when
backporting fb799447ae29 ("x86,objtool: Split UNWIND_HINT_EMPTY in two")
for 9.6. Thing is that I'll be heading to LPC tomorrow and won't have
time to work on it properly before that...

One more hint. When you want to get the history of RHEL, it's better to
check the centos-stream repo then the changelog. There you have the
full git history (modulo some embargoed CVE fixes).

https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9

Thanks
Philipp


On Thu, 04 Dec 2025 12:06:54 -0800
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> Hi Philipp,
> 
> I wanted to let you know about an issue with drgn's stack unwinding on
> the RHEL 9 kernel. It looks like that kernel backports some ORC changes,
> without including a change Omar made (including an .orc_header section)
> to help identify the ORC format version. I've included more details on
> this drgn issue:
> 
> https://github.com/osandov/drgn/issues/578
> 
> The result is that drgn can't unwind stacks on the RHEL 9 kernel. I
> think the best path forward would be to include the .orc_header patch:
> b9f174c811e3a ("x86/unwind/orc: Add ELF section with ORC version identifier")
> 
> As it is, the RHEL 9 drgn can't unwind stacks on the RHEL 9 kernel,
> which seems less than ideal.
> 
> Thanks,
> Stephen
> 

