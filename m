Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 606C8C46467
	for <linux-debuggers@archiver.kernel.org>; Sat, 14 Jan 2023 21:30:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230478AbjANVam (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Sat, 14 Jan 2023 16:30:42 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230366AbjANVal (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Sat, 14 Jan 2023 16:30:41 -0500
X-Greylist: delayed 343 seconds by postgrey-1.37 at lindbergh.monkeyblade.net; Sat, 14 Jan 2023 13:30:40 PST
Received: from bee.tesarici.cz (bee.tesarici.cz [IPv6:2a03:3b40:fe:2d4::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD82D7ABE
        for <linux-debuggers@vger.kernel.org>; Sat, 14 Jan 2023 13:30:40 -0800 (PST)
Received: from meshulam.tesarici.cz (dynamic-2a00-1028-83b8-1e7a-4427-cc85-6706-c595.ipv6.o2.cz [IPv6:2a00:1028:83b8:1e7a:4427:cc85:6706:c595])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange ECDHE (P-256) server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by bee.tesarici.cz (Postfix) with ESMTPSA id D317813D181;
        Sat, 14 Jan 2023 22:24:54 +0100 (CET)
Authentication-Results: mail.tesarici.cz; dmarc=fail (p=none dis=none) header.from=tesarici.cz
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=tesarici.cz; s=mail;
        t=1673731494; bh=hMk1QmgVUtk2M7rRuRt01fcGEN4VyXCBy1u67Z62GVE=;
        h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
        b=5CEbEJw9gAtKi6K2aTktPeKOkyMrwMwUya3xYsclsZwUoXR1ccjKdZZ5QBtuh4Yon
         4Kax8usloLz+U/exCU8XPnhbv8e45Xnl9KAZ0F357L78nPkX986pzU3v1K1KhkkBiK
         JJd+hrHIGdfsgf1OOcvv+3amJQu2gqEvxowBZO7XkcHcpDrVlDkI6SkyiI3B4OBKBI
         qgtIbL43uUMEB2eLBPdF0YcsPeFwxObxukIyzKJxLM9H55DwVXyhiZZ9b7auB4st+8
         lXdsmu81ivvEMp8aVg3BLE8VQqWSZ6+GuRSmbY3rQF1ndU3l8lXxhl2YK3BpKMTNcN
         13c8jO7CSwzrw==
Date:   Sat, 14 Jan 2023 22:24:42 +0100
From:   Petr =?UTF-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
To:     Stephen Brennan <stephen.s.brennan@oracle.com>
Cc:     linux-debuggers@vger.kernel.org
Subject: Re: Diskdump / kdump format history
Message-ID: <20230114222442.1a2ea5d2@meshulam.tesarici.cz>
In-Reply-To: <87v8lbcmc9.fsf@oracle.com>
References: <87v8lbcmc9.fsf@oracle.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.35; x86_64-suse-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/shxyA99y=Jf67tX55OV059.";
 protocol="application/pgp-signature"; micalg=pgp-sha512
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

--Sig_/shxyA99y=Jf67tX55OV059.
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Stephen,

thanks for your trust. I've been around for some time, but I actually
came late to the party. Below is my understanding of what happened.
People who were really involved in all that may add a lot of
corrections.

On Thu, 12 Jan 2023 16:25:10 -0800
Stephen Brennan <stephen.s.brennan@oracle.com> wrote:

>[...]
> First, regarding naming. I guess I always assumed that "diskdump"
> referred to some older utility which performed the same function that
> makedumpfile now is commonly used for. Is that the case?

Not quite. It did not perform the same function...

Let me make a short historical excursion.

When I joined SUSE, SLES9 was the latest release and it was based
on kernel 2.6.5. There was no kdump at that time, but a team at
SGI worked on LKCD (Linux Kernel Crash Dumps), which was an
out-of-tree patch to the Linux Kernel, some user-space tools for
setting it up and the lcrash analysis tool (which was, as a matter
of fact, simply horrible). Most importantly, the dumping itself
was performed by the crashed kernel, using a special polling mode
that was implemented by a few device drivers. LKCD offered two
options: netdump and diskdump. This is most likely where the term
"diskdump" was first coined.

> Do you know the origin of the diskdump format?

Yes. Fujitsu developed their own Linux kernel dump project called
lkdump. It was conceptually similar to LKCD, as it also ran within
the crashed kernel, but it did not use the LKCD file format. IIUC
they first modified LKCD for their Mission Critical Linux (or
MCLX), but they soon discovered that there were some issues with
the format itself and designed their own format with the signature
"DISKDUMP".

> Do you know where to find the code for
> this older diskdump tool, if it existed?

Yes. Have a look here:

https://sourceforge.net/projects/lkdump/

> Second, I have some confusion regarding headers. I've seen headers for
> files with the content "DISKDUMP" and "KDUMP   " -- and according to
> src/kdumpfile/diskdump.c, you have too. diskdump_probe() shows that you
> check for these two headers and set a different description depending on
> which is seen. Do you know why or where these two headers are set, and
> which one is chose in which situation?

"DISKDUMP" is the signature of the original Fujitsu lkdump
files. "KDUMP   " is the signature of the makedumpfile modification
(that's the meaning of "_mod" in makedumpfile's diskdump_mod.h
header file name). Yes, there was a header_version field, but that
wasn't deemed sufficient. Since the lkdump project was not known
to be dead for sure when makedumpfile was written, Ken'ichi
Ohmichi (the original author) was afraid that lkdump might make
conflicting extensions to their format and bump this field,
leading to two incompatible file formats with the same signature.
Note that makedumpfile was a project by NEC, not Fujitsu.

> Third, sometimes I see an additional header with signature
> "makedumpfile", and a few 64-bit integer fields, and then the
> KDUMP/DISKDUMP header occurs at offset 4096/0x1000. I wonder if you're
> familiar with that header, why or why not it occurs?

This is the flattened format, which is used if makedumpfile writes
to a file descriptor that cannot be seeked, e.g. a pipe. You
should rearrange the file with "makedumpfile -R" (or the
makedumpfile-R.pl script) to convert it to a standard diskdump
file.

> Finally, and this one is a long shot, do you know any good central
> document describing the diskdump / kdump format? From everything I can
> tell, it seems very much like a "living standard", one which lives in
> code more than documentation.

This is very much the case. For the "DISKDUMP" format, whatever is
in makedumpfile's diskdump_mod.h is authoritative. The "KDUMP    "
format is essentially dead.

HTH
Petr T

> But I would be glad to be wrong here, if
> there's a document which describes the format then I'd love to read it,
> and if not, maybe I could be part of creating it to help everyone out.
>=20
> Thanks,
> Stephen

--Sig_/shxyA99y=Jf67tX55OV059.
Content-Type: application/pgp-signature
Content-Description: Digitální podpis OpenPGP

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQQR36mnYrQDNXFnn8/Pem5ZkryZSgUCY8MdmgAKCRDPem5ZkryZ
SvV/AP9+zpl+RMb5vwOrARokzfzDzz1RPG6wY4pDJaxuhQJ17AEA6n5LxXNJKKSF
lGlQHrOaRXSndzHSzynSYi7XDfC5MAM=
=x5tE
-----END PGP SIGNATURE-----

--Sig_/shxyA99y=Jf67tX55OV059.--
