Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4025F1CBE9D
	for <linux-debuggers@vger.kernel.org>; Tue, 14 Jan 2025 17:16:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736875018; cv=none; b=lkmBHFPv9frcfWzjcAhNepHaYlzFgWf7QUS/tNH8JpOEEeT+3eMB/pUAqVsePkGG7zn5TGVSIVLGhQGYBUhcSiRG2tTcZgyWa6Ojp2X2+tuUFQC8OXsOEwcgNY265QsbLND25qx8tO0SFIZCznNA4L3BJPrMN+q+t7cheI38Ooo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736875018; c=relaxed/simple;
	bh=xNNypnHIRUmW94qO6XUvCjfu2J2r29XYgUmT2h3n2Dw=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=k52wwCKBUqijfgoxoB3sxPbkiGeMP8ESV42k7Kote68mzVDC+pePUcopN/nC03LwGbWMhkMBXRShxaw75nKeJdhlvigmOFiBHBF8UijG6QdrATl3QF041fFrpGCkor1za8UUx6FuyOVuXzJ+cPsQH4XK/rzNYK6qvW+5bYyQXDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tromey.com; spf=pass smtp.mailfrom=tromey.com; dkim=policy (768-bit key) header.d=tromey.com header.i=@tromey.com header.b=USqQB4Vy reason="signing key too small"; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tromey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tromey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=policy reason="signing key too small" (768-bit key) header.d=tromey.com header.i=@tromey.com header.b="USqQB4Vy"
Received: from eig-obgw-6006a.ext.cloudfilter.net ([10.0.30.182])
	by cmsmtp with ESMTPS
	id XVeStiHKbfC5ZXkVctMSy9; Tue, 14 Jan 2025 17:15:20 +0000
Received: from box5379.bluehost.com ([162.241.216.53])
	by cmsmtp with ESMTPS
	id XkVbtdV83foYEXkVbtCxSl; Tue, 14 Jan 2025 17:15:19 +0000
X-Authority-Analysis: v=2.4 cv=GtlE+F1C c=1 sm=1 tr=0 ts=67869ba7
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=VdSt8ZQiCzkA:10 a=ItBw4LHWJt0A:10 a=CCpqsmhAAAAA:8 a=EBjwv9rErsWPzZH6edMA:9
 a=ul9cdbp4aOFLsgKbc677:22 a=6Ogn3jAGHLSNbaov7Orx:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com;
	s=default; h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=vdDS5VgFaBSo5PaMKhueefOcShbcz5zvoRRySYA12hk=; b=USqQB4VyGXHjRGZcUJtSgnRXSB
	qCoRdDI191/wKnUjF6hb6cutWocBzR7C+wU0iL8sIp2r9rzBoac+NlgpF8ln/ESXwezHVEnLFkUlS
	s40vQcqGcIBEGBF7VOgJ5UshJ;
Received: from 97-118-36-154.hlrn.qwest.net ([97.118.36.154]:41008 helo=murgatroyd)
	by box5379.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <tom@tromey.com>)
	id 1tXkVa-000J6F-10;
	Tue, 14 Jan 2025 10:15:18 -0700
From: Tom Tromey <tom@tromey.com>
To: Luis Machado via Gdb <gdb@sourceware.org>
Cc: Stephen Brennan <stephen.s.brennan@oracle.com>,  Luis Machado
 <luis.machado@arm.com>,  linux-debuggers@vger.kernel.org,  Omar Sandoval
 <osandov@osandov.com>,  Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com> (Luis Machado via
	Gdb's message of "Tue, 14 Jan 2025 15:03:16 +0000")
References: <8734hmtfbr.fsf@oracle.com>
	<5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com>
X-Attribution:  Tom
Date: Tue, 14 Jan 2025 10:15:16 -0700
Message-ID: <87plkpqpuj.fsf@tromey.com>
User-Agent: Gnus/5.13 (Gnus v5.13)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - box5379.bluehost.com
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - tromey.com
X-BWhitelist: no
X-Source-IP: 97.118.36.154
X-Source-L: No
X-Exim-ID: 1tXkVa-000J6F-10
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 97-118-36-154.hlrn.qwest.net (murgatroyd) [97.118.36.154]:41008
X-Source-Auth: tom+tromey.com
X-Email-Count: 9
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfMv5T0ms1d1yQVM1QyMkhXIhtGbSiXf5w56WFgi9eU5DRu+MKNxem1RsA2OtC5viX8iXpWGn7aszTgwuW90/OB3XUlVIgPdDAS920vTZ3o+qDaeptuvZ
 3HlpGKIlwCKkb/tSGRUfuVk+AWHKTMNeNuMc8FHvx8svRFr0D1h9O+uYT0Ppm7D12k/dvu2G029D/ellftL5tJRV0XpXslxD8R8=

>>>>> Luis Machado via Gdb <gdb@sourceware.org> writes:

>> To sum up, my specific questions are:
>> 
>> 1. What is the maximum protocol packet size, if any?

> It is hardcoded by gdb, but the remote can also specify that, but...

>> 2. Would this functionality be better implemented in a single "q
>> linux.vmcoreinfo" packet, or as a "qXfer" packet?

> ... we have packets like qXfer that can handle multi-part transfers. So the
> packet size is not a critical concern anymore, and it is best to use this
> newer mechanism, if the usage fits the packet structure.

Agreed, qXfer is the way to go.
If you're adding a new object type, a patch to the manual would be good.

Tom
