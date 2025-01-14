Received: from EUR05-VI1-obe.outbound.protection.outlook.com (mail-vi1eur05on2042.outbound.protection.outlook.com [40.107.21.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5560723244D
	for <linux-debuggers@vger.kernel.org>; Tue, 14 Jan 2025 15:04:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.21.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736867084; cv=fail; b=uAi1YiFQDEPHusE17zHj7dUkqkMM8uQkFfVSELsgt13P70vHMSGpXGZldVGtIgQ/X/KiDQoxKUlSbz0AgnTP1NvHcgSFcKOZp3rQ9qL+ggKNTw+Qnz0F92HdIYcg8o0OZ7W6DQNcViEAODpiJ3tPctzmck8IjKCWDpztEXzvKrY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736867084; c=relaxed/simple;
	bh=Oa65oaLRe/cSup6vUYFhYB9rux2rY5B7+PV02TriUdQ=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=esnRy577K67n/io8aVAbVEHv+C9M1YImM/nbP8AjaXHpLMEOBg8hf9XVmpg5FiTaGFspWbenMEDHYtc7wTQz6HkrbcafPycgZPAr1DXfZs9FMdsBwjoLWZVRkx54lhzGaJhsDMP+1xOOLeko5+Pb+k9XIoSV2ZDQljnOzNU1JcM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=eEtaD0pU; arc=fail smtp.client-ip=40.107.21.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="eEtaD0pU"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=lh4nnYfugtC8ksoM8ffSJRYwPggNC7vMki0KqrAzJoZYWyvDCSaBm5PlRCNa2A6Z2hI6I//Pcybw22XVcCQF4XibNu4TzirPhe1RjruxD2cjvBk6m7irIM0JpQ3iP8izKZDDt1fl4ClyX7ZUGtVFSiDi+kxUkEe7xt4WHT4N4Mn8dtT6c0PktNMK815lWRk/NLCQkDntM8rP68st1jHHTxcDdcGjF76IgMvpVTRtLSagzNOdthq6GRDmfHuhI4yLtzoaxY9rTPY5diRZauEcpUn/pXhhw6IMQT3TI2y7/G2YxsCdaxQECaws/73ys7oSeuxqmyR8vYd146YRuAmXdg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pss2T9AvFgavgo+vXaX6Td1tYs1diIEFL0KSx7/gpLk=;
 b=DSEyplGwXqVFwPzMPkUxodekFpfKqKnSFeWcZcvVfDQImZj5KBvNFR4shFvl3lmdaP7SM7Xj/AbwOSMflt7srPaub7HR2Bbh652QxRYjU4JoZlgQnwjXUJ7FRS9Km6Gm/sVXYbbejTraRJ3aiEi5wtkTQbGZnQUKrL1p1pkh0p9DNeMQ+rsFPp6gI+yrD5DkVxnq4j5Ocgbkrxr3TDP1Lzd+KMKzrygNMa2ud06cVmRkdAUrymt1xYLVw4UAjbqtMp+GMXyHuh61P5oQqTGLyjmDfrhTkYtwQubqFEqd9I1fgfxmVaffryClT2YsD21dzieQ4Vd8HuPjKr23C5szFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pss2T9AvFgavgo+vXaX6Td1tYs1diIEFL0KSx7/gpLk=;
 b=eEtaD0pUn9o+zM3tQ+gGn4nspy7Bo6xyvUMTgEHTJRepTs+1tJu2MbhNm1X2m/ZUHIp9D4FP/nvRe8LJuxm1A3nBQEfb8AcYQzvmnlaCqh4oFpny75EyeE3zpmBmdBceCDUZ6aMCN7wDdXpNC3h1bMxaNYpnKyx8W4Nu8MuVgzc=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by PA4PR08MB6128.eurprd08.prod.outlook.com (2603:10a6:102:f2::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 15:04:37 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 15:04:36 +0000
Message-ID: <fc37036a-8016-43a5-bec9-5f154c35a5fe@arm.com>
Date: Tue, 14 Jan 2025 15:04:35 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
Content-Language: en-US
To: Stephen Brennan <stephen.s.brennan@oracle.com>, binutils@sourceware.org
Cc: linux-debuggers@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
 Amal Raj T <tjarlama@gmail.com>
References: <8734hmtfbr.fsf@oracle.com>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <8734hmtfbr.fsf@oracle.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO2P265CA0440.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:e::20) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR08MB5852:EE_|PA4PR08MB6128:EE_
X-MS-Office365-Filtering-Correlation-Id: 23028a02-ac09-4daf-540b-08dd34acc30e
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?blVTREhUeE0rTHd4djRIbGh3VzdFQ0NmV0tOOTNVUm5haVlqVzNxek9lNnFj?=
 =?utf-8?B?bUI1TXF1bTE1MDd2cFkwLzd3SzJKbzV0Z3B0LzlRVFhuK3dNZ0tjbFFWcVR6?=
 =?utf-8?B?UDNSaWxST0ZWVExEUDJ4NkFtYjhnMXJLblp5cXhyckUrZHZESHk4NkgzSkNL?=
 =?utf-8?B?MTFqaEpvMW54aHVYMFFBNGp2UnIwN01NSXorUzNEL2VZMFJJSk9HRG13K0xY?=
 =?utf-8?B?aFh0YmZzdmUyU2p4TW5TYW0wWEUvMW8xUCtYUE9JVUlLVnNuYUFHTWZ0Z2lC?=
 =?utf-8?B?aTN5WThtbUpUSDVlQ0xnMEFCK3h0ZjFhSElhSHlDL1lINzVkbE4vLzBCNnpG?=
 =?utf-8?B?TVJhUWUzNEt5dnFzVUpHcFAvTzdGQXNkRE9RMy8xUUNXaUs2a3ZIcjV5NU5J?=
 =?utf-8?B?MGt6a2k5WVR3K3QxMjZzS3NaTTlHY2pkTGFPY2N3NFl6RmNGRTJjSWVyNXg4?=
 =?utf-8?B?OEd2RktZMExWYnBKUWcvQnk5dFdFcVZoMnZrcnJ0NXdWRlZkeVAvalJPczFw?=
 =?utf-8?B?STNSd3RDMllmSjVONVNZaFp5bVh6Tnd0aERqV0kxRUhwY1VqOVROaTF6V0w3?=
 =?utf-8?B?OC9MbnpxOS9wTS9uQWQrYmhlY1RXQWNqU2MxS1hEZWJmditxdVRtNFZiWGdI?=
 =?utf-8?B?Q2UyVzRrK241U2hzTFpaRkJnZHRZRlkzRk5POVFNWVhUY3NzMERVVHM1UGIv?=
 =?utf-8?B?bU1KNlhuT1cyeFRJKzVZVHlYK0UvekIvaHBTbzZxQVoyT0JVazVjOVVUR1M4?=
 =?utf-8?B?eHZiY1Z1KzRPV2VpZmsyL2JCMnJPQ0tlS2VBa3lkWkd6OEVtcGh6V09zTzJP?=
 =?utf-8?B?M1RMTWFQZW5TSlVscGdlOE1rRWhRMk5wclhWVzZaVHlsR3lOR1c3NncxK2xz?=
 =?utf-8?B?ZjVvbmQrOVIwN3NGRHdGWjg5QWdURUN1OVM0Z3pjbEl6d2hHVkwvdFQxVHhX?=
 =?utf-8?B?ckNRMFhpYkszRjZrbFJWNUVsZXVyZHZxT1BiWGoxMzV4WHBoNmVRd1hnRFBa?=
 =?utf-8?B?QVVYNWEyVG00dS9hQjExQlRKSnNWZUp1NUkwa0FZcmRWWDZEOXhSbzJrcDcv?=
 =?utf-8?B?OVJTVVQ4eFQwOHVOSkpNZ1NsSTdSakxtdENicXB0UHd0U2JZVG1XSGxlYmFU?=
 =?utf-8?B?MzVhZ252K3V5WDV5b25KLy9OclFRQWJrZlN1M1JiamRsY3h2MHF0bE9QUFc1?=
 =?utf-8?B?NlEwWjNWckd3cysxamNHZ2daOTdQcVBrT0x3dWE5M1FUNTU2Yyt0Zi8rd1VP?=
 =?utf-8?B?a2w3VWpGV0ZhcHlIakF0YnNjK2t1aWc2ZkE4SE42bkRZT0UvK0xJTTFZcU1w?=
 =?utf-8?B?dGVDM3VWRktwNzIwaFE2YUVDb2p4NTU0ZXN3T3FVNWpaZkxlVVpwcGZVR2Zo?=
 =?utf-8?B?blJvSFFvRHZGc2V6YXA4UEVEMmZPZUdsODYxZ0tWMWFiMUxPWCs1R0pxd1Ey?=
 =?utf-8?B?UG1ZNlQ5SE5iV2Q2dW15ZmJsSEdNRVY5RUN2SldlRDE3UXN1bkNTWDRZVnN1?=
 =?utf-8?B?Yzl3eFBYSWxQRWZtTm5INEI2d09TNitNcGZMNDBkdWl1OVl6ckg2bEx3SExP?=
 =?utf-8?B?KzZmT1lCWkR3WEtuV1lsYkZJb0ZUS0Z5elFtUjJlSzgrcndCVW1BSDN1NE13?=
 =?utf-8?B?WGhEaVBpVlcxa2R0T3c2RW1jbnJNOUhsa0lkOXc1djhVa0l0bmdrNlVKeXp6?=
 =?utf-8?B?SGQwamdVUko4TGVaQkxjYmxOSHVvZkFaMC9LY1NzTVdlSXYvSlVLZmtuQnpB?=
 =?utf-8?B?U293UUVSWVRuNGIvT1VSSFBYUWZBRG5nSVVBcERKUXBZZTArait2c1REUTZD?=
 =?utf-8?B?bVZGUUlvVkVFSW5VV0xlZz09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?RE16bS9OczFUSjFCekZjNlY1NDZHL0lBZmFmb010K0ZWL1NqRENsNzdRTjBV?=
 =?utf-8?B?by9EdEFXSlh0UExIM1YzdHhSZytybXFwOUhjdDVMMFpVN1I1RWZobE9wa0ZX?=
 =?utf-8?B?eVJvRnhObk9zNGphM0I1S1FvMWlXRW5XTEZzdTRxNFJYdlRZc2FGckU1TFVx?=
 =?utf-8?B?Uk90dmVhcFFZRWZ2cHVVVW54OFFocG44VUZiMmRidkdsQStVK1NUVEVJdFZ2?=
 =?utf-8?B?YlNiUVRsTHhzbFh6SHFSQmtmbHVwNUtTakFhVW44MXM0TUoydmZFOWZESHBH?=
 =?utf-8?B?blhDZVZNTUFxV1NtaUdWczhvRFlaOS8wVXkwWnZ4RGpvMkFIVkFnYmMyYzE3?=
 =?utf-8?B?aEFyemdNNm5SVGhrdmNzYjVCTWd5OWdCR3ByenR3azJUV0pwd0VXM3JnUHJq?=
 =?utf-8?B?d3FNMlFzM3N4YXNIS2l1aWtRTXdJcnRRb0M3ZUhibGsxVFlHcXZpZC96T1RF?=
 =?utf-8?B?NFpaM0NhUlpSZ1duWVlQTFhLc1BsUXUvUWtVcjdnaG5jeHkxdWdzT2Rjd3Ez?=
 =?utf-8?B?MnNRQVZJS2dVSWxwMmMxYWRwUFhwWDB5eWlJVDNPaExSWTN6L3ZSV3kwVjhZ?=
 =?utf-8?B?V3hnZ0cvVlRYVVVIaDJVR1pGcE03VVlvcnVFWGhEeHpCOXg3WU04Yjc3bXBa?=
 =?utf-8?B?OVV5WllmZVN6Nkh3RzVDQVE0WUJpUkVXaXdnUTlBbHhxM09tQmpNYzRSeGFq?=
 =?utf-8?B?Y3d2dFo4aDRHMSt6TTU3MGJYbDBIWjJYRkNmdlUxT0E4VjY0MVA0eEdEVHFz?=
 =?utf-8?B?ZmNFTEpheGdnaW94UUZDRi9Bd1dzc3JmQm1ncjJoYmJKYkExT3BmMFR1cE9B?=
 =?utf-8?B?R2JDbCtCaGFSSzR4RU5LMERMOENyNEdCN1pXcWIxYS8vZGpYS1VhV0x6T1c2?=
 =?utf-8?B?WVdXTmx5K3UvMmR4aDNMMGVnUDMrWjVhNmJ0YmU1UUN5Rzd1K2c5ck9GaExr?=
 =?utf-8?B?SVBLM0F0SzNOcVdEYzV2VDkyS0RQeHN3SmtxSStpRlFaendTV3JpVG1iKyth?=
 =?utf-8?B?ellsWlllVXFnMHliVmdkbnpVRFNHbm1EbzNaRXBQdGFaZThRM08yRFYzZXJM?=
 =?utf-8?B?cUM4M2hQNFFEUFFKK3VUOFROTzl1R2ZOZ0Q1V2IyeUIzR2hHUFNESFFHSkVm?=
 =?utf-8?B?ZFdUNU5DNlYxTmptNDRSaTdlSk5pdm8vRC9TeWZ5ZjgxZ3p6cE9kbWVkRUJw?=
 =?utf-8?B?WHQwSWhOczF2NDFIOFVUM3h3OXVyTWtQTWRFSm9NVjFmcnBCVE5HZ3ZZS3Nt?=
 =?utf-8?B?RlBqM3lGc1k1M01uOWNRNnB3SWRZY3V4Vm1LcVBuc0gxRDNyR2FTQTNMRUhl?=
 =?utf-8?B?cW04empzWU9XQVdvT1BKQmxDalBtSkd3eVA3TUZHQ29CSUlMeGZHNjZvV3Qw?=
 =?utf-8?B?bGx6L1JPbmJaTWJ5TldId2krejRWNU9KRVQvdCt5WGpaUG03emVJQ1laN1NR?=
 =?utf-8?B?SnBaT3dqS3RVQVlnbFk1amNJek5EbFR6Mjd0Qko3cExSR2h5US95TW5Lek5Y?=
 =?utf-8?B?c3ZjQ1RoSjNWcHNkVmZlUnVGOEhqYm1zcjRnTXcyR3lGOVJ0d29xNTdZWHJY?=
 =?utf-8?B?U01GczN6TTl1b1oxK2dEZ3BvaUo0TkxyLzVWSWsvL25mR05MTEFHeWRnVlJ4?=
 =?utf-8?B?d3FzWUR1Y3JUUFVLL05HSjVXSlhqVUtZZ3k2VDFiVjltMnlwLzFQemYzVlhZ?=
 =?utf-8?B?WVlGNENCQ2Y2TnNzYlFkYXRUYlJPVHdZZFhZMVpubkhTanNSOHRaakYrNVlp?=
 =?utf-8?B?bDdzYjdzK0c0ekRoc0hkcVNZRnR3Q1ZrYXhHTEdTUDA3OVJ6M0lhSXJ4citr?=
 =?utf-8?B?RmdWamJxZW9DS29xZUgreHB3K0JPTTcrVVZxYzVRbE5CMnZVd3B5MnR1RC9v?=
 =?utf-8?B?UVd3V2tPQjVkMVBHTGEwQUhzeUJ5YWoyTk5iS0JmUVhjR0lZMDJNelh5Q3ln?=
 =?utf-8?B?WkVGaEY5QXZwQUcvSXI0OXhrMlFnYXBzQ0doRDlqUUdFbVhsS2ZhdHBFY0F4?=
 =?utf-8?B?Q0JjWndXMzVpRktIdUNRWXhLUWFaUUhoQkZSc3NJNWhuOWJHeU41dERISlpL?=
 =?utf-8?B?SXZ0OEtVWVJ4TXpHWFkxaWhxRzZNRnRrUXFNQ3BkcmVpeDFyWXY3MkRRMjlD?=
 =?utf-8?Q?8MXcRuVNqTWlbTS2ugvWVUlkS?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 23028a02-ac09-4daf-540b-08dd34acc30e
X-MS-Exchange-CrossTenant-AuthSource: PR3PR08MB5852.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 15:04:36.9031
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: T8Bxy0utt5k4B7fMq5L/jSyijIqz9AugZBEkj82bjhj/R95g+PVSgSpBQcUQm0jG1AMRvQdtPwJwCddfUoNqUg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PA4PR08MB6128

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
> 2. Would this functionality be better implemented in a single "q
>    linux.vmcoreinfo" packet, or as a "qXfer" packet?
> 3. Is it safe to assume that data transmitted in the qXfer packets is
>    encoded via the escaped binary data format described at [4] (rather
>    than the hexadecimal encoding)?
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

FTR, I've replied adding gdb@sourceware.org and removing binutils@sourceware.org.
