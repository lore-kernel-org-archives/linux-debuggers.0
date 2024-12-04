Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84DE0199FA4;
	Wed,  4 Dec 2024 23:09:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733353772; cv=none; b=lGOVOmGWvlUycUlVrC2j/rPZ7DlbNeWUXJ7nej2rH47gweLcwqVlIVA9rewGT6KI90QZXazrZX1fGDtj2O4hCreMFRHKkgYz5aEGUpYFo/DUyURBy7e8OEm+OZhXASAuS0wH+eZzd+HPVkQUPkqLlzRw7ETy30/HZ5iRBVn6HVE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733353772; c=relaxed/simple;
	bh=Bdv/Kow3g5sHcorLRZrLxFdFLn5C0zOT2tEshCkCf+A=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gl6hcLDQ6nnQ7f8BvG1ltdnWg63qcgLVLTZs8tjpYsdpSPUtaqeahDjq9RM4tRKAiWIKmtZ/Z1aC3rpBd5jL4xFNFwJF5dXFF9aALawMokLpMBeCZssTKAt8oe2Zqgt1Me2XplJecTrhXQ9+43+x3IN1b4Gcxads2MtmleOXn+4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=rX2mDLZK; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="rX2mDLZK"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=JzCDKZ+m2gij39VH+9wih/kCUTjcCYmukORmLFlMOS0=; b=rX2mDLZKJMjO7+JtZe4Szz+Ege
	K5Nj0GZnUfdpQ1aFN6dDRaSGoYwu/mstgYi7tH/+Idswd95pkTotOH/cKy1nXVaD8unvh8heDsGpv
	RAcgcDoInHvE+gkkEWBLCyDRq+VMxgZjwYTJgKIKFFXKEhgz7HKCA+rupVyrZ1JIEyDDygWL7LKu2
	WZmf5m+9kfz/ULkkCXLCXu0A8C3JLQCAxIju+J9oigJboOGa4Qaqa8OTTI8Bja9dlglbv//8WxW5p
	SFaCQku6KKfltglAMRHeBK8R8mBjeADLltQ13B3JjOU9bV9l2THdp1glB6FBIFpjulIXHxcNHkUen
	Ii5GqfCA==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tIyUj-0000000C8Gy-375D;
	Wed, 04 Dec 2024 23:09:23 +0000
Message-ID: <e3e78060-0939-4078-989c-acd7ca1c90d2@infradead.org>
Date: Wed, 4 Dec 2024 15:09:19 -0800
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to
 process/debugging/
To: Doug Anderson <dianders@chromium.org>
Cc: linux-doc@vger.kernel.org,
 Sebastian Fricke <sebastian.fricke@collabora.com>,
 Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, linux-debuggers@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/4/24 3:07 PM, Doug Anderson wrote:
> Hi,
> 
> On Wed, Dec 4, 2024 at 2:17 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>
>> Move gdb and kgdb debugging documentation to the dedicated
>> debugging directory (Documentation/process/debugging/).
>> Adjust the index.rst files to follow the file movement.
>> Update location of kgdb.rst in MAINTAINERS file.
>>
>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
>> Cc: Jonathan Corbet <corbet@lwn.net>
>> Cc: workflows@vger.kernel.org
>> Cc: Jason Wessel <jason.wessel@windriver.com>
>> Cc: Daniel Thompson <danielt@kernel.org>
>> Cc: Douglas Anderson <dianders@chromium.org>
>> Cc: linux-debuggers@vger.kernel.org
>> Cc: kgdb-bugreport@lists.sourceforge.net
>> ---
>>  Documentation/dev-tools/index.rst                                       | 2 --
>>  Documentation/{dev-tools => process/debugging}/gdb-kernel-debugging.rst | 0
> 
> After applying your patch and doing `git grep
> gdb-kernel-debugging.rst`, I still see several references to the old
> location. Those should be updated as part of this patch, right?
> 
> 
> 
>>  Documentation/process/debugging/index.rst                               | 2 ++
>>  Documentation/{dev-tools => process/debugging}/kgdb.rst                 | 0
> 
> Similarly `git grep kgdb.rst` still has several references to the old location.


Thanks. I should have done that.  :(

>>  MAINTAINERS                                                             | 2 +-
>>  5 files changed, 3 insertions(+), 3 deletions(-)
>>
>> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
>> index 3c0ac08b2709..c1e73e75f551 100644
>> --- a/Documentation/dev-tools/index.rst
>> +++ b/Documentation/dev-tools/index.rst
>> @@ -27,8 +27,6 @@ Documentation/dev-tools/testing-overview.rst
>>     kmemleak
>>     kcsan
>>     kfence
>> -   gdb-kernel-debugging
>> -   kgdb
>>     kselftest
>>     kunit/index
>>     ktap
>> diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
>> similarity index 100%
>> rename from Documentation/dev-tools/gdb-kernel-debugging.rst
>> rename to Documentation/process/debugging/gdb-kernel-debugging.rst
>> diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
>> index f6e4a00dfee3..bc4a816e3d32 100644
>> --- a/Documentation/process/debugging/index.rst
>> +++ b/Documentation/process/debugging/index.rst
>> @@ -12,6 +12,8 @@ general guides
>>
>>     driver_development_debugging_guide
>>     userspace_debugging_guide
>> +   gdb-kernel-debugging
>> +   kgdb
> 
> Should the list above be kept alphabetical. The list you removed these
> entries from was _almost_ alphabetical...

Not that I know of.  I'll listen for other opinions though.

Thanks.

-- 
~Randy

