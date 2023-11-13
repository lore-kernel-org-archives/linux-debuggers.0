Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA85721A0B
	for <linux-debuggers@vger.kernel.org>; Mon, 13 Nov 2023 15:57:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=brennan.io header.i=stephen@brennan.io header.b="qfbnaShx"
X-Greylist: delayed 904 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Mon, 13 Nov 2023 07:57:11 PST
Received: from sender3-of-o59.zoho.com (sender3-of-o59.zoho.com [136.143.184.59])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4046210E0
	for <linux-debuggers@vger.kernel.org>; Mon, 13 Nov 2023 07:57:11 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699890126; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=HrPrmrRrf//6CIk4YepRreo/lVmYKW+RT6oBkaKNM/1BEMbul08clc8VGYG9bJYoRFM7oJpQh893O5Pg9+svFm0nfssSZpFGIhFSTUgkTRVQqZ5q3lmPxatgLpLpw/OYARLIy+8KrhI18+R8pZgVtYbS7IzSIaQyTCxtlqXy5+8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1699890126; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=uMcoQD+VsMJtnIsS4Ga1Gki+WG1+ZTuz7KkGku+yjnI=; 
	b=THnyoYhUFouEuv1a1ItlhK78Uqm27YJBjBBSRz74fC/AGvumRAvm9+7/2tdJdxB16RzSDN2E6kwTaDqkCU+aG1c09u6X+DYvyA8tRYnFrpHKjvGcaI5o8WjoaFe7cjX+Fe7Vi5VmbJW8MSZmUo7GfZXCf6DKxIX/Wvt3EWaX920=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=brennan.io;
	spf=pass  smtp.mailfrom=stephen@brennan.io;
	dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1699890126;
	s=selector01; d=brennan.io; i=stephen@brennan.io;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=uMcoQD+VsMJtnIsS4Ga1Gki+WG1+ZTuz7KkGku+yjnI=;
	b=qfbnaShx/MSd2RUDZv32ew7R730KUYd9jrH7eUbfC1piQZI36eBZ3xsTK4XE2xXZ
	THmclCUeuXn9vY/r01UBqiGI0j2s33J7QaOL2L34cqHGveO944pLGHCT64o/Mx5sx+n
	mPFSbmsSOK4TdSzDndho2HAYysAB1XO1bQWJ2sVU=
Received: from localhost (12.186.190.1 [12.186.190.1]) by mx.zohomail.com
	with SMTPS id 1699890124951714.6036861802968; Mon, 13 Nov 2023 07:42:04 -0800 (PST)
From: Stephen Brennan <stephen@brennan.io>
To: linux-debuggers@vger.kernel.org
Subject: [LPC] PSAs for kernel debugging MC
Date: Mon, 13 Nov 2023 07:42:03 -0800
Message-ID: <87o7fxzmlw.fsf@brennan.io>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External

Hello speakers and attendees,

Just wanted to let folks know a few announcements to make things run
smoothly. The Debugging MC is Tuesday morning at 9:30 eastern in Salon
B.

If you're a speaker, please upload your slides to the lpc.events site
(same one where you initially submitted your proposal). Simply login,
find your talk on the schedule, go to the detailed view, and there
should be an option in there to upload your slides.

If you have trouble with that, you can email them to me.

Second, for everybody, please join the #kernel-debugging-mc channel on
the lpc.events matrix server. That will also be connected to the BBB
room where all virtual attendees will be chatting, it's the best way to
continue discussions after a talk, or get a hold of in person attendees.

Please send me a message on Matrix or via email if you need.

Thanks,
Stephen
