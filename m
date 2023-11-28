Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="GxKqN3PG";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="mvt14LmS"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0C83D60
	for <linux-debuggers@vger.kernel.org>; Tue, 28 Nov 2023 06:57:30 -0800 (PST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASEhtGU024228;
	Tue, 28 Nov 2023 14:57:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=2wCMfWJs5TyN5gezoCTCxnCblwaeMW8YR6EqohML6Oo=;
 b=GxKqN3PGUfncAHGp6OdyYy8YqU8DsB2dsYw53HQpLgdb/E22x26cKLiMYQZVB9E74BTx
 OVJcGj/J8e++raYnmIv7ZjMX7Zgj3VpA5MmlIsWtE2H/sgD/LfIZ2z5ogLyRo3S8g44r
 yPpHh0GWGbsGeWxuw8WlOO0x8lN1EQImo51We24UKtCIyXbMdsegOGQvuDF6BvYTpepE
 qscH0OPtngfarasOaA0Z7ZEdXOsTjSj3WAkBMB+bCDUkP4zMx9VFyxlYXRCYkDpMii19
 J+W7dGZBFtZq7XEaYDQc72pLo8faJ0ZY7UmTL5oHnwxsw4dRtNHdokSad+fL2QgMCIwV Vg== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3uk8hu60vm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Nov 2023 14:57:29 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3ASEeOao027670;
	Tue, 28 Nov 2023 14:57:28 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3uk7cd7uqq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 28 Nov 2023 14:57:28 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=UWRdbdxFABkNbnjoHqFye7Xn7cv5/xqLZO8t2TqPLQ6c5VmG/UA6AHGyRSoYh6p8sQmk+aBnxPXJW+7GDYAqIS+112cMEErFTCnQT232K41GLFxye3WHkBS9e1tANZVPOlGUMFlduRCV8CcjmCp80XdztSbu6V0EULSUB27XZFU3rsoLoPEJxoiEWAfzG1jbjXCAMOjc5oyvTesom+W+/4GDkngaIAA3M16qdUN7idNgFXklOwx6R1aQ1bh1N36RzD7KqXYn4KDbIkq0Kkb8+WnbwL7gZ85hadHleEGwVsLzybSU6ZENmOdQ4nH3BCNRhWb48UKo8GPwr5YheLBMFw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wCMfWJs5TyN5gezoCTCxnCblwaeMW8YR6EqohML6Oo=;
 b=M9dEMmCVOgQYUPLfq0b1cbjE3guILRIMBq8vgQ2VvvdGVazLd8ccSuLvYg+SZopvOK0/Uk+O5dV02W8GnAAkIE3tfxCeHDcfb9c5RrP7T4fX85Hrl31sw2P7H8RFxG7ne8HDctK2qwl2ZwD9/x08x3LTGgUS86bOBvnzbqDO0ZdHyJ30clnUArKFbisgwB7c/pTfGObn+s9XGD5tbTgUuYAFerIaaabPRXNNxSB306XLYIg7MQGLMokv/NE3/Tf2c1h2PNGwHeG1E1ylapecCddmQehAkfOAwxEB/ZkcT91zowwwIt1szW1TRmd7kSWJ4azHxLupqts2MbwwCIKkyQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wCMfWJs5TyN5gezoCTCxnCblwaeMW8YR6EqohML6Oo=;
 b=mvt14LmSQNqbX0Z8mWXsji9kt7vPaBzc88G5OUF/lYdXIdI4gal8gG/DBl4wo3FOMh+8HTCdwMT7esQwJ7Du7XcOeQN+XxNOsw4ekUCYs4CewBb/ixMuuUtW62gCLqAwbZFFup99P3GPMJzTpmGgeiHouTci0cv+2HHA0piYKFQ=
Received: from SA1PR10MB6590.namprd10.prod.outlook.com (2603:10b6:806:2bc::13)
 by DS7PR10MB7280.namprd10.prod.outlook.com (2603:10b6:8:e2::8) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.7025.29; Tue, 28 Nov 2023 14:57:26 +0000
Received: from SA1PR10MB6590.namprd10.prod.outlook.com
 ([fe80::befc:b95b:2b72:17a9]) by SA1PR10MB6590.namprd10.prod.outlook.com
 ([fe80::befc:b95b:2b72:17a9%6]) with mapi id 15.20.7002.026; Tue, 28 Nov 2023
 14:57:26 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: devel@lists.crash-utility.osci.io
Cc: linux-debuggers@vger.kernel.org,
        Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [PATCH] symbols: handle module symbols outside strbuf
Date: Tue, 28 Nov 2023 06:57:22 -0800
Message-Id: <20231128145723.689860-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: CH0P223CA0025.NAMP223.PROD.OUTLOOK.COM
 (2603:10b6:610:116::23) To SA1PR10MB6590.namprd10.prod.outlook.com
 (2603:10b6:806:2bc::13)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB6590:EE_|DS7PR10MB7280:EE_
X-MS-Office365-Filtering-Correlation-Id: 51c577a5-c044-42c6-c049-08dbf02254ff
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	l3+7Z3xChyhH5nQxTJ+zYHRTTtSSM04NzNiVzHxxn3OomwZeVEGOQKfmLY3ziqV9VIF62sZBznb65AEiRyr7qAYtYRi5KvRhWhkFsbf76bPENgveVOj65bY/K9kFl7hhtVGqzAVxCEKCKEum4+WnQiMJFJpkuVNAi8xk5ree6TpVXTM3Q48bJAvWTxYaUdOPjxdpMRyCpiuKryTeB5fPFz+pJhrsXck4+7nxIKsdD1IrUPX0Ry8fHt19zH8rgzb9/u6GGrrzg5gU2o4iEdm16jPgyMEicOZIhddGTsvd2kbqFtCU6zcQfbm7W3ZDqnfNGD/G/05DyGzJP5iI3QfKlIQiLcqGORXJvyVoYTpERDSzBYLyXIOXfXcmDZfuPTXnxwWjrN849O/GIDxZYyhiCY+iWAx85+qGUyzZ5TypLFH4htI2GKCobpdr8ncSGw9pt875QPfBalDvC91/oshSkhznrg9r3Qnb0cYZrJutG8Bh1bikXhK4PEgr84Rdo/QXY7z6NYh28weGxhIk8E4IGS2YXBERoNg40pVPJVEd6U+HgOFTRICOnZh0+5FkpQeK
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB6590.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(346002)(136003)(376002)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(2906002)(5660300002)(4326008)(8676002)(8936002)(41300700001)(316002)(66476007)(66946007)(66556008)(6916009)(86362001)(6486002)(107886003)(1076003)(478600001)(2616005)(6512007)(6506007)(36756003)(26005)(6666004)(83380400001)(103116003)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?9ROSidGNj4mJE6w82iPDLyXSSej5dd59Dxb7bxnLoBxXaWC9B7CZEQSAhDfz?=
 =?us-ascii?Q?BeAm18YUBGEXst1RTUXizx/ZNMEupOn/Xm3bpbyavpXmG6z+M/hxs0IeA6ua?=
 =?us-ascii?Q?zuwEBIStDFtI+xCduIKWcU3ss6dL7UC5A0sx+GdVe4pBGZacezTxaA55FE7p?=
 =?us-ascii?Q?880nAQFpgRXUBxPotiP64am1wslDD6r3Nryv5ctztDU7dvVgRtN9oMBrCb6R?=
 =?us-ascii?Q?Ny0LXdLtRAjTgWkI5gtPrUgOt1847EcufXB8teaAwxVzpncQjMGjWvqbQixG?=
 =?us-ascii?Q?VOKEyr0339pPQjM/oO8P09K5nW0w/gvcM/6klmE5mePiLxe15FLcxHeoGjum?=
 =?us-ascii?Q?DUCeVyHVomAqF5M9WPCx7QGX+yrVgdolbdkPhrCwxuLJv7WBRQgLVNht7oD+?=
 =?us-ascii?Q?vFPpagN3KOT5TPfMtdvAJ9sJjDJaPMD7WG91pDFHDiuHhwdhPNNjlcVdic7W?=
 =?us-ascii?Q?WTOXeFTW6lWzvL5/5XFaoVxCP7/Ww3TLBpgdFyqxo1o7BFa31itEc4Me1I4t?=
 =?us-ascii?Q?o33wJCeK0WnYLuu6E3zbBNx6ZNwZdSFTtqhLiFjCLTFD7/worRz8+Q0b/jUy?=
 =?us-ascii?Q?3HrBv4tIMuoAPcU86ym2ChSLuDhbNQ5rDvdPubXxn10ETFbpNPQAw+BABvns?=
 =?us-ascii?Q?m1xCcuU3MII+Boyk7eLmudTn+cCE8B4yL6vNP7kT43Ya3LxtYe/s8yBIUEO+?=
 =?us-ascii?Q?Jfp36qmpRnx1NdyXujqgD6K856Ez1d0xdAIL32kMqy4KtmhVjZJ2aT0e/JjN?=
 =?us-ascii?Q?Z/nbddLI7XPa/a/0MVPlsmYp7WxjU7cXVfIGMl+Vu1Wb0hSb2Pb3+Wm3X/mJ?=
 =?us-ascii?Q?GxsIix8YQ372tApPME27W5DdUXr2SEeBHRbieIpOIYdURCHtj4/+3nWa7cIC?=
 =?us-ascii?Q?Mx152BBo7L/cke5ZDrIEvTzSxoWlpPlxIkxlQyaM7CHKuXn/WJ8Mc8CfbPSK?=
 =?us-ascii?Q?hosK0tnNCymD6hKnTgrhthJmkzb7DvDYuph7bHVI/Mo0kQHkd6A48Z18jnU2?=
 =?us-ascii?Q?B+WQy39qvMWzpSsYSh9fnQNzeMhhqDGaHweFGRPyRU/8jSaf7fMgsZOQzyFv?=
 =?us-ascii?Q?9JFJSSdR3Vzyzf2oFdZprlRpr71eTy/+DxrHFUHbm2frWJ21qiU3DG/QkqcU?=
 =?us-ascii?Q?wQMtr71AIJ5onV6+1rNUR6Pv8je+tZ0/n1S2qh/+aOsVMwk44X/Fg+zBDGEm?=
 =?us-ascii?Q?RgBYR0gOryyv1vMit1+DG9PDbhtcgB9eH8QvXspmoCzzsA/zOGEKhGx+ajYM?=
 =?us-ascii?Q?lv9/b3i75Zs7UIpUCwqrWw5mIeL6gdm9MsUjoNvjAcUF1Oqf+pDi/lUcLNfV?=
 =?us-ascii?Q?4Fd+OAt8wt7sL9OxT9gZPMJcXObrDzYAH/DVMiVR7EaqwD5vXKWmypRRd2nh?=
 =?us-ascii?Q?ejDneEeoWSxIi4+HRk0Hd1CcMT8+gJRmDCg/y2/WckyU/Rs6HL9B55nkiUeY?=
 =?us-ascii?Q?xPSFpVtmt3FCSF0BLww8Dr3P33ZaoA4sGzfurtbfaWkdWu6IN58urkc7UEr4?=
 =?us-ascii?Q?LfJFlyKQHbHp5UheTivvIBPzDKRRTeEeJNM3QhHtlIPcBPQiLRlOUoWZt05X?=
 =?us-ascii?Q?Wa00GGJkuwhzLQIW6l/RRb0cb9HD6rt123h2Oha6UGxEdWRPQW3Wzo6UheDv?=
 =?us-ascii?Q?Og=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	b9NxVbyIYBT+kBrTwx+1vUzUE5X78r0a9tVuARLpPgVwbGnHL3pxAbYZACLSMrZHOHjjMAkJPNCHgO47UDJZsiW44//HWGR1fxH4I5J8UeIYAv2iyo4urdFUfW2f6O3ZetCrxpqM4g3BTGyc1zXE6ymSna1o9c23fM0+qCJZfzCdSdryfum0r7ffQED8g29leur7BhNlwMT8fgPIakf5W/29/CosM3q5Ta7ly+6mf2TL4+nYSfjsx8r7iAr++QbndyJmSDfcGpZaKXYrioy0RpfusmJDqOiNWUW62277beC5EFZKaa3BIPzAWD0KFMYO2Rqv6/e81v2Py2EPwkdAzelzqo2W2uIMWhQIzTZW8yv7N+My36WKdP9RpZaCks+2IWYa889mf1cMEXK4K10m63KDwV4XvbcVtbJtMsn+vB2FiARvDfEzELqFn/mdA/4IICouKZn3uOyHouvlvDny82gh1h9ISzsVCcr2328FLcCNtBK30GJEuVgyWJUFva0GteTjwch+h/Sbjybqf9MuiBphoZAl6mI4Z9l4bkbvLHjSk+Uvi0DTmc8pV0T8dXH7Q+Y8crn4eLwDSLfJhdM7g25rsNWJkaK/KScZKLUJMPwfxcYHfx7t4xbec5O6oU1a+6hM0cPIp74JniI8rapIX/GFD87Qttv5RMoxOAwXJZZBfetzpM6snAtvFJ7VqelnEQZEMhNlLuHCkkz6ofmkixYSW4k3pW30+hRhBwghEmfi+e5tMgFmRAMIaGr+bR4JAEaf4EmiNFN63rZJJIjlPoNadpv4ItFdZp+GkTzmAiQYSwG0Bikdkr5L8tAieMATDjacww4jQm3ziuGBrtRN9g==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 51c577a5-c044-42c6-c049-08dbf02254ff
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB6590.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Nov 2023 14:57:26.3391
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oscnFC/A1QmMRXaMtUGjA0J1ikBeSB8ntG6b7G+lT1gvlgk66uqUvAP+XDIoquqsYz1W4bFD6ycq8oKNihycEQ9y2w9BBJTh6N9dh7onMqc=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7280
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-28_16,2023-11-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0
 suspectscore=0 spamscore=0 mlxlogscore=999 mlxscore=0 phishscore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311280119
X-Proofpoint-GUID: 0VqdsXHR5dpuAGUYYIzgMfrOWKH1KIGc
X-Proofpoint-ORIG-GUID: 0VqdsXHR5dpuAGUYYIzgMfrOWKH1KIGc

Module symbol names can get overwritten by live patches or ksplice in
odd corner cases, so that the pointer no longer points within the string
buffer. Gracefully fallback to reading the string directly from the
kernel image in these cases, to avoid possible segmentation faults
reading outside the bounds of strbuf.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---

Hi folks - I encountered a segfault on a vmcore which had a module
symbol that had gotten its name overwritten by a ksplice (live patch).
It seems like there's not a guarantee that module symbol names _must_
live within the same symbol buffer, and there is even logic to prevent
reading too much data into strbuf in those cases.

This patch simply ensures that symbol names which start outside of the
strbuf which we copied, are read directly from the kernel image, rather
than indexing past the bounds of strbuf. I encountered this in
store_module_symbols_v2() and have tested it there, but I replicated the
code to the other versions. I will try to test it out on the other
variants as well, but I thought I'd share the patch now.

 symbols.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/symbols.c b/symbols.c
index 176c950..e70dd69 100644
--- a/symbols.c
+++ b/symbols.c
@@ -1704,7 +1704,7 @@ store_module_symbols_v1(ulong total, int mods_installed)
 
 			BZERO(buf1, BUFSIZE);
 
-			if (strbuf) 
+			if (strbuf && (unsigned long)modsym->name - first < strbuflen)
 				strcpy(buf1,
 					&strbuf[(ulong)modsym->name - first]);
 			else 
@@ -2080,7 +2080,7 @@ store_module_symbols_6_4(ulong total, int mods_installed)
 
 			BZERO(buf1, BUFSIZE);
 
-			if (strbuf)
+			if (strbuf && modsym_name(syms, modsym, i) - first < strbuflen)
 				strcpy(buf1, &strbuf[modsym_name(syms, modsym, i) - first]);
 			else
 				read_string(modsym_name(syms, modsym, i), buf1, BUFSIZE-1);
@@ -2148,7 +2148,7 @@ store_module_symbols_6_4(ulong total, int mods_installed)
 
 			BZERO(buf1, BUFSIZE);
 
-			if (strbuf)
+			if (strbuf && modsym_name(gpl_syms, modsym, i) - first < strbuflen)
 				strcpy(buf1, &strbuf[modsym_name(gpl_syms, modsym, i) - first]);
 			else
 				read_string(modsym_name(gpl_syms, modsym, i), buf1, BUFSIZE-1);
@@ -2456,7 +2456,7 @@ store_module_symbols_v2(ulong total, int mods_installed)
 
 			BZERO(buf1, BUFSIZE);
 
-			if (strbuf) 
+			if (strbuf && modsym_name(syms, modsym, i) - first < strbuflen)
 				strcpy(buf1,
 					&strbuf[modsym_name(syms, modsym, i) - first]);
 			else 
@@ -2529,7 +2529,7 @@ store_module_symbols_v2(ulong total, int mods_installed)
 
 			BZERO(buf1, BUFSIZE);
 
-			if (strbuf) 
+			if (strbuf && modsym_name(gpl_syms, modsym, i) - first < strbuflen)
 				strcpy(buf1,
 					&strbuf[modsym_name(gpl_syms, modsym, i) - first]);
 			else 
-- 
2.39.3

