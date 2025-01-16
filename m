Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D6522CA1F
	for <linux-debuggers@vger.kernel.org>; Thu, 16 Jan 2025 16:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737045654; cv=none; b=WTlh2RoiCKDwUzFxz3j7mbO6ffhQEDcQFErZ8gC+fcH4OTM+kesqwYRqJzFnKnLG0zy50mfPzzT8mF2uxffygN474IVmeKHBhzR+R1orVDO7ezAIw1OoXQMvzEr4sI4GQbXxyfYdpGMtHxOPPqk1UC7EqeSs7xFJb48I36fE8d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737045654; c=relaxed/simple;
	bh=SSSuxC3YLh50xZfcrNsFBkw93hx1rMLp8pP1TF7Jxgg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=Q0qk9hLormkER/XYln1/wXLjla+R7RCQJHKgofUYW37H3FUsCb28ile4bBMijfFcJSdURkhjHtYaKhGPIliarheRUNgVxw15ntuqNsB7Txw0McM/shpNfAc12A25ExAy87EJt94mokrI9fmOnQA4J/wYpJ2w/QdTCFm0lfZAqNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=WgNBpbtp; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="WgNBpbtp"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737045650;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7e7WFDtCaoob5/1gsMyce6v4ZlR/CgRRR96ucROnKM4=;
	b=WgNBpbtp6gOj7PlC9lafvbiyNw+I6DHjPpdQqdhuciJiw3xjSoPgPVwUnnJWKidkhhuW54
	EyCT5gcmK7wegZIGiIApK05tGqvSbJMQTWabddU3aV3/3+az2hih9TE3gRsy/nI2oij+2F
	CohljrlrfXvTMv+SIc06Z/aeqJT9cOc=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-532-eMBApjz1O8O5Ugl1jwG_vw-1; Thu, 16 Jan 2025 11:40:49 -0500
X-MC-Unique: eMBApjz1O8O5Ugl1jwG_vw-1
X-Mimecast-MFC-AGG-ID: eMBApjz1O8O5Ugl1jwG_vw
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-43626224274so5870835e9.0
        for <linux-debuggers@vger.kernel.org>; Thu, 16 Jan 2025 08:40:49 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737045648; x=1737650448;
        h=mime-version:message-id:date:references:in-reply-to:subject:cc:to
         :from:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=7e7WFDtCaoob5/1gsMyce6v4ZlR/CgRRR96ucROnKM4=;
        b=Zw6QmcVYe0OHP5KEeTDN17WMiSdputvdzQVxl5qLTUs7jEvMfvvVORX67ptNkeJ3TX
         82uagAP+tyr53RPVGOnJ8PBydSZ9MYSTkWL6nsoAUZYiui6aPsgA8pcBggu1dSLkR5Qs
         yqOdiN0Ie+tuq43UGk1PvioWp1/XxvVBDCzejAXiSmRDlw7WURJqa1gyh0VXxxMLYQtO
         Dc/s56Gl1hnNAAn8kijLXyBmQs7l0TgDbUB7v4MEbY5HVg2aVYeEFSn1w3gThuFI0QAY
         Udu8uAAiN+8005WzBjRMfqU6hvTS3Hf7Edx+HnGnr4XmOh+WOsVC22O+ywxDX+FS6Yvh
         MPeQ==
X-Gm-Message-State: AOJu0YwwXZ5Pl/zjUuy5z3/B0Mjx/cl8BFNdTWNFCwAWKZMJQjg9rTtv
	YGLE0Ca0OIXFszfuSBE4StnVSxKMX7SvJQc8ehmfn7m8zKR/e1EvBY8UMAS8JvOAxXqTVlIHwwh
	h3ZtxuvfiBJ1FzOMB87e2pzsdZ6sjnKrb/eshH+xqonrzbptalYL2zDrbhgxfiQmjiQ==
X-Gm-Gg: ASbGncv5b8jsUsq1NQ3xsz2sW4UN1OayuDkbwf3T1xyj6tWVuwS61NIdbjoVrKV3zes
	lGE8NspggURnwHOPj8/OaMsqSEACMQZWGebBYQ2WwC52AMuHH7NJEFcPXhohT8bTpbQaZ+wCPcv
	WECaAvhJzhTyhTW2AzZIct7f53gpG0Qbt1zV+n5s0g/uJBR/7NADxQ9wN8DGkKF3D+GpLtUuMSr
	S+AIrxiayUuJbd0OezG99lkgDPneQ2MPguvNr3FK5AxF7ak03VNahr/pqFXShR341bambC0vm7d
	DNF0Cg==
X-Received: by 2002:a5d:598b:0:b0:385:ee40:2d75 with SMTP id ffacd0b85a97d-38a872da8b6mr26335625f8f.20.1737045648161;
        Thu, 16 Jan 2025 08:40:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEsPQ0qJgMaj7xoIyVDYJ8PWqzqvOhBgJZCXLSv7qGNtpsUkcjg1n2xBjj0vfYvDwPA9u2zaw==
X-Received: by 2002:a5d:598b:0:b0:385:ee40:2d75 with SMTP id ffacd0b85a97d-38a872da8b6mr26335602f8f.20.1737045647773;
        Thu, 16 Jan 2025 08:40:47 -0800 (PST)
Received: from localhost (44.226.159.143.dyn.plus.net. [143.159.226.44])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38bf32755f0sm282966f8f.76.2025.01.16.08.40.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Jan 2025 08:40:47 -0800 (PST)
From: Andrew Burgess <aburgess@redhat.com>
To: Luis Machado <luis.machado@arm.com>, Stephen Brennan
 <stephen.s.brennan@oracle.com>, Tom Tromey <tom@tromey.com>, Luis Machado
 via Gdb <gdb@sourceware.org>
Cc: linux-debuggers@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
 Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <a119598d-51ce-44ae-a315-aa07c8fdb987@arm.com>
References: <8734hmtfbr.fsf@oracle.com>
 <5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com> <87plkpqpuj.fsf@tromey.com>
 <87y0zds39y.fsf@oracle.com> <87cygnoxi2.fsf@redhat.com>
 <a119598d-51ce-44ae-a315-aa07c8fdb987@arm.com>
Date: Thu, 16 Jan 2025 16:40:46 +0000
Message-ID: <87y0zaogoh.fsf@redhat.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 2eYX_1m6sSAIC3n-bJLN2EZrf9Is3EL4p_qBtu_cBXw_1737045648
X-Mimecast-Originator: redhat.com
Content-Type: text/plain

Luis Machado <luis.machado@arm.com> writes:

> On 1/16/25 10:37, Andrew Burgess wrote:
>> Stephen Brennan via Gdb <gdb@sourceware.org> writes:
>> 
>>> Tom Tromey <tom@tromey.com> writes:
>>>>>>>>> Luis Machado via Gdb <gdb@sourceware.org> writes:
>>>>
>>>>>> To sum up, my specific questions are:
>>>>>>
>>>>>> 1. What is the maximum protocol packet size, if any?
>>>>
>>>>> It is hardcoded by gdb, but the remote can also specify that, but...
>>>>
>>>>>> 2. Would this functionality be better implemented in a single "q
>>>>>> linux.vmcoreinfo" packet, or as a "qXfer" packet?
>>>>
>>>>> ... we have packets like qXfer that can handle multi-part transfers. So the
>>>>> packet size is not a critical concern anymore, and it is best to use this
>>>>> newer mechanism, if the usage fits the packet structure.
>>>>
>>>> Agreed, qXfer is the way to go.
>>>
>>> Thank you Tom & Luis for confirmation, qXfer seems appropriate. With
>>> that approach the buffer size is not really a concern: we can simply use
>>> the minimum of the requested read size, and the stub's buffer size. So
>>> long as clients use multiple requests until the data is fully read.
>>>
>>> While the "os" object also sounds like a good place to put this (e.g.
>>> within a new annex), it seems like that contains XML-formatted data with
>>> well-understood schema and semantics. The vmcoreinfo is free-form text
>>> (generally of a "key=value" format), so it probably should be a separate
>>> object.
>>>
>>> So I think we would prefer to add an object type, e.g. named "vmcoreinfo".
>>> (But please do speak up if this sounds like a mistake)
>>>
>>>> If you're adding a new object type, a patch to the manual would be good.
>>>
>>> I'll definitely include a patch for the manual in the plan for this.
>>> Another patch I'd like to write is to allow GDB's server to expose this
>>> object type when the target is an ELF core dump with a VMCOREINFO note.
>>> We're hoping for this to useful for all debuggers, not just drgn.
>> 
>> Hi Stephen,
>> 
>> I took a look at the wiki page and it seems like initially at least,
>> your plan is to make the information from vmcoreinfo available via a new
>> 'info' command.
>> 
>> It is possible to send remote packets through GDB's Python API[1].  And
>> of course, the Python API allows for new commands to be created[2].
>> There is a test in GDB's test suite that makes use of the packet sending
>> API, and it happens to send a qXfer packet[3].
>> 
>> I say all this not to put you off contributing a patch to core GDB, but
>> if what you want is a new user command which will send a packet to a
>> remote target and process the results, then it should be possible to
>> implement this as a Python extension.
>
> A bit off-topic, but wouldn't that have the potential to proliferate
> remote packets gdb/debugging stubs have no control over or no documentation
> to point at/refer to? Possibly contributing to greater confusion as to what
> should be minimally supported in terms of remote packets?

I don't see a problem, but that doesn't mean using an extension is the
right choice in all cases.

Using an extension, in my mind, ties the functionality to the project.
So if we expect many remote targets to support the new packet then it
begins to make more sense to move the functionality into the GDB tree
(maybe as C++ code, or maybe as Python code).  But if, really, the new
feature only applies for one project, then it makes more sense (for me)
to add GDB support via an project specific extension.  Documentation
would naturally live within the project itself.

On the topic of control, I'm not entirely sure what problems you see.
Using a project specific extension gives (IMHO) the project more control
over the packet as they are free to change the packet over time.
Currently GDB is pretty conservative with changing packets, so if a
single project pushed their own custom packet to GDB core, and then
wanted to change the packet, there's a risk we (GDB team) might refuse
the change "just in case" someone else has since started to use the
packet.  That might be seen as the project having less control.

Looking at GDB's control over packets, I'm not sure what control GDB
needs.  For sure, there's a risk that if extensions start creating their
own packets then there is a risk that GDB might later add a conflicting
packet, which could be a problem, and one reason we might want to move
from an extension to a core packet.  I doubt, right now, there are many
"custom packets" in the wild, but maybe we should consider defining
namespaces for custom packets, to avoid future conflicts?

The minimally supported problem is usually about the minimal set of
packets that a remote target needs to support, rather than the set GDB
supports.  In most cases, communication is initiated by GDB, so if GDB
isn't aware of this packet (extension not loaded), GDB will just never
ask for it.

I'm certainly not making the argument that using an extension is the
right choice in every case.  Not every packet type is going to be right
for implementing as an extension.  Additionally, it might be that a
project starts with an extension while prototyping a new packet, and
then ports it to C++ and contributes it to GDB later once the design is
solid.

I've had success using packets via Python before, and not everyone is
aware this feature is available, so I thought I'd mention it.

Thanks,
Andrew

