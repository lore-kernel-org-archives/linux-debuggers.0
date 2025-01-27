Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41FBD1DAC81
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Jan 2025 22:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738017634; cv=none; b=GRAgQfCkxumdkNoMkHkVImjg5/7vohxCCzfXzNhfnSh+LIGgboy3DH0K7hEUl14AZyIkYMhAhmb8w5m54Oqi4Q1qdpjkndHv/fKuNnEBBTt5eAPZRm73DG0atkITN7oFT+4sE4Wn05aGZKHqloL9mpLS0YN9injJ2Qsy+8TSASI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738017634; c=relaxed/simple;
	bh=q5rccZbcmC2FCSOyuXRvQ70YHSzmVxugvvcJuj2KlRI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SnN934dRC+QeV9f4ejakX8FNL381UsSDRopf1MpVs2a0X7SAhQ6LzCr7o6XCrMy7I9omIpwGhdgOR6WjR504gDao13tjQZwwU4MT3Zt8I6HmtS0xa0oKeAc1YTlz4NIs4OCmwBuM+P3dzbRw3u+lyAOdDg8h1yDw3+/lWj5sCqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de; spf=pass smtp.mailfrom=t-8ch.de; dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b=rG6sUVia; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=t-8ch.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=t-8ch.de header.i=@t-8ch.de header.b="rG6sUVia"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=t-8ch.de; s=mail;
	t=1738017621; bh=q5rccZbcmC2FCSOyuXRvQ70YHSzmVxugvvcJuj2KlRI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rG6sUVia8JABrCypVUZ7LaXChexcomA05vwQ8yqD/4Cn/36mLrVaZKr4dg7DkI++9
	 qIvQdKdjes3QjiRluVhQJbFyrZmiJUlXu/FiXcUIzMyG/45OKqhKBBlMdZ7JnR+KTH
	 F9S93kDTO5rKQ20BSJFXpc5z08qC1vnQyPYXRQQk=
Date: Mon, 27 Jan 2025 23:40:21 +0100
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
To: Stephen Brennan <stephen.s.brennan@oracle.com>
Cc: Omar Sandoval <osandov@osandov.com>, gdb@sourceware.org, 
	linux-debuggers@vger.kernel.org, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
Message-ID: <3a0f50f6-3d03-4109-b0a8-0b743559356c@t-8ch.de>
References: <8734hmtfbr.fsf@oracle.com>
 <766010fa-49a5-4e86-a730-bf79bb73e928@t-8ch.de>
 <Z5fMtZOoYaV6aXwf@telecaster>
 <87y0ywgkss.fsf@oracle.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <87y0ywgkss.fsf@oracle.com>

On 2025-01-27 10:42:59-0800, Stephen Brennan wrote:
> Omar Sandoval <osandov@osandov.com> writes:
> > On Sun, Jan 26, 2025 at 07:07:47PM +0100, Thomas Weißschuh wrote:
> >> On 2025-01-13 16:22:00-0800, Stephen Brennan wrote:

<snip>

> >> Do you need to transfer the full vmcoreinfo data?
> >> Wouldn't it be sufficient to only include the address/size of the
> >> vmcoreinfo note in memory and the debugger can read the data from there
> >> with regular memory access commands?
> >> That information is enough for QEMUs vmcoreinfo device.
> >> It would simplify the design and implementation(s) significantly.
> 
> I do agree that this would simplify the protocol design, and it's a good
> idea I hadn't considered. Thank you!
> 
> > Oh, that's a good idea. I guess the downside is an extra command round
> > trip.
> >
> > QEMU and KGDB also only implement the `m` command for reading
> > hex-encoded memory. We'd probably want to implement the `x` command for
> > both since it doesn't (usually) double the transfer size.
> >
> > One more caveat is that KGDB doesn't check the length passed to the `m`
> > command and will happily clobber memory... QEMU's gdbstub does seem to
> > check, and also advertises its packet size, so we probably want that in
> > KGDB, too.
> >
> > Stephen, what do you think?
> 
> One of our core constraints is that the vmcoreinfo is quite a bit of
> text data, around 3k bytes right now. Doubling that to 6k would be a
> real problem, so it would be really helpful to keep this to using the
> 'x' encoding. However, I think there's a couple good reasons that
> neither QEMU nor KGDB support the 'x' packet:

Could you elaborate why it "would be a real problem"?
If it is a problem with static buffer sizes, wouldn't this be avoided by
configuring a max packet size? The debugger would have to request the
data in chunks.

This is also what the drgn pull request currently does for all memory reads.
Without knowing much about drgn, I would have expected the regular
memory accesses to be much more data then the 3KB vmcore notes.

> 1. You cannot know the required buffer size easily, so you cannot know
> whether you will be able to satisfy an 'x' request in your static buffer
> size. This is most relevant to kgdb. The 'x' packet documentation says:
> 
>   The reply may contain fewer addressable memory units than requested if
>   the server was reading from a trace frame memory and was able to read
>   only part of the region of memory. 
> 
> I'm not certain what trace frame memory is, but the vmcoreinfo is not
> that. I'm not confident whether this means the protocol allows fewer
> bytes to be returned for other cases? Certainly, the 'qXfer' packets
> explicitly allow for fewer bytes to be returned, as the documentation
> states:
> 
>   It is possible for data to have fewer bytes than the length in the
>   request. 

If I understand correctly "trace frame" refers to same sort of cache.
It's not a property of the target memory but how it is managed by gdb.

For m reads, gdb itself explictly seems to allow short reads, also
referring (not exclusively) to trace frames.

Server:

/* Read trace frame or inferior memory.  Returns the number of bytes
   actually read, zero when no further transfer is possible, and -1 on
   error.  Return of a positive value smaller than LEN does not
   indicate there's no more to be read, only the end of the transfer.
   E.g., when GDB reads memory from a traceframe, a first request may
   be served from a memory block that does not cover the whole request
   length.  A following request gets the rest served from either
   another block (of the same traceframe) or from the read-only
   regions.  */

static int
gdb_read_memory (CORE_ADDR memaddr, unsigned char *myaddr, int len)
...

Client:

target_xfer_status
remote_target::remote_read_bytes_1 (CORE_ADDR memaddr, gdb_byte *myaddr,
				    ULONGEST len_units,
				    int unit_size, ULONGEST *xfered_len_units)
{
  ...

  decoded_bytes = hex2bin (p, myaddr, todo_units * unit_size);
  /* Return what we have.  Let higher layers handle partial reads.  */
  *xfered_len_units = (ULONGEST) (decoded_bytes / unit_size);
  return (*xfered_len_units != 0) ? TARGET_XFER_OK : TARGET_XFER_EOF;
}

<snip>


Thomas
