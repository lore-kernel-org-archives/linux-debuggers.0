Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F95BCD13D2
	for <linux-debuggers@archiver.kernel.org>; Mon, 18 Sep 2023 12:10:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241912AbjIRMJk (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 18 Sep 2023 08:09:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36666 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241885AbjIRMJJ (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 18 Sep 2023 08:09:09 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 530FD100
        for <linux-debuggers@vger.kernel.org>; Mon, 18 Sep 2023 05:08:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695038895;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:in-reply-to:in-reply-to:  references:references;
        bh=GcjX/yqa0XsH/V2A0bXbw5v8EYCuR0cJVt9GrD+omTw=;
        b=X0eevKNvQbca6Ivsilz/hlqpBv0555zVZWyIZ0D0C2F8T4EDFn1ph1DKIQ3M7PWSn6BZ4s
        mbAJ/TyvbTIFtgZBS9kMAeXywWhckbhqxcsoexIcBJSTpLgt/7SDLR8jRhwV6mQiZ5vfFP
        aTqnoeLLyIaTLUaDFNxqgkkYHQ+N/8U=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-540-70VGz_asMWK7KFLCNAXW0g-1; Mon, 18 Sep 2023 08:08:14 -0400
X-MC-Unique: 70VGz_asMWK7KFLCNAXW0g-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id B13DE85A5BD;
        Mon, 18 Sep 2023 12:08:13 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.114])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id B4AEE492B05;
        Mon, 18 Sep 2023 12:08:12 +0000 (UTC)
Date:   Mon, 18 Sep 2023 13:08:10 +0100
From:   Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
        Omar Sandoval <osandov@osandov.com>,
        Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 qemu 3/3] dump: Add qmp argument "reassembled"
Message-ID: <ZQg9qjdMZL4Tt6EN@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230914010315.945705-1-stephen.s.brennan@oracle.com>
 <20230914010315.945705-4-stephen.s.brennan@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20230914010315.945705-4-stephen.s.brennan@oracle.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.10
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Wed, Sep 13, 2023 at 06:03:15PM -0700, Stephen Brennan wrote:
> This can be used from QMP command line as "-R" to mirror the
> corresponding flag for makedumpfile. This enables the kdump_reassembled
> flag introduced in the previous patch.
> 
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>  dump/dump-hmp-cmds.c |  8 +++++++-
>  dump/dump.c          | 12 +++++++++++-
>  hmp-commands.hx      |  7 +++++--
>  qapi/dump.json       | 14 +++++++++++++-
>  4 files changed, 36 insertions(+), 5 deletions(-)

> diff --git a/qapi/dump.json b/qapi/dump.json
> index 4ae1f722a9..9cc7c3ea93 100644
> --- a/qapi/dump.json
> +++ b/qapi/dump.json
> @@ -69,6 +69,18 @@
>  #     to dump all guest's memory, please specify the start @begin and
>  #     @length
>  #
> +# @reassembled: if false (the default), the kdump output formats will use the
> +#     "makedumpfile flattened" variant of the format, which is less broadly
> +#     compatible with analysis tools. The flattened dump can be reassembled
> +#     after the fact using the command "makedumpfile -R". If true, Qemu
> +#     attempts to generate the standard kdump format. This requires a
> +#     seekable file as output -- if the output file is not seekable, then
> +#     the flattened format is still generated. The standard format is more
> +#     broadly compatible with debugging tools, but generating it requires a
> +#     seekable output file descriptor, and could use more system memory due
> +#     to page cache utilization. This should be left unspecified for non-kdump
> +#     output formats.
> +#
>  # @format: if specified, the format of guest memory dump.  But non-elf
>  #     format is conflict with paging and filter, ie.  @paging, @begin
>  #     and @length is not allowed to be specified with non-elf @format
> @@ -89,7 +101,7 @@
>  { 'command': 'dump-guest-memory',
>    'data': { 'paging': 'bool', 'protocol': 'str', '*detach': 'bool',
>              '*begin': 'int', '*length': 'int',
> -            '*format': 'DumpGuestMemoryFormat'} }
> +            '*reassembled': 'bool', '*format': 'DumpGuestMemoryFormat'} }

The 'reassembled' flag is changing the meaning of 3 out of the 5
'format' enum values. IMHO, we should just be adding new formats
instead of changing the meaning of existing formats. It is a shame
we have the current 'kdump' naming prefix, but we're stuck with
that for backwards compat, we need a new prefix. I'd suggest
'kdump-raw'. eg

#
# @DumpGuestMemoryFormat:
#
# An enumeration of guest-memory-dump's format.
#
# @elf: elf format
#
# @kdump-zlib: makedumpfile flattened, kdump-compressed format with zlib-compressed
#
# @kdump-lzo: makedumpfile flattened, kdump-compressed format with lzo-compressed
#
# @kdump-snappy: makedumpfile flattened, kdump-compressed format with snappy-compressed
#
# @kdump-raw-zlib: raw assembled kdump-compressed format with zlib-compressed (since 8.2)
#
# @kdump-raw-lzo: raw assembled kdump-compressed format with lzo-compressed (since 8.2)
#
# @kdump-raw-snappy: raw assembled kdump-compressed format with snappy-compressed (since 8.2)
#
# @win-dmp: Windows full crashdump format, can be used instead of ELF
#     converting (since 2.13)
#
# Since: 2.0
##
{ 'enum': 'DumpGuestMemoryFormat',
  'data': [ 'elf',
            'kdump-zlib', 'kdump-lzo', 'kdump-snappy',
            'kdump-raw-zlib', 'kdump-raw-lzo', 'kdump-raw-snappy',
            'win-dmp' ] }


With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

