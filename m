Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5253A53E03
	for <linux-debuggers@vger.kernel.org>; Fri, 19 Jan 2024 19:52:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705693955; cv=fail; b=H+NA1UkJ57ehYPXe/SBteXJnsGnjcUV2Mz8g+HEtXEXN9tmWFzGXJ0FXYUeQo21jneJh+jOS5mP3WTmKXbS83mS0v7ujBTvJ8/etzP814uOss3ZJyqWUBciU1PcJ4WVmencqut2nnOeHHBxB6hmZox3cmuwIGryS+EIM7q1M5tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705693955; c=relaxed/simple;
	bh=7FkNhhKoLhbxMcLwOd0awoRQ4IrHZgH+nSty09HklPA=;
	h=From:To:Cc:Subject:Date:Message-Id:Content-Type:MIME-Version; b=YjlP+dxdlnZ5PywWgkWbimokbMNMQIy7eaiCxaHSIzdXpM5xq079K7HsBYkpQq0UtsKNYL2zcI0Pjs/js/7DpQgT4wWO9119EozGAJeqmE3UOjxc4S9Dtl4+TVd4rDprhzlitsCFlwAmcAli58qs1exr79hE+QLQp9KRi9cnwc8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Esp4MdEs; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=D/F66FnS; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Esp4MdEs";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="D/F66FnS"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40JH28n4002765;
	Fri, 19 Jan 2024 19:52:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=d42np1i19rGkMccR4UbseiCwM5Or23adq5kQDeRs2eo=;
 b=Esp4MdEsR2dTef/WRDQ6daCtRCLzhQYYttRlg7QBGpMk+AVkRucCZ+RIEUt3P7bIYaM9
 ffhNA7pO1BOBa/xz2ETdEalGEDLo5MOfaFv0PKWGYtYJUvIZgIa7FPIj9B67uHMoKkhM
 w63fzrcg8prRK0YNNKOfv6emd+jF2cZG1FoHwUDiJ+YMgPv4edQG5dkDk/FUGduHXXqe
 ei5WvWuYdqJJW3Ot2/ZtR5OD5yZJN/iOJPOCH0StA+1uzxJ5fGAyVsVYiuAJhLURvxSp
 /mZmntEpb0tccnuXiIK7WwcZGjQlDMhi4fYimPgW3uFxdXf31WwTkeH3tqXLitQiLbwI qw== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vkk2uffh0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Jan 2024 19:52:28 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40JJAjr5005302;
	Fri, 19 Jan 2024 19:52:27 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2169.outbound.protection.outlook.com [104.47.55.169])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vkgynyhrm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 19 Jan 2024 19:52:27 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=XbxLlHoVS2T1DWs2MBNxl+KHnxiy2MxAV1mG1BDG06ITy4+hrkWBSROXHetoe4Imv9XXjqFSPRT60Oz7CpDiAcseNuQWk2uwPWnzqBNlnCKuHijZJStjUX+pp/6qJJONPFapZb82JOZ7Oo7dl0g9Vs/AyVfPrSw2FKEF0WzeDH81qmQyjJN5M9F1ui5kzjhuv/llYG+5v7B47Kl6wYPfI/GfygZv/bvlsv8/+FVmrqN10tX3F72EilcqOlXbcubE+BfLb86ttPiAq4AsR3b8yWGX+jaq+xgTruO0TT1WIv1criKkTjpjPM84cU9VCGA1SEpyJ4tLuEt502r5R81WYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=d42np1i19rGkMccR4UbseiCwM5Or23adq5kQDeRs2eo=;
 b=fFztUiyjqvxJzbSvRgS6+wzWAh8vGbgszmtmh92vvprztcfFozPyctg01Fn/7ZaVUxNo9mmTrX3R6Ydvm3SkqzY5IrACagE8TQVL9BhEkS7CgqNc/b9+pipwAaFAc67d8/521Zd1jE5c5+TBiYRHEHzpYoM0BOz6KpYw/Lw/9sh3M8ytOuq+5tQHxM5HLqCfwe0c5rL/vyxLIoWANBEsf/hdHchBd6poQemLiCQIH6GfGMTRx6xsHxZxaM4CxturE4bq7peLqFMmhn8DtTEnFlhPJyzn4F3hAOhvFMMS+dexVx4QnHgN70+S2vj6MZE/CRSOYavD7TWGYVmXdlS94g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=d42np1i19rGkMccR4UbseiCwM5Or23adq5kQDeRs2eo=;
 b=D/F66FnSd4gKl6n1UttsxlqfJpb+NYkJc79CPVW75N9wfxSPMZHsnZCBeyRRO3LWkU57YRx6ZxUU744g2G7Z0XxQskvd3bzaqZGcDr6Pn1OobPaLr8pPobPTsZEXHSyAJKebzpaERy3EllT2Q96ibyTUEt6C0qf1q899V9Lx0Fk=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SN7PR10MB6955.namprd10.prod.outlook.com (2603:10b6:806:329::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7202.24; Fri, 19 Jan
 2024 19:52:25 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::d190:4337:a77b:b21e]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::d190:4337:a77b:b21e%4]) with mapi id 15.20.7202.024; Fri, 19 Jan 2024
 19:52:25 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Petr Tesarik <petr@tesarici.cz>
Cc: linux-debuggers@vger.kernel.org,
        Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [PATCH libkdumpfile] tests: skip tests which apply to disabled compression
Date: Fri, 19 Jan 2024 11:52:24 -0800
Message-Id: <20240119195224.3000110-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: BYAPR06CA0017.namprd06.prod.outlook.com
 (2603:10b6:a03:d4::30) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SN7PR10MB6955:EE_
X-MS-Office365-Filtering-Correlation-Id: ef8c6730-973b-4275-479b-08dc192828ca
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	Kbjtpey+JQEWF8FeN1A92VlQeh12vduJjEkKLpyTYOu1ThX9/LJClTkXvZCYBP5gRpTQy/8w7MWRNZapDybH+IM+tKheeqQsqnB9cmO4qorFoYW+iVh2m/XU1OjgtoXCQ7naj/IcnRAM30SbxJtTd+MMn00MCpGVU+q1HlaYEf4mI62wcCNlRj84EsxgxLm87is6AMEyLy1/EiCpxyor+V/lRCzhHgA6uYpvD7/grxHXRt/2lWarTlZILUbs9D/GZreLXVTgdGc36nvC2nCBf0L7lBKhJfODCtotDF2BT/rdj/HAmM/2FCm9RURxhQnpzIfX5CuYmCfdbWbWsiEXFfftUwjpQBmFZ4HwOaebEcqS34JLyK04VB8wMl7l3TUE8eczVOMHCBz0F+Jh7NGy5isqdpj7c0BoWXhpstT8r3yKBBcBzJM/KrAD6tWhgxFkSHe1jPAkcQlK7yrohkPY8rXOSheCSR821yPWdoOXy8dZQnyI0GxJp/GRtWhli8M8f9iMhKlw3m6KskA/DTr8dQTgqefRgQqO70dW1qT+DnwvvisyLp8cuMPa6GXnr9vU
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(346002)(376002)(39860400002)(136003)(396003)(366004)(230922051799003)(64100799003)(1800799012)(451199024)(186009)(38100700002)(2616005)(86362001)(1076003)(103116003)(36756003)(2906002)(83380400001)(478600001)(6512007)(6506007)(8936002)(107886003)(8676002)(316002)(5660300002)(4326008)(41300700001)(6916009)(66556008)(66946007)(66476007)(6486002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?MtImWqUDavkKa9zjB5q2u84pK5JUVkx88fxXLgud5EMTZauKpUl4Dml5qbn2?=
 =?us-ascii?Q?WvmNDrZWFJ1icSjZ4jQ55eaMwiheqE84NUcSpcO585ULM7F4ZJgEofouYjPN?=
 =?us-ascii?Q?S76FNL0VWHBQmfjuUwwaL68RgcW5Hrr7xL+/iGMnHF7mgF54AJRXd7rJ1ajz?=
 =?us-ascii?Q?/aUjZIelTv6j1UuLg9fbyNr+EMwr/6U3g/tIRO6OtHRI2RxL77Y2dn0Jl4Al?=
 =?us-ascii?Q?g7rKbw5Yo5LO78gAvT8MA+kXSwTnwUrkil7gy2q3zZadxx+gQNXHBQMAdSWc?=
 =?us-ascii?Q?0cvkl1SoNCNXu7Ke2RbMHcBAE5xhmw77VcSYvWVVgeRrB93GhibPY/AU7SRz?=
 =?us-ascii?Q?Njlma797YpwIHSOAAzzO2zsYZnMDi8VqFPmkB2pea44hviCuNKZFK0NSoUEQ?=
 =?us-ascii?Q?nYe5dUy6b6mVxZKpPuIVUz6pvKj8f02a9DRqcr3Vyg2M0pbmRRC5PHV0Drde?=
 =?us-ascii?Q?lQYWSaAFSywrSe1qqKTbUJdr0P84WWr8ReIiBK6nK+vlYwwkS2JqXganBEQK?=
 =?us-ascii?Q?Bgy17Evge1ugp9sluPGuOuua4yAw929QCpHxM1/VZXvMuyyLqEZMZvKLUl/l?=
 =?us-ascii?Q?BMeCrfCqZih82VXoNfNcDaCwPoTCKmjfyniyBoC0jhB4b9Xh1iLSXDzy5buJ?=
 =?us-ascii?Q?k6R41eLtCWKCyomJWCeEDg1IOewej/4qXNqrbpi1RUDf+ACVOHPONZlVfUIP?=
 =?us-ascii?Q?NExru73GAVKXr9vM2ERCM0dhqAsY/X9EQFHunYd5T8pepHHrtjfWbIoTqKEt?=
 =?us-ascii?Q?JvWK8YKi2heiVbq4e5z1kr7JzhRzqiG21/BChmqAGlcVA8VFRg9wQcesJt9c?=
 =?us-ascii?Q?Gk0BXCYUdIwge0jHGQ9g/fPBfv/z7j44cMwTnCi+5m5QYrrRwQVjVkMzfel5?=
 =?us-ascii?Q?0ivokGbrXKwMd3aia6MCumS/jSoykwWwjYUYHo+UAjb7tqQBbMvWx9xribkc?=
 =?us-ascii?Q?5Ei4O0CuYcYta8gAVRk0saQTqiDdUK6uqMnzsnooE93msP1Z91tpcgOnmOY5?=
 =?us-ascii?Q?WDhkS595JYIDWXAW10+X5ORFktpIWF8COK3DdVEOHhv4JpG6afQkLlO+BjBP?=
 =?us-ascii?Q?Ns4qQiL5SQmsM7JxEiawjO93wRZjP8VdkfgMwzSMrDAfVvOz3xb819Lw5sxY?=
 =?us-ascii?Q?8d7fSOpkj28fpJTRas9hH/R/LkqLz4uEXGB5CFFLo5XKmp/qoafQ0Fz9KkcK?=
 =?us-ascii?Q?kjvASyuzcDEp6+OHkFwHXKldTQY2REBRMaZfrv84hOPpBV/UZt1UAqQprLSY?=
 =?us-ascii?Q?kxYne+uydiZaiy/ZoKj/qN9LyNrOAXLOagiPyydPyUefLtBnhVo0kP9X6TKN?=
 =?us-ascii?Q?SbiIaB6rLI3pXwUBiM1/ZSWZDh9SnZXdWkmKQrT4xNnX6BC2S7Zd/5eJ4Pbr?=
 =?us-ascii?Q?Sersxyzf158Z0LHYpN4WAiHswxkuDhlGEFNQTrn2GMHDM6UyPs8M33skePRu?=
 =?us-ascii?Q?9xccIYqQjTzdGBmdG+4Og2nxkS6k+d8azl8E5EaxBPUjqJLGZR+9EhW/4FvT?=
 =?us-ascii?Q?mnURrteZICsd03vfJrs/7qPnW5xiUKICxaKjGvKSyAvF5GH6LwXPrzvar7We?=
 =?us-ascii?Q?8V6F/mxATCgvyxAGuHu2MvKCmRln2lQuw9eRY0aDV7UWRj75rvX9S/DaNXxb?=
 =?us-ascii?Q?4a8bY3FfBAsFedsZWIHg50IuDnZzGDY0p9ayEnvKUlXBU3FrbndtzCfpjAO0?=
 =?us-ascii?Q?WA5W7g=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	PHt4Fu029NeyxK1P8ORXexVpMw0EIZ9EF3oo22PgIG8Tvh5gQM8BxkUWztzPdPpufDo1p3bUK3UBsrk5ekSxvbw7lEp3iJoc776/H/fPcq2HctsOpXnC1BLAu++etFqNQqcN+l+BmbE9AHLRGavishxWK70fzXQjLVCbl11+18kpc2jzUq8g7JwV2a2FHbEMuc+gEQNYv+g29zO/GNgw6+JwcfuQok7ftkssT9GdPbfyswnZmle+193uys97RViGD7qc7HXA8wZOs5KYCqxkrJeSG8zoe2bmWFvKz0nfTe+B7YxWb14n8TwHSZkFPYD5krd194IWvcsE7pgWlQJHrIWE+1Z+3jtFHakbKDtesIdocKbBry7RNIgzuXVDuk4jECS8zKgf0mzxOlcpRe+iqUivrMu3Yj8+eFRVOMoM36W/HaGG0/KKkPpnoTi8MAaphfwijOcaKwRUTrXTdbcs7lTk6FP9b0h7d3ncEVqvt4UBNYwnn2hd2Q+eTzqoRwICSOWyjQSico1n+3bu7r6rhEQP6UlPQvgE2DJEDKc6I6/C2N7FKGfSmNis8WMDQfXiMoOxQro3GxZlIFDkkRncja4NYY/SBJH5QIZJIlSPv5E=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ef8c6730-973b-4275-479b-08dc192828ca
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Jan 2024 19:52:25.4475
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: HfVhMGSCO/aXRFBmaYgFNpYc6Q5zlUodgnBfWs5d98YV0JKRSd/Faen5nUJp+LavkZ40N5uxHuShDHQpuYFUbD7yakKEyf7AF1xRqPMD2Ec=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB6955
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-19_12,2024-01-19_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 malwarescore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401190117
X-Proofpoint-ORIG-GUID: xoG6XPUoAjAc-uG93L1EYfN7yYQBsc9H
X-Proofpoint-GUID: xoG6XPUoAjAc-uG93L1EYfN7yYQBsc9H

If configured --without-libzstd, for example, the diskdump-basic-zstd
test will return an ERROR code, causing "make check" to fail. Even using
XFAIL_TESTS will not resolve the error, because the return code is
ERROR, not FAIL.

Instead, conditionally include the tests based on whether we are
compiling with each compression format. This way, we don't test
unsupported features.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 m4/compression.m4 |  1 +
 tests/Makefile.am | 17 +++++++++++++----
 2 files changed, 14 insertions(+), 4 deletions(-)

diff --git a/m4/compression.m4 b/m4/compression.m4
index 6755ef1..8cb7ce2 100644
--- a/m4/compression.m4
+++ b/m4/compression.m4
@@ -32,4 +32,5 @@ AC_SUBST([$2][_REQUIRES])
 AC_SUBST([$2][_CFLAGS])
 AC_SUBST([$2][_LIBS])
 AC_SUBST([$2][_PC_LIBS])
+AM_CONDITIONAL(HAVE_$2, test "x$have_$1" = xyes)
 ])
diff --git a/tests/Makefile.am b/tests/Makefile.am
index 0c03b20..8ac90b3 100644
--- a/tests/Makefile.am
+++ b/tests/Makefile.am
@@ -196,10 +196,6 @@ test_scripts = \
 	diskdump-empty-s390x \
 	diskdump-empty-x86_64 \
 	diskdump-basic-raw \
-	diskdump-basic-zlib \
-	diskdump-basic-lzo \
-	diskdump-basic-snappy \
-	diskdump-basic-zstd \
 	diskdump-flat-raw \
 	diskdump-multiread \
 	diskdump-excluded \
@@ -331,6 +327,19 @@ test_scripts = \
 	xlat-xen-x86_64-4.6-bigmem \
 	zero-size
 
+if HAVE_ZSTD
+test_scripts += diskdump-basic-zstd
+endif
+if HAVE_ZLIB
+test_scripts += diskdump-basic-zlib
+endif
+if HAVE_LZO
+test_scripts += diskdump-basic-lzo
+endif
+if HAVE_SNAPPY
+test_scripts += diskdump-basic-snappy
+endif
+
 dist_check_DATA = \
 	addrmap-single-begin.expect \
 	addrmap-single-middle.expect \
-- 
2.39.3

