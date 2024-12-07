Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF2C9126C08;
	Sat,  7 Dec 2024 08:51:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733561489; cv=pass; b=afVAqM8YbuemKg74hyUTWHXO9WH9NeDee/bR5ZSJDMQm/PMtsnKyL6qEbYA1c136uaZ/nYEg65pceMcu6dBn41W7vhcZnFjH3CsSwuNlwQiMtbQTaN6/yoCsSYSkZwSwh0DFCQDqjIJ5Ir1N+FF00bAP0MIS9FM/dE0aO63LKBk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733561489; c=relaxed/simple;
	bh=OJF/NwO4EEmxzcel2KPDFALCIIkp8pL49R9V2TOEPCw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y8aDMwJrpE3n9bLW4JKbMhtNDQk1Q4hieqp/kM3DaVPbDVCxTtHGnsa3rnQ+7syslzFtamJyduPvQNBICitJFIjtuTsrtHvq7hNIQkaoucw47SMbNtPUSAF4ZEiYnytANzlLjiaumPgxiHquS7EOL8xYHNxy09nBL7ArKyV3jxU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=CJe/sMF7; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="CJe/sMF7"
ARC-Seal: i=1; a=rsa-sha256; t=1733561463; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DfYoA9zd9/wi14m/lKcbZFt/pKHmo5qKpRc9aHHGDizzY8q8Qp7Oa7zzXcIcsZBpNfIp7EU68TMeiYqyjLoz09RgF+QxOFbH7A8BezT9d69kCQh2A4bW8lAJ5ZEY/Ne/zRceZgLn+qAirCGO7+RRDuHJDZIyM79o4lAX8NiFrxk=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733561463; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=apX4G4mam7YEz2/SCR0DPcebuLeTmvWkF3pbNnnVLiA=; 
	b=dLNMPWHgStuxKer1yTWvJY5N0VKO1FyzAV14PwtyI3041wPKc7BjD/03HIIeUgq1x/GowWxSAiCnJxq/BOYqvcoZXEtwi3SaFGFhLLQPs/tTeonnrerSLvlXJT9zi/bIKA8XAHl2L2fx8rXjo4ZNT833fwZRQwOPtJOLV8TZp1A=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733561463;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=apX4G4mam7YEz2/SCR0DPcebuLeTmvWkF3pbNnnVLiA=;
	b=CJe/sMF7nHD//gGyQy517E4iflBrocJMGMbHoMnEiffEVLuyraW5CuXJoeLHyGw9
	Eb/W/wdAEATn10UwE3N/ceMPZxNT/bFDbxOys7oXT3VhfPYvt63eg81jDn+w1QRzk0l
	zGh0bP0jjU2rOOlIru8ieY5kguXTjbbYI8QnkUtg=
Received: by mx.zohomail.com with SMTPS id 1733561461580861.8180324422259;
	Sat, 7 Dec 2024 00:51:01 -0800 (PST)
Date: Sat, 7 Dec 2024 09:50:56 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
	workflows@vger.kernel.org,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	Douglas Anderson <dianders@chromium.org>,
	linux-debuggers@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to
 process/debugging/
Message-ID: <20241207085056.fcnoqov3kd5rjqft@basti-XPS-13-9310>
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <87h67gu5q1.fsf@trenco.lwn.net>
 <0e5dbbbe-4cd8-49d2-a440-7e1acd7d40e9@infradead.org>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
In-Reply-To: <0e5dbbbe-4cd8-49d2-a440-7e1acd7d40e9@infradead.org>
X-ZohoMailClient: External

Hey Randy,

On 06.12.2024 15:57, Randy Dunlap wrote:
>
>
>On 12/6/24 8:38 AM, Jonathan Corbet wrote:
>> Randy Dunlap <rdunlap@infradead.org> writes:
>>
>>> Move gdb and kgdb debugging documentation to the dedicated
>>> debugging directory (Documentation/process/debugging/).
>>> Adjust the index.rst files to follow the file movement.
>>> Update location of kgdb.rst in MAINTAINERS file.
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>
>> So ... since these are indeed development tools, I wonder if we should
>> leave a reference behind in case people are looking for them there?
>
>As far as I'm concerned, all debug tools are development tools, so I'm back
>to all of /process/debugging/ should be somewhere else.  ;)

I mean this is where things just simply overlap, because debugging is
part of the development process and all debugging tools are development
tools, so I think the question is not whether one of the two places is
the "correct" but instead the user should be able to find the necessary
information by navigating to any of the two places.
So I would say, lets add a reference in the index of the development
tools that highlights the documentation of the debugging tools which are
found in the development process documentation.

>
>cheers.
>-- 
>~Randy

Regards,

Sebastian Fricke
