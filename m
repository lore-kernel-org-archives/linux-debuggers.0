Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="FdOaMfze";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="BOAtqcp1"
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A65A0112
	for <linux-debuggers@vger.kernel.org>; Wed, 29 Nov 2023 10:35:15 -0800 (PST)
Received: from pps.filterd (m0246630.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATFmZsO008127;
	Wed, 29 Nov 2023 18:35:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-11-20;
 bh=2wCMfWJs5TyN5gezoCTCxnCblwaeMW8YR6EqohML6Oo=;
 b=FdOaMfzewJR3D+W7h3aKFwWa6lhZh/1sx1AHK+h6B3UDSh8XTCOpNZ9EnJvib7XvYqvA
 7GoxZ+Bt8XV0PfQrHM/eyzJebdSOiw2mSOfTbQdM+uyV5CzWqNcv1RIpeCkLhiQUTYRq
 fbjQ4PfzvZMaTuGebl/4a3U5pyW3N5rCzEIAsBnzfgc1DEWKHX7mOOjzN0vNSyT+Azco
 0C0BdMpWWx1jl3LMjjAgX3MQeuZGlt1CmCRnxF+1Ga7HC5mmYiwHT6rf3EFXziJNO568
 mrxlEMrvqLL9Mp0O3n9dzYAkyaGxrmzWfJRRW6m5aI+uYrmrnlCC9rMznocCyQmJQGPj tw== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3uk7bf1jfy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Nov 2023 18:35:14 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 3ATHoD4Q012736;
	Wed, 29 Nov 2023 18:35:13 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2040.outbound.protection.outlook.com [104.47.66.40])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3uk7c9amw1-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 29 Nov 2023 18:35:13 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=IZ+7I4ursZkB3Sf3E8QyIAPl2KnB28dIas/bSbq0OUFhVfCSXwzOY3ZJFrTqLal1oorX05WD40m55fuM5lphARyWZs6olj721TWaN3U/1w5pe7NOy9Z2VuyvJXj2Gw9Z9mKmgLSQ0SjfYJixDnGY77WzwVbWPcM+vb/NAVV1c2mJ6U4JgonkDaXZxCv25l7D7BSq56JxvRMKfZPW87gSccUFdgdehl0diaaS+h1iM/q3stqy/Z9lH1WS4QNKWxTPB5HYcSazifcCyMfDiJ30WriVWFdq82W63OS35MDohWC6XQd1bCSiI9Nvaspw6NKVn3uEe8K6dDg8xkidsBLw3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2wCMfWJs5TyN5gezoCTCxnCblwaeMW8YR6EqohML6Oo=;
 b=Xo0YbO5d/h4erE/WfrfX8mfezP5pBpxq7neb+mpXoB7gM+6Cpllbjxk0KugHGa3Z+ajabOP0TOlh1IfVBAqGoXlF1srM0z20m7JRWHOD0kpvj1puWnhF6EnKX2eXw4lHHhsXX4f0HH8qpOCbI1slpIXzSD6hhVryqPu+PR0nGpSpTp9kUL2zwt9ccHBxyEWfEUXHAwuzt9kUuflYiW7I0k+smtLAsxtwVmNfRtXr5dDlUuJbIGi2L1PwDq1B1UYg8gf1m6oyQh5jtRRXFtvhJuugDBISrfNvrpDqsp8N4dXni9hqA9yGr3jDltjnnKb9tDikUIFG1cf2qgcbYKU+bg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2wCMfWJs5TyN5gezoCTCxnCblwaeMW8YR6EqohML6Oo=;
 b=BOAtqcp1ZKuiMzBjs31nmgps5IuzeqS8icKUg6Aa1U+eo+2mLjVhadzq876ClWQHexR/nFlw4EPA7TUfReVULUFFNKwC37WzW+NbqpVpl6dHyVUtepsEQzob6Z0K1qSyvvXdEgaB9U1AXlKCw4xLEyVNtBM9tAslZsRzb7uP2jc=
Received: from SA1PR10MB6590.namprd10.prod.outlook.com (2603:10b6:806:2bc::13)
 by MW4PR10MB5749.namprd10.prod.outlook.com (2603:10b6:303:184::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7025.29; Wed, 29 Nov
 2023 18:35:11 +0000
Received: from SA1PR10MB6590.namprd10.prod.outlook.com
 ([fe80::befc:b95b:2b72:17a9]) by SA1PR10MB6590.namprd10.prod.outlook.com
 ([fe80::befc:b95b:2b72:17a9%7]) with mapi id 15.20.7046.023; Wed, 29 Nov 2023
 18:35:10 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: devel@lists.crash-utility.osci.io
Cc: linux-debuggers@vger.kernel.org,
        Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [PATCH] symbols: handle module symbols outside strbuf
Date: Wed, 29 Nov 2023 10:35:09 -0800
Message-Id: <20231129183509.23243-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: PH8PR22CA0014.namprd22.prod.outlook.com
 (2603:10b6:510:2d1::29) To SA1PR10MB6590.namprd10.prod.outlook.com
 (2603:10b6:806:2bc::13)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SA1PR10MB6590:EE_|MW4PR10MB5749:EE_
X-MS-Office365-Filtering-Correlation-Id: 53611946-3b08-4c33-2162-08dbf109eb0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	FzinhT/4SzS2izTQNlok5czZRiBXWLRCkXE5bYshEcTSQip5nggInKLP8Zxzv8QJs+skbAH8HlU+mrrtysEk64P2XSbz7NhcFbh7zeB+C0UrQ8O1yJ7Lmumw7X08dlxK6DTvXNe0jlsq7am9H0ES/Xcye9FzrZKtHl7AP67wD0cFqsXMER+6Uz4/uGT2wr4/YASPldc4TvNufsf1tc8JHMKIJvbmFI/hvwcq3aHPSBsKBggG6/wzcWxbq98kgTanAlO+bWpmNfpbOvE/K40jrePp/wYs6spuBwqQMHD5E1QxBV5prXsJuil8EUmjqspk0EHZZLNPwIPElrxqednqCVLQuOVTo4Tw9yiwcmcgRSdUu2ELRElEuQqdgUEK/05ufMNX7/SJCr6t0evHMotbKvQZ+NunplplAICWTRSUEelslN6iu+2D180yvmuEF0zVHMbTxhWg4Al9oOLmmNwU6L2tp+tq1xaIKwdNil2wCiluaN6bMXErfcaRF/drqHhoW+tMsSRc2WNjU0XVj6T0QKsf9iKq6uOwWTAtAFXyhE5bgOEB1iL0yE/V6EYa8ZOi
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:SA1PR10MB6590.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(346002)(396003)(136003)(376002)(366004)(230922051799003)(64100799003)(451199024)(1800799012)(186009)(6486002)(107886003)(6506007)(6512007)(478600001)(1076003)(2616005)(5660300002)(83380400001)(2906002)(66946007)(316002)(66556008)(4326008)(8676002)(8936002)(6916009)(36756003)(38100700002)(86362001)(103116003)(66476007)(41300700001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?us-ascii?Q?CkupOouUenx7ouioqMUc7tC+swUT/Eq0YiKKFKnPKXitTSMhqThKwNCpLEyb?=
 =?us-ascii?Q?BufbKrhP1NRWY5zfy8R8lHwqPaRcriF3r6JIkiaU2X2xtvlSRNhwxeUqC3UB?=
 =?us-ascii?Q?ofhvGEbg6g5YZthVNXzWfJYFIAu4W5GXDYixSudBteMnhSpDtM+aPbT+ypUn?=
 =?us-ascii?Q?DvBk/us/bOjZzN3tVHJ++comwcYAo5N7sqpOFMccrbP4NDGwBVSrYMwPtJaI?=
 =?us-ascii?Q?NWNjCxCUAXkWcYp0awXX/v+2Pmuh6EmMTgweME+VILemQo+vpzmLgoSUC6VD?=
 =?us-ascii?Q?l6Vd9Y0pi/FKFlwi7LpBS54677bnjKsxbNQBKT3HGlJNoXnC+muedQwkL78v?=
 =?us-ascii?Q?F6HTeyPTOhTgahMhYp6NtOw1Ujj/hb5yXoZ0qk6wIHbcMJnmsF/gB1+iwNpF?=
 =?us-ascii?Q?zQD6DSyBnyCacVcUGk2CpVmg3zOkEx5F7qY8Qf7NQzGxJlkOWRi73KE+flxc?=
 =?us-ascii?Q?qtY5PBq9ElLfhQLhH4hgxcL3bEG5Zc7d2ie1z5EOJQwOeMql78uRdoteCPCm?=
 =?us-ascii?Q?9plJLDA9Xb4htbgqAMxyAWbTflT12LnEVdPS1CC0M5+UQ0xBz4ugZbGtSs12?=
 =?us-ascii?Q?5Dmsk5mLNCiWlo35i4ukcBvEiHMwHaL/3B2A9ahkN5mB6jXUxhis2wwW7DfD?=
 =?us-ascii?Q?OLY2ftrRPh7SjO3lrb+xbrUch31pi9JQzXu+BGUHnUxHwe8sk2iSMXcrtCck?=
 =?us-ascii?Q?+t49MRzc0ZFbjI6gwIhVw76nqjIXKIT8UnpfCo64Bp3dfpGSSFS/uS1gW2RV?=
 =?us-ascii?Q?c81+tj2/9HgG48Li343/VksFfvvEtZWDo1yJ6EFQk9D16jWYdfZrrmDTBS+b?=
 =?us-ascii?Q?ZL6l/dEiPkgOY+r6DEwkZfCgmGytZ7mXUHb647weK4JoxemRkPyqxv4hYurQ?=
 =?us-ascii?Q?CQvNRzJA46Cf577cG6XdEopx2Vr22YXXReNPbLcCY3U1Lg2bB+f3lmD+2gNy?=
 =?us-ascii?Q?zlDPxWWzSSX/1a4BsvYpghURbUSyEYy9XObLHWrw5ciBf/TG05JWE7AG1q9G?=
 =?us-ascii?Q?NIRys3i7vJtrmUOtreUrDdz/gF87aJlYF0NXCb28S5qRtDL6oTV22rkI+3rY?=
 =?us-ascii?Q?qox6JfnRr4Ks+GR5MOsBNvFbC7uO+m4C4+yx0uv55V/zgVs0C0/S0wq/ywQR?=
 =?us-ascii?Q?fKPt2Hy8Dm9lQn2FEsF6RfL4oa99ZC2/I8b4ONBD+VVsdhpEiWF2tIZpF8qL?=
 =?us-ascii?Q?mDLbOPUSaudn2wkBKeH4PFCeMP4kXJBaQYK1pBv30QokFiokq8Q01/64wixy?=
 =?us-ascii?Q?NvyjgU94T5DGzfxoOyuvjsUQmBhK4J2GisWTmI1Ot05SmRZ0FDF001RuO1Ix?=
 =?us-ascii?Q?T0xwj/0Bl0pcXkP56tuAoLqTg23i0gJaAd1a791KqRDpR8yA2IqrszDu5QyK?=
 =?us-ascii?Q?S1sDsODI8MN6shmZjHastj/13ylXNebIYjGOWEe6n94HJ49Lic7JrXAoMCPH?=
 =?us-ascii?Q?HcuyCCuhtV13rmmeqXvMmb3vkNIjNVWrWMKmrv8QRiB+VAzQHNuKo5lNz/UG?=
 =?us-ascii?Q?EWxQTGlIZaQmpdz+4XB8ubZ0k0gJLRDAQJR+gyCbCUYWrDWdGVPuTJItPYbh?=
 =?us-ascii?Q?45eo02vQstG+jbsSILqfKp8jozjNCfDKNaN1lcB/UTOp4z2hVFBFKk3ENcRU?=
 =?us-ascii?Q?LChTBKXLpCjRmyCCUAy8L1w=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	JZCBu3H98UDXcLUD/STASHTipN7klEUHgdzOl29F6/AOvuiBopg7DEZfIA46nc1DkK54iGD/EyNzlDXMjUt4XGDThQMONMa43iVG9u/UR7+DaqRvR+YyTwMTpbswnvjzw19r0Pb2PMT1Ry0ohQ9VuGXsn/+k7E8y6J3GbkK9/ALYdO4wj8fTqx+uCGa/YCkaKE4bQe/7tiQAxvUaHT3Th9UN82mdNulhyzBicaNnHXfwXJlMCIkkJJudaTalGAoTI2oQpGU913q8JFujuNkF9RKnlV+vzG2B8XQIrCy+z6MQCDwR0gdsZ1ZmGXt6hVxSShDc+Kra1m1axVwpyxIRIxrx/5sot9KWLuAgOkVr7saMCvurn+dNL/GBkfaHblred3f9TtJF5ajXXNMRz0s3KhDeq5p9lk2efUU9V/kJL7tz/YQoPtWwSCuoWn3SnYCMZJGZQHEcXLJmpZih1lAe5ICifn1WY6axgwxjs/rF08q4vSxyCo8n/EMbQ5LhqtPGKV0/uxcU0BT+ERL3ywGZPlv4im3d9+M1vZ0oO5MogLDCYMKONTcPp3u4+RoPcYeqpktau9f+mbRZ4uWlZ9NNV+AD6ZNEFlU8W1ilIfL7Fp/hCULlpdkt67Jvd+5lRDi/kRfkN/h75ozX7HdG+yklpaw4WZG4qoO0qgMbkK1X5eN2Nhzb6pHTLUsUkacwEIeA2qURAJBMEycmGsd8+xkFFbaaNhC6k/+HsB8udokR92La8/1NkgTNBvjV4MQRCN7rACzth58+3xr9cAxd8eEENM8KoHB5BXQd99vTITyykEpZxnMCEfPvA3d3nhxgpAWJyJvXKcIsrXpKJzLp0rJ3bw==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 53611946-3b08-4c33-2162-08dbf109eb0b
X-MS-Exchange-CrossTenant-AuthSource: SA1PR10MB6590.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 29 Nov 2023 18:35:10.4814
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: wYWoz+QxqItIFV1vrnqL+LnRjt4voREpiFAMueeS92Sd4q6Sqdgoctjmh+07aOaC0epunUJ7wUA7kFF68q6D3h9M99xI2ESPp+wT1Bztwqo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW4PR10MB5749
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-11-29_17,2023-11-29_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 bulkscore=0
 suspectscore=0 mlxscore=0 spamscore=0 adultscore=0 mlxlogscore=999
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2311060000 definitions=main-2311290141
X-Proofpoint-ORIG-GUID: 6P2idIANZNPtxg9UL_BXCTTEU-pKuLCv
X-Proofpoint-GUID: 6P2idIANZNPtxg9UL_BXCTTEU-pKuLCv

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

