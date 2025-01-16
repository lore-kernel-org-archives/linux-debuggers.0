Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D21E86323
	for <linux-debuggers@vger.kernel.org>; Thu, 16 Jan 2025 17:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737050351; cv=fail; b=gL4Vo+/Dmn7ConXcRD4QKT0D7MNoCkeSnYSEcw3lAQvkNjBR9m/yGc1+kGbys7i/1Pgw3GDSl5RGNyC0/tKCf+ua1l8DxVQJtJhkTUtC219BwKi0N1pv42TjuDY/GrkTDOvI+U2ERqC/CUwjaQlejyil2KMt4WstcI6N/4jY+BM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737050351; c=relaxed/simple;
	bh=qwWlQr++QLww1tqRyU5Gi+MX6Vt1D7KFcnRwZJNQA1E=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=rxd0GkdVHV+43AtXh0VHR6+c5g1Gu7KeCr2jVls5l4uRH6x/oY3k0QAlPLOyGKGVIF6FETcAdT4CSsuLOw0gsYJYBCxxSBpyTWAm8naTqN1MyY+qw11dik9EXHpsLM1ywiVDUoxn0a2zo/1+hPNuF7OAOoAI3pWyzW3rV2pN9to=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Mo48uLr5; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fbqc/qez; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Mo48uLr5";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fbqc/qez"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50GH0fCH024128;
	Thu, 16 Jan 2025 17:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=fyUZd5/QgVrw63Pfk0
	Dge4Kq/IG5G4wkawvctlo1Ge8=; b=Mo48uLr5/7OJ6VhS2Y6YoLEYlvAoysiRmV
	VIFagxUQcwgORrYrX4SGZa+Aeg3RnTo3MShDbNxiqu1L9MKRcOqeSsFaoxEZntpZ
	U5Vv/8dDp6PiM57g9OIakFtzUgGsJOrIlJMelB5ryC/U/KQ9Ksws9gkIW/eT867W
	hRxOL8ndakJeJBUrDjkRX3+j06vHS1xg+O0n0WXei5OAyS8wSlS18kXmArDYNntp
	Qvtf7rlfX6EeRdOMMF1G3H1sGiio/kCjt5eRHin4uauLh/lUUAHGrR0jQxS2fPhY
	uqaQbq3miBf3mHbUXEqvoAO8S4ZaVu4BfWcza/PeT79IvI52GWLw==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4475mfg6pw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 17:58:47 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50GH67x2005270;
	Thu, 16 Jan 2025 17:58:46 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2174.outbound.protection.outlook.com [104.47.58.174])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4473e5a0bk-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 16 Jan 2025 17:58:46 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ka5FSb5lz3gRD8czN7pcoz97vkY/19VXxR6VqRU8iEK+8chw7YL+owgQObqEY5dOHRm88TCif3u+bNY4QvREhWxID5iVtVXCxstrKIlV7yY13gBZjmPtMq3rpjwgUHE+4VGRqcxmtCW7XVNUwCXb8tYrwvLktkBWUkhc62I/whRCvIlXB9KxiE4MOGp1pIDpPnezqeNXYbKikLsXvWntgrlALw7tfk/OTLylMtRni5DrWfKfMjfAF4+wh9J0T3CYXuPuOZwyOC0vIeMfcvXm6Fu7R+Z6mN17HoNEA5ZrQOYkSqUKAiwQLtC1ANMM2Bf1sYjWnlfxau8ABN5iM1SrfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fyUZd5/QgVrw63Pfk0Dge4Kq/IG5G4wkawvctlo1Ge8=;
 b=sSJ4ebiwTg45ed6adzT0wMzK7paQWaz2MlFKR/wEPV7GKI0pxKom4P1DBkgcV0+uuX5DzI8P0kwUbnaOAPyTugXRWmnX0VHRUDbTWw445bxjD3M+/SNGAm8myvynsPm5XJweyVWy3GM880NhpwPwz8gZewwN2WOWhR3RvElNBpebTVwxrBXwUVhp1F9nLDWMrAnPc39KQAwaLAMSEglMnw44z97tUfbTfWIEWrpcIRmuCgZlsMWtg/n0Hzq67IQuhX22qUVn3VxOvhb5tOwRyDOnZG+du6otx9KNPaNfV55eJ3rLbll9xZU0BvcIzitjOoTwJOSv+Az5smdE9aYSCA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fyUZd5/QgVrw63Pfk0Dge4Kq/IG5G4wkawvctlo1Ge8=;
 b=fbqc/qezDhJGp8Ih/ZtU2vnkaYzq1GPjLTYWOdJWUXHxGXWrj3p91sD3SDn/fLisXAigBPY1VTrj/HFowQ4Jf6d4sRgxyoWgE0pVvlf7y36e37Zv0Mz0FcqwPQLHqYhUVWaOyF14BoLZOzvurYd6G3bXeOszAjAWvndR6fFeUYg=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA6PR10MB8037.namprd10.prod.outlook.com (2603:10b6:806:442::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.16; Thu, 16 Jan
 2025 17:58:45 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 17:58:45 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Andrew Burgess <aburgess@redhat.com>, Tom Tromey <tom@tromey.com>,
        Luis
 Machado via Gdb <gdb@sourceware.org>
Cc: Luis Machado <luis.machado@arm.com>, linux-debuggers@vger.kernel.org,
        Omar Sandoval <osandov@osandov.com>, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <87cygnoxi2.fsf@redhat.com>
References: <8734hmtfbr.fsf@oracle.com>
 <5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com> <87plkpqpuj.fsf@tromey.com>
 <87y0zds39y.fsf@oracle.com> <87cygnoxi2.fsf@redhat.com>
Date: Thu, 16 Jan 2025 09:58:43 -0800
Message-ID: <87frliskrw.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0007.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::12) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA6PR10MB8037:EE_
X-MS-Office365-Filtering-Correlation-Id: 1075f0df-ec72-4cb4-589d-08dd36576b75
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?usRmGFbkwvHzYs2H/7KFdYtGeuR1m/gpHalevoLIzQsjwASEGeBJDAFUmWDw?=
 =?us-ascii?Q?44JWQmWN52lRg+QKaHIV7zUJerdn/Qcy8smzV+4pp8OFQhg6dozQUWLfyVon?=
 =?us-ascii?Q?l2b0txdrjq+Qs/8Oq/UzI6alw688wLRB1oXUHv0v3xNaEbywjKCzgv/B967w?=
 =?us-ascii?Q?atHidRiEoNZTsh7Pyw6d7OyCghLhJnqFKYKJ6QgbSatRfsUJ/pKOw7Uc7gp3?=
 =?us-ascii?Q?Z9fNlT/ykzvR0/iUIBw53pt7byvtlpM62esdYEA3h5Rin2Iz/KXfCAnBmu0G?=
 =?us-ascii?Q?XPFzQqS/qNaSDGi2fWnYMHwpwBtFrz/nGhNBZv/e39lrVccqjMGZSLoHg79C?=
 =?us-ascii?Q?kRwg2hT9XZnvGC7OMSSVQlfrCdGWmjGLv8uQkgavY4W2fGCLPnpAclCl7euy?=
 =?us-ascii?Q?IEtEeMPZLpIDWXCHUVR+VewqR4jJjomCc2KoiN36xyG257Pd0NLHezDRlZAV?=
 =?us-ascii?Q?8QjU/OGfBcabKwOehjuEriFG/Yjn+2FXustg4dsDl6nRdtI3MSBdpU1pgsRg?=
 =?us-ascii?Q?6T8AL4HLV7LZ1qnME/OuZD3EdVKD30zwbP0Hzm0/n0DKPycgM5dNs74YFJEh?=
 =?us-ascii?Q?BdvPcR3bx2Rs8fYK8kN31TilB3hqowozox2YxIFfmcjJwWAtw5J+PnYxusLO?=
 =?us-ascii?Q?VqO1hOFQSxUOwp7gQf80R/8wIVEV3oOWk/nmEf8ZQAx9ZdF3Aep0QRJysPMs?=
 =?us-ascii?Q?fobD70xwD6mI7wHcaigGotl/kXDntqOulN+FmDV45v/ebP9HLsPaZyWRHpXO?=
 =?us-ascii?Q?llsKKZBZzNeDDTozKsVxxlvtQTleGGQernBnZ12WsDbHhcJydGpV9927zZx9?=
 =?us-ascii?Q?eL2UHW9nocY1lRWZkfH/EiLYbRS08LgBCG91QqnRef4VqE4moizzRM9ydjTf?=
 =?us-ascii?Q?R1odgZbX8ap9qldluhuqgpU8BO9RCO2xKSxvRUu/7j5AABBWeTQGWD47hX3+?=
 =?us-ascii?Q?RNVwVMcBLwglRqYm3lpoLPlZJ3Agseng+TMVhBZPrWpEZWcqZhuTKobo8ZKN?=
 =?us-ascii?Q?koJ7I9+avwwhx4iW1dU4Y3LfPN+tU2tVlJMpqNAdW7hvy86YtnCMhHCtm43R?=
 =?us-ascii?Q?tP8nCfGBOBJuyncOcqk8MLKqMGPC/Qf7EtC6uhNDGmGZj4piK7hs8nH+Fzvz?=
 =?us-ascii?Q?JQ0Yc4wbngWWdAG76CsGZG5qczCM9DyC2xelB9DZEUhY0OOyivGwaurGeCn6?=
 =?us-ascii?Q?vw1+Lt65k7wSjixFZ06IaYwxqSTZe8nZjm3TLAOM8qi0W2cq+6gk1aZrt+4Q?=
 =?us-ascii?Q?n3bacH9q1N4j/WaV5DjtECjev+DvAa0T4aP5qskQ+UNo3bMrwdyNpSZM2Jzs?=
 =?us-ascii?Q?Mepz73NtPriyyf8LhNeB3x2pMsrvwEwf4QoD/LFFir0e3A=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?MbEZRqgV1n5jXP5Mzo8fE8ygKpTlkuJ4oMc+YYOv7R/QMM9DAZgSxBi6pM2F?=
 =?us-ascii?Q?2iRFxwVGiNcDrOBMTBTaMz3Pdc2brtpufXHLRsxOSXpmntXF2tCsa5H0yj3j?=
 =?us-ascii?Q?Yph+tkhH5oM8YL77MTWYAtjSaVT495Mjae4puATNEUVlhSBYf+kf7ju20imA?=
 =?us-ascii?Q?sJUacwW+RgRH1ZerKUj6K3Qd80Q2Rko4F6FzwfCuDSNnUfLVeo9jWwecJQcI?=
 =?us-ascii?Q?UiR3swLcK7/3qjciHjb3tk6+LnSd2Kkohuu2Rg94wH+ZlIPVZNwrQ6kNelg7?=
 =?us-ascii?Q?cfcYgqb1cLvCknJChZD82NTn+HUrVbmorzNllN/5JQ3j4U48UbBiuNd/5QOV?=
 =?us-ascii?Q?UEiGrDbkJr236RUDgmZ2EHCvl9LCVV3HEGRC0IwRCdyQCc2KZjKEDjnWUp9F?=
 =?us-ascii?Q?LUvkwc2yXK+5jK2AI9uhaiQ48Fll4ZBbWwyslqHhP8dPw0mvDowAlBK81A10?=
 =?us-ascii?Q?CDe/eQYv643J1C9at8/kyChLEeNTnYDkgFPjfJQ2FXSzptVrmAAfLdXTNhcD?=
 =?us-ascii?Q?TD+OT8Vub6OAz3SP2rncliO67XhdxvenOv8f5M9IFYPlDIJaIix19PhLWziP?=
 =?us-ascii?Q?zN6C4pj+8eqynoocN+h3exSH8tM6Cf94AJh1M2dBqLNOBRijZ6/UL5lUcFow?=
 =?us-ascii?Q?J8SSymDOAagcd5IS+nykZzvzX7KtpWF0hiPi2ISjK3aSfKum25C/rtQY+smq?=
 =?us-ascii?Q?zPhlXdhmrCVhKXtdL/x8jUzDOGfuP0qnR6XjT5UgHra99FDXTWAVzmKmw2Fr?=
 =?us-ascii?Q?m78lLHOrmGhXDp8XCmQWRAQptP7fCJplK12tAfdO38mzUY43GSjxZJQLre/+?=
 =?us-ascii?Q?fN2HL8rOjE0Qg+hOLPGWjcyNBSftnhdQzT/4W0MFkj2TAfPWk6F9S3cMjU9n?=
 =?us-ascii?Q?1eu5PYpnmhjrAer2RfYnxHcS7vsnc9tz2ME1W7lmZqJpgXnk09ZgRBoA99uJ?=
 =?us-ascii?Q?5MUpdz3ViO5fX7M3Vq1OZyLK62yfOSehLjceK4QVLEAvLzsfbGLWpX+VP0Bq?=
 =?us-ascii?Q?pr49LWqRMiN81df1+K4xCWcv3nKbp4bP+jLyfZdpXU3VkvqfuwwLAPjuEOZ4?=
 =?us-ascii?Q?d3Qw8zBuJh2QOJeP6Pz5JdtNc+d5gRrfZGaVITMVp+j8uaZxvZFIg3leUI8o?=
 =?us-ascii?Q?tbWeVwc/7nFiChK0JoJk28wcSVb53ORAyS6AObe6iywEH54eu9PC3eAVogCa?=
 =?us-ascii?Q?OXLzLpBQlP1Yr1z8W55gRB7Cn6zSEnR+jkcji9FNwUMfq/nf9PVZP8Z6NEFn?=
 =?us-ascii?Q?Xv+dwXiY8jot37wS2EUrC89P0jGstLsZTg5nPGK03Emmq7XAt/NcfBpUbxKc?=
 =?us-ascii?Q?pZiYmw6BL4goelanfn/ue0kcCP7rIBHlCSHdu+XlXnkUmHy1XrHi4ojPyVzA?=
 =?us-ascii?Q?f6qv4qoUx64KR8yx2/78KPXE8+4hNwRpD5bJE1VtfB/eIK3Av7Bo5XnoUt66?=
 =?us-ascii?Q?9j0zeAe2f3D+gEi/IZW0IWGKfIxFIBxMWo913aYw3Pk0g6VpzKKyxfUdhkF6?=
 =?us-ascii?Q?K9xb2p0hZyjwN3o5o8l5NuZqzd269nEhWcD7oJqVGqCw3dilRuKg6MvplQOd?=
 =?us-ascii?Q?3JlW8eZDKjDKXrV7F2PgjpWaA9cw5Hq4ZE0ZA1vYvN4XQOc9N3pRyGcbuFRR?=
 =?us-ascii?Q?pA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	7R+4Uxdol9Z5bnMqCmqu+DgBJvIxOtID5c3Ob03sVUI709W3w+cr4+OBZb+ZOK0Uf3Gfn4p8bZndckh+MCVaHFpaZqStNuHGIEtIlCpmLF13cxqda8J5JLWhgVhgCEiW36aFkDvxP05nisAHvROdXMecLRDtieLqf1c3oNdLKqruy3PG//EwLW+7HutuShj6hDF7GCOY0yeUxXmVkq4Er/fF4O5xMWY9LNzjxAl/0L8WE7CMCat81vxI4mI7xZThzRwfVU2HUz9oyvWYYRp3AHaOjrU3BCBzNmNNFUKRmxxkQkxH2K+9TrddkxHZrMHTaZpjRyoMZ64gIORcIvq3AkzzU+KOz5BoZrCTIA/ul2a0pIREHi5pkDBztgGl9q2G8tcGJXjkVnJ6HD1XHIt0qCqLYHoNrYmOUfkKavg3VOQFNDpqkFxSriYKsr1oVPoDvVcRoqzuBAbChOeuZSlj2wmfs2KZ63cafOaFGB3+0TIjpFdYVSmrY9k2v1r845gHC2DXvI16effksKEOBP//iE7zqNhbHJBT4bjOdJS5RIXUGCKb6SNIYRO8nyaXIdoxclqj0PQK0MuBoTBJVAqmQ5awYyGCCdCH5jtFccrrs8s=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 1075f0df-ec72-4cb4-589d-08dd36576b75
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 17:58:45.1011
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: XJiRNP1L1DkH1np9Zq6XtTDkUWwF6thtLYRP0F/kEwUyGLP64flYxg8G5QaYzemWZGpM8QKUU+PzGTDqCcUUFTv/NrH2l/1+buDHs3OgXuM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8037
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-16_07,2025-01-16_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 adultscore=0
 spamscore=0 mlxlogscore=999 suspectscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501160134
X-Proofpoint-GUID: c983TrPTsmHqLRuyfU90KACUqeZEbYEe
X-Proofpoint-ORIG-GUID: c983TrPTsmHqLRuyfU90KACUqeZEbYEe

Andrew Burgess <aburgess@redhat.com> writes:
> Stephen Brennan via Gdb <gdb@sourceware.org> writes:
>
>> Tom Tromey <tom@tromey.com> writes:
>>>>>>>> Luis Machado via Gdb <gdb@sourceware.org> writes:
>>>
>>>>> To sum up, my specific questions are:
>>>>> 
>>>>> 1. What is the maximum protocol packet size, if any?
>>>
>>>> It is hardcoded by gdb, but the remote can also specify that, but...
>>>
>>>>> 2. Would this functionality be better implemented in a single "q
>>>>> linux.vmcoreinfo" packet, or as a "qXfer" packet?
>>>
>>>> ... we have packets like qXfer that can handle multi-part transfers. So the
>>>> packet size is not a critical concern anymore, and it is best to use this
>>>> newer mechanism, if the usage fits the packet structure.
>>>
>>> Agreed, qXfer is the way to go.
>>
>> Thank you Tom & Luis for confirmation, qXfer seems appropriate. With
>> that approach the buffer size is not really a concern: we can simply use
>> the minimum of the requested read size, and the stub's buffer size. So
>> long as clients use multiple requests until the data is fully read.
>>
>> While the "os" object also sounds like a good place to put this (e.g.
>> within a new annex), it seems like that contains XML-formatted data with
>> well-understood schema and semantics. The vmcoreinfo is free-form text
>> (generally of a "key=value" format), so it probably should be a separate
>> object.
>>
>> So I think we would prefer to add an object type, e.g. named "vmcoreinfo".
>> (But please do speak up if this sounds like a mistake)
>>
>>> If you're adding a new object type, a patch to the manual would be good.
>>
>> I'll definitely include a patch for the manual in the plan for this.
>> Another patch I'd like to write is to allow GDB's server to expose this
>> object type when the target is an ELF core dump with a VMCOREINFO note.
>> We're hoping for this to useful for all debuggers, not just drgn.
>
> Hi Stephen,
>
> I took a look at the wiki page and it seems like initially at least,
> your plan is to make the information from vmcoreinfo available via a new
> 'info' command.
>
> It is possible to send remote packets through GDB's Python API[1].  And
> of course, the Python API allows for new commands to be created[2].
> There is a test in GDB's test suite that makes use of the packet sending
> API, and it happens to send a qXfer packet[3].
>
> I say all this not to put you off contributing a patch to core GDB, but
> if what you want is a new user command which will send a packet to a
> remote target and process the results, then it should be possible to
> implement this as a Python extension.
>
> The benefits of using a Python API are that you can ship the extension
> with the kernel, so if/when the vmcoreinfo changes you can easily update
> the extension.  At the very least, it allows you to prototype your
> commands before having to submit patches to GDB core.

Thanks for this reference information & code, it will be quite useful
for prototyping, and likely it will be of use for the GDB scripts that
already ship with the kernel.

The main plan for this is to implement the stub-side wherever possible:
kgdb, GDB, and QEMU's gdbserver, being the main places I think it would
be used.

From the client/debugger side, the Python approach may make a lot of
sense for the GDB scripts which are bundled with the kernel! I don't
necessarily know whether any users outside of the kernel would care
about an "info vmcoreinfo" command, so it does seem simpler to keep the
client code with the kernel.

The other anticipated client side would of course be drgn, which will be
adding support for the GDB Remote Protocol, and will use the vmcoreinfo
as an essential part of its startup to learn about the target's kernel.

> I have included below a very simple example that implements 'info stuff'
> which just displays the 'threads' information from a remote target.
> Place the code into 'cmd.py', then from GDB 'source cmd.py', after which
> you can 'info stuff' and 'help info stuff'.
>
> If this is an approach that might be of interest then I'm happy to help
> in any way I can, just drop questions on the mailing list.

That is very kind, thank you!

Stephen

> Thanks,
> Andrew
>
>
> [1] https://sourceware.org/gdb/current/onlinedocs/gdb.html/Connections-In-Python.html
> [2] https://sourceware.org/gdb/current/onlinedocs/gdb.html/CLI-Commands-In-Python.html
> [3] https://sourceware.org/git/?p=binutils-gdb.git;a=blob;f=gdb/testsuite/gdb.python/py-send-packet.py;hb=HEAD#l100
>
> --
>
> def bytes_to_string(byte_array):
>     res = ""
>     for b in byte_array:
>         b = int(b)
>         if (b >= 32 and b <= 126) or (b == 10) :
>             res = res + ("%c" % b)
>         else:
>             res = res + ("\\x%02x" % b)
>     return res
>
>
> def get_stuff(conn, obj):
>     assert isinstance(conn, gdb.RemoteTargetConnection)
>     start_pos = 0
>     len = 10
>     output = ""
>     while True:
>         str = conn.send_packet("qXfer:%s:read::%d,%d" % (obj, start_pos, len))
>         str = bytes_to_string(str)
>         start_pos += len
>         c = str[0]
>         str = str[1:]
>         output += str
>         if c == "l":
>             break
>     return output
>
>
> class InfoStuffCommand (gdb.Command):
>     """
>     Usage:
>       info stuff
>
>     Shows the remote targets thread information.
>     """
>
>     def __init__ (self):
>         gdb.Command.__init__ (self, "info stuff", gdb.COMMAND_DATA)
>
>     def invoke(self, args, from_tty):
>         inf = gdb.selected_inferior()
>         conn = inf.connection
>         if not isinstance(conn, gdb.RemoteTargetConnection):
>             raise gdb.GdbError("not on a remote connection")
>         string = get_stuff(conn, "threads")
>         print("Target thread information:")
>         for line in string.splitlines():
>             print("  %s" % line)
>
> InfoStuffCommand ()
