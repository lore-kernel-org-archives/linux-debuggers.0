Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7418BEB64DC
	for <linux-debuggers@archiver.kernel.org>; Wed, 28 Jun 2023 21:04:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231956AbjF1VEE (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 28 Jun 2023 17:04:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231984AbjF1VEA (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 28 Jun 2023 17:04:00 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E022A1FD7
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Jun 2023 14:03:58 -0700 (PDT)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SKiZDV026698;
        Wed, 28 Jun 2023 21:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=37mFy0bO6qm57UJ1J4IkBbfxtCHDne/U8TQoe/7pDZE=;
 b=l7CTgF3D/m+e/1SVkbDW8zWRlgnfmzLShIJnJB4/iUYZdO2YmA0sO7DRygs1EutzwkeF
 9xULd9I3E5QRLUS7kmjTk3tU6PL430jRdoI6ReAZOD2sOwKwXJQawrMCxslJOvgbzWah
 nE8JBBXzREQjjoZAu/XSOv9eNPPH7c2biym1R/vlFsgKsXvwY+EOL+dPirYnp2eSaCvp
 Yi4onUC33g9m7QRUWvAi/w5JxHikCDNCi1pVSLT+136sYhjvI10HhUcaS1Ux5YFH8ccw
 NO5AhltPxminLS16/8N3Gw6ulfjJ4s7FEm3T0AxSbqyXHZ31USXsrN18CUXqzvQyMQs3 Qw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdpwdh3vb-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 21:03:55 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35SJxDTY013075;
        Wed, 28 Jun 2023 21:03:49 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2170.outbound.protection.outlook.com [104.47.57.170])
        by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx6t0mr-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 21:03:48 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Vb4jli38QDdK9gKc8Ughom3JChuR1KUEh0U2eDT1ZGxfy+LdMWFq/hH4h2HWeH/smKivCmoLqcQtRaifLn7SJpXu0GsvtaZZEiEwjqMFC1pDMCbO/CJ5fHVu/ae8HN2LoI63jR0S3acoJ9WEdzbTXXL/OQeleaDc7kIedtq7cskEVzzar4lbXJ7y4/EhXo42taSLBJJkxmGen4kFLEaAzqVLXRkKZtgriB99IGGgrgZ3gF4V2oigX8eeapycnRyK/HqWXNr8cN+Dx3AtVLlWCi5UIN3Wtx+fXHvHuCzi1ArpybExgvtwHftQahRZMGwU+DqQjHw+GZzSNmBtcf2rLw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=37mFy0bO6qm57UJ1J4IkBbfxtCHDne/U8TQoe/7pDZE=;
 b=gIDaOdOKnVA6zq24A3TaXCy4qY1FyVTd6t09VdKuilP1RXZz0MPwykk+SoOjeHo/OxrYMNQd24MnJMD/tAVlgEOAV535ejNLHFsnsRR/A4uTUVaxNItiurYvRQbxEJpWoK1YBXUTYQ+h561RWa0NkuLKEEP6IP8IxTAsELvSbLD8GcFktsBsMucnHn0GjaMozDhl09iyTlo8sNuxFd0qiQ5LNLP8OVNPsDcQwZ2cbaXr0xNIK0ojbKliTWpzvrigt4VQ1nS+/ae9CkrYL2GS62Rb1UltvOANCeIrgrqf6siqcUOtHPHTuOpxxPQy9IY3i8iMtMSDiGtRzqBaLMpGTg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=37mFy0bO6qm57UJ1J4IkBbfxtCHDne/U8TQoe/7pDZE=;
 b=UyUdwQOdGQU39Pw1U0gImoxyu51drxNIcVoy3j6p43cXeazayUs6LVPPCGPCLvaB6+4RfGc/rjmUQ4xRCqOvV5iPmo7bae52cJ4JIwyBGT3JirAvWbMjajGDoguucoVst8IyoyfwN9tqJQgNlZ5V3RHx9IckQLV3RO8a8kNJJqM=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA2PR10MB4715.namprd10.prod.outlook.com (2603:10b6:806:fb::10) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.24; Wed, 28 Jun
 2023 21:03:46 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef%2]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 21:03:46 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     Petr Tesarik <petr@tesarici.cz>
Cc:     linux-debuggers@vger.kernel.org
Subject: [PATCH kdumpid 0/3] Prevent segfault on missing disassembler
Date:   Wed, 28 Jun 2023 14:03:41 -0700
Message-Id: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.2
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0113.namprd13.prod.outlook.com
 (2603:10b6:a03:2c5::28) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA2PR10MB4715:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a02a690-89a7-4e70-edf9-08db781b298a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: FMGcx1+8MIv+Z5lO3M1ierug2KS0Gj6jFnUW29OxVGzrLMipK/8ucXj95W7CC+v9PkIjFdRLteJoMxwA7rtlWVU87JN7Z9fYzzDai3G1d0KHtiYUPYrlZG3YQ3Y/qWZ/XC8mbeOVp7VXcuEaDLOnahFc3xY6lGYQeC1noVIjPPHGnmk3pjb1GqihJ2kgOxAF7NwugDkUQFXpoKs/Kon9ATPdxYEnyhrNF9v0Q83kCRC+dMNss/o6CtJf0WPrdTy4B0Sb6c0wwJrqIoxisJK1T0TxFUTdkoX/qGUqwvQ4a/pjsmy+Dt31mWy03YQMrJkM3Ta5fKJ5Pw35p8jJmAorSu7li+vyIxrmK+ZH+fqBqpCfy6SGRJj8DX2DDjeNeGU0RLdP4ELBR+NKrTEUxFli2D4Wu/87lKSrJdy6mH337fi8UDyT4wfgMZVYIy9fNTf/lk2PFckyQv8Pyu6Cl6vzF+WNPbTmIk5muLkpB2FcAi/iw/FSdgSr+dTiooB20WsEhLviK4MlZNwtbaaSIM9IR/LVZc6ZqgZBUQTswFGBwKkSaGR3bAF1I70q0lRdYSnT
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(39860400002)(346002)(366004)(376002)(396003)(451199021)(38100700002)(83380400001)(103116003)(36756003)(86362001)(478600001)(6666004)(6486002)(2616005)(4326008)(8936002)(41300700001)(316002)(66946007)(66556008)(66476007)(8676002)(1076003)(6512007)(6506007)(186003)(6916009)(5660300002)(2906002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SDZaZKfMMa14MHldyVwlfohhAU7YUYJWAJAZ7aaZ7V8wy8e9bj5UM2xy6aTv?=
 =?us-ascii?Q?69rRQpWffT0ujPl5AreaO1KbOdMYhrNN1JqZtf+fBwpDdpuggYbvv+b+IAu+?=
 =?us-ascii?Q?yB29WKmMku6YaltK1xAk74hTNQ+Wgaj2XEIPw1233SkHsgLo/kODL+KgY3rn?=
 =?us-ascii?Q?1d2AuEXZUXODjFVhwI61sM0bjvtda2JLvU4mDkSEwLZ8mpJlR6ukCSyD0rXK?=
 =?us-ascii?Q?lXlSabV6/rgHylTsAkgPeBvkBWvpuP6KH/fMhIDzus21U17bMN7MHbRzL5nq?=
 =?us-ascii?Q?2lQLOVgjHT3LunUOSb2rDiR8mltxIacm055jjLpyFuq1LMQYjrJrIx1TEJEp?=
 =?us-ascii?Q?mU7FHBfJlbbG4+5AW3/18sRqYVvQe6fQ4W6lxjS+a+qs2OpMqIcCdd4B8/cH?=
 =?us-ascii?Q?UjTLF6KGgnYhEbqtlBt1yKKq6RTZHj8APeLKrgGNIPKs2kYdUzaPqlcQ2R06?=
 =?us-ascii?Q?hd69fO5ykyORGpml9jk6MCqYdvuac8h+AGckfrpmVX0/T56Gor6u+/uzEYf9?=
 =?us-ascii?Q?LxmHAbu/3y6G0RiB7JoH5wgwgB97YNH8LBufB31XxlG97LSx287UqvftlcGE?=
 =?us-ascii?Q?HYVyfBHE90kE1Uy/JUc1L7YM03k10EFn1e5LIqsU698gPR9NOsqUngpTcf+g?=
 =?us-ascii?Q?q1z4tMkTw0rBNhl6OfmqOne8RvCbDCHYXwFi7UmojBool8QTAls+2KSj5/JY?=
 =?us-ascii?Q?Oh1qKntd8hm23PaYmNXHOTp84rCM5ImIxQ20vstUkFdG0l8IpffuHII3RfV0?=
 =?us-ascii?Q?RbCPBkazyvpWvrSX3YqWMX9QAvytLFioBmgnK9b2uqxjzgMA1l561VUyRKYM?=
 =?us-ascii?Q?HfWIPJ0xt4hhxK8/4p4D1nqJeGWLD4SCxWpRmBH3RkNK4puRtzbqefg/POaZ?=
 =?us-ascii?Q?AVfjg5qVdXCDbuBw4PRE1FLBUEGDp6Xwl/yd3shcRvOvH8UKm/hFPT7GcJ00?=
 =?us-ascii?Q?gyTlf8AR/9PKGBs3PhoW1ld9iulRacjTroTu9RPMOEQKH3OVplkyfusG/n6d?=
 =?us-ascii?Q?vh0zMfeCPUKRknC9GQ8+9cxWwjlTJVE2LU34xsQwkCJa61S9fhgaE4JkHrtD?=
 =?us-ascii?Q?c/4uNMifEhkU1+HRTiMnkcutCAVL5vDqHLp6IevA9DkqF6FTY77YG1rcIrrg?=
 =?us-ascii?Q?kwQ/uVHgjRIj6QIVE1lc+Kmh/Diq63qXEOfuKMeyRTor1yVu4ZBqcrQFbvVO?=
 =?us-ascii?Q?q7/izaAZvIUk8hckoVXqzMdColkxi7gE8PqJfhgkClgicZEVK4i1Pq6g0mLZ?=
 =?us-ascii?Q?yCwva5Yy+AmyJihZdmdCWTn3NsVldDzDmtRpPrevryG3GTaZC/6mj5UkjSzU?=
 =?us-ascii?Q?23UAV92azsTiACsLft+Ies8pcwsVrymyndQx3g1l+18kun4DEjcOBDPbCXHW?=
 =?us-ascii?Q?JE6WIL5T3Rm0lfJ+F0qtzeZ4lkCryjZiI95qkYXziu++9ESo4MUoyLZ5VRFf?=
 =?us-ascii?Q?7so8mwqQmxFz+bBoH9fSb+4qBArqUEfsoGNu9EnB3Uo5TL2fsUpOnhFoszSE?=
 =?us-ascii?Q?LAoZRAv4Iv8Y6CYOFHrTHu+OIC+hvy5ER9hr5Fn6f13Kk/eJ03eraTfKX5o4?=
 =?us-ascii?Q?5oAKdtNztxagNdJ2bhaSO0ixJY+nvg1Q+5Yeqa6EaPImrRN2My2o0xqgvJsV?=
 =?us-ascii?Q?rhuqnHFR4Jvym35Ql4IM9t0=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: nTvn6zaKflwgEDHTKBeHYQZoBkbT3yxnr7dBJns1mr2lULmUcRoKoqpiLB4fDijyTn8RwwpGr5+Kkppn3Zvc81pcschZdZgInD4Fn2Sfi8Yb6i7jOskm820MceRs2R4/LLTGYVEL1/kpMGmiDrgOR2T2oADQKSyCyiolvF3igOOTLC8GiIWXdhfLlXkkQwqB4TjVr23S8OU/YmNJRjftgK1APtmagIILlW4/i7wHqpXOSs/mYOVde/gxANHlYA5odozxcQlKi5dxART6OY/rlN65lyeunFHwTwmi+7Ej7Gso375g+AYzV/u7xBYP2Y5Eady3bOeiRYhsNwXOdXzA+Ycs5N+/cG1M6ZkyhK4NRtR2JaLQgrB29Q4OTAldUy3q2+mZUFMvHEahTnvmipUmjpbVMKGkUDTrqWoHhEy4iP3+R8Sk69znsxybTpmH1SWovUeeYGmVjN9nGr5BleFVmr1OZcnlq1/h82fg3P3c4j9HjiI0Oj0vLmqwfsrl1jPCSyDenju6JxszlwoswEhAFFxaBtfPT5cUqGgH9wQ9t1bW5+bqZVAkFVZ0Kaj4kyp2RkaLnTAfJxfhbsyZ727dW5Ru1dAi2VeBd2PgVqLoa4KJQBZiEQBw9OQAiW+3JwQAZ+oPs8iEqKLaU4QXQttpncgCbbyODDEUU9QW3jwiCskWOg8QrTMTg81i4sV+9TgXVIGbU8xwLhroGnqtWg5eTIh3UeLdCyYrmmYDdbkCmzKP0zDP7omnlJNaRgF09PyFZMSVLx8NO83hFHNoANK3Pm7MlerrK2Wsjrhvy+0xHzM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a02a690-89a7-4e70-edf9-08db781b298a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 21:03:46.0965
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Ps0ARSMnTT/er9Z93VtvA67O2XmAE0KzdX7AJhZ7s5LDKVOtUDTrfoJPDauyQMsqZY+fLJzxkXVUxlZqSOvjbEvgBIrpNDETFLCkpFcQSMg=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4715
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 adultscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 phishscore=0 malwarescore=0 mlxlogscore=594
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2305260000
 definitions=main-2306280186
X-Proofpoint-GUID: hzWuwsOsgjKW0iDcZUiEG5sKoU26zZPS
X-Proofpoint-ORIG-GUID: hzWuwsOsgjKW0iDcZUiEG5sKoU26zZPS
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi Petr,

I didn't know quite where to send patches for kdumpid, so I elected to
send direct to you, and CC the linux-debuggers list. Hope that's ok!

I encountered a segmentation fault of kdumpid (master branch):

#0  0x0000000000000000 in ?? ()
#1  0x0000000000406aa9 in disas_at (dd=0x7fffffffde70, info=0x7fffffffdc80, pc=0) at ppc64.c:112
#2  0x0000000000406d42 in looks_like_kcode_ppc64 (dd=0x7fffffffde70, addr=0) at ppc64.c:174
#3  0x0000000000405616 in explore_kernel (dd=0x7fffffffde70, fn=0x405880 <explore_utsname>) at util.c:269
#4  0x0000000000405d3f in explore_raw_data (dd=0x7fffffffde70) at util.c:465
#5  0x0000000000404c98 in main (argc=2, argv=0x7fffffffe168) at main.c:248

The print_insn function pointer was NULL and calling it resulted in the
segfault. So I've included a patch to check the return value of
disassembler() and avoid calling print_insn in those cases.

I also added some fixes to build issues I encountered - hopefully to
help you avoid autotools for even longer :P

Thanks,
Stephen

Stephen Brennan (3):
  cdefs.sh: require bash
  Use -lz unconditionally
  Gracefully handle missing dissasembler function

 Makefile | 2 +-
 cdefs.sh | 2 +-
 libs.sh  | 3 ---
 ppc.c    | 2 ++
 ppc64.c  | 2 ++
 s390.c   | 2 ++
 x86.c    | 2 ++
 7 files changed, 10 insertions(+), 5 deletions(-)

-- 
2.39.2

