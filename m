Received: from sender-of-o51.zoho.in (sender-of-o51.zoho.in [103.117.158.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC9402E9EDF
	for <linux-debuggers@vger.kernel.org>; Wed, 27 Aug 2025 22:22:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=103.117.158.51
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756333343; cv=pass; b=E2A+ezsekSc3n5W4xrFKOJe/bcVQLzzUyHS1xjERDRVDnp4hcJWxr0sw0wmz5c96h/gI2u97PNSX91eTcQrSqQBYCNg+3EPls3yF+eb6JsEKFuW4Hfm+BcgHsFbJPgX6+j3hBIsHDwqJtlnboXMSt6itPYxanRRNNxkuL1wrvL4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756333343; c=relaxed/simple;
	bh=kjbOPRSaV2xvVOzcYBL8M3Z3NWvcAZ8Ff2ssjEcl6YI=;
	h=Date:From:To:Message-ID:In-Reply-To:References:Subject:
	 MIME-Version:Content-Type; b=CFiIKiiuilcSz7OiN5742rYcY/SnqU3Fxc/K1SksUBRdNQPescUnb/ROya/VYUrPHimyG/h38uah9fBaPKj1HWslfP6fJm62SZ0q3r91s70XZc+lIP47S1Ne67k7hQLwCDHDdSEsiGpiOJ34pCi7Oesxo3AH2Ru4hfy7ntclFS4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sob.moe; spf=pass smtp.mailfrom=sob.moe; dkim=pass (1024-bit key) header.d=sob.moe header.i=mika@sob.moe header.b=vqbOlvcW; arc=pass smtp.client-ip=103.117.158.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=sob.moe
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sob.moe
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=sob.moe header.i=mika@sob.moe header.b="vqbOlvcW"
ARC-Seal: i=1; a=rsa-sha256; t=1756333336; cv=none; 
	d=zohomail.in; s=zohoarc; 
	b=dJd2KEAB8uGklXSaBX0FDK0KPKuOYEhIAopW5fXHLMjsf9XOqy3S7KPPsaw56jt4PAnHlr7gwno6x7wHF8uGvvPQ9z3NAwEmU6PUjn7YA/GcmJX9OFJsGZr5FKgcVFn4CQJls7DbKR0P5EYlRm/8AMSatJXH+kXmMO4sVIo52w8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.in; s=zohoarc; 
	t=1756333336; h=Content-Type:Content-Transfer-Encoding:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=lDwwQAzJHNVtzRYHRmK6aR+kEG1AfR57avbgkSBX7Q4=; 
	b=WbwrGrGDlivZOAu568DKxOd9IreHJkj81wgLJqfeMLKJzXiOLQvRhDBlI/GAg6vmlKPSGXAFr+ywUSCL5FRS4dsVaC7K3Y5Kys7kTs4g4wSuYCJ4+xW0T7iagOSxqyErO0Q9GMaZGt169xSSZgrN/PHpkYqB4PvkJJ4AU3K5H4w=
ARC-Authentication-Results: i=1; mx.zohomail.in;
	dkim=pass  header.i=sob.moe;
	spf=pass  smtp.mailfrom=mika@sob.moe;
	dmarc=pass header.from=<mika@sob.moe>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1756333336;
	s=zmail; d=sob.moe; i=mika@sob.moe;
	h=Date:Date:From:From:To:To:Message-ID:In-Reply-To:References:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To:Cc;
	bh=lDwwQAzJHNVtzRYHRmK6aR+kEG1AfR57avbgkSBX7Q4=;
	b=vqbOlvcWXpt/qo4jKrCSLebSKiTUU5wIE2PHgP6yXYFNYFbj1X7f6BNwD7w86ccR
	RiOtaw/JGT68uYehRiy4o8v1jLHYaFk3i+QXUUygthVJVXhmlKxS7YtttNjipUOmwKW
	zNhBM5az1fNAYC2iZx5I9PWEcdng94fqFEJs6zp0=
Received: from mail.zoho.in by mx.zoho.in
	with SMTP id 1756333334823334.39593854982877; Thu, 28 Aug 2025 03:52:14 +0530 (IST)
Date: Thu, 28 Aug 2025 01:22:14 +0300
From: "Elisa K. K." <mika@sob.moe>
To: "linux-debuggers" <linux-debuggers@vger.kernel.org>
Message-ID: <198ed9fe10e.ce3e22852860.5671019816417662607@sob.moe>
In-Reply-To: <198ed6dacb0.4a07bf8f49181.4124477810217390203@sob.moe>
References: <198ed6dacb0.4a07bf8f49181.4124477810217390203@sob.moe>
Subject: Re: kdb output is not visible when simpledrmdrmfb is used for
 fbconsole
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

Corrected bogus full name.


 ---- On Thu, 28 Aug 2025 00:27:24 +0300  mika <mika@sob.moe> wrote --- 
 > Hello. I'm using the latest kernel on a few x86_64 systems and I'm experiencing an issue. I want to see the KDB output on a monitor. When I use a real GPU driver such as nouveau, amdgpu or i915, or when I use EFI/VESA fbdev without any DRM driver - in all those cases I can see the debugger's output. But on some systems I really need to use simpledrm (CONFIG_DRM_SIMPLEDRM). And whenever I use it, the KDB output is not visible... Important detail: it all becomes visible after I blindly type 'go' and CPUs leave the kdb NMI handlers.
 > I tried to change kernel/debug/kdb/kdb_io.c like this (inspired by kernel/panic.c) around the 'c->write()' call:
 >                  ++oops_in_progress;
 > +                console_unblank();
 >                  c->write(c, msg, msg_len);
 > +                console_flush_on_panic(CONSOLE_FLUSH_PENDING);
 >                  --oops_in_progress;
 > But it didn't help, I also added a call to redraw_screen() function of the vt subsystem,but again, nothing changed :(.
 > I was also able to make sure that the control actually reaches 'c->write()' there ,and 'c' refers to the correct graphical console.
 > But I can't currently understand what happens there, and why specifically on simpledrm... I viewed vt, fbcon code, added debug printks in some places, edited ...,but none helped.
 > I believe that simpledrm specific code is under drivers/gpu/drm/sysfb/, but I haven't found anything insightful in it either.
 > What can be the problem? Thanks.
 > 

