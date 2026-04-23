Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9674737C900
	for <linux-debuggers@vger.kernel.org>; Thu, 23 Apr 2026 10:46:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776941197; cv=none; b=mYibSOk3yeJk+xiBKg8WSOUcaFaNosEDetJLzp7fJcD1x+MXfwYjJHyOzNF2BUlW7DlPvHeaZwWJlL4yDLR/IfNUyBru6f3otSz1VUnZntikiHkySBsndfvx/+ZXL2Umqh75vPP8x+tSt/BuuuVn4YwqHj/Kt74YA2uezXzPTJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776941197; c=relaxed/simple;
	bh=tk9qyuLjjaIgrudm3EnnqK9s85oSdlk7t6wa3G46CMU=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F3PDm3CekBJhVfl0NNyDWtpn6mEpInSl3mgL3bBh34JKDGaDepO5et5ypJN4c7Weg0/r0ml6rX+QR9HAZv/6N4hbPX6kIee3DyhmYycBvjDhR/7hv4mNrpLbWUh0tDF8PschbYJmxNSyth4VoPKm3Zy2+syzi5jEs1aq4v/S+84=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JZHJOCQC; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JZHJOCQC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776941193;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type;
	bh=/BXMwVCQOL3bjPCCrgt8PK7ZTnSsaF64ktNvyufYnf8=;
	b=JZHJOCQCs4E/LbLaeu+xa7sMPXE9uXUsgpII/H18tXu7zuzLHwFpmWvHVUzq+KgVZ0xmfl
	wx7d0ipYiMQxs85dJI62jt104wXkhOx8E8tYT8lkB04QqUf+6ypGsJZchImd7xxB9gGmA+
	O0uCkzxV/duVMshSps7tfPkEQWoT7NQ=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-650-eSNs-0E2OYuIlMBIsN5-Iw-1; Thu,
 23 Apr 2026 06:46:32 -0400
X-MC-Unique: eSNs-0E2OYuIlMBIsN5-Iw-1
X-Mimecast-MFC-AGG-ID: eSNs-0E2OYuIlMBIsN5-Iw_1776941191
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 699C418005A8
	for <linux-debuggers@vger.kernel.org>; Thu, 23 Apr 2026 10:46:31 +0000 (UTC)
Received: from wcosta-thinkpadt14gen4.rmtbr.csb (unknown [10.22.80.20])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id C48553000709;
	Thu, 23 Apr 2026 10:46:26 +0000 (UTC)
Date: Thu, 23 Apr 2026 07:46:25 -0300
From: Wander Lairson Costa <wander@redhat.com>
To: linux-debuggers@vger.kernel.org
Subject: [ANNOUNCE] drgn-mcp: natural-language kernel crash dump debugging
 with Claude
Message-ID: <aen3j309MH2ezNhB@wcosta-thinkpadt14gen4.rmtbr.csb>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: mR4lscWBOUchtVZQ3CQTYjnuAbeyU1Dg_bCaeiLMMhs_1776941191
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi all,

I'd like to announce drgn-mcp, an MCP (Model Context Protocol) server that
connects drgn to Claude and other AI assistants, enabling natural-language
debugging of Linux kernel crash dumps.

I wrote this over the past week, so it is still in an early stage, but it is
already useful enough to share. Feedback and suggestions would be very
welcome at this point.

Instead of manually writing drgn Python expressions, you describe what you
want to investigate in plain English -- "what caused this crash?", "show me
what locks task 1234 is holding", "are there any BPF programs attached to
this cgroup?" -- and the AI calls the appropriate drgn tools on your behalf.

The server exposes 54 structured tools covering:

  - Core inspection: crash info, panic message, stack traces, threads
  - Memory analysis: hex dumps, typed reads, address translation, slab/page
    info, dmesg, memory search
  - Kernel subsystems: network devices, mounts, open files, BPF programs
    and maps, IRQs, cgroups, CPU runqueues, locks, timers
  - Data structure traversal: list_head, hlist_head, rbtree, xarray, IDR
  - A general-purpose eval_expression tool for anything not covered above

For anything the structured tools don't cover, eval_expression gives the AI
full access to the drgn Python API and all drgn.helpers.linux.* functions.

Getting started
===============

Prerequisites: Linux, Python 3.12+, uv (https://docs.astral.sh/uv/)

With Claude Code (https://claude.ai/code), add to your .mcp.json:

    {
      "mcpServers": {
        "drgn": {
          "command": "uvx",
          "args": ["--from", "git+https://github.com/walac/drgn-mcp", "drgn-mcp"]
        }
      }
    }

Then just ask Claude to load your vmcore and start investigating:

    "Load the crash dump at /var/crash/vmcore with debug symbols
     from /usr/lib/debug/boot/vmlinux-6.12.0 and tell me what happened."

It works with any MCP-compatible client, not just Claude.

Links
=====

  Repository: https://github.com/walac/drgn-mcp
  License: LGPL-2.1-or-later

I'd appreciate any feedback -- bug reports, feature requests, or suggestions
for additional tools. Issues and contributions are welcome on GitHub.

Thanks,
Wander Lairson Costa

