Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A724F1E4A4
	for <linux-debuggers@vger.kernel.org>; Wed,  2 Apr 2025 23:18:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743635924; cv=fail; b=jNyOiNcChctpE3RAbgppaoCLTkf5Ru79HxRAeP/JfHYPir+snV+gYI4hdubD7hAe3K69HzK3VHlAC73l5/p0wDsG+7zsswVA17LsXpqjDYAjOpTsigvf6DvBYC5WnBydKUi9c40Z8t1C4f6kpZPI7EnFxEuKExcLLPmJu2UXGcw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743635924; c=relaxed/simple;
	bh=drETnGa6mMWKupwwEyOu+b5Iyxrw6rFNcQjr9H17Oyk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=lGrrH71y82kXjAF0ZSnZgGomZC46zSuLI/Vv3DIzqOlHoGRnY5OpzNu92Q9ZuoRdfN/2cJCSWGkpngn1ce7uiTzvaMZiYGl4H61VfYZLveFRTr0Vl2db9G58ZaBn5TvZABJ7lKicWBKCLiUoXq5xJZe/7E8Io6SKsM13cEYnP4E=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=LmAOzIM1; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=oBz2XaZw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="LmAOzIM1";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="oBz2XaZw"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 532MO6hT011489;
	Wed, 2 Apr 2025 23:18:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=QWjgf82Y1jNg5QQjxYCRgrsxs/RR+Mm6LuqUooA+p0U=; b=
	LmAOzIM1NfdZW0IKp+86eGvEw7x0UpEhZJ3kW3zdWQB/9fct5aDkGim9HU+IjVhs
	k4dh9m5rL0/RVPXNvg/RpkQYBlLpXgyn7Q3OwSaokjrXTUMR0zrndYtD5YeRTjts
	DTb8d2516OUfzok2D1lYIrdTLlM2JPuzIqV/Le3BoduLxrQu2+Gj+Q/AObXc5GCt
	NXfQ7TQ1o7+VhjweHGcyCdFYgs0EnjMDVMYo/Yo6N/PWuUsSO3h3hBOSNE9+LOH4
	miUSfhAFiQFW+rzRXAXSlpmqXxbUvpeXFzXXh2cqiYnM1FY5Ss4pBHWF9EKoTboi
	Ndge6seu7WU1QThHG5SZcA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p79cbwkv-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 23:18:37 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 532LNuGt004236;
	Wed, 2 Apr 2025 23:18:36 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2176.outbound.protection.outlook.com [104.47.55.176])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7abkfy1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 02 Apr 2025 23:18:36 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Yxybm2fzsLRgW57EBwvMKa80elwI6uZaL1dwNQiEOp/Htmdk1/g8nvC6xrRpmZLXJlVUQgL5v+YBFDcL6/t7LybNcrcSVlW2KW9v3ffXk1KG/hgpLlnR6vvH8Ni/zy/F2wVHksjwBtJKNvMAFD/nVOasQPm2nadTapcI3ce0qtH1lGlaD+lWi7Vv8ZkcVKNRg0cStDRS0LdedaEfhUaPXtBqJKarCkwRNuu/ANAdzSnu40MZNIavKmrMGJ0z0SxVBGjBpY49wz0c4rGI2KrQWKlw38Ub5Ngn0Dv8FAIQvQ4boqRFO9p5YCda2Zo4KC3pval61vOKydQpaR5MoNSS1g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=QWjgf82Y1jNg5QQjxYCRgrsxs/RR+Mm6LuqUooA+p0U=;
 b=YN9HwU3vXjAl/xWESE1GzHXRClfCRe91OHG+znXdjKDj3B2EHxgCCavrOEp0RD9rYlUidiYBpOzh8B3xf/Eby22DF6Muksv8OQEh6K+1GVNPnlxeZN/aDZvVbdOxp0+zLYBaIW+Q1oNN94kU6/98E7DX9Xqob2vX+k9i2AxAsz9PQ6eKOd8JNpj4Za8H7x6Dh20u1tDb6rEZu2v+s7LAXmBhndnf/1in92sEN+FPFUu4Ao4S0LknVDcmrw/cAOq9pu3pmkz8JTwwqXSdQZjkzc3nS0g8eAupboK73yVVrXhQWIutQOggwD96UdIZGifik9fSufcVYpldy4ld0eXfBw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=QWjgf82Y1jNg5QQjxYCRgrsxs/RR+Mm6LuqUooA+p0U=;
 b=oBz2XaZwFsuDY3KdXJjmx7mgHfecYcgAts4dpO6DllUfa8iICYveDUJSdNMUmuTHY1NHN5atbBbhC0Hy2w7xxCGI5O1JA7UNt0xavyrXpas/FMst5USSsIrtppBLBai55MnL9cdVujFFM7KRb1MLqeCTtJg7pw82euTWjt2pVw4=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CH3PR10MB7331.namprd10.prod.outlook.com (2603:10b6:610:131::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Wed, 2 Apr
 2025 23:18:23 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%7]) with mapi id 15.20.8583.038; Wed, 2 Apr 2025
 23:18:23 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Tao Liu <ltao@redhat.com>
Cc: devel@lists.crash-utility.osci.io, linux-debuggers@vger.kernel.org
Subject: Re: [Crash-utility] [PATCH CRASH] Fix module section load address
 when sh_addr != 0
In-Reply-To: <CAO7dBbVa=HMvZEsFTCYwULSgjbfac7SCZNEKgYePgPXb9kNvgA@mail.gmail.com>
References: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
 <CAO7dBbVa=HMvZEsFTCYwULSgjbfac7SCZNEKgYePgPXb9kNvgA@mail.gmail.com>
Date: Wed, 02 Apr 2025 16:18:19 -0700
Message-ID: <877c42ywxw.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL6PEPF00016417.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:22e:400:0:1004:0:5) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CH3PR10MB7331:EE_
X-MS-Office365-Filtering-Correlation-Id: 82cc62c5-ab71-4328-eb3e-08dd723ca9ad
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|4022899009|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?MyttaDRxWFY0WE12Mjhka0dNdjhkWnBrOG1JQmhHUDROQXVaUjJkRjJvUnRY?=
 =?utf-8?B?YTB1OHRBUWE5L3ZIdEYwOHVyVnFoaUs0K2JjTXVKWXYrdnFWU0dacURMS3VF?=
 =?utf-8?B?akNxVzVEaVJVWGRWTmNFbFZkYVZ2WmRwUFc0WHIrU0JCcnVpV09qYzJONkdT?=
 =?utf-8?B?MEhMR016QThEYlY1ZG4rZjIwTVB0aEZENGJTZ1JZV2RBeVAwTkh4SGpvNXAr?=
 =?utf-8?B?M29kajJodXp5QmxTd2phUldhV0N3MkFDWUNkNjRMSTlJcHB5NEpCU1pjU1Y0?=
 =?utf-8?B?UzVlRU5mcGx3dDNISGdwbzJma2tzUUxvaFpHOXQ4YW1uUGMzMmZNVVFPcHdi?=
 =?utf-8?B?RVU5V2RYQm5jQWVaY3hUamFYUFJwTmtJYmZzenNPKytzUjRPdUNhR0g4NTZE?=
 =?utf-8?B?Z2ZSaFpKYlB6V0dERDNoaHdDR3FUOUxzNDB2aTQvd3R1STdha1laU01KdG0w?=
 =?utf-8?B?RERiT21CQ1Fyd2VWbzFKQjkwZE5ONlN6cjExWG1NbTZxTlRSMWp1QkxVNU9T?=
 =?utf-8?B?MUJHTXVJMUVkcHpiWDI1azdTMHl4SUVjOFF0dGpBTEFWR3JpQ29sVStRYXIy?=
 =?utf-8?B?b3B2blVGdjVkSVNrSWhPVDlBS3NNRHBMMFMzWG10TFlCWE9KYitYOWdKTzVH?=
 =?utf-8?B?L2trekUyUnJHdHJTdks4VkVSVzl1MGxIUStSSFB1cnZkaWhiaHFhYXJKRG9O?=
 =?utf-8?B?RlZNTDFNR05HVUJMaTNVRi9EMmRTVXJoRDA3OFg1L01uYzB5SUI2SjRhVWd4?=
 =?utf-8?B?eGtiTGtWQVdjV2Q1SzRrYmRxYkFqVHhQSjQ1b04xM0UwNG5jVEcwWlZiVEZv?=
 =?utf-8?B?QU55Z0NIdVFhM1B3L1FQS3lJYVNIR0RVa0pWNzRnVFExRC9zOEI5cVI4RU5S?=
 =?utf-8?B?YldicUdHa1VZcEFPenNkamJHcUJmSW9ycElpZmJKWjdKY1JHR0xaajlBMlNO?=
 =?utf-8?B?YnNtOHo1WG5IbVg5bTBnUTNmK2VnTEw2NWgwUUpESjhmUVZwWGgrdnF1UjVl?=
 =?utf-8?B?ajhub0pwd0pWTjR6eEZKYTJmdDdMcnlaOEFHYzhLanFkeTlYK0gxVWQrVWdW?=
 =?utf-8?B?aHFhalMvellIOWp0Zkpvc3pNMTNONXBiU2didDc0WmRDTEVLTXZ4TjZSVlFX?=
 =?utf-8?B?N2ZqeGxOZTROejMrcHMxODRvdTVzL1VKc25aS0RCS2JTWjY2aDVjYXY2K2h5?=
 =?utf-8?B?dU1pSUxmVFBaSEQycGdYb2NzSG5yVm9PN0VrOXVCMXVYdHB1R2c5T0J5K3ZN?=
 =?utf-8?B?MDAxb3h5L0RJdjRWeXRJb25LMStEanZsRUV2OXFUd2s0RmNXY2tOZkYvUU4x?=
 =?utf-8?B?Um1jQk5TYTloVk04aUlaZnBicDdyUTlUcDZFSzMwcUgxZnc2VjlVVmRwdWhT?=
 =?utf-8?B?TGxJdUNDOFFSYWUxQVU0czFNcG4wNFh1OXBrOSsvS2sydTBubTUwNVU1MkZl?=
 =?utf-8?B?d1FRS2d6WVU3STE1U2NncFlHRGczcDZtZmxielpzaDlPZFg1MHdFd1B4cG9l?=
 =?utf-8?B?TnZ6UlZVWHlsK1RodzArZElVZTR0OXNjM0xHcEV4UEppZUNiZjJnOEF3OUZ5?=
 =?utf-8?B?UXlJYVFoUW9kT0JGVjRhTU9oeXN3OXFwaG1wSHc0MVBTZXpUSHVNZWtHY0Er?=
 =?utf-8?B?MFlaeVgrSjdET2sxWWdjOENpOEZGOE1FQ00rOEM2d3NVVzNnaHBXYXVVVTNU?=
 =?utf-8?B?ZnBiSW9zQWJ4enRNb1J3QS96YmxWQ0NnSituZ0lKb0QrQm03emxlYVFBbGtL?=
 =?utf-8?B?QlFKL29nTzFPQmNoT1YzTkk1NEdId2JtRE40Q3VlN1ZWQW1EYm1oS3BUUTBW?=
 =?utf-8?B?M2tMUkdkNHpoQVBBNnVYR0F4SmNoSHh4QTNUUmxhdFVMTy9yNUt3V2U4WFk2?=
 =?utf-8?Q?N/nuLoLawpoCb?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(4022899009)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?YmZQWUlVQVU4ekNFNDRXNlBld0JSRDVZNitiY2xFLzBIQnZVRi85NDI0V2Jr?=
 =?utf-8?B?VFk2aWt5cEtNNStuYWFldUlEZGw3U2xzcSt1RzR5V3BOYXlxOEFGV29ySmVq?=
 =?utf-8?B?cE5QZExiOWhlT1E2Y2dkR1RsVS9DeU5odUZOdG1NTm1JOStWbXY3VUdGMC9P?=
 =?utf-8?B?Z2UyWlNOdUV1LzAwa004ODNWQzNvTGhKUDJMaFRVUm5oMzBBQmNoa3RnSkpp?=
 =?utf-8?B?VXRLaHJtbXkvaG1xbnpYUTlpWWVJY2ZlMnRpOXA0RlEvYThpYW5aUW9nV09M?=
 =?utf-8?B?dGFzYVNxSGZCNzBPbGVRbG5PVFNwaUJzVVZ3ZGcvSklBOXpSSzN4dlY0Q1Rs?=
 =?utf-8?B?K09RdE9BNDB4SXJhUWRFQ0JiM1gwZlErYUN3bUpNanZKemhUY3ZhdlFKcHNE?=
 =?utf-8?B?NzZXa042NjZRUktDbEFaUEFhSnMzbXBXQzBkUkV1SmxPT1BEOVc0UDN0YjFj?=
 =?utf-8?B?WnAzMXdlTW4xQ0l5TzduandZTzYzbkoxNDRJb2JsM1YwUzc5UkJmZythNjd0?=
 =?utf-8?B?ZEFxMHcxSWlkaE5ZQlF3dUJNSyt6LzdYSnFqdURkUGU3M1Vwd1JyYmJ4OHc1?=
 =?utf-8?B?WEgvSk90dkFENGdSRUM4ckNtWFdQeDdKSkJEcEpnbGhxdTJocDJQTXRzRG5V?=
 =?utf-8?B?QXhzQm1sTW5mQXBSYmFBRmRlb3NobGVIdVJWQnlkUlk0ZmdlaG92MDlXQmpl?=
 =?utf-8?B?MkFvRnZ2cmJiaFBDclEwZ0I5cFNWVUhPd1ZDSXhsV0NEc0QybFVpT093VEdG?=
 =?utf-8?B?VUoxSU15US8vSmYrT05uUE81cjhNZjBEYml3L3NCeGRqY3locG9NbElWYkxs?=
 =?utf-8?B?MTFzRHltRW9YT2o4YTR3USswVnNsT0VxVWdFZFkvNWRzSHZnMUg3eFBsb29u?=
 =?utf-8?B?Ym95eEpKbkMzbklYWmR6SEkrMVFwdUsrT1pMNkU1eXRwaDZZVldTQ3BlSVpS?=
 =?utf-8?B?K2hrL0tLWGszMklRN1lvcGh6anl1WnZGbURXcTJMVnhSRGt4ZUhxbmxqQnlr?=
 =?utf-8?B?RDZaUEF2NVkvODdQTjc5R1B3d1RTZERJT3VQRzIyeW5CSTI2ZjErS0ZCMGRw?=
 =?utf-8?B?OFVaTWFLSG12dGdOY3FwSnQ0OUQxTmk4TG1FV2ZiWUR0Tis5cE1EUEZ1RG5Y?=
 =?utf-8?B?RXNCY05ZcjFDWHJscDhoZnp1UlZuMDEvMWQxaXIyMnAwS1RkbjBQRWR0NnRR?=
 =?utf-8?B?RjhoVEdzTWJJL1gzSk9GVFc0TGxxRWZpVnkzL01ndjNDRUNVc2Jnak5HajhR?=
 =?utf-8?B?RjUzSU1UaWlyRVo4SnE1V0J2THd5bnltZWV3L2V4eXhzY0ZCSEhDalZHeTJx?=
 =?utf-8?B?VGlhc2RXcGpuTW85Y3VJMHAxUThBR2s3U3pZSW5aTTlncXlXaW9kUXlBdmhs?=
 =?utf-8?B?c1lXRUVJQmFOeDB1MTFjNlptc3RVSkw4TkNYSE9CWHBjaVhzYXBPSkR6aHd5?=
 =?utf-8?B?T1lDYkVPdllXVThzbThkUFB3bHBzMnBXMlRYSDBMSFVkb05zMjZMWU5KSW5M?=
 =?utf-8?B?WEdxTEZ5aDh5dGNPSjFOdkhvN2E1cis4QXh4dzIyRnNmb25WMURHRUU4RnUy?=
 =?utf-8?B?YktMNjlDRlpYTy9vRUhOY0tiWW94TjJWLzJyai82OHRNZzZDekZXaHVpUENV?=
 =?utf-8?B?Y05DaC9zOG9mNXZqT0Vla254aVFJdHJxWS9tZ2ZJVThSRjNEVHg5TmxVQ2kx?=
 =?utf-8?B?WW5Fd1RFQnZ4QnhXMng0SDBjdENhNzREaERsbUFMUXJ3YWQ0RERseGk2NlhH?=
 =?utf-8?B?TjVnMnlMZWx6V2IzbldFY096S3hjdUt2ZDFPc2gvdWlOR1p0YUFQV3kvdFIx?=
 =?utf-8?B?M2VVMkdweDRyT1Y1eUx5TDA1eVJqbzhEK3UraFduemNSRlp0bXhVbTNtQTEv?=
 =?utf-8?B?MmV2d2hRNkk0MWs4ZEZ6UjEvdmxRb1JVTHhuK1FMYllCU3FOYUJ3ak41bDZ4?=
 =?utf-8?B?bVJqaXcyblI4ZVFxQTROcExuTTZFd0RhRGx0ZWllNzdyV2dkczNBMmVRWU9z?=
 =?utf-8?B?aU84bWFRTUZHZXNJK1BxTnJMNlNWdUtiQzFoWDRCYVJ4TEFnZnVHV2ZhVHdp?=
 =?utf-8?B?eVZMY1U0L0EzNnlybGxCMHdaWWpZeVZ6UUlpYmd1dDVOMXJkZXZsQUpCU3g3?=
 =?utf-8?B?Znh0ZDFXclZTWmluSHU5Y1NHclBzTWw3SHFJWUNiaTVCQmVQaUg5cFZ5T0lh?=
 =?utf-8?B?bWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yUXI+nSGSune/WoiRvpfjyWoU2kTFlmKjXW1/bBJU8lHEN3of55mL28uAq+t5bHTxpd7fE+MMxoPioR/wMcRHbr0U1r/l9AuXjuLx+RNlvqKsFkeclyO9Y9hKGvvL8JkENoBzyMDH4TXBypfasRHiZQlblkNvc8i75h5JzopRG6qYlscAla2CcvzZuPlof6fGhP2gMgbCLBb6BC85RfPxseXQMxKlmuG1VW4TwRSdwCTEgICjkzoT3Fqv+CgwZfzprWRE1/AzPH6OhDxBHzo6Uq2cQ87y4HVR2ZoNq51S4jNRrB9yk9zWxcpabaJqV8ad4Ha2JjaKj5mReDNCPwoUcvjhomwgBihS6oDdlG7UDS2TLkUqRp2SM1PyKDRMKansR5AvNKBxubbA7zSINHJyRr2nPxaT3arKQW4QAy6D6ZHfGXSSosGbkGmFUjqEWtk5TxOi2gBbSkRt4C53Rz5PcMutqAjsFk/6ofzCjPrAlDRzzEINP09ms3jKKjAwVjP1s2+7poe0TkDjiZ+4lO9cTW876O/vMRdJeifWPH7AA1jnbtLa2AMvEG+vZ5G5fNz1JX6HXv2hb0ciuDtfPI4b4Bh5sSyJFVKZ8Op+D0A2Lo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 82cc62c5-ab71-4328-eb3e-08dd723ca9ad
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 02 Apr 2025 23:18:23.0224
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uRhkH7JOXhIQLW/NfRBsoKCqgbqipOXfa528f0i4dISFzwfZ30NQY4RML8x4rcJGEtNtap3trpMgP9V/1q8FQqoYgxooxotyRgBwWAKEfTs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7331
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-02_11,2025-04-02_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 spamscore=0
 malwarescore=0 mlxlogscore=999 mlxscore=0 bulkscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504020149
X-Proofpoint-GUID: PvE6GJiBZeD8p8vq2XDXBh0dEl7Hj_Gq
X-Proofpoint-ORIG-GUID: PvE6GJiBZeD8p8vq2XDXBh0dEl7Hj_Gq

Tao Liu <ltao@redhat.com> writes:
> Hi Stephen,
>
> Thanks for reporting the issue and patch. Please check if I understood
> you correctly. The correct output you are expecting in your case is:
>
>     crash> sym ata_dummy_port_ops
>     ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
>     crash> mod -s libata
>          MODULE       NAME                      TEXT_BASE         SIZE
>  OBJECT FILE
>     ffffffffc0a7b640  libata                 ffffffffc0a47000   520192
>     /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/drivers=
/ata/libata.ko.debug
>     crash> sym ata_dummy_port_ops
>     ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
>     crash> p/x &ata_dummy_port_ops
>     $1 =3D 0xffffffffc0a6fe80 <<-------- should be 0xffffffffc0a71580,
> same as sym's output, right?

Yes, that's correct.

> If that is the case, then after applied your patch, the issue still
> exists on my machine:
>
> crash> sym fuse_miscdevice
> ffffffffc05f7fe0 (?) fuse_miscdevice [fuse]
> crash> mod -s fuse
>      MODULE       NAME                             TEXT_BASE
> SIZE  OBJECT FILE
> ffffffffc05f8dc0  fuse                          ffffffffc05da000
> 233472  /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs/fuse/=
fuse.ko.debug
> crash> sym fuse_miscdevice
> ffffffffc05f7fe0 (b) fuse_miscdevice [fuse]
> crash> p/x &fuse_miscdevice
> $1 =3D 0xffffffffc05daf20 << ------ unmatch with the previous value.

Indeed, I checked with fuse on Fedora (6.11.4-301.fc41.x86_64, so almost
the same version). And I see the same behavior with fuse_miscdevice.

In your case and mine, the offset is 0x1d0c0, which could be a clue to
how this mismatch happens.

> The .data section of fuse.ko.debug have non-zero address:
>
> $ readelf -S /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs/=
fuse/fuse.ko.debug
> Section Headers:
>   [Nr] Name              Type             Address           Offset
>        Size              EntSize          Flags  Link  Info  Align
> ...
> [50] .data             NOBITS           0000000000000e20  00000100
>        000000000000080f  0000000000000000  WA       0     0     32
>
> Could you please re-check your patch for this, or is there something
> I'm missing?

From what I can tell, the important difference here may be that the
symbol you selected is a static variable (which becomes a local ELF
symbol). Apparently, my patch only resolves the issue for *global
variables*, but not for local variables.

$ eu-readelf -s /usr/lib/debug/lib/modules/$(uname -r)/kernel/fs/fuse/fuse.=
ko.debug | grep -P "fuse_(miscdevice|mutex)"
   85: 0000000000000100     80 OBJECT  LOCAL  DEFAULT       50 fuse_miscdev=
ice
 1041: 00000000000005c0     32 OBJECT  GLOBAL DEFAULT       50 fuse_mutex

Here is the behavior of crash's master branch on these two symbols:

crash> sym fuse_miscdevice
ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
crash> sym fuse_mutex
ffffffffc02fb4a0 (?) fuse_mutex [fuse]
crash> mod -s fuse
     MODULE       NAME                                  TEXT_BASE         S=
IZE  OBJECT FILE
ffffffffc02fbdc0  fuse                               ffffffffc02dd000   233=
472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fuse/fuse.=
ko.debug
crash> sym fuse_miscdevice
ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
crash> sym fuse_mutex
ffffffffc02fb4a0 (B) fuse_mutex [fuse]
crash> p/x &fuse_miscdevice
$1 =3D 0xffffffffc02ddf20
crash> p/x &fuse_mutex
$2 =3D 0xffffffffc02fa680

Both fuse_miscdevice, and fuse_mutex are mismatched (with different
offsets). And now, here's the behavior of crash with my patch:

crash> sym fuse_miscdevice
ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
crash> sym fuse_mutex
ffffffffc02fb4a0 (?) fuse_mutex [fuse]
crash> mod -s fuse
     MODULE       NAME                                  TEXT_BASE         S=
IZE  OBJECT FILE
ffffffffc02fbdc0  fuse                               ffffffffc02dd000   233=
472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fuse/fuse.=
ko.debug
crash> sym fuse_miscdevice
ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
crash> sym fuse_mutex
ffffffffc02fb4a0 (B) fuse_mutex [fuse]
crash> p/x &fuse_miscdevice
$1 =3D 0xffffffffc02ddf20
crash> p/x &fuse_mutex
$2 =3D 0xffffffffc02fb4a0

Here the global fuse_mutex is correct, but the static/local
fuse_miscdevice is still incorrect. This indicates that there's more yet
to fix. (But at least my patch does part of the work!)

I'm wondering whether this has anything to do with ELF relocations. From
what I can tell using "readelf -r" and "llvm-dwarfdump", the relocations
for the location of these variables are different. Relocations for
global variables seem to be done via its corresponding symbol, e.g:

  Offset          Info           Type           Sym. Value    Sym. Name + A=
ddend
00000008bb6b  041100000001 R_X86_64_64       00000000000005c0 fuse_mutex + =
0

Whereas relocations for the local variable seem to be done relative to
the ".data" section symbol:

  Offset          Info           Type           Sym. Value    Sym. Name + A=
ddend
0000000133f4  001e00000001 R_X86_64_64       0000000000000000 .data + 100

These offsets correspond roughly to what you'd see for the DWARF
offsets of the location expressions for each variable from
llvm-dwarfdump. So one theory here could be that GDB is not using the
provided ".data" address to perform the relocation correctly.

I've been playing with the internals of GDB to try to get more
information. It seems like "fuse_mutex" is described as "unresolved"
whereas "fuse_miscdevice" is shown as being part of the .text section
with the same incorrect address.

crash> gdb maint print symbols -objfile fuse.ko.debug | grep fuse_mutex
crash> p/x &fuse_mutex
$1 =3D 0xffffffffc02fb4a0
crash> gdb maint print symbols -objfile fuse.ko.debug | grep fuse_mutex
 } fuse_mutex; unresolved
crash> gdb maint print symbols -objfile fuse.ko.debug | grep fuse_miscdevic=
e
   } fuse_miscdevice; static at 0xffffffffc02ddf20 section .text

I'm not 100% certain if this is relevant, at this point I'm just sharing
debugging information in case it helps you or anybody else. I'll
continue looking into the root cause of the issue for static variables.

Thanks,
Stephen

> Thanks,
> Tao Liu
>
> On Wed, Apr 2, 2025 at 11:41=E2=80=AFAM Stephen Brennan
> <stephen.s.brennan@oracle.com> wrote:
>>
>> A user reported that crash was reporting the address for certain module
>> variables incorrectly. I was able to track it down specifically to
>> variables which were located in the .data section of a kernel module.
>> While the "sym" command gave the correct value, printing the address of
>> the variable or expressions based on it with "p" would give an incorrect
>> value. For example, the variable "ata_dummy_port_ops" variable is
>> included in the .data section of libata.ko when built as a module:
>>
>>     $ sudo grep '\bata_dummy_port_ops\b' /proc/kallsyms
>>     ffffffffc0a71580 d ata_dummy_port_ops   [libata]
>>     $ sudo crash /usr/lib/debug/lib/modules/$(uname -r)/vmlinux /proc/kc=
ore
>>     crash> sym ata_dummy_port_ops
>>     ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
>>     crash> mod -s libata
>>          MODULE       NAME                      TEXT_BASE         SIZE  =
OBJECT FILE
>>     ffffffffc0a7b640  libata                 ffffffffc0a47000   520192
>>     /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/driver=
s/ata/libata.ko.debug
>>     crash> sym ata_dummy_port_ops
>>     ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
>>     crash> p/x &ata_dummy_port_ops
>>     $1 =3D 0xffffffffc0a6fe80
>>
>> The symbol value (from kallsyms) is correct, but its address provided by
>> GDB is incorrect. It turns out that the .data section has an sh_addr
>> which is non-zero. The result of this is that calculate_load_order_6_4()
>> incorrectly calculates the base address for the .data section. This
>> patch fixes the base address which is later provided to GDB via
>> add-symbol-file.
>>
>> The impact here is interesting. Only variables within sections that have
>> a non-zero sh_addr are impacted. It turns out that this is relatively
>> common since Linux kernel commit 22d407b164ff7 ("lib: add allocation
>> tagging support for memory allocation profiling"), which was merged in
>> 6.10. That commit added an entry to the scripts/module.lds.S linker
>> script, without specifying a base address of zero. I believe that is the
>> reason for the non-zero base addresses.
>>
>> I was able to verify that, in addition to the Oracle Linux kernel where
>> we initially noticed the issue, kernel modules on Arch Linux and Fedora
>> also have non-zero .data sh_addr values. This is likely the case for
>> most non-clang kernels since 6.10, but those were the only two distros I
>> checked. While my reading of the module.lds.S seems to indicate that
>> kernels built with CONFIG_LTO_CLANG=3Dy should also have non-zero .data,
>> .bss, and .rodata section addresses, I haven't been able to reproduce
>> this with clang LTO kernels. Regardless, crash should properly handle
>> non-zero sh_addr since it exists in the real world now.
>>
>> The core of the issue is that the symbol value returned by BFD includes
>> the sh_addr of the section containing the symbol. For example, suppose
>> a symbol with address 0 is located within a section with virtual address
>> 0xa00. Then, the resulting symbol value will be 0xa00, not 0.
>>
>> calculate_load_order_6_4() computes the base address of each section by
>> using a kallsyms symbol known to be within that section, and then
>> subtracting the value of the symbol from the object file. This
>> implicitly assumes that the section sh_addr is zero, and thus the symbol
>> value is just an offset. To fix the computation, add in the section base
>> address, to account for cases where it is non-zero.
>>
>> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
>> ---
>>  symbols.c | 8 +++++---
>>  1 file changed, 5 insertions(+), 3 deletions(-)
>>
>> diff --git a/symbols.c b/symbols.c
>> index 5adbc30..e30fafe 100644
>> --- a/symbols.c
>> +++ b/symbols.c
>> @@ -12808,6 +12808,7 @@ calculate_load_order_6_4(struct load_module *lm,=
 bfd *bfd, int dynamic,
>>         asymbol *store;
>>         asymbol *sym;
>>         symbol_info syminfo;
>> +       bfd_vma secaddr;
>>         char *secname;
>>         int i, t;
>>
>> @@ -12860,6 +12861,7 @@ calculate_load_order_6_4(struct load_module *lm,=
 bfd *bfd, int dynamic,
>>                                 }
>>                                 if (strcmp(syminfo.name, s1->name) =3D=
=3D 0) {
>>                                         secname =3D (char *)bfd_section_=
name(sym->section);
>> +                                       secaddr =3D bfd_section_vma(sym-=
>section);
>>                                         break;
>>                                 }
>>
>> @@ -12890,14 +12892,14 @@ calculate_load_order_6_4(struct load_module *l=
m, bfd *bfd, int dynamic,
>>                         }
>>
>>                         /* Update the offset information for the section=
 */
>> -                       sec_start =3D s1->value - syminfo.value;
>> +                       sec_start =3D s1->value - syminfo.value + secadd=
r;
>>                         /* keep the address instead of offset */
>>                         lm->mod_section_data[i].addr =3D sec_start;
>>                         lm->mod_section_data[i].flags |=3D SEC_FOUND;
>>
>>                         if (CRASHDEBUG(2))
>> -                               fprintf(fp, "update sec offset sym %s @ =
%lx  val %lx  section %s\n",
>> -                                       s1->name, s1->value, (ulong)symi=
nfo.value, secname);
>> +                               fprintf(fp, "update sec offset sym %s @ =
%lx  val %lx  section %s @ %lx\n",
>> +                                       s1->name, s1->value, (ulong)symi=
nfo.value, secname, secaddr);
>>
>>                         if (strcmp(secname, ".text") =3D=3D 0)
>>                                 lm->mod_text_start =3D sec_start;
>> --
>> 2.43.5
>> --
>> Crash-utility mailing list -- devel@lists.crash-utility.osci.io
>> To unsubscribe send an email to devel-leave@lists.crash-utility.osci.io
>> https://${domain_name}/admin/lists/devel.lists.crash-utility.osci.io/
>> Contribution Guidelines: https://github.com/crash-utility/crash/wiki
