Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5363354757
	for <linux-debuggers@vger.kernel.org>; Mon, 19 Aug 2024 16:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724083244; cv=fail; b=gqENKk9mG8QdV7HgKCobIfPAu0Rf5x1lKJWuRaqz+bSlVEgxtkbpYqpA9GS3L94NqFhY2XI9XNhXYQq0+EnWttZ7p+TXQKE+8YK5TtvxJf4bM6ApXqthnuu9WUnwdYiHPAkUBjCBLhsTLrJ8y6Vekf0e18bSXSdW4HmRBhZA2RE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724083244; c=relaxed/simple;
	bh=K745l19LO8V+DwjLRXJCc/8cV8gl+iS5GLUN3AlLmUM=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=fZRG9wKW/XCHN9y3e8Nxjsk3FxLZ2OqDebK2zG7s+vdYC7cmr3enMGXhqYzeGipL2cQhzUGH0wphf6zr7UhL1csoO+VvzthsL6YzJ+hLQOizbcRzUXgtG0v6IP+K2koGw1zORPypuNPDavvMUfPalNPKErSdBp2oO3llk4NbCK8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=fxDjVLu3; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=SPgYYtHB; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="fxDjVLu3";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="SPgYYtHB"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47JD6rK0001721
	for <linux-debuggers@vger.kernel.org>; Mon, 19 Aug 2024 16:00:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:in-reply-to:references:date:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=LcOshtG7niOLWC
	PN2x6sZnHnhaGp32MkMNIl1zfI4V8=; b=fxDjVLu3jztBbsMAWrrsgjIYuvGELd
	vxlNcl2TXWDH+oVfKxdyetnI1fjpqqr9C8CXCfK9tunjN2izNbMp6hYBdxsrQTl7
	CgRISPRjLXH9R+EVW8vVuVU2dYCG9bJEEzfNKjFgFUx6qUwKCAeJKh2iuk0lnf5A
	7CJzyvN9sfyovR8PQjgFQr/9naqtxksl4F5T1TGloADtgwSBd4Ffzgkmz/RnBpYS
	ENNgGKjuClMZCs6D612z0F/CP5H91ZpOx0Fw457YRk20GTeiqyb94WqrZmT+0mez
	d//GGIEV3vcBzxWvZJoCsCTbB7bwaG1yxcFZB1NaTNxMt/7EWHqVdHxg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 412m6gayb4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Mon, 19 Aug 2024 16:00:40 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 47JEbHEl030768
	for <linux-debuggers@vger.kernel.org>; Mon, 19 Aug 2024 16:00:40 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2045.outbound.protection.outlook.com [104.47.55.45])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 413h9bhafs-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Mon, 19 Aug 2024 16:00:40 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=FrW66y4rp6lu85ArMyo/beMvpeRHOyn6t7NkWkUEyy2Gm0+KOA4uO9ggxhIOegWYq+jKCP4V+1qJYQs+qDYOnev7EHKF0hf8bEkkSWf+6a3fmlIOYexUeGEhfwaelaVMM3Po5wg3ooN9aIxFzwQZv2pck8M0e5sHyZ79N3pYwfXErNfxAsjwEpVPfCd9+PHZ6ZubQBZ5pPDrEiUMcX+A22eumAkXZFquVvJubiCs+HedlWw3hRVGnrbq/gMwyXQBFRsEFVT7wj1PooyY4EjJaMdfC9iEi1I+c5whggZDYGbkBur6slECL+kfgTBvHadCfYLrGuq8G2uuL7ZSk0nngw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=LcOshtG7niOLWCPN2x6sZnHnhaGp32MkMNIl1zfI4V8=;
 b=aThU+XJTUNBKfiWMLwvzrb3Ygr9qiuUENZMeW98ZSuXmHSWVzg9pfmUkd9+agEZ9/euXQUgtN0vXWWuj13GcZoc/vLqf+jTmyLifqzvjUmq02se+ZWXQ5GZ+HDQcgdPkJWo38JrsE6mC5t3fT0UFfOQnONHW6a5wA4aiTEGRPrlP4ldvG96U79w9A3T8as8H2kGMzNb5ft7di+O5OmRz4JDGHozmNWi0eahMr6IJTgDPkMGII9dmPt4B6E4CuOLFEvH96svWyNlnGKAZr9lCaIIjY/MEvLQlgXPRYruptFt6UveU/a78QbjWY6gaMw9X7MtbZa78PxTbXTjPtftulQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=LcOshtG7niOLWCPN2x6sZnHnhaGp32MkMNIl1zfI4V8=;
 b=SPgYYtHBE/B90mnRtEnKPWL+VPLykN9+/77vCJlGT0N+K7lTPORU6o1Pmnkc7WBK0uuhmuQIz2qfOQWcgTAAcN2IZnMlBjcrWpcnJyhnPKYVnd2t3y9T1EEKhTw75qPzkDEjTmYR3QQQekYJfeb2ymqWzTCb5PWQhqNY43izXJI=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CO6PR10MB5635.namprd10.prod.outlook.com (2603:10b6:303:14a::6) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7897.13; Mon, 19 Aug
 2024 16:00:37 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.7897.010; Mon, 19 Aug 2024
 16:00:37 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: linux-debuggers@vger.kernel.org
Subject: Re: [PATCH v2] SUNRPC: convert RPC_TASK_* constants to enum
In-Reply-To: <20240819155901.416560-1-stephen.s.brennan@oracle.com>
References: <20240819155901.416560-1-stephen.s.brennan@oracle.com>
Date: Mon, 19 Aug 2024 09:00:35 -0700
Message-ID: <87r0akpknw.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BN9PR03CA0501.namprd03.prod.outlook.com
 (2603:10b6:408:130::26) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CO6PR10MB5635:EE_
X-MS-Office365-Filtering-Correlation-Id: 6c0a4d81-dd90-4a15-8517-08dcc0681109
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?fBSPui03+l92KuyweRujBCzW6/dxiHONe5zNgfBiXjlwF/kUDrB8vyqX9UYo?=
 =?us-ascii?Q?IPel7r7c/GXcCbPyPdOiyPykK5duGu6Gp3wQYX5XMoH0Ld/6+WYUaS6cgB6G?=
 =?us-ascii?Q?sirTlt0X+5yTKND3gSgZ5fFT5SDOvb85QyJL9nvThDXqJM7I/qmFU1iCWk2L?=
 =?us-ascii?Q?D7MSUyh/1v504SMkllKJlzBdIF94CNShKBb862FQnHNrrUM+eYriIaEuzxeH?=
 =?us-ascii?Q?yCCkfX7h65jUAfzpNRMC+TBvBgmTDEckpYnyawH/x7Xig4R9vhKjqbYFcpW5?=
 =?us-ascii?Q?LmptfYGUPzrTkYrrdGbL5zsJzR4CQkM7EHsOlh/fXYAS1QV2XuQBfjNPS//u?=
 =?us-ascii?Q?/SITLG2FTBz+mrtcVJrvUA7Gbekh19pNq4hkMl3N8287i7JeO2L1rOQIbLFy?=
 =?us-ascii?Q?HXwClFuU+BjXS32mqqEVxCJGzANK+llGP1y4JNcvsyGzKoNB4h6iPWoXIsID?=
 =?us-ascii?Q?CCiel4ap0wqRzpdPGQLlHXRePhrqRp9kmn46jd8bJ9vlayqhlUzyVtn213DC?=
 =?us-ascii?Q?QNQ+1v6avL9+CRVU2L0BFq8qe/sF0oBnu4LRbMIIsa/RZAg6g8SfZKdasVGA?=
 =?us-ascii?Q?LhLwY8XkIm1+9RRSgjdyr6WC+V7Ab38O2wa+b16Ovu1UsxZ6ZOyiAPKYOrJu?=
 =?us-ascii?Q?adz0HenfAkJ6cL8aJqdoegu5EC47AQWV9B8vHsut4aR1faAvdN3pb5Vpji3L?=
 =?us-ascii?Q?oGuXQ8n9Sndl7cpY+IzWfVLVDIcEy1om0Xvr3CMqLZhmjld0cbAX1iPcyTCW?=
 =?us-ascii?Q?sN+PsbbWmg+V8GCWNB33ESeHhRCj9DhGuEYUhRdfzj4fkH8AqSLKJEzfiUWd?=
 =?us-ascii?Q?o4TJuBY9q/TPeXCA4Bll2f4CHQCnEDcLdDckbfziBBVC6dLDCXle2vFIOsGe?=
 =?us-ascii?Q?LuNg9QdxvJPxs3HdZptiE2nXUEUMvh2rkdGwOHpX9tedGne8Jtqw2IteABHf?=
 =?us-ascii?Q?694lYVeh0FmBn5EKbol4T2TABFEjGrHkBx4vdxcZi+skkSMIFV/vwCr7Ub5+?=
 =?us-ascii?Q?D4BUB83Hz2YaJxV0P5mzTh0qs2aEj9qvm8NbVsMba/I8tj83N7/ysSB3ZNZx?=
 =?us-ascii?Q?j9aIL/JD8BmzF/pH8qJcfRYTr9vESVTCMowr6+M8yDyKXkANGUAVNjSL7w7N?=
 =?us-ascii?Q?N93Zn9fTgRZSsw50geMe7DXhTcBsrBXrqTuEslywDVykMLPvUyqA28Cq8PPa?=
 =?us-ascii?Q?62Qg6uh1ooW2HST7fWUMLwpRx3Aco8XPGaX0HFegrvpJO+m9QfaoB9j1FDEt?=
 =?us-ascii?Q?9TQsj2YL1cDS6QzXTwJQURdWXBE4tcLr6UySA8OWOYBWQkNrzKiNJWsSjzEv?=
 =?us-ascii?Q?myU=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?uDC6ih3yj3SmpdraLUPFLgv+JMI/kof0DuMg7s6B9inf3s7OFuyWEi4B5l4S?=
 =?us-ascii?Q?XGmeEVQwCxAMt5n0IvR5FYLSJ6FiXkT9wUUpOeF3EX2GeA913PYUkHlHBFnz?=
 =?us-ascii?Q?EXfsctLvFekU9TteEr2NEqIHK1LxNEILMon2Foe5QNShNSnPvmX+fijfAuHU?=
 =?us-ascii?Q?0KoNgM/UL2W023q93f+4V/tu3VMoIEvasRRvaTB+huQ4LGHgECvyXTTy8bzO?=
 =?us-ascii?Q?y2SVlhXKwPKFBq2mJhIq55m0vcBvATSYjxZDWxHJ5xsR5dI+bxkUEnejy+8m?=
 =?us-ascii?Q?7BMTl0f71EtkFThrglqTBVwI4j5B7aDkrwnhDzK/KpDbZVuS3TR+vkRoYVfl?=
 =?us-ascii?Q?t3p9PKFZy5DzEP8kZ5ETjTyKDGTwWt0R9QBj8DjlplnhOUapOiKXFUdkfmw7?=
 =?us-ascii?Q?3xh+MiUOkLEzSyMY/hHOL8bqx6aFUZ9qN7jNzV3/ChAmhfL8g0LRfRCz1nlV?=
 =?us-ascii?Q?KyAxDuiJ2URinW5ISJZA56Bz3G2UnLtexYIjZmVSEzDp9/C6vDV27gA47xaX?=
 =?us-ascii?Q?tRbwR3Ce7mnZQKd02N/VNourSury2WpWZSiAiJ9z/ZENXKXAh7VBZvuaq/J8?=
 =?us-ascii?Q?4CdfNBpGq32s6ocOT9eAk0IaofCZzVs/ErdlFIMbTwRy1+KZNIIVHGavewNE?=
 =?us-ascii?Q?ygBKNwHk8lX4JQ3E7/C2/lt/3pTOrDIUHea8tTxaAIAfBObHzDwFzbcHuceF?=
 =?us-ascii?Q?sT7lCVEp65oo0bFj12c51jB0B7IcvD07NWG/764lCju/GUfHPo/e3UIFt9Qu?=
 =?us-ascii?Q?doM3pP4yofmMxZK91au8pW14hDpEwc5G85QZXEmNU0WG9n4GCtRHa6ly+0xb?=
 =?us-ascii?Q?xMOcM8hAewBNdDlIEgaT3AQpD1jLg0j7nyFyOqbLxKTO55ghEu8hmyp580C6?=
 =?us-ascii?Q?PQW1R18A8ZwQxDIXkmlehGRnXm1wwJvtDh6CLn/wYS5IlcaZAodxFa/VoX22?=
 =?us-ascii?Q?rDLbda5+w2Wm/84OUf3xxis3WcSg629KfkNRvMCom/BTW6z4xiiZZHZ7wwRH?=
 =?us-ascii?Q?MybOu8wjTf+iv+hH6nq76T2XDM3uFpTbgVs9Km0pdM5Pxx+w2h2jzra5lXGY?=
 =?us-ascii?Q?OQTyh44YQq+of7r5970+c85vrrN2eAt1Lm/QEqjIcIZ56HFV4Nuoqi6xHguo?=
 =?us-ascii?Q?H6HuSOMB0BlYN+PUjCWlbcJgYEFtjgpxb77HmcRbKhj1+MW1gyZ4gFaS2Lm9?=
 =?us-ascii?Q?I/ejfWqL99Xl9O81CEDkjNyBlJtXfPaBL1hPNTsfS+r/aG9WBfGXgj/5+/tm?=
 =?us-ascii?Q?y/phF2zVDUD10BbXp+ZzlCRcY5mKsSaxJpFC8KpbvsRDUaWzRBjiY4SaOqEb?=
 =?us-ascii?Q?7VK5F59XR6k8G1Pswdk1EQvLLYjUMhlVxbuX0lazV3SwFnfDJg0M0gM++n7G?=
 =?us-ascii?Q?MyNJgpRYQ9BgE23yaTIKvGdBB/HZjyPpNoK4P4fPNQ1F9bGh/wnc5FqKgA+0?=
 =?us-ascii?Q?ma+Vl+Ify9+bRDH/eufIyeuh6YiZKPRkjmJcxMOzmTdTuezhb4oDbBTj047a?=
 =?us-ascii?Q?Kw8DtIgi/b6URiiYCz+iaZ/4Ucc1BAtt/cUw0/PBjeb8bc8v85Pkks6hkxCh?=
 =?us-ascii?Q?exyHwkKu3LXnNPyLpH6r8gVCLQJTt5uYOIwhqGx9nu2w4RraOF/nFgxmxcHF?=
 =?us-ascii?Q?Zw=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	bUKAWmhF+Y7qU+vwgjfaJsxSYAqAPZxYsoTicotKX/aBvKGkmDtOKYHy7JlkYo3IFC3nk9snkHF1pXQFmA5A5wBKtV+u4R6Z8HXq+QoaeevhGw6lk9LjxfYz9GxZ+0B82je/NxYvzUd6l5LQjpeaxgM2fxadsn72xJFHYXXKlI1e7+iyDcY/FBWTuFussJYmKUpzr05sk+m85l9BJofOlA9HmlcaghOkL0zK18fnaTZG2spH937WRfragNmRV7SOpeQjyQ1bANDxtnZTJDU/d45i3m2v/O0X1431MxmYqJWTalT/1zcahkuw+iVxf+1z45AIMyrtOtjEu01lMgxmL8zBgJgY6Yylrp9tdYzqpYWkIlh/o6jzMt5GP/FyqVmSVFjINkd6S52faqfx7QvP2MQs/vfl6/BWaaUEoxtaEwDYJ3MqpLeLnAUzLebZ3J2YcNuhenP2Ixaaqi/nbuVXYRYHXzMXBcUA5E8jx1fba9p5mN9HIMtvSVinopCg4cP5w8FqR+ilacA+qdyIRrsY6QN9lMmf+cYUCxs/nuRAiJXuGq55gaj3S0dS0y/Ln006glWp10jM4vdrlePq35K35MWjOpfCJxA7P7QJl/QnwFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6c0a4d81-dd90-4a15-8517-08dcc0681109
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Aug 2024 16:00:37.6691
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: SrE1vhSGcKVsZtqjHHMKpd+ksE+YeNQ6BLHjrTAaqvKN310RMZ31NXTkLVqoydJyOthus6qi3FzfJ1Y444lIPCQi1ZkZpLB9OUkbCn/1Onk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CO6PR10MB5635
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-19_13,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 spamscore=0
 suspectscore=0 mlxlogscore=999 mlxscore=0 adultscore=0 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2407110000 definitions=main-2408190107
X-Proofpoint-ORIG-GUID: sYEEfQ6TQeIra1Vle1LEyfabG1dTXEGr
X-Proofpoint-GUID: sYEEfQ6TQeIra1Vle1LEyfabG1dTXEGr

Forgot to CC linux-debuggers, sorry! Check lore for replies.

Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> The RPC_TASK_* constants are defined as macros, which means that most
> kernel builds will not contain their definitions in the debuginfo.
> However, it's quite useful for debuggers to be able to view the task
> state constant and interpret it correctly. Conversion to an enum will
> ensure the constants are present in debuginfo and can be interpreted by
> debuggers without needing to hard-code them and track their changes.
>
> Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
> ---
>
> Hi all,
>
> For context, please see v1:
> https://lore.kernel.org/linux-nfs/20240816220604.2688389-1-stephen.s.brennan@oracle.com/
>
>  include/linux/sunrpc/sched.h | 16 +++++++++-------
>  1 file changed, 9 insertions(+), 7 deletions(-)
>
> diff --git a/include/linux/sunrpc/sched.h b/include/linux/sunrpc/sched.h
> index 0c77ba488bbae..fec1e8a1570c3 100644
> --- a/include/linux/sunrpc/sched.h
> +++ b/include/linux/sunrpc/sched.h
> @@ -151,13 +151,15 @@ struct rpc_task_setup {
>  #define RPC_WAS_SENT(t)		((t)->tk_flags & RPC_TASK_SENT)
>  #define RPC_IS_MOVEABLE(t)	((t)->tk_flags & RPC_TASK_MOVEABLE)
>  
> -#define RPC_TASK_RUNNING	0
> -#define RPC_TASK_QUEUED		1
> -#define RPC_TASK_ACTIVE		2
> -#define RPC_TASK_NEED_XMIT	3
> -#define RPC_TASK_NEED_RECV	4
> -#define RPC_TASK_MSG_PIN_WAIT	5
> -#define RPC_TASK_SIGNALLED	6
> +enum {
> +	RPC_TASK_RUNNING,
> +	RPC_TASK_QUEUED,
> +	RPC_TASK_ACTIVE,
> +	RPC_TASK_NEED_XMIT,
> +	RPC_TASK_NEED_RECV,
> +	RPC_TASK_MSG_PIN_WAIT,
> +	RPC_TASK_SIGNALLED,
> +};
>  
>  #define rpc_test_and_set_running(t) \
>  				test_and_set_bit(RPC_TASK_RUNNING, &(t)->tk_runstate)
> -- 
> 2.43.5
