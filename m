Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B6CD19539F
	for <linux-debuggers@vger.kernel.org>; Thu, 16 Jan 2025 10:37:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737023852; cv=none; b=lRIIijqiwIxoceLcN3c9jGia6fLubIGwoQhpxZ3xaLWLIPVjaj+3knv/OJGUOomVLVmqPsoaowTZnlCbl2KaqTm9QXNnTZyV3Pwxd4ctuuHaS8sSyQdciXcI1xu7dWvDI0+QEg4iFKX7CKE2eG8uc7gtL1EiRg97h9xQXYtq5nE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737023852; c=relaxed/simple;
	bh=qK8XQfN1Gk5nwFHGzeJNW/hu7t6k2hFTZHLZPJUrwUE=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=jBhW88DAgR9JpYYdvbacXz3yF/7U7nw5hWOJfKKh4ZlJIkbrn1Qq0I4t0mcw1xHPX0dVu7hM4YfbnsTY57rfJs5+pXE9+kN0rWx5++kSduoLQ13o15vYlQV5XTvu2E4YhnJQ177kZYgONavN7EoIgARsPzm9WqerhyKev6K7jfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=KeXrfGuT; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="KeXrfGuT"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737023849;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=afz+4OE353qB0XJ9A5iXAn0NbAmdnjPqioq2MmMR2Zk=;
	b=KeXrfGuTzwQF+ULRiEOMkgoe/QYXGBL6z2K9YsO33SaqhgWanRljRIETf39P5UGgAwaR7P
	WgnrdShv2C4HvB+llYI51bj7Iy44ICz2JcDlUogtrhO9Jtv3S0wnYHdlTOrVzAX12wHixV
	ArPhAYvBNEGtSQDZ1x7aLZ/idy7Htvk=
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com
 [209.85.128.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-625-gVAIQOr4NvOygU9Q33cMQQ-1; Thu, 16 Jan 2025 05:37:28 -0500
X-MC-Unique: gVAIQOr4NvOygU9Q33cMQQ-1
X-Mimecast-MFC-AGG-ID: gVAIQOr4NvOygU9Q33cMQQ
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-43623bf2a83so5173475e9.0
        for <linux-debuggers@vger.kernel.org>; Thu, 16 Jan 2025 02:37:27 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737023847; x=1737628647;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=afz+4OE353qB0XJ9A5iXAn0NbAmdnjPqioq2MmMR2Zk=;
        b=hL152byrxQfIbH2JvxWsw8dDhvrrEaXGdMN+lgMAWg9dN25kwJTa6iqeI8rwPZVC0z
         ZRkuUhuGG94tF3VzhgMZOR6mr8ea/+IJawnUWArSvGgHYQcLBtccbK9QxGXE9C7GU+md
         H8iYBY+uyafRzAUbs+T2ZhSgDUyFSA2aNX3ngUX9VRRUJUIfAqQurK/lr3kLB5Insygy
         xEe54Roow6Tq8TgMoLG2+V8n42Dk7/quScGWuebWClKXQuDq9p0mFjLbh63Uh70QlO6b
         YHpNwPVFoWhgUM7/jeOqQ+s37T9SNYJ8wmKiMqsMIea2eZOlF8U7UGAGPsRZTjQcaadD
         KySQ==
X-Forwarded-Encrypted: i=1; AJvYcCWs/XQd14T3xBqHSXqRcf4g+Ri0dHHBn3Fe8MqMcdYOoSSAg9FKoiglzUd00wtXe+uG1qalKJMBOCFbXCtX1SA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxta0c4Y16wLwgLaLYNJUBD6YJotTHHofaGLQ73hx/PHFThI8Za
	5uCemBzTQrd6Lca2XY/tqdy1GgSjdqpyTLgv6Pp2NnwK3lDtGDww2KiMabT91nRdViR9d96nD5U
	ngz2Yd+bKQiOaGdYstMaOrafMSjBHU1BxrycaNbnvTTLH2my4cNxOjzOpL+bW022uEw==
X-Gm-Gg: ASbGncuqx44fpJPCkd3+xYJjd8RmrVsImuWmm2zm3nWecslKSLFd/KIW9O9tM06wWUS
	3JNVljqVm1+zwgfA2nJWc9Lp9qq1SuWtgoTYhAZKV9GsoZlFHwgZsVETbMvB1BZxmnzScPpqVOm
	dEkdmbGmRFlqUKsF7poFoJAD9Wvnxew22k7qSNrqrUeqnJw6Jxf7oLd1LlY4vnVckUkyAcce5zQ
	KFhUYByK99kRigC5Z+vcc3wQ9kpYeKfszb/8aMDo5jtbTCcjXr34GbHYtrk3+HfffhuQ6mBcB0d
	ekhvtg==
X-Received: by 2002:a7b:c315:0:b0:434:ffb2:f9df with SMTP id 5b1f17b1804b1-436e26adf94mr318507825e9.17.1737023846889;
        Thu, 16 Jan 2025 02:37:26 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEBidBGhIPwJqxDq13P32Iam9aSzh2FtZ725kNmxULef90vbPBbLPIKwp3AeJW+9asUJ+lSnQ==
X-Received: by 2002:a7b:c315:0:b0:434:ffb2:f9df with SMTP id 5b1f17b1804b1-436e26adf94mr318507565e9.17.1737023846514;
        Thu, 16 Jan 2025 02:37:26 -0800 (PST)
Received: from localhost (44.226.159.143.dyn.plus.net. [143.159.226.44])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-437c74c475csm55593135e9.20.2025.01.16.02.37.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 02:37:26 -0800 (PST)
From: Andrew Burgess <aburgess@redhat.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>, Tom Tromey
 <tom@tromey.com>, Luis Machado via Gdb <gdb@sourceware.org>
Cc: Luis Machado <luis.machado@arm.com>, linux-debuggers@vger.kernel.org,
 Omar Sandoval <osandov@osandov.com>, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <87y0zds39y.fsf@oracle.com>
References: <8734hmtfbr.fsf@oracle.com>
 <5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com> <87plkpqpuj.fsf@tromey.com>
 <87y0zds39y.fsf@oracle.com>
Date: Thu, 16 Jan 2025 10:37:25 +0000
Message-ID: <87cygnoxi2.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: XcpkTD_LMiBiGQjlQdsgs9692DxEARPoIJ77jNHjWug_1737023847
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Stephen Brennan via Gdb <gdb@sourceware.org> writes:

> Tom Tromey <tom@tromey.com> writes:
>>>>>>> Luis Machado via Gdb <gdb@sourceware.org> writes:
>>
>>>> To sum up, my specific questions are:
>>>> 
>>>> 1. What is the maximum protocol packet size, if any?
>>
>>> It is hardcoded by gdb, but the remote can also specify that, but...
>>
>>>> 2. Would this functionality be better implemented in a single "q
>>>> linux.vmcoreinfo" packet, or as a "qXfer" packet?
>>
>>> ... we have packets like qXfer that can handle multi-part transfers. So the
>>> packet size is not a critical concern anymore, and it is best to use this
>>> newer mechanism, if the usage fits the packet structure.
>>
>> Agreed, qXfer is the way to go.
>
> Thank you Tom & Luis for confirmation, qXfer seems appropriate. With
> that approach the buffer size is not really a concern: we can simply use
> the minimum of the requested read size, and the stub's buffer size. So
> long as clients use multiple requests until the data is fully read.
>
> While the "os" object also sounds like a good place to put this (e.g.
> within a new annex), it seems like that contains XML-formatted data with
> well-understood schema and semantics. The vmcoreinfo is free-form text
> (generally of a "key=value" format), so it probably should be a separate
> object.
>
> So I think we would prefer to add an object type, e.g. named "vmcoreinfo".
> (But please do speak up if this sounds like a mistake)
>
>> If you're adding a new object type, a patch to the manual would be good.
>
> I'll definitely include a patch for the manual in the plan for this.
> Another patch I'd like to write is to allow GDB's server to expose this
> object type when the target is an ELF core dump with a VMCOREINFO note.
> We're hoping for this to useful for all debuggers, not just drgn.

Hi Stephen,

I took a look at the wiki page and it seems like initially at least,
your plan is to make the information from vmcoreinfo available via a new
'info' command.

It is possible to send remote packets through GDB's Python API[1].  And
of course, the Python API allows for new commands to be created[2].
There is a test in GDB's test suite that makes use of the packet sending
API, and it happens to send a qXfer packet[3].

I say all this not to put you off contributing a patch to core GDB, but
if what you want is a new user command which will send a packet to a
remote target and process the results, then it should be possible to
implement this as a Python extension.

The benefits of using a Python API are that you can ship the extension
with the kernel, so if/when the vmcoreinfo changes you can easily update
the extension.  At the very least, it allows you to prototype your
commands before having to submit patches to GDB core.

I have included below a very simple example that implements 'info stuff'
which just displays the 'threads' information from a remote target.
Place the code into 'cmd.py', then from GDB 'source cmd.py', after which
you can 'info stuff' and 'help info stuff'.

If this is an approach that might be of interest then I'm happy to help
in any way I can, just drop questions on the mailing list.

Thanks,
Andrew


[1] https://sourceware.org/gdb/current/onlinedocs/gdb.html/Connections-In-Python.html
[2] https://sourceware.org/gdb/current/onlinedocs/gdb.html/CLI-Commands-In-Python.html
[3] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gdb/testsuite/gdb.python/py-send-packet.py;hb=HEAD#l100

--

def bytes_to_string(byte_array):
    res = ""
    for b in byte_array:
        b = int(b)
        if (b >= 32 and b <= 126) or (b == 10) :
            res = res + ("%c" % b)
        else:
            res = res + ("\\x%02x" % b)
    return res


def get_stuff(conn, obj):
    assert isinstance(conn, gdb.RemoteTargetConnection)
    start_pos = 0
    len = 10
    output = ""
    while True:
        str = conn.send_packet("qXfer:%s:read::%d,%d" % (obj, start_pos, len))
        str = bytes_to_string(str)
        start_pos += len
        c = str[0]
        str = str[1:]
        output += str
        if c == "l":
            break
    return output


class InfoStuffCommand (gdb.Command):
    """
    Usage:
      info stuff

    Shows the remote targets thread information.
    """

    def __init__ (self):
        gdb.Command.__init__ (self, "info stuff", gdb.COMMAND_DATA)

    def invoke(self, args, from_tty):
        inf = gdb.selected_inferior()
        conn = inf.connection
        if not isinstance(conn, gdb.RemoteTargetConnection):
            raise gdb.GdbError("not on a remote connection")
        string = get_stuff(conn, "threads")
        print("Target thread information:")
        for line in string.splitlines():
            print("  %s" % line)

InfoStuffCommand ()

