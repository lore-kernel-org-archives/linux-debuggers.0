Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD3117BD5
	for <linux-debuggers@vger.kernel.org>; Mon, 22 Jul 2024 20:07:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721678835; cv=none; b=ShEFcNQ5OL09h5qwJU2D9R45Zp2d9Z8VIgyEf1J+27WA8IAg/+8hoaYxsQwO8mx4O9lv+3bKWb8oxfMa7S1u6oJRWsemX4dbCxdeMPC1flK/7NRcthYHs/LTOeGQmp4mmwRj8PM47mPHW926PxZC319IQFAVqUJWL8G8K/2dp0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721678835; c=relaxed/simple;
	bh=p6Ue6b6XoBATAkWEyyQF7Fxrn2vUhDz3SXdIfurmSZY=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TSb9Ez+AppiyQt1sGkidu34FjhRna8BRzqANzo26dzFnGLGYvB7E5ZdxMW9glz2erw+LDMR0pTC45z7NRFxi1rzHQddLrqAqRC6xZ9t4yPrijauZZPdttofUL9F8gXcyk2VUwmhlVjx0zy3BnlaDeNUw0T4yxvE8HBIdqrlQQG0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=kErQ8Btm; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="kErQ8Btm"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1fc60c3ead4so30905515ad.0
        for <linux-debuggers@vger.kernel.org>; Mon, 22 Jul 2024 13:07:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1721678833; x=1722283633; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=du+IDGx0Uhe7WqZPSdUL3SLTsDar3QkJuT1qth08u14=;
        b=kErQ8BtmuvaAnJk1Dty1dDXJewuT/nvqQj3HqBSDCQIWft3R7VrbTHbun2XhHdg+pF
         tl2l/z+u5ko96IQ0+NqwL5t57foeV4uKXhLHYgLmA4RKNEmecGaVDFIMv8Tu4c+3Aixs
         hTbROR+Vw7RNjCw4KG57AiGZ8EjcYRBt72X/3KSSXol9ba2/4ESOgAx73KeeF0P1ch2c
         Vadz/fcBH2OSXR1RfWsV4ZrrdxvpmfyL8A3+CulWyhllGt5l3QJmevob6Tq0nRBkg9mp
         3agKz76aCY38mUESd0JBwPhNLzIUYPe0K4QuZoqojPcn6a6jLzjTbwvjsUewFjuof7uU
         pLOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721678833; x=1722283633;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=du+IDGx0Uhe7WqZPSdUL3SLTsDar3QkJuT1qth08u14=;
        b=GUvNxAYolZoNLjNZsVzq0S7JJsQEtYH6ONftTQUSwgZKkNZSQGYzLcXL/V8SGKbCDm
         3jQLJryleb9tB3FqOQKesXd2NLjPIFJXcJvweDPFV+bYbZt5bRWSx6351G2Bo9D4dkSj
         U+z3gr75CyggRNy30EiRi3MZgLKy8IHIga0xA+lOCFBZ6lY3/MiIQlI7zRr2I8pKugG0
         H8f1CNwmqedSqI69o6wBnaPWzCscKVUwxChZ5WU74pbwCQP5knzzgStTb0jv+xrPsmCO
         4bUH996OChWbIbsL2RGpks9Wgz7+yt1OGMpPEAGg3GkKiSiWB31gahVkxoctXtGqbhwL
         66Ig==
X-Gm-Message-State: AOJu0YxRUq5gNd46c4PIPEYScRn+elXDklWEJeCOcI3EbQSQzODaRG06
	mVHHC38WXa5ojphevdmiZMkfIb06BqdVq+BmYWEQ7uDm0YsuM5GEoIrEPB7qoaG2OJOgTH4gOTl
	d
X-Google-Smtp-Source: AGHT+IHcSxcAXZnsH/upWr9h7n/bzvPYRUltUmPE+NcWmPW8BhUG10DaLyEHTh4ZeABiyk398IdWLA==
X-Received: by 2002:a17:902:ec89:b0:1fd:ae10:722b with SMTP id d9443c01a7336-1fdae1073afmr21493845ad.63.1721678832586;
        Mon, 22 Jul 2024 13:07:12 -0700 (PDT)
Received: from telecaster.dhcp.thefacebook.com ([2620:10d:c090:400::5:bd9e])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f257454sm59264655ad.5.2024.07.22.13.07.11
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jul 2024 13:07:12 -0700 (PDT)
Date: Mon, 22 Jul 2024 13:07:10 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, July 24th
Message-ID: <Zp677k2JMqpNLvKi@telecaster.dhcp.thefacebook.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is this Wednesday, July
24th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- debuginfod improvements for Linux kernel debug info
  (https://lore.kernel.org/linux-debuggers/cover.1721413308.git.osandov@fb.com/T/#u).
- Stack traces from threads stuck in an NMI
  (https://github.com/osandov/drgn/issues/404,
  https://lore.kernel.org/all/20240715232052.73eb7fb1@imladris.surriel.com/T/#u).
- s390x KERNELOFFSET breakage
  (https://lore.kernel.org/linux-debuggers/ZpT0loUJ4KdabiCF@li-008a6a4c-3549-11b2-a85c-c5cc2836eea2.ibm.com/T/).

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
