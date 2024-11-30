Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 854BE1C6A3
	for <linux-debuggers@vger.kernel.org>; Sat, 30 Nov 2024 08:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732954003; cv=none; b=USCSmlKWnZyrrLVJix6DUuoHgBeCSP/Zon07NYet/UnX6EIUvr+iPnuC+85Eu//cSExIgq4BaS0BPbO1VPIhkVLMaRvqyu/H63huds12XgZVgDu+DzgLuW9lqiQZRpRCUJdFDcC2BZm0x+wz9nLOutJfnBdczWlSTp1zo4zGDp0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732954003; c=relaxed/simple;
	bh=PLfSw6sgZs37RDwQJs6BMQjYcaACTD2G6dEgB6wtNC0=;
	h=Message-ID:Date:MIME-Version:To:From:Subject:Content-Type; b=PJhlMj2AZVRYIRmsr3zoCQsp9QIq4BjKWZHx1oHzmlTgRQQYGR8/tqTIPbbqZFWO1mPeijxHFFVD/po/vV0ES4eFi9oyGsEiy/KQuKiLahElmzsryap2YVa4vX625eEZNFh4lg4CxDkq92jUXGppQgRk+zaRu9ncih2Y0OeENy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=RzBLn2Mn; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="RzBLn2Mn"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	Subject:From:To:MIME-Version:Date:Message-ID:Sender:Reply-To:Cc:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=blAgKdtpaRZR8Wvykd2i5gQxzHX7+cl48gESeTGnNvk=; b=RzBLn2Mnk/aTONKeI0jYo6kijE
	HJdxuVOrx6TmZSR/bZa36JVT3zdfPUQvlmCJSwfYVyTtMJmRg1mmq01Opi7RSR6Y6Vy9EKMP6ABcB
	VGw2k4lQSRvBompRRssFnmKAdAjDNKqB9fs1gBcVfKKGa0tY09gMCnEclaz1ngChyPtNq7YsVn/sa
	URABBbpsAcZkmThYFznpXx9kyabREnE+1rJ/yDKTjeBrtfKsDS3D4g2/RC1O8a6WrG95zmygUfUOZ
	cDdnVajgYVgAOQYD6+A/0hMuJE7ofLMiZlfaa5sg/RvVSIUlGxcL/jhs6rtXswTjy1134MnpVyZ2s
	yQM7qvAg==;
Received: from [50.53.2.24] (helo=[192.168.254.17])
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1tHIUu-00000005GKC-1Qxq
	for linux-debuggers@vger.kernel.org;
	Sat, 30 Nov 2024 08:06:38 +0000
Message-ID: <63e50929-6591-4931-8db0-4877b0899425@infradead.org>
Date: Sat, 30 Nov 2024 00:06:32 -0800
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: linux-debuggers@vger.kernel.org
From: Randy Dunlap <rdunlap@infradead.org>
Subject: dedicated kernel docum. directory for Debug
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi,

There is now a dedicated kernel debuggers/debugging sub-directory
(just added during the v6.12++ merge window):
  Documentation/process/debugging/.

There is currently only a little debugger/debugging documentation there
but if any of you know something that should be added there, please don't
hesitate to do so. (speaking for myself only)

thanks.
-- 
~Randy

