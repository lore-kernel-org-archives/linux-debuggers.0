Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2E50C05027
	for <linux-debuggers@archiver.kernel.org>; Mon, 23 Jan 2023 20:10:55 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232562AbjAWUKz (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 23 Jan 2023 15:10:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44092 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232318AbjAWUKy (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 23 Jan 2023 15:10:54 -0500
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90EB47A9C
        for <linux-debuggers@vger.kernel.org>; Mon, 23 Jan 2023 12:10:53 -0800 (PST)
Received: by mail-pj1-x102d.google.com with SMTP id z4-20020a17090a170400b00226d331390cso12028389pjd.5
        for <linux-debuggers@vger.kernel.org>; Mon, 23 Jan 2023 12:10:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20210112.gappssmtp.com; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0JaPFEvvEd/AGP1xGit60oRzBFE2dEQ2DDWBHaJeiOw=;
        b=Q/A1YMrOwKdxWsqT0YsrDXbu/rQO2KG3R8386/CDENlIZNl4A5otVzbxlC5Fl0Gyu+
         F0bY9hjPkfU2A1ttKSKJb8WsfgGMs0krejWS7/lZW1E9qBJjU87Yaz0KaYpxINzV1cHa
         VdaSvnYT4Fk1uTlNdnlVQgGLkMK+h9SEsRb6qqEFwggdg8Bn3gvhD08rVgntr4Kl01Ie
         Js0fe0btJTYIIFaRgr4RwpDO55qYeLkr5PFi6nmgroUzNVBD+yZJHWBLErPWVrNrJWwq
         ZlY+syxaeEGg6Nus9l8i6eED9ATd6bGyAKCx33BuOuUnBHUBF2AY0irdSTgQJ9ezBfa0
         KAcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0JaPFEvvEd/AGP1xGit60oRzBFE2dEQ2DDWBHaJeiOw=;
        b=6OfyX9JW/ebYq+dusNnQI26IUj6AO0xT9GtOhgUC16/GnVEX1Zd1BqdcuatWGDvihe
         4syAiv2e9gdQtqZdLhOKhP2Lxd7ftiuR998hE+uX+INusBgVQxenp1Emggnhe8ttjvfQ
         ARBzblS8HYlamy80fG2c1M8DpXO3tQs0WrJclQd0il9cUKQkdaIjXjj9/fAe5b4TfpdA
         HQ6/eRYYOZHAFZROIx33ZOAdi6HrNO0rj5IZMT6Is3XcrMVhpnBP8lAuxWg4Te2s65/5
         gQNoPX3mk62LZCsK1vROy+SouFAuuXCjLeYVqcLygjYibIcA6AWJFmoPPEYvdZ+it6ar
         MbwA==
X-Gm-Message-State: AFqh2krYqIBHct1XFoiayskrHdCJytd82RARmziJ7UWeSd/p0mVaQejt
        X6Xpp+bQI58aH8Cv1pY7Fxd41Tum4KK4aI7Z
X-Google-Smtp-Source: AMrXdXuLZd5gsyuwKNKd/40q8jJN1fhvGBzk3aW0LVpLWihokPL9VSbCRssH+5JuNetITWBI+eqixQ==
X-Received: by 2002:a17:902:ce0b:b0:194:9b4e:1c90 with SMTP id k11-20020a170902ce0b00b001949b4e1c90mr29667428plg.57.1674504652357;
        Mon, 23 Jan 2023 12:10:52 -0800 (PST)
Received: from telecaster ([2620:10d:c090:500::5:d1d4])
        by smtp.gmail.com with ESMTPSA id y17-20020a17090322d100b00189b2b8dbedsm82567plg.228.2023.01.23.12.10.51
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Jan 2023 12:10:51 -0800 (PST)
Date:   Mon, 23 Jan 2023 12:10:50 -0800
From:   Omar Sandoval <osandov@osandov.com>
To:     linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, January
 25th
Message-ID: <Y87pyvDebF7YBQTZ@telecaster>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello! The first Linux Kernel Debugging Tools meeting of 2023 is this
Wednesday, January 25th at 11:30 AM Pacific time. We've been having
these for a few years as a forum to discuss development of Linux kernel
debugging tools like drgn, crash, and more. Now that we have this
mailing list, I figured it'd be nice to publicize it more widely. If you
would like to attend, please email me offlist.

The agenda so far is roughly:

- Is there a good way to iterate over all online `struct page`s? See
  https://github.com/osandov/drgn/pull/228
- Pending drgn work
    - Pluggable symbol finder from Stephen
    - Slab helpers from Imran
- Dealing with `DW_OP_entry_value` and `DW_TAG_call_site_parameter`. See
  https://github.com/osandov/drgn/issues/233
- Call for drgn/contrib scripts:
  https://github.com/osandov/drgn/tree/main/contrib

Please reply with anything else you'd like to add to the agenda.

Thanks!
Omar
