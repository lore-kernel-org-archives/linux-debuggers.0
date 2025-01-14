Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2053.outbound.protection.outlook.com [40.107.22.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2746232424
	for <linux-debuggers@vger.kernel.org>; Tue, 14 Jan 2025 15:03:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867010; cv=fail; b=F/Ft2hQbTTsvekoEaHA4awudhO1uf/LQ0aOsIqcGJdKcpNtLAHJeqY1uYQF4zx3gYpFLnz3KuZquOF2Xun9pBXs4etgIa2IhKgA8F5l8SFNsL2ZJtQF/4vDtNCvcrAAfh8eWdr9Zkn9/GR859tVWsy0sdeqTLFf232OzdQyLyOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867010; c=relaxed/simple;
	bh=JSNRcPxMv+aZKAwooElQZ3Cwg9W2lLORf89RhfdPqIQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=AIPyBXBY8ccRBVIcO/PpkXSKssy+NwjP6Q4AHCdP6o6lX9AyWxilmAZE4WLiZK1aFYTApPEDT7m4++9NKDm9zokVf/zlHJp1xt5qLs7xFrme/dvZsmYmH8NRp5mpy8Mj4dMZrXGjknAkBqCrm01ZpdkBh6fbgBlAx+T4N4rynug=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=fc9EaBmy; arc=fail smtp.client-ip=40.107.22.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="fc9EaBmy"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=E4M0kfRGhq3A/wKtZxQrETjwilWkn8uR7KuZ6ptXBJIWryg/UhgMnahxlFCjZoS0YFUmhNj2hkDOaDcOk1TOLddzpeFLVLymGcPaEV1n+8sTArB3DUiBHtj/n4wino26cv8jbxRj48674eOjmv5CXpFBlm6SR8iUrHFOFVhSylovewdXnMnkmwh2egq1aJakwMnwe/276mu3PTqZyKPqmciWopF599M89g6m09x31Nx36/iNmmOssHKisYdBGD6AJAWVPmfWEsoB0Y5++w7Oc8D+TC/U0BIGzrSEpHwhnGH0G3lOtpq6lXf3HoS4amBENFrgJ7NhoOmUCYTQNnIXcw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=/er/JXqT1tuHy+2PqeYOovxzqAoExv61+t6Yk600Yac=;
 b=NUI7TzGDSXsb8TJoRaQ8XdqqCUqt+gi7D/3RtWNAhM5NgWOSGGXN2i97npbN/InSz5t5XHAUJpCrCPslu4nomnauN2AMVjmi7l306kYbJ4Gg4ErCy3FVE+SBBLJsQGv53+3QfGKSGe+wxx4qCtmybu39rPqVKO4L0O/kuwYrPZl44J3h2OUraWHvONbAoxEtLKsWs1cPwxCzCiTLIVX3kp/ME4zaBPVJE5TMVE0KNbIl0ZEtfx9bLUoNiOoZ7bBJSF0AFyjXJrQemPkS5mgTJGjUK/IFMJGP95X0ogoy4/wk1kOUIE+vr9InPMnhIP+o7LZ7meiUxE6AXnlYCXZ1+Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=/er/JXqT1tuHy+2PqeYOovxzqAoExv61+t6Yk600Yac=;
 b=fc9EaBmyqRNP9w0hQ+Ile2+rPGC4KwzVyjmaOoOgJz3RBophvnbicCy0nivUxLbm4v6jHCZHz16GBNHu5592+c6FT4eKBSqv8bwST2cKb01ubGxz50NI95GO8mkrPJ35qfCHgcPVcnPXQ+HABaJsJSP6QLS1+pURE+ez3D8+AwE=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by GV1PR08MB7988.eurprd08.prod.outlook.com (2603:10a6:150:9c::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:03:17 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 15:03:17 +0000
Message-ID: <5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com>
Date: Tue, 14 Jan 2025 15:03:16 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
Content-Language: en-US
To: Stephen Brennan <stephen.s.brennan@oracle.com>,
 "gdb@sourceware.org" <gdb@sourceware.org>
Cc: linux-debuggers@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
 Amal Raj T <tjarlama@gmail.com>
References: <8734hmtfbr.fsf@oracle.com>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <8734hmtfbr.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0446.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::26) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR08MB5852:EE_|GV1PR08MB7988:EE_
X-MS-Office365-Filtering-Correlation-Id: 51dc3fd4-c8c9-44cc-c08e-08dd34ac93cf
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cEpFM28vUGplOWJtVUowTW9yR255R3prM1paN1A2TG1qcDVRVlBjZUhETGRI?=
 =?utf-8?B?d29iSDhFeFBhS2gxZERON2hMbFNHTWl1SG15akkrczhnTE5aQ2JQL0F5dFRW?=
 =?utf-8?B?aURLY3BjaU1SYUw0Qnp3bXhaRkI0MVJyMkZKRG90MEJmNW9hbkcyQW9SMVNy?=
 =?utf-8?B?OGRuckEwTkxtMlo3Zm42Z2pQWGs0ZnNJeCt6MmNHdm0wRGVxNFJWN1BURzl5?=
 =?utf-8?B?b3JRNGY2aFpJQ3hySTJRcHBpdEJLMEdETjZRSjNvU3BZeEJMWUFSdldxQUE0?=
 =?utf-8?B?Tm5aQ1VwMFNxVk5jbmZvU3ZzYUJWWE9GakdGUHNsTmQ0bHE3T3ZKSm9yMVRt?=
 =?utf-8?B?ckFRZ0tOUnNlOVFZOXhvTEhVYnZFZllPNGpJRkdnOFlxUWxYRXdYcUFBeUkw?=
 =?utf-8?B?QldrYmdEbU5raUJoa3Z6bDlQcG5zZUZKaU5wZTZheHJWQlg0SkNRb1I0MDlq?=
 =?utf-8?B?dkpCanBBb0dkcFVqN2JDdGxVRkN6MWpmMi80b0NVNDIxdllwUDlmbDRxR0NO?=
 =?utf-8?B?aDF1MjZ0cUFCNG05RU9XZ1FnbDJGRCtoZlk4cjJOanY5bHpKR2gzRDV6aWV1?=
 =?utf-8?B?S0RsV1FBN01JcVhpY0VDWDZ5bGpDY2t0M3pwdEJZUXpBVkRKRlZGelI5WEVw?=
 =?utf-8?B?Z2x0bjM0Um0yWUFnbERUMUN0Qmw3YnlmY0pzbXRzR24vd200Vy9XMWlLMm4v?=
 =?utf-8?B?OWk1Ty8zQnFwdTdETWh6UUwwUlphVERmZ2YxZjNlclZQY2dmVEthZnk1K2Rx?=
 =?utf-8?B?UFlab090TGRTWmNjMmJ2Mm81N1hDdzd1S0xEcG1jNUJXdUU1TGdCa1ZWaHBn?=
 =?utf-8?B?VVI5cHgzc1V2a0x5amtIQkhBRHkyanNHbFFpSlBRb0FWTklIMWZjYVN1ZDFa?=
 =?utf-8?B?ZnBqVVdCeGRmUTNpS2czMkgzMmt1NWRxb0dXUFdWbzk2WTNWdVEwd3Jvank5?=
 =?utf-8?B?NWJpZ1pUNzQ5clR1SGpJQXVidTNKZjN5TUpvdWMwWDhCSStZb3NETytoT2F6?=
 =?utf-8?B?VXl5eHhNNzlLbCtBT2daRjVlb2dpY25oMWRIMDB0cEN0YWd1SWNueitkRmNV?=
 =?utf-8?B?OGJ5QWpJdGNMSGlOYWxxTEU1MlViZmd0Q0dpVHRJTnY2MkRocFFNQmliK040?=
 =?utf-8?B?aFlSYzZwNDVDeVRhY3NhcURQVm1WRGNGQ01DaUNZTWY5NzNuTWY1NEt6NVEv?=
 =?utf-8?B?T2VjVUM4VGZzcHNrUU15a24rNEpRd1BDS0Jubk55WU92bmpOOFAyQkR0RUJF?=
 =?utf-8?B?QmsvSEpzeWE2NC9CUGFlS2hBRXI4SnFHemR5TmpvaXZvdG1lOVE4R2lrMkg1?=
 =?utf-8?B?T0tQbEdxcGlleFVEdGlYeVdaVyszM0Z0TDhmelpxSTVLa1lmdjd2Y0hDeTdz?=
 =?utf-8?B?K0Zyc25QemVnVmVNR1ZRQ2srSkNxdldBalRqcmovdG5rUjFod2YwczFIMlM3?=
 =?utf-8?B?elZQWTMrbDd2MnBJTTZqSC80UldwTkdJdWliUXFwU0xPWWJURDdoRzMxV0M3?=
 =?utf-8?B?YkJmcFFSajhqV2E0elZEM3c2anRSUjgwcm9lUXMxeHNnaWZkOHZCcThvOGlX?=
 =?utf-8?B?aU5BaFJUWFcySC9vY3ZKMTJZREcxSHltZFpuOUlFNzJ1M0tIU0ZMdTdlTHNB?=
 =?utf-8?B?TFNrc2krWDM0MTgyYWQyMURsaDVkSTEyK3puL3U2UlgyUHVIVDFFd29mcXhZ?=
 =?utf-8?B?L01Welh0SnptUVlma2R1NlZsUEd5SytvMkRFancwRThJT0FaSFltdmM4dVJD?=
 =?utf-8?B?V2FCNDF1UThvZ0lQZlMrS0FDbDBJQ3hETUcxWGdSRW1DME96N0tZVVdwQzQ4?=
 =?utf-8?B?cE1penZiWWNKVnlOcE5mUT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bWJlZTUrdVdnRWhzd0xNNndwMXB4MFFwdHdSQ05hSzhKdFQ2ck1FaEM3R1pj?=
 =?utf-8?B?WTFETEo4bktiME1EdE45aXNEcmc3b0Z0VDVlNGxYZE1vZDBiTDlIeUdEa3E1?=
 =?utf-8?B?a282YmRXQ0FYM0Q5dFV3Q2JmN2cra0VjTy9LalIvam1wb0V6REVjVys0TW5x?=
 =?utf-8?B?V3k1NkYxNzZDYVBPMVV5T3lIcVBhdk9IbVpvbzJEaTJKUGZnTjNyZU1DcDdi?=
 =?utf-8?B?enZOWi90bUk0QzN6SFFTV3FVMEpRMWNlSXNDd1NDQi9ZcTNreGlWVVZYMFZ6?=
 =?utf-8?B?Vk1yQUxDeXdZQlE5a0xVbldJOGw2Q1pSc29RbXhzTmd0TERBSlhCUUgvaC9o?=
 =?utf-8?B?N3k5alZuSFJ5SDAxblpMTW5QQlhvM1JXL1k5ZTk0Q0tSL2xQRHFWcHVUeU5N?=
 =?utf-8?B?MFlUUHUzNHhuZTUvVUYvVDJON21aRTBhY3Y2WnhpMm1vUlNrSHBzUWdoSEZq?=
 =?utf-8?B?YmhLL2dyTk5VaFJDM2E2SVk5Y04rVDhHNHdaQ0xTMWtacXJPcW9QZEMyaWwy?=
 =?utf-8?B?YVpuSVdGekR3ZzRsdTFmV0pnc3RpNHZ1ZkZOMFlPODNIL3dpY0UxRFBoRVpC?=
 =?utf-8?B?TGRwM1lRdnhVOFVKNWV5OXhXUi9XVHhZclFSRDVOd2s3eTZXUGo2OExzQllz?=
 =?utf-8?B?THRwUTFOR1BMUnh2ejBHKzFMZG5qVWg3czhjanRWeEEyclEzRzVISXlCaVgx?=
 =?utf-8?B?OXhFRjlTMnEvbEl1NnFacWNNM0NBMmRFWDV4VDRuR0lhaWJ3T2w4TkFCVEUz?=
 =?utf-8?B?dnEwQWJMTkVlZGgxNWdSNUMrTU5KdHBQZkIyUnpabmw0NmJ0b1RWcUhQc0RR?=
 =?utf-8?B?UnJQWXE0TXNmTEQ5TkxRVFcvdS9aRW5wQmZrRUR5N3h6L08zbHVKN1g4S2xx?=
 =?utf-8?B?c2JmZlE2RTlZTXhuZkFkR0cvVEtpenV3T1JIT1JCMXorYnVpYmdpbDJGZFNV?=
 =?utf-8?B?YXh6WHJyeS84Q24rR2xja2c5VWE4ZjMxTFV0Q1VhN2hRUXlJMEtXRXJSQ290?=
 =?utf-8?B?Wit2YXV4b2ZwNFdFSFd0TERGcjRlU3ptbjZRUThna0Q5SlFSSkdidTFtNjVm?=
 =?utf-8?B?Y1BsNXh0UUo5Si9yZ0h6TFpwWWRxaTl2Zi91QjlqWDBjY3hqRkNtOTNWcS9K?=
 =?utf-8?B?WDdOY1JiWW5lNjJXSkRLdWgrOEk2MDdIblZmb3p3MFM2T3UrOHRMQkUyN2li?=
 =?utf-8?B?eUhaZk1HK3A4MW1kcytVMmlvL2NxS2tOcDIvRVdpNVZZakxmcWI4Rk9DREVV?=
 =?utf-8?B?SlN1Sk9KVnJBQ0Z3dXc2YlpTeUFTalpWenp6Ti8vckd5TTFlU04xeS9VNUZ4?=
 =?utf-8?B?QzRJK2I2ZG9pRjNiaUdkd3pyMitTVXZDcGgwYWxaZThZTmtIMFZkaENLanEv?=
 =?utf-8?B?R3VMeU9SUDkxanQvVXVUTDFMRzVnamNXaTNJTWZ3VG9XSkYzU2pFYUhJUTdr?=
 =?utf-8?B?ZmVwN005amJ5aVBucFc4Z2RnSko5SUVRb00vdUtINGQ5U2lOK3I1MVNmejZS?=
 =?utf-8?B?Q0ZqUUZrdVZRTVRBMitVd0hzNk9yUVNOVTVLcVhaN0ozM2lyQU91dFNKbTFE?=
 =?utf-8?B?SHFGTnZ1Q3VpRytMUW1FVzArTlR5cXkwUXZ5aityeEorZThWY2pSUWpFN0pn?=
 =?utf-8?B?WkRjdFNuQk9qUGtCSnI0ZFJHMjgxZllwUitKTkZ1b0ZJTWxBcHE4NkNGTW9q?=
 =?utf-8?B?cGdOVjZYVHB4SDNXS3o5ZkZzTFQyOC8yekFjK2dVQ1VsVmJWQVRrcWJsbmxT?=
 =?utf-8?B?THVCVllZTEpuYXFZa3hpTENtNHBEeE5ocDRXZ0NSVFNYMlhiRm5Sb3N5cTJk?=
 =?utf-8?B?ZWVCVGkwTjkrSGtFdUVRa2RmbE9CWkUzS1gzYk9pbE93RXI2MktSMCt0d1Nr?=
 =?utf-8?B?V2hNZE5QYzBUNVp3a0lmeGlBVEFoakVBOW43R2JRY1VaY3M1ZnZtY2Q1Zmp4?=
 =?utf-8?B?VzhDN1JxUnpBKzkxQ0RDYlJ4MW1xRnNXSUpaODJaMDF4QzcrZDJmUlJWN29C?=
 =?utf-8?B?SHNPeGNTRFVrS3VXbDhCdnp4UW1DazVidDU5MVRKMHc3c2dhYlNFc2U5V0U4?=
 =?utf-8?B?dGlCTnYyZ000ZWZLMy9vUlpUeE94M3JOTVhHN1A2MHZsTkRwYU9rRGNCZE9W?=
 =?utf-8?Q?6/Uwd0MFh14/dKUJLbun8O4uP?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51dc3fd4-c8c9-44cc-c08e-08dd34ac93cf
X-MS-Exchange-CrossTenant-AuthSource: PR3PR08MB5852.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:03:17.6531
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JvkMXF/Ok20S9dY5wjR62Dm3bIkVeU4TcBUz7giacMEKnlNPQwWAZSche8iDlptt40DD2xlF+N3Jd/GQrAEjSQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: GV1PR08MB7988

Hi Stephen,

I think you want either gdb@sourceware.org or gdb-patches@sourceware.org. This
is the binutils mailing list.

On 1/14/25 00:22, Stephen Brennan wrote:
> Hello all,
> 
> I contribute to the drgn debugger [1], and work on debugging the Linux
> kernel a fair bit. Drgn is particularly well-suited to the Linux kernel
> and contains a lot of support for it. It currently supports attaching to
> live targets via Linux's /proc/kcore, and core dumps. We are looking
> into supporting remote targets via GDB's remote protocol.
> 
> One piece of information that is very useful when debugging the Linux
> kernel is the VMCOREINFO note[2]. This is a free-form piece of text
> data, typically around 3k bytes, which contains information that
> debuggers would find useful in interpreting a Linux kernel memory image.
> In particular, it contains the KASLR offset, the build ID of the kernel,
> and the OS release. With this information, a debugger could attach to
> a live GDB stub (e.g. kgdb, or QEMU) without needing to specify
> debuginfo file names or memory KASLR memory offsets.
> 
> To that end, we hope to extend the GDB remote protocol with a facility
> that would allow the debugger to request this information. We've written
> up an idea for this proposal at [3]. The summary is:
> 
>   'q linux.vmcoreinfo'
>      Retrieves the Linux vmcoreinfo data.
>      Reply:
>      'Q [DATA]' data is encoded as described in the Binary Data doc [4]
>      'E.<text>' with an informative message if the data is not available
> 
> However, with the candidate kgdb implementation taking shape [5], we're
> becoming concerned regarding this design. It seems that there is an
> implicit maximum packet size which is not described in the protocol
> documentation. Many stubs have small(ish) shared output buffers. It
> seems to me that data which would be 3k bytes before escaping is too
> large. We've noticed that there is a 'qXfer' query packet which allows
> specifying an offset and a number of bytes. Maybe it would be better for
> us to add a new 'special data area' for the 'qXfer' message, and reuse
> that command?
> 
> To sum up, my specific questions are:
> 
> 1. What is the maximum protocol packet size, if any?

It is hardcoded by gdb, but the remote can also specify that, but...

> 2. Would this functionality be better implemented in a single "q
>    linux.vmcoreinfo" packet, or as a "qXfer" packet?

... we have packets like qXfer that can handle multi-part transfers. So the
packet size is not a critical concern anymore, and it is best to use this
newer mechanism, if the usage fits the packet structure.

> 3. Is it safe to assume that data transmitted in the qXfer packets is
>    encoded via the escaped binary data format described at [4] (rather
>    than the hexadecimal encoding)?

Yes, gdb uses qXfer to read the remote's auxv file, for instance.

  [remote] Sending packet: $qXfer:auxv:read::0,1000#6b
  [remote] Packet received: l!\000\000\000\000\000\000\000\000\000\0003\000\000\000\000\000\000\000p\022\000\000\000\000\000\000\020\000\000...

> 
> Any other feedback is welcome too.
> Thanks,
> Stephen
> 
> [1]: https://github.com/osandov/drgn
> [2]: https://docs.kernel.org/admin-guide/kdump/vmcoreinfo.html
> [3]: https://github.com/osandov/drgn/wiki/GDB-Remote-Protocol-proposal:-linux.vmcoreinfo-query-packet
> [4]: https://sourceware.org/gdb/current/onlinedocs/gdb.html/Overview.html#Binary-Data
> [5]: https://lore.kernel.org/linux-debuggers/20241210133448.3684593-1-tjarlama@gmail.com/T/#mad965a732c1c5e9e2656e4be79ffcdc36d89b7d1
> [6]: https://sourceware.org/gdb/current/onlinedocs/gdb.html/General-Query-Packets.html#qXfer-read

