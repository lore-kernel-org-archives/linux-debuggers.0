Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D0B8041223
	for <linux-debuggers@vger.kernel.org>; Tue, 14 Nov 2023 14:24:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=brennan.io header.i=stephen@brennan.io header.b="DmEFsWi9"
Received: from sender3-of-o57.zoho.com (sender3-of-o57.zoho.com [136.143.184.57])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE307BB
	for <linux-debuggers@vger.kernel.org>; Tue, 14 Nov 2023 06:24:05 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1699971843; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=WpZPmlIKs0SYyqeHrTfyJoo8ZfQh4jZZyE7Qu7WhCetueE3f90GpcT0O3/7YT4zWSOcZs/NNfSkpGcTQL3+S0swXsW2AISse0ICpIxcxBefNdTtiN91gNbQVjWuBQ2xkD7RDrmvwPDTqnMyH/gCTiWnOCTgbVW1HzOuy7/QmYJs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1699971843; h=Content-Type:Date:Date:From:From:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To:Cc; 
	bh=RNWuiw+7SIgxvsA8G0CR665SVhIg53C5t5g/nmO/KWw=; 
	b=GvzyJaNpWAFteEsAIQ7bNsCEdwAw6hysxerIEaGZAZduU8xOt59HaHuln3VvbHZSf5Mwb0GImoffFazJ7lf7GdGZ9fZGTmIeszwW8rIOn72Vuk4YONHCunHwataYsLAXidTHtiQaa7rhbzPYRimLBCT5pN/tZ06qHlbLX/MPF1k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=brennan.io;
	spf=pass  smtp.mailfrom=stephen@brennan.io;
	dmarc=pass header.from=<stephen@brennan.io>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1699971843;
	s=selector01; d=brennan.io; i=stephen@brennan.io;
	h=From:From:To:To:Subject:Subject:Date:Date:Message-ID:MIME-Version:Content-Type:Message-Id:Reply-To:Cc;
	bh=RNWuiw+7SIgxvsA8G0CR665SVhIg53C5t5g/nmO/KWw=;
	b=DmEFsWi9trBcvgWnHkUXqu+kntFHZvYDSw5n1PBlJp8/4MuJ7iWrpLWLSlDZeif4
	yPpVBgm4OKYWudFmKfvWnKKwayeRwwKxTzv991S5OyWPdFxjmXhk+Btsw03PFOAKpR2
	2ByUKYt7WgScT2u3L2JfqmXH6HTv3XGYLJ+MxuoA=
Received: from localhost (12.186.190.1 [12.186.190.1]) by mx.zohomail.com
	with SMTPS id 1699971841645684.3260936963455; Tue, 14 Nov 2023 06:24:01 -0800 (PST)
From: stephen@brennan.io
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging MC: In under ten minutes
Date: Tue, 14 Nov 2023 06:24:00 -0800
Message-ID: <87leb0za4f.fsf@brennan.io>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain
X-ZohoMailClient: External

Hello folks,

The Linux Kernel Debugging MC is starting at 9:30am EST. If you are at
LPC, you can come to Salon B. If you are not registered, but you'd like
to follow along, you can use the livestream link below:

https://www.youtube.com/watch?v=68EBBgEltXA

Thanks!
Stephen
