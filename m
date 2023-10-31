Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E491C4332F
	for <linux-debuggers@archiver.kernel.org>; Tue, 31 Oct 2023 20:18:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232108AbjJaUSk (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 31 Oct 2023 16:18:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46732 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232698AbjJaUSj (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 31 Oct 2023 16:18:39 -0400
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65E59102
        for <linux-debuggers@vger.kernel.org>; Tue, 31 Oct 2023 13:18:37 -0700 (PDT)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DD71DC433C8;
        Tue, 31 Oct 2023 20:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
        s=korg; t=1698783517;
        bh=eOWEzrVGT43Yq5DG3XY/9cpTpAHPrkYEepW41L0OedU=;
        h=Date:From:To:Subject:From;
        b=Y/LRYzMwllfUH3InSEGne6LdCS+UHt+wFAaxUM+3CP8igYtWYa3WlBu2iFT/qSH0j
         BnYFCKHRTl1VpDz2ZqBq/v38/FgbKl3QN86RtBqWjMJuAKz+qwgt4Sb8KNG8OB+wqS
         x+gFqPzRz3d3donquDpWE+86IBcJ89MCGXr+cWwg=
Date:   Tue, 31 Oct 2023 16:18:35 -0400
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     linux-debuggers@vger.kernel.org
Subject: PSA: migrating linux-debuggers to new vger infrastructure
Message-ID: <20231031-congenial-phenomenal-millipede-ee7ef7@nitro>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Good day!

I plan to migrate the linux-debuggers@vger.kernel.org list to the new
infrastructure this week. We're still doing it list-by-list to make sure that
we don't run into scaling issues with the new infra.

The migration will be performed live and should not require any downtime.
There will be no changes to how anyone interacts with the list after
migration is completed, so no action is required on anyone's part.

Please let me know if you have any concerns.

Best wishes,
-K
