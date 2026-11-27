Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.217.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795796798;
	b=2LdKF+SW7gWgjbMOHQXNQeATvCzKf6ffR2A6aLeTh+h5IPkYrLHX7rCG6OhMGbVoQ3ve
	 ziswbPBjimbEyXczf0ADJe0Jaqmf/snI33zI7srgGwMD+fMLXLhu7jfTUZB1Q43kfKzKl
	 gr4gwx7alRYeXsiVtOyVc+95PCLb7KVKawlDD3GFcI6zcjP0hVKr6Cxldsc2oKYoSZDMa
	 pjG1Ya96AtxQ3onC80Fuf7HsyAqgTCEHmQYpEh/egkkFi/XXdlb5ibnxv8ZD1RRbaQDPE
	 hInqEcdrZgDK09T+bYOP0rnv4Mb4y+QScUc5jKhPEv1V0zzSoONlebjM2AUHVTNi/HQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795796798;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:CC:Subject:User-Agent:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=G0lbW3aGJSHSzgdIbKHhvksROcZzFNKvKUeYkD4Vw7w=;
	b=OaH8qjH4rm7fMBq+l+E8+MfD266rq2EagN9CcrOH6VMbcDU+LTP35bb8gZnUym/iEkFY
	 CDhuxl4S+IJT++K8f/AAOPYVdYB3uEcG8thMeV7q33ocj/r9XX9iYW+GSHiYwKbymxMzX
	 +dIFZInmnPJMUygVyRBzakyQj8rZEfvcXdHwgVITQR5AP32v/LcmPWrytYeLUs7WpZZoT
	 V1ZGsEdYUWumvEkTyRjR/rlEFmCHDXVhrAOvH33wXU35fmsmP+I+v1Yl5kxwIfY2G9bMt
	 emnB5wGhlz6gn8vHLT8JGh6TwoNnLiUl0/Z0eOQ8svd6ANd8ypyb8JjlFSX56FjbhdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Su4nTr5T;
	arc=none smtp.remote-ip=209.85.217.46
Received: from mail-vs1-f46.google.com (mail-vs1-f46.google.com [209.85.217.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24017606A31F
	for <linux-debuggers@vger.kernel.org>; Fri, 27 Nov 2026 16:26:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 24017606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Su4nTr5T
Received: by mail-vs1-f46.google.com with SMTP id ada2fe7eead31-7cc53938a8fso5723342137.2
        for <linux-debuggers@vger.kernel.org>; Fri, 27 Nov 2026 08:26:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795796797; x=1796401597; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=G0lbW3aGJSHSzgdIbKHhvksROcZzFNKvKUeYkD4Vw7w=;
        b=Su4nTr5TJlhZsL7ksXYCT5DNp0Mk73XPBPqTK+wB7IpRCFbqpufmw6bjGArmXb7Lum
         Lw9kjakOmWztQVYVzvtlGA7Gn/hAuPC+wxOSt7TylYwZqU+yvwerlZSbEs54Vlc7k2DE
         cADrjt244s3qC72UnDliBP8LKtuFzVDCfWUoNxl9kbnLDStLtGcDeKoWUfwQMN16s7H5
         gf4WUU6N6X5HHFOiyo4kvwHse/ACImLdNQ5YDtjOQ0vBL5CwBZcBSyILDrRM+j2KhMgr
         /0wxEExVQBkGvU7F03cBB66pdxC9iazs9Yp6nL3CPHovF6r5NmvK2cxi4pcHXp59yxgM
         d6ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795796797; x=1796401597;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:user-agent:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G0lbW3aGJSHSzgdIbKHhvksROcZzFNKvKUeYkD4Vw7w=;
        b=F/m3pr7gE0B7IpYvXP9/itAgjm8hZV7ezLYt9oZInnfCewnSJF1l6JMAA16PTAZfxE
         CTv17WVd+E+LiZno+2UKxclKRv5/b8c/xj9pqBGOVDC/SZnJ4MjUFPfqwZwmMkn1u1fg
         HuA6VLG8gPvZ+Q8owsJNzA8m6Ef9d5cJTB2FtDe8t/l7Qn0/sa3tuGj3c9fqKMa93Bmv
         DFVjQcvy+NGOQEID78l7W3qylJIKfkqCK55kkPwv/4e3OXHKzFUjs+T2qpJ8SYUzuz7W
         2nwh6ojvrj/M65S8e+/nsTq5quJkdgxe0B/j/a5ST6UbHotdYZPTjArZkmg44mCjLlyE
         811Q==
X-Forwarded-Encrypted: i=1; AL+hErHresNjFYz1Y6HPN5u9yHT7FZFffjmkQoOVDk3WgspA1yn6z4JYJ2O6PcV/oHJyzufw9Qv5yWKX+QF3Bt4KK3c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+h7cH+HeTMf5Rkhk33UHeArqeORI9MHF6zr6fZGrw8mFRPl/SI
	Jlrh1jT+RaNv3vaWJ5kb71tEg3Xt8TjcsaaZ3E2jOZA7icrl0GcrzcX1
X-Gm-Gg: AZFdTZcaUvG6O7/a4EbafCnBDzgJJvkr2EcMxyzukF9UreUrK/6pqO3S05c8wk7412X
	wu0sMBNxEHnfImJ4CjS8jO3LhOomm0c/iaIDbpQjWtJzl6i/8gg7+Mz0A4VP6LE3a1500RQyHQh
	eZXAuhz/tE01TGB1EG5pKQuhJiV8XaaMTYLnO1h52wZUgLfBnaWuXSRHUglZGk7Dpu+MmFluUPE
	JIiDkdioHWm52+/WQ0+PBNoqVQBHpvVcewutsr3KUo381+r5JWCpbnlBakyW6kkElpIJWls8QoG
	Sf12De3798OXDawBiyTYi08sCciqWOf4p5SZNeNFtyJRRXq9sGEIF7VarK9MV+JtW5BDbSv3AUE
	3uD8QzPlIJ81SQ3AtHwpLKRQ4RVUdtgXm2aC1aU0WE9mOEomThYXR/EpaNNG59hbxz2NyiTJBI+
	gRpI9wtZC4MpKIvcdnoA1t8BvpYawmG+lsCTH3v6rAhWNxLGyS3GvVBi50Z/YDhvaj+G7NLZ7aN
	xQKvCjqm57kRq5zbQv9rCGevLsvj/yHY4yrm3+mCSFmXMu4GrGWXLrkIyTHJtyorWOAMthF5v4V
	gO0V5IJ0uoq6vftOEiHz8EYkPHBt1TOUUz4IQlc8yTKDOg==
X-Received: by 2002:a05:6102:1492:b0:7cb:bb33:8413 with SMTP id ada2fe7eead31-7d7393ff54fmr15250302137.9.1795796796884;
        Fri, 27 Nov 2026 08:26:36 -0800 (PST)
Received: from ehlo.thunderbird.net ([2804:388:90c1:771c:18eb:ef7b:e7f8:aab3])
        by smtp.gmail.com with ESMTPSA id ada2fe7eead31-7d6e81cee49sm26337881137.8.2026.11.27.08.26.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 08:26:36 -0800 (PST)
Date: Fri, 27 Nov 2026 13:26:30 -0300
From: Arnaldo Melo <arnaldo.melo@gmail.com>
To: Alan Maguire <almagui@kernel.org>,
 Stephen Brennan <stephen.s.brennan@oracle.com>,
 Arnaldo Carvalho de Melo <acme@kernel.org>
CC: dwarves@vger.kernel.org, linux-debuggers@vger.kernel.org,
 Alan Maguire <alan.maguire@oracle.com>
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_dwarves_2/2=5D_btf=5Fencoder=3A_f?=
 =?US-ASCII?Q?ix_DATASEC_assignment_for_ET=5FREL_files?=
User-Agent: Thunderbird for Android
In-Reply-To: <7b0e61e9-5b8f-49b8-afc0-a56be82ed0ee@kernel.org>
References: <20261119185236.4113166-1-stephen.s.brennan@oracle.com> <20261119185236.4113166-3-stephen.s.brennan@oracle.com> <7b0e61e9-5b8f-49b8-afc0-a56be82ed0ee@kernel.org>
Message-ID: <1EBC126D-E4E0-4A9F-8873-7D693E7C72E1@gmail.com>
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



On November 27, 2026 1:12:06 PM GMT-03:00, Alan Maguire <almagui@kernel=2E=
org> wrote:
>On 11/19/26 6:52 PM, Stephen Brennan wrote:
>> When building a kernel with the global_var feature, I encountered some
>> kernel modules whose BTF encoded a DATASEC named "=2Edebug_info" and
>> assigned some variables, such as "__this_module" to this section=2E
>>=20
>> For ET_REL files, libdwfl assigns a synthetic address to allocated
>> sections, starting at around 0x10000=2E Non-allocated sections, like
>> =2Edebug_info, start at address 0=2E If large enough, a non-allocated
>> section's address range can extend past 0x10000, into the synthetic
>> address range of an allocated section=2E This can happen with Linux ker=
nel
>> modules, resulting in the above behavior=2E
>>=20
>> Pahole iterates the sections in order, so if a variable's address falls
>> into the overlapping range, and the non-allocated section appears first=
,
>> pahole assigns it to the non-allocated section=2E
>>=20
>> Currently, get_elf_section() has logic to filter which sections are
>> actually considered for variables=2E It uses a cached value of sh_type,
>> but we have no cached sh_flags=2E Rather than cache more data, we can j=
ust
>> filter out ineligible sections when we initialize the secinfo array,
>> allowing us to remove cached sh_type altogether=2E This keeps the
>> eligibility logic in one place, and removes the need to cache a field=
=2E
>>=20
>> Signed-off-by: Stephen Brennan <stephen=2Es=2Ebrennan@oracle=2Ecom>
>
>hi Stephen, this one needs a respin I think as the context in
>btf_encoder=2Ec has changed; did you build on top of github=2Ecom/acmel/d=
warves
>perhaps? Latest is always at https://git=2Ekernel=2Eorg/pub/scm/devel/pah=
ole/pahole=2Egit/
>
>Arnaldo, would you mind syncing next, master with pahole=2Egit? Thanks!

Will do it later today,=20

- Arnaldo 
