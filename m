Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 055711EA80
	for <linux-debuggers@vger.kernel.org>; Tue, 14 Jan 2025 00:23:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736814183; cv=fail; b=CX1yQzztx1PacoN5pG/Vi96zlwrekFqUh+J0IQMRBX+odQHmY6e81z02a2n9H8RAIRTQ5H9qOcn+w4JX5xZI0Hb7fABxH4Xg0JBA/b/s8MF9kuYENhmkG4H7qUVbvirpNelBUk6TFy98JzhiFZqBUmjzuCmbPIUAQ/b+6bQOTV0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736814183; c=relaxed/simple;
	bh=hmYSpJttX7oQ9FMl+vVaREYu8YnYk69Y1Oq2ZCbI5QE=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=K+6EKfZxcmI4pU3vuXOn8uI2k5HwhX7YmuWeroKVbDl1HBzC7fps6fE26w+NexZkTwx1rqAEMkgeIi4wMnMsdv6v7opBgSzJzhuousDL2cyqYpkzDvcH8+VGomlKaTW2fhFhgqoXJscSvU9GMFO14LAltCoszHDF9FxA/KSS9dQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=D8pI2Dcl; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=xkHRv/qc; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="D8pI2Dcl";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="xkHRv/qc"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50DMB3tR029685;
	Tue, 14 Jan 2025 00:22:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2023-11-20; bh=SEJ10iQL/uXjDbAjUJzC+dVHp3ey5a6n7BCIUyDgWu4=; b=
	D8pI2Dclj6tXJMkT9cAn/PZfoH13C7fK7q/3sj2qcG1ayGp+mwwgui0sisraPmtZ
	/IRyKQDWg+scNyC34Yhd/MTE5XmLGVDTk3idTxvd8PAErMtS+wVHmoUUQVHD7otk
	XU7u5xT9r6KHQ4uKT3QbSUt6y0oLxC1JqHs9jE6tNIDWwxifGzscpZZry4vPZRsk
	e/LC50FFyCsa31mY0NOSagEuH9ZS6O3DteJ4DXhfiV7S7DKGGi6H7pqLpbyIdiit
	MC+ujAZ1mScF4qt2OxX+bUx74JHu2BcxuyU9ZCiTj/qNc/bIwpTXDDCXzM3WgBo0
	9Z6l179V9CKbrtwKmfVrrQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443g8scthm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 00:22:05 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50E0HFIF036418;
	Tue, 14 Jan 2025 00:22:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2175.outbound.protection.outlook.com [104.47.55.175])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f384ym2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 00:22:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=e3HYzlam4G2V/Yydm12hNykX2/El1gfPo4HzAehYI3qJoWfhfCKbwa0mEB8OB176En3yQAx33+eyepEWRDZW0DP54jjq7mozATrnE5wAf8Rb6zfrydU+ruVsyAcSdLLuoZdOmgelHI3wCv88xHY7ibfVcy2PsdF9+LyMfnnAFpjqpEe4LsGWmrbtdGCAtBoxrYNi6t5CDpaU5W+nGe/9gRORopmQuNzCuxZh4x4n8sfo6l7ge16NaxG2Ck2BdSgAuGu0WmkhGxNnWBrE1Upy5ma5/CVd7YoEg+bkquzHPR/EeyTajJ4WCDMliThLq1eztJbgVQ5JsTGeBrQlUVJrKQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=SEJ10iQL/uXjDbAjUJzC+dVHp3ey5a6n7BCIUyDgWu4=;
 b=Qtz9f6caUmVZqDTASfjUMe498Y8OL3TvRj+AiBGzlVqpKOwx4H8okyM3dz9sYS+hMDkSs6SblCj9lKLyfJ2REjjioQzWvPjJg61dkonmj4KvofDcDnSgo2Pkb828a59n225fu5XtNQUH7MYhL9re8zp7tja90v5jAsIGqyvojx0nZV/L0NTrSzCukF0vraWBplG6bQEoMqeB661++A1HbvE3+gkRnfScsMwHxDj8BemXGg7G8QoHQFSGwoGM9DH1m083M+VbjGVEz4hW9HdB3rXtSwU+rhabZ8q6xZtvj3whSiDKlLe6zIC8dhCy9v+XDGzavri2e9x8v+axsEhWhQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=SEJ10iQL/uXjDbAjUJzC+dVHp3ey5a6n7BCIUyDgWu4=;
 b=xkHRv/qcWivsU+o9WGP7aUFRT7daecC+OYioam+M1BE4WXZToAwMOeZj7rA0W/AVhgyU4SUwJzuelV7d45csg6hzKHwo1ZsrBZ0R8dUfu4FP/NJ+QLyj4Ty+Gu53K7+yUiaceaOqa89fGHZLxIMVbpkpTLpg3KioF7oXXPQprmI=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SJ0PR10MB5801.namprd10.prod.outlook.com (2603:10b6:a03:423::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8335.18; Tue, 14 Jan
 2025 00:22:03 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 00:22:03 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: binutils@sourceware.org
CC: <linux-debuggers@vger.kernel.org>, Omar Sandoval <osandov@osandov.com>,
        Amal Raj T <tjarlama@gmail.com>
Subject: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
Date: Mon, 13 Jan 2025 16:22:00 -0800
Message-ID: <8734hmtfbr.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN6PR17CA0052.namprd17.prod.outlook.com
 (2603:10b6:405:75::41) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SJ0PR10MB5801:EE_
X-MS-Office365-Filtering-Correlation-Id: aec0664a-3967-49fb-041c-08dd34317812
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?svuUWhczjXZ+QcUTSy2V5rH4T3WfqGbjKgkyn1Xl82fCqrbB+JU/Ol2cIUd0?=
 =?us-ascii?Q?DrqGwXmqCJ6q7XH1Y6kA0TxhfhjLQElfCLTsdZ5E3c/1QDLVJvNfJVsIVYz6?=
 =?us-ascii?Q?FtRquWV2wlFaxgtYc7hgep0ti5xTRhfTU+3tsinl4AOV+2odx4C0sHfioYAM?=
 =?us-ascii?Q?QRIZiesJnRKgrAtO/s8SBescnIoTWscbTzGvfuoe+JSCQIOtt/B5S9bSjya3?=
 =?us-ascii?Q?vB/Z5Z87PKWCTZSj5zwa86lnNsm+JOjAABl9fwp2HFQX+TnDOD1fe6PjthLt?=
 =?us-ascii?Q?mhCgHVTqOLLYRe3gL3PPHLxr79qBgF0pTebFw7Px/30wPJayNKZTA3TzvdY6?=
 =?us-ascii?Q?c1Q/kDSjqQ/xUWNqk4Q0eunc4f7qrV9E2xE3wCbNIMP98P/sVSVcs0mSApJq?=
 =?us-ascii?Q?Y7MPqk90nqZfRNmiSYHcY6gRxPmqouaN4gyWf2U4LzVlQqqsKDGPv7hApjPg?=
 =?us-ascii?Q?JNml2/S2FHJKTaz7+DpfO6F89d8YJTwDpTZrB5v6vjO2xYhvv+RFRasONWl9?=
 =?us-ascii?Q?UDsZgHvB5lvOF5DmZe1YSzK5luYa+jrE6lYGjaLLnrqJ+K9vtGeZdlCCvQ6m?=
 =?us-ascii?Q?svargyuwdakqbHoJ3XyiisCQYDGS18Jb8O6hqEQ2yndNCDPhrw6yjBJ4P6O8?=
 =?us-ascii?Q?7RDO756HHO1UBSAW0gGD2NieACvEGc6YXt2PHT30rL6RITBKWJsYvF/Nu+Kq?=
 =?us-ascii?Q?n4u+4lzsnSqco9cxhKIUL4hGPaxBM8UYlFRc9tGWvpFZXDchJP4q7PdMETpd?=
 =?us-ascii?Q?0aW0VOU4r9H/aWfc11gd7k29m3Uya73X5rXaho7QOkVCKY7b7QJDC7Z/fY70?=
 =?us-ascii?Q?bEm84xKCORX86SMoAFPLrb4GZ/meqnEhYRCoRQuYleZXwRaNhbKiPOt+iGLJ?=
 =?us-ascii?Q?0YuYjiHPvZx/T6Y7vhCbkT0PD7cabpBi3IX7Hqp9pFUDDeZ16lrqMwuCBu/p?=
 =?us-ascii?Q?/r/0R+8cq8LnPJq+OkBzyIEdWU42PCUDzHaav/z6eaWzM3xSA0utODe57omu?=
 =?us-ascii?Q?3GJtXUsWvlobc0KasRFR8ZAz4Qer2jUL61xSD6T8g+76u16+Yu+yDV2dM3Tr?=
 =?us-ascii?Q?NqG8b91QrGlHpGT0vnhMpCbb9YJYiAgXJxD/OecpqdXaj9hUgf6shIDicbjj?=
 =?us-ascii?Q?0SUntTADxcX54bYWJYuZHTAam9lS1+yq/INxZWuolJI39XtGydRgzma8ojYW?=
 =?us-ascii?Q?790kS+nTOBuJRiuxqkjy7Ql/fgSoDThWNl/2j5ONwC4h3bl131QFfwZ51VJR?=
 =?us-ascii?Q?h8a7+6bhUcvL3qoDSxjRmpItbUX9LIOYqa1hbJrLFIgpPkOfE+OBVBGqJLiI?=
 =?us-ascii?Q?Y6qKzmuqYPSTLIWYkadvsWe0IpZpSdGMq7qSlBhpytYD5w=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?pyiMXPs0L6RJwWbk4e8+694+IFdZ62LADnQ2ca/Kep/YpJuGlLPsq/Cov6xe?=
 =?us-ascii?Q?0muE9IxxIpA5cExdjBqQVeEfvv6bH1oGRgRsfbFkDjprVMC+Ut+dBK7oCCII?=
 =?us-ascii?Q?RvJ/wAd6wz1ei442tGwkBPJAfHOON8rZGTz4BGAA165lA2pXwGvQ6xc41mv3?=
 =?us-ascii?Q?MZ+D2JunmSprXqeEM5oTjG7zNFkdL7MjKGcUgyB+jMsVAbziGSzFhtVtyuLX?=
 =?us-ascii?Q?bN8hyibQj1kxdB8LkK5AkGOIRcTog0wzQWs2XT9XdS0h7SKMyXvTh+a/Ktd5?=
 =?us-ascii?Q?2f3s7efmjaVqTlv68pva1pqGt8WSqMfEWAh1bnDNtypbrbJMFDd8OORblPIP?=
 =?us-ascii?Q?8CctYFvrF6UDoLeOMyIiU975LKlk9PPILwoua5rQ9beuAmjMe5tUqrEnt1FJ?=
 =?us-ascii?Q?GirO4Ac53YnuHxg1qf3YDLsOJlpK6ULbvmxoV/LtqQFq8gtg7hbB4RtC1DZd?=
 =?us-ascii?Q?tpkFQch4atJvDdGZOKeWcYZDwLTzkzmZjGffy3rvTBTryh/LrwLhxKFM8TQF?=
 =?us-ascii?Q?7C1YsEdgXOV82k456wjAxLopPSAf8Ty0x8UgrYwlV8MamF6mguks1xGQ1Mkh?=
 =?us-ascii?Q?voJxszItox9zb+XvGakebKCAzypOLrD4YorCCGPZwSxqwkcLpnGbv/+3gOOk?=
 =?us-ascii?Q?LGlJCbJqz3xd1d3yjk9wUoFSXfOIQMhwoo8Rd4k7LZ37cF1j6jQ+sM45amSS?=
 =?us-ascii?Q?LXuqHSSv7PC0M+R9dwabTJXjbZvnJgm3OCEDxaBIoWEOLTbYNx6SRCaY9lq6?=
 =?us-ascii?Q?wnhK/ohckB+/VN7EgJLdwMhvx0ZYhfY3BBM/6mrLw+V+ISSkz0reX2+0ns7C?=
 =?us-ascii?Q?ooxReygli1G1BhkL+77HcldGzp2n71/fLZg/1sHx6D2akGdrEdqU4tKHQ/rG?=
 =?us-ascii?Q?wR2uReZpX8Ir5v8T4C2sAH3YhaTa3fnRF85wMbY2Oqt8k3dqvEF7AXiFuoDj?=
 =?us-ascii?Q?GbdRN6sFJMg3pgitBie8t/hu2PHr/XZw7pLaFiSZkLTheHHgA4mvaf83Ityu?=
 =?us-ascii?Q?MB05YS8h4Zg62ppojaY5Goy0GAapMQbOUaiwWTgjxh60g1xsDC8IlnttR4rT?=
 =?us-ascii?Q?ivJ2B+NH+XYtTB50bgolNquILd7kXQzEgVfudMTcU77l9shg72tsHow3HZom?=
 =?us-ascii?Q?dA94avfJOSxUh8ae9CLkH+wP76TQAwhx81/7X1UTKfIID+ism449eyFyM1J9?=
 =?us-ascii?Q?YUJbL3IGwAzWZdkjooLjt/rYikBZCRCudD9RslZlAhRfNnHOZNQVWagz3Rfw?=
 =?us-ascii?Q?t2PxaBngplluodQzSIJJPGxHbEp3PlL3zIVKr5p0xL+vGg+kKTqZ24Y3owaf?=
 =?us-ascii?Q?UzwZ/OlMvJ3ZCa91Klep9ojxLgYOl+4UkcDkJQq00FVvZ8ICvUeSyFf679wB?=
 =?us-ascii?Q?kRLgwy3rTo2LkzD2QHMfGZyIbEE3G56lwxUlzQV1a4FUEbCWr6FJL1eAn9Rn?=
 =?us-ascii?Q?J/aEvjJikQ0oj4ANgWnz8HTnn3AV111xkchsTK+Ltlci5A0rMEThfYNLXfMG?=
 =?us-ascii?Q?XL12Pm8nN+hJZZE8B3RtTcAlXjYGnqrGqFAzM4zmwAWMUM+7IQIBkWv1SVJo?=
 =?us-ascii?Q?D8njlZMX8nzXv/QKE2UEF0Q18qwD38TM0pxngtTIAqLwj/MVR8fO3CvnZ5SL?=
 =?us-ascii?Q?Rg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	m5vh/JOR8iI0yJ21U2wtrLOA2bLIl1W48bODtLEUm0PVSm9q0uXMFwdADRxd3+dzWTys8PDXESsVOo7gFO9asm3HuQn93c5iu+XT9lJfqbApL1lii0JbOuXc4MI1qzUS98EfEpn3Xp0WXHIMrFoHujK+5IzOrvlcIcy6hBm6/dmQ2EO9eFC6VoYKGni47Zu4cDkEejP0MNqKd4ERiHcvXxXGGe3m2i+DmPZlnx5zWJ7RwOYNrJUHP4VkR3mXRj3Auvgwq0l5h/eB1PH1vNpH9ELS9gjca/VHjqlHXOTjaEGmamCtVKrOT6JZXGcoVNYVrL+sLGKdlwil6jHKO7c/ZWnMEoLHOvjPWvlZex6Nnx3Sx88Je9vGf4phFIrZjz1rghbv80z41Ng1NIRdIzRsDNzo16ZIPCPNcgDN3TUQvPmX0TyMZL3OqSXjrD+RmRu2tx4G0S94/zGuJWYCG/Q3Evod1w7Ra9fdRUJOdTqOKswhOc0gTlixy9T2jiaC471+AnlcLWE62E25XhyXDQ/L+iM7n5zyU3JFCU7eBiRMCAFOZ7eACAtIu+jsAzzUrzo0tblaBNY78ZUpy0M2hLjmLS2Us0aJ1ZusWweTYg0M0FE=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: aec0664a-3967-49fb-041c-08dd34317812
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 00:22:03.1021
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: H85sRgBUt+854oCuWCmeYHZ+zjlObIP1ZUyuucS0u0MFbKgXJlSDXTsjHP4CCr5+5yvCbvlu4npzO3IMhOb5VLjfiKyL5+c/qCfk4fpMAOE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ0PR10MB5801
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-13_09,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 mlxscore=0 malwarescore=0
 spamscore=0 suspectscore=0 mlxlogscore=999 adultscore=0 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140001
X-Proofpoint-GUID: 4ifmLdI9sEoJXUZBdnY-WeeLXLTpho1y
X-Proofpoint-ORIG-GUID: 4ifmLdI9sEoJXUZBdnY-WeeLXLTpho1y

Hello all,

I contribute to the drgn debugger [1], and work on debugging the Linux
kernel a fair bit. Drgn is particularly well-suited to the Linux kernel
and contains a lot of support for it. It currently supports attaching to
live targets via Linux's /proc/kcore, and core dumps. We are looking
into supporting remote targets via GDB's remote protocol.

One piece of information that is very useful when debugging the Linux
kernel is the VMCOREINFO note[2]. This is a free-form piece of text
data, typically around 3k bytes, which contains information that
debuggers would find useful in interpreting a Linux kernel memory image.
In particular, it contains the KASLR offset, the build ID of the kernel,
and the OS release. With this information, a debugger could attach to
a live GDB stub (e.g. kgdb, or QEMU) without needing to specify
debuginfo file names or memory KASLR memory offsets.

To that end, we hope to extend the GDB remote protocol with a facility
that would allow the debugger to request this information. We've written
up an idea for this proposal at [3]. The summary is:

  'q linux.vmcoreinfo'
     Retrieves the Linux vmcoreinfo data.
     Reply:
     'Q [DATA]' data is encoded as described in the Binary Data doc [4]
     'E.<text>' with an informative message if the data is not available

However, with the candidate kgdb implementation taking shape [5], we're
becoming concerned regarding this design. It seems that there is an
implicit maximum packet size which is not described in the protocol
documentation. Many stubs have small(ish) shared output buffers. It
seems to me that data which would be 3k bytes before escaping is too
large. We've noticed that there is a 'qXfer' query packet which allows
specifying an offset and a number of bytes. Maybe it would be better for
us to add a new 'special data area' for the 'qXfer' message, and reuse
that command?

To sum up, my specific questions are:

1. What is the maximum protocol packet size, if any?
2. Would this functionality be better implemented in a single "q
   linux.vmcoreinfo" packet, or as a "qXfer" packet?
3. Is it safe to assume that data transmitted in the qXfer packets is
   encoded via the escaped binary data format described at [4] (rather
   than the hexadecimal encoding)?

Any other feedback is welcome too.
Thanks,
Stephen

[1]: https://github.com/osandov/drgn
[2]: https://docs.kernel.org/admin-guide/kdump/vmcoreinfo.html
[3]: https://github.com/osandov/drgn/wiki/GDB-Remote-Protocol-proposal:-linux.vmcoreinfo-query-packet
[4]: https://sourceware.org/gdb/current/onlinedocs/gdb.html/Overview.html#Binary-Data
[5]: https://lore.kernel.org/linux-debuggers/20241210133448.3684593-1-tjarlama@gmail.com/T/#mad965a732c1c5e9e2656e4be79ffcdc36d89b7d1
[6]: https://sourceware.org/gdb/current/onlinedocs/gdb.html/General-Query-Packets.html#qXfer-read
