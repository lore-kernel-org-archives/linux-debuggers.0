Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4EF9161320
	for <linux-debuggers@vger.kernel.org>; Thu,  3 Apr 2025 22:43:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743720194; cv=fail; b=A2XgU+8wVGJq3l8CseesdxrAaW/dSoDrK+TkXGFbKX1eHOgPqh4LQ1ZcPIvNrQnTYN5I1ZEv1IdnQCOgBw20SBS577AjveUgfr20xCb37s4oD8WC31PJdNBPkNFxWArmiB5J+c2E4n5D6xPzl+jIIeuogA0ATpYUbj0pMaBRJwY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743720194; c=relaxed/simple;
	bh=NrsRvcqjkYlcm8M0bt+beFtDXUWTC9c4kLZRkyhfvLM=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=aKS6AXovELoSDBjPX/NwbvPD/aiSbQSx/tBCPv4k0lBVIGC2xEtdh/IET2bp875U8zV9Rbzn7f3aIc07pS3Oufdj2P6jpOJONv8ckFDDGxeBzbUNidPi5xf0Sy9iKyM7XlFofTuUqwjvZTDVFMBM7sY4lmSPEp+wQQPaJjLmRUw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=EEUVxp7K; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=puE4RYt+; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EEUVxp7K";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="puE4RYt+"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 533GJR9c020899;
	Thu, 3 Apr 2025 22:43:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=TYBECn9avEH2Qg6plt
	WotRaH9oMAOyJwt3O6zs52RlM=; b=EEUVxp7Kr+Q20sG9ihC6GPkMEthyAYBxoS
	HvjcKPeR3wYzpYxF18Ybjc22Zc7GKwstoBybDDuEPiIcPH7T4dtZYyV0MRNr8zOj
	rOT96TaTbOEjPi9Dmlnwn0YHinFrdYqYpTAYnSi8QT4EE3Ka7MVbcCGHOYTFSLD6
	Pl1FQeuCjQRBwszhAo4iBBlYvLSOzIyK2uao++hclg1/J1XEXPCa3VfjJQ4dkrQu
	U0zW1+Wp0aadOozK43hXSiw7IFLia0LXPpLIrxDPbn7mkjLwj4/hBsN1WdaL71TQ
	bgmH9WZgZaSLJbPpL5keqp6qLk/WrGf1XOHQQ67PX7Daf4RpdPPg==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p8wcpfqe-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 22:43:08 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 533MJt0C013669;
	Thu, 3 Apr 2025 22:43:07 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 45t31eghk8-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 03 Apr 2025 22:43:07 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=a295FbjGGfDmebOVG/zSksVSuzx7sz9f65O36StRjD6N/p9HzAaB0G+Xa3pJ7/zHkjSh3F6oPOiI5j3AA1wrb/GT9G6b0wtjSZBPAgKmqUREwgkxhU6DPTAlbq/LcG0t2GGT60B9rsRX/zUFWeB5oA8qDw7jJucSt06LpNSzgWGIrWeP/qvB5L8thDt2xNeJ+Qr0kab9aeq+eG6VSFpxmBt3jaO7PdVDW4dKDUOzK8N/pG8CNqKsVGBMSLgmThCQo6ybeUscMGg4dd8nAvLOqJA7yn8BIWkc38ot6eSNNFC0psOr9/CCtcOSYOOgfHJF75Q+iaj9rjwmVz/EDcI2QA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=TYBECn9avEH2Qg6pltWotRaH9oMAOyJwt3O6zs52RlM=;
 b=O16S2QXmT6bAG4to/mwcxhygtG2sON8twdeTK0oa0ggRccsLNQSUvPt+nAStfRG78Kcr+wbjPHZ3dBQx8YJSBGp92kb6WEIFiA2jWAG7IuTScKszv7re9ej/edDho+IVmfkpb+d52g5DK80DAjgJL9HRIoOsKxpSChhoJf16QpMum7W0ZbIxLa9Dvte3m53W+g+ki5HBY/JA3UbOvdkBzNAJ0Pq4wgKMzJJ/6wwXH+I2THmIunPb9NFNIFgWEmyPUDwbQfaTzo1EniLRdkvFcS9uXnXQ6e6FFMsao7prm7wJ4d88TKnJh/8YydfOKyo7iN0gW2j1jg8s7+lt6R7JGg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=TYBECn9avEH2Qg6pltWotRaH9oMAOyJwt3O6zs52RlM=;
 b=puE4RYt+M4n4XxUkyS9BEvEkW12nGbS6faJsiMhHgYtiezajIfhOGgSkd2xY2uWx6HRsAmiSBaJuBC2TUZGAcvmPG7GDcjdCSD7D5V1foZfT4e8qgeoRf2/GRWYb+cxkDfXDVEQGg13xzLUE1YqCpwUStdBnsZXAAD0zTYjY2W4=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by PH7PR10MB6506.namprd10.prod.outlook.com (2603:10b6:510:201::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.39; Thu, 3 Apr
 2025 22:43:05 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%7]) with mapi id 15.20.8583.038; Thu, 3 Apr 2025
 22:43:04 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Tao Liu <ltao@redhat.com>
Cc: devel@lists.crash-utility.osci.io, linux-debuggers@vger.kernel.org
Subject: Re: [Crash-utility] [PATCH CRASH] Fix module section load address
 when sh_addr != 0
In-Reply-To: <877c42ywxw.fsf@oracle.com>
References: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
 <CAO7dBbVa=HMvZEsFTCYwULSgjbfac7SCZNEKgYePgPXb9kNvgA@mail.gmail.com>
 <877c42ywxw.fsf@oracle.com>
Date: Thu, 03 Apr 2025 15:43:03 -0700
Message-ID: <871pu8zx1k.fsf@oracle.com>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: SJ0PR05CA0187.namprd05.prod.outlook.com
 (2603:10b6:a03:330::12) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|PH7PR10MB6506:EE_
X-MS-Office365-Filtering-Correlation-Id: abbaf536-4e65-4162-7c6f-08dd7300e5a8
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|1800799024|376014|366016|7053199007|4013099003|4053099003;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?znwSKjIgfOHrvkH193beqwF4s1vSWRaHcTSUsm/DoAd6Xvv742kyEYUp8RmT?=
 =?us-ascii?Q?83s0oLa4C3aX2aeoRbPnZD4VqxxX56EWYucipWnDFcRj0U0xdPhQIUHhy3uW?=
 =?us-ascii?Q?dLSWVPdBcLsZ4906/TUa2Ra/7g9tsA+KwUWWCE41jZHDFz98IfBjAocNA8wq?=
 =?us-ascii?Q?gL0BsmzwNaU3LUO+StgBf2U5FZoWdv94XOxd1x7NZvfgSfBffKdHQHNzN1/e?=
 =?us-ascii?Q?HZMe/r/8b14S37gc79uCZ8SzpvD0GF7YwDPVtFIsnFk7G85FOWRpCzpew43r?=
 =?us-ascii?Q?sbeIWPgWKuzIUxcRIZPMshUbimzRzUP2fr450UBihJMG7XZe8VfX3M4hOmUl?=
 =?us-ascii?Q?Bnl1JSjcqAX7sSxQzRKcnUVNVYDJGkodQJyBh2dNDR4NH7seuCSh3ia70DtF?=
 =?us-ascii?Q?nyJNB/IWqsJfJ/1enOQykba05Yjk9Jv3WdDcmhNT3tku9zTfSwAI0B0kXmME?=
 =?us-ascii?Q?3bMcHxwLSvHAQEpdbBgNLzIsVc5ppKX99E2KFhZFXUVekjezbkmRgYFw6QZn?=
 =?us-ascii?Q?QZ6d0D2Ksj8Gm1Uvm3YFOFtVVAQ2nBPptcwFVqHll1CPtDYCeGFpi2Uaw8t+?=
 =?us-ascii?Q?ceOo32xngwvoGmV0lPyIf4//CoTowE/w/4QhyJD7dExOqLq+jmr4HiNgBsML?=
 =?us-ascii?Q?7vewNb/HXU2pKoGOpR7qj+4A5tNTPd24+QRK3/Qo9kcLM2InsluK83aPH8wu?=
 =?us-ascii?Q?lIbAm0oWpBhbPf8dBIJS9mPjLxEO0lsk+UQwbhSXBDwV9TOCoUUt+2LP3Yvt?=
 =?us-ascii?Q?2wMJH0s7/xVn3QnzSwHY0DwiBvmp2XnPZeQjbjywrkkADZTUaou+7OO+OuOL?=
 =?us-ascii?Q?ecds5EINYSCIPnwaTclZ1oucNICF3kc9hfgfhOlt3w/tLJB4BmIPqfAW+iTO?=
 =?us-ascii?Q?SJOyw5VBM7PxeImZViFOLmnRdAwAsgA6odDAdVB226Kexnay2k5fR2PehMjf?=
 =?us-ascii?Q?6aR7u3cxkX5dGawpj5HBc8nPpk5MENk2CfjtUfsU87jFOxul41sgQUoEBlc3?=
 =?us-ascii?Q?zcegZYd08zP4J7vnAMn6nDj/Eu7tcDI00lgTO8O/eMVNpCY26db5yOzodIp3?=
 =?us-ascii?Q?pVEjybltjEnJ4SzeoYCzKwoM4ftknqmxuj9+wDPNTM3iPUeNX0C9HbBfjWXt?=
 =?us-ascii?Q?VZuIhfIAk2R5jxDgzStUVir9E93NuU7kFxB9V9LLLrvSz8z358NNJk2McoyD?=
 =?us-ascii?Q?rYWr2qr65Z9DTSgMYfOjlRfMlU0AeNH+wc3cc0pKCp/YCGiqYovZXMqgDrMq?=
 =?us-ascii?Q?lv/oCXqsG5GQbfEW4MlKewulJrfxgK6wqzDjAtbxGlC/dFu2dqC0mK/ielD3?=
 =?us-ascii?Q?n6CvDWkot+4vhHlpATx/1ZcbvQ2c+0grt5MUtRL6ZcoQqA9ShSAL3Yw7ZxIZ?=
 =?us-ascii?Q?wrbnlWoU7Fxv6DYLPemegzM6h0qHczv5OxA4m4ED5+nEbsMKouG/ALKvyKm3?=
 =?us-ascii?Q?/FdGvM/5x9M=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016)(7053199007)(4013099003)(4053099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?Yd8CeJLabOzO8RhasCodgQD9Lkw/yXsLl9dSHy+PTTnf/KcTcV6wAsGXohrG?=
 =?us-ascii?Q?EPoJipTqCe02NnGusfcjnXw9V1cg4hYDkPQES8XTvAsrGbqtjHd68xI8NKpD?=
 =?us-ascii?Q?P9T6qXn7BDIeUPdpdGD0SXGX0NJs7Y9pUxAlyhkadOyv+3iGG2sW9sxLQu+y?=
 =?us-ascii?Q?bAC9IE8Sah4WDeAurxjG8ao7VgBX6OUPIF0O9K0tFsXh1RFBQOuiLbIhsrkE?=
 =?us-ascii?Q?cuxo7Q0DcLFG2MamzHhWDQzzqg1xBhbb3X0gE4Zlacfaweo3euZoUfUyd7UL?=
 =?us-ascii?Q?lKrCHTCFfOoBCdy2EZ024PaweCUfOWAUtRLclOxDpnuXN6mMJomZfdzs0keZ?=
 =?us-ascii?Q?yvQtt9dTMFGQEnSj5B5Z7koSppCjBTwtbTSel2A9KZzgLGVZZ3Hmbst+ccHS?=
 =?us-ascii?Q?N9163NjSgS8d2IEaY8uaLqGNhzNPYqhyV6erKgDpJKJtQBbXbLtI1jDQkVUU?=
 =?us-ascii?Q?h8f3kD1SkoxmAczCCLbTzx6BR+5ta1oYHdCDc7aibYETWdw4ZsZpMOtAO4+I?=
 =?us-ascii?Q?7sa4TTCIQPvbL9k/ZtWQUqC6DoZeUtP7z4hE0E9wCwl2pXLYHMTIzlFLrQLO?=
 =?us-ascii?Q?THl02JA7CpFxe+ZsPA28qdmURtNdJnAGzF6Yu6+BFSL8YvnYZXO8uEwpk5ZQ?=
 =?us-ascii?Q?pgmSZn0zjA2/OfFq/KVlVksPkAcwq0QxXCj1KikaZFn60mlEfwCVXYVCvdvU?=
 =?us-ascii?Q?gf0weVoJ3ZgNmIOEdG2SHrgnolHVSMdQoVqE/WEdxcptJHw4CHeO8qdXOWxE?=
 =?us-ascii?Q?1y4sxts5QOAGhslYeSMxHMjhyy+beBTA297Xv5D5RtBlk+sWYbB5Jz36Kynz?=
 =?us-ascii?Q?OXnaxeOs2zp1E8OA2PBF8wdGGMyrGsidml33/HiH+e1XwnQooLhbdFDf326L?=
 =?us-ascii?Q?H/2DHvNd6W5Y4RJeOeMDwAcVaEnrbpj2yKGstTHoTDiky+wQ3wj7e0v/C/5M?=
 =?us-ascii?Q?PHwh8ngdVn2NiUVksFnM9HPahwf7no/TS1hQdXqr/l+5ZOJjmJrl9FpNOmza?=
 =?us-ascii?Q?kfn74x17DfyQNe8RvFgndcXwq5nJXQlu5gBECR6IXymoOpREtYnyzDYx23wK?=
 =?us-ascii?Q?7nR14vrlzTTV5DQY2HK4CdZ+m2EoppREWx5hNNrrTXoCv0fGOKBJ6tcZgm/w?=
 =?us-ascii?Q?yVcCom8fmp+cdHuAgEk8sA9l6qM25bes2H7fp8mVDkzoeCtyCOmsZlJhKryL?=
 =?us-ascii?Q?JIpGaYeSnKZf6U+Y2sEuuWS1XMCbnIM1aqdB+REaXh2q80bM1AK6FpCMIzRX?=
 =?us-ascii?Q?yPxrZcd0+FRgZ4FMvKt5sSCYwTnb6qSRIaAVIyrxqqU/dHHebJDvuqNfTi8U?=
 =?us-ascii?Q?NdngfX2AcSutyuP2Mgp9YI9I4Jmkb8txJdvcfHeiUgwPNihNhcoo+kZYvdmI?=
 =?us-ascii?Q?qWjQ9jECk98HlLLL/nVS5UHWZncZCvig4eAt+hTATDlBLrYtB6SHGrWjTd6R?=
 =?us-ascii?Q?s8xU3oQiTSxeO1k6MwAYyFRVfb59sW0o5QkdlW5AlGuecEAjjpFw5H21aw38?=
 =?us-ascii?Q?x4qpnbysDp9GMSEWPzdVFgi6V9CNDQm9RQrBmL1Tn4iXkYNEtYv308P2ljy5?=
 =?us-ascii?Q?5DaLI1B+mr1nS+bNH3iBmOj2H7XmORJu8ZReVu+UeBUKMUgmW+J5nIHWl2xH?=
 =?us-ascii?Q?bw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	DgHNs6T6KiBVNMfZTLuNc63S5C0B6jY5Y/c+rkKYmkHtccfiTJD+ZZNgAzWg8Zhh+v3abyXANPfYqrECivDVbewcAV1S0BCX37tSOiKyJ2Y0N3REU6FyWDt4C4o2OMmgPrUSJ1zI06J0cWVRtRNe5KuKn4WEE76nIdkmErNx3CjZB+PVCYbPzkCSZYN+Tb3vCC24itORvTQDaliaEWLQoEG0BxtFuhI6ZZCcviQrO09xlDrCZfbIr2cshwbfPV1uoMDfDtfeBoJ5bX8hq85lYY6u46DvSyc0cMwfM785RHgVS8p/Wk9HBpIIKarvvbdrfDRDq/53iWU+nEj+jIH0NkpOX2Myhtq1xq4MIt9t/XKpaDtTsI0V8Xq05RYnvy/sR7XeBF9VjtOtbDhHy8C9IS3tyrLoA+j5opQniF6GhPk3riEhnajWCvam16BTDJSTHngIZyZ4fAtVx8YwH4wHtctjNLHPn0qOupusvOy2sBepF+MvQgXXzd0+9FYKJTmXcWqhx/1BRAyptKHHQGfHld3Ktp15YaQCsa9Fz1qKq6JTIUv2MgJAk32zh/u00zH1qm0U4ZqRNWNxKvuSDXgVT9RXdqwjPvDAlYREtETjrLs=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: abbaf536-4e65-4162-7c6f-08dd7300e5a8
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 03 Apr 2025 22:43:04.8915
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ue2OSqk0udivSSASCMeKAZDn2i9kYFkIacVDGow8tPoVgtouA/jFtJ5Us/GIe8SCwMbvHD9oHAMNBEHPMAUibWecu0fXX9ymh7Z2xmnthQU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6506
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-03_10,2025-04-03_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 bulkscore=0 phishscore=0
 mlxscore=0 mlxlogscore=999 suspectscore=0 spamscore=0 malwarescore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504030119
X-Proofpoint-GUID: _rPdHlhBiD-Mda_Ntvyc2nViQnF23Cd1
X-Proofpoint-ORIG-GUID: _rPdHlhBiD-Mda_Ntvyc2nViQnF23Cd1

--=-=-=
Content-Type: text/plain

Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> Tao Liu <ltao@redhat.com> writes:
>> Hi Stephen,
>>
>> Thanks for reporting the issue and patch. Please check if I understood
>> you correctly. The correct output you are expecting in your case is:
>>
>>     crash> sym ata_dummy_port_ops
>>     ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
>>     crash> mod -s libata
>>          MODULE       NAME                      TEXT_BASE         SIZE
>>  OBJECT FILE
>>     ffffffffc0a7b640  libata                 ffffffffc0a47000   520192
>>     /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/drivers/ata/libata.ko.debug
>>     crash> sym ata_dummy_port_ops
>>     ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
>>     crash> p/x &ata_dummy_port_ops
>>     $1 = 0xffffffffc0a6fe80 <<-------- should be 0xffffffffc0a71580,
>> same as sym's output, right?
>
> Yes, that's correct.
>
>> If that is the case, then after applied your patch, the issue still
>> exists on my machine:
>>
>> crash> sym fuse_miscdevice
>> ffffffffc05f7fe0 (?) fuse_miscdevice [fuse]
>> crash> mod -s fuse
>>      MODULE       NAME                             TEXT_BASE
>> SIZE  OBJECT FILE
>> ffffffffc05f8dc0  fuse                          ffffffffc05da000
>> 233472  /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs/fuse/fuse.ko.debug
>> crash> sym fuse_miscdevice
>> ffffffffc05f7fe0 (b) fuse_miscdevice [fuse]
>> crash> p/x &fuse_miscdevice
>> $1 = 0xffffffffc05daf20 << ------ unmatch with the previous value.
>
> Indeed, I checked with fuse on Fedora (6.11.4-301.fc41.x86_64, so almost
> the same version). And I see the same behavior with fuse_miscdevice.
>
> In your case and mine, the offset is 0x1d0c0, which could be a clue to
> how this mismatch happens.
>
>> The .data section of fuse.ko.debug have non-zero address:
>>
>> $ readelf -S /usr/lib/debug/lib/modules/6.11.5-300.fc41.x86_64/kernel/fs/fuse/fuse.ko.debug
>> Section Headers:
>>   [Nr] Name              Type             Address           Offset
>>        Size              EntSize          Flags  Link  Info  Align
>> ...
>> [50] .data             NOBITS           0000000000000e20  00000100
>>        000000000000080f  0000000000000000  WA       0     0     32
>>
>> Could you please re-check your patch for this, or is there something
>> I'm missing?
>
> From what I can tell, the important difference here may be that the
> symbol you selected is a static variable (which becomes a local ELF
> symbol). Apparently, my patch only resolves the issue for *global
> variables*, but not for local variables.
>
> $ eu-readelf -s /usr/lib/debug/lib/modules/$(uname -r)/kernel/fs/fuse/fuse.ko.debug | grep -P "fuse_(miscdevice|mutex)"
>    85: 0000000000000100     80 OBJECT  LOCAL  DEFAULT       50 fuse_miscdevice
>  1041: 00000000000005c0     32 OBJECT  GLOBAL DEFAULT       50 fuse_mutex
>
> Here is the behavior of crash's master branch on these two symbols:
>
> crash> sym fuse_miscdevice
> ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
> crash> sym fuse_mutex
> ffffffffc02fb4a0 (?) fuse_mutex [fuse]
> crash> mod -s fuse
>      MODULE       NAME                                  TEXT_BASE         SIZE  OBJECT FILE
> ffffffffc02fbdc0  fuse                               ffffffffc02dd000   233472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fuse/fuse.ko.debug
> crash> sym fuse_miscdevice
> ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
> crash> sym fuse_mutex
> ffffffffc02fb4a0 (B) fuse_mutex [fuse]
> crash> p/x &fuse_miscdevice
> $1 = 0xffffffffc02ddf20
> crash> p/x &fuse_mutex
> $2 = 0xffffffffc02fa680
>
> Both fuse_miscdevice, and fuse_mutex are mismatched (with different
> offsets). And now, here's the behavior of crash with my patch:
>
> crash> sym fuse_miscdevice
> ffffffffc02fafe0 (?) fuse_miscdevice [fuse]
> crash> sym fuse_mutex
> ffffffffc02fb4a0 (?) fuse_mutex [fuse]
> crash> mod -s fuse
>      MODULE       NAME                                  TEXT_BASE         SIZE  OBJECT FILE
> ffffffffc02fbdc0  fuse                               ffffffffc02dd000   233472  /usr/lib/debug/lib/modules/6.11.4-301.fc41.x86_64/kernel/fs/fuse/fuse.ko.debug
> crash> sym fuse_miscdevice
> ffffffffc02fafe0 (b) fuse_miscdevice [fuse]
> crash> sym fuse_mutex
> ffffffffc02fb4a0 (B) fuse_mutex [fuse]
> crash> p/x &fuse_miscdevice
> $1 = 0xffffffffc02ddf20
> crash> p/x &fuse_mutex
> $2 = 0xffffffffc02fb4a0
>
> Here the global fuse_mutex is correct, but the static/local
> fuse_miscdevice is still incorrect. This indicates that there's more yet
> to fix. (But at least my patch does part of the work!)
>
> I'm wondering whether this has anything to do with ELF relocations.

Hello Tao,

I've continued debugging and verified that the root cause for this was
GDB performing relocations to the DWARF info incorrectly. At the bottom
of this email I've attached my patch, which you can apply to the master
branch to test out my proposed fix. The patch file also contains a
longer explanation of what I believe the issue is.

However, since it updates the gdb-16.2.patch file, it's quite difficult
to understand. Thus, I'll also provide a diff here of the relevant GDB
source file.

I'm not certain how the GDB patches are normally updated & reviewed. I
also recognize that this change is a bit messy, so I'd appreciate your
feedback as well.

Thank you,
Stephen

--- tmp/gdb-16.2/gdb/symfile.c	2025-04-03 15:38:26.093760270 -0700
+++ gdb-16.2/gdb/symfile.c	2025-04-03 15:07:43.239691104 -0700
@@ -341,8 +341,13 @@ place_section (bfd *abfd, asection *sect
     return;
 
   /* If the user specified an offset, honor it.  */
-  if (offsets[gdb_bfd_section_index (abfd, sect)] != 0)
+  if (offsets[gdb_bfd_section_index (abfd, sect)] != 0) {
+    /* addr_info_make_relative() subtracts out the section VMA. But if the user
+     * specified an offset, they have already taken this into account. Add it
+     * back in */
+    offsets[gdb_bfd_section_index (abfd, sect)] += bfd_section_vma(sect);
     return;
+  }
 
   /* Otherwise, let's try to find a place for the section.  */
   start_addr = (lowest + align - 1) & -align;
@@ -628,35 +633,8 @@ default_symfile_offsets (struct objfile
   if ((bfd_get_file_flags (objfile->obfd.get ()) & (EXEC_P | DYNAMIC)) == 0)
     {
       bfd *abfd = objfile->obfd.get ();
-      asection *cur_sec;
+      asection *cur_sec = NULL;
 
-      for (cur_sec = abfd->sections; cur_sec != NULL; cur_sec = cur_sec->next)
-	/* We do not expect this to happen; just skip this step if the
-	   relocatable file has a section with an assigned VMA.  */
-        if (bfd_section_vma (cur_sec) != 0
-           /*
-            *  Kernel modules may have some non-zero VMAs, i.e., like the
-            *  __ksymtab and __ksymtab_gpl sections in this example:
-            *
-            *    Section Headers:
-            *      [Nr] Name              Type             Address           Offset
-            *           Size              EntSize          Flags  Link  Info  Align
-            *      ...
-            *      [ 8] __ksymtab         PROGBITS         0000000000000060  0000ad90
-            *           0000000000000010  0000000000000000   A       0     0     16
-            *      [ 9] .rela__ksymtab    RELA             0000000000000000  0000ada0
-            *           0000000000000030  0000000000000018          43     8     8
-            *      [10] __ksymtab_gpl     PROGBITS         0000000000000070  0000add0
-            *           00000000000001a0  0000000000000000   A       0     0     16
-            *      ...
-            *
-            *  but they should be treated as if they are NULL.
-            */
-            && strncmp (bfd_section_name (cur_sec), "__k", 3) != 0)
-	  break;
-
-      if (cur_sec == NULL)
-	{
 	  section_offsets &offsets = objfile->section_offsets;
 
 	  /* Pick non-overlapping offsets for sections the user did not
@@ -704,7 +682,6 @@ default_symfile_offsets (struct objfile
 					offsets[cur_sec->index]);
 	      offsets[cur_sec->index] = 0;
 	    }
-	}
     }
 
   /* Remember the bfd indexes for the .text, .data, .bss and



--=-=-=
Content-Type: text/x-patch
Content-Disposition: inline;
 filename=0001-Fix-bad-relocations-when-module-sh_addr-is-nonzero.patch
Content-Description: Full commit

From 729b89edabc1c67c0b6272c22a7ab9e4f4c4f957 Mon Sep 17 00:00:00 2001
From: Stephen Brennan <stephen.s.brennan@oracle.com>
Date: Thu, 3 Apr 2025 15:17:42 -0700
Subject: [PATCH] Fix bad relocations when module sh_addr is nonzero

In the previous commit, we fixed crash's logic which determines the
module load addresses in the presence of sections with nonzero sh_addr.
This allowed GDB to correctly locate public variables (i.e. GLOBAL
symbols) via the ELF symbol table (msymbols). However, LOCAL symbols
still had incorrect addresses.

The root cause for those issues is not in crash. Instead, GDB does not
expect sections with nonzero sh_addr, and so it slipped up in multiple
places:

1. In default_symfile_offsets(), GDB detects the nonzero sh_addr field
   and fails to apply the user-supplied section offsets. The result is
   that later, in symfile_relocate_debug_section(), relocations are
   applied to the DWARF info using the wrong section addresses, which
   results in invalid addresses for variables. Clearly, this has
   happened before, because crash has special-cased the "__ksymtab*"
   section names to avoid this condition. To resolve this, we simply
   drop the check for nonzero sh_addr altogether: the only ET_REL files
   we encounter should be kernel modules, so there's no real reason to
   be picky.

2. Even with that fixed, the user-supplied section addresses are
   clobbered by the addr_info_make_relative(), which subtracts out
   section offsets during its operation. To resolve this, undo the
   operation for ET_REL files where a section address was provided by
   the user (i.e. crash).

With these two fixes, both local and global variables from a module
section with nonzero sh_addr are correctly reported. Behavior is
unchanged for modules with a zero sh_addr.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 gdb-16.2.patch | 87 +++++++++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 37 deletions(-)

diff --git a/gdb-16.2.patch b/gdb-16.2.patch
index ee9bd2b..a6edba2 100644
--- a/gdb-16.2.patch
+++ b/gdb-16.2.patch
@@ -623,37 +623,50 @@
  	    gdb_printf (_("Backtrace stopped: %s\n"),
  			frame_stop_reason_string (trailing));
  	}
---- gdb-16.2/gdb/symfile.c.orig
-+++ gdb-16.2/gdb/symfile.c
-@@ -633,7 +633,26 @@ default_symfile_offsets (struct objfile *objfile,
-       for (cur_sec = abfd->sections; cur_sec != NULL; cur_sec = cur_sec->next)
- 	/* We do not expect this to happen; just skip this step if the
- 	   relocatable file has a section with an assigned VMA.  */
+--- gdb-16.2/gdb/symfile.c.orig	2025-04-03 14:56:36.640330084 -0700
++++ gdb-16.2/gdb/symfile.c	2025-04-03 15:07:43.239691104 -0700
+@@ -341,8 +341,13 @@ place_section (bfd *abfd, asection *sect
+     return;
+ 
+   /* If the user specified an offset, honor it.  */
+-  if (offsets[gdb_bfd_section_index (abfd, sect)] != 0)
++  if (offsets[gdb_bfd_section_index (abfd, sect)] != 0) {
++    /* addr_info_make_relative() subtracts out the section VMA. But if the user
++     * specified an offset, they have already taken this into account. Add it
++     * back in */
++    offsets[gdb_bfd_section_index (abfd, sect)] += bfd_section_vma(sect);
+     return;
++  }
+ 
+   /* Otherwise, let's try to find a place for the section.  */
+   start_addr = (lowest + align - 1) & -align;
+@@ -628,16 +633,8 @@ default_symfile_offsets (struct objfile
+   if ((bfd_get_file_flags (objfile->obfd.get ()) & (EXEC_P | DYNAMIC)) == 0)
+     {
+       bfd *abfd = objfile->obfd.get ();
+-      asection *cur_sec;
+-
+-      for (cur_sec = abfd->sections; cur_sec != NULL; cur_sec = cur_sec->next)
+-	/* We do not expect this to happen; just skip this step if the
+-	   relocatable file has a section with an assigned VMA.  */
 -	if (bfd_section_vma (cur_sec) != 0)
-+        if (bfd_section_vma (cur_sec) != 0
-+           /*
-+            *  Kernel modules may have some non-zero VMAs, i.e., like the
-+            *  __ksymtab and __ksymtab_gpl sections in this example:
-+            *
-+            *    Section Headers:
-+            *      [Nr] Name              Type             Address           Offset
-+            *           Size              EntSize          Flags  Link  Info  Align
-+            *      ...
-+            *      [ 8] __ksymtab         PROGBITS         0000000000000060  0000ad90
-+            *           0000000000000010  0000000000000000   A       0     0     16
-+            *      [ 9] .rela__ksymtab    RELA             0000000000000000  0000ada0
-+            *           0000000000000030  0000000000000018          43     8     8
-+            *      [10] __ksymtab_gpl     PROGBITS         0000000000000070  0000add0
-+            *           00000000000001a0  0000000000000000   A       0     0     16
-+            *      ...
-+            *
-+            *  but they should be treated as if they are NULL.
-+            */
-+            && strncmp (bfd_section_name (cur_sec), "__k", 3) != 0)
- 	  break;
- 
-       if (cur_sec == NULL)
-@@ -1069,6 +1088,12 @@ symbol_file_add_with_addrs (const gdb_bfd_ref_ptr &abfd, const char *name,
+-	  break;
++      asection *cur_sec = NULL;
+ 
+-      if (cur_sec == NULL)
+-	{
+ 	  section_offsets &offsets = objfile->section_offsets;
+ 
+ 	  /* Pick non-overlapping offsets for sections the user did not
+@@ -685,7 +682,6 @@ default_symfile_offsets (struct objfile
+ 					offsets[cur_sec->index]);
+ 	      offsets[cur_sec->index] = 0;
+ 	    }
+-	}
+     }
+ 
+   /* Remember the bfd indexes for the .text, .data, .bss and
+@@ -1069,6 +1065,12 @@ symbol_file_add_with_addrs (const gdb_bf
  
    objfile *objfile
      = objfile::make (abfd, current_program_space, name, flags, parent);
@@ -666,7 +679,7 @@
  
    /* We either created a new mapped symbol table, mapped an existing
       symbol table file which has not had initial symbol reading
-@@ -1095,6 +1120,7 @@ symbol_file_add_with_addrs (const gdb_bfd_ref_ptr &abfd, const char *name,
+@@ -1095,6 +1097,7 @@ symbol_file_add_with_addrs (const gdb_bf
  		    styled_string (file_name_style.style (), name));
  
        objfile->expand_all_symtabs ();
@@ -674,7 +687,7 @@
      }
  
    /* Note that we only print a message if we have no symbols and have
-@@ -1352,6 +1378,10 @@ show_debug_file_directory (struct ui_file *file, int from_tty,
+@@ -1352,6 +1355,10 @@ show_debug_file_directory (struct ui_fil
  #if ! defined (DEBUG_SUBDIRECTORY)
  #define DEBUG_SUBDIRECTORY ".debug"
  #endif
@@ -685,7 +698,7 @@
  
  /* Find a separate debuginfo file for OBJFILE, using DIR as the directory
     where the original file resides (may not be the same as
-@@ -1390,6 +1420,15 @@ find_separate_debug_file (const char *dir,
+@@ -1390,6 +1397,15 @@ find_separate_debug_file (const char *di
    if (separate_debug_file_exists (debugfile, crc32, objfile, warnings))
      return debugfile;
  
@@ -701,7 +714,7 @@
    /* Then try in the global debugfile directories.
  
       Keep backward compatibility so that DEBUG_FILE_DIRECTORY being "" will
-@@ -1545,6 +1584,14 @@ find_separate_debug_file_by_debuglink
+@@ -1545,6 +1561,14 @@ find_separate_debug_file_by_debuglink
  	}
      }
  
@@ -716,7 +729,7 @@
    return debugfile;
  }
  
-@@ -2318,8 +2365,10 @@ add_symbol_file_command (const char *args, int from_tty)
+@@ -2318,8 +2342,10 @@ add_symbol_file_command (const char *arg
    else if (section_addrs.empty ())
      gdb_printf ("\n");
  
@@ -727,7 +740,7 @@
  
    objf = symbol_file_add (filename.get (), add_flags, &section_addrs,
  			  flags);
-@@ -2660,6 +2709,7 @@ reread_symbols (int from_tty)
+@@ -2660,6 +2686,7 @@ reread_symbols (int from_tty)
  					   objfile_name (objfile)));
  
  	      objfile->expand_all_symtabs ();
@@ -735,7 +748,7 @@
  	    }
  
  	  if (!objfile_has_symbols (objfile))
-@@ -3638,6 +3688,15 @@ bfd_byte *
+@@ -3638,6 +3665,15 @@ bfd_byte *
  symfile_relocate_debug_section (struct objfile *objfile,
  				asection *sectp, bfd_byte *buf)
  {
-- 
2.43.5


--=-=-=--
