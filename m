Received: from EUR05-AM6-obe.outbound.protection.outlook.com (mail-am6eur05on2065.outbound.protection.outlook.com [40.107.22.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C331DE3C7
	for <linux-debuggers@vger.kernel.org>; Thu, 16 Jan 2025 10:49:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.22.65
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737024553; cv=fail; b=MwwMd4IV6UfvUMBH83wo+xJGdxCvQ5QBafXmRr8Ll5QAMUuW49ifEvB+N34Cy374XJndKsBsG9inTk6Xv+T5Kl/skMLxhlfGwvFnLNEFkTw6DV+JtxkvSewMU9XyHzPpq9NgoRDWBnWhXP0q7s5Q9uZy0sVl9Z/Ny5sIDZSQAF8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737024553; c=relaxed/simple;
	bh=EIzzuZgV9nVr3PBZ1Q9ZZ1XHlB/0pSVEvJLvGekBHLI=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=UKazLP9Pndk/KWoiwnBjAMEhdfEG3IrkmTkvtCK8gCRDL6rgUQLvJgbcz71s/EvZkipKNnUBDnWlcPsMd+YB1vy8q2gd1NxfhiF9K9CFGMBCbe6skvEfIhaleq9G5kIdFBObQ1rc4Cr8NA6H0Ls41fsOTBy7DOTlpfVb4Cd+WKQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=iyC50Of5; arc=fail smtp.client-ip=40.107.22.65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="iyC50Of5"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=LjoVPgb8VwYNtXQ8Gy/yggIi7/89Mfsk0n+nf75szOduZqdQuCCc43PyMPOK9t/xX3C2zwIpyk3dU9I3Mj4pNi5oLS3J+yXVtdwQIkH7XEoW409lXURc77MWY+X88KVx92ALMZv/ZdckUKRwRORxRE8y8klEYgHh6Jdl12e0uSrEzGmIjYU/B1+kx3JuL/Ly0TdqAYyHYnUyUjq7/50ejDC1E5ecCrA/Xj+OYqVj5ZupAvU73ssA09mKs4XTZ2UL7zYXi3r2Wh7vxH1vv3uUEf4JkqSROx3XRRNoEaEIMy+yU7j/rkMTegW2gO2DlLZNJb2j97EbmOMIF2swUDhvIg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gsGC/c1DDfZQ3RyBdv6tidIIZa0kltRPi4mSWa2RrEo=;
 b=juONVJXXUkjP/U3H58XG+t8/+PmjEMuJ3wJdxbfwv/GJEO8NQBM9XXQmcJah+TtZplyYOfD/BhttVQ8ARw2dKbx2+da3z30ElzxX7uHacV7G8I1ZAhIM49EmIkdiPCdrDTMDrCwB0/XFRiyrXSGO4R6qX6SiMfc6kRMj0/ZRq8wxMZCx/hOQTkwz3Zghc7XrAucEBh91IGQuhKXiWJIsWlnOoK6DEsoiHm/dNL/tWvY27wsewcFouoZw98NOEN2SzZh4FvMEkNbIxv3yOUAoe0LewkgUd8ZRAv3wmIePW/jbvC7VcUFPd7vqa0YZ37cWRZNxFB6x2hCSG/SuWEzRzA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gsGC/c1DDfZQ3RyBdv6tidIIZa0kltRPi4mSWa2RrEo=;
 b=iyC50Of5UpsPz5zc6suUtaySuOTIfhSGF2AsJt0KC/XILR0hgKDghcyr/2Ub6atw0lWqlrgHwrxiI0wQ1VnV8M7ZvEr7dMVnRVNOPNK3jxlrjiG5z0bowRm3/zQvWAWcg2cMzgET+NxxzOK0vcNw4fC6+ZHbyHCbgrs01v6pkfI=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by PAVPR08MB9186.eurprd08.prod.outlook.com (2603:10a6:102:30c::16) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.14; Thu, 16 Jan
 2025 10:49:04 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 10:49:04 +0000
Message-ID: <a119598d-51ce-44ae-a315-aa07c8fdb987@arm.com>
Date: Thu, 16 Jan 2025 10:49:03 +0000
User-Agent: Mozilla Thunderbird
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
Content-Language: en-US
To: Andrew Burgess <aburgess@redhat.com>,
 Stephen Brennan <stephen.s.brennan@oracle.com>, Tom Tromey <tom@tromey.com>,
 Luis Machado via Gdb <gdb@sourceware.org>
Cc: linux-debuggers@vger.kernel.org, Omar Sandoval <osandov@osandov.com>,
 Amal Raj T <tjarlama@gmail.com>
References: <8734hmtfbr.fsf@oracle.com>
 <5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com> <87plkpqpuj.fsf@tromey.com>
 <87y0zds39y.fsf@oracle.com> <87cygnoxi2.fsf@redhat.com>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <87cygnoxi2.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P302CA0018.GBRP302.PROD.OUTLOOK.COM
 (2603:10a6:600:2c1::14) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR08MB5852:EE_|PAVPR08MB9186:EE_
X-MS-Office365-Filtering-Correlation-Id: 6948f25e-0e5e-42af-593b-08dd361b6505
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|366016|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?bnl6Zkt2Y1U2YzRhbmVFeXpwRVF5Z2dVbEU3SFVGZzBybS9MUDJWT1FQTHlh?=
 =?utf-8?B?VFlTOU9YTzg0Yk5TNWZlVld2ZHBicHh2d0gvK2JtT3dYcDlIOWdwcnZjV2du?=
 =?utf-8?B?dzFrNlpkaCs3V0syQi9hWG1sdlR1djRXNVlickozQTJ4d3BmM2VuaExyc3Jx?=
 =?utf-8?B?R1NwMXZHeHhFZVl3cXU2TktUQjlVTjlMQ2Z4M2Z0WDh6YzhLbmJEcE9rSjc0?=
 =?utf-8?B?Yk9mZUxic3JLaTVrRi9tdTB5TlBleEdWRHdrQSthMm1OcEs5RmxjZTFVTTlt?=
 =?utf-8?B?NVAyaWlxUW1DNDc5Zm9PRGZ2Vk1UeEdKMjRrNHRJYVVUYmM1VkQ2ZkhBV1VS?=
 =?utf-8?B?TWk2dzloT1JKYkd3emdoUzhRcWcwNTBZWW5RbXVMMTNrTzdhN0gwSDJSbjRJ?=
 =?utf-8?B?bThwVzhqVnlib1dHWWowNG40ZTJnU1RzNDdQTitFSlc4WEIveVp4TkZPSFMy?=
 =?utf-8?B?NGVtUndxVUFDRzJGaS9OdHdCQlpyV2xVUDNBQlRnVGg4OXVvSm92TzJUYUhj?=
 =?utf-8?B?ZUd1Nnhqc01IMTRGYU5RQ25UenVkbnZxb1RYUEFyMnlxaW5HMnJRUjMwVUpM?=
 =?utf-8?B?TWpWWnNLM1VSTXRhYTdPS2UxbzJrR0FZaGMxNXlldTV2Q1lPTUQySGdxWWlt?=
 =?utf-8?B?RFpvSTBTaUZqMS9GN0hxeXg0dGU0RDRROThzVkFyejIwd2ZDUU5zamd6VEFv?=
 =?utf-8?B?ak8wRUU0dmR5bytvdk1IR1EwRzY1T1dZZ2d1c0dKb2RCNW9JTFlZMG1sS0pW?=
 =?utf-8?B?OHRKdit2RlVNVHgxUm15UENYc3doNzhveE9JdTBFWDhZUTBaa1lZS0ZCWk1j?=
 =?utf-8?B?YW9lMEVsV2h4dzVLblUwOHNLWUowaEZJeXpZemluY2JPVmUvcmZ4UkUrK21k?=
 =?utf-8?B?V0hoV050SzFlWmw1U2FiakplMzRZbUlKbE1nZC9PVzRsRTZIN2pBMTd1WkM3?=
 =?utf-8?B?ajBBQnNOdld6ZTh2WVBoRmN2ZGVDTlloTWZzQnp6MFhMOGRhNUNUYXhXVVdC?=
 =?utf-8?B?aGM4V1Rkems2NFRLS3JUSFZXR1R1UEJhQ0dtRVNPWnBQd1Y4STROSEpNOUp5?=
 =?utf-8?B?Z0o4SHlSQk9uTmxwM3RMekNUOXJIeEhTemZ0QldLUjkxV1BYeWJZQWNoekxD?=
 =?utf-8?B?Z3ZzTlQrUStTZ2loUmNWM1A5U3QwV0tRM1RQakhqUHpwVW5lVkE0c2RuYzcw?=
 =?utf-8?B?cVFocy9Bb2REZk1SY2gzd0NyVDFJeXZ2azd0R3Ftc0hmRGxPTVhNN3pTOXF1?=
 =?utf-8?B?bFZ2dStSN3E3bGJGWE9BNEdkVVBLdlpWN05IR3Z0cWJzN1dGYnRwMkFEVmNi?=
 =?utf-8?B?KzJvU0dycngweThyd1ZHN2Q1ZlFnbkZ5K21KVk94YzVmdVBscjhoSXNNK1NV?=
 =?utf-8?B?cFlDTkdreVFSYkVVaCtIM1dVRnQ1V0s2VTlqbEc2NWlkWXBaVmVSSC92MUVw?=
 =?utf-8?B?eENDWnUvRzFHdDZSUWpycTltRFNGTWJESzNSNzVpK3pVcXd1SXl5NVphK1NC?=
 =?utf-8?B?WVRBeWhsS2N2YkpPbDgvY0F5WUZNQjBscmVHNWw1MFdQYy9UMFpHSVV4NWUv?=
 =?utf-8?B?QzNvamhUa09YS1o4TVNSOHN1QkozM3V2Zk50MC83TTV5N2lJN3BhcFZhWmk0?=
 =?utf-8?B?a0xrRXAyaVV4N0dpSDRyWk5BYlJBLy9TdzdvZlZieTMwd0FhaGFlRE5EeDVz?=
 =?utf-8?B?eU9IZFkrdXhDSEJvKzdNckZhUHRUWjN3RFdja0R0MVM1Wm1neFBGYURzYytU?=
 =?utf-8?B?QnZMOVJDU1EwZXdOV0NIcHdzeTBRSEZwNjJrYXRVdENFOU9nUXdsNlJLMFZn?=
 =?utf-8?B?djV6NmF4NTA5eFg5RzRHWU1uaDg1ek0rOTJLK0UwSEt5MWJlNE9rN3IwR2h0?=
 =?utf-8?Q?39syKRRrBh9KU?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?T1NNbzdrYVBOQm5UWXZKRHlVN1lmeWljZmZ4M0duTG8zZVp6VXNVZFJyWTE0?=
 =?utf-8?B?b3VyTWV5L1hzVUE5eEV6ODVtMTNUWjRWS2FpamF1VE1RMEwxbDl6T0M4b3VS?=
 =?utf-8?B?S0Y0ZUFRaTkzeGFxbDZNMjFTeUxaSk5NTk9nL05pRmpYY3ZKY2ZKeDZKYkZj?=
 =?utf-8?B?M0lkVTh1Y0laOWFvZDFuRUY0aW5vV3FLdmZNTWVnZ2VNeWpZOVd5aG1Nemo0?=
 =?utf-8?B?SEM3aVkwNEVDeWxrRVBybWo2RU01V3QzK093azVhM0cxMFUvbEsyTXJkcTdG?=
 =?utf-8?B?UGlRMnNnbzJIL3A4eVZFN1FKcWhJMWVsUmd5S3JKMW55SjNiSHBuN3d0dEQv?=
 =?utf-8?B?Zk4ybnp0NUhVOG1zb0dxOWFTcXlzUFRTZVV0RkVZVmx1U2luSU5Bb0FmWGxI?=
 =?utf-8?B?Z0ptaWNHb3UrRTlHME13MnluWjR5Wkt3V2lEUm52TGFTNzQrOW9yR09ZcE15?=
 =?utf-8?B?YWdpVHhvZHE4eHFkNHRJcHB5aklRRXhxYkNjWVBFQTRaNUpvK3dUdUIxNmc4?=
 =?utf-8?B?ZEUzT2ZKRW5WamplQ1JITUk4enFoU0ViY2ZReDJwd1F3WFJaRjZYRzA4QjJ1?=
 =?utf-8?B?NGpieXBKUUlhb1JiNTd5V1JRVUQvM1NsWitIRmpieDJ4aHIxQjJuSDBlT0p6?=
 =?utf-8?B?dFV1bno1SHNWQzQ1c3hiNVFxN0FMZ0JLcEExLzBFWUhMYUJ0VzZnMFRxM1Uz?=
 =?utf-8?B?ZWUyekMxOHAxaVV2cmdFRkZkTG9UQ2Q5MDBwMkZHalJwVXlIRkxVWGpzNGZ4?=
 =?utf-8?B?bHEwN1NzWlovZStyMXB1Z3gvL0d0RXhEZDVYQkU5WkI5VllUS2Zja0hjR1VU?=
 =?utf-8?B?Nmxmb212a3doSWx3T013dzF0V3h3Nk9CNFhTVDhBR0VPVGNPVHBSTWkwTWhW?=
 =?utf-8?B?N0FLSXNtNUNRREFqUjhpOFRDMHR4Y3I1Q1lFa1dqRGVRUWJYMG1Dazdxa1ln?=
 =?utf-8?B?SWdnQ1NaUWEzTnhCUW1Eay9ibzhkT3BBSEJHclcvbGZ2TWd0ejQ3d283M2Zk?=
 =?utf-8?B?THc4R05PTjFZL1MvNTNLbThhVWpQTTliRVFqbkt3NGZ1bFJNTFdxQXRpOVYy?=
 =?utf-8?B?bzY2Sy8xeWQrVXNUT0U2akw4Qm84OXFKaDdYUUlFZGJmVHZBTGJCdllUQjNU?=
 =?utf-8?B?aHpOUFVablhpZ1N3U3pWMW9tTnB2S2VWc1RPWXFXM3ZiYk44ZEVMN290Mmpp?=
 =?utf-8?B?dm1zMllUQnRhUXNQd3FGbTdTZGxrM1FJS2tCNTVTcHcwdWxDU0J3ZWlEeDVv?=
 =?utf-8?B?d3FFSUs2b3l4ZTMxcFRGM0VGV2R6OERWVDhJYndTQVdyMmZuUkExNWFwTGFh?=
 =?utf-8?B?b1NyMTBheHhETE9MS1pPUlVwUXBmbi82U0EyMHZTb3lGeVRFMExDR3haS3B3?=
 =?utf-8?B?MFNFRUJtUTlDUEJKbU1QOGo5azFBdjg3cFliT2dqbVk5Z0hQcDZYRGg2M1lo?=
 =?utf-8?B?TE1DTmhZRjJ6T3lWWUZiSTQrWk5ia29xOXIwMHljWHBRL05HSFVaYkNrTkVS?=
 =?utf-8?B?aWlGVEcrSmJvQlljTGM3WTZLaFhSdWxSM2Q1SU5HRTQzNTBaZWdGRktlWWZa?=
 =?utf-8?B?WjFuVkV2dFdlODMwS053T3huZ3VXVE1HOXhhdUlwdi9zeUZoYWxmMDgxWHZF?=
 =?utf-8?B?Ny9pQVh4RXBmVkFWM2NuV1dsSmkxVndwQ0tDaGJEY25GVWVyMEZGOG9lWFFK?=
 =?utf-8?B?Ni81NVhHSjF6NVQwYmpiK3grZm0xR1ZVZDdxYzU1blB0M0tSaktXZkR5bnp5?=
 =?utf-8?B?NW50WWg0UzJlRjR5SVdZcWx6KzY2b01lWXNMZ2Fka2l2QnRRdU9YOVp0RDVz?=
 =?utf-8?B?QjVIWFA0c2hIeXB2SUpQT256N0gya05KSnZwb0ZiRmVKcURjVFJ5MGQzOTZW?=
 =?utf-8?B?eDdBa05ubmVJeEFZTitjck1TMktVYmwwdGVBa2RHZHJOTGhtRWFOVm9tV3Rp?=
 =?utf-8?B?aWgyMnNva2tlZXpCQVEvZ1g0TXBQZk1JN05QSjUzZVhvMkpiN0dFSnZSZVRt?=
 =?utf-8?B?ZWZZWHA3bzlxc2dpRFcyRkJpTEh4NW5wYUdNcTJLcTZ5cHFSNWxGUTVlbWVQ?=
 =?utf-8?B?RDRXaktldFBXSFdMME1MOEY5UEtvcHNWeEdKUTRjazJ6Unlqc0NrcmNnN1lY?=
 =?utf-8?Q?bXcgljQVfnazNIlk9aymPv3SB?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6948f25e-0e5e-42af-593b-08dd361b6505
X-MS-Exchange-CrossTenant-AuthSource: PR3PR08MB5852.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 10:49:04.4374
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: RC0ngPjXVnI9OgM5WqWwzCVLsFXPrICNy+T7ogDTOPU3oyn710H0TqfweG3tTNu41VSlb0jLXxnHpqL9NhCFrw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PAVPR08MB9186

On 1/16/25 10:37, Andrew Burgess wrote:
> Stephen Brennan via Gdb <gdb@sourceware.org> writes:
> 
>> Tom Tromey <tom@tromey.com> writes:
>>>>>>>> Luis Machado via Gdb <gdb@sourceware.org> writes:
>>>
>>>>> To sum up, my specific questions are:
>>>>>
>>>>> 1. What is the maximum protocol packet size, if any?
>>>
>>>> It is hardcoded by gdb, but the remote can also specify that, but...
>>>
>>>>> 2. Would this functionality be better implemented in a single "q
>>>>> linux.vmcoreinfo" packet, or as a "qXfer" packet?
>>>
>>>> ... we have packets like qXfer that can handle multi-part transfers. So the
>>>> packet size is not a critical concern anymore, and it is best to use this
>>>> newer mechanism, if the usage fits the packet structure.
>>>
>>> Agreed, qXfer is the way to go.
>>
>> Thank you Tom & Luis for confirmation, qXfer seems appropriate. With
>> that approach the buffer size is not really a concern: we can simply use
>> the minimum of the requested read size, and the stub's buffer size. So
>> long as clients use multiple requests until the data is fully read.
>>
>> While the "os" object also sounds like a good place to put this (e.g.
>> within a new annex), it seems like that contains XML-formatted data with
>> well-understood schema and semantics. The vmcoreinfo is free-form text
>> (generally of a "key=value" format), so it probably should be a separate
>> object.
>>
>> So I think we would prefer to add an object type, e.g. named "vmcoreinfo".
>> (But please do speak up if this sounds like a mistake)
>>
>>> If you're adding a new object type, a patch to the manual would be good.
>>
>> I'll definitely include a patch for the manual in the plan for this.
>> Another patch I'd like to write is to allow GDB's server to expose this
>> object type when the target is an ELF core dump with a VMCOREINFO note.
>> We're hoping for this to useful for all debuggers, not just drgn.
> 
> Hi Stephen,
> 
> I took a look at the wiki page and it seems like initially at least,
> your plan is to make the information from vmcoreinfo available via a new
> 'info' command.
> 
> It is possible to send remote packets through GDB's Python API[1].  And
> of course, the Python API allows for new commands to be created[2].
> There is a test in GDB's test suite that makes use of the packet sending
> API, and it happens to send a qXfer packet[3].
> 
> I say all this not to put you off contributing a patch to core GDB, but
> if what you want is a new user command which will send a packet to a
> remote target and process the results, then it should be possible to
> implement this as a Python extension.

A bit off-topic, but wouldn't that have the potential to proliferate
remote packets gdb/debugging stubs have no control over or no documentation
to point at/refer to? Possibly contributing to greater confusion as to what
should be minimally supported in terms of remote packets?
