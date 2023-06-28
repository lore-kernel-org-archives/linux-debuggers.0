Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 34B68EB64D7
	for <linux-debuggers@archiver.kernel.org>; Wed, 28 Jun 2023 21:04:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232011AbjF1VEB (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 28 Jun 2023 17:04:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48498 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231963AbjF1VD7 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 28 Jun 2023 17:03:59 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C02F1FCD
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Jun 2023 14:03:58 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SKj5wj025436;
        Wed, 28 Jun 2023 21:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=MY6aeQjuS61CqAvlf+ONgCjeIX74KJJxW7HA8WGeV9I=;
 b=pzoBxhr3QlRWSCwe4FxB6geKyuUoorEo9SPfZXDyA0v2ke78p7h0/SqgmyX39j8Qd+32
 Gyjfbwcycr+B5dGX2hQwkQCZ0u9rlwHZ4BSJaqWqlV4TC1Q6bUBzSaDLuW37rEq8wSS0
 JDsjZMEqyBrd1Q5W2YKHriJnRFn5UJrQhcUdIoh2l5fxpaRPA7UlcSyBXU7NC9v6kDs4
 QDFFi5eLJ02/niBHXBcfxKF64B5eVNTsoZqQOHiHFdpHGxC9dyInc3BmSSvb+YGzqysh
 zhWM/aBLqWy+YwlCRffzvkKTYhtIiKJ15VDPlsDK8N3tXfUPZinsaB4Hta41zk8DJVa8 RA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdrca8w6h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 21:03:53 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35SKhqu2029663;
        Wed, 28 Jun 2023 21:03:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx6jjdj-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 21:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=S+g1Cqj5zzqAKqRcqrM9A4Vp0jNhcOOviyUxsyY1b1EjjO38d3y3JQ6X3E0/OVavvT369lw+FH790nhuNt544VNi/7lAVioYHWlnWlDKsrb7VGUbKAwz1VrjaVQkf6cbroX3nWmyy8rvX8NzB80AhKeTGXTfTkPcTEV2lBzsZN+s8EXgvDsFxRzwZtEaYmgwCZivsBr9uUfUZZ4Yemv3GGFywopkT48mlzRjZCSJVPWZbVs2bi/CQjJTnRLpFK+d+BNPFv6NHQwEcOXVZAHVNhJeevrhcboavyc3uEVc21BCMXP226pKjoAcaWdv2OeDMf86inNmDyPnoPZAvVAYnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=MY6aeQjuS61CqAvlf+ONgCjeIX74KJJxW7HA8WGeV9I=;
 b=fORbHF8J4tcd0xivsCcZ+5IFwP6aIPTyvO83CAeXNq4N3iZQGWcGGmNUvHG8Pa696rfqHc3EQnQe/ByJPhpkZmhV9BpS/aEgnqo1dHnUyp1WEKwbU6lIiofrdOljdXuxRY7jD/U39JzGwBY/D9k/QR8k04S7QA/RV2dvfwBrvYx2nUVpKsypYyACLNJL8bczAT5IDJkDKoKdmOFyjaR5CFugQUZ7lPXwNN7R0qohn/ONDHegR37vvMjlqkdFW8uyuwmcLvfVOzYNUS2xN6RoX51KIilmPy/j0P6CqQqdW5AJ0yYK7mfD9tNHE4c6rjQhJ9gIA0UnVJdqDt2S5Z/Omw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=MY6aeQjuS61CqAvlf+ONgCjeIX74KJJxW7HA8WGeV9I=;
 b=uQ3tUKuqotXarj/XenQ0PzDEszTwwT574zZ/w2dFfJVB5WmN6nZalI1bT/oKSQUJGJMYffQd6Q+liH6C07uXRIHVXHtx9U3M1qD6LietbUwOnmi/wEGuUF9Ex88u7Y06M+MoJbCs/ABwdedB5C2nzTxeIFvPlJFpGuG5wdnX0F4=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by BLAPR10MB5219.namprd10.prod.outlook.com (2603:10b6:208:321::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 21:03:51 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef%2]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 21:03:50 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     Petr Tesarik <petr@tesarici.cz>
Cc:     linux-debuggers@vger.kernel.org,
        Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [PATCH kdumpid 2/3] Use -lz unconditionally
Date:   Wed, 28 Jun 2023 14:03:43 -0700
Message-Id: <20230628210344.357073-3-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
References: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR01CA0010.prod.exchangelabs.com (2603:10b6:a02:80::23)
 To PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|BLAPR10MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: e98599c7-5f26-44f9-59fe-08db781b2c64
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: w+opHl/UOCtdFZLf/7okD+AioD91wzEFP5xH0TL31wvizeh7GgcIXvfQwuLTRdKN9fmGN0FMPq1uVn0jJVViRl2F12yIUz0IgyzNSSJ7ItiaxxRFJpw4WSTrCvbzkSmZpluVBt8Vm3TZuoWHwNdoneKdG8NEwzqk/UmF1tFYMNfIF1/pw97Jz9MJuaC/jFMTNJPZsZKuOixs1e4+dgRwQ2An2S6MkyLYbWov3AdJB7qov95Y5wt79QQ/pM8pgFs+v00R2kKQ4TATlyAIuO5qRwU9u+SlNeDn92UZ2OljzHmvnWOWTz0vVj8NQOkRhijynw2pG9xskJemlcOgFACcBroqEe0grPerC9f1uWMlcIaAKoUOUkrpYcNJp8WP0nlvc8Mea069RAwFMTUQps47nVpjTnsrHSwHTQDrPWaTVIQ/iWOvqeoJC5F0G2Ewje149otMa/scdTHLho7dqy+yioSgoe5gC8nbGuNFztRKVO6qM8lre6YgBoc1y38B6gAFensl8Ei1n3gkOQEXW1tdsTp/laVb9pZVlaHW6NyyVehGDNMMATln9pTvVK5NuqA+
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36756003)(5660300002)(38100700002)(86362001)(41300700001)(66476007)(6916009)(8936002)(103116003)(8676002)(316002)(4326008)(66946007)(66556008)(478600001)(1076003)(107886003)(6486002)(6506007)(6512007)(2906002)(186003)(83380400001)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?KOu8BlHSSGnKXTfrY/nx/Ss0xFscIk0Dwf1Qw2K1vZkIOyScLWLXBAoRR57z?=
 =?us-ascii?Q?3sOcBP8+TVXPjJ6dMaFHNoJAarL0Utat2SIj/vXboMimTLSZ8ISpL8bN17p9?=
 =?us-ascii?Q?m1GjzYKzIP4ShhvrGlCnFlFD+9nL95TDnCSF69rhyJh0SjCNhvgnoZ2vTNYB?=
 =?us-ascii?Q?VfdnDO0vpTdBmQGPFmXq0ZDn48Qm9ElUn2+31ygc+rXwdi/oOYv7RxPZbL7j?=
 =?us-ascii?Q?eY8fNJznigmcjD32oDHFnkM0oaImT0EVsgI/3ENIGV3HA3SeV+K+mrxLYAxd?=
 =?us-ascii?Q?/35rl9D61EyCJIw/MeTwJqc5c8W56FbEDQx5Fy3LL/12yBDjVR5S6/OSDF/y?=
 =?us-ascii?Q?ao3v/ndN1kJhBk+811m7+PQZVNCixrQ8J8nwXI5JfB1yUXMCEbNYqECjeqLK?=
 =?us-ascii?Q?yf7exxm3pZomooWhHyakjY9kG9tZu9WEF2ewF6nM2RdzE9O7K9HGbWfQyZ5M?=
 =?us-ascii?Q?VKzkoaUq4li87+wluBTPZB6j6olsKsCyP1+Xe/qIvINGKk2gF+srYefXB4KD?=
 =?us-ascii?Q?un4iLkahIfg8heEmaaSR3coUM2bpAUgaowQvZoeMcBnJKwqf/pjoq+k2JzkK?=
 =?us-ascii?Q?BjMX2ygIJEepJhUUgztXdSFCKHzsJ22YeUpOVWNkS59AiyFeEENr/KwODzAn?=
 =?us-ascii?Q?QE7WZZS6gs+fNaY7oD1KyL3ZNAeBvNZMu+NBEJkfufE4X3SFA9lHIqgirkfc?=
 =?us-ascii?Q?gehCtjBJOd5/PGq5uDUS6R5/cDk66G3UR69WMlPxPkQrm+NIlDW7VIBr2W1j?=
 =?us-ascii?Q?HLdGOInQ1jcn6wHQY/RB9xqVMzvE0NtWe4VHsM+hWOHpaqQb6bg7cK88WBSn?=
 =?us-ascii?Q?Erwcrlmj/yVuRaHEtmEW4FELvE0FAPbFq4oYALN3gX3dldKfm0YrFX8mEYWG?=
 =?us-ascii?Q?gcmi2kyLkBtqo4CWbVxcysHblKgiLIjg1kmAXl6ybvQAAhFSpbsfd2ihUPvy?=
 =?us-ascii?Q?V9rLGU4/Rs+vifz0aHQEt4zUdsU8NPG3FAUhUGyy3o5ue6tx2aTGAvWopief?=
 =?us-ascii?Q?SHhljgvnLyC+srkhM8NPpaShD8mkvtyrRJS8/muGxtIbJUqWX3oHxKt2Il8R?=
 =?us-ascii?Q?zbjH9B0zWaWZiFEZn0ZGdTmnbQGFdY6JTiHUdEUGhOuam/cZ8l4I1dKVw8KK?=
 =?us-ascii?Q?70YYAjC2fWNHcUfV+rtgxEzYa3n4ZFvmZ1xYWIKcAyoOG3Ki4GVY4zPZiRtH?=
 =?us-ascii?Q?CYBCLOJbCYk6ZBtrZZApUdB+TU9g+Tghtz1vZ4VYE2Q0tyVFaGVTMawGSj2V?=
 =?us-ascii?Q?P9pd2Osz5IelOgU+Cc62B9JFRzSORPuZwgCEBxTZL/yiuVRVGBvPLdXtugFG?=
 =?us-ascii?Q?hikfOrT1fhlhnWc3ZRhTsDAJj+rU8HHdMSeZ/gBS2E7SgM0Nu5WcpQqPHvXM?=
 =?us-ascii?Q?dU4S4Xr2ddq6wcimXfZmL3qnJIReQOD776E7kQ4gOweqaB1MQFknqBFBesgX?=
 =?us-ascii?Q?OyOYnOrGoH51NYpd+xEDIA3TD4lOCcmcGPW/MIoBZWSy95Ok4mX7F/7Yx4Ru?=
 =?us-ascii?Q?hP7V0hXOybmHkk4r4KR0lYiWOaSfbPIW6fyoEz4oR4N6+FX1skU7gpY0fPZG?=
 =?us-ascii?Q?8n2cBm2mdMFHNtpeoXeeDPNaIh84Uon+VfPFFEG4viPKoDHM8m2/rKAUMjTj?=
 =?us-ascii?Q?WiRFqrOAlaK0zQ320obnTvQvHvflnk1JSgZ4s66sTNnQ?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: kQYxTpllyK+z16snmi3ifZ7ID/wgZVCPHVsal0wnZH5Gy9oSthnrBlWra4K2Q9xnXEZAOOWsmv0TrXIcc9ib32zgvr1PfElitkzSfNLCn6McDPXalxgjm6+wydBTahMPqR8i3gRM2cNcbGyy9UsEGTJoZnKBDczo1p4qkf9CnE8bk/BRQz9uFZudPoKZbhy9/0ikmw8p054hVG37FR+vDRRGpD99KBDp4QLkadOjyBP23B7U4uGL52EzzqaUJwzJyQkcaYNW39LG2aup+pw6gHRMzRpRkJlbNwn+1ykT2F5l5it0vu3GzY3afg482fYBzpcmFX7V7QP6/Ccuczqp8HeEWg0MHykIcZmlr/Qu6SQ3c4FBy2u432rxKt5M/YC9dFiqxEoGgakILXWk1rVTIsShZpdx57Rvf++L6poUELSamHVE5etsxEnpvSCqHMwHaE2QhUY3+h8ABBat3agLhF6UnY809ZQZzMZyfL178U44lnuIFcFi7dWOBkBEvluRW36i+E+h3PQ5OVWmWt6XCCmxV6zwvrqGYpTisN/AMbwtkhOQ4bT2xkuDuG6CYv3UzMuxT6Fa8N7WgDZm4azzLFLmb96pAaINb54QZumMQs8zG9ITedv77/yqO6UIw/f5Y6+bBaVpuLtQHes4DWOwX8DOqbAkfW2uUohIQK9TDrMjbqAoe/tQhj+7X9kjOtfTjlcmE4sBCAXAys58S8PAOoBiQ5B2vXEEUZJ7BtjxfjskVtap1OUIO5nCp448sIBRG/EWSif5FIGrYPWASjZrqhtuGPJ7CimvyRRX0A80lhU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e98599c7-5f26-44f9-59fe-08db781b2c64
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 21:03:50.8326
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: JbeYXfRgNmx0vz2oqVhg8LzuEMNmOxYvDvhCUqawWEucUZkDfp5syOkxIvYOFqhc49adYc4m6mNe6yNY5kLN3oY2X4lF5fGZMFylOftEOeA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 mlxlogscore=874 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280186
X-Proofpoint-ORIG-GUID: uMSmM1Vj-W16Zn-r67ynt4OX3RU9mtyH
X-Proofpoint-GUID: uMSmM1Vj-W16Zn-r67ynt4OX3RU9mtyH
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

The file util.c uses inflate* functions, so there's no point in testing
for libz: we need it regardless. If the test in libs.sh fails, then -lz
will not be appended to the link, and linking will fail. So remove the
test and add -lz to the Makefile regardless.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 Makefile | 2 +-
 libs.sh  | 3 ---
 2 files changed, 1 insertion(+), 4 deletions(-)

diff --git a/Makefile b/Makefile
index b8e88c0..eebcafb 100644
--- a/Makefile
+++ b/Makefile
@@ -11,7 +11,7 @@ MANDIR=$(PREFIX)/man
 endif
 
 CUSTOM_CFLAGS= -ggdb -Wall -I/home/petr/.local/include
-LIBS += -L/home/petr/.local/lib64 -lkdumpfile -laddrxlat $(shell ./libs.sh)
+LIBS += -L/home/petr/.local/lib64 -lkdumpfile -laddrxlat -lz $(shell ./libs.sh)
 
 LD=ld
 
diff --git a/libs.sh b/libs.sh
index cd491d6..6cc40bd 100755
--- a/libs.sh
+++ b/libs.sh
@@ -28,9 +28,6 @@ if nm -u disas.o | grep -q '^ *U \(htab_create\|splay_tree_new\)$' ; then
     LIBS="$LIBS -liberty"
     rebuild
 fi
-if nm -u disas.o | grep -q '^ *U inflate$' ; then
-    LIBS="$LIBS -lz"
-fi
 if nm -u disas.o | grep -q '^ *U ZSTD_' ; then
     LIBS="$LIBS -lzstd"
 fi
-- 
2.39.2

