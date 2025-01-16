Received: from EUR05-DB8-obe.outbound.protection.outlook.com (mail-db8eur05on2059.outbound.protection.outlook.com [40.107.20.59])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC3B978F2B
	for <linux-debuggers@vger.kernel.org>; Thu, 16 Jan 2025 17:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=40.107.20.59
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737047754; cv=fail; b=LMqb6ZIBxS1aqlqhvGI4ZVTjowziQydYTK7PnN07cxgi8yqjpzGuDDjryy/tkszu0aSoPtN4zwaRS1wcLfKtt1kwYPp7nSS+mhnyImcem9XkJhIAUwlMNg2jxfrrYSFbwsW3YFcjA+UQcMpXYXrq6v2rgFYKqbMYylP9lPB8D+0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737047754; c=relaxed/simple;
	bh=3Za0bFbYe9S3ZVrMcUnLXBo1O9Szpi6yL+Mtq3hmPd4=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=usCo1vHGVyE5TApBU0ZsqHu3z5E6URHSbeqpeUDQ21SokQnnDMv4KOvyJg1QfWFXAGVjnMDJyOj1NCcdnqjBahPMqpE29Ojd5aqZeVdmBc4vaXSDXcLO48w0gUBWkiCdP1PIOQyHBMa/kek3ohnoUe7lQolDFJVVzKji0IIcZpg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b=pA8IfRlN; arc=fail smtp.client-ip=40.107.20.59
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=arm.com header.i=@arm.com header.b="pA8IfRlN"
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=xOQI8l9EUUejoin3rL0ANW5sNxw3v3RPCGppFlrlGfWlXPixgZeUYii9Q+uZ1NaSr8iQAhXtbmtK16T++d0sQQyr+StcSmGoje/mhv3qN6CuQCyumcz9cKdPLvwkwVR0XaulgxItu88bsUytzfTIJFmk1NiLIO01E0N1yDvhP6FISncObRvlsEZ1JQ2LKSbx2QcSkLxSATMHrpZIEmuJHySSJiGO947IjpO4bG1WXywnrGiQ8mtcN8cKHHDyOMaaSGVLIm+CONQ3QWrb3h056Q0RGVuOGBNUICrxMO+Iczz4l3F3fUOnW7qM9dgBNIGePIT9dOqif/uDOconxtbKNg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=k0WxG3Ob89VFM0v+BkbMiVUJS5UwdN1quK9zT9k254k=;
 b=GB9lHlntI11Maw9qhVaN3+av8lh4VgI+5nRDnSbNxKCZqW9Mt2comanPGrbyHE5n45tJBA5Enq979lgFeVPkjBbiEaK2LgupjXMweXJfnq+bgGwMt2/RyiQ8DLgnU1eIit/2boHoIUVG77/GPN9Z/a7FlpNDl9UMgWWhNfn9KwGpB7/rfZOdvEl0TB6zegTB0Tuc86CFY1UsxA//gZcnJ1iuPzn62J1YRSMZVnls6COYvnqcUiRooY2hp71Q56a2hB6NLLwPHrzJIoKFZkaDiNY5+dDl99tQdXWwa96csAiPpeE7mcUZX3cS24MQ41iUF2qW+tANJ0k8BpbZF5OugQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=arm.com; dmarc=pass action=none header.from=arm.com; dkim=pass
 header.d=arm.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arm.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=k0WxG3Ob89VFM0v+BkbMiVUJS5UwdN1quK9zT9k254k=;
 b=pA8IfRlNI0zywPMDDa97xaP8cTLIQ5wBvuJTEgRUMZcYMynS6NNmcM7sUUlK/gpbj9d2Sx63aRyWgEzFqzMyCDRr4IP9VnDU/1Q0+uv2i8JElkK2AzcmIKYNlFYRR9A1we1l1v9OwlKfmzuP3UU//O25UdF9AtH+ZwzoKcOzAEU=
Authentication-Results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=arm.com;
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com (2603:10a6:102:8e::21)
 by AS8PR08MB9717.eurprd08.prod.outlook.com (2603:10a6:20b:617::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Thu, 16 Jan
 2025 17:15:45 +0000
Received: from PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d]) by PR3PR08MB5852.eurprd08.prod.outlook.com
 ([fe80::f44:d113:1c29:825d%4]) with mapi id 15.20.8356.010; Thu, 16 Jan 2025
 17:15:45 +0000
Message-ID: <a6160f3b-8b9a-4e38-922a-3c026e26e275@arm.com>
Date: Thu, 16 Jan 2025 17:15:43 +0000
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
 <a119598d-51ce-44ae-a315-aa07c8fdb987@arm.com> <87y0zaogoh.fsf@redhat.com>
From: Luis Machado <luis.machado@arm.com>
In-Reply-To: <87y0zaogoh.fsf@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: LO4P123CA0584.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:276::15) To PR3PR08MB5852.eurprd08.prod.outlook.com
 (2603:10a6:102:8e::21)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PR3PR08MB5852:EE_|AS8PR08MB9717:EE_
X-MS-Office365-Filtering-Correlation-Id: 34a856cc-592a-4887-d9a7-08dd365169d8
x-checkrecipientrouted: true
NoDisclaimer: true
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?VTlyVkpubTd6VXY4eVA2QS81cEgxd0tEMWlTWWo0aXVpWThpL3NHa0NWOGVm?=
 =?utf-8?B?OXA3UEJubjVySGp3Y3FvWEU5dnNHdzhHNlNkL0VTd3RUUS9RMzZRMVdOb3pC?=
 =?utf-8?B?ekl5emx5L09aT29sMlB2dytlSXZXaTVIT3dRWXdnMXUyVGdUQ1ZrTENpemQv?=
 =?utf-8?B?bTRQeXBjZ0V5bnNxU1Boa1Q4NEk3UzJEaVgzTlp1VythamZLN1l2a0kyR1lX?=
 =?utf-8?B?d1BBbkpsMHZDTXFMeC8wNkVlSDM0cTNzRVA4SEpZeWYvSUlJa3RRdnVUdzhX?=
 =?utf-8?B?R0MxRlNWUG1OdzBzT2hkVmRjT05NZDZaMWdya3dDWG1NQkdKR1BJZE9JZERa?=
 =?utf-8?B?b1E5cVBYbTlNMkd0UFRLdWN4dHRSeEV5L0ZvWWJHNnI4b0xHakptenhFNHZa?=
 =?utf-8?B?TW96cHFkV0xMOGg1eFl3aFc1aUhxRDRoSHBvUTZLTEl2WmpFV3J2VVVmaTRt?=
 =?utf-8?B?cTdJWEhJMmVRMndrRjZRajZKVVVKL3RiVmZ2YUlubm9YTTVQcFpuSFdRcTVL?=
 =?utf-8?B?R2hOY0ZnZm94S1Vyb3VBcXoxVUxXRVlFdW1Eanh5TUZTNU1jNUxBR1YxT2oy?=
 =?utf-8?B?eS9lTXJFNHFoQ3o4cFBMa24rL2h0T2Flb2Vha1FYQ2xzM2hNek5LVlg5bUNv?=
 =?utf-8?B?WEpxVitPNUxiTXlZS2lvZStTUncrSUxqVVMvRis3REd4OXcrcGZRc2cvSTVq?=
 =?utf-8?B?bnNpZUZkNkx3MEJwRmFBMzlYNEwwOTBrVXBRNXlJTkVtVmI4MlhWdjFkMjNY?=
 =?utf-8?B?VXk4di9VTW51dE5OdldGOWI3eEtzeTNFN0dOOHBWT1F0bCtCTU9sanpiNFpa?=
 =?utf-8?B?bzcyVWZNVGs4cFRvaDNKZUkxVHd5b2JMejZEWjBhUXplV3NwQUhEcWlHMVJL?=
 =?utf-8?B?ZTdkWGVIMDBEUXlKS1k3WVJaMjVMZjJRcTVSSStZRjBaWlpsc1VXN1M5MlpN?=
 =?utf-8?B?V2htV2R1WTZYSTF4ZGRIdlhyQXllTXZVdk80cU9VNEM0dW8rSy95dk0yTjUw?=
 =?utf-8?B?OTAzQTZqaWtTMEw3cVlSakYxVkhsSDVISHFJK0MrbVR1QnJjMFVDOHVsREZY?=
 =?utf-8?B?aDlCSmZzejJLZjZsNVNqeVhabW9WMDFrdkdhdXZHMDRJTm83R2pOb2p5U1hI?=
 =?utf-8?B?MTlUZWZVWGIvMVZlMEZmc1ZYdE9TZGx0ZCtwcHBtbWRkZzlVbXprMnBoTnNa?=
 =?utf-8?B?VWtYdlhDRFBxY2p3SWZwUlVmU1lUTWNIajJIaVZMM3pYUGdwRy8wcG1rZm5F?=
 =?utf-8?B?M1JUcVEzRGtHR2o5dUVlSkFJUFdmNWs5bkcwMkl4VUFYTllBUUtNalhzZ080?=
 =?utf-8?B?VkZGYzNsdDByVTZEQ2kxc0R6dGVCeHoycTJyYnJMU2JrNnNkNXN2U283N08w?=
 =?utf-8?B?WjlxelVJZ3pyWWhrM1BEeS9WWjB4SXY0cjd5L0FYTjdOSW51QjFmYkR0bFl6?=
 =?utf-8?B?T29GbWh6R3crZzhqaDZDUU1QS2FabWpTa0UzQ0hwclFMeFQ1eEFhS1FNTk1L?=
 =?utf-8?B?cXlXYkU3dEhNdnNpMFFrWjl4SFppUmVrNjBpWkZjSHlrY2JqcGVsVE5PaUVq?=
 =?utf-8?B?QXk0QlNrQk1PYzVrNUhOVk04V0NRUFRsUUdUWTV4aDlZQnZHbFhsaFBBc1ZQ?=
 =?utf-8?B?L3RDcllFTlhBMzJyRUxqTEtaV0g4MU8rSU1YYjlPcndrenJIbzAzUjMzWkdj?=
 =?utf-8?B?RGhzTi9HbmQ0bE1DdFRoeThrQ2YvZHNSNHdvaWYxdXk1QnBkTHg5em1icURs?=
 =?utf-8?B?UTc5YXoveE1pR1VINDhnckZ2czlvTXBRd2VqRHVRVXJhaVF2QUlSN1ZzWEdm?=
 =?utf-8?B?K01GNFY5S3A3RE9zRVkwRi9XQUF0SGRWMkVnRkwzYjJyMGgvTUlVUTViS21o?=
 =?utf-8?Q?99IcvWVYozgyK?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PR3PR08MB5852.eurprd08.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?bDZub002K0NMbUZWK2owRjdxQTdEVkozOURZdHd5QjFrNEVOMzdSdkRrc3Ni?=
 =?utf-8?B?MTRLZlVZUDU3L010TXl1ZVRSdG5neVcwd1VmTldLTFpmS2taVGFuOGZnWGN4?=
 =?utf-8?B?c21TMWZ2TFFxS1FUZG5YQUVac1VkT1QyUEZua2p2TTljV2pabTVGMDZTOExI?=
 =?utf-8?B?L3J1dUVIa0hPRjg2bTdROFp1TG5KWTNjUEhMckFQN0wyRXdlbUdjL1hzVWhI?=
 =?utf-8?B?WVVYVkxkQi85dzNOTjlFOTVnakgzdTRENGNXUVQ1YXk5VzRoSFZhUncwS29V?=
 =?utf-8?B?R1M2aWNrZ0ZaSnlxR29BTlQ3RmZreElWVy83VGY1KzhGSWNhKzg1SVlRTklw?=
 =?utf-8?B?NzNLT1E2WUhGQTBwa1JBMUFCT2ZnVytpdk1GK3NuV2pvVlJQTVZZOGdyZ1Jw?=
 =?utf-8?B?NU9DUnFvMDB3akhEQ2RvU1Vzc3A0eEx3NVNOTkhBVUwvN2pQdndpcVVwQ2Rj?=
 =?utf-8?B?YmhkZE5hZk5Xbkx2OFpIVHpNZzdqR3ArZU9ZNHpXYkx2bXFRQlJxeUtTeWQ2?=
 =?utf-8?B?U2Y5d3dPZytNZzlFY1R0U2w4azdpeEhlNnY1NmJHcXV4Q25QZFNNQXh0QzFY?=
 =?utf-8?B?UTJJOG4xR3NaZnFpZFdrSUhsTDJRN2tEdUdhSzRZMldka3BYZ0N5SVhsZXA3?=
 =?utf-8?B?NHBScS9KSERwb3NORDJPQUVvOEQyYmI0ckJ0QkRVMXBKYlY2QXFHMk5TYkpk?=
 =?utf-8?B?MUExVmlWNm5waXdlWjlTaGV1cHJONisyVGcxdXk5R24yejNvaEx5Q0M4UTI2?=
 =?utf-8?B?M3JrQm9RTXFDdmgwSHRYMjJ5UDBGbThrUzVMMXVQM3hpajdpQURIVmlHcGt2?=
 =?utf-8?B?d2pwMWxCZWs2TGpJTTl4QXI0dE1TYzQwU1Rqc3dNeWZOcDQ0MmZIN2ZsRUpl?=
 =?utf-8?B?U1puTzErTDlBbU8yL3FrSDVTTHgwdmF3WjNVVm9OaW8vUnZUODhlcjBXa1du?=
 =?utf-8?B?ZW1FaldlcTM4RmJxMnorVVo0eUtlL2lOUzFlRUViRGVhRkhjYXBsTHJ6MHVa?=
 =?utf-8?B?ZTRYUTFFK2FncHpRSDYzdVZlZVpVYmhhQVZNaktVYU9UeVVFamNFdUJ5Nm1S?=
 =?utf-8?B?YVZlR1U5UEhSK2l3NFJRcU05WjE1eHJhTllvbkVHZ2RqUVl4UzNVdGlLaURx?=
 =?utf-8?B?czFmdXZzNG1vLzV2NGlwYjU3Ynd4aXFKUzA3djR5UTRFZUF0VFI3WUhsTHZP?=
 =?utf-8?B?a3FKZnlBRlVHSFlnakNxSWZCNFhETHBFM0FkTHI5NHduRmVQN1NoSUtLeW5u?=
 =?utf-8?B?SmpRYWplR2ZIOEl1Sk9kMllsL1lGeU54NlFHMXNhelBwa0FCcDdKbzdXckM2?=
 =?utf-8?B?c0lPVCtNN0lTZmhKTVI4RFZRNTRGd1JwWEJ4MFBOR1llUmdLYUZTbVI4VVRD?=
 =?utf-8?B?QTFYbFdNOHA4eVcrMi9SL3hxQis5aGh5ZXJ0bjU3RnVSS0srY3RBYnRiY2VQ?=
 =?utf-8?B?L1U2UjkxM0JMT0ZSa0hqbEd0T0hBZjJtYm1VSnlXZ2pDRTMzZC9iMWcxUlht?=
 =?utf-8?B?aGkvSGR3c2E0WmMwVVpWSWRrM1cwYjVqdmNaZDRIY0xienI5d0tJSEp6MHIy?=
 =?utf-8?B?L3lkYU8vSGlVZXBqdTRDSUY4MGNDdHNmcGpITzIvb1ZZbmttRG1rdmIwM0NJ?=
 =?utf-8?B?ZVdMWC9PRlJBdzU3TE91RHFISXV6TENLZU1OajBqdTZCcVFMdGNZZUp0N056?=
 =?utf-8?B?dFB2VTRuZFpITExLcUVjby9pRXdJdWRpc1FjYmJGUHpXaERqOXp2cHR0TnJG?=
 =?utf-8?B?czBPL0hQbzRNcWh4NHBqR1dGMGE4SW45U1dOclIxZmVxOUtGUnE1dFdxZ3kx?=
 =?utf-8?B?OEZWRkZUUmxZRzBzdXZkc29TbmF2NURSNFdmR2hMdTVTd0FPbXRiSkpONTZu?=
 =?utf-8?B?amg0MnZobWphR0NzNmhYb1JjVjlOQW5tYTVGZ1lOSVV6STBBVlFJTWZjN1J1?=
 =?utf-8?B?MEVOcTU4OWJULzdsQmVYWVM3ZWpkZTVESWFra1pRT2dyUVloYTQ0SFcvMVE5?=
 =?utf-8?B?NEFCU2ZkNXR2aHo0Y1IyaXRPZlc4VlAzQmRtVkRwZnpTVDZUcnlLVDgreTJD?=
 =?utf-8?B?eEowWFR3blczNkNHRGpWejdOWUdNY3BZaDJTK3FpS1laU2xYMlJ6aUIxcmY4?=
 =?utf-8?Q?YmaSfxHFcqEJfkOXYzVTqzMcy?=
X-OriginatorOrg: arm.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 34a856cc-592a-4887-d9a7-08dd365169d8
X-MS-Exchange-CrossTenant-AuthSource: PR3PR08MB5852.eurprd08.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Jan 2025 17:15:45.5969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: f34e5979-57d9-4aaa-ad4d-b122a662184d
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TQWoemW3RlxqsSx8aVGVV4PEvMtf/Ze6shS0rGr8ccRFDYAFTKx4h8qAWULTarcZpguSckvtImXhLIae5iQnRg==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: AS8PR08MB9717

On 1/16/25 16:40, Andrew Burgess wrote:
> Luis Machado <luis.machado@arm.com> writes:
> 
>> On 1/16/25 10:37, Andrew Burgess wrote:
>>> Stephen Brennan via Gdb <gdb@sourceware.org> writes:
>>>
>>>> Tom Tromey <tom@tromey.com> writes:
>>>>>>>>>> Luis Machado via Gdb <gdb@sourceware.org> writes:
>>>>>
>>>>>>> To sum up, my specific questions are:
>>>>>>>
>>>>>>> 1. What is the maximum protocol packet size, if any?
>>>>>
>>>>>> It is hardcoded by gdb, but the remote can also specify that, but...
>>>>>
>>>>>>> 2. Would this functionality be better implemented in a single "q
>>>>>>> linux.vmcoreinfo" packet, or as a "qXfer" packet?
>>>>>
>>>>>> ... we have packets like qXfer that can handle multi-part transfers. So the
>>>>>> packet size is not a critical concern anymore, and it is best to use this
>>>>>> newer mechanism, if the usage fits the packet structure.
>>>>>
>>>>> Agreed, qXfer is the way to go.
>>>>
>>>> Thank you Tom & Luis for confirmation, qXfer seems appropriate. With
>>>> that approach the buffer size is not really a concern: we can simply use
>>>> the minimum of the requested read size, and the stub's buffer size. So
>>>> long as clients use multiple requests until the data is fully read.
>>>>
>>>> While the "os" object also sounds like a good place to put this (e.g.
>>>> within a new annex), it seems like that contains XML-formatted data with
>>>> well-understood schema and semantics. The vmcoreinfo is free-form text
>>>> (generally of a "key=value" format), so it probably should be a separate
>>>> object.
>>>>
>>>> So I think we would prefer to add an object type, e.g. named "vmcoreinfo".
>>>> (But please do speak up if this sounds like a mistake)
>>>>
>>>>> If you're adding a new object type, a patch to the manual would be good.
>>>>
>>>> I'll definitely include a patch for the manual in the plan for this.
>>>> Another patch I'd like to write is to allow GDB's server to expose this
>>>> object type when the target is an ELF core dump with a VMCOREINFO note.
>>>> We're hoping for this to useful for all debuggers, not just drgn.
>>>
>>> Hi Stephen,
>>>
>>> I took a look at the wiki page and it seems like initially at least,
>>> your plan is to make the information from vmcoreinfo available via a new
>>> 'info' command.
>>>
>>> It is possible to send remote packets through GDB's Python API[1].  And
>>> of course, the Python API allows for new commands to be created[2].
>>> There is a test in GDB's test suite that makes use of the packet sending
>>> API, and it happens to send a qXfer packet[3].
>>>
>>> I say all this not to put you off contributing a patch to core GDB, but
>>> if what you want is a new user command which will send a packet to a
>>> remote target and process the results, then it should be possible to
>>> implement this as a Python extension.
>>
>> A bit off-topic, but wouldn't that have the potential to proliferate
>> remote packets gdb/debugging stubs have no control over or no documentation
>> to point at/refer to? Possibly contributing to greater confusion as to what
>> should be minimally supported in terms of remote packets?
> 
> I don't see a problem, but that doesn't mean using an extension is the
> right choice in all cases.
> 
> Using an extension, in my mind, ties the functionality to the project.
> So if we expect many remote targets to support the new packet then it
> begins to make more sense to move the functionality into the GDB tree
> (maybe as C++ code, or maybe as Python code).  But if, really, the new
> feature only applies for one project, then it makes more sense (for me)
> to add GDB support via an project specific extension.  Documentation
> would naturally live within the project itself.
> 
> On the topic of control, I'm not entirely sure what problems you see.
> Using a project specific extension gives (IMHO) the project more control
> over the packet as they are free to change the packet over time.
> Currently GDB is pretty conservative with changing packets, so if a
> single project pushed their own custom packet to GDB core, and then
> wanted to change the packet, there's a risk we (GDB team) might refuse
> the change "just in case" someone else has since started to use the
> packet.  That might be seen as the project having less control.
> 
> Looking at GDB's control over packets, I'm not sure what control GDB
> needs.  For sure, there's a risk that if extensions start creating their
> own packets then there is a risk that GDB might later add a conflicting
> packet, which could be a problem, and one reason we might want to move
> from an extension to a core packet.  I doubt, right now, there are many
> "custom packets" in the wild, but maybe we should consider defining
> namespaces for custom packets, to avoid future conflicts?
> 
> The minimally supported problem is usually about the minimal set of
> packets that a remote target needs to support, rather than the set GDB
> supports.  In most cases, communication is initiated by GDB, so if GDB
> isn't aware of this packet (extension not loaded), GDB will just never
> ask for it.
> 
> I'm certainly not making the argument that using an extension is the
> right choice in every case.  Not every packet type is going to be right
> for implementing as an extension.  Additionally, it might be that a
> project starts with an extension while prototyping a new packet, and
> then ports it to C++ and contributes it to GDB later once the design is
> solid.
> 
> I've had success using packets via Python before, and not everyone is
> aware this feature is available, so I thought I'd mention it.

All good points. I wasn't aware this particular feature existed to be honest.

I suppose my concerns are more towards having a packet that eventually starts
getting wider usage, and then people rely on it, but gdb doesn't know about it.

But I agree by then we should be able to make the call to internalize such packet
in GDB.

To be fair, given the nature of the RSP packets, it would make more sense to
have that parsed/handled via Python for simplicity/efficiency, as opposed to C/C++.

> 
> Thanks,
> Andrew
> 

