Received: from mail-qt1-f172.google.com (mail-qt1-f172.google.com [209.85.160.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C52B63CC9F4
	for <linux-debuggers@vger.kernel.org>; Thu,  9 Apr 2026 14:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775745708; cv=none; b=eU8z0Em1S1jlHV2WaZtclR9TREI3FRZ0fF5wwNDN1YFCs2MZ/6zQjr2W8IQ6fn2GWR77yDt+cWSBaIxbOcEXLY5DUlg38uT6cRqKfRo0WlMFdJqc0GA1LomZgGQJYYqnO1D3vi61fituajPD6rVJ29sH7JYgo8CKbH7Syedn+j8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775745708; c=relaxed/simple;
	bh=DqfVCkF9c6eft1RwyIiUZrOG1hTIYB+7mgQ3XlYZKe0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Z0r0QEX8/3wpJknhglvorYT5BdGrUIevsj7t6j/s2Ru/36gyK3QvJKcpLSetjRJCdO8qtiOXXpKHI+QR2x614KaZ5bMxp4dorkEonyRWrN4ljV2ybXxLb2CfLgArz9Lzb9zzqbduf7ms6J9xyb8hcXdQSFn8WZPOOnTY95Y5ucM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=szTKJB0U; arc=none smtp.client-ip=209.85.160.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="szTKJB0U"
Received: by mail-qt1-f172.google.com with SMTP id d75a77b69052e-50bbc41677dso12742231cf.0
        for <linux-debuggers@vger.kernel.org>; Thu, 09 Apr 2026 07:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775745707; x=1776350507; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FNep397AIHLQpUcTLnJgj7YuGwAr6qyluIXIaj+5nmQ=;
        b=szTKJB0UlRpYC7t+ovoNkiTd7E6vwL480OK+Y1F0iaRyhCNYDFyf3lDc3owH+zKd0N
         AP3ZwxTMTlSTj4PWbfB9rF7Ew5AD6xdGj6K+BZdlG3JyHJv/D9kMRPlwC3fSArQ2n6YJ
         xFmZUZ+JJZjs4lpXXYaGnaup/IGUanFYS5t6y/ws6ATiq0Ycu6f851AKnPrgfxAEXC/O
         5c4hXRPH3dJ8iOJXFBj08pORf9OCurZQNyVHQUn9YvuS59W5aVGCPWOZ+BCeChoIhgEp
         +0iHjseq9qfAh62ROKidpQDqYxlWlnWyrOsCaQvgZOQvZLx1egWi7nUNuTrKgEcoxW5i
         XHQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775745707; x=1776350507;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=FNep397AIHLQpUcTLnJgj7YuGwAr6qyluIXIaj+5nmQ=;
        b=dETdMIpTs+oDjIUrcEs42FGYkbV2zhkk8k15dD9Flf7OmFkR0dtz79H55ARON0tdA1
         BpScyQpymUZ5jvdP0czDf74LbW5vhADtbwXBzOLTp+mVgdoLK2swcJkT0DV4UREWQvX9
         HuXmQco3eqFW9uBR8OYe0N0wYratA9jzRyXXipt2I2laytLT8iVxcO5sQ4ED3Rp/IBbl
         DdQcfCLYdNYsr/uxB7D59rCSbSW9v4wxIWT9QSLYmE2E39vfNYOsdCXvZ6Vt4SL8tgSP
         FLsikQDXzMl45V3GDlW+N4+08Oq7+pzk2gtYI9clnh8ZIdgagM8YxfN7Y61LO6N74eJB
         wCxA==
X-Gm-Message-State: AOJu0YwQZ6rYfPR+ScGJqr1n/HJXTbSec2fDAAtE8qnAHDVs1jxqE2u/
	QZQn/O7t//0PN5bIUrPICqNI+n/FAm1VCs18avA4qCOiDQK7aOAn1KE1BOCyPeAB
X-Gm-Gg: AeBDievOaAx0tglEthcgC50my3OQxhxdnH91vtk9Zq2IRBda6MBh54iIcnU6VeG53pI
	5uZLIHq+51bghlJN7UFiWhI9En6hF1sEkomad1Dgc6dEwLCcwYWkypq7Bc8pkgHwcFU98pXiKCE
	37C6vDAE5dQ9a4kcKdPK2JOw6WhB4D4t5Ba3qNrU01CEb0sBTwS+qJkQ9l78+6x3BzWI56r9P4s
	5rGjiu+25K4NhFGXhYVCOq2hSZrpoPaV3JgmEukcqDDZVWDcUcEhjh1LNQOaWbjorycgfR+bLyt
	BYxYGacX59STiwdz0bXf9Uo0fTXDoVTAl07n3gbEOOnGspZ3CD/e+RNZX+EHGn8VlMFspz1hBMu
	vQZqbZT/whTTFrvbgipOG8FKNGOG6g9+tcaWbm3NhZe725ltIbUUJEuQQXE51mn+V3c+F0AAx8M
	Jzb1QQ9CQhGSTMly5z2GkusVyTARqgGPIwYL7QQ7gzrwI1uJQnkWF1QgBLczLHFgtJ9KqUkdCry
	KKTjiQ=
X-Received: by 2002:ac8:5c8f:0:b0:509:2579:283e with SMTP id d75a77b69052e-50dc21a7ad0mr54082471cf.28.1775745706691;
        Thu, 09 Apr 2026 07:41:46 -0700 (PDT)
Received: from CW-FL20TJCW03-L.tailb3cd1a.ts.net ([144.121.74.118])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-50db02b281bsm46950641cf.16.2026.04.09.07.41.45
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 09 Apr 2026 07:41:46 -0700 (PDT)
From: Serapheim Dimitropoulos <serapheimd@gmail.com>
X-Google-Original-From: Serapheim Dimitropoulos <sdimitropoulos@coreweave.com>
To: osandov@osandov.com
Cc: linux-debuggers@vger.kernel.org
Subject: Re: Debugging Microconference at Linux Plumbers Conference?
Date: Thu,  9 Apr 2026 10:41:44 -0400
Message-ID: <20260409144144.72399-1-sdimitropoulos@coreweave.com>
X-Mailer: git-send-email 2.52.0
In-Reply-To: <adaxdvQvJX318oy9@telecaster>
References: <adaxdvQvJX318oy9@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Apr 08, 2026 at 12:50:14PM -0700, Omar Sandoval wrote:
> We are gauging interest in hosting another Debugging Microconference at
> Linux Plumbers Conference this year. Topics would focus on common
> challenges people are facing with debugging tooling: collecting and
> analyzing core dumps, doing live analysis, developing more powerful
> debugger features and tools, etc.

I'd be interested in attending and potentially starting a discussion
over a few things that we've been working on at CoreWeave!

Specifically:

(1) Capturing crash dumps with tight memory and space constraints at
    scale

(2) Triaging, deduplicating, and categorizing crash dumps in
    production

(3) We've been experimenting with out-of-band kernel introspection
    (using drgn in a DPU to introspect the host with one-sided RDMA
    ops). Would be cool to see if others have worked on the same or
    similar problems.

Thanks,
Serapheim
