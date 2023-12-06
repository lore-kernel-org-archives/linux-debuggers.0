Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="EbbeFVeI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="uB4KvcIh"
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4D00D47
	for <linux-debuggers@vger.kernel.org>; Tue,  5 Dec 2023 18:11:09 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3B61xAur029543;
	Wed, 6 Dec 2023 02:11:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=uGH8g3lZB58QcNiBSqmbLjsVgZtXZiuQVtd7D/MW3jk=;
 b=EbbeFVeIpiYrJ4lSx0gedmTbk1V8pzVH0M5ASM1REiqnaLLHFfEBrB9pFdsPeWfyyJzz
 BwLhch0dVVlrQYdNHbE3Xh7ctGfwAHCErRNIMgYBalFtAWHX88QGL0snVlojZerxeFP1
 2G2HwlR/zM7x2jgoqQLYc6CvaVdk76ikT7XFlhtm9FDewCBYhKaPIsmODYJuJ/e7Mznx
 OLR6cawCjpfouVw8MCzlR32hebfpJ6S27Ga6A2WR1ZgrzmVLEprlIhXXju1uv2Fs35et
 3sOfej5tSmq4bAmn5fWQqBadbaHHEs0DsYL5oOVY/SlIJQf8RY0zaTV9/5q+5+ywdaQu Mg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3utdda058x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Dec 2023 02:11:05 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3B603JhT039445;
	Wed, 6 Dec 2023 02:11:04 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2100.outbound.protection.outlook.com [104.47.70.100])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3utan54epj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 06 Dec 2023 02:11:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=m/Ae/qhoudyde1fzamMmOq+iTDFTOOG+dEF8iQGCyO+3+1/gLsxPnAXOEqP7K4r0lEruLlRuW8t0eL2s7YIRTI9rSN2Yt41hVZexer6eEyRjbCX5r62Qa9DGLRHBcPO+T1gg7JsNDVxSWTFFzXrLZRZ8/EKYkcRlXwnUsIXYbnP28A3peJeBfCuuSVABzaNp0CMcB60WwoGXoq0Q5lFir6iH5M6qMjXrtudg9Nva8LRjkcMOMxPwh28uT4dE4s/MJ6Q+uaNWj+v+DwtapCf6rhLL7ZCq8lz63YZTizhLNFAhpY2L7BjWMw+9rG29u56ELIbGRsys7ZVEq8QlrlEOLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uGH8g3lZB58QcNiBSqmbLjsVgZtXZiuQVtd7D/MW3jk=;
 b=VqmuUtnvFM8pNMQk1NQAknpPoY93BWA7FRqunLTgRA6hNtQe5SKlJtE7WccZWQVHT9FNseEG3rcce+tIbOBMWZxexhf3VtPk7vG/xJqwwx3wkKvZ5PUb7SG+S1Hs+cxfSHbJfDfQBE6QUoZwRj6+qpWsYWk66qUkdx6GUsm1ltUlYnPKWSjL7vqex/JyRyJ9q7cqlf/Ma4nnyQIjbtV0X6mmLSeyALB9AzfF8IdfP271qyBjmb/cBgJlDxK8Nx9/FgXAPZVjjMoipkcaXswX+lohyTcROdn1chYjLJM6WmXL722CLuWn8gOkHGI64iHg7NzNin3NO2w8dHhUfzoXoQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uGH8g3lZB58QcNiBSqmbLjsVgZtXZiuQVtd7D/MW3jk=;
 b=uB4KvcIhwuRMJpXAxG3Lgaaa27kf1HF0+c2I5hNtGqXNSarkHM4bcWkVgLhf3nwW+TEMTLJh3tYYPMG9AyxnL6q5iSqMmix5FQcBXQaYnyzPmwjHBhy5gICtcVlNnfxTk6ZJbo3p2epXpebQqZmpkDuLc8j0oaU6doItr3BmGLo=
Received: from SA1PR10MB6590.namprd10.prod.outlook.com (2603:10b6:806:2bc::13)
 by IA0PR10MB6748.namprd10.prod.outlook.com (2603:10b6:208:43c::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.34; Wed, 6 Dec
 2023 02:11:02 +0000
Received: from SA1PR10MB6590.namprd10.prod.outlook.com
 ([fe80::befc:b95b:2b72:17a9]) by SA1PR10MB6590.namprd10.prod.outlook.com
 ([fe80::befc:b95b:2b72:17a9%7]) with mapi id 15.20.7046.034; Wed, 6 Dec 2023
 02:11:02 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: =?utf-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+44CA5LiA5LuBKQ==?=
 <k-hagio-ab@nec.com>,
        "devel@lists.crash-utility.osci.io" <devel@lists.crash-utility.osci.io>
Cc: "linux-debuggers@vger.kernel.org" <linux-debuggers@vger.kernel.org>
Subject: Re: [Crash-utility] [PATCH] symbols: handle module symbols outside
 strbuf
In-Reply-To: <0a214318-5bde-a495-9d19-356c5dc8c63d@nec.com>
References: <20231128145723.689860-1-stephen.s.brennan@oracle.com>
 <0a214318-5bde-a495-9d19-356c5dc8c63d@nec.com>
Date: Tue, 05 Dec 2023 18:11:01 -0800
Message-ID: <877clsgjwq.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: SJ0PR03CA0028.namprd03.prod.outlook.com
 (2603:10b6:a03:33a::33) To SA1PR10MB6590.namprd10.prod.outlook.com
 (2603:10b6:806:2bc::13)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB6590:EE_|IA0PR10MB6748:EE_
X-MS-Office365-Filtering-Correlation-Id: 97d627bb-e3ab-46c6-043a-08dbf6009879
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Q80JaM8Om7Ff69xUf4LuYlzi5tEl5jAAMpEYtDjq3HzOO0l9n1K4u9WUto++SwLwoVKWsuKzmSDnRt1sPNxKPONUejQX4mEl7KQPMcxfeOVldt9l+9TtB8xi5oD6+hxcxa8Q8JW0FdsxiRZ9g2Ym7U7SwW8EXaTlBOJfEvsNXRsFKLhgfDugaY5yyN8ZcqQ3R2yUGoTTYjfbpiagmuVcWBuiOZPc/RxfdDNoK8m5EEzypOJkni3+Otwl+PMg7aFWD5cyY3MoIvyoYNT5iChGdeTUIPBAOOT5Lo/JnK1AnppVrR1P0bfOUjx2IxzYxE0Fp2WCmu0p9XeNO9xdrKK/JweZQ0+3vb6TznYX/x96w06nY3hxkH9gZ9nKYbjof75XBh4eiFxq5dEiGFX6g5VPnAnYs6bnKzTdzccr/VHYAzmSdkrMVq/mveE45ez9N9s9R4RLEWKbR7CgrXKsSv/FrHcpMHB99pOHQ/7OUVa9j4gBa4MCKE0VZawmQsssOy++eZeAZEcx3eO/6RKtxXsXWuBz71xVERKfWf4hQKYLN5kYY2WGpgYgzauxyE53UU5x
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB6590.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(346002)(39860400002)(366004)(396003)(230922051799003)(186009)(1800799012)(451199024)(64100799003)(2616005)(38100700002)(8936002)(8676002)(4326008)(6512007)(6506007)(83380400001)(53546011)(478600001)(6486002)(66476007)(66946007)(110136005)(316002)(66556008)(2906002)(36756003)(41300700001)(86362001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?WGUyZCtSbHQwakpERVFWem5aOFNNTHE3RTRMaStZZjFrcTZDcWYxWXdYM00r?=
 =?utf-8?B?M1VlSkl4NERLclFCVXlKUG9qR0V5ekYwbGo5OGljajA2RFFQV0hKVVNObmJB?=
 =?utf-8?B?eHM3d3psVUdZMWVPZmthWTFhbGo1TEZFMTdnUllKa1E0ZlFvcDllcnp6UlpO?=
 =?utf-8?B?UXQ5L2dFc3ZZUUUrbmFFUE1xREhkTElSS3NqVmhoQlAzVmhZOUtMeVBEWVZq?=
 =?utf-8?B?cmVEcWRDYlpSMGEzeDh5dVhXMG10NWh3bVJ2QUFSQmxFYWdxaWxVTU9OV3J2?=
 =?utf-8?B?Y1crQlNNdFByMXFRYlFnRkROZm9RR25aRDBnSit3SHAxTk5ZVTExOHRGSTRt?=
 =?utf-8?B?SWpRbnRTSm9GbTdhaGp3cmV3eWRPTFNwNEVDcmdYMXpSVStUNVFVT29GUUl1?=
 =?utf-8?B?eW83Y2pvNURjME1LOVpxL2pZd2NiSlptaHBHSUV6QXlHVGlPSHBUVVZsK2Rm?=
 =?utf-8?B?aWJUODd6c0Q4Wi95R1l6b1hPWVdEMDRIdkVFcHNjVXo2Z0JyTTdTZmFlK0JO?=
 =?utf-8?B?Lzd0UkdNaEUwQS9HWE82M2F5U0V6cnBuNng2Nk1FcU9OYnE2V3poK2ZCa1lw?=
 =?utf-8?B?N1NPY3VYMC90d1hKNFZuS3lQOE82Tmt1WWh2ekc0RzVFUFFETWdFZzVJYlJH?=
 =?utf-8?B?azFIZkdTTmlvRll6M0Vyd054T21wOXBBVGtWdGREdktEbXVHVkc0WFlZN2hH?=
 =?utf-8?B?aEdNQ3lpZGtqK1RFeEpnaXFZTFBtRVFvVnNGakVZYWU4MGVQSGZiMUFUNEVP?=
 =?utf-8?B?U0xodzZ3RTJxNjcyME1rVHkwazVZNFdZN3JVYjJ2dFA2ajgxZE16NlBlVmRR?=
 =?utf-8?B?UmMxREVUOVRBdURhV25QV1FWT3hBT0dNQSs4RWlIZGhSREowNGR1YWZNMDE1?=
 =?utf-8?B?L2dVbkFqcjlZYU96MmhzSjZ2S2liMkh2amtENG9LVElyeDJhbWVpZUU2NTFi?=
 =?utf-8?B?S2JvT1gvUzR2UGxIMWRaSTN4VTdSYmhYL0JlaHVUdiszSVNPellCVExmV2Q1?=
 =?utf-8?B?TzBFVHJ3TEFicmdWcm1Ha1VOU2VQb1ByUmhxYWNiRk9md3A5L08zUXQyMmk4?=
 =?utf-8?B?aUFyandTNkdnS1ZQZU5oL2hzT2IxMjAwcE4wam5ieUVTeXlMaFVEUzdqeVFG?=
 =?utf-8?B?bW9nRFJkeTV2b1ZQOUNzUFBPOHFEYlp1T05WYlYzc2RPS05VZlliQWZmVXRC?=
 =?utf-8?B?Z0ZvaktXejhjeDRZR1hYVnJnTUlqaHNNVG9Db3Z6VkRMUGllQk5vUmwxbGd3?=
 =?utf-8?B?SnBXejdKbU4ydjRrQjlJNWdaQ21rRHZDZXZGeU9MM0FwNUJRSktjNXdJVG1F?=
 =?utf-8?B?UFpzRnNvUDQzU2RocGxtVDR1dmhoVjU4T21aR1RORnpycnl0MjFqeGV1N0xv?=
 =?utf-8?B?NnJrNzlncWYwemV5QXF2aExLQlZ6Z3VMdzYwNWs0MEc5WnNXZkhCbHA2QUZo?=
 =?utf-8?B?cGdMSEl1VEdERGtMLzNobFlIdGZROXh3eFJsZkMvVkpZdjFEV05GY2p6a3ow?=
 =?utf-8?B?cDNBUVphcEpHUk9rRDY4cld6cmZPU1Y0MWpNck5icmU2dEtubjhJNkhINUI2?=
 =?utf-8?B?ajh3VEQveDFIQWZQYzNvUTA2Tm96TDkvdTl4RzZZSVhiSzBZUXJxS3FZQ2FT?=
 =?utf-8?B?bHMzcVBqeCtlYlRsRXZQNHowSlZLdE9zb3N0WWJOaGNoSnJlWWljOGVid3Qx?=
 =?utf-8?B?Y09CdkY0Vkh1QzVKdklLRVc1blRIWHY3NFBUeDEzOWo0TC9qYjdnQ3FmWmEy?=
 =?utf-8?B?NkdrdzFYWXhKTEdrc045ejdESW4wU1R2b1JqYjB4bFpFcTk5OVArUGFyU2FK?=
 =?utf-8?B?SjZMeGJRVmZaR29PS2htN0tOemt0cUg5cjdhMHphZXdibEY1RVZQS0FXUkla?=
 =?utf-8?B?a1o4R29XSVMyekFNT3RXbk9ITmgxajZHeEMzWFJ5YmY1RHhINHJwcFNQZVRM?=
 =?utf-8?B?NHM5dWhuczcySkJlK2NhMytST3VYNy80Vnc0VFBBenFvZUlhUjBkNTVraUxT?=
 =?utf-8?B?TlBYMjJjdWF6MGluUmVsRHFvOHY5dzBmeVFHRjRNb1h2Z2pXR2xOZVpHWXYv?=
 =?utf-8?B?ZUpHZmt5bnRxV0hzQm5KUGdaSzZPTVQzT0gvWDQ0U2w5QzB4R0Rqd2VDM0lZ?=
 =?utf-8?B?M1ZWaFducnBJSnN6OGtyUXh6TFFBOWVORGR0ZCtsSVc4MXdqMVQrd0NkRVFq?=
 =?utf-8?Q?O9S1ywEOzHbLjeqOQPkjbDM=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	APc3O6bxy0abRisyONBPwGPk0FAsH7GyhwKfDYtzYChSfNYwnE1OuKNpYJ6V2K7EictZFEgUSPrx7U1il8+hE500bO5u8Y1cN1lJcU51RvVRIBXoFwlWHJnfja9wdDHNBJ4PoVAqBxmLcSnBl3k/mmZVr47txFKqNzOFh4KS45GbX7CnRqMklLryR8pWT3SGjvHtnPb66tm76J1lO/eGbpTULLty/BvlKZJlFtdIsbNZp06W8Sc9HOCNkxjlgNvWE9dF2M667RJZLDXcon9ue6ef3Zw09IgM7AnY8wrs/k5zUp8P/ExIvpBd1BuuqKmhEaLUd5j/ThE6Hbd5HsemXsOwcgmrHcRkUrd3v08qTPeDLIHEkFhAwcP7HerWvVVrkCfgwzClB86+CLk7OIBrXtPIw3BXNepMU01iunefbaJ/BsC4nOh0oOi1Vv6fAFdxmzxq6mOkRXhmtA0PZG4EpXzfEtPXp/TEJ6InK2+InbPuVnyQiBPUuzYWHywQqbS3oUIYIvh82AlyQExHt27nAODI4Y+PKByXhsooSs1D/KfdvOLzp+G7vJApxTGNhKv/GEmhi8NpSt93UI+u5L48OyISUytxtkeMM3I4OlJTjll9HAjdoq0fk6T2cZ3Cumda2JPxhebZHWS/Vv4Qqrnve6IeN6brrhuE23lNpmTyqggXx4fc+rojg9Hfe5nsVRwDE5jshFWS5DAn2Lo22NZmDBVEwN8k7nQFB1mp2qkw+knYNjxgWSJnSdElgtR9h2Kxb98SgrgP8OU8zjsobSj1Fn9KjD9d8v+dKBTsAGQu+SbDaPSoZxrs38+c9s3IjjUTAdmOeLj8WR4MkHwJ9a7NSOo8euHXVNodbLeunwU3dDI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 97d627bb-e3ab-46c6-043a-08dbf6009879
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB6590.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 06 Dec 2023 02:11:02.4003
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 1LFn7Z9icxUAAMeWoNj1B8hl9SzSTtPAPawk4J0uKDxV/b/4uZUdD/CTBGSdlGQeRiKdz0IRajm08xsl6PyLM5FBUR9ptre3kGt4a9oD4Wk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA0PR10MB6748
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_01,2023-12-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 spamscore=0 malwarescore=0
 suspectscore=0 mlxscore=0 adultscore=0 bulkscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312060016
X-Proofpoint-GUID: brgTOi9rzxLVF-P1KoUDk4lejSGHf4Pr
X-Proofpoint-ORIG-GUID: brgTOi9rzxLVF-P1KoUDk4lejSGHf4Pr

HAGIO KAZUHITO(=E8=90=A9=E5=B0=BE=E3=80=80=E4=B8=80=E4=BB=81)	<k-hagio-ab@n=
ec.com> writes:

> On 2023/11/28 23:57, Stephen Brennan wrote:
>> Module symbol names can get overwritten by live patches or ksplice in
>> odd corner cases, so that the pointer no longer points within the string
>> buffer. Gracefully fallback to reading the string directly from the
>> kernel image in these cases, to avoid possible segmentation faults
>> reading outside the bounds of strbuf.
>>
>> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
>> ---
>>
>> Hi folks - I encountered a segfault on a vmcore which had a module
>> symbol that had gotten its name overwritten by a ksplice (live patch).
>> It seems like there's not a guarantee that module symbol names _must_
>> live within the same symbol buffer, and there is even logic to prevent
>> reading too much data into strbuf in those cases.
>
> Thank you for the report and patch.
>
> To me, it seems like the logic is just to cap the buffer size because of
> adding BUFSIZE.
>
> If "last" is outside of a module range, your patch can fix it.  But if
> "first" is far outside (lower) of the module range, strbuflen becomes
> huge and crash tries to allocate a huge memory?  Is it possible by ksplic=
e?

Hi Kazu, thanks for taking a look.

You're right, if first is far below the module range, then there would
be a separate bug, and my patch won't address it. I haven't seen a case
where the symbol name points below the module address range, but I
believe it's possible.

The replacement string comes from the ksplice module. So if the ksplice
module gets allocated to an address below the current module
(lm->mod_base), the case would happen.

A simple way to address this would be to abort the loop which calculates
first/last, if we encounter a string which is outside the module address
range. Something like this:

 for (i =3D first =3D last =3D 0; i < ngplsyms; i++) {
 	modsym =3D (union kernel_symbol *)
 	    (modsymbuf + (i * kernel_symbol_size));
+	if (modsym_name(gpl_syms, modsym, i) < lm->mod_base ||
+            modsym_name(gpl_syms, modsym, i) >=3D lm->mod_base + lm->mod_s=
ize) {
+		first =3D last =3D 0;
+		break;
+	}
 	if (!first
 	    || first > modsym_name(gpl_syms, modsym, i))
 		first =3D modsym_name(gpl_syms, modsym, i);
 	if (modsym_name(gpl_syms, modsym, i) > last)
 		last =3D modsym_name(gpl_syms, modsym, i);
 }

With this check, the buffer won't be created unless all the symbols are
in the contiguous region, so we don't need my added check from this
patche.

I will send an updated patch if you like this approach.

Thanks again,
Stephen

> Thanks,
> Kazu
>
>
>>
>> This patch simply ensures that symbol names which start outside of the
>> strbuf which we copied, are read directly from the kernel image, rather
>> than indexing past the bounds of strbuf. I encountered this in
>> store_module_symbols_v2() and have tested it there, but I replicated the
>> code to the other versions. I will try to test it out on the other
>> variants as well, but I thought I'd share the patch now.
>>
>>   symbols.c | 10 +++++-----
>>   1 file changed, 5 insertions(+), 5 deletions(-)
>>
>> diff --git a/symbols.c b/symbols.c
>> index 176c950..e70dd69 100644
>> --- a/symbols.c
>> +++ b/symbols.c
>> @@ -1704,7 +1704,7 @@ store_module_symbols_v1(ulong total, int mods_inst=
alled)
>>
>>   			BZERO(buf1, BUFSIZE);
>>
>> -			if (strbuf)
>> +			if (strbuf && (unsigned long)modsym->name - first < strbuflen)
>>   				strcpy(buf1,
>>   					&strbuf[(ulong)modsym->name - first]);
>>   			else
>> @@ -2080,7 +2080,7 @@ store_module_symbols_6_4(ulong total, int mods_ins=
talled)
>>
>>   			BZERO(buf1, BUFSIZE);
>>
>> -			if (strbuf)
>> +			if (strbuf && modsym_name(syms, modsym, i) - first < strbuflen)
>>   				strcpy(buf1, &strbuf[modsym_name(syms, modsym, i) - first]);
>>   			else
>>   				read_string(modsym_name(syms, modsym, i), buf1, BUFSIZE-1);
>> @@ -2148,7 +2148,7 @@ store_module_symbols_6_4(ulong total, int mods_ins=
talled)
>>
>>   			BZERO(buf1, BUFSIZE);
>>
>> -			if (strbuf)
>> +			if (strbuf && modsym_name(gpl_syms, modsym, i) - first < strbuflen)
>>   				strcpy(buf1, &strbuf[modsym_name(gpl_syms, modsym, i) - first]);
>>   			else
>>   				read_string(modsym_name(gpl_syms, modsym, i), buf1, BUFSIZE-1);
>> @@ -2456,7 +2456,7 @@ store_module_symbols_v2(ulong total, int mods_inst=
alled)
>>
>>   			BZERO(buf1, BUFSIZE);
>>
>> -			if (strbuf)
>> +			if (strbuf && modsym_name(syms, modsym, i) - first < strbuflen)
>>   				strcpy(buf1,
>>   					&strbuf[modsym_name(syms, modsym, i) - first]);
>>   			else
>> @@ -2529,7 +2529,7 @@ store_module_symbols_v2(ulong total, int mods_inst=
alled)
>>
>>   			BZERO(buf1, BUFSIZE);
>>
>> -			if (strbuf)
>> +			if (strbuf && modsym_name(gpl_syms, modsym, i) - first < strbuflen)
>>   				strcpy(buf1,
>>   					&strbuf[modsym_name(gpl_syms, modsym, i) - first]);
>>   			else
