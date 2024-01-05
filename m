Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5394D2DF8E
	for <linux-debuggers@vger.kernel.org>; Fri,  5 Jan 2024 19:23:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="idOPDkKH"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id E4BE91A9700;
	Fri,  5 Jan 2024 20:23:42 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1704482623; bh=BcgBcCZa0IbQQ1DHf1ZwYZPwv3lFSyqcOGUHv9fd8xI=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=idOPDkKHs51G9C2+2GkS7O396FZ6yOtMfsnliaJQSr69JQh4MPI7VCW0XbLjeTwju
	 XjqzgLd/dWxnbc82Kg4as6DBUWZ0l5i6FUzez/pbEPFqF7BhUyivAun4AWMoCTta9f
	 ZwY6IVadCxXrTOf55VhU3ZSom0jRMEHHAvfTVe/e/COXCoc0pTMmSG+eCiU4ijAt0E
	 akVF/LF6kDqxmw7exGHxHuhX7u1shOzum1ofnbivpD5dZXWs3grYchRbfM8n3Sxf73
	 J0IitmgO7fRiXzdLZ5bytQ8LobJWRem0nqtCjM5DtbjMARRg5vg1d2rHV6IGIHxzK0
	 q2IyGmiENQNFA==
Date: Fri, 5 Jan 2024 20:23:39 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Omar Sandoval <osandov@osandov.com>, <linux-debuggers@vger.kernel.org>
Subject: Re: Segmentation fault with drgn + libkdumpfile
Message-ID: <20240105202339.09db6ed5@meshulam.tesarici.cz>
In-Reply-To: <8734vb1v8n.fsf@oracle.com>
References: <8734vb1v8n.fsf@oracle.com>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Fri, 05 Jan 2024 10:38:16 -0800
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

> Hi Petr,
> 
> I recently encountered a segmentation fault with libkdumpfile & drgn
> which appears to be related to the cache implementation. I've included
> the stack trace at the end of this message, since it's a bit of a longer
> one. The exact issue occurred with a test vmcore that I could probably
> share with you privately if you'd like. In any case, the reproducer is
> fairly straightforward in drgn code:
> 
> for t in for_each_task(prog):
>     prog.stack_trace(t)
> for t in for_each_task(prog):
>     prog.stack_trace(t)
> 
> The repetition is required, the segfault only occurs on the second
> iteration of the loop. Which, in hindsight, is a textbook sign that the
> issue has to do with caching. I'd expect that the issue is specific to
> this vmcore, it doesn't reproduce on others.
> 
> I stuck that into a git bisect script and bisected the libkdumpfile
> commit that introduced it:
> 
> commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6
> Author: Petr Tesarik <petr@tesarici.cz>
> Date:   Wed Jan 11 22:53:01 2023 +0100
> 
>     Cache: Calculate eprobe in reinit_entry()
> 
>     If this function is called to reuse a ghost entry, the probe list
>     has not been walked yet, so eprobe is left uninitialized.
> 
>     This passed the test case, because the correct old value was left
>     on stack. Modify the test case to poison the stack.
> 
>     Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> 
>  src/kdumpfile/cache.c      |  6 +++++-
>  src/kdumpfile/test-cache.c | 13 +++++++++++++
>  2 files changed, 18 insertions(+), 1 deletion(-)

This looks like a red herring to me. The cache most likely continues in
a corrupted state without this commit, which may mask the issue (until
it resurfaces later).

> I haven't yet tried to debug the logic of the cache implementation and
> create a patch. I'm totally willing to try that, but I figured I would
> send this report to you first, to see if there's something obvious that
> sticks out to your eyes.

No, but I should be able to recreate the issue if I get a log of the
cache API calls:

- cache_alloc() - to know the number of elements
- cache_get_entry()
- cache_put_entry()
- cache_insert()
- cache_discard()
- cache_flush() - not likely after initialization, but...

Petr T

> Thanks!
> Stephen
> 
> 
> #0  0x00007fb9a1ac1ef3 in lzo1x_decompress_safe () from
> /lib64/liblzo2.so.2 #1  0x00007fb9af164151 in diskdump_read_page
> (pio=pio@entry=0x7fff1f5fa760) at diskdump.c:584
> #2  0x00007fb9af16bcd8 in _kdumpfile_priv_cache_get_page
> (pio=0x7fff1f5fa760, fn=0x7fb9af163cd0 <diskdump_read_page>) at
> read.c:69 #3  0x00007fb9af16bc15 in get_page (pio=0x7fff1f5fa760)
>     at
> /home/stepbren/repos/libkdumpfile/src/kdumpfile/kdumpfile-priv.h:1512
> #4  get_page_xlat (pio=pio@entry=0x7fff1f5fa760) at read.c:126 #5
> 0x00007fb9af16be57 in get_page_maybe_xlat (pio=0x7fff1f5fa760) at
> read.c:137 #6  _kdumpfile_priv_read_locked
> (ctx=ctx@entry=0x564a0a9475e0, as=as@entry=KDUMP_KVADDR,
> addr=addr@entry=18446612133360081960,
> buffer=buffer@entry=0x7fff1f5fa917,
> plength=plength@entry=0x7fff1f5fa848) at read.c:169 #7
> 0x00007fb9af16beee in kdump_read (ctx=ctx@entry=0x564a0a9475e0,
> as=KDUMP_KVADDR, addr=addr@entry=18446612133360081960,
> buffer=0x7fff1f5fa917, plength=plength@entry=0x7fff1f5fa848) at
> read.c:196 #8  0x00007fb9a1bc9a8f in drgn_read_kdump (buf=<optimized
> out>, address=18446612133360081960, count=<optimized out>,
> out>offset=<optimized out>, arg=0x564a0a9475e0, physical=<optimized
> out>out>) at ../../libdrgn/kdump.c:73 #9  0x00007fb9a1bb67bd in
> out>out>drgn_memory_reader_read (reader=reader@entry=0x564a0aa3c440,
>     buf=buf@entry=0x7fff1f5fa917, address=<optimized out>,
> count=count@entry=4, physical=physical@entry=false) at
> ../../libdrgn/memory_reader.c:260 #10 0x00007fb9a1bc0160 in
> drgn_program_read_memory (prog=0x564a0aa3c440,
> buf=buf@entry=0x7fff1f5fa917, address=<optimized out>,
> count=count@entry=4, physical=physical@entry=false) at
> ../../libdrgn/program.c:1648 #11 0x00007fb9a1bb6b61 in
> drgn_object_read_reference (obj=0x7fff1f5fab10,
> value=value@entry=0x7fff1f5fa990) at ../../libdrgn/object.c:739 #12
> 0x00007fb9a1bb82c8 in drgn_object_read_value (obj=<optimized out>,
> value=0x7fff1f5fa990, ret=0x7fff1f5fa998) at
> ../../libdrgn/object.c:782 #13 0x00007fb9a1bb8311 in
> drgn_object_value_signed (obj=0x7fff1f5fab10, ret=0x7fff1f5fa9f0) at
> ../../libdrgn/object.c:905 #14 0x00007fb9a1bb8632 in
> drgn_object_is_zero_impl (obj=obj@entry=0x7fff1f5fab10,
> ret=ret@entry=0x7fff1f5faab6) at ../../libdrgn/object.c:1250 #15
> 0x00007fb9a1bb9338 in drgn_object_is_zero
> (obj=obj@entry=0x7fff1f5fab10, ret=ret@entry=0x7fff1f5faab6) at
> ../../libdrgn/object.c:1322 #16 0x00007fb9a1babb13 in c_op_bool
> (obj=0x7fff1f5fab10, ret=0x7fff1f5faab6) at
> ../../libdrgn/language_c.c:3307 #17 0x00007fb9a1bc3471 in
> drgn_get_initial_registers (ret=0x7fff1f5faad0, thread_obj=<optimized
> out>, tid=0, prog=0x564a0aa3c440) at ../../libdrgn/stack_trace.c:631
> out>#18 drgn_get_stack_trace (prog=0x564a0aa3c440, tid=tid@entry=0,
> out>obj=<optimized out>, prstatus=prstatus@entry=0x0,
> out>ret=ret@entry=0x7fff1f5fab88) at ../../libdrgn/stack_trace.c:1091
> #19 0x00007fb9a1bc4726 in drgn_get_stack_trace (ret=0x7fff1f5fab88,
> prstatus=0x0, obj=<optimized out>, tid=0, prog=<optimized out>)
>     at ../../libdrgn/stack_trace.c:1151
> #20 0x00007fb9a1b7fc20 in Program_stack_trace (self=0x564a0aa3c430,
>     args=<optimized out>, kwds=<optimized out>) at
> ../../libdrgn/python/program.c:849 ...
> many more python stack frames :)
> 

