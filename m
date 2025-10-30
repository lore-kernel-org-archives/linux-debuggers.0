Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 629F333F385
	for <linux-debuggers@vger.kernel.org>; Thu, 30 Oct 2025 10:53:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761821585; cv=fail; b=IPIVR6oFZHhDmcxa5SXPQA31cROkf21Vq1U2vh4zNKpcyHuz5WBOKoO4ZQPTgJoaWPu1TtvDGZlmj7Ul9hMoQGXnHPgCHA2bn7Nz9N3poGiD4H9X98aVzWXxlSr9pI2kp3Ihd7HSbaEloavz2DJwnKxIwNsrndZK8LQQG1EX/Ys=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761821585; c=relaxed/simple;
	bh=V5AuJgdHcr2u/AFQUhoXMac+YwbOW+L2jd+lMuLwUW4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=LDeSjL5AVP0NV3ELnrHIi9PV314DBSltTUDkMhzKy//5Ii4QYqYpLxK68DIvaKXXxC1BywtavhGnaGoMUAAbrYbr/NtDk7fvADU3FAa+wxSJN+huk9t6sA7Et5gMju8yghNC9zW+5tP3PQaYswqBtVvCMnyIUukePaou69OF22Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Z7+cLFPk; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=NnzoXU5n; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Z7+cLFPk";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="NnzoXU5n"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59U9N7B6023343;
	Thu, 30 Oct 2025 10:52:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=RE/vTkB4rRidkmBVE1
	AYYMQFFhsoN8wVuZSRST4UIB8=; b=Z7+cLFPkxJ0TOAuar67Lk4UEAx4JA6w4yT
	TTOScVgAxsvAhO4s95HNF75Sn0Z5AVR4HCX8cbKRup1j6Z/GEtR6JUeEVwGEb13G
	ILJgytEGxXdoWzV18YX9EtRiDpb8UVyvfpG8XAqoIhfl8qMkd6Lip1DFE6G8wck2
	+L6KolihUnTLqUvKDgHlPy6fhp9Q5sG/9g4vIvr80XeB5yX1P/fYwXbs0HmLD4hG
	WC2H4TubdX5bHXjOhshTeNSeu5s0D8FPlBc6eK+9B1EslVafIGEaRE0dfA/y6EoY
	rjsXYsmkiR8hauoJ85OeWzAcsVRx6mNKDaKousTOyEeD87OtpclQ==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a44j6gbe3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 10:52:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59UAYbTl034106;
	Thu, 30 Oct 2025 10:52:50 GMT
Received: from ch4pr04cu002.outbound.protection.outlook.com (mail-northcentralusazon11013063.outbound.protection.outlook.com [40.107.201.63])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4a34ed6s8j-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 30 Oct 2025 10:52:50 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wBNAlOu9mSrTJxvnHWLmAu5RoDKFYxNRusqwdk58MuKb8yqA3Tii0jJcuJdI5ACiRWFzlizq1+DBkpjoj9v7EtuYH3f7JrV5iJoOaXTsKu9cR7o+V9btZyoodphtDQSGa0ffWXowtHUsslzDAVcpbL7eJza2Z7Y+vGuZC1pK1z7LqHBNemtjmX/d8wpF4dwzRYYbQi0dZehnbi7Hq/U0Senj0c1GqcXEO9w1p6SAxdbXJRWQMp7gPSfbXt+48/5NOGu5wxHLICSuY0bgh4496ccnGl73+RIVP78GkUKp5+/eU/xLG5e59CM5rCGmXsFrLVDrFgcQQOVdJDsxJVUBQA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=RE/vTkB4rRidkmBVE1AYYMQFFhsoN8wVuZSRST4UIB8=;
 b=CjtNxRh1XbND2J333Vr60IxXPTYXczG+3MajRobNYhmVZdttV8cwWOuWvI6HlgEcZ7FUoBCCl84aiUtxa/k9N0FtO76FH6ec21/AA2XVuasR6GNO4aoouutDjZ/laXtENUa+28ji1hcdB0Xx1MjkGQMzytUsC0zHwENznr/10LHilO/sDu6TgQRJsvhKaJ0yQF2KzSfetFpYtY+jxd5OJPBh3EMnDzIXcyurMvXm21/DUpVqjRDongvXK+GHKPu6EN5bs98G5IKpcwp8SApGPTtixLOAFwxUAT2auHgVcuV0aayrtDp7A6ZlSYdpHHpYrM/n/8ZnmMPyp80WbbV2Hw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=RE/vTkB4rRidkmBVE1AYYMQFFhsoN8wVuZSRST4UIB8=;
 b=NnzoXU5nJRpBTn3acGVp0/y+hpnv5qZ1dbMubrF3qoIsLtTjCPu/uTR7Xv0BytI/JBAkIre6uOrqaSI73ivIW1meVoBLmkMICXK62v4F6lssgqBtaHlSROURMzV+1BVY9bqvLO1xyCiu9o7GvfKhRIGPCWCQXfW9jmCHNsGZflk=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by SN7PR10MB6329.namprd10.prod.outlook.com (2603:10b6:806:273::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Thu, 30 Oct
 2025 10:52:48 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%2]) with mapi id 15.20.9253.018; Thu, 30 Oct 2025
 10:52:47 +0000
Date: Thu, 30 Oct 2025 10:52:46 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Israel Batista <linux@israelbatista.dev.br>
Cc: david@redhat.com, akpm@linux-foundation.org, linux-mm@kvack.org,
        osandov@osandov.com, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2 1/3] mm: convert memory block states (MEM_*) macros to
 enum
Message-ID: <c26bc5eb-ef7f-4858-8ee0-2de013b53bf9@lucifer.local>
References: <20251029195617.2210700-1-linux@israelbatista.dev.br>
 <20251029195617.2210700-2-linux@israelbatista.dev.br>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251029195617.2210700-2-linux@israelbatista.dev.br>
X-ClientProxiedBy: LO4P265CA0299.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:391::17) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|SN7PR10MB6329:EE_
X-MS-Office365-Filtering-Correlation-Id: 344afbdf-4ae0-4595-2bc3-08de17a276c8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?GHapPdMsZimzccvi0ex8K7nhSrGegpu1crdi5x0vFl4LIq5PwIyLuwp4xbCY?=
 =?us-ascii?Q?qyjBN4JiMPfFqN+Bn6o3ssnTDWacZIiKoTAbpuBlrPEgPox+/LmW6rawIDPJ?=
 =?us-ascii?Q?pPWB87fjrz8sm54Adv/GgwdA/RVokuXXhRG50rBOdv4gAHzTUJ/PQ3D3CY7j?=
 =?us-ascii?Q?P4MhB+AJoeWWBo0c3aYaP8vwA8nmeY41cEphKquV0caDUglmjzyshcboJfTk?=
 =?us-ascii?Q?jWjIXPdNzKs2oqbWsmKrfk9a78n/reolW6Q2bLeqGUKwayNKlbQKjHyw+TBs?=
 =?us-ascii?Q?5JjScIKFpZaCnQ5ZskbqRNzy2ZEQQt/zbTbqPDmtBYYrlQ/tzTB/id+cmDON?=
 =?us-ascii?Q?58fpw+3m3BQicN4/sotv9FfGPM1F+TzUsKKsD4tRfVd8IlhaedxCMavpqtpA?=
 =?us-ascii?Q?RiWidlo05t4KBHzSd+OD3BwXA8NDtHxH9GM51V7+Nn4FYthz8rW3dDN9HbnF?=
 =?us-ascii?Q?kSkjBGOUkVzU7boa5tfxWPV4zempsUvBz7f05HNRXZSKCAybXB0AQnmYCTxP?=
 =?us-ascii?Q?C3a60xvnDWgSojRJwpq/3Ab1e+bjimWmbfwcJjQNe+FNTkQNFdqnvUfKqj3P?=
 =?us-ascii?Q?AdEChaQODvl/kQB51qKuIbgqWYAAzcpN0+Ujf0VnGPaUtCRLDS9vHVN/FOSn?=
 =?us-ascii?Q?4Ojierlzw/qTJ4638fE3MDTK1+8xdCoeSeRXv9woyuiLlswj/wMj1f8gVd/c?=
 =?us-ascii?Q?/GiWCXR2NLWVkx1wIZGDIN4kDumMgvemmxSHKcE4LalYvvINlLbHFAe9156e?=
 =?us-ascii?Q?5kf4smvKUpU2fcYdiK3KnURI6q8sY+3awCamJy6he2V3aC/9X/EqrzsOXQWH?=
 =?us-ascii?Q?ulDBDsXGfVEMvzZ1jaT8KUZ9Nsmu6Z0LWKB76WjvwwdNLlJeHWplugdBQa0b?=
 =?us-ascii?Q?JOLa3spH8/A0cI+umf5v+hgF0ZB0U5CVs8PfPwMCQURp2DMfP60kFmf9wSxj?=
 =?us-ascii?Q?f5oSkNw5ald5N9TyPVdIjmLyRHgei5ZDVjySWwGVd1gy0JTnhcne5N6frhU6?=
 =?us-ascii?Q?tzQ0QZO2OvpnanhPtqHo86bpxFPmb6ANNwmJbWEDcuTymNLazgLwYQVM1Z0S?=
 =?us-ascii?Q?L3tmP9Vw9/MvHPfTW4J2igsXGWdXqVwyZy6pQn4wYh4sRlkxiO5kiUO2tltr?=
 =?us-ascii?Q?o1yLhLqIc1wcVBoaLLmzmnmz0Bx+bfdePueMIZP1mz+5cURGNU5GEF13+DVu?=
 =?us-ascii?Q?nui3CRxIRaCwQVuKrwUjjyqQ4pnbsDZvmQIPX1RuqUMiYthaG6WodNm8I0/6?=
 =?us-ascii?Q?jGPW38Ol/zCpaJEC+EJh/NX2GPuZ8rQPoaAmjGpRym7YlAht+z16UuMwJoq3?=
 =?us-ascii?Q?JlxSFxsnLi7fYYn1NluJqsDQrcFPphtignHd6nrLwdwxCp7BpzV3XRS+r/nW?=
 =?us-ascii?Q?jBU7zSn1rB0/XwD/amHVdiAS4XYi8i+pQzoke11CgtD1qO/SBkI+R7vRKaMu?=
 =?us-ascii?Q?zMro7GIRrk7/Y+p7d1q4C23Ohe9Lp80/?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?tX5GswUb3Ad9vmXaOoUUOKd/hq54K8hD52ZNFiDVWvfEkbWQPGt4IKFusg0h?=
 =?us-ascii?Q?kGz75ctY2cFEHdIr/R+FjR6URSo5ZMBGfQo25xzkNZnsv7mbhDELIHHHS+Uj?=
 =?us-ascii?Q?pMnQl4YmBUw7JMkrZMUi4a0qJNo+/CnLl7u8i1s/waBX19obZ8YxuJyJiyFI?=
 =?us-ascii?Q?NrnwylOPWBoNE690KXKgsHd5bkaYCfgwO1n8UEDQrEFE+JuivaqPjJCzKZRD?=
 =?us-ascii?Q?D4AdGHioWCv1e/3BpJPEdKjug/qzlzAzzhlgYADwI7X09iPRT9W3rJt2DSdE?=
 =?us-ascii?Q?EkqdsUaGGd7CpPYcAV+Zx6+bp2QlYwsaujtbzb1Of2F+6wP3x5ao7AwF+Cuv?=
 =?us-ascii?Q?XPaA1P7QfZ448lTR4qd+78qu4PoQvX9wyGrTh+U1q2ME5vx6SVpQcCZ3jMVG?=
 =?us-ascii?Q?GYHPjYvU0qHn81UDIXYEdcbLjdMRB4E/ItEZQKk2bqnGSfK0hDYtRTiPgFmb?=
 =?us-ascii?Q?78F/6Be9aqwlAM0VdA0gfBSkCLVa5AW1ClnziFBqZ61REvIupPOgnmovSA+U?=
 =?us-ascii?Q?Z/BSG9FyZRqBVyCu1dzoKB5gcbfbQSv9GqMtHkiWUoJmPgdNPt9axE4MQqCl?=
 =?us-ascii?Q?9cybbRZReDlBBFJY1kOSGsK+l4NmcmYFwTm69TzEogghf9XTbSPsBwOFw/DZ?=
 =?us-ascii?Q?nrbaDN//pC59zzM2doD+rofmvb4QwKQVZICdmhdiTvj8Zlp11n+nJb00jvr8?=
 =?us-ascii?Q?wLooZVYXQOSa/Bd3/ZJZU5JPIjwzVKExyQ1kmbYPurjyIS0+VnRuzXvKKqle?=
 =?us-ascii?Q?wLMpHNK3lzH7PsapS9DzGvAMMRdfr6bt+9Ebu2WmRXMbJ3nGCHrbKFdYpsbV?=
 =?us-ascii?Q?bx2C1u7ecPWS4s4jlSgt7oxPT4zcaei4x2mI4MUeMK5wEmRmMfGwYTFA3zO4?=
 =?us-ascii?Q?2CfTBbsDzidLWlEuxAxs4yP3w8THpoy9WjamKFWR3uAI/ZNh+sQ+xFzs3RY8?=
 =?us-ascii?Q?LcttKAqs1FxEEUqmjv4wt+fMl8oFmcsF0D6DuptqsF504w9+3Qt+mxxgg9pO?=
 =?us-ascii?Q?V1DSDjpialaVRMOXIaCAjh11hduxDtG+kV7n+YxZIWsXaIZtZnQoZllgz9In?=
 =?us-ascii?Q?AHi/4aJsjEV0B8IWUje0cFxrtbptYEQ8Ikm6iMUIonbjj3r2/IOrNXlq6eIy?=
 =?us-ascii?Q?T1iyndSrPDRLWSjMsBef5Hvih4Emphm7UGT6RSPf2Dz3EiZU+59rka570vwV?=
 =?us-ascii?Q?Vu20mfJPO0CYEZINaW18PflBW9+AlGN3F0f223JS8IqbfbnyTMcFt6NhdiwE?=
 =?us-ascii?Q?Kzs9CQJle69+7rB0Bs/Er2wIPE80Y2ILPLMLgnkw/pxX3IGWjZfoN9yYdK+M?=
 =?us-ascii?Q?2tTZDwKRR4LOkd2IzPYnqnQCNzC3VxE0kE0vhPs0kch5LNGRu/TDD34mkPUF?=
 =?us-ascii?Q?a52FFSmzfz9st7HYqFSKZ2xm5oM2LTinds0yOx2Lbp0zrjm/wde1dwxIQ/eP?=
 =?us-ascii?Q?Y0Hv3Gh5i0fNiHlcqtkCTRlUhWSuOuqAXJqUFhqYfacCw6nnJb8KUF/c/VZb?=
 =?us-ascii?Q?VsvSq6Php2pA5e2wHwjYLch4gk5yo7twjwBwobGHVjpXlDaBRiBJlRJhFGFt?=
 =?us-ascii?Q?TJkM/9sf8AcSqKFxqlrKx2Bx7/YloMHW92M0xmwRpM1ShVla7N4PEumLOFhi?=
 =?us-ascii?Q?Pw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m8bHFOtq8CxBeccZ8AoJWlnRwtt6ntLbE7R4RpyFf7X+0madBY09H3EOtJ+/MGusffRgRaZ+ZGky3X7ej27YIl7S4q+sVYrNLAqSHd1971HC+zTYwFcjx9kawYgDxK4ti9OcNycE1mb96Mw6WVR0hXMhPjtEwXFelX9wsncPKd9P7FRoqOiPZCsYBFUoBteFgSLiSgeKa2cAtoxmBnn+iSy2Kjg4nVviGJM+rzHc7NvixxxL02VhTLQWOcbakY65OCR0yTux6Uc5m+6/OHVRRE2evwue+iwZIfT63iy/ED3HVyvKjgmCqiOzdheimVICXsKCeS3Z/Pb0ofMqkAKuOiw1YjWg4s0gpU8wiC+3953TlwRarBCWP4xHUb5EC6/p4y0wZZTT8ros5XaBGs6xoK5g+Q7gKzrkjtictwzt7ZLB/JDgeTel1oyaVJk2cvMVVENO2prUJMKLGl3EtRz/6Qvgf5qkORP+tiORSd2Nct9sdU/lguyIDYpVvwFXszDiHWntNigibjWeu6OfG+8aXA1vLGJ8/rmy41HjkIaOsmGoMIRa+vadmxeJbvEDlrpfwi5fWZ0y/9ere8EJpuYEH1UM6PNYizqaTsEw2WM++Jk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 344afbdf-4ae0-4595-2bc3-08de17a276c8
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 30 Oct 2025 10:52:47.8736
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: V33OO9wO07oCMnaKcOk1HZ6cHZGcyttc2BZ9NVc7Oq4PelCZDOXFq6OizpWcMniwE3LqqVs29EUKr03pQJnIqD8D+egdQ12XTlGvtB2CTb8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6329
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-10-30_03,2025-10-29_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 malwarescore=0
 mlxscore=0 phishscore=0 mlxlogscore=999 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2510300088
X-Authority-Analysis: v=2.4 cv=JJI2csKb c=1 sm=1 tr=0 ts=69034383 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=yPCof4ZbAAAA:8 a=3ijGbVWfl8UpqdsB1JAA:9 a=CjuIK1q_8ugA:10 cc=ntf
 awl=host:13657
X-Proofpoint-ORIG-GUID: j5z0Xs5hj0Ow_oR8EjfvA-wFGP8OFzcQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDMwMDA2OCBTYWx0ZWRfXyyw6w/Rx3+Eo
 0YX7aR4yjDk05mtMNSIuBq8T/rLgldcIRIlnviy7EYcQT4VuzxKN9tguHl8PGPU668zRtURfaTS
 S6RYCHCXKpobXZW4sEV6ktm3z8Zg9gKE6nYCDWKbWsETrsa9Vk0C2g6x4HJbiMwekxFow1k3X+Y
 e27eRAcQw+zlv0cITaPH7xK4Q0ykthyN4xfdLuLcD3AgOv5dX83iZgR83UHuKzCd0Q6vXrSV70L
 wOAnBVAGW7wE3UAIFf1/+NKv4GEGzbFpGxiA3/BfBYVrHhF9Vc8qipbAND3QEI/Gihz+UR8ju/y
 1+1NxibHuCMRxGXbvGhnALwybtjcWtThsh++YhpR03o/z3dgZmhlVagPNeAx6rKc3ey4hW0dNBg
 06r7PH3f9a88Q2g6xCgT3VvWFVPUDtEnorljBPqA0h6eW0w6yuo=
X-Proofpoint-GUID: j5z0Xs5hj0Ow_oR8EjfvA-wFGP8OFzcQ

On Wed, Oct 29, 2025 at 07:56:28PM +0000, Israel Batista wrote:
> Converting the MEM_* constants from macros to an enum ensures that their
> values will be correctly emitted in the debug symbols, making it easier
> to trace the meaning of each value when debugging with tools such as
> drgn, without the need to hard-code the values.
>
> Since the values are mutually exclusive and they are not exposed directly to
> userspace, I also dropped the misleading pattern (1<<X) that made it look like
> they were combinable flags.
>
> Signed-off-by: Israel Batista <linux@israelbatista.dev.br>

LGTM, so:

Reviewed-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>

> ---
>  include/linux/memory.h | 22 ++++++++++++----------
>  1 file changed, 12 insertions(+), 10 deletions(-)
>
> diff --git a/include/linux/memory.h b/include/linux/memory.h
> index 0c214256216f..f4e358477c6a 100644
> --- a/include/linux/memory.h
> +++ b/include/linux/memory.h
> @@ -64,6 +64,18 @@ struct memory_group {
>  	};
>  };
>
> +enum memory_block_state {
> +	/* These states are exposed to userspace as text strings in sysfs */
> +	MEM_ONLINE,		/* exposed to userspace */
> +	MEM_GOING_OFFLINE,	/* exposed to userspace */
> +	MEM_OFFLINE,		/* exposed to userspace */
> +	MEM_GOING_ONLINE,
> +	MEM_CANCEL_ONLINE,
> +	MEM_CANCEL_OFFLINE,
> +	MEM_PREPARE_ONLINE,
> +	MEM_FINISH_OFFLINE,
> +};
> +
>  struct memory_block {
>  	unsigned long start_section_nr;
>  	unsigned long state;		/* serialized by the dev->lock */
> @@ -89,16 +101,6 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
>  unsigned long memory_block_size_bytes(void);
>  int set_memory_block_size_order(unsigned int order);
>
> -/* These states are exposed to userspace as text strings in sysfs */
> -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
> -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
> -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
> -#define	MEM_GOING_ONLINE	(1<<3)
> -#define	MEM_CANCEL_ONLINE	(1<<4)
> -#define	MEM_CANCEL_OFFLINE	(1<<5)
> -#define	MEM_PREPARE_ONLINE	(1<<6)
> -#define	MEM_FINISH_OFFLINE	(1<<7)
> -
>  struct memory_notify {
>  	/*
>  	 * The altmap_start_pfn and altmap_nr_pages fields are designated for
> --
> 2.51.0
>
