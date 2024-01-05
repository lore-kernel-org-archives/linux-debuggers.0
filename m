Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8CF1F35EE5
	for <linux-debuggers@vger.kernel.org>; Fri,  5 Jan 2024 18:38:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Vdsdm+rT";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jwZe15mU"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 405I4Ogu009674;
	Fri, 5 Jan 2024 18:38:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2023-11-20; bh=kYbNdojB73fuidbd2NnXDbcwpnRlFd4iEFShdriS3SA=;
 b=Vdsdm+rTRs6Bsv8RdPYYZkoTwLMy4dJUXqvEtK2xA62sTTOW91I4vLMpH8a7+qS6RSl5
 v8qs9Y01hOJDgLpLeiTkyc2Z332mMHj/YeE1SpexXjhyJybcCQDcybjqNnWQ5MWJgJp5
 EG94O1jdUORcbO6pJ3KGqdFIXweVw/keAJJLiCPvOmKvOWV8nFnPlKqYwUqVrnqXsCnT
 u3QULBYgjF/rZ43/z4c3UDpurSB3pQ1IbdSKtOP6i66sJmvZQ3Bw0KeJ0mlFcihjWE+t
 PcOrMHmShKqNJWYLUIg0/rnuP/+ukDH6IwbIW6zwtKfNFL37GmrlV86BQKbTyf73SFV7 Ig== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vepqr04dy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jan 2024 18:38:20 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 405H9jaw032499;
	Fri, 5 Jan 2024 18:38:20 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3ve1jhxf17-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 05 Jan 2024 18:38:20 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XXnyhT1H2u8bSRrtYotsir9bsx49aYnal5XMukZmKEHAybhIHwXfWOTQudLVEAV8ntcLN18uIx6dVuzy0CAOb02jaLl4RlRVxuu2u0CTsw8o62NmETqBHUrYZUxSZBUGGPDNjyl6YgepArauekF1B2hdAeeTBPq43M3uR8zJVowaNG8Mx6HfqgCD8H/1MbWLnu1+gUNU4uDgxKgfbA+QIvfk6ApndRFoq1Kzo5+Jk97TBHSo7iC3/ibHJf8CCGgdvaX/WZwz4RLBxXroBucT4DcRW5vSHzSRVsn8NbEIcbLPFtALTW3XnELeVheqm1Hi9I1NRE74vukem3kRLMdAkA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=kYbNdojB73fuidbd2NnXDbcwpnRlFd4iEFShdriS3SA=;
 b=HQ4kxWA8b6Hz+WyrlJuvLKpNdbjbifkLu0lH/idlNw9ewwGmSAcNtlsZIZEJ9L7e3mBvVtpMdhgsnGK5aNESuiOeMNVUPe8PjM9rh9J0LDlGvUkzNoIY0LvjVWej2g8okoFoCp0yHZfJQTypeYOM9VdVRHMiDIxDwIb9Pgq0MD6nNX+w10WJ/GIGM4z4IFsjTLoLikMLkxTOAZUGCw2E8p9BMoXG1CgmLWrYlQvVn0/2HjKTGFsaoYWNuPohNO0MSXS8oTvf3dH44DCiBoFTj/LHeeWRtERx9BpP1HjMYlTE/Z6lCnKhQQ/yfXNzRgMs/BFTCAlqlS4XAhLJ0wcuxA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=kYbNdojB73fuidbd2NnXDbcwpnRlFd4iEFShdriS3SA=;
 b=jwZe15mUtJuW0EHLzmNHBAoHgqO2eNQSq09fnb+GJVt0vrpQ+SpD7+XEns8K/k0xD0MnhQKfgBO6wRk3VZZxU4QKGELiEMemQQtUJwlWrxbvS+Uf1EI87NxOil7XgmXO6y+/wDJ6WVHn2lAQ1uSdwtEfw+R3rRgTp1AtB6VYOHc=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by LV3PR10MB7769.namprd10.prod.outlook.com (2603:10b6:408:1b7::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.16; Fri, 5 Jan
 2024 18:38:17 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::c53e:b817:b563:8044]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::c53e:b817:b563:8044%6]) with mapi id 15.20.7159.015; Fri, 5 Jan 2024
 18:38:17 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Petr Tesarik <petr@tesarici.cz>
CC: Omar Sandoval <osandov@osandov.com>, <linux-debuggers@vger.kernel.org>
Subject: Segmentation fault with drgn + libkdumpfile
Date: Fri, 05 Jan 2024 10:38:16 -0800
Message-ID: <8734vb1v8n.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR17CA0034.namprd17.prod.outlook.com
 (2603:10b6:a03:1b8::47) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|LV3PR10MB7769:EE_
X-MS-Office365-Filtering-Correlation-Id: e75bcf51-03e0-41f8-fba0-08dc0e1d7bef
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	/hO2NSpKkKoZMUWyX9Z3sSTp/dFiBzLzcsljqS4yM9rcuhqtGbEnnkIGAsZapquXtMZXKAjTvBnqqtOQ4Y9OpV2KE7Fo1xL7o4Wmm8iwNaQo/aBWyGyurQbbG0FpI/E49EQogERzxjZONG7NEf5OkeT0+yGsueJxtnkqEfuI86dg/Lq6CbF+i0hQeMhgYb5GJkwJabH6pJRp9FFH7w3zdEzjDO4LEf+juxMQe2D7lUYPyh4H54yjKVZQ26TekCQyZfi1shdDHhm7+2ygdk2qyEVPaZg02J37XigHEnkaeXByTg1Ija4zI0ilJ4+kJ2fTu+Qs6eBEYk6lxu6C3IX0jOCqB8e0/MKPZTg5Gm1iOd7ltApDPqnwwLoQb6mAWCJsZkIsCuO/uCFu85WnTXTtuHQaiYm41sfunrC+sRW2aFiaPh2lWVl+Fr1GI2G2bnIk/CGBC0PJI/SZNFzMBC27T6QyPhsGcGU+k/LLRKAkQhzy57QE2kWxhH73sZaHfT86eLGS/dO3OV/YbNyy7nLdbxB9Yn3ENfaxYJeVOX2G0xwk2zU+/8AxNAdpEp/bTemc
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(376002)(346002)(39860400002)(396003)(366004)(136003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(36756003)(86362001)(83380400001)(38100700002)(54906003)(6486002)(478600001)(2616005)(6506007)(316002)(8936002)(8676002)(66476007)(66946007)(66556008)(6916009)(6512007)(2906002)(4326008)(41300700001)(5660300002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?ci5BWHqdwcGb2J2fYCz8VPqEoZw00wfl4NpZM5bLq5D0uMQiSDR3RMta63zN?=
 =?us-ascii?Q?H7nDjvOuZ7JyvyH6S9Ay03iyyoRWpBs8FZMNRQ+aT5pwoxNzl5m6HoyRcaDW?=
 =?us-ascii?Q?tPwql2i+aCGF5OuLpTJnBMt1HYe96/UYMkh8qBgdffWFUwhCWRItHpcqbidb?=
 =?us-ascii?Q?udRFAoFZcgnZM6azsJcAMVrtlqhH64apXitwFCqUBuVE6CMotxaCNfyTen3x?=
 =?us-ascii?Q?HHmpEO17b8zwJMMVm6nEgEApnjdIFD+rAP6L5AM4ABzQ6P+NEBynt8xxsNF6?=
 =?us-ascii?Q?Lmk2bjAgSFwfAHF19a63BnqrtC9U1PcR4tR2t247GaKVBYRSRRq3fd/k1TnZ?=
 =?us-ascii?Q?13Y25Dm4cupHUkzs0mT1hxmqdaV5ZUJlvZMP7Pvmwsitl/A0Rd5nBBRWlL9+?=
 =?us-ascii?Q?AQLnmdsPxbd5fQKsJnX2FUiiwWGkmc3wNFfvbdFhwOuXyCp66SHM8p0I0/wz?=
 =?us-ascii?Q?D6bN5w2+HlF5eGMZO5J7hJSq6frEj3jXvRyabyXL++TuRwSL17Z9Pbqpodtp?=
 =?us-ascii?Q?VjzZ+umXTxvSyCdzX5xkBUv+gRzWmxWN0942HQgD40FmTOJJ1LDgWHL5J6dv?=
 =?us-ascii?Q?O1dEuJRPiKGNf1hV+QWF0ENrSHVnBseFA2lrGm/JR7csNtFf82HAl6VUzDRy?=
 =?us-ascii?Q?QG4AX5gnoYEXTuLlzHXIkZrjlJM/KK2WAy3vZXoqX3TytQ5y9VPLqk3OswD8?=
 =?us-ascii?Q?+8tpcT5THhMMKrFZ854O04dQ/L9COtv79usMu/47ZHiYi/afi85hhTRzBYh9?=
 =?us-ascii?Q?moERIiZj2xGcyZDPwxejzAOg5VqhnpzVbNJ3cdwJJvFr37ipeybxemERi6hn?=
 =?us-ascii?Q?bLBhBtIjlt6qI+129BJtTWSO+4iam7bBo65JpqPt7AbCU/mR6gS5tLfNurBi?=
 =?us-ascii?Q?vUy09z1hEXkJlAUhTCf66CfMxFDxPpGLzL2Qvt/ZvrqLfyoOnFZhYhxqc04q?=
 =?us-ascii?Q?d+M1tfTI0dpOP1Jxo0jFLmRvwqKTGZyuY/fsy9MEqF9s1ru68+OFoExhX5CT?=
 =?us-ascii?Q?0fvT1SrpXrhue8Kg/JPxHvdaLz4d+mYwjjpc1JLA9yp0wM6ARSRkUtB1+9Td?=
 =?us-ascii?Q?UPG4sh/i1WfS+NwTUUa8SKbLpD45pmjPMBc3Yoq+XIn3Y00uXwaAIYOE9ePZ?=
 =?us-ascii?Q?uhiTNVfqHr635yY0H+HXPH05m7+K9qy0dDLPnMxu94tlRq0P3fR354g+SBg/?=
 =?us-ascii?Q?peuaGFgVQGBnVVP36j4IJgHmHuGOC6d3z0oYA4ItSjoZ6TMylLhUxIrfi26+?=
 =?us-ascii?Q?1svjMX0OJnY6SiFR3Ff0NldumCFa6sCwVTPSScVyn3OQNYY3wH6OyAwDamiI?=
 =?us-ascii?Q?iIM5wYtYXEJYTBAuE+FrKSf34NgLvDpbitUVd6IcVtQYvke+UBFFZOHC0wjw?=
 =?us-ascii?Q?QfZwmveLgghj+gSnBmlZpRwe/KLrksUFrUGEdSBIQH9JuPXDyfpa+abdYLA6?=
 =?us-ascii?Q?lHCVYjLtwtIUsv6NDVd3SNuMHst4kIOi4xSLKmBbFkXw9dj1LPni/1cI4KvY?=
 =?us-ascii?Q?FDz51vMM8lvVU3nWIdFxsR4cvUj9cMzZebgrb7fF12a2dcMWwSjv2g8Qltf0?=
 =?us-ascii?Q?dB0YdUhblBRFoIn0jxxGV3Ujrf9jy74t5j1Vin+YxTOHVrvI4FTrmUf4BnTk?=
 =?us-ascii?Q?fzUvecokdcGHX8U+o1vpfEgVcC1bd9BYfcSbP9iDuFg8?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	C0Fn4s4ufUfXMi07pzuHM5p6CzH4BgThfTyMB7MsszL46rdHdFU3OYGERqUk6ZS2ycbePfC5LXLC7jyCHGqPav5dRf8km3PoRpPVhXWTIoxava5gCLwemkut15LUZ8oK3g1cbD/jcZyAvALWH8H3Ffsdkb812FBY3uWStftxUunA10ZAKQMuljVR1R4CU+jAHAaG4TIlszLFlKQQMWphg6uUas82+//6LcUaM2drV9bMJf3QlLasGcYDKsX6DoDZ3LbVTjQUiA2CbofJP3YEGxUEh1mUtMz4KXOmbQ1nDJJYKgY25zWnVxWUBW6cyTkwInBjRqqNlHXoippB6QMyCI0TfRv/mLJYjwhBIY4XGfMfdSrwjxtuDATpMgZbsXnnV5tOimK2eRbjqPkkVJms/wxwNyKEh/Lz5HQ3ZdXTd+szwIIPiDu3V0lJAccwDCoFX+D2Y/MvVxEVNaMWGEZb+y09DNsDwP4kznu26JZYhLsV6gz8Fqz1292z9Uvqzcr5g8VfSzCoR5WU4JoOIzQYYnk6VoJ3U4z0QeVYYOVs9kqAcclg6qQU+VmP+HEFrv8OGH1y2BgeLpnF+Mo6hquDQaO/20NLvLCVWd6k3b2hJDk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e75bcf51-03e0-41f8-fba0-08dc0e1d7bef
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 05 Jan 2024 18:38:17.7277
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gI8tbk4LmdxLTzLu0qG1WbRjbd1FM2SakE4kFFkBwCZvntVU+Ns8G3aEiuWuT+DIPfPyp5LU8EtDx4lT9KZGJEyEoO5WIcyMYQLaD8yEB1Y=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: LV3PR10MB7769
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-05_08,2024-01-05_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0 phishscore=0
 spamscore=0 mlxlogscore=999 adultscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401050153
X-Proofpoint-GUID: BKAcgpKFWdO6JfoMqw5KEjqBGuDUJ8sb
X-Proofpoint-ORIG-GUID: BKAcgpKFWdO6JfoMqw5KEjqBGuDUJ8sb

Hi Petr,

I recently encountered a segmentation fault with libkdumpfile & drgn
which appears to be related to the cache implementation. I've included
the stack trace at the end of this message, since it's a bit of a longer
one. The exact issue occurred with a test vmcore that I could probably
share with you privately if you'd like. In any case, the reproducer is
fairly straightforward in drgn code:

for t in for_each_task(prog):
    prog.stack_trace(t)
for t in for_each_task(prog):
    prog.stack_trace(t)

The repetition is required, the segfault only occurs on the second
iteration of the loop. Which, in hindsight, is a textbook sign that the
issue has to do with caching. I'd expect that the issue is specific to
this vmcore, it doesn't reproduce on others.

I stuck that into a git bisect script and bisected the libkdumpfile
commit that introduced it:

commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6
Author: Petr Tesarik <petr@tesarici.cz>
Date:   Wed Jan 11 22:53:01 2023 +0100

    Cache: Calculate eprobe in reinit_entry()

    If this function is called to reuse a ghost entry, the probe list
    has not been walked yet, so eprobe is left uninitialized.

    This passed the test case, because the correct old value was left
    on stack. Modify the test case to poison the stack.

    Signed-off-by: Petr Tesarik <petr@tesarici.cz>

 src/kdumpfile/cache.c      |  6 +++++-
 src/kdumpfile/test-cache.c | 13 +++++++++++++
 2 files changed, 18 insertions(+), 1 deletion(-)

I haven't yet tried to debug the logic of the cache implementation and
create a patch. I'm totally willing to try that, but I figured I would
send this report to you first, to see if there's something obvious that
sticks out to your eyes.

Thanks!
Stephen


#0  0x00007fb9a1ac1ef3 in lzo1x_decompress_safe () from /lib64/liblzo2.so.2
#1  0x00007fb9af164151 in diskdump_read_page (pio=pio@entry=0x7fff1f5fa760)
    at diskdump.c:584
#2  0x00007fb9af16bcd8 in _kdumpfile_priv_cache_get_page (pio=0x7fff1f5fa760,
    fn=0x7fb9af163cd0 <diskdump_read_page>) at read.c:69
#3  0x00007fb9af16bc15 in get_page (pio=0x7fff1f5fa760)
    at /home/stepbren/repos/libkdumpfile/src/kdumpfile/kdumpfile-priv.h:1512
#4  get_page_xlat (pio=pio@entry=0x7fff1f5fa760) at read.c:126
#5  0x00007fb9af16be57 in get_page_maybe_xlat (pio=0x7fff1f5fa760) at read.c:137
#6  _kdumpfile_priv_read_locked (ctx=ctx@entry=0x564a0a9475e0,
    as=as@entry=KDUMP_KVADDR, addr=addr@entry=18446612133360081960,
    buffer=buffer@entry=0x7fff1f5fa917, plength=plength@entry=0x7fff1f5fa848)
    at read.c:169
#7  0x00007fb9af16beee in kdump_read (ctx=ctx@entry=0x564a0a9475e0, as=KDUMP_KVADDR,
    addr=addr@entry=18446612133360081960, buffer=0x7fff1f5fa917,
    plength=plength@entry=0x7fff1f5fa848) at read.c:196
#8  0x00007fb9a1bc9a8f in drgn_read_kdump (buf=<optimized out>,
    address=18446612133360081960, count=<optimized out>, offset=<optimized out>,
    arg=0x564a0a9475e0, physical=<optimized out>) at ../../libdrgn/kdump.c:73
#9  0x00007fb9a1bb67bd in drgn_memory_reader_read (reader=reader@entry=0x564a0aa3c440,
    buf=buf@entry=0x7fff1f5fa917, address=<optimized out>, count=count@entry=4,
    physical=physical@entry=false) at ../../libdrgn/memory_reader.c:260
#10 0x00007fb9a1bc0160 in drgn_program_read_memory (prog=0x564a0aa3c440,
    buf=buf@entry=0x7fff1f5fa917, address=<optimized out>, count=count@entry=4,
    physical=physical@entry=false) at ../../libdrgn/program.c:1648
#11 0x00007fb9a1bb6b61 in drgn_object_read_reference (obj=0x7fff1f5fab10,
    value=value@entry=0x7fff1f5fa990) at ../../libdrgn/object.c:739
#12 0x00007fb9a1bb82c8 in drgn_object_read_value (obj=<optimized out>,
    value=0x7fff1f5fa990, ret=0x7fff1f5fa998) at ../../libdrgn/object.c:782
#13 0x00007fb9a1bb8311 in drgn_object_value_signed (obj=0x7fff1f5fab10,
    ret=0x7fff1f5fa9f0) at ../../libdrgn/object.c:905
#14 0x00007fb9a1bb8632 in drgn_object_is_zero_impl (obj=obj@entry=0x7fff1f5fab10,
    ret=ret@entry=0x7fff1f5faab6) at ../../libdrgn/object.c:1250
#15 0x00007fb9a1bb9338 in drgn_object_is_zero (obj=obj@entry=0x7fff1f5fab10,
    ret=ret@entry=0x7fff1f5faab6) at ../../libdrgn/object.c:1322
#16 0x00007fb9a1babb13 in c_op_bool (obj=0x7fff1f5fab10, ret=0x7fff1f5faab6)
    at ../../libdrgn/language_c.c:3307
#17 0x00007fb9a1bc3471 in drgn_get_initial_registers (ret=0x7fff1f5faad0,
    thread_obj=<optimized out>, tid=0, prog=0x564a0aa3c440)
    at ../../libdrgn/stack_trace.c:631
#18 drgn_get_stack_trace (prog=0x564a0aa3c440, tid=tid@entry=0, obj=<optimized out>,
    prstatus=prstatus@entry=0x0, ret=ret@entry=0x7fff1f5fab88)
    at ../../libdrgn/stack_trace.c:1091
#19 0x00007fb9a1bc4726 in drgn_get_stack_trace (ret=0x7fff1f5fab88, prstatus=0x0,
    obj=<optimized out>, tid=0, prog=<optimized out>)
    at ../../libdrgn/stack_trace.c:1151
#20 0x00007fb9a1b7fc20 in Program_stack_trace (self=0x564a0aa3c430,
    args=<optimized out>, kwds=<optimized out>) at ../../libdrgn/python/program.c:849
...
many more python stack frames :)
