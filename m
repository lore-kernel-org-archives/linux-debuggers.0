Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE4AF1624D0
	for <linux-debuggers@vger.kernel.org>; Fri,  4 Apr 2025 23:30:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743809424; cv=fail; b=Ywv1b89O0BLmUWCtdFcn8i1kIM9djVdigMLxsx9k8YJxWDmnI59yEeS+7Y1R3+67DsQJWvrcYM03XomzARLTvNfCvbtbwDx3OJj/dCci6Ej6vh0LoULFC1r06w9gWsGPJROXtkrycJ2RDiUABX380iEP8FiVGE+tbL9m+YwE90Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743809424; c=relaxed/simple;
	bh=bTHb9dQNExUKUvYjeBcWBYNSF/N12396jCwMADOE2vo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=KshhTqluEePGAIVo1bsIswYJa/xAnOGXFpGY5mmytm1HoiDPT04YnYtmhrAWs/WKzmdUNK2edv4QJ6bM9WQdw6fuf8rWXuvFkhGQnANtkvliV2KQiNB7j3nsVNlL3tkA0a0BkcsTJmRaRkOk+b+Bk3VYQMERLlBvZpMAQEy8K18=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=aRwVT05s; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Z3cV5RAH; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="aRwVT05s";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Z3cV5RAH"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 534L4HVx011469;
	Fri, 4 Apr 2025 23:30:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=y4Zr7Rtb9js90tP38sL9kBIZBLXhQb/6Liko43fp99c=; b=
	aRwVT05sEmAcaL4G+NWsvsY+Fmg6MQWtVQYDY/eF4Dh7+y7iHNjjGb6IztqLynnx
	C1kF7HQRWQklYNUFIXFnt7pTj7sYRNOyN9kn4LQKLeqYZw/+Nt7vwRTwNSkP7T/T
	rhpTjsc8h0ouSmldd67uc1hRuIVpMWVOQpO8fC3eKWzFbRqHWIR1dgay6pBX8kC+
	TPbto9QDOIy6GFYT9H6TXkuu4t+BaPVJtl2/8HWAGUibW733V+7YXNUJww2XbdP/
	duLGTBVL0DOt0f2t75ctpqBbyA6pdQNXRa+zlz+tpfqoeKPxXbI4VYioilt6UQiI
	JhYE0ujYdOJuun7cQe/LYg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p9dtr6c1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 23:30:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 534LqLTC036176;
	Fri, 4 Apr 2025 23:30:16 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2040.outbound.protection.outlook.com [104.47.73.40])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45t2nupbrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 04 Apr 2025 23:30:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tUE2Xyg8glRp3x1IC2m7L2ME0wZ0oIXrWFM3PtZFhYrsyXLMf6tpysXe5eEx/Cz/GC4+l0WQDbuGLIjxFypn0/IR3BbjroqiwkKFx2P0ZNyXUxVnlOr8N0+jhi3VZbnG7SRw8HHMYFkIwXRBZZdMXeMSCnmiu55K3RDzVCCU0oz59jHnVEebbnXYZP7TVldG+qH90mIIdLhW2r2il8B61ZNUwPy0TLA2Ukhs0QTtgpoIDguDa2zWINT6VTE576Epi0XIAWFH8fCWoJr08f6SZ946KsRw4z0aTvN14Maz+lvAeWaW5+bmxbMznrbPKpH0+7TBeoWsrm0z4c9KB8/j1Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=y4Zr7Rtb9js90tP38sL9kBIZBLXhQb/6Liko43fp99c=;
 b=dBe2bMb7YU7soi4jWJJOny2ODCARnlRfcG5r21I5dISZXeonZI5UVPGk9DOY7eUOR0HpQEvs4672cUl8/eUsJn3FGUpp3zjMnVabFSfwNrwRs4/mozXjKggqF14FHFSR6sm0QZYgTr5Gc1PD0lJ31ymnMGr0XGhISPEPAyhntuoKdYb6KAXIAEs62nevHgcZAwtoo/vneiFl3p54OypXchywYfj5BUduY4J7mw7a3i8tBjKzCodIsxGIeAnO3k2myf+eYDzVRrG3k3R0Ij47+sZJuEm4bVQlJLjDVG5ba2VdDDrXipj9K2owc4ssTBNe/+EZoiKQB9wvUgtL2CqZvQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=y4Zr7Rtb9js90tP38sL9kBIZBLXhQb/6Liko43fp99c=;
 b=Z3cV5RAHg16BL7WwG4ao9ywMyTZYaoAIgQZfVU8avhSuP7w1DrZ3Z1Tz+yJHvyXj27bP2S96asqHnt0Nv6OVf8ZVDu5aOigZU/RpGL7yEJHH8RthnkJls+r1qXZcpYtjzV6zNCD9ogYLQJmEjmQswgrP3LdmU+adONsPDZDeYIY=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA6PR10MB8040.namprd10.prod.outlook.com (2603:10b6:806:447::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8606.27; Fri, 4 Apr
 2025 23:30:14 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%7]) with mapi id 15.20.8583.038; Fri, 4 Apr 2025
 23:30:14 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Tao Liu <ltao@redhat.com>
Cc: devel@lists.crash-utility.osci.io, linux-debuggers@vger.kernel.org
Subject: Re: [Crash-utility] [PATCH CRASH] Fix module section load address
 when sh_addr != 0
In-Reply-To: <CAO7dBbUAOfK-k-CKFgBopN_i4bGBO+bykO9VMQ0pu6Ja4hSGEw@mail.gmail.com>
References: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
 <CAO7dBbVa=HMvZEsFTCYwULSgjbfac7SCZNEKgYePgPXb9kNvgA@mail.gmail.com>
 <877c42ywxw.fsf@oracle.com> <871pu8zx1k.fsf@oracle.com>
 <CAO7dBbUAOfK-k-CKFgBopN_i4bGBO+bykO9VMQ0pu6Ja4hSGEw@mail.gmail.com>
Date: Fri, 04 Apr 2025 16:30:12 -0700
Message-ID: <87y0wfy06z.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BL1PR13CA0132.namprd13.prod.outlook.com
 (2603:10b6:208:2bb::17) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA6PR10MB8040:EE_
X-MS-Office365-Filtering-Correlation-Id: 4a25cda6-e110-41c1-53ff-08dd73d0a69f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?djNHN0wxa1QwSmQ5Y3RkWUExdTM2OUpMUlBuODhFRmFTVWFIclg0YTVlWCsv?=
 =?utf-8?B?RHdNK25abkd0a1U3V1cwQzFSakRqSWtJNEQ0UENhZzVIc0p0d0prL05VaDZG?=
 =?utf-8?B?eCsxeTFNWnRKSitDTnhUTW1XTjNFVHd5Q0FYTHRNQkloTmdRT244UWRmSHVv?=
 =?utf-8?B?RklwbGxFeUxBNG9ZYS9qVzUxZnRCcE14cUpxOE5rb3pxQUVDRmRxdFRqOEgz?=
 =?utf-8?B?bkFYbWFmT1hMYnJjOHhtZ25PMlZwY1RBKzZkVC9TLy9rakRFV1Nza0ZuUVRV?=
 =?utf-8?B?MVRWaDYrWGdCUy9SZFdEU3ZLMEFWaWl6OXJwWlozWDExV3JVaFJCUDdqYVd3?=
 =?utf-8?B?YTd1ajZodjZyU3hMY3M0ZllWU1Q2QWJwVEcyK0JsT3R6VkVHWUxxNWhjMlBP?=
 =?utf-8?B?ZkkvRTByT3dZVXZ4Z2hBb1lzVGYwYjBKTzRiU2lJcTNTTDkzdlNEOFdDWnpT?=
 =?utf-8?B?SE1FbGVsNk8wUElSNnJLNlhhR0VDQkk2Um1TTys3S1VDbWpSRm5QWm5ZVU9G?=
 =?utf-8?B?WjRiRWlNTXJLOGZqaHpNWGN6bnB1bGRzNENHdmZZK3dNWnRUcVRNTnN3S2pV?=
 =?utf-8?B?aFd5UkFCRzZDdU5BNjVtK0xvVnBQV0ZwWHhBazVwd3ExSlJ1L3RJSzBtYXFs?=
 =?utf-8?B?WnEwUnU2VmdtZ21tZUt1R2V6Q0ZibUxmakhLc0gyeGpXZUNSWlJUcS9sL1cv?=
 =?utf-8?B?N0pyWVpjbTdNdkU3UVJveVV6OTRkOW5iV0VaTFl6Qnc2Mk96NDFFREVCU1RP?=
 =?utf-8?B?ZU1SVEx4T3hnQ0J5UXlTcjEyZnlkZE1DeVB3SDBDWTBOdnVmZncrTFFpV3Ax?=
 =?utf-8?B?aUVPVDRrQ1NpSlJuQ2hodnM0citkUGh2QlhNMVBJVHU5M0tBVkI3ajg3ekxL?=
 =?utf-8?B?TE9uZDNZKy82bFJXWXEvSkZkSEJlQkEyNXByNlpWN0xQaW5BcDUzQWxhNzZ4?=
 =?utf-8?B?bUd6MkVPWjVFS3JkamIyVmgwSUxLa0VTa3ZGMEpLc3NxYzhkTkN5aGR2MGwv?=
 =?utf-8?B?eng3dGJjeGFxMGRUakZScndYU21tRVd5dGdLZTRCM2FJTC9yTTBSQ3E3Z01n?=
 =?utf-8?B?R05xMlFZWjhJVS9hd0RmM2w3cHdvbThxZ2REYllRTnJndW5hOGVLWFM2a0E3?=
 =?utf-8?B?U216VzZ5UGh6SkEycmlSdEF2TGlzWjMxSUlDZnRrSEhFRzVQbmNoMmpyM1Bk?=
 =?utf-8?B?amptTDV6VGJCVkZ0cHpnVDdZaXlOZnFxVmNGUk1RSjZ2R01aTXBGbFppN1Na?=
 =?utf-8?B?TWV3bk9xYmF6cVhXcDlzNm5keFZ3ZEljWmNXb1NyQkQrWlJld1FIOEVoOEZa?=
 =?utf-8?B?QmRCbDFpUVRyUlQvdmtRK3o5WG10VS9hc1ltNU0yVmRCRDJKcEp1UjQ5elB6?=
 =?utf-8?B?TkVDSVhhQTRjVDVXZ2JJdm9NSklsbUEvSUR6MXV1a25OQVhwQkFpZXliU0VY?=
 =?utf-8?B?dGVkbjhxMUhaVXl5RWZWd05XYzhZR0lsZzVsQmpCMUhyRTJnUjk5LzhRWGRm?=
 =?utf-8?B?WllNRFNYeG50b1pocHR2bG5XY0p3ZnpRZ1V5SHViWVZXQzc5aTR4TElOU1k5?=
 =?utf-8?B?N2hTalQyS24yZGREMFBkeVRlaXdmU0ZBWjY5b0oxQVBIK1k3a3llSDdLOExs?=
 =?utf-8?B?VEdNZjM3cHpmbmNMa1d6Z2JiVVdKamxYTHZFcGd4bVBjUWVmNE41NzhGYkFk?=
 =?utf-8?B?Y0ZoMzVpUDdtaTJxVVp2YUV6UXBVRFQ1Mjc0OTFwTjJaQlhUUmFpb292bmJ3?=
 =?utf-8?B?L0cxKzNPTndOS1A1Qm94NnJROVRsaW0yUUU5MTBtOUgwemJtbk0ra2w3a0kz?=
 =?utf-8?B?TkhLZnpZZlIzTXZ4T1RwRUJXWDJSNmxQV3hwNXhia1VpZGgzNFdhbER1QTVn?=
 =?utf-8?Q?YWi4F7TiwsNuB?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?MGVKM3p0MjYxK3VDRnV0NHRuQU9WT3daZTV0d0NIOXNTYm0rUlJFb2I1dVI2?=
 =?utf-8?B?L1VXaTluOTkyT2lnbGU0R3dpcU1EYSs1Wm1SemExU2FmdW95WUNneFQxVzJh?=
 =?utf-8?B?ZE56NmFDdWI2Z2x3OW9pZFl2TDl3dWR5K0F3Nk5FZmhZMGhEajRtYzRXNWMx?=
 =?utf-8?B?dVJUMUJ2YUYvUG4vUVZHL2RXcEN1emlzM0pXeG45MVlCa0E1Ry9wOG5qbnNk?=
 =?utf-8?B?SWxucWZUNzR0ak9UcVpmVXAzU24vVHFzdE85NGp0SVUydXc5bnlFK3B2VDlt?=
 =?utf-8?B?ZjJMbXkzTzlpRzkra2V5UGNpK1d6TjBpTDAwUTBnT1JkOWNtd09VZnJ5NHZO?=
 =?utf-8?B?SFVzNUwrMCtsZEVJR0lkcm1hODU2U2NCODAvaEpaSGlIbmdORWsxOGQzN1Qv?=
 =?utf-8?B?N0pqdjFxRGJHM2FuZC9jWXdqeEs0WTJ0c1VSM3JXS2doZDdXdnlNSGt4b1dF?=
 =?utf-8?B?RmtyY3EyU0FjUEt2ZlBsTThvbEpRamUyaWdYazBGSWRaZVVHNFd3SllKcXNu?=
 =?utf-8?B?bnNmdEpTdldsQUY1OFAzbG9HN2psS1U0WXBva04za3crTUwyU2cwNWorV1Nn?=
 =?utf-8?B?Y1ltdmVnWmlYZUdySW45czZtbUpEZmc2N01RWlduM2ZwaGg5b1NzN2dTbDRK?=
 =?utf-8?B?Wmo4VnFFV1NEOHJjSGFqaGp6YllOQVlCUkRuL3JoK3N6K1pZQ3E5RXk1K3A3?=
 =?utf-8?B?MTBzRUh1U0V1SzIrMGRWZTJZTWhRR0ZjckhpYmZzTEl4MnF0NERzTHBsYnBL?=
 =?utf-8?B?SWlnRERDYWZUNTR0WTloWFIvZGpKaUFJQm54TnF4TW9JTGIrZ092K1pWUHB4?=
 =?utf-8?B?K0EzczlxL3MyUHdnK21CTVNkbVU0MXlpYjg0emVRRXdxb3FYRkFvMzZOdXpj?=
 =?utf-8?B?MXpFSE5lV0gwOEpZdkdoM2tTSW80L01veG5SRWJwamVNQlk1dHNiamtxSThh?=
 =?utf-8?B?UGJqUVRDcmhhbnU3dzV4bE5DUS9mckxQL2ErK0J6ZU1IQjNCNGlDYWZFamtY?=
 =?utf-8?B?NmJpUFl6aytYakNqMkpZYUlPODBJTTAyS09RZ0pUaGdkZXdJWmR6NnBWMThx?=
 =?utf-8?B?SEY3ZGZlMnlBSWhQcktUNzlJa2xEQVJOVjZIWWhUL0xRRk5IVm43U1pxMXE3?=
 =?utf-8?B?SDVnSEljdmtLN1FpbDMrTk1aZTFVSjRhcGc5U3RxckFXSmNocWhUWnloYzJQ?=
 =?utf-8?B?ZzdiTkJTUkdhQnA1b1ZxbmZLbWFnRlpnc2s0cm5MbThaTkJnNDQ4bGxMNVNr?=
 =?utf-8?B?dE9Fdkl1OEZrakxJRldYcFZzRGlmb0Y1V3ZCb3J1SFR2OW9oT0I5YUI1U2hx?=
 =?utf-8?B?MkVQSG9HbnlpWUg5L0k0TFZZME5heVdFU3l3TnQ0ZG5SbXdtTmtaOG9YWWUw?=
 =?utf-8?B?bXIwSG5RRjBBaVl4b0ZUS3ZMQW1mbDVxM2xMQ0lRQVdidk1tWjhuT29JbzJG?=
 =?utf-8?B?M3pZU3Q4K1QyNmQwdDJFTVRoQmQ0ZEY4djQwMEhRQ2ZBZTl5bndHN2lLbUpy?=
 =?utf-8?B?OGF4NmNNbXdsUWthVWsxdTN0blFFWFBPazA0TGVhY2hpQnFOK3FqZTBVNUdF?=
 =?utf-8?B?Y2dXWGpxZUl3cDR1YTJHSFVJSTBWVWdCRlVFQndNYmcxNlhJQ1YwTHN4MG5T?=
 =?utf-8?B?d2plMlFxeVNvMWVUQzhHb2JqcnRwT0ZiYnMzeEQrVmtubGdLZzFpM3JiWlB3?=
 =?utf-8?B?WHhBRHlUbVRuQnlzcHlTbnNqOTl3aWZtemVGeitJazBsVVRwVXpsN2xZTFF4?=
 =?utf-8?B?WmExSHRrWlpQdVo5L3NIMU1TMk9SbTF6ZnRjT3VZbUdtZi82NGtvWityaDhk?=
 =?utf-8?B?VW1UUThtbTZienRRb1BjYXdxMUNqMTlXc0QxdGZyREV1QUkwZndXU3hSa3py?=
 =?utf-8?B?UUM1QkNxTWNIem93UnZYUWRkeEJESWM3SUR3WE5IdGNmeGlIQ2VmSDB4MW45?=
 =?utf-8?B?cG1ubTV6NVZPZ0x0ekFBdStLWmFWNXVnZGxrMk53WVRhVmI4dCtTK1luQ3pz?=
 =?utf-8?B?dVprcTVLSEljSkRjbThac3lWVERRRHZ0eGFSRXB2SE02c2hSbU52QXlvMTVS?=
 =?utf-8?B?Z0w3d3B0TmZ0MUlBbHJtSjJhRVIvTWRrUWFpbEpBOFJ3cXJkeWFCU0VxRVBR?=
 =?utf-8?B?eXJDNnlua0l5cjhRU1BjTExzYkFpQzI1a09UcDE0WDN2LzQzK2ZjeEVzeUoz?=
 =?utf-8?B?N3c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	u/CLsTnLyIDT2WgwgQ0y6dZO6UETPQMVMPjfmQs22K1ffrnY2s4+vCrNfe+DknDOAemnM5xpNbpBTki+6FeaKKVxZnjjY7HlgjkbUetsksOski/a1svnJNyFqEYIeJ8k9/zexLUnoy2Z2p8W4o4uyOf6vQrkoZQYH6FHPJcr/xXPiRDiwHCtnODjQ/3Kl49a+3bgZzedRQsoaRm3xtYRy/YyzNjil1q40VLhXNoCG0HzT99EonbGH6zYV+UBBo8AorxgEY493snz4szwr9XnoJf7VIPQn1emk17fwXwvVHMZjvdryw/wgrE2y5WdydaRN4Vax1/yPdDL6k3O3DGfmnlmhv2OQzbeFHc86bQMMSTKza8qR+XMzON505l+zbh62pZzZyAhO3dDXO5XHXhGxveKFdrRWY4HLyf/Shn85SdlJ1qGgTBEvUxijsjiyKH0q0FNpetFDaPUs635+rasS7d9PmcVOSw+BTWFv4/IwiL/JAvEzPSNHTSXQZ3QqTd0RPps6plpiAFRm5X18BhMKWCfzA3/NC2FE6S+xqtqkX/z25oyJXb6lxYrwcjcia+EXkfIW02Xw5vqVfmMRSU0Ar5uQ9uWLNgf0H7cuD7Z4us=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4a25cda6-e110-41c1-53ff-08dd73d0a69f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Apr 2025 23:30:14.4699
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oQjQk4rJh0mAcC18eLv/y0yitc0wRteD2IOyhSQWbaxeNdoS4p9vvYlmwoibsr4LP7uekXVKDgUZQBHKb8/vKWUMGAZ08gmzldisRPOaHCA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA6PR10MB8040
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-04_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 mlxscore=0 adultscore=0
 suspectscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504040162
X-Proofpoint-ORIG-GUID: tJHGug7shRoG2BMEhSF7AD__QeOtX-9v
X-Proofpoint-GUID: tJHGug7shRoG2BMEhSF7AD__QeOtX-9v

Hi Tao,

Thanks for digging through the code with me. I'm not very confident or
familiar with it, so I don't have 100% confident answers, but I'll do my
best to answer:

Tao Liu <ltao@redhat.com> writes:
> Hi Stephen,
>
> On Fri, Apr 4, 2025 at 11:43=E2=80=AFAM Stephen Brennan
> <stephen.s.brennan@oracle.com> wrote:
>>
>> Stephen Brennan <stephen.s.brennan@oracle.com> writes:
>> > Tao Liu <ltao@redhat.com> writes:
>> >> Hi Stephen,
>> >>
>> >> Thanks for reporting the issue and patch. Please check if I understoo=
d
>> >> you correctly. The correct output you are expecting in your case is:
>> >>
>> >>     crash> sym ata_dummy_port_ops
>> >>     ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
>> >>     crash> mod -s libata
>> >>          MODULE       NAME                      TEXT_BASE         SIZ=
E
>> >>  OBJECT FILE
>> >>     ffffffffc0a7b640  libata                 ffffffffc0a47000   52019=
2
>> >>     /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/dri=
vers/ata/libata.ko.debug
>> >>     crash> sym ata_dummy_port_ops
>> >>     ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
>> >>     crash> p/x &ata_dummy_port_ops
>> >>     $1 =3D 0xffffffffc0a6fe80 <<-------- should be 0xffffffffc0a71580=
,
>> >> same as sym's output, right?
>> >
>> > Yes, that's correct.
>> >
>> >> If that is the case, then after applied your patch, the issue still
>> >> exists on my machine:
>> >>
>> >> crash> sym fuse_miscdevice
>> >> ffffffffc05f7fe0 (?) fuse_miscdevice [fuse]
>> >> crash> mod -s fuse
>> >>      MODULE       NAME                             TEXT_BASE
>> >> SIZE  OBJECT FILE
>> >> ffffffffc05f8dc0  fuse                          ffffffffc05da000
>> >> 233472  /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs/f=
use/fuse.ko.debug
>> >> crash> sym fuse_miscdevice
>> >> ffffffffc05f7fe0 (b) fuse_miscdevice [fuse]
>> >> crash> p/x &fuse_miscdevice
>> >> $1 =3D 0xffffffffc05daf20 << ------ unmatch with the previous value.
>> >
>> > Indeed, I checked with fuse on Fedora (6.11.4-301.fc41.x86_64, so almo=
st
>> > the same version). And I see the same behavior with fuse_miscdevice.
>> >
>> > In your case and mine, the offset is 0x1d0c0, which could be a clue to
>> > how this mismatch happens.
>> >
>> >> The .data section of fuse.ko.debug have non-zero address:
>> >>
>> >> $ readelf -S /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel=
/fs/fuse/fuse.ko.debug
>> >> Section Headers:
>> >>   [Nr] Name              Type             Address           Offset
>> >>        Size              EntSize          Flags  Link  Info  Align
>> >> ...
>> >> [50] .data             NOBITS           0000000000000e20  00000100
>> >>        000000000000080f  0000000000000000  WA       0     0     32
>> >>
>> >> Could you please re-check your patch for this, or is there something
>> >> I'm missing?
>> >
>> > From what I can tell, the important difference here may be that the
>> > symbol you selected is a static variable (which becomes a local ELF
>> > symbol). Apparently, my patch only resolves the issue for *global
>> > variables*, but not for local variables.
>> >
>> > $ eu-readelf -s /usr/lib/debug/lib/modules/$(uname -r)/kernel/fs/fuse/=
fuse.ko.debug | grep -P "fuse_(miscdevice|mutex)"
>> >    85: 0000000000000100     80 OBJECT  LOCAL  DEFAULT       50 fuse_mi=
scdevice
>> >  1041: 00000000000005c0     32 OBJECT  GLOBAL DEFAULT       50 fuse_mu=
tex
>> >
>> > Here is the behavior of crash's master branch on these two symbols:
>> >
>> > crash> sym fuse_miscdevice
>> > ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
>> > crash> sym fuse_mutex
>> > ffffffffc02fb4a0 (?) fuse_mutex [fuse]
>> > crash> mod -s fuse
>> >      MODULE       NAME                                  TEXT_BASE     =
    SIZE  OBJECT FILE
>> > ffffffffc02fbdc0  fuse                               ffffffffc02dd000 =
  233472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fuse/=
fuse.ko.debug
>> > crash> sym fuse_miscdevice
>> > ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
>> > crash> sym fuse_mutex
>> > ffffffffc02fb4a0 (B) fuse_mutex [fuse]
>> > crash> p/x &fuse_miscdevice
>> > $1 =3D 0xffffffffc02ddf20
>> > crash> p/x &fuse_mutex
>> > $2 =3D 0xffffffffc02fa680
>> >
>> > Both fuse_miscdevice, and fuse_mutex are mismatched (with different
>> > offsets). And now, here's the behavior of crash with my patch:
>> >
>> > crash> sym fuse_miscdevice
>> > ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
>> > crash> sym fuse_mutex
>> > ffffffffc02fb4a0 (?) fuse_mutex [fuse]
>> > crash> mod -s fuse
>> >      MODULE       NAME                                  TEXT_BASE     =
    SIZE  OBJECT FILE
>> > ffffffffc02fbdc0  fuse                               ffffffffc02dd000 =
  233472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fuse/=
fuse.ko.debug
>> > crash> sym fuse_miscdevice
>> > ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
>> > crash> sym fuse_mutex
>> > ffffffffc02fb4a0 (B) fuse_mutex [fuse]
>> > crash> p/x &fuse_miscdevice
>> > $1 =3D 0xffffffffc02ddf20
>> > crash> p/x &fuse_mutex
>> > $2 =3D 0xffffffffc02fb4a0
>> >
>> > Here the global fuse_mutex is correct, but the static/local
>> > fuse_miscdevice is still incorrect. This indicates that there's more y=
et
>> > to fix. (But at least my patch does part of the work!)
>> >
>> > I'm wondering whether this has anything to do with ELF relocations.
>>
>> Hello Tao,
>
> Thanks for your detailed debug info, which is quite helpful! For your
> No.1 patch which fixes the global variable relocation, it looks good.
> However, for your No.2 patch in the attached file, I have some
> questions.
>>
>> I've continued debugging and verified that the root cause for this was
>> GDB performing relocations to the DWARF info incorrectly. At the bottom
>
> 1) Is this a gdb bug? If it does, then the proper way is to post No.2
> patch to gdb mailing list and get it fixed there, then we can do gdb
> patch backporting to crash. Frankly I haven't figured out whether it
> is gdb or crash bug so far by myself...

I'm also not sure whether it's a GDB or Crash bug.

Honestly, I think the "bug" is in Linux for producing non-zero section
addresses in a relocatable file. It seems to be universal that section
addresses are zero for relocatble ELF files.

> 2) I'm quoting part of the commit log in your No.2 patch has follows
> (Please don't send patch as attachment next time, because I cannot
> comment directly on it)

Understood, sorry.

> ...
> 1. In default_symfile_offsets(), GDB detects the nonzero sh_addr field
>    and fails to apply the user-supplied section offsets. The result is
>    that later, in symfile_relocate_debug_section(), relocations are
>    applied to the DWARF info using the wrong section addresses, which
>
> Didn't we have corrected the .data section address in No.1 patch of
> the .ko? Then why the "wrong section addresses"?

The flow is like this:

1. crash executes "add-symbol-file [...] -s .data ADDRESS"
2. add_symbol_file_command() parses these and stores them in a list
3. We eventually make our way down to syms_from_objfile_1(), which seems
   to be the main logic.
   a. addr_info_make_relative() takes this list of section offsets,
      along with the BFD file, and matches each one against the BFD
      section. The function description indicates that the purpose is to
      make the addresses provided be relative to the addresses in the
      BFD section, which I suppose is why this number is subtracted.

   b. Then, default_symfile_offsets() is called from
      syms_from_objfile_1(). This function only cares about ET_REL
      relocatable files. It verifies that all sections have a zero
      sh_addr, and assuming that is so, it updates the load address and
      sets various fields on the BFD file to allow relocations to work
      correctly.
4. Relocations get applied using the values set in 3.b. Since the values
   in 3.b were tampered with in 3.a, relocations that are based on the
   address of the affected address are done incorrectly.

I'm still not certain who is at fault, though!

>    results in invalid addresses for variables. Clearly, this has
>    happened before, because crash has special-cased the "__ksymtab*"
>
> Which line of code do you mean the special-cased __ksymtab? I didn't
> find one in gdb/symfile.c.

It is this part of the diff. I've removed it in my commit and also
removed the check for nen-zero section addresses.

--- gdb-16.2/gdb/symfile.c.orig
+++ gdb-16.2/gdb/symfile.c
@@ -633,7 +633,26 @@ default_symfile_offsets (struct objfile *objfile,
       for (cur_sec =3D abfd->sections; cur_sec !=3D NULL; cur_sec =3D cur_=
sec->next)
 	/* We do not expect this to happen; just skip this step if the
 	   relocatable file has a section with an assigned VMA.  */
-	if (bfd_section_vma (cur_sec) !=3D 0)
+        if (bfd_section_vma (cur_sec) !=3D 0
+           /*
+            *  Kernel modules may have some non-zero VMAs, i.e., like the
+            *  __ksymtab and __ksymtab_gpl sections in this example:
+            *
+            *    Section Headers:
+            *      [Nr] Name              Type             Address        =
   Offset
+            *           Size              EntSize          Flags  Link  In=
fo  Align
+            *      ...
+            *      [ 8] __ksymtab         PROGBITS         000000000000006=
0  0000ad90
+            *           0000000000000010  0000000000000000   A       0    =
 0     16
+            *      [ 9] .rela__ksymtab    RELA             000000000000000=
0  0000ada0
+            *           0000000000000030  0000000000000018          43    =
 8     8
+            *      [10] __ksymtab_gpl     PROGBITS         000000000000007=
0  0000add0
+            *           00000000000001a0  0000000000000000   A       0    =
 0     16
+            *      ...
+            *
+            *  but they should be treated as if they are NULL.
+            */
+            && strncmp (bfd_section_name (cur_sec), "__k", 3) !=3D 0)
 	  break;
=20
       if (cur_sec =3D=3D NULL)


>    section names to avoid this condition. To resolve this, we simply
>    drop the check for nonzero sh_addr altogether: the only ET_REL files
>    we encounter should be kernel modules, so there's no real reason to
>    be picky.
>
> 2. Even with that fixed, the user-supplied section addresses are
>    clobbered by the addr_info_make_relative(), which subtracts out
>    section offsets during its operation. To resolve this, undo the
>    operation for ET_REL files where a section address was provided by
>    the user (i.e. crash).
> ...
>
> According to your description, it seems to me the gdb cannot handle
> the nonzero sh_addr in the .ko case, but .ko isn't the only one whose
> .data VMA is non-zero, see this case:
>
> $ readelf -S /lib64/libc.so.6
> ...
> [30] .data             PROGBITS         00000000001e8000  001e8000
>        00000000000016c8  0000000000000000  WA       0     0     32
> ...
>
> I don't know if gdb also fails in the userspace .so case? I mean, if
> gdb can handle the user case with no problem, then probably we don't
> need to hack gdb like this.

One important difference is that libc.so.6 is a ET_DYN dynamic object
file. A key difference between dynamic executables and relocatable files
is the symbol table: symbols in dynamic executables have an absolute
virtual address, and they only change based on the load address. Symbols
in relocatable files have an address which is an offset from the
beginning of their section. So if a relocation is done based on the
section address, and the section address is incorrect, then the
relocation will be wrong.

Stephen
