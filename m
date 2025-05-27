Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43647214A8A
	for <linux-debuggers@vger.kernel.org>; Tue, 27 May 2025 22:07:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748383680; cv=fail; b=nlNWI6IrPuQExkSan/U8gwYB93DwAdNeOWLWB7RgJUjOWwC4p1ljEnQAT9HYlhhMqHDAEJt7oNok3a/+eDEU/biPp81OWW+9HBJ/tsuORdXe1LVq3SdXzvz9vJ2z8aNgcmXuwxqanYIXUevjuDqpcelKdcLy/PWISqHIiySZDqg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748383680; c=relaxed/simple;
	bh=4+MNX1TiRR3iWwovNXDR3spJ46O1d9AdCJgUpKPt56A=;
	h=Message-ID:Date:Subject:To:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=hKBhgHcDWxo88zGbvKOjl47uzGgZB6JI3OjBZVrBZ/AIhBkU6P7XO8JMoLux5zwRHmtD590BPnPnS3KWStEC0egTg4+VbitWn2DRsiGFdR5h41l6ePVlpI3u+Gu/JE/uHHG50Y6stknjYyGw13z0yX+Ol/aBdlwCDXKRod3XJUg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=GhbuJaUZ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=WSyuGmn7; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GhbuJaUZ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="WSyuGmn7"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54RLN1bb026960;
	Tue, 27 May 2025 22:07:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=UrgifXHWfJciSVyyqSKUyTEfGvkMmPnYrtMTQVeiSlQ=; b=
	GhbuJaUZEy5B4gUdxmhaW8o2n0N11/YEXpASkkPqbgtMcKI8vkGEZTMe+6DSchob
	vKvO06ZSDlu/CkzoGbfFkwO+St0rqWt9pZevFvhBdpLB4K+ulaEWLUqHAbuVJvfh
	hF7hTNsPICwQws3IftvkngOVYUo948OWeXjE4zU7sYYwY6sAZ0hAQy05jF1AP0yq
	KY4vB5ZvOV5O5ry2JpRkx027O/vyL9y36Ioq5KukDru0A+R070uIIwiv1wCfF/7u
	Y0QvIhWok1wboFrG5tWy3b4fHpTBCwFJOd8x+nsQFdu7fCQwShwkLGzcx2LXmNn6
	Hlpqphs8cdvFZRq3rvLFgg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 46wjbcgndb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 22:07:57 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 54RM4Sve023248;
	Tue, 27 May 2025 22:07:54 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10on2062.outbound.protection.outlook.com [40.107.93.62])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 46u4j9kwhx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 27 May 2025 22:07:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=mKR5PmbRCI2m6/Xg0UdTTF5mjTF53a5YMJO1KPqQzFIpofRm0wbBtnR+IbOfE0M5vNw8FbxNm+86Ax0HH0tmYc+Dn9RiV4NyQvqqFFZrh2ni2nmFLyQGdpXdBOBVcZjZ77kLjgaANhpWJUDOre5/5LNPQBfXZKwW1NMnrH1xHUXA+Rlvumtnk0ZfyQYkww1zi+eUgUBVla058HKd0ophFLmi9bDguc6L9w4DmfPofOtDv2ZNIgM6KxbkCDeOxXrgcgbAYzR76QIl6bEiCsc1RPOZgt6URTFb7rQVYmRHRDIB313DiAEZWgclW6fN3H+BYj9kSKPebTXlLJU10L8Ygw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=UrgifXHWfJciSVyyqSKUyTEfGvkMmPnYrtMTQVeiSlQ=;
 b=RKnoaIiO1jybhRkKRWLaKE7romfWKFKsAZwtIjoM9FyN++T67680XwXt4xKyKVq7IirdtnPYG/c+VVekzwuydf1AOVUiMj5E5pf3oWGj8GFTtCzOx5Q+NHuxAcKtAgN7+DkF/u/fVdof2GmWWRxrNxk7QDeIoFxyVq2WxNLw9lOTygLSSUtJZq6m/74jmFpmfBIZk3Gzlmttsk3WquxqAsquhRJVFbymZHoTuSIF00qX/HN4igThR8PVoKdnrIhtifUCyerNRGDt9QxotLAd7P9sjDpaWTXkMHgT9XBoDlVuCRY1U2Pw3wqMmYMYMQZ7Kpa3g9SJmbjkxEaLoaEpvA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=UrgifXHWfJciSVyyqSKUyTEfGvkMmPnYrtMTQVeiSlQ=;
 b=WSyuGmn73v918aUeeJIYLlQ8XlXMkHjzkxZ5SYNvvJdgGM88yaH6zUla6lYlZ5VxZPdJFOLrqO1Id4eHqIM/CEc1aH2Bb1UQVszPYK5UC71ihEjXzB1suvJwhXLBROW+TKQOBOPDpeyfk/80imJu8N0DJQduO5g5LbCjVo7+dto=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by IA3PR10MB8613.namprd10.prod.outlook.com (2603:10b6:208:577::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8746.30; Tue, 27 May
 2025 22:07:52 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8746.035; Tue, 27 May 2025
 22:07:52 +0000
Message-ID: <8148e8b2-5edb-4af8-b657-dc84f53657a8@oracle.com>
Date: Tue, 27 May 2025 15:07:49 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, May
 28th
To: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
References: <aDYy37NBkt7mdaJY@telecaster>
Content-Language: en-US
From: Stephen Brennan <stephen.s.brennan@oracle.com>
In-Reply-To: <aDYy37NBkt7mdaJY@telecaster>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: BL1PR13CA0115.namprd13.prod.outlook.com
 (2603:10b6:208:2b9::30) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|IA3PR10MB8613:EE_
X-MS-Office365-Filtering-Correlation-Id: 511db5c0-7774-4e56-0c84-08dd9d6aecae
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?TStscHhxbk8xTG04ci9EMWVla1pURFhMTUdCRmZQeFRUOTQrb3NyVTJGaUhI?=
 =?utf-8?B?b0IwelVVdkRMNFZXT0p6ZUVtUk5kNTB2OGdjK01JRXlWVjFuNFd4Mm5tbTA2?=
 =?utf-8?B?YWpzbmNUdFJSYmIyR3U3OWI5MmtUcjVOMFl2WjQ4bWJVMWFIZWRWMnV6QU1M?=
 =?utf-8?B?N25MMjl6UENpc284NThBK1ZoVXgyZHBUeVlza1ovNzRDQnJKbWtWZWEvOVJO?=
 =?utf-8?B?SGZmbHlGSVg2N0FHcmlDd1dYTWRZbTZkbzZSK2czMHZLMzl3SDNiNnZWcHRw?=
 =?utf-8?B?bFNUdTk2cEJlSS9SNDEwVit1MmJRN1VIU0E1VHE0bGZqVmRhcERpWlFLUFdD?=
 =?utf-8?B?enF3dmxkLy9WZUZ1UDJYZWxCWEpRc2c4Z0VNMzdXWWZIS21wemlHQU5ERzVm?=
 =?utf-8?B?TG9NVDg2QzV2YytlYUl5dGoxd2wrNkozMjRqZDJBZWZydkZmTjNOVjdXK00w?=
 =?utf-8?B?c01JOEh5TCt1WVhncW8zQTM1RURWM3FpNlBGRnFubDdMSnIreFpHU2tNV2ZI?=
 =?utf-8?B?cEMvZkFOOXRBakkva2V3QytDVHVPMGFIYXF6am1BbjBoT0ZZMHVXMk1EZFhs?=
 =?utf-8?B?RCtyMjM2THdQNE0rVmJlRGNCRVhxSXZWUytFWTIybnBRb2wzZlhyZWI4YjQ1?=
 =?utf-8?B?MzgzMUwvVHJ1U0paTXFDQnQ5TytkaG53bzVZd0ZONEI1MlFvZ0pzSE1CYUVS?=
 =?utf-8?B?QitoM0djcXNadWtMY0ZIYlh6T3FETWtURlAzNXcwMFpiTW5CbWZ2NWRwelhK?=
 =?utf-8?B?SG14V3grN3ZsQktJeTNPNU94VGI2Q0RSVFZnZnRCVmNZY3Rxa3BEeHBTblFS?=
 =?utf-8?B?OTZXOWdNdHU1ME1CL3pySDA3UlRZNXFrQXB4UUNHSXpJbEJwVVQxOTl5SS9u?=
 =?utf-8?B?eTVQVGpMWHRaWDYxbHpSaC9taXM0OExCdVg1bGtlLzVqTGFoamFIUVh0T21k?=
 =?utf-8?B?ZXRVMGpzODd1V214d1dVc0xDQWFVdkkrQkFCdFo3Q0Y2bWxHbkUydlBkeXh2?=
 =?utf-8?B?eTJkM1Urc3pLdit1dlZCWHQrWmZJU2FPZE0vUzM1ZmJLRnF3MGt0dUR2Ym5J?=
 =?utf-8?B?SkllbmpnU0gxSVlYUk0yRHZ6VzNZNlpDZFNxTkNjVkRVWFoydUxoWlZhQUNH?=
 =?utf-8?B?R0dqcHY5YmhhL0RkQ3pGQWlVMVBIOFpMOGkyTTZEY3dJeTVrZnJtNWlrWDBI?=
 =?utf-8?B?VzdOdTdHSDZZSXVTU3hibVpiR2R5d1dEVDc3K2dZNmdweE1FOUc1Q1BVUjhk?=
 =?utf-8?B?OWRYK2NKdDNodGx0YnJBU21VRWdPQmY3RzlBaW9DRkJjem50bE5EN2hJbFFv?=
 =?utf-8?B?Qk1JVnFEOWpHZXN1MGdVMEc1aUJwUVVkL1hvcE5MYjdJR05qVGpib0JCRGZm?=
 =?utf-8?B?bDZxbUdza0c3RWdyalVUcW1MVW1xTVB5ZlNVYXhuZ2pDV1B4Q3BzNytmRE5E?=
 =?utf-8?B?QXlMRzFIVnlkUGdsUUVOR0pDWmYrTFhBNjlwU1liTnEyZXJVd1YzaEdXaDVR?=
 =?utf-8?B?T1pNQ084cEo1NEIwZi92NFNrUWhJb1BYT3VRcDk4dlNuUk9nbUZSTUNVY045?=
 =?utf-8?B?ajAvUjhKakZzcFJHbXdpNTdSbXJXbHcxem00ZklSMGR3SnhldWZSdUFYUlRZ?=
 =?utf-8?B?aW9tNHBZSmVUMkJVQ2dabG9YQ3h2amlKenVnM1lZcmEvcFVXS0hqQ0Z6dC9v?=
 =?utf-8?B?VjBrNEVIczZBSXlpSFZXSFBSd3dSRDRhS2JNQVdXSDIyR3JYdzVvZS9LSHIy?=
 =?utf-8?B?cTJSbS93UlBhMFNlSlpYSDMvQUc5ZVdWY0daVTNhQkhLYUtIS1NuUlNQWGFu?=
 =?utf-8?B?WnFSZlc3a1d5TU1CR2dXRW95aVdnS3pBcE1HQ3NsSzVWNFcveU1iZjJud2xG?=
 =?utf-8?B?VW95SWpwNVlheHVnVGFjVmJGa3BFMjF0MjhYcG91SlBWdXNzL0FtWDRwS3lK?=
 =?utf-8?Q?ukeFC4U9dVf6bazNiPK1CSSawidMKDty?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlZIMFluUVlmbXRZM3d4TGxVbU1WRnNtallvcWNBOVJxQlQvdER3NzJBUVdQ?=
 =?utf-8?B?MkdvSUlGa1Y3YkZtanNjUGs1Mmh1RmpPbkpZMjUvNXZnTDFDWU5QT1lBSm5n?=
 =?utf-8?B?N3oyaWV5NHh1ekFkSTBDSDJvQjZiWFN2azlVMlpzb24rYTdRbWtGWVdTak9s?=
 =?utf-8?B?VXZrcG9ZWFIwWDkzZ1VKNEtxckJJUzZFcXQyRm5ORmxVNXZZNjlVZTgxNEp6?=
 =?utf-8?B?SWtCbW4xalpiVzhKUldMTVNKODR4QkRNM1dhQW0zeUVDR1Fwa0JNbDdlR3ov?=
 =?utf-8?B?OWhYNEhENlB6ZXlSY3lsVW0rTUd0eGNWdE4xR1RqU3hkc1JqWkp4QUMySEE0?=
 =?utf-8?B?azJFTVVSM3N3RVFUdlhyc1VveENqd3I5VmFqUE9BeVR2dFB0dnZ6NFNZUUdY?=
 =?utf-8?B?MS9GQTNBNjhNKytZV1lNR0srbWFlcERHZU1nczZGMGVsY1NWOURhLzNNVENX?=
 =?utf-8?B?dFAzVXBhdkNwYlRQY0hEdHZGaGl3NE9lcEVpeUN2Q3hwQ2IrZnRySmJzb2hy?=
 =?utf-8?B?d2d4QXN6L3I3QWEzVG5FWWRYVVlEUUE3Uy9HR0lwamwyaDJleEVCVkhyN3Vj?=
 =?utf-8?B?ZGRqMXYwOExxMTQ1bnNIL3pJeG1CVHAxa2tIRHJ1ZXlaZzdGckVlVHl3UlNB?=
 =?utf-8?B?U0hPMUhEQ2ZRbjJINndzbDBZcUhqeVE3T0RBWDR3RnZMTWRVZ2RIbEZuRlQr?=
 =?utf-8?B?aU55bGlGc21OSTFJUmcvSW5YV3dTYStlMVg3eVd0RUNIcGNySEtDNzB1Y1l2?=
 =?utf-8?B?Tk9rQzFCWUwybEJUSjlXUFB3aU5zZS9RdUg3UDFoSFQ3K2ppcFE0Ly9LMFpw?=
 =?utf-8?B?ZERnY0tSSVhiUFowT2EwSVQvOVIxUzZhaXdvZTVzN0R2N3lzRjgvYTY3UWtl?=
 =?utf-8?B?WUNpL1ZKK2c2MG9SS253azJOWTFNcTA5dGp1V0VSQkxMbDJEMDQ1cktDQXl0?=
 =?utf-8?B?TTJKcEdmRzRyMWlQemRIY0NlR2Zsb01mRTlwai81QmhXRUZmcjNWZEtsSW1i?=
 =?utf-8?B?bG1tWEtLQ2NrQ1A5L3VhZHFoS2grRWt4UUFoaDN2ZHdHb1Ewd3FXbytJYTN5?=
 =?utf-8?B?Zy9FeWxQTnZ2VFh1Y2J6U3FMd1JtcElqbk9MTmtpVU1WeEV5WDBOei9sRFNJ?=
 =?utf-8?B?SHQyOXBTUkRwMnZTU3J2NnhGSDVSeUhNNHZpZytyL1BxR3VJUXRGZlh1emo3?=
 =?utf-8?B?YWtYUGs2aUpFN3g3Tk8xYTZSSnpYNm8zVzFhdkFHc0wvOUt6RWY4aWY4a2xB?=
 =?utf-8?B?aDdBZHNWQVZsQTFUQ2pKdDlIeDBQK1RzeWd6S3hCczhoNVlwKzJjNEdGdHpT?=
 =?utf-8?B?bnFPMG41QnJ5Y1E1TmJ5VUI1c3o3NE03MCs0TElhcW5LV2VqQUd3TmNGUUp6?=
 =?utf-8?B?TG40U2dqNE1CUis5eE9pRG0vdEsrdVp5U0F6MUY4N1RZbzhwcmFjK0dyUURT?=
 =?utf-8?B?WnBzTlN2eGhqdVF2SzFkNWtWM25KREI1MGRFZTdCcENFTTI2MklvWnRwZk9Q?=
 =?utf-8?B?RWpncDlWb2xGTFBhNVdiR2tFdVhqQnVDSnRMcjFudktQNlU0cnBuOUlYM0dK?=
 =?utf-8?B?S05kY21UNWFxNExVamJaZDJodTJ4ZTdFL1RmRDRZQktSMU5oQlFRTGx5Qi9t?=
 =?utf-8?B?eVZEaWFIaWJKNlFMMzJNOFJlb2VNbWFxUXE5SitDdlJvZEIwcU43dUVZbGI3?=
 =?utf-8?B?QUsxNi9LZFdXTDU4V05leDdEV1JuK3JNWE5TSXU3QXZ1OS9Jc1VoRkg2RUJM?=
 =?utf-8?B?YVV1MktJTEMwYzBnMWdsVTh2eVFsWVo3eTE0WDN5MlZ5WTREekZqc3dZL0JB?=
 =?utf-8?B?MTB3V01oNEZ0R0pyUnBSZm1DS2lGOE9XMHh4c3lGMEFyajRCU1lvU1N0bnRy?=
 =?utf-8?B?UTdieDhUOTNwZGUzMnJiOTkzNjVITyszUUJPaFEwUml6QjY1TmZLYVNYRkVR?=
 =?utf-8?B?SWx3YWJ0N01tTjR1cmVwTk9ESXRqRWFVekxKdVZjUE9QWnFQTlNpTFF5SnV2?=
 =?utf-8?B?T1lSOFRpQ3JKbHQ2a2VDYjNDUW9xVkRWVXdrakhaa0plYlpPOSttaHczdHlC?=
 =?utf-8?B?NDJwVVJOdzR0WGExcWc1Qkh5d3V5VFEwanhHajV4QUJ4cFpDYmUwZ09LdG5v?=
 =?utf-8?B?ZE9BTjM0Tmt5Um1GNDVCODJ6ajFZVmFBd0lNSnQ1YWFSNzRkVGg2RUFFczFr?=
 =?utf-8?B?K1E9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6KUMwA/XONnplN6wJcuShEzHrJWIu6VKUnCLjRQ66SNOavhREFxj/AQ+A9xpLy8M9KrWdjaD9FCT2ZdnCBaoHAqaQ+Hl1q4WIBXh1beeRd2xgQE4kNjBtjEabIVHmutvtGWQMPYfMO0L78lkdSNFzYQNFxN9OrEA8WKj/KkzqpX7d0f/z+6BeZED+JJBFbtwecaO/Cd+vwi6g+8HGxvMv03bRQPGCgP64nSpG+E+x/4JFiZ+rK98iLHejliKNtD2ix5ctP9mMi37fiZ2NGrqqngYLtmYUwKpmT2Xrj66J8ajq8I7fmuVWhoYvFSstDOtvLoSRGrnnmxv9qRy979hmKobtX3eKdA/094T3mO4OwZE8PcXdhJa1XZdar58norvp0bO+rrSyrWgVK+c4SfZBsxCsgNSSK2fOva8NHvcwztElMHy8f+qtiIIu5nCOhNj4x5OIHqRvGnC1cYbxAhvhiFVJ1aB+Y/lufwnT/mgIXGsU4f+fYMRYsmFEj6/sb8ppFsBxIux5IzH+AvqPvJ14jeyxm9eMfPkJ0dLUkqT5lf0dVG3eYuxKmm2Foow+gNs/yQFeeyUw42P4ap3o4atAYou1dqq35xTt1jx9v7EmyI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 511db5c0-7774-4e56-0c84-08dd9d6aecae
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 May 2025 22:07:52.0660
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: r/VFWHJOAcH8Vwa6+jfwGQAp7jEllELpx2MI4bz5YTITbpBHZw7xU0RMmyzAj8U9NSup59s6fCVURHlab4ZFdtlm/aZRx3Cy6H4i8ksXLJQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA3PR10MB8613
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-27_10,2025-05-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 phishscore=0 mlxlogscore=999
 bulkscore=0 suspectscore=0 malwarescore=0 spamscore=0 adultscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2505160000
 definitions=main-2505270186
X-Proofpoint-GUID: 6-yeo90i1XB-wnXYEx0ROHJXzNXvHy3x
X-Proofpoint-ORIG-GUID: 6-yeo90i1XB-wnXYEx0ROHJXzNXvHy3x
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTI3MDE4NyBTYWx0ZWRfXwsyt+9yGhpsm 34CzZ/0GTmSXxFvI7C0xrP/2GlMjG/CpvXHxkbd6Gyln4nlhsMR7P5wvYc/fdo1K6zjdnAPAjbi N+FtzpfizByAlluTKsV4OGWZIKJGuEx6As+Nm7NYVssR8NH7p66VgIP47EvTG9v5DpYE7jGRZDd
 LQlj7PP3B9sbVphMS9w9/qK7yYCAYW5225rq7GbotFhmv7ph0acvg+wDeqAlCvcE1PToxcDucUO BeUFpq+BhMh4AFJJQYX4cQ3YPOJo7TBQknAJ23YjDmPlxAC7Lrf/8U2SjTZ53PhptmohNEIaTgd ijz2h4zw6seszeQy1NwLD6pvnTub8aH1iH1E2qoorq2m9lKTH/XyxhafQOpuhmRxA2+k6neKn+L
 ToxbRaPZj+UrXVmLUZMwSwPuXKCW99yxMCgSpGJheOcbt0PLTIUG7f2+KgRESzO1Ez0k6vs2
X-Authority-Analysis: v=2.4 cv=c8qrQQ9l c=1 sm=1 tr=0 ts=683637bd b=1 cx=c_pps a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=wKuvFiaSGQ0qltdbU6+NXLB8nM8=:19
 a=Ol13hO9ccFRV9qXi2t6ftBPywas=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=GoEa3M9JfhUA:10 a=NEAV23lmAAAA:8 a=ppRa4b31lDG5VPes5MoA:9 a=QEXdDO2ut3YA:10 cc=ntf awl=host:14714

Hello!

On 5/27/25 14:47, Omar Sandoval wrote:
> The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
> May 28th at 11:30 AM Pacific time. This meeting is a forum to discuss
> development of Linux kernel debugging tools like drgn, crash, and more.
> 
> Here is the agenda so far:
> 
> - What to do about drgn --debug-directory and relative paths:
>   https://github.com/osandov/drgn/issues/500
> - Non-contiguous kernel module address ranges drgn bug:
>   https://github.com/osandov/drgn/issues/501
> - Progress on porting crash commands to drgn.
> 
> Please reply with anything else you'd like to add. As always, if you
> would like to attend, please email me offlist.

To add on a couple thoughts that might be worth covering:

1. LPC submissions are now open -- thoughts on discussion topics, or a
microconference, etc?
2. Regarding crash-like commands - I'd love to divide up the work and
see how more folks from my team could help. We have a lot of folks who
"monolingual" in crash; building a bridge for them to use drgn more
easily would be something I'd like to invest in.

Thanks,
Stephen

> Thanks!
> Omar
> 

