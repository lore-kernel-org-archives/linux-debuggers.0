Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 663A43AA1AF
	for <linux-debuggers@vger.kernel.org>; Tue, 31 Mar 2026 21:14:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774991685; cv=none; b=YRIa1GY+cFna/sHhnLBc1h33ZvjmRnNpP7tsbpqT7qHU5jElOiMMslMTVitUZ9Mh99L5fYROaDgaoSUOLmpk76cQFiwAtZePeNBSHHEOrJRubzNimUqnEozOycMAa85GIk17TLZnrhAqQjD9HbHNgA6A9djo+fug/Wpk8bKdEtw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774991685; c=relaxed/simple;
	bh=eq/BomVLXhLlSIE6kYda0LURr9QOpcbgES99B/IYBTo=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=tucMM/WE9O6CaZ5cQLFyhstFf6mRCseTcNpnc+msr3AJ/cxaZ9RweQ1xGbVw7G20fwk2n8RY0F/pcqx7OqpizeKMWUyyKLQ3WuMf+1fkvfr6PatGER5iwoa7v8/eb1WuaVfiyLuW4QxG1rdFSJEFrhwgXLf0m/TMIWL9713WUeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=jBWcZL6A; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="jBWcZL6A"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-12a77005d69so440095c88.1
        for <linux-debuggers@vger.kernel.org>; Tue, 31 Mar 2026 14:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1774991682; x=1775596482; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eq/BomVLXhLlSIE6kYda0LURr9QOpcbgES99B/IYBTo=;
        b=jBWcZL6A+ON/utUjyvgMUtFy5E1aLIzSl7Kn7FX4vjDnmDJzsMCK5IYVzvEeoGcRQi
         3tRN5Vz9YhnWh9yaJ6jvb4GJRwF/zG3HcFjmdm7T4VYi8/3ThIXGVQT5MUm0GMd+sY7Y
         NiacnUxF8EB6J3UP/MMQfVb3dnq/8LRcKSQ0U7DzZGPq4NOZ1wpof1jqQqd0jBcsop8N
         n6/ax7YsHYKlvpy4lu91AvwMVVce5POwdlS2FQ/PjfhdqSi1/i+vwewkuKkiS5ARGXIH
         DpqIcZxqAheWfhZxXOCeeGKN80+0uJeiHHp01lM+jgj5yMfjW6MWvOC395yXGVx0L62X
         rmBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774991682; x=1775596482;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eq/BomVLXhLlSIE6kYda0LURr9QOpcbgES99B/IYBTo=;
        b=h2v43Kfeqcv4ACUi18YYRYkeTKwWSlShmKI1ztNb+VakFpUTLOTGNeWvHonbjl5mcZ
         sU8738ns/QNdJk2B9aChPazqjjr4e7L5eH+R4/v66Zj/dh9cjgdgFGXlojggCCmyW/Ob
         s3rur7ilEE0VqeRHVih09jQ4aw8fQ27KuFTTPsNBgqm6YHfm82jwfVr2dPlbzTBR7bmk
         FH0eDsEnZlY1sjR4DgDHcdjcWtf4ci92ythWCr999HR4GKlTvH7rDpGVaelvhL0Nkk8x
         dX1eJ0a57jWy5SMtqo4YJJZE5KhgXi1hFjF0ZQ8N8YvwiaAAyVQoe2iBg/VxyLSMkZKx
         eY/w==
X-Gm-Message-State: AOJu0YxhGLMpSpO5FPvgRmh22xJGn1fzVPsFEd97Sp1OEPgGT0LylK05
	1HiJns/Tl+/uIecR2WPVf2FWMCvGxqIyIGsAfE48Y7QTfrbm7EI+KUmr6arBgd51caKMuf6Lp7V
	9YHXp
X-Gm-Gg: ATEYQzyOWPnKM/ZezrIHhmKZsozb7SE9/jGi3YsYeQLvE0dVYkD1/0Iurc+TBsxQMSb
	4GmNTiYstg02heEKVpaNXLDnpZe/isq8GqThHKECWVuqQ718dY8RV4O/dfmqlagPjFJ186hog8h
	zzy/GvAmGRcaCGPMCtgqMcnH42zy7ybnV0AaKPJIqDuarpD9MmZzFf/owjLVIS1zhOq5X5AiWYm
	Io6c5bm1KMbFnysd8bA5hapr5kk232+dXHbIE7N1T6qvHtR7d3aRu89HnMECu72jUKhngZNqjl7
	MOZ8qmeiSmIJmflw2F+OcIIfsAnqAmaqLaJlJCFZON5oAnnuD9imU4s9uFlyQEVDfj8XH+WOQKO
	sPbt+lE8OrXYvFIMdvYbbGpugn/7Wdz0ppdrjWgdodA8sqWhOn1jOezmW5vZanfSBZiT0Qvuvke
	2KvDX3UX36LvefrFgz+1et8yGJpgp+H5mF3Zv8ow==
X-Received: by 2002:a05:7022:698e:b0:11b:862d:8031 with SMTP id a92af1059eb24-12be62e92f4mr331133c88.0.1774991682115;
        Tue, 31 Mar 2026 14:14:42 -0700 (PDT)
Received: from telecaster ([2620:10d:c090:400::5:f0da])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12ac4a0fa8dsm8302880c88.15.2026.03.31.14.14.41
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 31 Mar 2026 14:14:41 -0700 (PDT)
Date: Tue, 31 Mar 2026 14:14:40 -0700
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, April 1st
Message-ID: <acw5QImtSPvTYVZ2@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is tomorrow, April 1st at
11:30 AM Pacific time. This meeting is a forum to discuss development of
Linux kernel debugging tools like drgn, crash, and more.

I was out of the office from the past month, so I would mainly like to
be caught up on what I missed while I was out and share my plans for
what's next for drgn, namely QEMU support and breakpoints.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
