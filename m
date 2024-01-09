Received: from bee.tesarici.cz (bee.tesarici.cz [77.93.223.253])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9774F2E842
	for <linux-debuggers@vger.kernel.org>; Tue,  9 Jan 2024 09:06:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tesarici.cz
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tesarici.cz header.i=@tesarici.cz header.b="VjQ0PuJU"
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by bee.tesarici.cz (Postfix) with ESMTPSA id 9108E1ABE42;
	Tue,  9 Jan 2024 10:06:10 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
	t=1704791170; bh=oCEEUPHo4SU5jl0X/hAGnjpu/xBYI8M0zg+H4Rix4qg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=VjQ0PuJUU6Fw/em5M1bOkSuypjSXeXzqaYFPNaOE3rUPBnCY0A4pmzpdy8TnU3/kc
	 Rbj4gQkMZYLZFH4yl2CIJBA1EG1x1pvfOTLp3RkzHGJHUueLF/zediAAy0qKnsyU5P
	 tu6el8/IyDi+ltTVyXaMXzsJ52lKt6GAoW9swu3xXD1/0F5fRjzDM2FAu+QzKT7Gbz
	 /VRCuMPPQ62+D751PCzG2pWcztAa/iaY84utEtwRwwKG26shx+3a3NBa0JLCbRpgjd
	 lpFWgPyWY6oBuv6/OsRW8mXySjxnvm6U4ClIH+IdrYiq8pIVPcN4zAcG35gNIz13Qz
	 EtSwDk9hyaaag==
Date: Tue, 9 Jan 2024 10:06:09 +0100
From: Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Subject: Re: Segmentation fault with drgn + libkdumpfile
Message-ID: <20240109100609.4e956beb@meshulam.tesarici.cz>
In-Reply-To: <20240108214008.32f807ee@meshulam.tesarici.cz>
References: <8734vb1v8n.fsf@oracle.com>
	<20240105202339.09db6ed5@meshulam.tesarici.cz>
	<87zfxjzbuc.fsf@oracle.com>
	<20240108214008.32f807ee@meshulam.tesarici.cz>
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.39; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Mon, 8 Jan 2024 21:40:08 +0100
Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:

> On Fri, 05 Jan 2024 13:53:15 -0800
> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>=20
> > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes: =20
> > > On Fri, 05 Jan 2024 10:38:16 -0800
> > > Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
> > >   =20
> > >> Hi Petr,
> > >>=20
> > >> I recently encountered a segmentation fault with libkdumpfile & drgn
> > >> which appears to be related to the cache implementation. I've includ=
ed
> > >> the stack trace at the end of this message, since it's a bit of a lo=
nger
> > >> one. The exact issue occurred with a test vmcore that I could probab=
ly
> > >> share with you privately if you'd like. In any case, the reproducer =
is
> > >> fairly straightforward in drgn code:
> > >>=20
> > >> for t in for_each_task(prog):
> > >>     prog.stack_trace(t)
> > >> for t in for_each_task(prog):
> > >>     prog.stack_trace(t)
> > >>=20
> > >> The repetition is required, the segfault only occurs on the second
> > >> iteration of the loop. Which, in hindsight, is a textbook sign that =
the
> > >> issue has to do with caching. I'd expect that the issue is specific =
to
> > >> this vmcore, it doesn't reproduce on others.
> > >>=20
> > >> I stuck that into a git bisect script and bisected the libkdumpfile
> > >> commit that introduced it:
> > >>=20
> > >> commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6
> > >> Author: Petr Tesarik <petr@tesarici.cz>
> > >> Date:   Wed Jan 11 22:53:01 2023 +0100
> > >>=20
> > >>     Cache: Calculate eprobe in reinit_entry()
> > >>=20
> > >>     If this function is called to reuse a ghost entry, the probe list
> > >>     has not been walked yet, so eprobe is left uninitialized.
> > >>=20
> > >>     This passed the test case, because the correct old value was left
> > >>     on stack. Modify the test case to poison the stack.
> > >>=20
> > >>     Signed-off-by: Petr Tesarik <petr@tesarici.cz>
> > >>=20
> > >>  src/kdumpfile/cache.c      |  6 +++++-
> > >>  src/kdumpfile/test-cache.c | 13 +++++++++++++
> > >>  2 files changed, 18 insertions(+), 1 deletion(-)   =20
> > >
> > > This looks like a red herring to me. The cache most likely continues =
in
> > > a corrupted state without this commit, which may mask the issue (until
> > > it resurfaces later).   =20
> >=20
> > I see, that makes a lot of sense.
> >  =20
> > >> I haven't yet tried to debug the logic of the cache implementation a=
nd
> > >> create a patch. I'm totally willing to try that, but I figured I wou=
ld
> > >> send this report to you first, to see if there's something obvious t=
hat
> > >> sticks out to your eyes.   =20
> > >
> > > No, but I should be able to recreate the issue if I get a log of the
> > > cache API calls:
> > >
> > > - cache_alloc() - to know the number of elements
> > > - cache_get_entry()
> > > - cache_put_entry()
> > > - cache_insert()
> > > - cache_discard()
> > > - cache_flush() - not likely after initialization, but...   =20
> >=20
> > I went ahead and logged each of these calls as you suggested, I tried to
> > log them at the beginning of the function call and always include the
> > cache pointer, cache_entry, and the key. I took the resulting log and
> > filtered it to just contain the most recently logged cache prior to the
> > crash, compressed it, and attached it. For completeness, the patch
> > I used is below (applies to tip branch 8254897 ("Merge pull request #78
> > from fweimer-rh/c99")).
> >=20
> > I'll also see if I can reproduce it based on the log. =20
>=20
> Thank you for the log. I haven't had much time to look at it, but the
> first line is a good hint already:
>=20
> 0x56098b68c4c0: cache_alloc(1024, 0)
>=20
> Zero size means the data pointers are managed by the caller, so this
> must be the cache of mmap()'ed segments. That's the only cache which
> installs a cleanup callback with set_cache_entry_cleanup(). There is
> only one call to the cleanup callback for evicted entries in cache.c:
>=20
> 		/* Get an unused cached entry. */
> 		if (cs->nuprobe !=3D 0 &&
> 		    (cs->nuprec =3D=3D 0 || cache->nprobe + bias > cache->dprobe))
> 			evict =3D evict_probe(cache, cs);
> 		else
> 			evict =3D evict_prec(cache, cs);
> 		if (cache->entry_cleanup)
> 			cache->entry_cleanup(cache->cleanup_data, evict);
>=20
> The entries can be evicted from the probe partition or from the precious
> partition. This might be relevant. Please, can you re-run and log where
> the evict entry comes from?

I found some time this morning, and it wouldn't help. Because of a bug
in fcache_new(), the number of elements in the cache is big enough that
cache entries are never evicted in your case. It's quite weird to hit a
cache metadata bug after elements have been inserted. FWIW I am not
able to reproduce the bug by replaying the logged file read pattern.

Since you have a reliable reproducer, it cannot be a Heisenbug. But it
could be caused by the other cache - the cache of decompressed pages.
Do you know for sure that lzo1x_decompress_safe() crashes while trying
to _read_ from the input buffer, and not while trying to _write_ to the
output buffer?

Petr T
