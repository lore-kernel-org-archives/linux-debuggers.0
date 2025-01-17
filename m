Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB0BA15855E
	for <linux-debuggers@vger.kernel.org>; Fri, 17 Jan 2025 22:01:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=35.89.44.39
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737151316; cv=none; b=PRTwCpS9ybMjwb09jN8zUleHh1bBF9rFZSAEBekUYR9+BUmuy7/Mp3OwEQyFCLPYVVQqLwrgzMzmaLOxgWVSLAf/TcUKwEhyCDaBbvF28bvCXD5FH6LtPL+KtJ6ueXme4H+/QQsbgsZeA75k31w+b0Jbs0O8w9xWMO7I6cNGwKE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737151316; c=relaxed/simple;
	bh=99f8LREv8BzStw6HmvXXyPI0X7O2M1NcrSaWpfc0I5k=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jLXMKjlj5A7FmgIgzpgTnoTFFYxr1BeGW84yr2Ox6HGVaxh6bKn3tr9FnBXF5H+5fWUvlCl33lKeGM5fuv/p42zKdtPewAP8lBjtIaT44YEjlKZ6+ohIE1rfw206k4bLi7x+OQBGyxhQlZLQkFGYyUlZf0kq++CTpxkM9ABj0EA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tromey.com; spf=pass smtp.mailfrom=tromey.com; dkim=policy (768-bit key) header.d=tromey.com header.i=@tromey.com header.b=mL1QDWBq reason="signing key too small"; arc=none smtp.client-ip=35.89.44.39
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=tromey.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tromey.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=policy reason="signing key too small" (768-bit key) header.d=tromey.com header.i=@tromey.com header.b="mL1QDWBq"
Received: from eig-obgw-6003a.ext.cloudfilter.net ([10.0.30.151])
	by cmsmtp with ESMTPS
	id YUWVtxSqifC5ZYuPTtpICb; Fri, 17 Jan 2025 22:01:47 +0000
Received: from box5379.bluehost.com ([162.241.216.53])
	by cmsmtp with ESMTPS
	id YuPStxByJ9EdGYuPSt6fzJ; Fri, 17 Jan 2025 22:01:46 +0000
X-Authority-Analysis: v=2.4 cv=WsrgMsfv c=1 sm=1 tr=0 ts=678ad34a
 a=ApxJNpeYhEAb1aAlGBBbmA==:117 a=ApxJNpeYhEAb1aAlGBBbmA==:17
 a=VdSt8ZQiCzkA:10 a=ItBw4LHWJt0A:10 a=20KFwNOVAAAA:8 a=NbwisASnbF4hBZ_PbXsA:9
 a=zZCYzV9kfG8A:10 a=6Ogn3jAGHLSNbaov7Orx:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=tromey.com;
	s=default; h=Content-Type:MIME-Version:Message-ID:Date:References:In-Reply-To
	:Subject:Cc:To:From:Sender:Reply-To:Content-Transfer-Encoding:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:List-Subscribe:
	List-Post:List-Owner:List-Archive;
	bh=DRvvQcx6m6Nvm0QqTuBKVGnCpAjoAXT9XmXbIzQbo8A=; b=mL1QDWBqJerG0CgJyT29Otfz1p
	vkdas73ad4XiGbiD6YQLnm2fcgxv1a/E8s1lvA976bRvK0V5m1uAkI2GnvT0fY3DSJTXqay3VLFPl
	mCvx9MxBwJ2584+DCyvZggxO3;
Received: from 97-118-36-154.hlrn.qwest.net ([97.118.36.154]:37334 helo=prentzel)
	by box5379.bluehost.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96.2)
	(envelope-from <tom@tromey.com>)
	id 1tYuPR-002lRX-1W;
	Fri, 17 Jan 2025 15:01:45 -0700
From: Tom Tromey <tom@tromey.com>
To: Andrew Burgess <aburgess@redhat.com>
Cc: Luis Machado <luis.machado@arm.com>,  Stephen Brennan
 <stephen.s.brennan@oracle.com>,  Tom Tromey <tom@tromey.com>,  Luis
 Machado via Gdb <gdb@sourceware.org>,  linux-debuggers@vger.kernel.org,
  Omar Sandoval <osandov@osandov.com>,  Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <87y0zaogoh.fsf@redhat.com> (Andrew Burgess's message of "Thu, 16
	Jan 2025 16:40:46 +0000")
References: <8734hmtfbr.fsf@oracle.com>
	<5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com>
	<87plkpqpuj.fsf@tromey.com> <87y0zds39y.fsf@oracle.com>
	<87cygnoxi2.fsf@redhat.com>
	<a119598d-51ce-44ae-a315-aa07c8fdb987@arm.com>
	<87y0zaogoh.fsf@redhat.com>
X-Attribution:  Tom
Date: Fri, 17 Jan 2025 15:01:43 -0700
Message-ID: <87ed11umk8.fsf@tromey.com>
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
X-Exim-ID: 1tYuPR-002lRX-1W
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 97-118-36-154.hlrn.qwest.net (prentzel) [97.118.36.154]:37334
X-Source-Auth: tom+tromey.com
X-Email-Count: 5
X-Org: HG=bhshared;ORG=bluehost;
X-Source-Cap: ZWx5bnJvYmk7ZWx5bnJvYmk7Ym94NTM3OS5ibHVlaG9zdC5jb20=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfBc3KsYD61AKexApthqnqWH8zTizCajwYkkdDu4LJmx9wtzOXbl/2wp3QcQ1AxKniXH+z6xXBurYtcOFhrXdtPRBRCLaxH1YOncKc94+L7BGFu5OXu+A
 VWwvyecLVhwl0e1O1Qb4+H1iIIoMgtWGXTdDQYbEOfavF4PTT9WYzro6Q8O0Rvdrl0EnkV3Dq8LO6Ve+bZY+NpkHtPv5DmdS9pA=

>>>>> "Andrew" == Andrew Burgess <aburgess@redhat.com> writes:

Andrew> I doubt, right now, there are many
Andrew> "custom packets" in the wild, but maybe we should consider defining
Andrew> namespaces for custom packets, to avoid future conflicts?

Right now most of the incompatible packets in the wild are from
lldbserver.  They extended the protocol but didn't discuss with gdb or
send patches to the docs.

The other major incompatibility I see in the wild is custom servers that
send weird results.  I've sent a workaround or two for these kinds of
things in the past.

Anyway, for a new qXfer packet, I guess I don't see much to worry about.
Hopefully people adding such things have the wisdom to pick an unusual
name.

Andrew> I've had success using packets via Python before, and not everyone is
Andrew> aware this feature is available, so I thought I'd mention it.

It didn't cross my mind but yeah this seems like a reasonable use case.

Tom
