Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31F6B144D36
	for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 21:48:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721771310; cv=none; b=REn/288KMeNaRncMDSG5gDgjmaqVKBWhc+ehUwXeyZL0n2hT5q/22KxVO+gdjAyEE4nEWX5/Ee3Zi2z4VNCtthuw8io6zAWtHjoh0T8YIbtu89LpqkvbVSV10msDPyF5wvoJz4juzLYYfL7pojfSdz6UUmE53Q+UG8ZWBJTtk48=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721771310; c=relaxed/simple;
	bh=7haYfvPKjXufhYiuCjf34R2aLK62yzgKPtCYYNAiRbs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JGeYazQTLxazPBFz0l7hvtawWRz38CxzVhsOrNvSoiiJF+Gc1SBgpwapo2nL/4RDbLB8pgUJgavYF2ldr+CSQFrE8MzkAHlCNncrCcI5akvT0bKYI/qSCwlUD8oAEK6AH55q2mdnoZ75ihVdjWejJIVqNKdL+Bv9B6wJcIPaovY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=PBivhPN9; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="PBivhPN9"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1721771307;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GBHzPfFdbrrYx/UgWjDaIdcuFLA5ujtDICPh18UOMxw=;
	b=PBivhPN9+0VyajCqUTM4Tj5JnCSJfQHKBUhNGX7dVAIhYkGN+xqop/0j6CO9MN18t1UO+4
	P+ag2OCm93yoZRzpQ8f6Z+A5f4JewJAaVatK2eZ0kIhT10nz75lhQusVF7WelggvnCUFq2
	VBBLExv3Q4UpYzieX14SP82MYPz9rVI=
Received: from mail-il1-f199.google.com (mail-il1-f199.google.com
 [209.85.166.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-604-GYu-7ea5MsSnRixUug9idg-1; Tue, 23 Jul 2024 17:48:02 -0400
X-MC-Unique: GYu-7ea5MsSnRixUug9idg-1
Received: by mail-il1-f199.google.com with SMTP id e9e14a558f8ab-3987dace329so68088925ab.0
        for <linux-debuggers@vger.kernel.org>; Tue, 23 Jul 2024 14:48:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721771281; x=1722376081;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GBHzPfFdbrrYx/UgWjDaIdcuFLA5ujtDICPh18UOMxw=;
        b=l3A8imb9+6+uysXo3CMkfxXfxCbzZbysHa+vsGHR1MIVQ8C5/nBN1t8+bET9PJvmYD
         ekKhE+AMZDEPDB1BkDZGmCGEOF5lLhhGq30Fe4fj0IC5w73r/YCJieUSoe3yRixfyHE1
         uLDcOWJURq6sfPF316wlviCVq78UjkKQhe7vD9WhjZELdGYGvHJV+v+nojtKFiLMgPdD
         bQkqTqnsr5BKtxTr35Du7nSKrD1EjaEiy221yCHQPuwtporVpTP6c6cY/VJzNog39biS
         b2VPGZQZWoxNDrWN7jOvPXus40yhJV6p8SA28vdJ0lzD9wZr7hpjvJHyoTVp+CekixIP
         JI7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWGm0k+veVUta2cpofqGV9AgWbsEHLEephaDPjn28M8FvE7aodrENGQ6HsanUdVqBOgajhPaaDAytOBQ7WTR6d9HaJ41/4aBR9QE9gxHx02
X-Gm-Message-State: AOJu0Yw5iJ+hf5sv6g9dg9Dwrxy5Xa3vLbHwLOVgB1TFzcvvdr/N+spq
	TMsWGcNTpuQJ5pnmjZ/Rh/fQvxBXJzjmj/CBRytG8zLcG5uZctjxM8U5RXcInpjG1HlIVIMj36C
	jDH4J3ucBZgoSVxGk+CQqmPYal2xq0GpCqX7H8fpWf4dYVuLVSPonuwjpt1bf+c+nnmO50kciDx
	GygUrAnRdVbSauKacduZK0aSUKVMew/25Uo89Uj9w=
X-Received: by 2002:a05:6e02:174f:b0:398:b5b8:a683 with SMTP id e9e14a558f8ab-39a1925ccb8mr3780705ab.9.1721771281676;
        Tue, 23 Jul 2024 14:48:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHTFww/KkxhvAx17AMb/R2qeeOdyCtUi8G6euWFURLY+mn9084+AqN/1oCP98faaHhK93yFKCWrZO3Hv+nwfSo=
X-Received: by 2002:a05:6e02:174f:b0:398:b5b8:a683 with SMTP id
 e9e14a558f8ab-39a1925ccb8mr3780595ab.9.1721771281421; Tue, 23 Jul 2024
 14:48:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1721413308.git.osandov@fb.com>
In-Reply-To: <cover.1721413308.git.osandov@fb.com>
From: Aaron Merey <amerey@redhat.com>
Date: Tue, 23 Jul 2024 17:47:50 -0400
Message-ID: <CAJDtP-TSVVk8mvjBLBVOqW=MOq-SgtSKEQp-_OZkZ=XrZgRNPQ@mail.gmail.com>
Subject: Re: [PATCH v4 0/7] debuginfod: speed up extraction from kernel
 debuginfo packages by 200x
To: Omar Sandoval <osandov@osandov.com>
Cc: elfutils-devel@sourceware.org, "Frank Ch . Eigler" <fche@redhat.com>, 
	linux-debuggers@vger.kernel.org
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Omar,

On Fri, Jul 19, 2024 at 2:24=E2=80=AFPM Omar Sandoval <osandov@osandov.com>=
 wrote:
>
> From: Omar Sandoval <osandov@fb.com>
>
> This is v4 of my patch series optimizing debuginfod for kernel
> debuginfo.  v1 is here [1], v2 is here [2], v3 is here [3].  The only
> changes from v3 in this version are fixing a bogus maybe-uninitialized
> error on the Debian build and adding the new test files to EXTRA_DIST so
> that make distcheck passes.
>
> Thanks,
> Omar
>
> 1: https://sourceware.org/pipermail/elfutils-devel/2024q3/007191.html
> 2: https://sourceware.org/pipermail/elfutils-devel/2024q3/007208.html
> 3: https://sourceware.org/pipermail/elfutils-devel/2024q3/007243.html

Thanks for working on these patches.  I ran v4 on the sourceware buildbots.
The new testcase fails on debian-ppc64 [1], debian-i386 [2] and
fedora-s390x [3].  There was a 4th failing buildbot but AFAICT the failure
is unrelated to your patches.

Do you mind taking a look at this?  The patches otherwise LGTM and I'll
merge them once this is passing on the buildbots.

Aaron

[1] https://builder.sourceware.org/buildbot/#/builders/214/builds/190
[2] https://builder.sourceware.org/buildbot/#/builders/210/builds/194
[3] https://builder.sourceware.org/buildbot/#/builders/211/builds/185

