Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B46E17E0;
	Sat,  7 Dec 2024 23:13:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733613192; cv=none; b=LaNdORHk6Qqt4AWcZ2lma1ZwCvVnhN786piomOSy8iwTp6lT14WtHhNZPhdlbMokea96uakULF6M3Z2/OnzCTzWBzGJv4A5wePVGhl11vi9pTyTWhXJUwvlFOSTsZ9iMIIEdg9LzVQ8dr0oHE2yOlalfYEARshxQHb/cjxvfea8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733613192; c=relaxed/simple;
	bh=lmL0QP1IYR23G/1RG4er1oLXWCOXW+nlVLbHGcMeDwA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=fIKoSweUzp1Pcap5sHk4Y+be6axzi67GkHOWf3idVXs6WEKFHnaz98P9jR9vEL0FFJLjglGjKtsTB7LDsnh/YsIqViUXHKHJVEpudSW6YvKbSlkC86tIkAW68qUGsstoLRugjfoedKFsslIekEE1+5J3taidh/78NmDiDDtlr4g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rQK3ofmJ; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rQK3ofmJ"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=HspVnKDKVVVr7FO7xa5uCzBXD24/tOGH2qwRon8BIpU=; b=rQK3ofmJb75Hfz2E1lOQespsUR
	QDpOJ2tK1AMKVFw85EpB4psjJG3phra4wX5gvWtyEMqKXB8Keu63sN7isqaxDXKKPi8/1vUdL+0gk
	/bVRDqphIyVOTFOOFJGNo1ECRMe4Q2/bWqg7eJUYQ1uZB/ZxmYX1M6Q4ZKz0XtnOKOJXdtpJYAnsr
	xh6+qfPWLTHApJdKiTA0YsEWjOJME2X8MdhTetdiOitN8JTxWCBBYMiriyvlD+0m1XvAjZMjk8+2E
	8YN+lyjh/b8aFyZlxlnZsBO5GRRQZ5ZJAOTVw9mbjd+QQS4uPZ+7aH9T66wHCHwMK+Tg76WKERZhW
	T9kMnRCQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tK3xs-00000003Kza-2PJJ;
	Sat, 07 Dec 2024 23:12:54 +0000
Message-ID: <3be10d6b-e19e-4965-bac9-9af8b74fb566@infradead.org>
Date: Sat, 7 Dec 2024 15:11:48 -0800
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to
 process/debugging/
To: Sebastian Fricke <sebastian.fricke@collabora.com>
Cc: Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
 workflows@vger.kernel.org, Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, linux-debuggers@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <87h67gu5q1.fsf@trenco.lwn.net>
 <0e5dbbbe-4cd8-49d2-a440-7e1acd7d40e9@infradead.org>
 <20241207085056.fcnoqov3kd5rjqft@basti-XPS-13-9310>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241207085056.fcnoqov3kd5rjqft@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/7/24 12:50 AM, Sebastian Fricke wrote:
> Hey Randy,
> 
> On 06.12.2024 15:57, Randy Dunlap wrote:
>>
>>
>> On 12/6/24 8:38 AM, Jonathan Corbet wrote:
>>> Randy Dunlap <rdunlap@infradead.org> writes:
>>>
>>>> Move gdb and kgdb debugging documentation to the dedicated
>>>> debugging directory (Documentation/process/debugging/).
>>>> Adjust the index.rst files to follow the file movement.
>>>> Update location of kgdb.rst in MAINTAINERS file.
>>>>
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>
>>> So ... since these are indeed development tools, I wonder if we should
>>> leave a reference behind in case people are looking for them there?
>>
>> As far as I'm concerned, all debug tools are development tools, so I'm back
>> to all of /process/debugging/ should be somewhere else.  ;)
> 
> I mean this is where things just simply overlap, because debugging is
> part of the development process and all debugging tools are development
> tools, so I think the question is not whether one of the two places is
> the "correct" but instead the user should be able to find the necessary
> information by navigating to any of the two places.
> So I would say, lets add a reference in the index of the development
> tools that highlights the documentation of the debugging tools which are
> found in the development process documentation.
> 

Hi,

Sure, I will add entries in dev-tools/index.

Thanks.

-- 
~Randy

