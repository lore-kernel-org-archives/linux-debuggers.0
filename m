Received: from desiato.infradead.org (desiato.infradead.org [90.155.92.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAADFF4E2;
	Thu,  5 Dec 2024 17:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.92.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733418556; cv=none; b=Xmg0Hwz1TV6LGB0GOPZHp7PaNC7cV+I5vCzKUa1/6e8t6DAIX+pQqa3Pi06mVVVfPOkDmJAIo2B1Dz8oriELu/DrDgQ+n7JHJTXY31eWEm8khTPsflrFmHc6IE5WotnAiqyemCTmHfCjETZREhXw80lIEJzh4WHWAAD4GYXk44I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733418556; c=relaxed/simple;
	bh=7x9CwVTWR1TPl/K7NFhs2U/Qb8MN7HvrHX6e/o3XLN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=aX6ZAIJPEhU4SIGyXdysT9v5IsGXgVcYTvBM5YtZZOIl+mr0PojQQ6Wv8AEZ2FDUFCzvtme1LfUE8LIMHczKKofOMzoF0QD4nmUlFp8I6xRZjoeG90XjtGOCzw5cEWZj3HsedNOBrSzBMbVPQD1oTpCwUtTZdT63td/bfgARDw0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=P3wLQoIj; arc=none smtp.client-ip=90.155.92.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="P3wLQoIj"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=+qJf5Q6Eld3EBOT/qf+hwJg4g1YOizrbg7xTLfswxlE=; b=P3wLQoIjFeVD+btfbNE+DbucDt
	sJimhkl12CQr6KNZYt3maAUojCYSSU95lNWp17vOvQ8bGgMqwBYQi6bbcUEWXT/ZWoDAzM/KjACB6
	sW/INyYFUMEgD1PzIIsU8fOLuEgIFoWbz/rP0HIw9txoubV3IqDZyhHnecsr0DiK2YB0zCwOJXb5a
	vL+0wKfT/Io723kp6wbB2fuCEk4p3qwdtXGeLonLVPMyZriWehkirWqc1UdR15QrZ7QLnqcwkMPV9
	5aNkr78eVqHvSZlqJEfe7vgSG4hK1UWAKMlUoS31qexZl7zlJuKFb2iPu3Bdm3HSVK3iQLWuS978B
	cvV3riTQ==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by desiato.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tJFLd-00000002x1e-0eJC;
	Thu, 05 Dec 2024 17:09:05 +0000
Message-ID: <cf29b196-5376-4fdf-88b5-28b1d0da9c8c@infradead.org>
Date: Thu, 5 Dec 2024 09:08:58 -0800
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
Cc: Doug Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
 Jason Wessel <jason.wessel@windriver.com>,
 Daniel Thompson <danielt@kernel.org>, linux-debuggers@vger.kernel.org,
 kgdb-bugreport@lists.sourceforge.net
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
 <e3e78060-0939-4078-989c-acd7ca1c90d2@infradead.org>
 <20241205090914.h34rhyzhhazas6l4@basti-XPS-13-9310>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20241205090914.h34rhyzhhazas6l4@basti-XPS-13-9310>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit



On 12/5/24 1:09 AM, Sebastian Fricke wrote:
> Greetings!
> 
> On 04.12.2024 15:09, Randy Dunlap wrote:
>>
>>
>> On 12/4/24 3:07 PM, Doug Anderson wrote:
>>> Hi,
>>>
>>> On Wed, Dec 4, 2024 at 2:17 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>>
>>>> Move gdb and kgdb debugging documentation to the dedicated
>>>> debugging directory (Documentation/process/debugging/).
>>>> Adjust the index.rst files to follow the file movement.
>>>> Update location of kgdb.rst in MAINTAINERS file.
>>>>
>>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>>> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
>>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>>> Cc: workflows@vger.kernel.org
>>>> Cc: Jason Wessel <jason.wessel@windriver.com>
>>>> Cc: Daniel Thompson <danielt@kernel.org>
>>>> Cc: Douglas Anderson <dianders@chromium.org>
>>>> Cc: linux-debuggers@vger.kernel.org
>>>> Cc: kgdb-bugreport@lists.sourceforge.net
>>>> ---
>>>>  Documentation/dev-tools/index.rst                                       | 2 --
>>>>  Documentation/{dev-tools => process/debugging}/gdb-kernel-debugging.rst | 0
>>>
>>> After applying your patch and doing `git grep
>>> gdb-kernel-debugging.rst`, I still see several references to the old
>>> location. Those should be updated as part of this patch, right?
>>>
>>>
>>>
>>>>  Documentation/process/debugging/index.rst                               | 2 ++
>>>>  Documentation/{dev-tools => process/debugging}/kgdb.rst                 | 0
>>>
>>> Similarly `git grep kgdb.rst` still has several references to the old location.
>>
>>
>> Thanks. I should have done that.  :(
>>
>>>>  MAINTAINERS                                                             | 2 +-
>>>>  5 files changed, 3 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
>>>> index 3c0ac08b2709..c1e73e75f551 100644
>>>> --- a/Documentation/dev-tools/index.rst
>>>> +++ b/Documentation/dev-tools/index.rst
>>>> @@ -27,8 +27,6 @@ Documentation/dev-tools/testing-overview.rst
>>>>     kmemleak
>>>>     kcsan
>>>>     kfence
>>>> -   gdb-kernel-debugging
>>>> -   kgdb
>>>>     kselftest
>>>>     kunit/index
>>>>     ktap
>>>> diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
>>>> similarity index 100%
>>>> rename from Documentation/dev-tools/gdb-kernel-debugging.rst
>>>> rename to Documentation/process/debugging/gdb-kernel-debugging.rst
>>>> diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
>>>> index f6e4a00dfee3..bc4a816e3d32 100644
>>>> --- a/Documentation/process/debugging/index.rst
>>>> +++ b/Documentation/process/debugging/index.rst
>>>> @@ -12,6 +12,8 @@ general guides
>>>>
>>>>     driver_development_debugging_guide
>>>>     userspace_debugging_guide
>>>> +   gdb-kernel-debugging
>>>> +   kgdb
>>>
>>> Should the list above be kept alphabetical. The list you removed these
>>> entries from was _almost_ alphabetical...
>>
>> Not that I know of.  I'll listen for other opinions though.
> 
> I'd say it is easy enough for us to do, so I'd advocate for making the
> list alphabetical (.. even though I forgot to do that in my initial list 😅)

OK, will do.
Thanks.

-- 
~Randy

