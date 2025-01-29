Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FA7619CC33
	for <linux-debuggers@vger.kernel.org>; Wed, 29 Jan 2025 21:16:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738185385; cv=none; b=QJBcTgBsD48iayMkMtUiWcL/MDfpkg9vCVZgWfT8l+K3pFz0otlOkWIQ2l/cIYeXlj5liBiEGoTUukx7AwqmqQMhnFjJ9HR+wzOBwRRe439JnwBY/ifXq8NpvOPExuhMYdRP+PrRkLuS6DWEM3qPX6sjhNp86FxkfjbSSgIJMr8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738185385; c=relaxed/simple;
	bh=28mp5kYfnQHDAJM3nXsyyL9WdnACOg5tsZwBxKljiMk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=asnowlsDk4W+OV8QjqhMrcWy21K+9AuCynGKCBxVl2ZrQ6/iRGcx/Ifecyv1Gts34A8GycpnmxRCHmMn3R4kQCzl+P9jniUOM4jIELr+Aw0JHGscANcyYRvO+wqNWWtKHfeaI/iymp/WtKGcKKjltFiuiA/MLrau1VwAqZ8FEXA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=KrleGvvN; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="KrleGvvN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1738185372; bh=28mp5kYfnQHDAJM3nXsyyL9WdnACOg5tsZwBxKljiMk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=KrleGvvNvmhy2KYxrycWWLczPVVOY97oq+z3FjwN51v2vHVQOBImrHO5VKN9WaD2s
	 BOUZVIgK9PVQviJfv6N5dti3SY8d1V0UphLaTCmSFaRoyGd1b3Bf3MxxGNUJ4mPKb8
	 0vOnxzeKZX9kVVaPpMALqNGkIhhu+YUs5edIh69k=
Date: Wed, 29 Jan 2025 22:16:11 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Omar Sandoval <osandov@osandov.com>, gdb@sourceware.org, 
	linux-debuggers@vger.kernel.org, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
Message-ID: <cf9b0a60-8437-4cbf-9ff8-2aa3ba45a9d0@t-8ch.de>
References: <8734hmtfbr.fsf@oracle.com>
 <766010fa-49a5-4e86-a730-bf79bb73e928@t-8ch.de>
 <Z5fMtZOoYaV6aXwf@telecaster>
 <87y0ywgkss.fsf@oracle.com>
 <3a0f50f6-3d03-4109-b0a8-0b743559356c@t-8ch.de>
 <87v7tzhjs2.fsf@oracle.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87v7tzhjs2.fsf@oracle.com>

On 2025-01-27 16:19:41-0800, Stephen Brennan wrote:
> Thomas Weißschuh <thomas@t-8ch.de> writes:
> > On 2025-01-27 10:42:59-0800, Stephen Brennan wrote:
> >> Omar Sandoval <osandov@osandov.com> writes:
> >> > On Sun, Jan 26, 2025 at 07:07:47PM +0100, Thomas Weißschuh wrote:
> >> >> On 2025-01-13 16:22:00-0800, Stephen Brennan wrote:
> >
> > <snip>
> >
> >> >> Do you need to transfer the full vmcoreinfo data?
> >> >> Wouldn't it be sufficient to only include the address/size of the
> >> >> vmcoreinfo note in memory and the debugger can read the data from there
> >> >> with regular memory access commands?
> >> >> That information is enough for QEMUs vmcoreinfo device.
> >> >> It would simplify the design and implementation(s) significantly.
> >> 
> >> I do agree that this would simplify the protocol design, and it's a good
> >> idea I hadn't considered. Thank you!
> >> 
> >> > Oh, that's a good idea. I guess the downside is an extra command round
> >> > trip.
> >> >
> >> > QEMU and KGDB also only implement the `m` command for reading
> >> > hex-encoded memory. We'd probably want to implement the `x` command for
> >> > both since it doesn't (usually) double the transfer size.
> >> >
> >> > One more caveat is that KGDB doesn't check the length passed to the `m`
> >> > command and will happily clobber memory... QEMU's gdbstub does seem to
> >> > check, and also advertises its packet size, so we probably want that in
> >> > KGDB, too.
> >> >
> >> > Stephen, what do you think?
> >> 
> >> One of our core constraints is that the vmcoreinfo is quite a bit of
> >> text data, around 3k bytes right now. Doubling that to 6k would be a
> >> real problem, so it would be really helpful to keep this to using the
> >> 'x' encoding. However, I think there's a couple good reasons that
> >> neither QEMU nor KGDB support the 'x' packet:
> >
> > Could you elaborate why it "would be a real problem"?
> > If it is a problem with static buffer sizes, wouldn't this be avoided by
> > configuring a max packet size?
> 
> > The debugger would have to request the
> > data in chunks.
> >
> > This is also what the drgn pull request currently does for all memory reads.
> > Without knowing much about drgn, I would have expected the regular
> > memory accesses to be much more data then the 3KB vmcore notes.
> 
> I'm sorry, I should have said what the problem was!
> The problem is more to do with transmission time than buffer size. For
> the worst case 9600 baud (960 bytes/second), the vmcoreinfo alone takes
> ~3.2s to transmit. Then you need to add in any overhead for the several
> packets used reading chunk-wise.  Doubling that transmission time by
> encoding it with hex is something we really wanted to avoid.

Agreed.

How many of the vmcoreinfo fields are needed on the normal fastpath?
There is also 'qSearch' which could be used to directly find the string
KERNELOFFSET= and only read that location.

Note: qSearch is currently unimplemented in qemu/kgdb/gdbstub, but
implementing it may be easier than the custom encoding scheme.
Also it could be used by a wider range of users.
Or for now it could be left out, letting users fall back to full reads.
Then at some point it can be backfilled as a performance optimization;
without breaking the protocol.

> But it is fair to say that drgn may request other large blocks of
> memory, and without 'x' support in the stubs, we will be suffering with
> that same large transmission time as well. So implementing the "x"
> command in our targets would probably be helpful, regardless.

I am curious if the current drgn PR would be usable with 9600 baud.

> >> 1. You cannot know the required buffer size easily, so you cannot know
> >> whether you will be able to satisfy an 'x' request in your static buffer
> >> size. This is most relevant to kgdb. The 'x' packet documentation says:
> >> 
> >>   The reply may contain fewer addressable memory units than requested if
> >>   the server was reading from a trace frame memory and was able to read
> >>   only part of the region of memory. 
> >> 
> >> I'm not certain what trace frame memory is, but the vmcoreinfo is not
> >> that. I'm not confident whether this means the protocol allows fewer
> >> bytes to be returned for other cases? Certainly, the 'qXfer' packets
> >> explicitly allow for fewer bytes to be returned, as the documentation
> >> states:
> >> 
> >>   It is possible for data to have fewer bytes than the length in the
> >>   request. 
> >
> > If I understand correctly "trace frame" refers to same sort of cache.
> > It's not a property of the target memory but how it is managed by gdb.
> >
> > For m reads, gdb itself explictly seems to allow short reads, also
> > referring (not exclusively) to trace frames.
> >
> > Server:
> >
> > /* Read trace frame or inferior memory.  Returns the number of bytes
> >    actually read, zero when no further transfer is possible, and -1 on
> >    error.  Return of a positive value smaller than LEN does not
> >    indicate there's no more to be read, only the end of the transfer.
> >    E.g., when GDB reads memory from a traceframe, a first request may
> >    be served from a memory block that does not cover the whole request
> >    length.  A following request gets the rest served from either
> >    another block (of the same traceframe) or from the read-only
> >    regions.  */
> >
> > static int
> > gdb_read_memory (CORE_ADDR memaddr, unsigned char *myaddr, int len)
> > ...
> >
> > Client:
> >
> > target_xfer_status
> > remote_target::remote_read_bytes_1 (CORE_ADDR memaddr, gdb_byte *myaddr,
> > 				    ULONGEST len_units,
> > 				    int unit_size, ULONGEST *xfered_len_units)
> > {
> >   ...
> >
> >   decoded_bytes = hex2bin (p, myaddr, todo_units * unit_size);
> >   /* Return what we have.  Let higher layers handle partial reads.  */
> >   *xfered_len_units = (ULONGEST) (decoded_bytes / unit_size);
> >   return (*xfered_len_units != 0) ? TARGET_XFER_OK : TARGET_XFER_EOF;
> 
> Ok, I suppose I'm putting too much stock in the wording of the docs.
> 
> Maybe I can update it to indicate more clearly that the number of bytes
> returned may be smaller than the requested amount. The way I read it, it
> sounded like it was *only* legal to return less than the requested
> number of bytes in certain circumstances.
> 
> Something that confuses/bothers me about remote_read_bytes_1, is that it
> uses the configured PacketSize, divided by 2, as the maximum amount it
> requests from the stub - even if it will use the 'x' type packet. That
> means that for 'x' packets, the buffer size would likely be
> under-utilized, since most bytes are probably not escaped.
> 
> If using the 'x' type packet, and partial reads are allowed, then why
> not request as much as possible, and let the stub return however much it
> can fit into its buffer?
> 
> I'm also slightly confused at this use of PacketSize. From the
> documentation:
> 
>   ‘PacketSize=bytes’
> 
>     The remote stub can accept packets up to at least bytes in length.
>     GDB will send packets up to this size for bulk transfers, and will
>     never send larger packets. This is a limit on the data characters in
>     the packet, not including the frame and checksum. There is no
>     trailing NUL byte in a remote protocol packet; if the stub stores
>     packets in a NUL-terminated format, it should allow an extra byte in
>     its buffer for the NUL. If this stub feature is not supported, GDB
>     guesses based on the size of the ‘g’ packet response.
> 
> It reads like something that advertises the buffer size for the stub's
> *input buffer*, so that GDB will never send a packet too big for the
> stub.

I agree with your confusion but can't give any insights.
Some clearer docs do sound nice.

> But here GDB is using it to limit the number of bytes it requests from
> the stub. I understand that many stubs may share an input & output
> buffer, so that makes a certain sense. But if partial reads are allowed,
> again, I would expect GDB to request whatever it wants, and let the stub
> limit its output by what fits into its output buffer, and that could
> control the chunking rather than the negotiation process here. That way
> we could reduce round-trips. Would that approach be legal in the
> protocol?

Sounds like valid reasoning. I can't give advise on the legal parts,
though :-)

> ----
> 
> I've now realized what may be the most important reason to use the qXfer
> command rather than simply returning the memory address of the note.
> 
> QEMU only knows the phyical address of the note. It offers a
> non-standard extension to the protocol which allows switching from
> virtual addresses into physical address mode.
> 
> KGDB knows the physical and virtual address of the note, obviously.
> However, it has no support for reading physical addresses.
> 
> We can't have QEMU transmit the virtual address, since it does not know
> it.

flatview_translate()/address_space_map() could do this I think.
This is also what cpu_physical_memory_read() uses under the hood.

> And it's pointless for KGDB to transmit the physical address, since
> it offers no way to read it. I suppose we could have them transmit
> whichever they support, with some sort of flag to differentiate, and
> then rely on the debugger to use the QEMU extensions to enter physical
> memory mode to get it. But that seems like the most complex option of
> all.

GDB core protocol does not know about different kinds of addresses.
So the query should return whatever kind of address that can be passed to
'm'/'x'/'qSearch' again.

But again, I'm just a bystander, thinking out loud.


Thomas
