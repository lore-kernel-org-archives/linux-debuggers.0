Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 829BD19BD7
	for <linux-debuggers@vger.kernel.org>; Fri, 10 Nov 2023 15:01:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.cz header.i=@suse.cz header.b="dbXfVDjm";
	dkim=permerror (0-bit key) header.d=suse.cz header.i=@suse.cz header.b="kwYuDmhb"
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 120E03A208;
	Fri, 10 Nov 2023 07:01:03 -0800 (PST)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
	by smtp-out2.suse.de (Postfix) with ESMTP id AF96C1F8BB;
	Fri, 10 Nov 2023 15:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1699628461; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DFjs4EJ8cF9+Ldu+6JUHPp89Js3WVWNhjJccu4yYW4A=;
	b=dbXfVDjmv0F1r3cSvNr7UQwKN7T2ctOhVDG0SNYkmEBIsbygBMeDj/rxAAwyAU7RMkp4TV
	n+lhQdLECNLyIGJwHiyP4sn79nNMhflqxrDTgJo3n+qWDcK+Vcu2n23sKL4MMywD0FCTXM
	4CjTzo6GN2vVNTPjiLIaCymFL1Gf1zI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1699628461;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:  content-transfer-encoding:content-transfer-encoding;
	bh=DFjs4EJ8cF9+Ldu+6JUHPp89Js3WVWNhjJccu4yYW4A=;
	b=kwYuDmhbSNR4JPyPHDH6wAyUhpDzyMDakHMflw2V2E6+iynqVUsMO7ahMZAriiiquqlDz/
	/aYTMgFg1hT48oCg==
Received: from localhost.cz (unknown [10.100.229.110])
	by relay2.suse.de (Postfix) with ESMTP id 5A0032D080;
	Fri, 10 Nov 2023 15:01:01 +0000 (UTC)
From: Lukas Hruska <lhruska@suse.cz>
To: linux-debuggers@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Michal Koutny <mkoutny@suse.com>,
	YOSHIDA Masanori <masanori.yoshida.tv@hitachi.com>
Subject: [RFC PATCH 0/4 v1] LPC materials: livedump
Date: Fri, 10 Nov 2023 16:00:53 +0100
Message-ID: <20231110150057.15717-1-lhruska@suse.cz>
X-Mailer: git-send-email 2.42.0
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Quick note
----------

This patchset is primarily here as materials for presentation at the
Linux Plumber Conference. I will appreciate any feedback you can
provide, whether in person at the conference or here. This patch is a
continuation in the development of a long-unupdated patch by YOSHIDA
Masanori. The last version was v3, see [1]


Summary
-------

Linux Kernel currently has a mechanism to create a dump of a whole memory for
further debugging of an observed issue with the help of crashkernel.
Unfortunately, we are unable to do this without restarting the host which causes
a problem in case of having a high availability service running on the system
experiencing some complex issue that cannot be debugged without the complete
memory dump and hypervisor-assisted dumps are not an option on bare metal
setups. For this purpose, there is a live dump mechanism being developed which
was initially introduced by Yoshida Maasanori [1] in 2012. This PoC was already
able to create a consistent image of memory with the support of dumping the data
into a reserved raw block device.


Mechanism overview
------------------

Live Dump is based on Copy-on-write technique. Basically processing is
performed in the following order.
(1) Suspends processing of all CPUs.
(2) Makes pages (which you want to dump) read-only.
(3) Dumps hard-to-handle pages (that cannot fault)
(4) Resumes all CPUs
(5) On page fault, dumps a faulting page.
(6) Finally, dumps the rest of pages that are not updated.

Page fault handler sends a dump request to the queue handled by
"livedump" kthread which is in charge of dumping to disk. If ever the
queue becomes full, livedump simply fails, since livedump's page fault
can never sleep to wait for space.


TODO
----
- Large page support
	Currently livedump can dump only 4K pages, and so it splits all
	pages in kernel space in advance. This may cause big TLB overhead.
 - Other target storage support
	Currently livedump can dump only to block device. Practically,
	dumping to normal file is necessary.
 - Other space/area support
	Currently livedump write-protect only kernel's straight mapping
	area. Pages in vmap area cannot be dumped consistently.
- Other CPU architecture support
	Currently livedump supports only x86-64.
- Testing
	Testbench and measurements to provide guarantees about
	(non)intrusiveness of livedump mechanism under certain conditions.


Summary of changes since 2012 version
-------------------------------------
- rebase for v6.2
- fs/vmcore code modification to be reused by livedump
- memdump output change to ELF format
- crash tool modification not needed anymore
- all loops through pfn's replaced with pagewalk
- 5-level paging support
- multiple bitmaps handling page-faults for correct restoration of PTE's state
- rewrite API from ioctls to sysfs


[1] https://lore.kernel.org/r/20121011055356.6719.46214.stgit@t3500.sdl.hitachi.co.jp/

YOSHIDA Masanori (1):
  livedump: Add memory dumping functionality

Lukas Hruska (3):
  crash/vmcore: VMCOREINFO creation from non-kdump kernel
  livedump: Add write protection management
  livedump: Add tools to make livedump creation easier

 arch/x86/Kconfig                   |  29 ++
 arch/x86/include/asm/wrprotect.h   |  39 ++
 arch/x86/mm/Makefile               |   2 +
 arch/x86/mm/fault.c                |   8 +
 arch/x86/mm/wrprotect.c            | 744 +++++++++++++++++++++++++++++
 fs/proc/vmcore.c                   |  57 +--
 include/linux/crash_dump.h         |   2 +
 kernel/Makefile                    |   1 +
 kernel/crash_core.c                |  10 +-
 kernel/crash_dump.c                |  38 ++
 kernel/livedump/Makefile           |   2 +
 kernel/livedump/core.c             | 262 ++++++++++
 kernel/livedump/memdump.c          | 525 ++++++++++++++++++++
 kernel/livedump/memdump.h          |  32 ++
 kernel/livedump/memdump_trace.h    |  30 ++
 tools/livedump/livedump.sh         |  44 ++
 tools/livedump/livedump_extract.sh |  19 +
 17 files changed, 1803 insertions(+), 41 deletions(-)
 create mode 100644 arch/x86/include/asm/wrprotect.h
 create mode 100644 arch/x86/mm/wrprotect.c
 create mode 100644 kernel/livedump/Makefile
 create mode 100644 kernel/livedump/core.c
 create mode 100644 kernel/livedump/memdump.c
 create mode 100644 kernel/livedump/memdump.h
 create mode 100644 kernel/livedump/memdump_trace.h
 create mode 100755 tools/livedump/livedump.sh
 create mode 100755 tools/livedump/livedump_extract.sh

