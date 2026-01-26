Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 778332749C1
	for <linux-debuggers@vger.kernel.org>; Mon, 26 Jan 2026 23:49:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769471371; cv=none; b=HkB/UgVsuWjFQNykN10a3vhnZOFYH4JmBZtQNmSIdgtcSW4ZrBYz5GG+TuViNteC3CgDL5d2fYvtL2SKGSPTXvTr+fC3rJ79I+ib9vjSQtPSSXhKinjSkqDG/ryYNMZXw2U6vVtFU8esocAdfsJ7VlykrUh9DJu+uVDWJWdBd24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769471371; c=relaxed/simple;
	bh=mDdBZN/GN/bcwbaFFVz67HoIlYUXYp0pZYu1pzCgQqk=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Zj7k+dwnnulH6SMseiSWNqQ30pyetIr3CNYBWDAc8A8mSoqE+6V/La3N9Unsz9WP39vfun4wsOPa2nm2VBoymzFxquCCuDi4a9LCpar0RK4mihKtUr8iGjEFPd6U27JQ49zffbqHmGCv9wmBVxSDYnxsESOHFi3S8Gpm6df3AkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=GREPiZYv; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="GREPiZYv"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2ae5283dae8so366820eec.2
        for <linux-debuggers@vger.kernel.org>; Mon, 26 Jan 2026 15:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1769471369; x=1770076169; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=n+HILJ9ceRLkHMEOlKgHA5sp/TFnXMy8oGlJuNrNrH8=;
        b=GREPiZYv/TDBc2wCJO9S6dtBbDU1jv3IGlY2Xrue7U85rf3dqkUzcUoQ6vj2i1VW59
         juS5EDHJCGOhhdHSi3TnAYjZLycNmwJULX4DJkjbMLhU6pnll/ICnej8TWe2b9xjGhTK
         UhF5r5f8GIUgpVAxiUyOdtoBS/Dm9k9M4WK00iTkkHxKP0v/pab0Rtw531z2uE2s3bCK
         6cAiozftxzTZQlcjcViKy0bdq45nbA682u87lATM0Xlg9rT+5sSpuw3jXek+H0Rl0xc2
         X0sYgTKKtCxFiQSemKLbSajcbSMzO58dUfHs0AOg4xZn1iuew+OUM+SEuPc+8m5ox3/4
         Bl7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769471369; x=1770076169;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n+HILJ9ceRLkHMEOlKgHA5sp/TFnXMy8oGlJuNrNrH8=;
        b=Pa0Dc1rLq2Se7/Xc70jtS+JCUli2m4U4JdkCdjUPp/I2rs5cP4n6e24b+ui4O2JOI9
         rfgsrjGVJU0addY5W8F57s4BBQWe74lmcQTfSaPvipEkAOvRelJfm8ZUNSTQheD2RaHT
         CwdBYmSBiNVrlj20aA7sURnJq24XCJ6B0pLmphfAri1wNZZxMZNB7lDsFKV+d0EGIDNq
         081awjaxcQO1nT6lk3y8AsTdnnPw7YE/CC7KzsXymyLIkZHle+x5eWC45XnpkEOfGWF2
         UzmC28cXCc0qAijoYEDcpRp6pYWX5p+ZSlgYZrR4b9yamnN4SHtRJ8IyBh6T5ENz6tjx
         74kQ==
X-Gm-Message-State: AOJu0YxszUXIUPsshVNDX3hZ8VEdol7L8eSwCnZ+tznWTyIA6FgYBTu+
	8FF60PHEyz21dp9jnJCEeBfxPClBM8lMEB3VdaVa/9I0rb4LES2AWM9ugeNuunaP1J/6TGUC6kQ
	a12Ux+/Y=
X-Gm-Gg: AZuq6aJRVLpDglgnSBJgOQqdMCe5V6QGHPM/jaGMeIwdAG81Nv7JRax4d+Z6sNhgANI
	wdtysBeQtp5R5VjrvXtYKZzX4ie+EkwRcVqYkwzqoNvxdPgiJV0hkUL5CzKCNfi3Cha8FZLvqiQ
	4ju4eEfhcee0ebyBh6yI02DxPIttYBhcCE1SW4mj3au3WxSErz2LgRtdSTKjvPV695AK26uM7rX
	jDAKEueTQs19wtOkok724TkX2phaZX8AToqmVkatRYfLOVqnqAUgv83VmOotuRv8yaDBSmvMHu9
	f/Zou2GIH1xE4i0+6MiTMM/5TARmLpPnvNdje5a/ijtPvn819zkVNgJtxPmMvRLUTIAz/hkKGjW
	z8FoUhuCoiUuKLxkHVvWl5j9aPUfSSk8lUUyk+8aQI+KoAdaY1lFRFtkhf8+9Ox6pz4SwP3ldOG
	r4/EU6twOm+P0oX4W6gSd6oHvGveQ=
X-Received: by 2002:a05:7300:caa:b0:2b7:2bf3:ce06 with SMTP id 5a478bee46e88-2b764327d2emr1854114eec.3.1769471369080;
        Mon, 26 Jan 2026 15:49:29 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::1:2e8b])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b73aa08964sm15251356eec.28.2026.01.26.15.49.28
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Jan 2026 15:49:28 -0800 (PST)
Date: Mon, 26 Jan 2026 15:49:27 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, January
 28th
Message-ID: <aXf9h7kERxEANIQf@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is this Wednesday, January
28th at 11:30 AM Pacific time. This meeting is a forum to discuss
development of Linux kernel debugging tools like drgn, crash, and more.

Here is the agenda so far:

- drgn crash compatibility status update: what's left?
  https://github.com/osandov/drgn/issues/507
- Memory searching in drgn status update.
- Dealing with remote/non-ELF kernel debugging in drgn
  (https://github.com/osandov/drgn/pull/587,
  https://github.com/osandov/drgn/issues/591).
- Dealing with address translation loops in drgn
  (https://github.com/osandov/drgn/issues/592,
  https://github.com/osandov/drgn/issues/566).

Also a heads up: I will be out of the office from February 23-March 27.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
