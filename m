Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6E312F5A22
	for <linux-debuggers@vger.kernel.org>; Tue, 17 Feb 2026 22:44:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771368287; cv=fail; b=ehN/5Y5IkUnIwz4oyWje0Bz1FXP76NtVnt39s07H7uYDDc30dku+htFwixilPCxiHEuJA1p420OiXfi9jVfJtl3epdPNIKxIz6QEKfPS7Ab2ohTNsOAornLn+V+WJYz1bnlTNP1ZoK0/k6vviaPx/MSkZFLDQdcLQ8uiRMMRSo4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771368287; c=relaxed/simple;
	bh=EcW89VMrJHVMx3Ba8basNXG12+twPRKSyULR4ebott4=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=cLoWxmdIsm0YuMcGzvkyAMHj8di1HVB9nUxPjcvfjRgQaMeViuMaHHck/KlqWl46oZP1k2UFP3IM0qjS+68XQ0rrA9cdNKd+tUcDh9fAUJdJ+upvsf6dhQiSgh5+8uSPAxcBC5wkXYgPeBpJN8oaYdfzaaaLRPbJ7ENHE9lEsBM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=b2J6AhoP; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=aXjH8Wn3; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="b2J6AhoP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="aXjH8Wn3"
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61HGNJeo389835;
	Tue, 17 Feb 2026 22:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=3/lsg16cfosq25Up6cNGxSmyLxtbOlobPorwWL83tr8=; b=
	b2J6AhoPVkbF67BCUN/kfzsYE1gEwe31+AgH4N2/NzCh2T2c+fsVCLxokRycVZoN
	VghBJdrP5mXz5tGMlYlntEWpxRCyxDhjZdFKlMtEUixL8noc4kxvKjYWWQKUVqlg
	mtmSQLSACERc1w3iJUzjfXwVDuixi+J+soQG37DfSD4KkwMZpFhzID+rgsUnt8+g
	C4kDAFTpgRqZkfCEdf1l1XfALVaQIyEUcOobLeVxMWSQ0cGgcQOZ7aIOqdkI2A+q
	lvwTAkMCIIM+I7hyZ7WdFOPrmak3n7fy/lMr3MMvr+VhY6PhTcME43jZa/Etcx7s
	0ZeselOGYrXLkxY5VJInuw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4caj4avjdu-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 22:44:44 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 61HKNQsf009957;
	Tue, 17 Feb 2026 22:44:43 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013009.outbound.protection.outlook.com [40.93.201.9])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4ccb29bbby-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 17 Feb 2026 22:44:43 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=JIJJF22NrgzzlTCCuZk6q5wsjhZWVFeoRl4Q+dG0yd0x5e+zIYN04boCzH7LjuxAhFpYoon5GGSyV3qIkFxnmcLUYWsBH9Pc8Ay3LtOLHJZkDqhcGu+7IdAiDGywyTo8oCCq5EJrcUmPehvTXsWj3rZjoQpsvmRwKFC9s42n0ry033mjJ/Z8uxByP6vieTdGw5hPQDddIU+BsGVTrfq/YNHUrwzIAlc5XT0AK7V2rnnx051F6aeukly/Q8ZFNDkFT4aHOjfDn7JycyoXouOp/sdzjcxmKmGZDj+id9/Jt2PJKTos/QnQ6pgA3xFa2r7C2DRRIkGSpWiY/FNY8Bkofw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=3/lsg16cfosq25Up6cNGxSmyLxtbOlobPorwWL83tr8=;
 b=Ca1k3o3Culo7WicMtctnOVDrHZkQgPGqlLZ5ClrH5vKArk/oFNl7u5NJZvgpOP2cvdZYK8FIPnwpA6MzUQSFYyjm5cPDj2HvGgSm2vsjsJkBySIPYMuur765Rb0QkIBHZRGcM8Ts3me7tuqy0ZxS/FVuwCJ0LYeF8Z+SbExPNq4EXketm6CyoFKqR5z4yDmjngtxmM3br3xGcvzWRcEuBQ6bsHjJdd3IOWhLXIvH7VcnH5MRrN810FhHwiUYN4Fc44SP55/fScHajASShN4QQQvtjOgDXOEojBHs5MyU9UmoAQr4yKRBfsRVLHRlGp0m4x0iMmSXvEfx5bMH9WbTNQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=3/lsg16cfosq25Up6cNGxSmyLxtbOlobPorwWL83tr8=;
 b=aXjH8Wn3ryKrOviV9rP1o5irCY1+vG02iYgpPIAOl250InWFcENKPfHKJCUkIsD9ZYyj7HKZIOK2bW87qofjHq3n5Wq7liYSIfZitmCxrv8NFEQJU55YQu1xAwiz/mTIhPCbNnzkRJMM9BisKDS1ibeiobsRlClTfHiLF7F8jGc=
Received: from LV3PR10MB7868.namprd10.prod.outlook.com (2603:10b6:408:1b4::9)
 by PH3PPF0C5C46881.namprd10.prod.outlook.com (2603:10b6:518:1::789) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9632.13; Tue, 17 Feb
 2026 22:44:40 +0000
Received: from LV3PR10MB7868.namprd10.prod.outlook.com
 ([fe80::9105:4421:4267:8fce]) by LV3PR10MB7868.namprd10.prod.outlook.com
 ([fe80::9105:4421:4267:8fce%5]) with mapi id 15.20.9611.013; Tue, 17 Feb 2026
 22:44:40 +0000
Message-ID: <cb3b1ffb-7b30-4afd-af20-374b660511b1@oracle.com>
Date: Tue, 17 Feb 2026 14:44:37 -0800
User-Agent: Mozilla Thunderbird
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday,
 February 18th
To: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
References: <aZTtPsRAMVd_6umd@telecaster>
Content-Language: en-US
From: Stephen Brennan <stephen.s.brennan@oracle.com>
In-Reply-To: <aZTtPsRAMVd_6umd@telecaster>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0093.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:32d::16) To LV3PR10MB7868.namprd10.prod.outlook.com
 (2603:10b6:408:1b4::9)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: LV3PR10MB7868:EE_|PH3PPF0C5C46881:EE_
X-MS-Office365-Filtering-Correlation-Id: 4fd74374-e90d-46e9-746b-08de6e7622c6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?dlhuSmlHRG5iRTlvYlNhT1lyVVZNSERxVGNsL2N3QUtvaVBmWFQ0WnpXSFdX?=
 =?utf-8?B?TmlNa0xyZTRKYXRZb2JhWGE5S2QrN2E1bHJ3MDFtUkczSU9jQVpLajhsOS9O?=
 =?utf-8?B?L0dOQk1ROERMTFMrc3drRE9TcjFoMEM1czA1NjNjMDRvNmhWa0N0Z3hTZTA3?=
 =?utf-8?B?UDJVYjM4cXhJMGY2ZGRydkZwR1ViL3F3bjFKUkxOSWZlbVQ2MzRlSDBocDVG?=
 =?utf-8?B?YmlMcjFiLzhCaTNlYjgzNmE0Q25tNXROVS9SRGNIcERLL2daVGdsUzR3MmNq?=
 =?utf-8?B?dzZuVUJrU3AvY0FFb3J5QlVRMTdSclRFVFd6dWFxcnFCYmZHZ2JSRWVHT3o3?=
 =?utf-8?B?OHZXLzFDRkU2bHE2MkpGUE4xQmZkQlFGRmFHbk84YTcrd2tkYi91NjJOMjhV?=
 =?utf-8?B?RXRhK0RIcXptOTVmaVgyMkJIeUNaUEROaUpUbWdzbVJENU0vbU0xMDlvRFJH?=
 =?utf-8?B?M3pXbk1xNFZGZThUYnpmVVp1TWdUUnJXZm9tWUZ0QlpCc1Y4RUIyWXFzalQ1?=
 =?utf-8?B?UVhPVGEzUHNjVW1UUnpkSS9ENTV3WTFJeFdzRm82VGE3ZjNsaC9EQW1udGVF?=
 =?utf-8?B?aXNVdjFscGdvWGwrT3JCSGhKbVFCRTlyZkZodUN5eElPbGp6ZHpkS1N0RHpq?=
 =?utf-8?B?SUNpS1Z1TUhnRWJhZ0JTcUhXZ09tbjN2VE45STQvaHRIU0FCNUdLdFloSyt5?=
 =?utf-8?B?enZnWmdCQ0xTZTdDMVhOMktwT0MxTVpUVVB0S1ptY2pvTjVqNkhVMlBCK3dW?=
 =?utf-8?B?ZDdUblY2WUtyZWJBODRyc3pPS0xSdG1KTmFwSWdFMzBvdkNtRGxHUFhjNGRz?=
 =?utf-8?B?VzF6YWRTMU03YUJzMTVpVmZINXZpRi9TRVJ1Vlg3TXFIdEhLeGhVVkkwYmlE?=
 =?utf-8?B?MCt5M1FFWWYwVmF1Qy9STDNlZ0dGZmpNaTVOQnJXQk1uWStYOU5UM1Jsb2FC?=
 =?utf-8?B?Qnh5ZWJrRFdQZ0wvaitYeDgxa1BpTDRReHFOd2ErS2ZHK094d3c1Vnd6K0Uy?=
 =?utf-8?B?eHNyMlhmdEdFTCtxdVVqYkFaSlV2Y2JWRTJXQ1FnYWdMTWozWVE5OFVwd2VH?=
 =?utf-8?B?eHFLbnZydHNLbEhjYXhnK3RxR1phd3I1clFsUWFoYzd4ZTZqUFV2aVM4SXBV?=
 =?utf-8?B?WWlxeHVITVI0RkdOTGV3OUluL3lzRHlDaUI3ajRqWGY2ZEtmZHloVnlZNTVK?=
 =?utf-8?B?K2RuVWpaL0N0SGhsTW1zUHhCRFYwOTNZMFdhTHFEMUUwU0lHeE5NdEZMYStF?=
 =?utf-8?B?U2VQckxYRzVDWkdMODJldlNvbnp1OEZzU3NIckNRUDY3WFcvODN0Mm5rY0tz?=
 =?utf-8?B?L2RQTGpwem5zeEZJeWx0UEZ4a3JYaFNlQlB6WUFseTcvTEVrcUtLM0k1bk1I?=
 =?utf-8?B?UFRTdmNjd0NQczMxdVFWRlorSmYzamhsdmZka1gyZktoVms2VFdzbjhMU1NU?=
 =?utf-8?B?bGt6dnVyWHFIWUo4eDJwWjBrSnlHQmtHdEFZaTdnVDdxRzJobHVURDIxQi9l?=
 =?utf-8?B?bnFTSjh5Qi9UM20wSEdVamw2VFdOMzNqTWlZZ1QraHU0TWlRUm95OEVydGtG?=
 =?utf-8?B?ODh0NDJ5ODI3UlQ2WVgwMlp4QVllSC8wL2RkeUZ4S2JrNFZZNm43SmtDTjB3?=
 =?utf-8?B?Y3ZkQ2VqU0swd0Z3U2lhcVNEVEpNbHFva1RHL0ZhSEZzK3FqNjhmMUdQVkF5?=
 =?utf-8?B?bW9LdE9wTkNWaWVjZ053OEQrYmk3RlI1VnBwQzBYSjZHQmZTNEZpMGEraFlW?=
 =?utf-8?B?b2UxVktWOUFqTi9uNXVVMVlzSnljLzJ6Y3FNVGcreE43Y2FsS3NPdnZpRG0x?=
 =?utf-8?B?bXFHMDZobHd0cUJGbjdtMWlQbXp3MG83L0F6NjAxSlFFelAvTEpINFlQbnpz?=
 =?utf-8?B?bDdHOFZmWGlCV0xIeThWRnlERFZQTmN0NzRLcVhXTkZVdnlDdGg5TGJITjg1?=
 =?utf-8?B?Zy85ckhQRExRd1BaMFJ2akZaZy95L0JxeHY2OHR6NGkzcXZmRXRPVFJ4TlV6?=
 =?utf-8?B?UWhUbXhybVdLUGtrZEhRUEpIWE5YVm1zM2xqakYwUlJwUXFsUGJvQ01TT0Vo?=
 =?utf-8?B?VnRDd29iK3MveHRUVHZpSXY2K29TUFB6dk15UkhBNXFUSnlNaTRKNzY1bTh0?=
 =?utf-8?Q?p0r4=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:LV3PR10MB7868.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?cGU5Kyt5bUZxeGgzMjBKVk9Tc2F5T25neCtiYjIyWWNhVitxYlhCNTdnQ0JP?=
 =?utf-8?B?RHdERVFKWGhkVXdjUzVvdlRYNGdzUEIrQUtqQjlXMUNVNUVWRmZIeEFOQTA1?=
 =?utf-8?B?NTdsNGM3ME5qRXlCUnJuTWpqdUM2REErZlFkclV6Z2ZLaFBMNTh0cEJpcHU0?=
 =?utf-8?B?UGEvSzJPaGN2RFZVbExFajJMTnRycmgwSXF3ejZqZXREMjVIU1pNR1dWUkNt?=
 =?utf-8?B?Mkw2UFZNNXRxdkZLSzFJT1F6M0o2YVNoUzVYTmx4UFZCTVRoeVVDMXBKdFVi?=
 =?utf-8?B?OFRLRzBBblRibVNZRWRsQ2RuZS9URFJxYzlaOEdjM3NRU3BKdUM1V3lZWVpv?=
 =?utf-8?B?K2o3ZitsUDBKN2lNdmEyenZaNG0yaDF1UTN5eEJ1U0VLVllyRkw0VEV0SjVO?=
 =?utf-8?B?bVdnRkV3WVVqNUhVbHdnN1BJM2NmSFE1RldLMWVBbEVhQzN5RzRTRUhZNXB5?=
 =?utf-8?B?b3pXbkJqZ0szQnNxR3NHVWVZT21Ma3pKTGtpUjM3NjAxYTUyUmFaaERhTmhQ?=
 =?utf-8?B?ZUhnUUl4QUxrSHVqSndPcGdBdmtCaHN5Njg1WkdsVkhzWW9KbU00Y2RKTnV1?=
 =?utf-8?B?Sy9Zait6RENGakZZQXU1b05TbEJQYzJBZ1VlREZtY0RHSkN3MHRqMWVjTmlK?=
 =?utf-8?B?UkQ3V3BDNm5DRTRsSUdZYmFzZVoycWM1RmhOZ3ozQmJJL3JVVCtpWlF5c3Nh?=
 =?utf-8?B?c3lmUkpIREFjQWpaeS95NEsvdHlJLzMrTUxyZEh6OUtIaWlrSHV0R0lmbnBF?=
 =?utf-8?B?M2MvUVlSZDdvT1ArNmJkZGV3M1l3c3d4VzcrVVFEYmNJSlM5aVJTOG5wRkN0?=
 =?utf-8?B?dGd4Q0I4S2pVL3h2TDhhWnFrUGVDTENQWVRrRllCM1hVQmRRNE5FTWE3aHVq?=
 =?utf-8?B?MVJyQWhFUDdaTkJTa3J3MHdWU2FNNFJ0bC9rVHhIT09rOWZib2ZLekhBcjhi?=
 =?utf-8?B?WEl4QjNQeHNYTUJobXhpNnE1VHpSeGVKL25ZM2o0T3ZHckt5V0ljVS9Dc2J0?=
 =?utf-8?B?Wk5ua0pxMlQxdUdzNUl4WmZwNFYrSVVUTWorajlzdllwRm5rUUxiSlBUa1NT?=
 =?utf-8?B?eXpVeC9kUFNuUmRuT0ZPZ0R5OUYzV0JMWUVpUE0zR2oyQU8ra095eEkyelVh?=
 =?utf-8?B?R0VQVnh0UEtsbVpVblZ3ZlZkNURIajZuaTRMNGlvTjJRelRTM3JiUnozWmE5?=
 =?utf-8?B?TldGZzVBQkNMUGJZNzFxL09uaUx1eXI0SFlwc3N0VWNyaysyTTdpWG0wR2ta?=
 =?utf-8?B?aXI3Q1drTUdMbCtSSEUzdUZRK2xIMUl3anloaWZEaE80dDdqZlBYZEZTWHFV?=
 =?utf-8?B?L1NXTEkxQXp5aWNDQ1R0YUtMNkN4dnY1VzZFS214dkEySUJpK2lJeXVEaDMw?=
 =?utf-8?B?WlNBZW5QSjdjdmx5eUgxK3VJY0UwM2dJdGxma3VHMllPNDgvWkpEWlF5a1V4?=
 =?utf-8?B?YTc0elNCMmw0VC9BaG5OaDdCZ1Jab00zWXNkWlBoYkFzcHRjaU5rdjRWcFRa?=
 =?utf-8?B?U3loTTY2cE93Rnh2akF5UExNbzdUNERhR1ZoQWNXRmxtNndBS2graUh0NXkr?=
 =?utf-8?B?Qy90blJURktTYkdUQWpZN0hnNEZwY1J1RGh0RUFhelUyTmkwMG1Fc1J1bFlu?=
 =?utf-8?B?UEhIRWlBWlc1MnJlY3d6WTduRlU3TkVwbmVGSjNEQVduYnJNOTVEL2lqMlNE?=
 =?utf-8?B?SThqMTBFdXdpenZPWU00OERLd0hoOEJPbzd0WEhQZWRWYXZEdUVVSFFBV1lP?=
 =?utf-8?B?M0JoMngxd0o5SWxibjZ3eE5abzdNZTVadEhmM2s3djg2ZGk3ZU1HVUVqOUtG?=
 =?utf-8?B?YUttUCtmb2pVSzM0NW9BVVh3Smgrdm5sRnhpWDM5c21rVjRoN3d6Sk9uUEdH?=
 =?utf-8?B?YXUwbHhLWTZ1SVV2VTNQVkN1VUhjNm82SG9qdWc2RFlwQytjSGQvMTJjWjNC?=
 =?utf-8?B?VDBQL3Q5azViNTdpOWhsNHJFcnZaNkxwamIyWEJPb2NRZTFxQXZJaEJOZkxu?=
 =?utf-8?B?V1ZBMnM0c3Bxc2FjTk1YUWhkT0FRODZOdVY1MmRmTFYwM2lHVGxiMXpOMXFq?=
 =?utf-8?B?M1E4MWJickVHQ0dtelRMSTVGaUpOd3JLSGFCc0lVK0FJYXhGVEtNZjAwaHBn?=
 =?utf-8?B?TDVienZtbGxVYitLVHlKbVJqOU1XU0xmZFA4cnoxbndOK1Z6ajIrbVJSUVZm?=
 =?utf-8?B?NkxraWNCT3g0Mmd0bEFJNndLWWdFRkZnbWREZEoxOEVmWVNiMXlCVlhpTDN6?=
 =?utf-8?B?UkJ3NHUrN0NCcDhkK3kvYmRJRjhMSTkyVEF2SDA4eEh0UTJDRmhpRjhTTHlI?=
 =?utf-8?B?RU5PMEVQbUpFTGRITGxjWmVqQjkza1RUM3lvSm5XRTNXOGNpV1p6ZTBEMmxw?=
 =?utf-8?Q?kKK06z5zb+a9q62Q=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	YbuG3yin68GYxZJTu3v7bZXdYvwnvpbav68ls5ptqz5SFzBltOoCoTGc3wYpAQmWm3nK20QTQFbvc/r20a54U3pr+NhOJXp//TBRGrQAKnmQZUAkVvRSLGsYUwZpcZcjDbQdyGnTsrd9RKEyRpMcJtMy4pmnoyBPRLvM11xRVUIL2dX/TjEA3nj7hJ+PaIRLumB66JsyidLHnGFtAE9IpezpmM3UiAg+OoNB9RxRDMciak0DUNSY8dCia9sQFgNfKJK9izssgyD4vzflF9/TwgyDGB0N7AItFqyXWNc6fCxRBcikZw99XUoE3/RMVnqQaR6tnX0iwHDVSRYc2CcSq9GUE6NbyxKk1USnoa77vnU1UiKT20TjIEF9kzkPXKfysg5vuIrZsu8sUwr7SYg5wRN9b3unQFVwiEjLmFoutJnBHdiSKCf9TxcBwfD/5V6L2qbXQqxKfA+Aq2BxaheHz76ntMh7olos5xvfTsF196wpEAsD0hy4OyVcvEnEPKKqqP2ENa2o4BDeFdGgvhjwc2EVgleXElvPBi2M6ylEjYAacQ6Gave1Sdi0dDx0QCsiyfsabIrnd8FJkCuXGazgplIF3zIEkOXW0cNqsokznVE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4fd74374-e90d-46e9-746b-08de6e7622c6
X-MS-Exchange-CrossTenant-AuthSource: LV3PR10MB7868.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 17 Feb 2026 22:44:40.3550
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: tx1YKUNug8mzoGph4NP70sRXIjED2GSFCNn1s8Va1fFhwRaAfZybVWP0fwlUkEPioNF9+UuXIc+UTwmaVmrQDoBN2mcwG2umlprhoZ7p4sc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH3PPF0C5C46881
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-17_03,2026-02-16_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 mlxscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2602130000
 definitions=main-2602170188
X-Proofpoint-ORIG-GUID: DkEqZj-zARqILCJm3tOn7Gy_oXdgxo4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjE3MDE4OCBTYWx0ZWRfX7/Mnbq9Rf6CX
 KoNjqKW5Ov4R1+ON7PTJtg0l6FUhMVU4R60VB+hkq26X4aEXpMvpBpuTqiP/WvDgCxmPOspkYzK
 qNUt48l1Ojcwslo057Nrm4xLabE27e4EXbFIkyCe9sqiDQxSBF9BVFtgo60KCT7SqB/K5XfKa1T
 uH1kHOLEb60kh6NfIXSIol/4r5CSWeRFUPd6lBeuSwaJrbGpvl2go6vxCnRWQLeHIZn6kWItcGN
 TnFsY1p9YKlvgK/INICrN5WvUYj4+32oSLhwItUWBjrY3L/u5p1gxePETpNYNouvd67S6op78Py
 ZR+uqrCtj9IjYBdfH6pw4uM/OO/KQqLPCCz4taQWGmsd+KqG2i/Ma7kwq43Lc0u4AhnS8hdzvBy
 C+8JsaNOAV3Ufd9yaDrSnpm5AG//PzPuFO0WwrA4EzCA9ts9zz5mrvkmzAjQUX94TqPyod0l9G1
 zrg4CeoOIjcX+Gx2Ni4B2fzy33/FF+XJAXUVtK2I=
X-Authority-Analysis: v=2.4 cv=SI9PlevH c=1 sm=1 tr=0 ts=6994ef5c b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=HzLeVaNsDn8A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22 a=vw0u-r04pzU9ur_kwK4A:9
 a=QEXdDO2ut3YA:10 cc=ntf awl=host:13801
X-Proofpoint-GUID: DkEqZj-zARqILCJm3tOn7Gy_oXdgxo4e

If content is light, I'd be happy to share progress on the BTF
implementation, which is working quite nicely. Upstream kernels are
still missing type entries for global variables, but that's actually
pretty easily sidestepped for a lot of cases, so it can be practically
useful even with that limitation. It could be interesting to discuss
ideas about how to properly test it in vmtest.

If we can get something useful with BTF merged even with the current
state of kernel BTF, that would be a major factor to share upstream with
the BPF community to motivate adding global variable support in one way
or another.

Stephen

On 2/17/26 2:35 PM, Omar Sandoval wrote:
> The next Linux Kernel Debugging Tools meeting is this Wednesday,
> February 18th at 11:30 AM Pacific time. This meeting is a forum to
> discuss development of Linux kernel debugging tools like drgn, crash,
> and more.
> 
> Here is the agenda so far:
> 
> - drgn release this week.
> 
> Reminder: I will be out of the office from February 23-March 27.
> 
> Please reply with anything else you'd like to add. As always, if you
> would like to attend, please email me offlist.
> 
> Thanks!
> Omar
> 

