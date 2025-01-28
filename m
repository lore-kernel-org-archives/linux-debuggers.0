Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8161D1FA4
	for <linux-debuggers@vger.kernel.org>; Tue, 28 Jan 2025 00:21:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738023682; cv=fail; b=lIwZ5stRaILY3BVXEL9IJjYjKAJRY7E3AQVeupOJEsUdJplkf62Kmc15XQoPmkTeBeD7wGkSeJ+gwmMs0WfS7F5h6a/sw8yYBOqswydIY0hPX03BbfWxhr9WTRL5FAOP/QCUe7dyL8nJlfItExK9ZRE3G5cQ/pMJew2R4JUmJyQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738023682; c=relaxed/simple;
	bh=wKokciH6WH2zb4YGNDsvMSxSGwjde/CSFX7hc/PFaNA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=MbxmChIf0LnitRRzcZ20uTw84FJe93rNJbOWl5RX+AQgquTRak2O5bOwPmBGh9cnKZjhHaLFKnE5NumDhHIzBJKGrzidXY+oDySg/wgBUDmvdaEmIeD5+d2nQbNjDazIsNdVOpsSpq67Xs1LZn1iY/Ec4EFrcxOKokspuZ/gMOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=gaB3iRcE; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=N4T1RzDA; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="gaB3iRcE";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="N4T1RzDA"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50S0HV8U030615;
	Tue, 28 Jan 2025 00:19:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=9KVdBW+CStgE9yfItLitLTe1fyHPrhwERGUgEvX5Siw=; b=
	gaB3iRcEqOJUyckLlWsgxQD2SAUyRFEyIvyIRLztDkTnU/VIrSQDrjIXtnc8zpAn
	6Rus8MX0+GGi4bBwvb4SySuFQ7Yf6yXtDBgFo0A+ZWNkGgPvdvpi5vp/Aa59h6B3
	MyyVQWLAi1+AXVvglb4DqckONVmnOWDScW8UKIytG4UybPfmFa+I3hcfSZYuFava
	0xj01j3Rls2yOKjyyvnN5omBy6fdm78JAPAlVWubzm8o4z+VcAmjd80FeInkWCZ+
	NFoiEiyrWJVFZ5Lk5HPqiGVKX9FS74ydpPjFhBy5N+tPsvAshrInEI7EUM+GdtZp
	o1cmYCHMKjsvEPU18YuHyw==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44emj9g027-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 00:19:46 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50S0A2Rt036341;
	Tue, 28 Jan 2025 00:19:45 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2175.outbound.protection.outlook.com [104.47.58.175])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd7nrwd-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Jan 2025 00:19:45 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=T8JAjkg/1UpQZ2pSKP+qXNXXy32kyzooGYJIyJoFdz/F+11BTdDyL1ea2q0Xo61r5dZ50WrcMD4m4gd+6Iu/0vSGsiZvz2pfPO4XRGxKmoCWYQU6+1wftbAxtwZv5kHeoomu/Fl9L+RxaEy9Zphxf97d+fy94T0wwqhvbumtEtcqHPNu005+D7RC6s4GOE9nB/bE+i+vEYHtMyDsxr4vPnmFWZReEybdm5VRZj9Z+93Q4XOS/fn1SGf9nLyHqTTvkjQHzMo+hz2UG4nmvYr1ioUv5NOBPBi8qV2O5/CqjSaRTq3BbAQ0wK9j4+N+MxXSJB3ZHWF3DuhL1HCEXBfrlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=9KVdBW+CStgE9yfItLitLTe1fyHPrhwERGUgEvX5Siw=;
 b=aMJ3nylBPJCiK6iVFEBtywTrdwKR53ziySiNo26aeEzPX3yFyqPq5sLC7d/kinBROiZrKsswXHKFCbjjQrKX4tODQr/iDX2VFgbeixI5in6F8NyRvfWSbnBIXpzusQap7LX0KD7zfcEvQtKuS3MzCrMS1Gd1k7BLH2T7+K5BqfTrxqfJY+1EkmXUXdH6FKZkZUcftSr+7j0giwSpDwBUIi0bJ9CzRWHCU/olih9/daXPXVHNEdAMS2CIpri2sg/Qqm2NuFjDRHlRf+a758Bh1zEKHTwkn1ZYh60JB+C8CIGRYac1MYWXqTyENatuxLgbRHrNvnze/WowABdWgZyz/w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=9KVdBW+CStgE9yfItLitLTe1fyHPrhwERGUgEvX5Siw=;
 b=N4T1RzDAC1IiPStdSYOXOulbJ3uY0hsDZS4zsbMXfTNGNCMRFsUIDfMFk9OGUVdf7dh4UpMchtcVAtYIkjQrgXC99DpM6YSAINMALlLVplXUif59XvkB/YzWAIDtgVijujv6/NK+dIgFKRPJ4AdOdT9dv0GJpMxlz4SfzacfM6g=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by IA3PR10MB7996.namprd10.prod.outlook.com (2603:10b6:208:506::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.23; Tue, 28 Jan
 2025 00:19:43 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8377.021; Tue, 28 Jan 2025
 00:19:43 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas@t-8ch.de>
Cc: Omar Sandoval <osandov@osandov.com>, gdb@sourceware.org,
        linux-debuggers@vger.kernel.org, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <3a0f50f6-3d03-4109-b0a8-0b743559356c@t-8ch.de>
References: <8734hmtfbr.fsf@oracle.com>
 <766010fa-49a5-4e86-a730-bf79bb73e928@t-8ch.de>
 <Z5fMtZOoYaV6aXwf@telecaster> <87y0ywgkss.fsf@oracle.com>
 <3a0f50f6-3d03-4109-b0a8-0b743559356c@t-8ch.de>
Date: Mon, 27 Jan 2025 16:19:41 -0800
Message-ID: <87v7tzhjs2.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR01CA0031.prod.exchangelabs.com (2603:10b6:a02:80::44)
 To PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|IA3PR10MB7996:EE_
X-MS-Office365-Filtering-Correlation-Id: 8d3ba6b2-ebae-400d-5014-08dd3f317653
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?czRLcHlxVVlxTFZtUUorOHMzaTd5Tmh6bFRNRlFwSkJTQjJ1Rmp6OEFHelRx?=
 =?utf-8?B?Y1JicDR1MXJYUFJKTFBTTWcxVDVISDZiRDY2WGtRSUU2dnYrcXdLMVBXUXhl?=
 =?utf-8?B?a1FHeXBWRWtuY3pOYStkU0tLVlE2UzV1RmFoZFZUSk13Ukk1TVZVNklxNExU?=
 =?utf-8?B?bDBzc2xXc2tkV0JwbEhabWIyVExCWVZha3BWdWhLVThUSElmU0JzQjNUdDM2?=
 =?utf-8?B?TkFrdDVuVkd6cFh6TlVoTGlkMVFkRGRTQjU0dlFEK0J5MU5ZZ2lFTytnK0pG?=
 =?utf-8?B?M2gySlpQVGlqaEFkL0w5RlJSeWFSdWFseURLd2MxbXprSUtyTU8xbUNwSHpN?=
 =?utf-8?B?aW5vTVZOeExnOTJjMXlDYUVXQXo0QmFvQzlkTHM5enl4bDFMaE50bDBJOHMz?=
 =?utf-8?B?MUhrRmdVaXBoTjRUb01pVThIdWRHWVdkcXErWHI1SE5mQjNlY1dFdDFRZXVw?=
 =?utf-8?B?TVpZNm84NUxFQ1VNNktXNnY4ZWFHSnRUamZmTmNZSUs3ZjRJZlBJM2lRWCtl?=
 =?utf-8?B?cTBRRkkxT0lZYVNEWXFWZ1BYaTFjK1EzSG5HR2FYWGQwTjc2d29iVmNxc3RO?=
 =?utf-8?B?Tm8vR2tQSWIzU2NGSmVHOFZFNUJESlhUNTQ5eWlXcERhVUpMWUg4QUF6UnMr?=
 =?utf-8?B?Z21JYWpJM0hZa1pnRHpLTWNJMWxMcUs1Z3BnQmpOREpEUHJRSzI4d2dOYnF4?=
 =?utf-8?B?ajdyczFFNlJmRWdWQ3c3dVpLTTZvc2JrL2c0ampJcXplMkZhaWpXUnNWb3p0?=
 =?utf-8?B?K0RJRmJGVHJrZ05acEQvbnVpWFQyUmI2Z1IwcnZGdjFmazl0ek41VFZBYVhH?=
 =?utf-8?B?M0Z5YXEzNzN4K2lPUW5yWWNpa0hEYXdsOWV4dUNRTENxNElEekF2ckROek5I?=
 =?utf-8?B?aUpBMlVRQjVnTkgzZDU3cjQxZmNER3A5Sjg3N2xqc21sNlY1NDV0UzVmQ0xO?=
 =?utf-8?B?OEZPQ1Btd0N3SWp5WVpzUG5pTlFnTUpDNXB2QWZwWmpsRUh6WU5ucWlXc2Nr?=
 =?utf-8?B?Ykp4WEx2Z0MxbEk3MHVQVGkreUxCVUU3SVk1NGpOQXdQN1pwa1hjUnA3bGlE?=
 =?utf-8?B?YXdZb0ttMWErQ2dwWDYyeUxIZ2ZsQStpVlhXdmlzV3RyaGozRTRjNmlnZjVC?=
 =?utf-8?B?bmJYQ29GeXhNNWh1QzVrRVJ3djJ3Vk42Y2RYQk1CSnNKZFhONGVCZzZaN0ds?=
 =?utf-8?B?dHFpOEpjTXY0WDc2ZUFxZGhLdTE3U0c4Q2xsZ2t6RzIzM2xzTGVsK1pZbUkz?=
 =?utf-8?B?cWhDRTNLNXpsNWQ4bDAyT0dDQVZ4akdKc0pQdWtqc29UdVVyVldqenUzenJn?=
 =?utf-8?B?MEdMWHdWZkw2aVpXVnZjSkpVb0tTMFF3YXA1VkZjcEdrb3ZyOExocTBZUXI2?=
 =?utf-8?B?aFlZcm1xNkgxQVAzNWZxamFxcW43ejZsTVM0dmtCWTA4V1ZsSXF3azIwYlA1?=
 =?utf-8?B?dDJOS0d0dWcvQjBJSmNlOWtXU3lUUTdQbVlVOTlCRjN2ejNDSjBmTUFkU21N?=
 =?utf-8?B?dDJzUDRKODBrcUxnZmpjUnhuMmF4Q1Buc3BxUVBkYmFCd3ZTckVjZ2VGN3lx?=
 =?utf-8?B?UUowQzNSZ1V5OVB5OCtxeW5ianlYQjNadDZRRWVXTStyd3lHQmk3a2pNZER4?=
 =?utf-8?B?dTk3cG5HUVlDVHU3UmVsK20wY0ZXL2loc3F6Tnc1c3l5Q24xSEM0NWJCdzhs?=
 =?utf-8?B?ZmpBZFplWW8yZnN1eVlRZTlWMTBYZGVUS2ZyU0l5ZnBzajM5TzJZc0d0N01m?=
 =?utf-8?B?UUJETXlMQW9BVmR5TXhYWE9SVGxTSjE0S0h6S0djOEFBZldmWmZsaWc4K21P?=
 =?utf-8?B?S0l4UW41QkQ2K1RtUVJNUHl2NXk4aDZwMkdyNXZOcmRYazVHL3doRTRyRDFO?=
 =?utf-8?Q?EoSMMAzQtC471?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SDZ3VlFiZUhlSnh1UW5tV2Y3UTdoSjFWQUNMUWZnYzJGaEV2bHFCcnV1cTBx?=
 =?utf-8?B?RVM3MUI5WVBYZEhJQXN0c0R1MlplcmtFMkZaR0xPUVFnSDdwNW13bkJPbUNC?=
 =?utf-8?B?WXJZc3VFL3E2ZkhLZWNmblFmMmtoZDQ3NFZzYzgzR1hjRzU1aGZVMGV4VFJj?=
 =?utf-8?B?KzBnV01FZ0VRclZxc3JTcmxKSUc1cmJ1ZHhDTXk0WGh0MEhLNEQwU2hUd0Rw?=
 =?utf-8?B?VzhvaEp2K216ajhNbHQwd0F2a2d0Mnl1TmVaSENBa0VTblZtY1NZajN6bity?=
 =?utf-8?B?aUxJU0JKU2dITnI1WGJWenZSOWVSNWdnMHQ1di9kc0JNYUNzdC82LzlWSE8r?=
 =?utf-8?B?RlZneWpEYVd2TDhJblZjVEdwWWpkb21MQkNLKzU2aVZYWmNJa3kvYmZWMzl1?=
 =?utf-8?B?M2tjSTErV01sM2N1MFdSVlQ0WGR6WFdYakZ6dHdkQ3AxR1h4c3pqWVZkb2dN?=
 =?utf-8?B?R0tMU0NSNkJna0NHbXhXbXJYL3p5RWwrT2VOY1c3QmMwbGc2akpiaFE1Nmp1?=
 =?utf-8?B?bitiZ3ZmaFVlZmZvSnIwNGtoYWFWK0ZDcnMzU3RPVEpSODZqSStiZUc5WEJM?=
 =?utf-8?B?SUhzY1BIRDNJUFp4aytKVE8xZC9kVUlyYmZUaktqZk1HWGlQNnprcUZQbWti?=
 =?utf-8?B?N2VJY2dyZTM2YTZrbFVjYk9ZdG1TMUJLRkM0MVpGUGdOLzRRZnpEKzNaQjIy?=
 =?utf-8?B?SmRNUVEvUit5YjRVVStGVkU2Nkphem5ycHhHSG8vc3E5Qk1LVXBURXFCRzRQ?=
 =?utf-8?B?elZKL041OWN4SGg3OHBOMlZnekZRb2JsUHNWRXlQd0ZZclhpa0lnY2RXVm1D?=
 =?utf-8?B?cVNLWjdEMWFWL3MzczRtZENpTUppU1N4bEtkbGJGenVMT2FTcUFCYTdkUUVk?=
 =?utf-8?B?UGhtbHRiMEJjU0gzZUxSSHUxc1RkMTU2MUI4M1BQVG1TTkpNVURQNGpMNUsy?=
 =?utf-8?B?NDZCUTFYWUVveUs0ZStjQXoyVjZRNGIvc3BUZ2RPaFgyaEt6a0grUEY3R1k3?=
 =?utf-8?B?VmdpZG9rcWIwb0EybThWQVl3VnZTVXdpMGt1dkl2MHc0QytlbkdjQXc4blZV?=
 =?utf-8?B?VlFjcVNXR3grclJ1eUcvVHBDWE1GZTI1UG1ISUprT05xOGRhQXY3cmhONlRw?=
 =?utf-8?B?blJlRXZMcTlYZ3RPNlJHWkliMG1IUVZQUUk2WHpraXVBb2R5cFRCc1BHUTdE?=
 =?utf-8?B?NERhcFF5NThaN1hwZ0w3UHE0dTNnQkx0bU4zYnNwc1I1Qzk5eFFiZ1l6VXFQ?=
 =?utf-8?B?eDBqSUdTRThQL091YjhRaE1MWkU0OXpwN281QmRxZWNneGVCTkNBdW5lNFMw?=
 =?utf-8?B?ejFJeFNRUDNSaWxpMkxERWJpbTFUald3WitidHgyc3UzVnIvSFZSWGJyTGxi?=
 =?utf-8?B?emFIL0lXSGhwNk9NQVVrdjkySzNCVHhTWFppbkNzRzJRUGFkOGZnM2NxSWR6?=
 =?utf-8?B?dCtmUCtMUWZnVXIrNjNWSTh3UDlTNU1ZRzdpeERrNkJoTldWcm9MOTVFYVc5?=
 =?utf-8?B?MlJlaG9LQzRYc0VWemtVUEEvL0t3R0dURzU0TWg1OG9YS0l3THBKYlRxS2RI?=
 =?utf-8?B?QWZYWVV4L2xoa2RuTkpMaVVndnI1V3JENVlCWGpNQ1BYTmUxR3JwS2J6ZEd5?=
 =?utf-8?B?VUlYanFRSFVpbXBzSTlsbllKTmZZU012U0xraXdxUkJLSnRsSmt0RHphRzQ5?=
 =?utf-8?B?VWE2WE9PSFdpYnZHT2trMGNXQklYdnJLaFlwZHR0cm5FOThZWVVWdHUzYmgy?=
 =?utf-8?B?dGM2Kzc2cDNyWWE2ZStzaFM4MUJ6WnJNN2FmTHNJcFIxVVdYRENVVWJKVzM5?=
 =?utf-8?B?WE1nUjk4TjV6eFVCQkVNQXVNUnJsNGgwSXJCWlk0NGU2Ri9KOUZhdHVvU3o1?=
 =?utf-8?B?R0QwL0pFMUtlOEQ1MGs3N1Y2RWliS0JQNDBpQ2ZVYy9PdzhDN1VQVXRZeW9r?=
 =?utf-8?B?S1lYN3kwWCtTd3VqL0dJdkpNMUxCNlVtSG8zSk5zOVBEQkNzN2kxY2lZTVFk?=
 =?utf-8?B?UEgzSVZCMWdZTU1hTnpOK2RGd0lGOHZzbklwckJwZ0dCMm9sSzk1NE5OTE5F?=
 =?utf-8?B?SldSd2hlVWlJOUJ2VWZUOGtvT284TU1iWUgxNDhWWkxteEgyUWdyTy9IcHBh?=
 =?utf-8?B?QUdXN3NEbjc1WGx4Skk2OHNkSGFrU0JtSXJFQWpWOE5CVkVBNlk5UU9LL3dw?=
 =?utf-8?B?cEE9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	mPcm3zJrV5H6/1STEek2kiaWxM+nLz1EnpuUxa0FPlzVbs1ENU/gEmjemltrlWWQfDw8OW2JjW21aMlyQiCVICpH+la6C1vj7r1GmZX+tdZC9dFQKf3u5uOdSB7XTCTHwZr9GFJHQ6tVKTrWs24AQ/CAXVIB6C8a+qZxZYe/FAkEtw6Ff4dUagQhKpP+AIdXPOtJhUh+Tbnx4sY4/3A0Hm093TzCkFKdwZfXHKPSQvvs1GBy5PVwEMdrUXttKGIv+BeLJxVsc8d2qydHW2BULra1oclBWu8BZ9pOy5Unc/X1S0QNwbuy2G6fqi1VeghIir762NkyLhmVAkPEok9yCEfbAzA0VVkjiN+7NqCoU+e6wcEA1b3UbGVCO6eaX6ZbiE+OT2ZjC6EZFsPvsRmkIZikaRTcvMeLLfBB4m80k63GkB88WvP9fsgucN/yNXJA6AianTb1cloG1O6Pju0l7MRvBeV3o7aB5q2rkE8IJfSIifhic/RJcorLRCzkxW4PzktnZVmVjEqwo4CW3mPv2NZdrH00IRfOdztYOTqibh4CFGRCYVhuo7vWRRfT3ASiqN2M7INClVivleWQWv6j0ToTSzvC/yN4tLSnOmtINAk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8d3ba6b2-ebae-400d-5014-08dd3f317653
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jan 2025 00:19:42.9386
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: cgCaEPNUReQeyxFAQv2Zy8DgFfWi4aCpgiPSMf0jmFQeXoG6Yq9lvn9d82Yg0Cf0bGGEeJmaZGJwC6xZTLIxfyc++Li6o0/5jmQSPwbtge8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB7996
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_12,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 malwarescore=0
 mlxlogscore=999 suspectscore=0 spamscore=0 mlxscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501280000
X-Proofpoint-ORIG-GUID: -ClVy_ovwABz43W1lAagWuU0T9dlKxxm
X-Proofpoint-GUID: -ClVy_ovwABz43W1lAagWuU0T9dlKxxm

Thomas Wei=C3=9Fschuh <thomas@t-8ch.de> writes:

> On 2025-01-27 10:42:59-0800, Stephen Brennan wrote:
>> Omar Sandoval <osandov@osandov.com> writes:
>> > On Sun, Jan 26, 2025 at 07:07:47PM +0100, Thomas Wei=C3=9Fschuh wrote:
>> >> On 2025-01-13 16:22:00-0800, Stephen Brennan wrote:
>
> <snip>
>
>> >> Do you need to transfer the full vmcoreinfo data?
>> >> Wouldn't it be sufficient to only include the address/size of the
>> >> vmcoreinfo note in memory and the debugger can read the data from the=
re
>> >> with regular memory access commands?
>> >> That information is enough for QEMUs vmcoreinfo device.
>> >> It would simplify the design and implementation(s) significantly.
>>=20
>> I do agree that this would simplify the protocol design, and it's a good
>> idea I hadn't considered. Thank you!
>>=20
>> > Oh, that's a good idea. I guess the downside is an extra command round
>> > trip.
>> >
>> > QEMU and KGDB also only implement the `m` command for reading
>> > hex-encoded memory. We'd probably want to implement the `x` command fo=
r
>> > both since it doesn't (usually) double the transfer size.
>> >
>> > One more caveat is that KGDB doesn't check the length passed to the `m=
`
>> > command and will happily clobber memory... QEMU's gdbstub does seem to
>> > check, and also advertises its packet size, so we probably want that i=
n
>> > KGDB, too.
>> >
>> > Stephen, what do you think?
>>=20
>> One of our core constraints is that the vmcoreinfo is quite a bit of
>> text data, around 3k bytes right now. Doubling that to 6k would be a
>> real problem, so it would be really helpful to keep this to using the
>> 'x' encoding. However, I think there's a couple good reasons that
>> neither QEMU nor KGDB support the 'x' packet:
>
> Could you elaborate why it "would be a real problem"?
> If it is a problem with static buffer sizes, wouldn't this be avoided by
> configuring a max packet size?

> The debugger would have to request the
> data in chunks.
>
> This is also what the drgn pull request currently does for all memory rea=
ds.
> Without knowing much about drgn, I would have expected the regular
> memory accesses to be much more data then the 3KB vmcore notes.

I'm sorry, I should have said what the problem was!
The problem is more to do with transmission time than buffer size. For
the worst case 9600 baud (960 bytes/second), the vmcoreinfo alone takes
~3.2s to transmit. Then you need to add in any overhead for the several
packets used reading chunk-wise.  Doubling that transmission time by
encoding it with hex is something we really wanted to avoid.

But it is fair to say that drgn may request other large blocks of
memory, and without 'x' support in the stubs, we will be suffering with
that same large transmission time as well. So implementing the "x"
command in our targets would probably be helpful, regardless.

>> 1. You cannot know the required buffer size easily, so you cannot know
>> whether you will be able to satisfy an 'x' request in your static buffer
>> size. This is most relevant to kgdb. The 'x' packet documentation says:
>>=20
>>   The reply may contain fewer addressable memory units than requested if
>>   the server was reading from a trace frame memory and was able to read
>>   only part of the region of memory.=20
>>=20
>> I'm not certain what trace frame memory is, but the vmcoreinfo is not
>> that. I'm not confident whether this means the protocol allows fewer
>> bytes to be returned for other cases? Certainly, the 'qXfer' packets
>> explicitly allow for fewer bytes to be returned, as the documentation
>> states:
>>=20
>>   It is possible for data to have fewer bytes than the length in the
>>   request.=20
>
> If I understand correctly "trace frame" refers to same sort of cache.
> It's not a property of the target memory but how it is managed by gdb.
>
> For m reads, gdb itself explictly seems to allow short reads, also
> referring (not exclusively) to trace frames.
>
> Server:
>
> /* Read trace frame or inferior memory.  Returns the number of bytes
>    actually read, zero when no further transfer is possible, and -1 on
>    error.  Return of a positive value smaller than LEN does not
>    indicate there's no more to be read, only the end of the transfer.
>    E.g., when GDB reads memory from a traceframe, a first request may
>    be served from a memory block that does not cover the whole request
>    length.  A following request gets the rest served from either
>    another block (of the same traceframe) or from the read-only
>    regions.  */
>
> static int
> gdb_read_memory (CORE_ADDR memaddr, unsigned char *myaddr, int len)
> ...
>
> Client:
>
> target_xfer_status
> remote_target::remote_read_bytes_1 (CORE_ADDR memaddr, gdb_byte *myaddr,
> 				    ULONGEST len_units,
> 				    int unit_size, ULONGEST *xfered_len_units)
> {
>   ...
>
>   decoded_bytes =3D hex2bin (p, myaddr, todo_units * unit_size);
>   /* Return what we have.  Let higher layers handle partial reads.  */
>   *xfered_len_units =3D (ULONGEST) (decoded_bytes / unit_size);
>   return (*xfered_len_units !=3D 0) ? TARGET_XFER_OK : TARGET_XFER_EOF;

Ok, I suppose I'm putting too much stock in the wording of the docs.

Maybe I can update it to indicate more clearly that the number of bytes
returned may be smaller than the requested amount. The way I read it, it
sounded like it was *only* legal to return less than the requested
number of bytes in certain circumstances.

Something that confuses/bothers me about remote_read_bytes_1, is that it
uses the configured PacketSize, divided by 2, as the maximum amount it
requests from the stub - even if it will use the 'x' type packet. That
means that for 'x' packets, the buffer size would likely be
under-utilized, since most bytes are probably not escaped.

If using the 'x' type packet, and partial reads are allowed, then why
not request as much as possible, and let the stub return however much it
can fit into its buffer?

I'm also slightly confused at this use of PacketSize. From the
documentation:

  =E2=80=98PacketSize=3Dbytes=E2=80=99

    The remote stub can accept packets up to at least bytes in length.
    GDB will send packets up to this size for bulk transfers, and will
    never send larger packets. This is a limit on the data characters in
    the packet, not including the frame and checksum. There is no
    trailing NUL byte in a remote protocol packet; if the stub stores
    packets in a NUL-terminated format, it should allow an extra byte in
    its buffer for the NUL. If this stub feature is not supported, GDB
    guesses based on the size of the =E2=80=98g=E2=80=99 packet response.

It reads like something that advertises the buffer size for the stub's
*input buffer*, so that GDB will never send a packet too big for the
stub.

But here GDB is using it to limit the number of bytes it requests from
the stub. I understand that many stubs may share an input & output
buffer, so that makes a certain sense. But if partial reads are allowed,
again, I would expect GDB to request whatever it wants, and let the stub
limit its output by what fits into its output buffer, and that could
control the chunking rather than the negotiation process here. That way
we could reduce round-trips. Would that approach be legal in the
protocol?

----

I've now realized what may be the most important reason to use the qXfer
command rather than simply returning the memory address of the note.

QEMU only knows the phyical address of the note. It offers a
non-standard extension to the protocol which allows switching from
virtual addresses into physical address mode.

KGDB knows the physical and virtual address of the note, obviously.
However, it has no support for reading physical addresses.

We can't have QEMU transmit the virtual address, since it does not know
it. And it's pointless for KGDB to transmit the physical address, since
it offers no way to read it. I suppose we could have them transmit
whichever they support, with some sort of flag to differentiate, and
then rely on the debugger to use the QEMU extensions to enter physical
memory mode to get it. But that seems like the most complex option of
all.

Thanks,
Stephen
