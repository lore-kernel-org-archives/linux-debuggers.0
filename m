Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B3FC36094
	for <linux-debuggers@vger.kernel.org>; Fri,  5 Jan 2024 22:47:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fjqiAAd6";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="GOJql0XP"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 405LpeiR021027;
	Fri, 5 Jan 2024 21:53:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-11-20;
 bh=fCj3nfX9gzT4UmvHMsC9gQBDinJcpsNxTPb0mVyhcOM=;
 b=fjqiAAd6lOWEfYV66Pq7KFsZv0MAmK7mdZ5xtkrw+OMumZh9AwVVKOpajmQnI22owBBb
 AqwN2NcD4LgMIhtWbjUQ6jHsGtp2Ik1PnKcLv/msp1FForAFNfDYCgRzdCBDVJ7hxwsM
 JsMEugLUGVT8rFT1y4+HORlyhhrAMCkKyz24i4ZRnS5Zl5sir965bOzdjOKJ5jASHaWd
 2qkLjWRAzAiRZN0hZ4LcjdEpL0QPKQjrdAMvBMyGECPWPhkiJ6SiN4lxPFcRUcLGbe1G
 XEy0uG3Oo8AUEWw5S4xwi9UiRSWw5p1wRwwI5j8nkLreAdB+dGk9DC1q4nGf1DQA4K3W Yg== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vet23g02h-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jan 2024 21:53:22 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 405KTDUZ032532;
	Fri, 5 Jan 2024 21:53:22 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2168.outbound.protection.outlook.com [104.47.57.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ve1jj6s26-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jan 2024 21:53:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=JLyaI1pwPs8Tb1oHdlVO9GBdpr0lMx7ruJYC1S9+sVOVBsZ8re2HPxq3xOgGTGwNJbYz/htQoROGmHj4qTylTiB7LVE79TbL+pT3B1Ul+3hycfq49TQ/2MU6zK3qEzzJmugssb1MsltKNiM9V/rtEyyGoyGVNOU0FnxBiTHdyBHBJKe1YgMi49osb9QKhOXIwUAjDsllVK7JRuVU1qIIyFC4PMbBGE0dsnIezlFlLvDE6jQgLaIK/YPQOD6wbiVdhhp95c1LK7ABqjcAOOV7jSPenouVnV0KanQqOoyMXw656s2CwhI7VI2tFy4BSn+Dm6McLNiCTIRwoC9u/B1dFQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=fCj3nfX9gzT4UmvHMsC9gQBDinJcpsNxTPb0mVyhcOM=;
 b=GoNnSg/J3KEl7d9eaEVvHxeuuT8MzwIPp4Mc1siOoiiqjFyFrqgv2aoZdO7vDizj5xctgtpQiviFVlNrOpBDLRDeZkse5mByGqWcM57MbBT4Z17yddWqxaQZZVRuqYPu9JPexbuWbhEaSaNHXVSlryZJxpdRHOWpLTkifph6uX6gzCHO18hTx4p6K5VS+g0+qviToTUg2R0osC48AmFLccnYk0VrTz37fB4W7YcHM8dObQd+MFBiU3kUNcAgbeRHzhImaW+pjbxBLQuP9LPWDnfyC0hSsMcICSALRMKwktLIDwEUPW7MNavt/md4+U6XZT7I9raXhnHmmTB2xBq2YA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=fCj3nfX9gzT4UmvHMsC9gQBDinJcpsNxTPb0mVyhcOM=;
 b=GOJql0XP7whKXPSjOdBK5Oh/Pj08IufGm/6jPKhSP7M+zCovGDW7aow9EjFdqVLEzwJ7/k7ff/H9P9pPHkZNVIvcxPzrp7cyZKEL65vdvgwiGJSUgtV78teLlvt/iewcTfOb++T9R2WLZPMg6AGdwyLIzHKSMyg1rmNG3WbWVE8=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CH3PR10MB7281.namprd10.prod.outlook.com (2603:10b6:610:12e::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.13; Fri, 5 Jan
 2024 21:53:17 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::c53e:b817:b563:8044]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::c53e:b817:b563:8044%6]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 21:53:17 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Subject: Re: Segmentation fault with drgn + libkdumpfile
In-Reply-To: <20240105202339.09db6ed5@meshulam.tesarici.cz>
References: <8734vb1v8n.fsf@oracle.com>
 <20240105202339.09db6ed5@meshulam.tesarici.cz>
Date: Fri, 05 Jan 2024 13:53:15 -0800
Message-ID: <87zfxjzbuc.fsf@oracle.com>
Content-Type: multipart/mixed; boundary="=-=-="
X-ClientProxiedBy: BL1PR13CA0359.namprd13.prod.outlook.com
 (2603:10b6:208:2c6::34) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CH3PR10MB7281:EE_
X-MS-Office365-Filtering-Correlation-Id: 8948ed88-71f3-4637-6a86-08dc0e38b95d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/NaUyP/4BEeylA/GpvXT5PDhVHGWL9EUSLLrs/fpKqP2/sqB02lu8eFZH4WLNpD2Qmq56z0EdokQrj3rDuw62jlYVHGQN2/5umHHSOI16ahKRbI61fFKxNTejVBh1vu4t3tw2frNnE2dmHX1Kv3QZ6g3Za1lzlme1ZLGJ2+od3ZVVp7DErayxiCOz4gt5v1d51qNIpCHxMdXoddYrWThCLTeMS4FNNvX7+d/LbFU1DvIeoGozKH8zGlsoIWM2jBRjKAGdUDLVk+2WEY8DdGqa1osaOTHF0nMBXkQcPdME/ECiJrhY9ravrjDOKNnA3aIwziyh+GRCmVaW7FXTvvTOH6OQx6csypncB4D3rnMCfywdY0VvAxyiEjfRwAqTRWvZ3E4Fb710utDkcHEYEb3HzPZiUgbzpTMt5vOLqFpUTY/aXcm7aEC0t5aeokZ2M0TyPd6ixeaax+M2/3otEcfQwF3bt7qdSyQoapjtxZZWfmKSNsZn1A6A9MabPmYMd9Q
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(366004)(396003)(376002)(346002)(136003)(230922051799003)(186009)(64100799003)(451199024)(1800799012)(36756003)(2906002)(86362001)(6506007)(66476007)(6512007)(6916009)(6486002)(66556008)(66946007)(33964004)(38100700002)(2616005)(83380400001)(8676002)(5660300002)(478600001)(4326008)(41300700001)(8936002)(235185007)(316002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?RzF5eFhuWTErTVg0cGlxN2c1cjBnTmFxaE5heDdiWkpMWTVta3p5S0RYM2ZQ?=
 =?utf-8?B?aTVzVDhUQytRTHI4V1FTSmo0SHV3MFhHT1pyaWJpZUJBbjdKdTlmaThrSGFj?=
 =?utf-8?B?OWRLMkVSR20rckJha2paQW1DWTNCeitwcmJMN3lLN0t5cmc2ZThvRzBXOHg5?=
 =?utf-8?B?RlJrQjFicTFXRWRDK21XV2tOM1JOQVNoS1RlZ3Rjd2ZDZnhpZGhjSjY3N1Jq?=
 =?utf-8?B?dnVnMHJVZHBkNmtyZmVtbm9oWE5ndDhrZ2d3NERiYlBXeWRpdlpDUGh4MjZJ?=
 =?utf-8?B?SCtuWTVrOTFpTDZJUG5yREwxeE5WcHJOaThDVVZ2WmNuVWtwM3NsNUZ3L05h?=
 =?utf-8?B?R2w3R1k5cUtPUGcwWmJkY3N4Ymd2bkdzREpZa2daMUJRZUpUTVVLVUtYZDl0?=
 =?utf-8?B?bHBqT2UwclR5dTJmTVp6S2Ztdy8xMmdiYUVscTlxUGtkcEVleTdkaTVRR3RT?=
 =?utf-8?B?ajYzUEFYVUQ2L2lpRmZyT0I5TC8wbFJ5ZmlmaHNUL1pMVVRwWkhxc1I4djVX?=
 =?utf-8?B?UHhVbWRLSDJWR25jNWkyT2t3bWxVK3V1OXEwb1czWGM5dG9XTUVIdzRPZU8x?=
 =?utf-8?B?bkMwRDhWblA5NXpEejQ1SFFna1gwZ2dPOGRuRXFmWGF5QVJNQklLeXlleW1s?=
 =?utf-8?B?UjBCNGNITzYySEo0elQyVnJxNHprTFJQNHAzVzMzNHdNcndidVRvVlhyemFt?=
 =?utf-8?B?SER4SENyZzRTK3dwVkxMLythT3M3NGRPdUhMZGp4NTc4REd5YmtabjNxcWJR?=
 =?utf-8?B?TkVtL0M0WkdjYTVmQlhWZ0xlQUZocmxFeEk4eWhxSG10Rzc0azNQVjVNeDlu?=
 =?utf-8?B?aTRScFdHWHltdDBERGkwSVBZWnd1eVFsWHViQ0cvT05xZ0ZrQzluK1JPOWJN?=
 =?utf-8?B?WXhicnkySEk3eUgvSkVYTUQyVm5ySWVOTk9zNEI5Z1k4bDg0ODVBemZHYU9D?=
 =?utf-8?B?SUxjcks0c1prcjhIQytpREtadlR2Z2o2UzY4UnNXbHJEUjRuaU9QdGJZZTIy?=
 =?utf-8?B?RTc5bnFsK21qQUR1L2U2dUJlS3VFK2NEa0JHbzcvcXJoL0JhejhhZGp1eWMv?=
 =?utf-8?B?ZjhKTWltWlcyUVpucUFQbFdzblkwV09BdjUwQS9JWEtESFR0KzZYSXNjVHFD?=
 =?utf-8?B?Uk5heGQ0TE1kcE9pbnBTMFl4cnNKcnliWHFsdmU1c1d2NHlHdEVSTE05TkpR?=
 =?utf-8?B?NCt4eWRYbldoRlo2Mko4Vkhac1FhTG9KS3FqaUEyL1lLVnNNZkszYzVoSXFl?=
 =?utf-8?B?eVBoamJLWFRDQ0V4OW1vQkt2QXYyTjQ2Z3RqWWdtR0RCZkJvakhad1EzKzRn?=
 =?utf-8?B?V3ZhQzBRZHM4eDA5ODJrSnBwNndncktMWE8xUG1FVUVEMEx4R0RDK25TNFZS?=
 =?utf-8?B?cDRpWVNQaFVzb2FwUUhDcS9saDBEVk56eEp4ZkpUMVg0NDNxZXZUOWNXY20v?=
 =?utf-8?B?N2FMaVVEVnRNbDBsVmtnRXZDWGZYZzR4NEpTejgxKzlLOXlGMXJCeUJzN1Zn?=
 =?utf-8?B?VHJEeEYwS3UvODFqNVF6RzdMY1BkWEU5NkdaT0FFQWJiMW5RVHJuR2syZnRN?=
 =?utf-8?B?Z05OL3FDZDVoQ3JGNlMrN1VaM0d5cU8yb1pFelB3N0VXdy9GYXJzc1h5SXhU?=
 =?utf-8?B?VGZxNi9XNDhnbHlEakNxR3J6aENmTSs0UUxGcTA4MGFZQzM3NXRMdi8rNUEv?=
 =?utf-8?B?YmpxdVAwT0ZVV1NiOEpjUGxERzF0Tkt1VFhSZ0JlalBSOUwzSlNyd2gzUnNK?=
 =?utf-8?B?L2s0eGpxcWNoUWlHK052ejB0SXdGNkRhVkdTNHMvcVVsdGhweFdsR1V4QW9H?=
 =?utf-8?B?M2VYT0E5OElZQXRtQTlNbmpyK0pWRnM2eWJtUWRIY1RDRitOQkN2d3l5V1N0?=
 =?utf-8?B?MXdoY2phQ0NDT2FoTDl4VjNQWHF6KzJpYkxnQ28wSkxORHJsZVJCOGd6UGF0?=
 =?utf-8?B?cC84VjFXVlZYOU9PTi91NzdBQlhraXpjUlZSR0RpSC80VExIV1gyRFJFSDE1?=
 =?utf-8?B?VEo4SkVYT2p1M0RLVVpTR1FmaGVpQ1ZRREpLenZacDVBbUZOckZpV0d0a1JL?=
 =?utf-8?B?OENmWnJWeEtyVGNHQ0s4VWVWMXUyMjd5ZGllcndWdmtqajZMRVdmMkFWNzIw?=
 =?utf-8?B?V0puUUVpckp1RmtNekpJT253Qy9SbWk4US9ZUk16RUJLajQ4NFc1MEN2L1Mx?=
 =?utf-8?Q?6Dc+x2auWR7R1Eo9qhi3YuK6ay9fYrVHTnDzmdZfelOQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	kT2rwuGB/Nhos+hmRBU31kxk6dOmK6klaqHS8hioA8wLz71UNongdJYSB6JOQUI7N2ocY22LMgHUvwKY/8gckpgyFXZoBC/jRh8OPp6mGdgD0oiASO39r7e9JNTSw2ui/0X71jcb6UqbhTqocql9hVdSokD8H7Z9PSktid5H4ZFhh/28B6IvTBMcgIv1JcfWjHByGNiHXzyjHqI3smrI679EWoqtk2s8TexY9ONXcIlQU4znO9QAu/fWlysf4t8309R5AHxYZCAG7tTuioHAdVjCA5hHeua6Z3yI64GtlMj/5PxQZXuB1ynnxKkkuHgrbdcykfXpXNHsXCnn/qnCViOqgGBAks/MfU0XD0A4cqdDZWG8qCpPVwlnq6SGBLG5//tLbsePkUghI8iNbm843CvjcpPOY2VydVLHuQcQ7eRByCgPwgPDonyJ+283eJNQYrN7ZGRzohxDHSHlc5Sv1fkOIHX+2fmUAZjvQXUfPvlywddm0xCpTKovmIU0+7rslgW7nG92nGAlVJeW+7m31gOK8jw7FJTuaobEExt15CAue2sI7XwD7WPcGX5rL+vFVaK0boX3y2ZEVjwfw7nXwbDtj5HvBNHgKka+6qIUNh0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8948ed88-71f3-4637-6a86-08dc0e38b95d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 21:53:17.3066
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: kreLxbJVwJFc6OMI+gcLq21ox+oqcHtftRArbCSqc4D+gjxf8mXglU0gCCiv9YrSEqQUiqeWhEpfTYStUD769q6TUWIaQmh/PHXpTuRsb9k=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH3PR10MB7281
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401050173
X-Proofpoint-ORIG-GUID: ut60hvkL01L3q2TlUeiR4DRjtUZWwg8Z
X-Proofpoint-GUID: ut60hvkL01L3q2TlUeiR4DRjtUZWwg8Z

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:
> On Fri, 05 Jan 2024 10:38:16 -0800
> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>
>> Hi Petr,
>>=20
>> I recently encountered a segmentation fault with libkdumpfile & drgn
>> which appears to be related to the cache implementation. I've included
>> the stack trace at the end of this message, since it's a bit of a longer
>> one. The exact issue occurred with a test vmcore that I could probably
>> share with you privately if you'd like. In any case, the reproducer is
>> fairly straightforward in drgn code:
>>=20
>> for t in for_each_task(prog):
>>     prog.stack_trace(t)
>> for t in for_each_task(prog):
>>     prog.stack_trace(t)
>>=20
>> The repetition is required, the segfault only occurs on the second
>> iteration of the loop. Which, in hindsight, is a textbook sign that the
>> issue has to do with caching. I'd expect that the issue is specific to
>> this vmcore, it doesn't reproduce on others.
>>=20
>> I stuck that into a git bisect script and bisected the libkdumpfile
>> commit that introduced it:
>>=20
>> commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6
>> Author: Petr Tesarik <petr@tesarici.cz>
>> Date:   Wed Jan 11 22:53:01 2023 +0100
>>=20
>>     Cache: Calculate eprobe in reinit_entry()
>>=20
>>     If this function is called to reuse a ghost entry, the probe list
>>     has not been walked yet, so eprobe is left uninitialized.
>>=20
>>     This passed the test case, because the correct old value was left
>>     on stack. Modify the test case to poison the stack.
>>=20
>>     Signed-off-by: Petr Tesarik <petr@tesarici.cz>
>>=20
>>  src/kdumpfile/cache.c      |  6 +++++-
>>  src/kdumpfile/test-cache.c | 13 +++++++++++++
>>  2 files changed, 18 insertions(+), 1 deletion(-)
>
> This looks like a red herring to me. The cache most likely continues in
> a corrupted state without this commit, which may mask the issue (until
> it resurfaces later).

I see, that makes a lot of sense.

>> I haven't yet tried to debug the logic of the cache implementation and
>> create a patch. I'm totally willing to try that, but I figured I would
>> send this report to you first, to see if there's something obvious that
>> sticks out to your eyes.
>
> No, but I should be able to recreate the issue if I get a log of the
> cache API calls:
>
> - cache_alloc() - to know the number of elements
> - cache_get_entry()
> - cache_put_entry()
> - cache_insert()
> - cache_discard()
> - cache_flush() - not likely after initialization, but...

I went ahead and logged each of these calls as you suggested, I tried to
log them at the beginning of the function call and always include the
cache pointer, cache_entry, and the key. I took the resulting log and
filtered it to just contain the most recently logged cache prior to the
crash, compressed it, and attached it. For completeness, the patch
I used is below (applies to tip branch 8254897 ("Merge pull request #78
from fweimer-rh/c99")).

I'll also see if I can reproduce it based on the log.

diff --git a/src/kdumpfile/cache.c b/src/kdumpfile/cache.c
index 826d632..1f5820b 100644
--- a/src/kdumpfile/cache.c
+++ b/src/kdumpfile/cache.c
@@ -33,6 +33,7 @@
 #include "kdumpfile-priv.h"
=20
 #include <stdlib.h>
+#include <stdio.h>
 #include <limits.h>
=20
 /**  Simple cache.
@@ -531,6 +532,7 @@ cache_get_entry(struct cache *cache, cache_key_t key)
 	entry =3D cache_get_entry_noref(cache, key);
 	if (entry)
 		++entry->refcnt;
+	fprintf(stderr, "%p: cache_get_entry(%lu) -> %p\n", cache, key, entry);
=20
 	return entry;
 }
@@ -549,6 +551,7 @@ cache_insert(struct cache *cache, struct cache_entry *e=
ntry)
 {
 	unsigned idx;
=20
+	fprintf(stderr, "%p: cache_insert(%p) (key=3D%lu)\n", cache, entry, entry=
->key);
 	if (cache_entry_valid(entry))
 		return;
=20
@@ -584,6 +587,7 @@ cache_insert(struct cache *cache, struct cache_entry *e=
ntry)
 void
 cache_put_entry(struct cache *cache, struct cache_entry *entry)
 {
+	fprintf(stderr, "%p: cache_put_entry(%p) (key=3D%lu)\n", cache, entry, en=
try->key);
 	--entry->refcnt;
 }
=20
@@ -605,6 +609,8 @@ cache_discard(struct cache *cache, struct cache_entry *=
entry)
 {
 	unsigned n, idx, eprobe;
=20
+	fprintf(stderr, "%p: cache_discard_entry(%p) (key=3D%lu)\n", cache, entry=
, entry->key);
+
 	if (--entry->refcnt)
 		return;
 	if (cache_entry_valid(entry))
@@ -669,6 +675,7 @@ cache_flush(struct cache *cache)
 {
 	unsigned i, n;
=20
+	fprintf(stderr, "%p: cache_flush()\n", cache);
 	cleanup_entries(cache);
=20
 	n =3D 2 * cache->cap;
@@ -709,6 +716,8 @@ cache_alloc(unsigned n, size_t size)
 	if (!cache)
 		return cache;
=20
+	fprintf(stderr, "%p: cache_alloc(%u, %zu)\n", cache, n, size);
+
 	cache->elemsize =3D size;
 	cache->cap =3D n;
 	cache->hits.number =3D 0;


--=-=-=
Content-Type: application/gzip
Content-Disposition: attachment; filename=cache_filtered.log.gz
Content-Transfer-Encoding: base64
Content-Description: cache_filtered.log.gz

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
ZKIfuuZpKcvazJz7Ao5cA4464LjMpndCxtOkpE3tjVKTPpmZPTGpSbtF6jKxd5CMLk2bZVKTFS2x
I4G00+SeFm0WyQxWdp7/kboDQ7w3VWQWLTRZ3yCzB+FzGzva9LlNavGLYaJnYlos0jchb1YUI2mz
96K/hvXZ+89ur389fvuaWDI0XUGTWmxJNV0E0wUWD0eZe9o8uC1Sk+ubbM00fbL5ci1Tau+AS32i
TlXUdcBxmclCA5nAED0y006bNisyRoqdNqnFNoi7arL9Bt8Guy9vk468zT7gy6XiJ19iLnNbK059
mbJ01IrriONKW4wvg9lgJuMs0k6b+X7R+yY9MnJPi6tbZDYzg+ZRXlTWZG4QpTaz36SHgsoa3ddi
H13UL2NXn3pXk9RiLlg8NCQyixkUsYcOjThIanFPi4f1Tc9brGiRlXlydYu627TSKDWZQTD7bVBZ
k/ta9MrIy7JIr0xc3aj2Jtc3Sk1aarOnjIyrUQ0udorOaXoSU6vKcp+HkquHUgcclxld36TVEjPg
IjO6pyM/CMmapCajDnRfkx64aa3F9U3mEsjzHKKkxVqHqLvFUw2o721SR02LyQ6a1KKlNiMOk1qs
acUZRCTKAiMO00qLq1uNOMS8t0otRpek1TLXN2mrzTjL3NWi/lb9MlLWqAYnVzhpt8Q7X0TmNU9L
WdY2D9zngOfqgNcBx2UO7R3a+9zaG5U12UenUpNxh9npT65wMXOU1jSna2qNdd/yLnV51wHHZUa9
UZKa/IaB6YGT61u0WaakUWoy6hDzopFBcSItc1dH76Syq+MsCxN1mP10JrXpgZPUZN5oTtt8ndpP
iW19U2916mPEgalJD0X0Rf/Xl/L+A/wshg7QKQcA

--=-=-=--
