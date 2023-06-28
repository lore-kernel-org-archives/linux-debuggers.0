Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EDCEB64D7
	for <linux-debuggers@archiver.kernel.org>; Wed, 28 Jun 2023 22:12:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229972AbjF1WM6 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 28 Jun 2023 18:12:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42922 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229581AbjF1WM5 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 28 Jun 2023 18:12:57 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F26352110
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Jun 2023 15:12:55 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SKicO9019785;
        Wed, 28 Jun 2023 22:12:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-03-30;
 bh=0wCe0jb4+x8qaDG8CUgLub1fNaQE63jFki9p9MItvcw=;
 b=leyHeOQVFwzTfQQrh4kfdlhMzEqwF85VsztlnTC4W7s5SEZ4MjILU7OZsImuXfyInM+B
 MFpGom3lkXuNUln/cc3rLk0t8SttmKG9cQCpi+AzYBunSX3U5ZJ6/CYEOwwJdL1UGLEV
 mqhn0gzrlTLAAObRzK1RtFIhv/oO7Kznz9+2Wby4Zo0UaD0KBiKy7rYpC+XRfmgWaDZA
 I90mKXFCmWfG4Mmu+YkSCA556S0/FeBwGeW5qOnMCYZaLoGmEvtxp5DglpG4vRX+op6P
 oITMf5REMEpzDB87QnlGzrECudMJgcPNev2Pp2xCUDsnNF4tZqaZ0DyiiWtSQ0iLofy4 Yw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdq311g3s-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 22:12:50 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35SLoSAg020055;
        Wed, 28 Jun 2023 22:12:49 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2106.outbound.protection.outlook.com [104.47.55.106])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpxcdv2y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 22:12:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XWo8WJ4jL654OAEhRbI0ZP+Wnu0bf1MDGsA27r4l4+qw6wWvXYtmR1tIks0NoasxnSLtPvLLx0OchwcU/WecDAnyh01grWCECfGK0wUxfAOWOhZ/OBPCt8GoeqtXlyxsb45CmZS8441XqD4G96BsTrm7TD6e3NqHf/GmobMKrablhG4LMeD2/2n0mjwX0ZU1/Hz/FINKOUkFMpXN55N9waHEiJgDO5QWownXTtwpjekRXkCbgj9ZVhBZGv1m7w0KjPSZyP0aAdm2BdxYTFMtLBw9w5ywRw14Hagg6yem1h3g6gHffDy3QkvUFTBtcO7+aRKSyXUT7Q9HO9PmSIRCxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=0wCe0jb4+x8qaDG8CUgLub1fNaQE63jFki9p9MItvcw=;
 b=Iz+1k/b4125IqRfxpr7F2XMizeuQS/Zu+9DzmUN9z7V7afbHgQFztQ0igUFpTaxeoV89KacQ/HG4mY5A/JaTakxlQ86sNXwKJSVJATUd/dxJbLiXv/FDwWMy4SCxGwYP72W8m2aAPm0iTjDw+gYCkPD3XRtvJiwTJA5kD+oSO72okkhf6uNOh2Q3cmRpRL3tIGGzmOChKTtveyfK9bZYEgc7JmQIl0WIL5BjhEk9GfKaC+mMF4aevSHzTMb9xLyTSjFKrRGRxgqr9vJuF/VI2wV8cvHS40RdCx4EAwh9L4ZJJ1rZ9/Us2y6MJqwEyRS8+TWm6w2BtlJpl28ThigEFg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=0wCe0jb4+x8qaDG8CUgLub1fNaQE63jFki9p9MItvcw=;
 b=nKZ5L3kgf3W/KvXHtGM2hmTc8auGc8pHdCiFeJC0SAqiy2oOaMdOngveJYQJVrgX5WknVPDONFYq5iLR9huJZ92anoJbWxlhrFd50GPHscNAce8zDpuHAUbwCELtQ6h0Mp79cio2HLnxjni7NSTjwf+Sj3KtVVxSDr2ZkcUCFxU=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by PH0PR10MB4454.namprd10.prod.outlook.com (2603:10b6:510:3a::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.23; Wed, 28 Jun
 2023 22:12:46 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef%2]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 22:12:46 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     Petr Tesarik <petr@tesarici.cz>
Cc:     linux-debuggers@vger.kernel.org
Subject: Re: [PATCH kdumpid 0/3] Prevent segfault on missing disassembler
In-Reply-To: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
References: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
Date:   Wed, 28 Jun 2023 15:12:39 -0700
Message-ID: <87mt0jjkx4.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY5PR03CA0016.namprd03.prod.outlook.com
 (2603:10b6:a03:1e0::26) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|PH0PR10MB4454:EE_
X-MS-Office365-Filtering-Correlation-Id: 30d5ab1f-9c25-4d9b-f761-08db7824cd64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: P7p+AqE3qwIrfp4BElNbfUvnFW8xdfCItNNjNdB7E9lYJSKGChFr+J2bS0GG8hNuIHo46lG4e7W+tROcuvkdgz7dxbrTXm+bn8fr4OOB93cP64dMnaYJzz/oEMIR6n/YUnfKwSyzRczbFNuLyJYyggVn8dMjReStei1aT4p94vsSECeYmragqFFve205bBlt2zuN397QnK7dmBX4+yM3EUlnoQJDeMnDcU9jfVRjBcLG7zAAmkkdiR16oPJ2Y3ym8iA9RjWXVcMW0Sv8363wrMADS9ZvnX8sbRTlQ1w1hQM5MUeKiO6GcXvDzMb5+bCBvXEoRXbXSlXpl46taOcRvakZeaRVpYIVFPlG/vxpCV+Qo527gdQEPk38wUedVqbdDDme2/gUfbPm7tCvuiJn8x76ai8g5p984JieiZlT+XhCP+zJGURJw6Bkf3oJyiujU6jL/5ylIEb12AhIubWryJDh0RNo0tsutGb/3PxueNfQNubulwRRAYjgg97IIQ5Rq3O9hEQclIeSqlve+J+IYuSolrUu6b2nJt8FggA2maE=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(39860400002)(346002)(376002)(136003)(366004)(396003)(451199021)(66556008)(66476007)(4326008)(6506007)(36756003)(966005)(478600001)(2616005)(186003)(2906002)(6666004)(6486002)(6916009)(66946007)(5660300002)(38100700002)(86362001)(8676002)(316002)(41300700001)(8936002)(6512007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?BTG6kaGZjbZS9v2CklTSGZ8O+av8J2d02NuaOI6DqtHberPPG2mshB4ZMEMw?=
 =?us-ascii?Q?Cpxay/SteeuWL7WdPz/W0zo4pcA/XORf1vBr+Cr8sjZOsTOhxpOKorayqaGb?=
 =?us-ascii?Q?NadOjA9xuBzV7Z8tDLjGBmT0qyfpcmChM378QnE+XG1bVrktIS3TMOG4f8+c?=
 =?us-ascii?Q?L8cxq7jBCytWuKAr4n/q6EQ8r8xcg/hJuewXy/KkSjGKYwvDVc/0ADrI+7Ju?=
 =?us-ascii?Q?XuQYStFr/DONVZ044O6qJBO2GCUjR9/v2C0cHUByFdl9qi2BjNS9okJGr7Id?=
 =?us-ascii?Q?KoDX5HwAAlcoPadks+baHb1GDHj4D438pl0jyf/DsDHfiQerAZGykOZIooba?=
 =?us-ascii?Q?xI21fTAWaO+u14iC0GYmO9eX9Xn6NGTXPf36UVkqJeNRGA4F/pxvSbJwEBmx?=
 =?us-ascii?Q?FUAJYtb+FYlmMEP2fNhYbhR30VcC4y5INr9rinZJ3AX+SVzMQtbKlc+7n7l6?=
 =?us-ascii?Q?F8VzhNyBUMrELxhWzskQhuqbIQqaXslMNZUom7j9jbhubBcIF3znMDgQB9vS?=
 =?us-ascii?Q?h4Av691iHhdvqCHLKrvn4RF5v4b/a9Kpe0u1D9pKxe+v5JSJWtEsNDFegld1?=
 =?us-ascii?Q?nY12dd7W3tWnXc3aJdImVl4xNvL2F1wNzIanqr9JW4+yTBrzK4qy/4JhYTdo?=
 =?us-ascii?Q?jEPodxzj9YUIbuhKIfgIscpHHExZfq6MHYzMvNgnMr1cXsURfEYCH3Nx/rYe?=
 =?us-ascii?Q?7C7ls8l8KdMHcqCPpXCfrvDSQYclB/wIrZz/qFhdloIO8+lUz8wH5mrmpvNq?=
 =?us-ascii?Q?Y2i2O7Al4eU5aR9gHJGj60jLEyU8p0lhRPX76G3lX0b9fWcWvXDVCag3+ggR?=
 =?us-ascii?Q?AhLsSnVNK60Gq+mEmRolrSk9UV7wvU7yNeLlE8o3EL0d0VckkyT4CcxithDT?=
 =?us-ascii?Q?BffxKqy/DoAnGqnJaE/fbZrrc+0bklE5x2Ki4vkPgSnjb1lk61cZqJ3qPLIk?=
 =?us-ascii?Q?PfJFhSVG/cprPIng102ZT7eUgQHfOesQ667XGKheAwC+/btjQqKBHEEip883?=
 =?us-ascii?Q?YiJGlQjShkKVYdzPC0SJAq1t9+5j6KgqDxA9e/YKQXfcqmNCyk2It1EwqhZH?=
 =?us-ascii?Q?IrSy/c5VOqc/x2TuZNevlkr81Rkb735Z9gk1uA/nJEQg/7T0l54fIQKMlNXS?=
 =?us-ascii?Q?QjvAFRIm9RI7Xa51Ys1Lv2i+1LbnCjhkA4DdKpz3T7VNaK0CBcND3Tn6mCVI?=
 =?us-ascii?Q?S2jP3/KOik6OYXMgn2SkCfLjpBBRUTWkUXaCnA99rREEh2qhoR5YWnCgxKtV?=
 =?us-ascii?Q?ekzhsNCtAa+pdk0SKKa2ze1skrky8Kze1vwWPdslhgNRNnM4p1teDwSTZwhO?=
 =?us-ascii?Q?zBUUPcEgCWrt6AgwbeQ7sOZqYUWA0sn0i5cLI7H9LVusx53P70M7Y3qVQxJo?=
 =?us-ascii?Q?0YCTM6GSplSWJA18QoALXgV7RVZGj9H262erP8qoec9VgdtlNPEZKuvon2wm?=
 =?us-ascii?Q?B9lkApKR1vYQawd36XITR+rG1JR4KWRmf9RN2sJ3AZcvPDivWJLft1Pn5bkp?=
 =?us-ascii?Q?VEEgA+IX/mH20AEZueOozsb2SjeKpPKj06E/K0YSsz3Hn9I+MdPbdlkBOBTM?=
 =?us-ascii?Q?hNzjbGjeppyyiBZUjUoyLGWIp+Ez7A9MaxW0FBTvJvVERebMZBJSmPzKmA32?=
 =?us-ascii?Q?dzTbyjcHLGJ2hi1KWLOSiJ4=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ht1OYKEslyuuED2tPAxmf23xcufMbOxU8AbP2Qufb4e/DgR8cG/Ae+2J58OfoPcQmtK9yomJ/hkAv/PJqmWXb0hglFw/N6Tz0r9hmwC+n3HF2oGkqS6XqwmklKiWXEKD8qrrh6xX9kr+HK50rP7Ul0jurbJ2g4r+Vjc63wBP7HAEozqhyR0bVze1iYdihYbqxHTDrc7uETyPXGdZfs2av9cduylejZachRAwDuqW+zcfC3sgo1owkHgoRMCGN4QqPNy4YeiAI/hVDgSqwIHHQ1MPVbf5BBCXplmSgd9rLehO3NfDohsBgw0pxw9BILR4hkvywE6JUuWmjbkH16jda5qgRfM1ABhOECy+tz8WDYf7Gkgi/JRWPm4cuD7YAlcOZMLrZbH8FaZSrv+ArjwCCy+mxK8sk1ihLOZL6cUTgesujXF6HUsNkXQc+XmoifvgZc9WrP/f+g6ZzAh9JqtLS25WZLeYrI/UBkOoC7KcaxpaIluY8uyxn5ob7wGfANKpJLqAMmyc3lkDU89qyJ9U4QFb5AWFdMBSIJzRE6oKvdm5zIsMGj2b6BA99YPPPBWxsqmoNl+u6o9sB5hUy2OMZfTYZbvRFgeqH09Q0u+GddkmT00GDCm4CrSTuDi+3rQDDEsMXdOwuaUqpbPzX+U0gNM0oguTXPXMe9fN+2xiiXyXRZ9STTkJLWs/jvf+2JPnrX57jxm+2qG8t4BDrkY3+SCzRqrlubzfydwNjL8n2T9uAuxg2UMCBIUKzd5VPU66D9YcN1rb2VTbGqsqfqlXER6bT/4WKd5Vq4BxAPeBWa0=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 30d5ab1f-9c25-4d9b-f761-08db7824cd64
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 22:12:46.4554
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: mov8f8Jc5EOfKlCEZRN4PHklXdMXv9dkiXkDJYnJ82m1YWHLD4J5ZoFc6Zt1RUO+o6JXBsxQjsLX07kEIU94ZMdml8hHcMgQvycB0SrdevU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB4454
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 suspectscore=0
 malwarescore=0 phishscore=0 bulkscore=0 spamscore=0 adultscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280197
X-Proofpoint-ORIG-GUID: LIh6vcwK5px8ycksJklY_Anrs7ZPTAzW
X-Proofpoint-GUID: LIh6vcwK5px8ycksJklY_Anrs7ZPTAzW
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Sorry, I forgot to add one thing!

Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> Hi Petr,
>
> I didn't know quite where to send patches for kdumpid, so I elected to
> send direct to you, and CC the linux-debuggers list. Hope that's ok!
>
> I encountered a segmentation fault of kdumpid (master branch):
>
> #0  0x0000000000000000 in ?? ()
> #1  0x0000000000406aa9 in disas_at (dd=0x7fffffffde70, info=0x7fffffffdc80, pc=0) at ppc64.c:112
> #2  0x0000000000406d42 in looks_like_kcode_ppc64 (dd=0x7fffffffde70, addr=0) at ppc64.c:174
> #3  0x0000000000405616 in explore_kernel (dd=0x7fffffffde70, fn=0x405880 <explore_utsname>) at util.c:269
> #4  0x0000000000405d3f in explore_raw_data (dd=0x7fffffffde70) at util.c:465

As you can see by the fact that the code fell into the need_explore() /
explore_kernel() path... this vmcore was missing much of the important
metadata, since it was generated by qemu without a vmcoreinfo device.

I think I shared before, but I have a small piece of code [1] which can
locate the vmcoreinfo note reasonably quickly by iterating over pages
and simply testing the first bytes against "OSRELEASE=", since the
vmcoreinfo can only occur on a page boundary. If you'd like, I could
send a patch with some sort of "explore_vmcoreinfo()" function to do
this? I know it's not necessarily the most efficient, but I believe that
it would be valuable when all other heuristics fail.

Thanks,
Stephen

[1] https://github.com/brenns10/kernel_stuff/blob/master/vmcoreinfo/dumpphys.c
