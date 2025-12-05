Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D52CC305E21
	for <linux-debuggers@vger.kernel.org>; Fri,  5 Dec 2025 18:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764959901; cv=fail; b=NvUVs1t5yxVdN32wX5TL5Oyo06B9ADSD9/WLYP3sjnQp70ZvAUx04jqSSTPTQdaqIPeoCkjqnB8MdVgo9+jATq8FPuxIsWgYEx5C4GTysN7A+oC0ngHG7HqLYhxb/cGE+pCsmg5MbUwqCj6XTJQuiYbZrxBzyvklFbsBMmJKntk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764959901; c=relaxed/simple;
	bh=yMjjyy4K6mcNsjaXLmbBq4hSO7lHM277DyKk5EYVtAg=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=iE2J5FUwzQSZTq878x672mB9n50OQaDJkY2VlBLF+9SPHgyKb/7kXNLo8i0oUl5IFgVvFPWSZ/L3vgfhvmoQPSkSzQbSwDqEfwApdU6awn5pgWnMJvOPAas0ZxmaTiO1OSBJUwxv6btDUeDaduLjpvhtRQY1rGQokKZNcxCWiGs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=fail smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=rACLEgPM; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=fmw2REhf; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="rACLEgPM";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="fmw2REhf"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B5IZev3498226;
	Fri, 5 Dec 2025 18:38:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=mJdAcL4pWCF6YGSWRT
	UZ3sjmjJm5KKuVw9ryVFuMk+E=; b=rACLEgPMtRQRA0iq1LbHjDItIiGdBfO/Fz
	OM8eDQ0fbMAF51Ltvo3EjN9abonh1F2eTFwNL1ZfE/J2zvjlb9Jk3j995LvieKmx
	q+ggEoWWsife+9hTWkeUuF2vsevQ+1AM2eqCH26bEZFvE9MifYVvs2IOfQ/rRb/u
	wyhPHqd4pLNU/OksmI9cdBmBYBldjpd5ypXeISi36/vvYQaHG7BknW6dRMFIplu+
	wu5o18ojhE21IuySAme4mZjJ6ufiYs5yoOtVMGwj5jST8kG7J2A+yqROBddFhpzH
	cRYdS/x6euX6a+LD5bWa7OoRsHDNcxwFSRgUloFzz7dDIrhwNNGg==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4av4td806x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Dec 2025 18:38:17 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B5HJPkA040596;
	Fri, 5 Dec 2025 18:38:16 GMT
Received: from bn1pr04cu002.outbound.protection.outlook.com (mail-eastus2azon11010023.outbound.protection.outlook.com [52.101.56.23])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq9hbj4v-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Dec 2025 18:38:16 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=d+Y1b3qvDkJ3OSEyuPH7CbEf1u0id4IY3zlUFvaFqK8eegwAus1SWiED3uFsNcOFXnmDeKNEQvTB3brMYiwpk+iBE7irje/09x/QybtYguqs/aQoSlorHy9XMEUNSFMuWLacR+oHMqnxhoAAaA72/VscfnIY6A9NJW2cceiDkjijjCaQn0XGFEKQnVHARtpqQecbJJtUkwHx6U699YSkFEsuGZUaYbw/W6z1mQbrYtSuKWdU1SgMrlemmFtqxHnHeTt/45248XzQR9klpfXb03/ZPlestlz7CYDaFiDcLZA+5ATSwkCGN7c5X2YZq3ttlavzJQahohC9xpB2Dl7qdA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mJdAcL4pWCF6YGSWRTUZ3sjmjJm5KKuVw9ryVFuMk+E=;
 b=idTBfQ/oqcBR+kwSt8SFXhSBzozNp2OeveE9T3+h3FHdUQmONxi8A8KNCP5fug3lrK6qZY32CvQUVE7GoI4hqhxEww7RAeETeuNaeDcafEIbSgn2OwmP56d4cBnoR3r99I2+1zVSGgt/XU0Ji3zbb01YM8YJQpFPQ4b/3VT4GVAuPsnmLzjo0tuwWh4tZcqmPPLigUXfLkUbKLWjuuGsFfUcjaVKB1fvPnZyO7YLVXG0mX/r2fHeu5ntB3dkmZflwThPPfqyRf8Aw/WdZuzqATPzniazzaoAnMrq7hXYe7tQzAzmLP61Rgz1AHafbgtE7VRiXCis22zPh7T4lNDgxQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mJdAcL4pWCF6YGSWRTUZ3sjmjJm5KKuVw9ryVFuMk+E=;
 b=fmw2REhf50OuJuYqeZQJMnF+hbCV4OUZh7W3iVgc9krsr21YURndQcF9CG6x/zexwPcAPeeasTBRkh9cU+kXneGawCS93k6eHcZoSXRoinoGb7ZQImDSTxqvE8g2i2p+bwJ1y5+NUDfbmhIfvo7xu6G8ZYptDIJMq3vUFVIdtEE=
Received: from PH3PPF654CF2C22.namprd10.prod.outlook.com
 (2603:10b6:518:1::7a9) by DM6PR10MB4249.namprd10.prod.outlook.com
 (2603:10b6:5:221::10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9388.9; Fri, 5 Dec
 2025 18:38:07 +0000
Received: from PH3PPF654CF2C22.namprd10.prod.outlook.com
 ([fe80::a94c:94e4:9c1d:d98d]) by PH3PPF654CF2C22.namprd10.prod.outlook.com
 ([fe80::a94c:94e4:9c1d:d98d%7]) with mapi id 15.20.9388.009; Fri, 5 Dec 2025
 18:38:07 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Philipp Rudo <prudo@redhat.com>
Cc: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Subject: Re: Unknown ORC entry type 5 on RHEL 9 kernel
In-Reply-To: <20251205114106.07848df1@rotkaeppchen>
References: <87h5u6j9k1.fsf@oracle.com> <20251205114106.07848df1@rotkaeppchen>
Date: Fri, 05 Dec 2025 10:38:05 -0800
Message-ID: <87ldjgwz8y.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8P223CA0004.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:510:2db::29) To PH3PPF654CF2C22.namprd10.prod.outlook.com
 (2603:10b6:518:1::7a9)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF654CF2C22:EE_|DM6PR10MB4249:EE_
X-MS-Office365-Filtering-Correlation-Id: bdb06227-7a51-4d29-c0da-08de342d6ee3
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?EVLeLct7lMwCsR8GZ+kUgRNjK3oWYw+le9TfRCtLrvuPbnZ3rwxy5ijwVAZh?=
 =?us-ascii?Q?4CSFVKF7V31UH50xSk9eC3m9E09vWoje3YRp543NHh2u/VdJ8VGR2Um9Lacl?=
 =?us-ascii?Q?gQdqarURLani8I3qnk0xU+GTs5UAWmRTCuMykMVKsrfP5LhaAy62+kJJxLX4?=
 =?us-ascii?Q?WDVqzePItesFMOM1C3Jp3R7sh+l9/PzcCGCUYft9fD9hC3pKbUIu+vDXq4+o?=
 =?us-ascii?Q?IzFXoRtbv+xxhgGy9X6NoBf7Krxv6c4C93pByhK/IsDNVyLN3Ocjv11lQMlL?=
 =?us-ascii?Q?NdOyl0P4MAuO/6uH9BPt5nCdD+H4HdNmzzQktws23jKeUikBMFOwE7+/mSv4?=
 =?us-ascii?Q?vfs18VNvS3G9fqga/RvU2gh4M3PgIyasKBVXE6rgdS2BWlhv7c/Lxizaas55?=
 =?us-ascii?Q?QzZeqolhgSY3wuKwJNmfUH9YkHk5NSSz7YrDmzpScVMXqIS8SY8YvSB84HyM?=
 =?us-ascii?Q?7UB6d4GhWvx0D+78UHTztisRvu2DpRFIP27co7PmuqG6WfgF62sr6N2z3nW1?=
 =?us-ascii?Q?utx/bN8mDW7+4dJeZcRDpQlwBV9Fv6OBnPHHrjCkiv3QUnrvHncNKpOA7OKr?=
 =?us-ascii?Q?IYmQXlH1UjPfR9JVp6Z7JODGrknmnuPWKlw3aeE+3vYl+NsV7pHT8+BzBwCl?=
 =?us-ascii?Q?TmJed8ZsrwhVeSNjXUFakWu4NIpV2k1EDSw43W5KZQC0QFszppE40mCHgN+x?=
 =?us-ascii?Q?RDawnHNXJxs3qKX+4bOi5jYPxXqlVELPyJ24QjSrHv0d2iXaLP+yT4BpBLaf?=
 =?us-ascii?Q?gVAnZ0xDnWjSdm0jA2fo3y6SAG+LgRVmBGU6nnlcuSIsSsyu8SEOFweki01L?=
 =?us-ascii?Q?7FUPaARX9fzk6GxJuzKDnLLgoPL0gvyCJZ2MoJx0b8/3EbK3L5vlwZ4rcljv?=
 =?us-ascii?Q?lXbqmX8RK7jTrSr6YZ96ClYr7GOKyl/ed8PaB4qaFVu4KlJCNty4NIc9S+Bi?=
 =?us-ascii?Q?GptXbEOF04rXHmeQ66BgjHwy7FH4JPWRAE3AEJ1awj4jOvNv1YiGdcY5ABMG?=
 =?us-ascii?Q?GPG1T47CGNsCdMowe/CozUBHKbc4rwVcacutNBc7TKkidLg1v3DJuuCQZEGG?=
 =?us-ascii?Q?Y/cs/9eS5tzMsfdVfqjBfm2eD4EQs5ikcoy1bKPKfyFAsq7+6BVmr6dKLI4s?=
 =?us-ascii?Q?1QwlGUV9Nvs+U4tBopr1LHwdzW1pfc0s8UKoEDJOuKifDy49JgWnF3wY1KoJ?=
 =?us-ascii?Q?4I4lIoOmzKAWpzMO29B9NoEGpAo4KOyhmetBPo80z4FhXQenOl50YaJjOODi?=
 =?us-ascii?Q?JtDEaSnxHRRhm27cq7ydUTToRi2B/oAisPBwRsx12xCoHTo0VSDRA8waV/nZ?=
 =?us-ascii?Q?x2CamrCI1unkzTgP0okm3/O7mLhwurBxInIzV6Whrzgmnnrvfos1UJ9FZF9w?=
 =?us-ascii?Q?7RKPO4Phd93P6oyKZ6TZyX3NERSMQsNcCK9L56ElVQRb75HB8Q=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF654CF2C22.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?woRIQ62RraEkGNhPTETRSKfScrQNH8KUbRHM6Qd7QGkMm0RxMU+F1avKmY7Q?=
 =?us-ascii?Q?K4SCnLUSvmRg/TtDKQ6YZvxytSz8p1Uau/uU5rF8ZO0o6Y1CKVPX1pDQ4jdZ?=
 =?us-ascii?Q?QR4pfcijUKF/4pu9pmDcB3grY9irCVR4lw7XgKVMinu0I+LNWvg3Yl+AoHFz?=
 =?us-ascii?Q?K7JXco3wKEIR/RzYjA2iUl6vbdL0oY3huz74OVARykwOP6xmYRhu9slrI1eL?=
 =?us-ascii?Q?pX4s/3fORkV7mewBXYaJkGVKzAhZreQxoeUTl++iSIO4hMuH3K9WN/PAU7MZ?=
 =?us-ascii?Q?aop6PDQieG0quct+JqipojSwkpaIScE+DGGVVatygySS5B09oSRJ7eOOKPyz?=
 =?us-ascii?Q?uzq7PbUdmmnNkmatkTdPX0VhQgoMn96vIoAgyy2wdhWIuB1ijsc+fopkXAg/?=
 =?us-ascii?Q?V4l70hBO87zPCrmvXjjFU+U9Fm1WdHZkToWM70vswCTqxBeYXEJi+GyTwyh9?=
 =?us-ascii?Q?tkRp8ZOSUnI66QcI2usb1XbQhKPR44yUUXcxk9D6KTFY6jlfp41OF7xRxZ0q?=
 =?us-ascii?Q?6odf9kXvOhjvxRmHbcL05QyPP9lgt8Xs73MCWPE/gNjioca/98Pgky25VKrf?=
 =?us-ascii?Q?vuKlgKAXWlA7zTGOqDgmJrete/caJ8yDqexFw/QNZDxEkPz6K9K+iJQvlCfD?=
 =?us-ascii?Q?7sUQy9w3lMacG1rqAkxezUrkOkGOZb+XDOWfZceNaAFANPF7Ct8NorfpJmL6?=
 =?us-ascii?Q?nNibjGwAR8Oa+nkPeo7jiYTsCYSg6NhdO3n+9MLvW2gtMvBlOajWeEFh27GK?=
 =?us-ascii?Q?Yo3VuXPI+uQrTQ5basyrTvTwezvXQ9xzxGvKWWt1XxMq4eYMymARvuiT5EDx?=
 =?us-ascii?Q?/DvErf37n4LRoCnBkobzULhdSlzK8z82SbhwqOqS2oDdGfm0iLd16ezv78Ev?=
 =?us-ascii?Q?HLxE/1jSbyCmE26+ZugBlp3nPQxYizG0fuRfgVvmwWD7smAGMSFfuwwL2PKg?=
 =?us-ascii?Q?AQ9Acp6sBS9xCvPqtujcg9SwmvE01pAHOs/cRH89MWtThhljUeoiSiq9x/cB?=
 =?us-ascii?Q?gQ1mXtMoZ218gF9vY1w2aWZ3mZnfLoqBk8X/w7SAxjhqvN7mvx1A7ZU38Pd5?=
 =?us-ascii?Q?DQWINEX8qb0K8nL6jZBZSgclhaybUNGtxCHitK/sjXI7334ynNk3TdLtmoR8?=
 =?us-ascii?Q?cC5Bx0x00CAiP0RQ2g3ZVph2WydjyIpWKyEscMqGdMI6tNPautfWU7msTfuk?=
 =?us-ascii?Q?CmvZnIRqh1s4YximQS7zCXwDbL3uA/8OsV3ZJs1hQxdZ4ttTz/Ife/nNU0Yv?=
 =?us-ascii?Q?hRe115z82Kp72OMYqjic2TDds4jDrDZzFjqqmGiR0XKl0z0q+O9X8gJUgvj7?=
 =?us-ascii?Q?v57YeGjJI43gewFncejg8cDinJiOyZsKFrMidRxbWlfGK+jeiHnrGbq6V37Y?=
 =?us-ascii?Q?n9LsSelWHPvAbTCUT3fkj1RLYgYlz1iSY9lLRgU67EwAehzFTUoOIQji14q+?=
 =?us-ascii?Q?afqwGsrr4ZTeWId4gp9QgbgsFWCO3XrU4RJJErNwZnqjbEMu/jcFiiMfHDTu?=
 =?us-ascii?Q?t/YXLhx3YkcKuV42vzZYtmO0JBvXnDlPUaPHaAlRBt4sV7vYKbWcxKoBWe5K?=
 =?us-ascii?Q?lJtuQiuz3K1a8Sa8InGuW4qTkM3Jy8/lb5rtheVxPKH295x3/rfi7jW8K0eu?=
 =?us-ascii?Q?sA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	C7RrhVSVPeW0lK3OHMdrJuT1chTfEx//y0wYt3wRfoNvMdo33MG62hUhEvcfulHjo6VQa99PE/DUqp+Hf5pADG/3+hsE/1cuchmCdexIs3xAwHuAc7laEnzxiW9D48wZusJ9rzwatDTn0k598Mj+bkF7ehVnjX9r5v8ixUbv8SlkFkd99FwN4omskW96QmJWyiwrFKVs8QrHljo9h6Sz0OY6pLfLQjjIqPmUPaULlSZ9/Tme9rmkW5mqFnJ6ul9IBfy8I/qTOO1sz3sHFDhwy/WMKcwMihEAgnHzpV7sFhv9HTeLy9t2ZURr7b0qh7cgp+aT2xyukcoW4UO0z0iwo/jsUH1S6zG6PM2VusQA3Zv8P6srHcBxRVjvnYqGCfSzZcp88zaAQnjWgs7NHUqpHjGWBNpYeH0xAcQdtduavU+VlWDFVBN4WD4b7WVbmfoGmaDBcW8HBin4JLXQ5ZE98POIs5YSw0HizUJEBJH3pQrFMGZ4RcZ1cqgfWcZxeZRQh9JadbZMt1ibOhgMjGUcnNXgPyIxflwC3KegLLMPdTOB8vB+awdXQLhrjMjYqUyAY92CC1cUCdESHa9a7vv6eFfnX5nzjFli/hXlGkJF3Qk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: bdb06227-7a51-4d29-c0da-08de342d6ee3
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF654CF2C22.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Dec 2025 18:38:07.4342
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: NjCGP89r3p1c89RuH0cSOYY5Ulw+9yCg2mVg/D1OoyznhP3F59QGqBh1frdFyhHPcIgyuogUMzTV3L2tKUYynUT4G0tvm4hGdgOHev1yATo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4249
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_06,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 malwarescore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 bulkscore=0 spamscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512050138
X-Proofpoint-ORIG-GUID: tMnrMcYfmTyjMeX_tLTJI0gg0Wl8Bsag
X-Proofpoint-GUID: tMnrMcYfmTyjMeX_tLTJI0gg0Wl8Bsag
X-Authority-Analysis: v=2.4 cv=ILIPywvG c=1 sm=1 tr=0 ts=69332699 b=1 cx=c_pps
 a=zPCbziy225d3KhSqZt3L1A==:117 a=zPCbziy225d3KhSqZt3L1A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=p0WdMEafAAAA:8
 a=20KFwNOVAAAA:8 a=yPCof4ZbAAAA:8 a=u9SqAmalycr8LLFts7wA:9 cc=ntf
 awl=host:12098
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDEzOCBTYWx0ZWRfX/WIdTBT04+RI
 93JOe0DRre4e5zbpV90uWE0e7NWRqEoXaHIn4y6xxSa/rjv9jH/AXsDhXfcggYI7BKv8Wn7fceH
 ra0YIPfLfeBxD70CbVkvA2Zt7UziBDdGLLnw3+6uZqWyY0NXIgznYbtml8ovBzR7UasTRD/np0r
 1qCzdCTiuc2Mbk6W2UCIpT+OCbGUjSly6ehS3ZsBhqNGNXfOXjXZbTZwiudf+xohiBBMUt/s77p
 7d3I/eQTdmZyIN5Xzx8LZugXode+Xo0lccvhWfXIEn4jFVe6mW12/6uNOHz4OGLAwnS93WshWdO
 CCGsgPlxexrpNj48HoxGnC2My9TJMY0wcVtjecwhXNo8iEUt4S9FbGkt91VxY1h4/jTa8X89Inw
 iN10Apjn/7hTJ/wUQWUbJy/KpXUMeoFw5QCO6WhiDGK90ie2KeA=

Philipp Rudo <prudo@redhat.com> writes:
> Hi Stephen,
>
> thanks for letting me know. And yes that is something we need to fix in
> the kernel rather than drgn.
>
> I took a quick look and found that the change was included when
> backporting fb799447ae29 ("x86,objtool: Split UNWIND_HINT_EMPTY in two")
> for 9.6. Thing is that I'll be heading to LPC tomorrow and won't have
> time to work on it properly before that...

Thanks for taking a deeper look! No worries on timing, it's not urgent.
If you think the most likely fix will be to backport commit
b9f174c811e3a ("x86/unwind/orc: Add ELF section with ORC version
identifier"), then I believe the drgn workaround I proposed in the
Github issue [1] should work fine: once the .orc_header section is
found, drgn will detect it and use the correct hash. The only difference
being that the "true" first broken version was 5.14.0-517.el9, which
might be worth encoding in the code in case somebody ever runs drgn
against a weird unreleased version from that development period.

[1]: https://github.com/osandov/drgn/issues/578#issuecomment-3614826789

> One more hint. When you want to get the history of RHEL, it's better to
> check the centos-stream repo then the changelog. There you have the
> full git history (modulo some embargoed CVE fixes).
>
> https://gitlab.com/redhat/centos-stream/src/kernel/centos-stream-9

Thanks, that helps a lot!
Stephen

> Thanks
> Philipp
>
>
> On Thu, 04 Dec 2025 12:06:54 -0800
> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>
>> Hi Philipp,
>> 
>> I wanted to let you know about an issue with drgn's stack unwinding on
>> the RHEL 9 kernel. It looks like that kernel backports some ORC changes,
>> without including a change Omar made (including an .orc_header section)
>> to help identify the ORC format version. I've included more details on
>> this drgn issue:
>> 
>> https://github.com/osandov/drgn/issues/578
>> 
>> The result is that drgn can't unwind stacks on the RHEL 9 kernel. I
>> think the best path forward would be to include the .orc_header patch:
>> b9f174c811e3a ("x86/unwind/orc: Add ELF section with ORC version identifier")
>> 
>> As it is, the RHEL 9 drgn can't unwind stacks on the RHEL 9 kernel,
>> which seems less than ideal.
>> 
>> Thanks,
>> Stephen
>> 
