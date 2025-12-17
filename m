Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 64430338901
	for <linux-debuggers@vger.kernel.org>; Wed, 17 Dec 2025 16:11:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765987880; cv=none; b=uEOlealO5z9f37okB7ttU4StRuaoSqNqWktfxXGBYZ1bPz6yyzL8ny2W+c0dWWqOMn+Zuihcr5qhTcr1lfMFRnn9YXzHuPQM/y2J1zPDsM6kGyWo3vnGp/2KUp1sZAdW+h3koABC7JGUS2MF+JbLzlyYrjAFRA3JORvwqRQDRNM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765987880; c=relaxed/simple;
	bh=9of+tpkTjAxj1o/8ZXiIWl5CsujNjn4Njwojn+CC8tM=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=s0vNVcCUfmIfyS2BqzEXpkqsFimtJqwiFUEAHQY3jsiqRqIj+F9t6kgcaPxFb+I+bN/f9V7fRTGS3l+ZHYc7MzO6uzYXKDYdNmvqYZN8ItBQKH5jy38NDntx8CApNhrUKFsR/QVZvJPMQUwmrkwBrsruWKSPWmr0m3PypqSQiGc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=K/gs8H7m; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="K/gs8H7m"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1765987875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=QtNSs/E51l4uAHS0XLofGGANMYC/vYq+/qpWLJ/WvZs=;
	b=K/gs8H7mZHFbnLs4UyFMAqH6d8pXi3yj+BtoJoIw/JSsDGQCz2fKRsNz13A5MwXMoBJZw/
	vZSCVmfyadVdhFsODSeLzoSSAxcYff2tF8+nXDwqugG/GpnHSPeutAEx+jPHadhnnXOrEj
	ygUXcfsgo6suPCLvORnldkclihzNqu4=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-657-JEgA1aNdPsSi6litYoeIaA-1; Wed,
 17 Dec 2025 11:11:12 -0500
X-MC-Unique: JEgA1aNdPsSi6litYoeIaA-1
X-Mimecast-MFC-AGG-ID: JEgA1aNdPsSi6litYoeIaA_1765987871
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6A0711955DC7;
	Wed, 17 Dec 2025 16:11:11 +0000 (UTC)
Received: from rotkaeppchen (unknown [10.44.32.15])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C65430001A2;
	Wed, 17 Dec 2025 16:11:09 +0000 (UTC)
Date: Wed, 17 Dec 2025 17:11:05 +0100
From: Philipp Rudo <prudo@redhat.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Subject: Re: Unknown ORC entry type 5 on RHEL 9 kernel
Message-ID: <20251217171105.67a9e059@rotkaeppchen>
In-Reply-To: <87ldjgwz8y.fsf@oracle.com>
References: <87h5u6j9k1.fsf@oracle.com>
	<20251205114106.07848df1@rotkaeppchen>
	<87ldjgwz8y.fsf@oracle.com>
Organization: Red Hat inc.
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: EeajtucEeUsYaWvYonTnf3F-7rk7ugp5mb14RiiSFCU_1765987871
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

Hi Stephen,
Hi Omar,

On Fri, 05 Dec 2025 10:38:05 -0800
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> Philipp Rudo <prudo@redhat.com> writes:
> > Hi Stephen,
> >
> > thanks for letting me know. And yes that is something we need to fix in
> > the kernel rather than drgn.
> >
> > I took a quick look and found that the change was included when
> > backporting fb799447ae29 ("x86,objtool: Split UNWIND_HINT_EMPTY in two")
> > for 9.6. Thing is that I'll be heading to LPC tomorrow and won't have
> > time to work on it properly before that...  
> 
> Thanks for taking a deeper look! No worries on timing, it's not urgent.
> If you think the most likely fix will be to backport commit
> b9f174c811e3a ("x86/unwind/orc: Add ELF section with ORC version
> identifier"), then I believe the drgn workaround I proposed in the
> Github issue [1] should work fine: once the .orc_header section is
> found, drgn will detect it and use the correct hash. The only difference
> being that the "true" first broken version was 5.14.0-517.el9, which
> might be worth encoding in the code in case somebody ever runs drgn
> against a weird unreleased version from that development period.
> 
> [1]: https://github.com/osandov/drgn/issues/578#issuecomment-3614826789

I had a look today. Unfortunately backporting b9f174c811e3
("x86/unwind/orc: Add ELF section with ORC version identifier") isn't as
straight forward as I hoped. The problem is that the RHEL9 kernel is
missing commit 321648455061 ("kbuild: use obj-y instead extra-y for
objects placed at the head"). Without that commit Omar's fix won't
work as intended and in fact causes problems...

I found an internal discussion about backporting 321648455061 ("kbuild:
use obj-y instead extra-y for objects placed at the head"). But back then
(~2 years ago) it was deemed to be too invasive to backport for RHEL9. I
don't think this will change now even later in the RHEL9 life cycle.

All in all I'm afraid we are stuck with Stephen's work around.

Thanks
Philipp

> 
> > One more hint. When you want to get the history of RHEL, it's better to
> > check the centos-stream repo then the changelog. There you have the
> > full git history (modulo some embargoed CVE fixes).
> >
> > https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9  
> 
> Thanks, that helps a lot!
> Stephen
> 
> > Thanks
> > Philipp
> >
> >
> > On Thu, 04 Dec 2025 12:06:54 -0800
> > Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
> >  
> >> Hi Philipp,
> >> 
> >> I wanted to let you know about an issue with drgn's stack unwinding on
> >> the RHEL 9 kernel. It looks like that kernel backports some ORC changes,
> >> without including a change Omar made (including an .orc_header section)
> >> to help identify the ORC format version. I've included more details on
> >> this drgn issue:
> >> 
> >> https://github.com/osandov/drgn/issues/578
> >> 
> >> The result is that drgn can't unwind stacks on the RHEL 9 kernel. I
> >> think the best path forward would be to include the .orc_header patch:
> >> b9f174c811e3a ("x86/unwind/orc: Add ELF section with ORC version identifier")
> >> 
> >> As it is, the RHEL 9 drgn can't unwind stacks on the RHEL 9 kernel,
> >> which seems less than ideal.
> >> 
> >> Thanks,
> >> Stephen
> >>   
> 

