Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D15530C62F
	for <linux-debuggers@vger.kernel.org>; Wed, 27 Aug 2025 21:27:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756330052; cv=pass; b=FfqzdfcFg37ilnmPDj64jFDdr8pkWsiLb5WivX1zhYnErhIkjwISBfJd9bWHrFkIWt5DimytNAtMVqc0ZBxvoGUjBVkWLCcD6nz24uRAnXoAfKntImyJeAVljLMef+JGf0HYGnG/H9WnFd9lyAhFiDdhjqgMsYn+l7vqXwUwVJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756330052; c=relaxed/simple;
	bh=eKEBRAoDZIZnIMVjidhzMguThXalmNkeRZQ6WsvSv/M=;
	h=Date:From:To:Message-ID:In-Reply-To:Subject:MIME-Version:
	 Content-Type; b=Je16tLFMelGuiMC5LOUuW+ZTj7ZSmApS8wrllljpIMtUhVzDRU8atBZKKzwlTe4PpYhIX7b9I2XTmHuFypYZUvGFHR7ST9L9FanGcIUWyS0tHsMFmfrgm+jHYc4A5q1QbkJk3ogtx70Nv+lvQkgjhfB96fgkf35j6cxSqkLmGuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sob.moe; spf=pass smtp.mailfrom=sob.moe; dkim=pass (1024-bit key) header.d=sob.moe header.i=mika@sob.moe header.b=RcsWrjfT; arc=pass smtp.client-ip=103.117.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sob.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sob.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sob.moe header.i=mika@sob.moe header.b="RcsWrjfT"
ARC-Seal: i=1; a=rsa-sha256; t=1756330045; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=IplYmlwfbz4QxdUlhBfgLpcDTMDeNiy8BwhprL0TP0HCz7bLCtoGeZc3Id513M3ooziUGOiK53nLOp38X0w/EnJaMm2/R1sVCSHyUgv7FmCbWeZeOqCkvWs/qj4fMraiSE+ZQlmuHHUHwTdww2DJ0UT7IzGlvHe1U0tv5BQt4Pc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1756330045; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:MIME-Version:Message-ID:Reply-To:Reply-To:Subject:Subject:To:To:Message-Id:Cc; 
	bh=nMFB5vTUiL8svIlRrBQKynXzZ40I+i1oMttrW7jr+Ag=; 
	b=cJXXjlFjW8Stxu/zljboYY36DSarF/fX+/7NIuIRp1RjmAh2LLBfLdOhNmLPm1/OeuYVCbXPSMT8wcHJU9SjADbXf5kj1y7AQLJFBtaOJg8G+W+XmCz8F93qtFvtPOMvGnY3R9hU0mpqqvPFVnXVWvzsJeMi51KNMIgm0LkikJc=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=sob.moe;
	spf=pass  smtp.mailfrom=mika@sob.moe;
	dmarc=pass header.from=<mika@sob.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756330045;
	s=zmail; d=sob.moe; i=mika@sob.moe;
	h=Date:Date:From:From:Reply-To:Reply-To:To:To:Message-ID:In-Reply-To:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Cc;
	bh=nMFB5vTUiL8svIlRrBQKynXzZ40I+i1oMttrW7jr+Ag=;
	b=RcsWrjfT61MuyTG5hNcpvmnLiOAUfwCeCj1XmQpj9D1d4SzZvY+a29wFxsqRxDk5
	Ji9keCBTXbm2RivunL1+zmzw6+AI0tfocLRvoIFc4tw3zf5kbABEh8rFRORkkd9k5Iq
	VZLZfDM6C5w7tSK74xXrJPHr0fHVeAmT/zHwkkk8=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1756330044610796.2469500500854; Thu, 28 Aug 2025 02:57:24 +0530 (IST)
Date: Thu, 28 Aug 2025 00:27:24 +0300
From: mika <mika@sob.moe>
Reply-To: mika@sob.moe
To: "linux-debuggers" <linux-debuggers@vger.kernel.org>
Message-ID: <198ed6dacb0.4a07bf8f49181.4124477810217390203@sob.moe>
In-Reply-To: 
Subject: kdb output is not visible when simpledrmdrmfb is used for fbconsole
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Importance: Medium
User-Agent: Zoho Mail
X-Mailer: Zoho Mail

Hello. I'm using the latest kernel on a few x86_64 systems and I'm experiencing an issue. I want to see the KDB output on a monitor. When I use a real GPU driver such as nouveau, amdgpu or i915, or when I use EFI/VESA fbdev without any DRM driver - in all those cases I can see the debugger's output. But on some systems I really need to use simpledrm (CONFIG_DRM_SIMPLEDRM). And whenever I use it, the KDB output is not visible... Important detail: it all becomes visible after I blindly type 'go' and CPUs leave the kdb NMI handlers.
I tried to change kernel/debug/kdb/kdb_io.c like this (inspired by kernel/panic.c) around the 'c->write()' call:
                 ++oops_in_progress;
+                console_unblank();
                 c->write(c, msg, msg_len);
+                console_flush_on_panic(CONSOLE_FLUSH_PENDING);
                 --oops_in_progress;
But it didn't help, I also added a call to redraw_screen() function of the vt subsystem,but again, nothing changed :(.
I was also able to make sure that the control actually reaches 'c->write()' there ,and 'c' refers to the correct graphical console.
But I can't currently understand what happens there, and why specifically on simpledrm... I viewed vt, fbcon code, added debug printks in some places, edited ...,but none helped.
I believe that simpledrm specific code is under drivers/gpu/drm/sysfb/, but I haven't found anything insightful in it either.
What can be the problem? Thanks.
