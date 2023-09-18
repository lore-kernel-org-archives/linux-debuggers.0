Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23467CD37B0
	for <linux-debuggers@archiver.kernel.org>; Mon, 18 Sep 2023 17:44:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230249AbjIRRo0 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 18 Sep 2023 13:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230247AbjIRRo0 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 18 Sep 2023 13:44:26 -0400
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7DCA4DB
        for <linux-debuggers@vger.kernel.org>; Mon, 18 Sep 2023 10:43:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1695059019;
        h=from:from:reply-to:reply-to:subject:subject:date:date:
         message-id:message-id:to:to:cc:cc:mime-version:mime-version:
         content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=fvmHyEcDh7HWxNF4TjADeM2NA9dv7A10KEKhSIbat4c=;
        b=axi5cMMp8v2Dawv9kLiMPdLfUhT+SiL8heAiUfIF3JAyEeWZT7UyR+djKQ81DtLmaTG0Fe
        xXG72e81BiW++qmtLq7YMfRbKPqpcfnXa99rdxFUJxYyzE1JG6gzEWjeeOCmhVoX6OCHBO
        o8NnmQRBAtHovQNuv8DIcbSIxookou8=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-298-Hy0rMP4dOx-2jfW3uGVDqw-1; Mon, 18 Sep 2023 13:43:34 -0400
X-MC-Unique: Hy0rMP4dOx-2jfW3uGVDqw-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 13223800883;
        Mon, 18 Sep 2023 17:43:34 +0000 (UTC)
Received: from redhat.com (unknown [10.42.28.114])
        by smtp.corp.redhat.com (Postfix) with ESMTPS id EA80DC15BB8;
        Mon, 18 Sep 2023 17:43:32 +0000 (UTC)
Date:   Mon, 18 Sep 2023 18:43:30 +0100
From:   Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     qemu-devel@nongnu.org, linux-debuggers@vger.kernel.org,
        =?utf-8?Q?Marc-Andr=C3=A9?= Lureau <marcandre.lureau@gmail.com>,
        Omar Sandoval <osandov@osandov.com>,
        Thomas Huth <thuth@redhat.com>
Subject: Re: [PATCH v2 qemu 3/3] dump: Add qmp argument "reassembled"
Message-ID: <ZQiMQioTYYWQ13Yh@redhat.com>
Reply-To: Daniel =?utf-8?B?UC4gQmVycmFuZ8Op?= <berrange@redhat.com>
References: <20230914010315.945705-1-stephen.s.brennan@oracle.com>
 <20230914010315.945705-4-stephen.s.brennan@oracle.com>
 <ZQg9qjdMZL4Tt6EN@redhat.com>
 <87msxjxu55.fsf@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87msxjxu55.fsf@oracle.com>
User-Agent: Mutt/2.2.9 (2022-11-12)
X-Scanned-By: MIMEDefang 3.1 on 10.11.54.8
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

On Mon, Sep 18, 2023 at 10:34:30AM -0700, Stephen Brennan wrote:
> Daniel P. Berrangé <berrange@redhat.com> writes:
> > #
> > # @DumpGuestMemoryFormat:
> > #
> > # An enumeration of guest-memory-dump's format.
> > #
> > # @elf: elf format
> > #
> > # @kdump-zlib: makedumpfile flattened, kdump-compressed format with zlib-compressed
> > #
> > # @kdump-lzo: makedumpfile flattened, kdump-compressed format with lzo-compressed
> > #
> > # @kdump-snappy: makedumpfile flattened, kdump-compressed format with snappy-compressed
> > #
> > # @kdump-raw-zlib: raw assembled kdump-compressed format with zlib-compressed (since 8.2)
> > #
> > # @kdump-raw-lzo: raw assembled kdump-compressed format with lzo-compressed (since 8.2)
> > #
> > # @kdump-raw-snappy: raw assembled kdump-compressed format with snappy-compressed (since 8.2)
> > #
> > # @win-dmp: Windows full crashdump format, can be used instead of ELF
> > #     converting (since 2.13)
> > #
> > # Since: 2.0
> > ##
> > { 'enum': 'DumpGuestMemoryFormat',
> >   'data': [ 'elf',
> >             'kdump-zlib', 'kdump-lzo', 'kdump-snappy',
> >             'kdump-raw-zlib', 'kdump-raw-lzo', 'kdump-raw-snappy',
> >             'win-dmp' ] }
> 
> Hi Daniel,
> 
> Sure, I'll go ahead and use this approach instead. One question: I see
> that this generates the enumeration DumpGuestMemoryFormat in
> qapi-types-dump.h. I just wanted to double-check if there's any ABI
> considerations for the numbering of this enum? Inserting kdump-raw-* at
> this point would result in 'win-dmp' getting a different numbering, and
> it seems possible that the API/ABI which libvirt uses might depend on
> the enumeration values not changing. E.G. if libvirt is built against
> one version of Qemu and then used with a different one.

The QAPI integer representation of enums is a private internal impl
detail known only to QEMU.

In terms of QMP, the on the wire representation is exclusively string
format, so safe wrt re-ordering for new/old QEMU and new/old libvirt.


In livirt's own public API, if we chose to expose these new formats,
then we have to strictly append after the existing enums constants
in libvirt's header file.

With regards,
Daniel
-- 
|: https://berrange.com      -o-    https://www.flickr.com/photos/dberrange :|
|: https://libvirt.org         -o-            https://fstop138.berrange.com :|
|: https://entangle-photo.org    -o-    https://www.instagram.com/dberrange :|

