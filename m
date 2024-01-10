Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D8E04D580
	for <linux-debuggers@vger.kernel.org>; Wed, 10 Jan 2024 18:03:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="I7SagUL4"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 514811AED2F;
	Wed, 10 Jan 2024 19:03:55 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1704909835; bh=hOJD+BXVy36JjjOxFniqFIuUSnhVxHCkGZ6jSIavKlo=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=I7SagUL44vc2Sjnw8oTsheJZG7o2NYdaAVnwa9/rUiL+zJGSTTHZg9AMJzE5K2mQs
	 Ny3bJOjx7xk9m60kHictgY5iIVaSUKgFDPktzKOC4vJGY5eus47rixel/0ypnrQqeJ
	 heEEEHcgWJ4CQwxEQggORdqbFob6xk4ILBfmpV71Sq/GuEcemtIVdZmpNARifVkeao
	 SWTdB2jN78WsNJi+cPatgcAJG1oCJE8T8FDbmHrUOhrZy9dwMyUJyFuocmj5b8PkC4
	 CoaagsuiGzbb8C/wIeig5B9VJVNphiggp3RC/5tXVSdJ1GuSOT8j2ioH4gPXjZdBfJ
	 h7N8X8i36GzYw==
Date: Wed, 10 Jan 2024 19:03:54 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Subject: Re: Segmentation fault with drgn + libkdumpfile
Message-ID: <20240110190354.0ff56adc@meshulam.tesarici.cz>
In-Reply-To: <20240110144928.19010b9a@meshulam.tesarici.cz>
References: <8734vb1v8n.fsf@oracle.com>
	<20240105202339.09db6ed5@meshulam.tesarici.cz>
	<87zfxjzbuc.fsf@oracle.com>
	<20240108214008.32f807ee@meshulam.tesarici.cz>
	<20240109100609.4e956beb@meshulam.tesarici.cz>
	<87sf36yni8.fsf@oracle.com>
	<20240110093600.61005acd@meshulam.tesarici.cz>
	<20240110144928.19010b9a@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Wed, 10 Jan 2024 14:49:28 +0100
Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:

> On Wed, 10 Jan 2024 09:36:00 +0100
> Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
>=20
> > On Tue, 09 Jan 2024 17:40:15 -0800
> > Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
> >=20
> > > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:
> > >  =20
> > > > On Mon, 8 Jan 2024 21:40:08 +0100
> > > > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
> > > >   =20
> > > >> On Fri, 05 Jan 2024 13:53:15 -0800
> > > >> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
> > > >>    =20
> > > >> > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:     =20
> > > >> > > On Fri, 05 Jan 2024 10:38:16 -0800
> > > >> > > Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
> > > >> > >       =20
> > > >> > >> Hi Petr,
> > > >> > >>=20
> > > >> > >> I recently encountered a segmentation fault with libkdumpfile=
 & drgn
> > > >> > >> which appears to be related to the cache implementation. I've=
 included
> > > >> > >> the stack trace at the end of this message, since it's a bit =
of a longer
> > > >> > >> one. The exact issue occurred with a test vmcore that I could=
 probably
> > > >> > >> share with you privately if you'd like. In any case, the repr=
oducer is
> > > >> > >> fairly straightforward in drgn code:
> > > >> > >>=20
> > > >> > >> for t in for_each_task(prog):
> > > >> > >>     prog.stack_trace(t)
> > > >> > >> for t in for_each_task(prog):
> > > >> > >>     prog.stack_trace(t)
> > > >> > >>=20
> > > >> > >> The repetition is required, the segfault only occurs on the s=
econd
> > > >> > >> iteration of the loop. Which, in hindsight, is a textbook sig=
n that the
> > > >> > >> issue has to do with caching. I'd expect that the issue is sp=
ecific to
> > > >> > >> this vmcore, it doesn't reproduce on others.
> > > >> > >>=20
> > > >> > >> I stuck that into a git bisect script and bisected the libkdu=
mpfile
> > > >> > >> commit that introduced it:
> > > >> > >>=20
> > > >> > >> commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6
> > > >> > >> Author: Petr Tesarik <petr@tesarici.cz>
> > > >> > >> Date:   Wed Jan 11 22:53:01 2023 +0100
> > > >> > >>=20
> > > >> > >>     Cache: Calculate eprobe in reinit_entry()
> > > >> > >>=20
> > > >> > >>     If this function is called to reuse a ghost entry, the pr=
obe list
> > > >> > >>     has not been walked yet, so eprobe is left uninitialized.
> > > >> > >>=20
> > > >> > >>     This passed the test case, because the correct old value =
was left
> > > >> > >>     on stack. Modify the test case to poison the stack.
> > > >> > >>=20
> > > >> > >>     Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> > > >> > >>=20
> > > >> > >>  src/kdumpfile/cache.c      |  6 +++++-
> > > >> > >>  src/kdumpfile/test-cache.c | 13 +++++++++++++
> > > >> > >>  2 files changed, 18 insertions(+), 1 deletion(-)       =20
> > > >> > >
> > > >> > > This looks like a red herring to me. The cache most likely con=
tinues in
> > > >> > > a corrupted state without this commit, which may mask the issu=
e (until
> > > >> > > it resurfaces later).       =20
> > > >> >=20
> > > >> > I see, that makes a lot of sense.
> > > >> >      =20
> > > >> > >> I haven't yet tried to debug the logic of the cache implement=
ation and
> > > >> > >> create a patch. I'm totally willing to try that, but I figure=
d I would
> > > >> > >> send this report to you first, to see if there's something ob=
vious that
> > > >> > >> sticks out to your eyes.       =20
> > > >> > >
> > > >> > > No, but I should be able to recreate the issue if I get a log =
of the
> > > >> > > cache API calls:
> > > >> > >
> > > >> > > - cache_alloc() - to know the number of elements
> > > >> > > - cache_get_entry()
> > > >> > > - cache_put_entry()
> > > >> > > - cache_insert()
> > > >> > > - cache_discard()
> > > >> > > - cache_flush() - not likely after initialization, but...     =
  =20
> > > >> >=20
> > > >> > I went ahead and logged each of these calls as you suggested, I =
tried to
> > > >> > log them at the beginning of the function call and always includ=
e the
> > > >> > cache pointer, cache_entry, and the key. I took the resulting lo=
g and
> > > >> > filtered it to just contain the most recently logged cache prior=
 to the
> > > >> > crash, compressed it, and attached it. For completeness, the pat=
ch
> > > >> > I used is below (applies to tip branch 8254897 ("Merge pull requ=
est #78
> > > >> > from fweimer-rh/c99")).
> > > >> >=20
> > > >> > I'll also see if I can reproduce it based on the log.     =20
> > > >>=20
> > > >> Thank you for the log. I haven't had much time to look at it, but =
the
> > > >> first line is a good hint already:
> > > >>=20
> > > >> 0x56098b68c4c0: cache_alloc(1024, 0)
> > > >>=20
> > > >> Zero size means the data pointers are managed by the caller, so th=
is
> > > >> must be the cache of mmap()'ed segments. That's the only cache whi=
ch
> > > >> installs a cleanup callback with set_cache_entry_cleanup(). There =
is
> > > >> only one call to the cleanup callback for evicted entries in cache=
.c:
> > > >>=20
> > > >> 		/* Get an unused cached entry. */
> > > >> 		if (cs->nuprobe !=3D 0 &&
> > > >> 		    (cs->nuprec =3D=3D 0 || cache->nprobe + bias > cache->dprobe=
))
> > > >> 			evict =3D evict_probe(cache, cs);
> > > >> 		else
> > > >> 			evict =3D evict_prec(cache, cs);
> > > >> 		if (cache->entry_cleanup)
> > > >> 			cache->entry_cleanup(cache->cleanup_data, evict);
> > > >>=20
> > > >> The entries can be evicted from the probe partition or from the pr=
ecious
> > > >> partition. This might be relevant. Please, can you re-run and log =
where
> > > >> the evict entry comes from?   =20
> > > >
> > > > I found some time this morning, and it wouldn't help. Because of a =
bug
> > > > in fcache_new(), the number of elements in the cache is big enough =
that
> > > > cache entries are never evicted in your case. It's quite weird to h=
it a
> > > > cache metadata bug after elements have been inserted. FWIW I am not
> > > > able to reproduce the bug by replaying the logged file read pattern.
> > > >
> > > > Since you have a reliable reproducer, it cannot be a Heisenbug. But=
 it
> > > > could be caused by the other cache - the cache of decompressed page=
s.
> > > > Do you know for sure that lzo1x_decompress_safe() crashes while try=
ing
> > > > to _read_ from the input buffer, and not while trying to _write_ to=
 the
> > > > output buffer?   =20
> > >=20
> > > Hi Petr,
> > >=20
> > > Sorry for the delay here, I got pulled into other issues and am trying
> > > to attend to all my work in a round-robin fashion :) =20
> >=20
> > Hi Stephen,
> >=20
> > that's fine, I also work on this only as time permits. ;-)
> >=20
> > > The fault is definitely in lzo1x_decompress_safe() *writing* to addre=
ss
> > > 0. I fetched debuginfo for all the necessary libraries and we see the
> > > following stack trace:
> > >=20
> > > %<-----------------------
> > > #0  0x00007fcd9adddef3 in lzo1x_decompress_safe (in=3D<optimized out>,
> > >     in_len=3D<optimized out>, out=3D0x0, out_len=3D0x7ffdee2c1388, wr=
kmem=3D<optimized out>)
> > >     at src/lzo1x_d.ch:120
> > > #1  0x00007fcd9ae25be1 in diskdump_read_page (pio=3D0x7ffdee2c1590) a=
t diskdump.c:584
> > > #2  0x00007fcd9ae32d4d in _kdumpfile_priv_cache_get_page (pio=3D0x7ff=
dee2c1590,
> > >     fn=3D0x7fcd9ae257ae <diskdump_read_page>) at read.c:69
> > > #3  0x00007fcd9ae25e44 in diskdump_get_page (pio=3D0x7ffdee2c1590) at=
 diskdump.c:647
> > > #4  0x00007fcd9ae32be0 in get_page (pio=3D0x7ffdee2c1590)
> > >     at /home/stepbren/repos/libkdumpfile/src/kdumpfile/kdumpfile-priv=
.h:1512
> > > #5  0x00007fcd9ae32ed4 in get_page_xlat (pio=3D0x7ffdee2c1590) at rea=
d.c:126
> > > #6  0x00007fcd9ae32f22 in get_page_maybe_xlat (pio=3D0x7ffdee2c1590) =
at read.c:137
> > > #7  0x00007fcd9ae32fb1 in _kdumpfile_priv_read_locked (ctx=3D0x55745b=
fca8f0,
> > >     as=3DKDUMP_KVADDR, addr=3D18446612133360081960, buffer=3D0x7ffdee=
2c17df,
> > >     plength=3D0x7ffdee2c1698) at read.c:169
> > > #8  0x00007fcd9ae330dd in kdump_read (ctx=3D0x55745bfca8f0, as=3DKDUM=
P_KVADDR,
> > >     addr=3D18446612133360081960, buffer=3D0x7ffdee2c17df, plength=3D0=
x7ffdee2c1698)
> > >     at read.c:196
> > > #9  0x00007fcd9afb0cc4 in drgn_read_kdump (buf=3D0x7ffdee2c17df,
> > >     address=3D18446612133360081960, count=3D4, offset=3D1844661213336=
0081960,
> > >     arg=3D0x55745bfca8f0, physical=3Dfalse) at ../../libdrgn/kdump.c:=
73
> > > %<-----------------------
> > >=20
> > > In frame 1 where we are calling the decompressor:
> > >=20
> > > %<-----------------------
> > > (gdb) frame 1
> > > #1  0x00007fcd9ae25be1 in diskdump_read_page (pio=3D0x7ffdee2c1590) a=
t diskdump.c:584
> > > 584                     int ret =3D lzo1x_decompress_safe(fch.data, p=
d.size,
> > > (gdb) list
> > > 579                     if (ret !=3D KDUMP_OK)
> > > 580                             return ret;
> > > 581             } else if (pd.flags & DUMP_DH_COMPRESSED_LZO) {
> > > 582     #if USE_LZO
> > > 583                     lzo_uint retlen =3D get_page_size(ctx);
> > > 584                     int ret =3D lzo1x_decompress_safe(fch.data, p=
d.size,
> > > 585                                                     pio->chunk.da=
ta,
> > > 586                                                     &retlen,
> > > 587                                                     LZO1X_MEM_DEC=
OMPRESS);
> > > 588                     fcache_put_chunk(&fch);
> > > (gdb) p retlen
> > > $7 =3D 0 =20
> >=20
> > This is a bit weird. Looking at liblzo sources, it seems to me that
> > the output length is not changed until right before returning from
> > lzo1x_decompress_safe().
> >=20
> > > (gdb) p pio->chunk.data
> > > $8 =3D (void *) 0x0 =20
> >=20
> > OK, here's our immediate root cause. ;-)
> >=20
> > > (gdb) p fch.data
> > > $9 =3D (void *) 0x7fcd7cc33da4 =20
> >=20
> > This looks sane.
> >=20
> > > (gdb) p pd.size
> > > $10 =3D 816 =20
> >=20
> > This also looks sane.
> >=20
> > > %<-----------------------
> > >=20
> > > As far as I can tell, pio->chunk.data comes directly from the
> > > cache_get_page() function in frame 2:
> > >=20
> > > %<-----------------------
> > > (gdb) up
> > > #2  0x00007fcd9ae32d4d in _kdumpfile_priv_cache_get_page (pio=3D0x7ff=
dee2c1590,
> > >     fn=3D0x7fcd9ae257ae <diskdump_read_page>) at read.c:69
> > > 69              ret =3D fn(pio);
> > > (gdb) list
> > > 64              pio->chunk.data =3D entry->data;
> > > 65              pio->chunk.embed_fces->ce =3D entry;
> > > 66              if (cache_entry_valid(entry))
> > > 67                      return KDUMP_OK;
> > > 68
> > > 69              ret =3D fn(pio);
> > > 70              mutex_lock(&ctx->shared->cache_lock);
> > > 71              if (ret =3D=3D KDUMP_OK)
> > > 72                      cache_insert(pio->chunk.embed_fces->cache, en=
try);
> > > 73              else
> > > (gdb) p *entry
> > > $11 =3D {key =3D 1045860353, state =3D cs_precious, next =3D 626, pre=
v =3D 626, refcnt =3D 1,
> > >   data =3D 0x0} =20
> >=20
> > The key (0x3e569000 | ADDRXLAT_MACHPHYSADDR) corresponds to the
> > requested virtual address 0xffff88003e569c28.
> >=20
> > > (gdb) p *pio
> > > $12 =3D {ctx =3D 0x55745bfca8f0, addr =3D {addr =3D 1045860352, as =
=3D ADDRXLAT_MACHPHYSADDR},
> > >   chunk =3D {data =3D 0x0, nent =3D 1, {embed_fces =3D {{data =3D 0xf=
fff880ff1470788,
> > >           len =3D 140728599320032, ce =3D 0x55745c1003d8, cache =3D 0=
x55745c0fb540}, {
> > >           data =3D 0x55745bfd42f0, len =3D 140728599320112,
> > >           ce =3D 0x7fcd9ae330ef <kdump_read+102>, cache =3D 0xffff880=
03e569c28}},
> > >       fces =3D 0xffff880ff1470788}}}
> > > %<----------------------- =20
> >=20
> >=20
> > Looking at pio->chunk->embed_fces->ce, struct cache_entry is at
> > 0x55745c1003d8. Assuming that sizeof(struct cache_entry) =3D=3D 32 on y=
our
> > system, this is element 626 in the cache entry array. The next and
> > prev indices are also 626, which looks good, because cache->ninflight
> > is 1, so this is the only element in the (circular) in-flight list.
> >=20
> > Since state is cs_precious, but the data was discarded, this cache
> > entry has just been recovered from a ghost partition, evicting another
> > entry, and _that_ entry had a NULL data pointer.
> >=20
> > It would be really helpful if I could get the log for this cache
> > instead of the one you posted earlier.
>=20
> Let's recap:
>=20
> 1. Data indicates that a reused ghost entry has a NULL data pointer.
> 2. Reverting commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6 masks the is=
sue.
>=20
> My conclusion is that the data pointer was taken from an entry in the
> unused partition. This partition is empty, except when the cache is
> new, or after calling cache_discard(). Given the statistic counter
> values, the latter is the case here,
>=20
> I think I found the bug: reinit_entry() finds the unused partition by
> skipping over the ghost probe partition, but if the target itself is a
> reused ghost probe entry, cache->ngprobe was already decremented in
> get_ghost_or_missed_entry().
>=20
> I'm going to write a test case and fix.

I was able to write a test case for the NULL data pointer. The bug
should be fixed by commit e63dab40c8cefdfc013dc57915de9852dbb283e4.

Stephen, can you rebuild and verify with your dump file that this was
indeed the same bug?

Petr T
