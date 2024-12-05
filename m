Received: from sender4-op-o12.zoho.com (sender4-op-o12.zoho.com [136.143.188.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291231D2B13;
	Thu,  5 Dec 2024 09:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.12
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389784; cv=pass; b=D33ESAmMkuEuLo2sn3aanjsR+n3P0YUc7zd8ugfqenGONd3dgEu4/JhuBNxqjt0Zn8FS5m05uLNMHHB66j2iuBDUYom2IDqVvPObT7Ba7Sb5h6aRxumAGfBcidVSAS5sedBFRHSxIT3GQWD10R6Mwyjwzsa+vTJN+pop58S92cE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389784; c=relaxed/simple;
	bh=BIcamoukIWKD62X+7oLJrqmal41ZW083CnN2oaBTnHo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k0RfOyGAdK2y/NPNfqEftCIBTLNbXIuPFlDJ9uH5M8OMyP1DKThHabcHHjxqRNQnoVLTNZ4HWTjiCipaZWXUTjONTriYgfXhUAzfWnVIR6DLDsm5KZa+g+/PlwaJtAN3dR4dxbb2dmAH9lQWLyHL7sMgVZbbD31SRKkf1jGmx9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b=XYD/7sg9; arc=pass smtp.client-ip=136.143.188.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=sebastian.fricke@collabora.com header.b="XYD/7sg9"
ARC-Seal: i=1; a=rsa-sha256; t=1733389761; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Er6CeTYQDDeVROrLwnqjs+PxF8n2GRe8yVJaSptDGdIlJwTI3kO5De1E7WJIv3tfg1pXIyrfouRXjKxTVFM7yYADolAWmSRQ9R6E0yEX8qmzpNvGAljGm7JIkUVeuTcFjNYU72pYJgrn7oC18uBhiai+fH/MRbNrgqgYjyiw29I=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1733389761; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=C7ZhJiCipFfphTLSB+4f4J1q2VXq4+k/EVCt5zB5QQ0=; 
	b=mN7jUKEB5+5KHk7zIMU7s6jEIU6i5+QRschUqaFF1HaU65pUlLrXasFpzbogkIWqyhqfoeKqaq+0PMX1T80fOiTxitQCspJCHK12RBRXvbesp/4pNfw2Aoknb2/7lYaVS7sWwZvo7KxeIysIOTr0k2hLwRSQ4bJLTGqqDJDKJCo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.fricke@collabora.com;
	dmarc=pass header.from=<sebastian.fricke@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1733389761;
	s=zohomail; d=collabora.com; i=sebastian.fricke@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:Content-Transfer-Encoding:In-Reply-To:Message-Id:Reply-To;
	bh=C7ZhJiCipFfphTLSB+4f4J1q2VXq4+k/EVCt5zB5QQ0=;
	b=XYD/7sg9tCV226y7nsrofaeJj0oVWxiAHL3TnLf54vTXQMZY6xBd96CWlDfk2kU+
	JSNnXbl6GsV1mVDnz4TPVFN/Epv9TjcNS0MzasvJP8SLeWDRY8ZU677YltBSJsCfzw8
	O8TWovrMCGvbvsnWd0FACVsGxVXk8lhSRHYv8XwE=
Received: by mx.zohomail.com with SMTPS id 1733389759360235.43053237025094;
	Thu, 5 Dec 2024 01:09:19 -0800 (PST)
Date: Thu, 5 Dec 2024 10:09:14 +0100
From: Sebastian Fricke <sebastian.fricke@collabora.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Doug Anderson <dianders@chromium.org>, linux-doc@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>, workflows@vger.kernel.org,
	Jason Wessel <jason.wessel@windriver.com>,
	Daniel Thompson <danielt@kernel.org>,
	linux-debuggers@vger.kernel.org,
	kgdb-bugreport@lists.sourceforge.net
Subject: Re: [PATCH] Documentation: move dev-tools debugging files to
 process/debugging/
Message-ID: <20241205090914.h34rhyzhhazas6l4@basti-XPS-13-9310>
References: <20241204221720.66146-1-rdunlap@infradead.org>
 <CAD=FV=WhQFxUNr6vyMVBn9CmZPnnntDP2nH=Tp1Rm=xH+YsE2w@mail.gmail.com>
 <e3e78060-0939-4078-989c-acd7ca1c90d2@infradead.org>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <e3e78060-0939-4078-989c-acd7ca1c90d2@infradead.org>
X-ZohoMailClient: External

Greetings!

On 04.12.2024 15:09, Randy Dunlap wrote:
>
>
>On 12/4/24 3:07 PM, Doug Anderson wrote:
>> Hi,
>>
>> On Wed, Dec 4, 2024 at 2:17 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> Move gdb and kgdb debugging documentation to the dedicated
>>> debugging directory (Documentation/process/debugging/).
>>> Adjust the index.rst files to follow the file movement.
>>> Update location of kgdb.rst in MAINTAINERS file.
>>>
>>> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
>>> Cc: Sebastian Fricke <sebastian.fricke@collabora.com>
>>> Cc: Jonathan Corbet <corbet@lwn.net>
>>> Cc: workflows@vger.kernel.org
>>> Cc: Jason Wessel <jason.wessel@windriver.com>
>>> Cc: Daniel Thompson <danielt@kernel.org>
>>> Cc: Douglas Anderson <dianders@chromium.org>
>>> Cc: linux-debuggers@vger.kernel.org
>>> Cc: kgdb-bugreport@lists.sourceforge.net
>>> ---
>>>  Documentation/dev-tools/index.rst                                       | 2 --
>>>  Documentation/{dev-tools => process/debugging}/gdb-kernel-debugging.rst | 0
>>
>> After applying your patch and doing `git grep
>> gdb-kernel-debugging.rst`, I still see several references to the old
>> location. Those should be updated as part of this patch, right?
>>
>>
>>
>>>  Documentation/process/debugging/index.rst                               | 2 ++
>>>  Documentation/{dev-tools => process/debugging}/kgdb.rst                 | 0
>>
>> Similarly `git grep kgdb.rst` still has several references to the old location.
>
>
>Thanks. I should have done that.  :(
>
>>>  MAINTAINERS                                                             | 2 +-
>>>  5 files changed, 3 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/Documentation/dev-tools/index.rst b/Documentation/dev-tools/index.rst
>>> index 3c0ac08b2709..c1e73e75f551 100644
>>> --- a/Documentation/dev-tools/index.rst
>>> +++ b/Documentation/dev-tools/index.rst
>>> @@ -27,8 +27,6 @@ Documentation/dev-tools/testing-overview.rst
>>>     kmemleak
>>>     kcsan
>>>     kfence
>>> -   gdb-kernel-debugging
>>> -   kgdb
>>>     kselftest
>>>     kunit/index
>>>     ktap
>>> diff --git a/Documentation/dev-tools/gdb-kernel-debugging.rst b/Documentation/process/debugging/gdb-kernel-debugging.rst
>>> similarity index 100%
>>> rename from Documentation/dev-tools/gdb-kernel-debugging.rst
>>> rename to Documentation/process/debugging/gdb-kernel-debugging.rst
>>> diff --git a/Documentation/process/debugging/index.rst b/Documentation/process/debugging/index.rst
>>> index f6e4a00dfee3..bc4a816e3d32 100644
>>> --- a/Documentation/process/debugging/index.rst
>>> +++ b/Documentation/process/debugging/index.rst
>>> @@ -12,6 +12,8 @@ general guides
>>>
>>>     driver_development_debugging_guide
>>>     userspace_debugging_guide
>>> +   gdb-kernel-debugging
>>> +   kgdb
>>
>> Should the list above be kept alphabetical. The list you removed these
>> entries from was _almost_ alphabetical...
>
>Not that I know of.  I'll listen for other opinions though.

I'd say it is easy enough for us to do, so I'd advocate for making the
list alphabetical (.. even though I forgot to do that in my initial list 😅)

>
>Thanks.
>
>-- 
>~Randy
>

Regards,
Sebastian Fricke
