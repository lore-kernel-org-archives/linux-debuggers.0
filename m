Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E98EEB64D7
	for <linux-debuggers@archiver.kernel.org>; Wed, 28 Jun 2023 21:04:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231926AbjF1VED (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 28 Jun 2023 17:04:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48502 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231967AbjF1VD7 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 28 Jun 2023 17:03:59 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63AAF1BC5
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Jun 2023 14:03:58 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SKibcS019772;
        Wed, 28 Jun 2023 21:03:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=itNAQ9GYnKMdOoxjS3zuvyVS7NcTO8qhhYzG7suMO8c=;
 b=zS8MtaY1UaLhmszAFC2/JUo/XHtpTr4wrMgQXRhq0VtxaIXRKdSdKJTTZ1OrmXJPZvgH
 J8ygld8ZaFTUGhbgcc0wNu2wU8gWkkSuB1uAzGuJKVsOAt7rcAOUUDlb2hFZO2VOt+x/
 XZctLpKbJ9gINx2bC/cTICmxckIJz1VGchvyYJhScODvUMZqD0PrNrA9j147r0DS79Zy
 ChYKObNwk1qF7TmeKMwTgud9gXfYsAhhSxof6E0BKYYD1WEgOl5bwR0jMtMOuf/2q86x
 rAXeEniOfKGiKTvzN0h3kASsyEKT7S74l8wAOWJtebcGE2CNk9DcAAoVCPCvAOttk33X Qg== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdq3119ag-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 21:03:55 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35SJh2NR029728;
        Wed, 28 Jun 2023 21:03:55 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2041.outbound.protection.outlook.com [104.47.66.41])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx6jjfg-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 21:03:55 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=bg4vQbefg1hgLtM4C7uNgnEHipFQSg7LoW3y8w4JxIC6pbfmzHHCFek1t2JzO7RO3EkvV3vW9ubkY87SXUB/8HMrB42KdcmuqvmgxYSM8N/jU0KumwXXuFWcIliofYuguVWW9TVMlYe208Ga6mnZWrpqcs4lr6hYqxuKEH6AHYxmkBbZNAp/P4uDPG/gJJmH43rLrW2VRUiWpQl1vUMnoso9QH6CpsOcm6tl4dA+xymO2QLhw1yiuGS03SkgJYOPO/5wGhhzYCWr2smTK3I6UGNfc61bBIUxxIESzE6D1zF2X2CGvW3CucaKJzNhY5K40Dc6WDTi1eUXWead9hhUew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=itNAQ9GYnKMdOoxjS3zuvyVS7NcTO8qhhYzG7suMO8c=;
 b=T+HcXxhte08HAELaNHqcumgPdmvvyl5wsoPj37tNUX87EsLAZhJkZ2OeiUz5N3uRlyzLFeFD/MwsRF11GAtn3WQ7sh9rEXezN6qxjpw6fHeHMyolU5vBdZJHPUVuU5ytBp/LenSp9yBXTbyx/8mhjnheKhtrA9sq0npAMztAJfZHR4THPybTota5TgzR0rk0a+MLEzTXCoptwxdQ5Kr04G7xTNlQwn1h8iCZO30rmmXQFHDwzRsXnA1uxHqhBfNogWUshpK9YRepe8C3lOwYkvTsKP5CJYTTMqaDdvoEZ8MywYAXViCjBLCGSz3RSns6cVdajI6ordeZBR1V2w3keQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=itNAQ9GYnKMdOoxjS3zuvyVS7NcTO8qhhYzG7suMO8c=;
 b=Y5xkrefF9XPKUlgnK8ncY5W4aRx2FwEXjv536arNWYrT2eAM17uA6ktK7qql0H49Ctm6wJA2A3uwcKc5b/Ce83hC4ZosGSG6/Py2WpgijXCo8vTFRvLxXvgWShfDyuexqOsIu4lk0MCKEg8+pEYUEmylW0eH+Xac+Jxni0WL04E=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by BLAPR10MB5219.namprd10.prod.outlook.com (2603:10b6:208:321::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 21:03:53 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef%2]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 21:03:52 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     Petr Tesarik <petr@tesarici.cz>
Cc:     linux-debuggers@vger.kernel.org,
        Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [PATCH kdumpid 3/3] Gracefully handle missing dissasembler function
Date:   Wed, 28 Jun 2023 14:03:44 -0700
Message-Id: <20230628210344.357073-4-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
References: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR21CA0027.namprd21.prod.outlook.com
 (2603:10b6:a03:114::37) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|BLAPR10MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 5414f255-7cd3-496e-6337-08db781b2da1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: rmEPrwy/UXXL8VSTjPhSausz5DcMswnDZ/ffm4tWdlXo0CwlVkkrqnkrCPVmpVsOdISrJICjVjy3g+oZ/d9Lu+glJRxLfo61yivgE2k8jI99diWaAMJd2gItUvicor+QtfKA+qttHdBepYuCUsFav7dFLShLZRmeJi1tC9RYgxMxoLDiBkR+eV7LgLWzh+1KYQ+HMsoANOpEnvkaVWOOgtAcAAelheHyzETQXTuaZeHj04AHVHKI/SdiLSPNXGYFu2vbyJoAkkZoPiXjuzk6qB1voOelHL3RPG0GBID/KVMp4zklIZz1x1NitOpZ1k8AGG9+FFOXXMNt/E9u4gF4OxyDXGtdTUi9HxQ3kQ6RT7kO1AxgRZfa9ZzqpKUp0lRnBtMOh4FbWj5Tn92EsX0HdyuA3YQTE8k5cwIJAohQVeGoH7KZMDw8geuyCRyUl+XFTXXZo0KwZtPWKAHKbiUIFfLukEUmFJhQjqOwPN7HIEp0NaM9ObBs5ADicXAcmhfLhH8Eu1Tw/ntuNUA7scAEZhwl2RS48mN1Gfa95sSPLuiYCcVLOEkaVhVsBtkWJk9r
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36756003)(5660300002)(38100700002)(86362001)(41300700001)(66476007)(6916009)(8936002)(103116003)(8676002)(316002)(4326008)(66946007)(66556008)(478600001)(1076003)(107886003)(6486002)(6506007)(6512007)(2906002)(186003)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?X14DawDj+vg6GemisUM1S5LqOwAOG1gr9S+/dggrm1hcAFY1fGx9Jw4Ay5HH?=
 =?us-ascii?Q?Mr68nwDHQbJe9MkjfC9NhPoT6RrN9k6IigyOOnt+nobTTs58GZLok3gSthgz?=
 =?us-ascii?Q?yhkZHeJr/6H/h2nKvdgtn+sYTgUphsSMdxJamAcb6CvCTIAi4JnN4bcDqbEY?=
 =?us-ascii?Q?4Wo39wkylmofsO3U3YUNLNb6mDCUljOAsVrXXrm/Ezb4JKEkLjp39N6MJql2?=
 =?us-ascii?Q?Eyfl6O97y4szV9puDDJyauL9ZVHBUAy+YBF3TT/64Vu1KK2W7tBvUMI/66EC?=
 =?us-ascii?Q?2/dOsUMDChmCAvhAinQ8InOtpeGO5njULWMqmekGrlYSyrlI2y3KN2wcv/GG?=
 =?us-ascii?Q?59BQOFRSN/oDP0hEH6sqBy1B3nOYEp5KpQ/jm1eb+mDrkpb4VD2oPdgoDLnE?=
 =?us-ascii?Q?HZ4n0eRyXvoyfhGqg2S1OFmXcyxEs6FNUcco3gfUitEdCbSTJeNS00XFp13M?=
 =?us-ascii?Q?5JCLmcww7LluZhx2qFzKe5NFkkdkA1wNenaciOxhlJ59a7H/7eVgwUHzNYQG?=
 =?us-ascii?Q?AJvL3iug3xlMlg0ZwkhaDEAFZnuGHpuNCB8EuvvGoTqoTissA5u389+6uF2D?=
 =?us-ascii?Q?3nuVgXGWUBvr+0SNy/7r1wA2TzUgs3h1xflZCh+YlF2AYGOZErA7T+L4esLm?=
 =?us-ascii?Q?55QNTjx62lHtJJq/Bu9Ful8Ge136oDGXGzwVePQMEacPb+ajV6xU357Ka76X?=
 =?us-ascii?Q?Hsd53PJx2cc6UNDmHtIiXRi1FjHDPsqY+R71dadoYsyaHUy/3FI8cCCFSvB5?=
 =?us-ascii?Q?rNcObT9Jk0a00m5OSBnXTQ14QuazrG1FqTjGszx7mueSZl3PMFS1cm07thyD?=
 =?us-ascii?Q?Nii4TjeN0uGDDNMg6Ys5lr61e7YSvPiyYzy3nbW18KEl0G25HFR+Si2sxi7N?=
 =?us-ascii?Q?unKtRA1ZAx9zHLg+PAo4LJzavZXAQe3hNZcSO1l6/zeq2THhf/u28W+dNYES?=
 =?us-ascii?Q?VvyU9CrVsTAbH2dS0Kg9Ob2Wzmz8BTW0GgoqBfpJrDLh+Xu4AvtqAnq1Dup1?=
 =?us-ascii?Q?WMmoTP5i17R1UqRNQb+7yyYtxCGYs7ZjsqaMo3rT9bz7T9IkQNF4AHV6RHvt?=
 =?us-ascii?Q?MRjJMw3OhfuF8oOLsDYizCmc6YKKlLAvjMODGu1kMfUYdEkex4o4tOQJakCi?=
 =?us-ascii?Q?SeseiL+qyvty9zSuE5hdFzAD0yh9guAly9cs7ulL2P/n+8Hx/WaBWOM0EQy7?=
 =?us-ascii?Q?Dmo8G/xCFmns7OftuCVBSAwelsfPo/j3z6/4JDwsViMCNA/s8xNroY2PKit1?=
 =?us-ascii?Q?/uTaGfuMJjNCwvy+D6BPS1Ogu/TnCMEAdObr5ac3fM6q3Q8aseh+yoxawrlf?=
 =?us-ascii?Q?UjfldU6DIBE7k8QmN5QUaIBm7vD+MvuAZvGozOPwF4KNzCd4IweZe3r2/PZU?=
 =?us-ascii?Q?DD0Dx1PSIOZdOQ/FpD6TacMYU6wcVTa2XMxvn0GOTx65cJjVMbUFWq2l7mrw?=
 =?us-ascii?Q?RJqbLrEA0gTBV0GLpcnq6Dn63S7O0+Fl0BHnzJJqmGeh2tDVGAo4D4Hqenzr?=
 =?us-ascii?Q?vYHzr+WfvYGP7IwOvVHPn+g3cHB1qB7tW8OBStY3ScLlQVKG7pbC6FBbrcOo?=
 =?us-ascii?Q?i24uboILEKJgKYFCsT1oMwLeQu0iBD2IkZ5AuUWEvMkDq8SEpbbNBTbq8Uf9?=
 =?us-ascii?Q?8motq9wg9+HAHh62vhAgAno=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: MJLT1QoUF2sN7jeb9bHGzyae5UNIGJ913IqfnHsBxKK+286PViFtWYM6cA5mjiCJq6rEn8Ohm8aptH0B/RQTm62F2VaUxabhMQrd+79pppcb7iLw60t54xrzYbyjmUShOkBt+CwzTuhkUi/KtuKXY9lzHRW8fs9vOponJ/WzPm5caozsYC8jhU1Ecy+1775deChGmMQK99SljLRiRcDaG8qRyHSnab8vJ20sCyltduuzfA39YvRtUsjig//nH/uRneP+uvCB/xSy/8uOmoHld0pEFOvktq5AhOtR/0TY0mPfHSJMx40K1HclSUf/M2sFe7EyMfk4NYmlE1VqHMRGK23gcqXjf5fSEhKLM/Adej5i8IrurCn8W5Wj/ItQwcBVphocekNl3GCZk9TCjT6gnma1hHH6sXMcLIE4Kp2Cm8hF/EVrYxQ0cchZ0r9xk0rqifZLPAPUeQPnr4weWCa3Gjas2QUyZgp5zUSJXyBPddrGhNjAIw/5Hh1r4dTnD0fSefsr+qKMo8bv62Ty5iFzYt2LmukaBWfIFiQaQqHCOD445zZvdKfimFy3bfhu0mwHkc51OdzJcqdXR9FMMVJbrL+GjIV1TaClMkM/kMwpJaKpqJy4N4zv9l2cKnOpiINIH+QBzlHAajhzcokPC1B9BMijNZnS69MgwHmno/zTx2i8N4WBAiBN+11yab28KSkZab+5v/co6ZzUdvvFYj53mxmKvCqqKCa6G+eS7PpxPllABg+Jb1+umV6LGrx9Uz9L3nOIGc+hSfafyuwejF6BC02K0tW/uYNVPDsLSnWtNxI=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 5414f255-7cd3-496e-6337-08db781b2da1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 21:03:52.9020
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: UkcxGXFPfKXS8LbLfoHMOG29bULvZjHWwFD3lSiyngg+mJV3I9SvbbKZGwv/j668y9wSqRtpug6yvyYh04uWlm5v5hiLwkbvGiLs15sylSc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280186
X-Proofpoint-ORIG-GUID: olCZCzm40btZ8bElyWml0erm5aQ93MgJ
X-Proofpoint-GUID: olCZCzm40btZ8bElyWml0erm5aQ93MgJ
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

If disassembler() returns NULL then kdumpid is guaranteed to segfault.
Gracefully return a 0 so we can continue on.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 ppc.c   | 2 ++
 ppc64.c | 2 ++
 s390.c  | 2 ++
 x86.c   | 2 ++
 4 files changed, 8 insertions(+)

diff --git a/ppc.c b/ppc.c
index 8d460ae..3683381 100644
--- a/ppc.c
+++ b/ppc.c
@@ -155,5 +155,7 @@ looks_like_kcode_ppc(struct dump_desc *dd, uint64_t addr)
 	print_insn = disassembler(bfd_arch_powerpc,
 				  dd->endian != KDUMP_LITTLE_ENDIAN,
 				  bfd_mach_ppc, NULL);
+	if (!print_insn)
+		return 0;
 	return disas_at(dd, &info, 0);
 }
diff --git a/ppc64.c b/ppc64.c
index 67a912f..fbfb728 100644
--- a/ppc64.c
+++ b/ppc64.c
@@ -171,5 +171,7 @@ looks_like_kcode_ppc64(struct dump_desc *dd, uint64_t addr)
 	print_insn = disassembler(bfd_arch_powerpc,
 				  dd->endian != KDUMP_LITTLE_ENDIAN,
 				  bfd_mach_ppc64, NULL);
+	if (!print_insn)
+		return 0;
 	return disas_at(dd, &info, 0);
 }
diff --git a/s390.c b/s390.c
index fdd23f7..68c8e5d 100644
--- a/s390.c
+++ b/s390.c
@@ -159,6 +159,8 @@ looks_like_kcode_s390(struct dump_desc *dd, uint64_t addr)
 	disassemble_init_for_target(&info);
 	print_insn = disassembler(bfd_arch_s390, TRUE,
 				  bfd_mach_s390_64, NULL);
+	if (!print_insn)
+		return 0;
 	ret |= disas_at(dd, &info, 0);
 
 	if (ret > 0 && priv.state.flags & SAM64_SEEN)
diff --git a/x86.c b/x86.c
index 5c72bbb..5e35778 100644
--- a/x86.c
+++ b/x86.c
@@ -289,6 +289,7 @@ looks_like_kcode_x86(struct dump_desc *dd, uint64_t addr)
 	print_insn = disassembler(bfd_arch_i386, FALSE,
 				  bfd_mach_i386_i386, NULL);
 	if ((!dd->arch || strcmp(dd->arch, "x86_64")) &&
+	    print_insn &&
 	    disas_at(dd, &info, 0) > 0) {
 		free(priv);
 		return 1;
@@ -301,6 +302,7 @@ looks_like_kcode_x86(struct dump_desc *dd, uint64_t addr)
 	print_insn = disassembler(bfd_arch_i386, FALSE,
 				  bfd_mach_x86_64, NULL);
 	if ((!dd->arch || strcmp(dd->arch, "i386")) &&
+	    print_insn &&
 	    disas_at(dd, &info, 0) > 0) {
 		free(priv);
 		return 1;
-- 
2.39.2

