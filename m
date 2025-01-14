Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6024D18952C
	for <linux-debuggers@vger.kernel.org>; Tue, 14 Jan 2025 17:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736876425; cv=fail; b=FHSSbJG87v3O5QYzjyXjXlpvvITmzH8AJ/xUW/8e8KJIh+heafcYbAQ1CBQL8iEB+PM7ABrUOS+pHLmKJJQfABX+R/oSzbM3HmP999Lln4TgsjDb8cfM7AuRC8DJ9SsmQvqYxZUigWVdBkqjKdp2UufUfLorU0Pc4rRoz7vw4K0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736876425; c=relaxed/simple;
	bh=9uO46YWOCUbtrPmaMuI2mdL9v9sV24KgCmlqAMiZ/H0=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=W2BuSnCmp+e4yRXnVwLJzyXOumPPAtnUY8gVR4jnFP23tqKXi3+I7MCnUqad0aU6XkZgaSwMGrt/hQjWpwCs4yBlIDo6qliPbt7mqkIRKWPXbaSpzrPMnbK0r6BV/hpx+3AQunrnHLkQlXCNLIKee1ybB2RGAIZvBJYpX0TBoz4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=hdD0Jg0c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=LbPZV1j8; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="hdD0Jg0c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="LbPZV1j8"
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50EC16dn018757;
	Tue, 14 Jan 2025 17:40:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=+2Z4So/9y8h557tHbe
	3SQs0JyZoBm9hJFbtciUDBPAU=; b=hdD0Jg0cTl+ZwPRr8fsdSC/IIIlwg7XJ/u
	zI95c3WbrLCzuUeB/eqjvruDkuGwAZCxbuKB7rAVe04p3qoxvggJsp7BacN0y3uI
	gXPVRBvmR1My15iSVggvMqOyjcj2qbiNFW04ymf9jQwYp+gO3J8RpwlaF6ymBDQp
	6HcPD/vKKPTvf+daSCQ2vAmuWycAB6Ob57H6PqWi23kw2PKAwU+A0dZ0HqgqOQfT
	CbYA85jBdxYqG/futQShOTydiMGwXqiUl0XXe5SylCOW0v+Q0wpd99GXV7A7bRS+
	Pda36qjMOmUWPyJGT3r6Su8gdfe7v718UzK0g/Tw6reUF4eP64pw==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 443f7y6838-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 17:40:01 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50EHCQ7n020427;
	Tue, 14 Jan 2025 17:40:00 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2172.outbound.protection.outlook.com [104.47.57.172])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 443f3eqtv0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 14 Jan 2025 17:40:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=jbAiUtlB4/XuVfKN+OygZOp+L7+RapA4oh7sq0ilrUQCKSG77erGOuAwO7IWqfYpIx9L3b3RR2T93nIySzbQr/IZ5uXWfoQZ3lvxr0tqFTFY4iZiN0HhIalhAw4y6AdJMXDCt0kHb1yTr7Pm7OxiwDavPKU5MQ5JRxYPmV84g+dTsBIlC8yg/WuiZc9AUShJTRzJuOzXFf8ghmr4m7T2N18tmeTZNHNH5sNjrHtRjYu/p1c3uSYhA2nDSTs1jjlwsRJeTIQGndSn9uz1i+cO1vSviH3q89PU0GHVHzPwmykRLjTkVFAW2hkrRpcPx6yFQeDxnBQTF3vLeldNqruV3Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+2Z4So/9y8h557tHbe3SQs0JyZoBm9hJFbtciUDBPAU=;
 b=laXyWlGTLyk/AcPNH2z34jlpznGSbM44M8J/Xu1cwR8+E6TAFlXkbANT5tKT16xTUeyXXCplrWWM3tW0PjsDLqb5YPAWmTg3Y+ySTBkI8uM/0FqlIOckLJ/lt4lF5k3Qk822c3wEWGEnXrzyHWgX0zEx0TWaNshzMtrPc7jcuMK4hjV6QfYNDM7pjQOkX3hLK5MXggtouVORz16yo/Dnt1dXXnSKIYaq4l9OC6O9Vd+9D23VXrWFEIXQMc64FZmeMnh3fi6CFg6rqvX+66/mUcxHXgNYuZXHjyXAd2hwl2RLjUlOZ4Ptm28GCNp1mhsjFDDWQn1wNNvJr/7axcYdNg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+2Z4So/9y8h557tHbe3SQs0JyZoBm9hJFbtciUDBPAU=;
 b=LbPZV1j8jlf8z0ub4WlxLIK1w3iiAar9VqPPbBotTt5mq5UT3GOfMfltmACHB/2/zBYB7tPdoz6Bu2d3A+kS7nApmHF6T3O7zIkIw+NolXHUBIrTF57OkXGD/uZnC3ALY3+rzaf5eOkU/lwHTahF5DBNhCJ1TLTHiykF0z3klHM=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA1PR10MB5733.namprd10.prod.outlook.com (2603:10b6:806:231::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.13; Tue, 14 Jan
 2025 17:39:56 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8335.017; Tue, 14 Jan 2025
 17:39:56 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Tom Tromey <tom@tromey.com>, Luis Machado via Gdb <gdb@sourceware.org>
Cc: Luis Machado <luis.machado@arm.com>, linux-debuggers@vger.kernel.org,
        Omar Sandoval <osandov@osandov.com>, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <87plkpqpuj.fsf@tromey.com>
References: <8734hmtfbr.fsf@oracle.com>
 <5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com> <87plkpqpuj.fsf@tromey.com>
Date: Tue, 14 Jan 2025 09:39:53 -0800
Message-ID: <87y0zds39y.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BL1PR13CA0066.namprd13.prod.outlook.com
 (2603:10b6:208:2b8::11) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA1PR10MB5733:EE_
X-MS-Office365-Filtering-Correlation-Id: b86f1c04-6ab6-4a05-32bc-08dd34c275d4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SwSLfx7w8K0xkWzoKJPCCs7mQbZX5hcj9b288l6AGORuOmrYM4fOI5t1nmnQ?=
 =?us-ascii?Q?OdetnT5VmXl9Sga+AmLktHj0GJgx00S0h0kEf71n8/FxeZxS55nbct7vAPwl?=
 =?us-ascii?Q?CEsw0JACgwx7IuQtm0LrO+Ep1fYXVgqyQR28qi9pMAHPV+WEZN7bdBA39UBp?=
 =?us-ascii?Q?ZTvVYvGBuy/jbqOr1T5vDa5xvkF/Inyx00GAFLiuIbpMm3pnE9qTyinsTQhl?=
 =?us-ascii?Q?q5B+uApoMllRLZgKUpfYmRxALgphQIRsKEoFHqHVLxboc5bbTqrATE5Up2O7?=
 =?us-ascii?Q?Xa12cYRJS11ipJ3mFZqyXwxAbmn/p1iBaFECLeTX5vfxQ74pDsARwMbADbrd?=
 =?us-ascii?Q?NA1K0/kTjf+FmiNM0gmsc92VNhYHOxzrb4y+cJCex3lCo6xjgGU/Kw6bsGno?=
 =?us-ascii?Q?SO0pbuebaWl0bxKbCCKgRwJXFUaSONuJLjgGAJwzeFP1Cg55KpMwvcIK6dON?=
 =?us-ascii?Q?3t75OOGuUpEeEncTsiIKpTBH3YvsD0xNXSewJUsFsveqhRenL8q4HJHGs1P8?=
 =?us-ascii?Q?AcVizk8b4F1kuDnC3F23dV+QxQyxgP+oBghKykDE60bP9xw8I2GrSCtVdzkc?=
 =?us-ascii?Q?Q3vO1SzE9x1n/xo43sR+y7H8aBc0TPH5nOfhwJLILcoiN/zD2A2lIKayGoGc?=
 =?us-ascii?Q?ggDyJKxi/3hIIIhtSxY0kjs7WO44epPGa5c/mkjYKXn0DDC1fFbT8BD5j2sb?=
 =?us-ascii?Q?s5RApGdTHvSAO2lotYgDalrLkrC49LRW/dO6jod6Wq3JtZZb8vf6B2ArCl9U?=
 =?us-ascii?Q?Q68Cj9tl9SCvPQLdW3ZFFe8YYJTBZeH5VGy0/peRcbFXggNmYmmsdSR32hFx?=
 =?us-ascii?Q?I6VYWEDwBKeNnCpc6LV+ZWCzUlRaGHrGNg0+cjVesyOnFh0SQwqhWQz+c7Hb?=
 =?us-ascii?Q?KOQAv0smDilixvnZvfdzCT7V7snWy4jxZtKJg2aid4iOapLjohnion4nuIsX?=
 =?us-ascii?Q?I2LsLSQ2g6RLd46vpEs0I04LIXUmqjerBu8e4vYX6+UFYI36fOwuBBkFG0CV?=
 =?us-ascii?Q?hHOpRe4MnNN2PlCVlNAxDZ5qONq7Aoq5QQetBTLNOrHKDFmviBOAn6ZiaoJo?=
 =?us-ascii?Q?VPG5lJKA5PRO+PWAbQ3ZzIZ5Sa3yYG4AadqSManOJm/D2gktKkYajizrZQvu?=
 =?us-ascii?Q?fyw7mRdny8cQwoNbVupgWu3SoxoH7aGlAjzSeUofVcte89cXGq4DCcmMwhK/?=
 =?us-ascii?Q?bSFknaMQMZCDCOv3umyNX5cnmqQoOldFUBJIBadoRioZtpDAYoun9Le7A8co?=
 =?us-ascii?Q?MdwDM/geXF9VrW8Rzhi78pjI1046cHwJQMg+oQ+T0YY1kyyNHvwZUUlpu6N6?=
 =?us-ascii?Q?+uCkUNMEfEhlXB2PIkNHUjMhxN81Dq1oUnlU3mN5KaB2pA+rhWFg/lW+8JbS?=
 =?us-ascii?Q?igOzMIKPW7vpWZIO7pukPsq72z5f?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?7kgzSJov15Ebla9jVw+7rLAsBIQR4ti9pqrGDLxqwhYa0JX8X8nCkXODR+2k?=
 =?us-ascii?Q?00tpvlFAIr5cITKMjgknsPFS46Xi0nXft5t8sCN0sm8EWc8+HFF0VAtMPvuC?=
 =?us-ascii?Q?75mco6oTs+7Bu3EPQ9xhg3QaySjQZrLHJJ6fgrEPF29j8OwLnZbPXeqkDTy8?=
 =?us-ascii?Q?aBTcd8+VyA+uoJnrjMp+STSE0FjIsTM2ZQObEPNYi2MUsnZZZ9qG8Fx3sWSM?=
 =?us-ascii?Q?Nd12zg98uu3zr6Vn7YHpQ76CoYNi9DwROURSIlAHweR/3NzpwtBx7qJL7mL2?=
 =?us-ascii?Q?OExbxv2IWl7wSyBc2QUdcHdwMgYUwxiwKrSqfrdm8QugHwsIH/gclGUIwJFF?=
 =?us-ascii?Q?alzWimUN5gI0Je6w+UKgrwTjPvowkdNaJfzHAreFVP44gWlyIjtxUIGiCEw+?=
 =?us-ascii?Q?CWgUhsUYTHA2sAaUAfe9c6WK9ypaCD1++WUQGOKuClKmts0wkFSex0XLiUnR?=
 =?us-ascii?Q?OAVwoYXySbdIiYhsmEToH8KRLJLdlp2KBmP1gqyKaQVPV/8SNh2oCzI7N06/?=
 =?us-ascii?Q?vaW+hflFeBdaLxNA3KuO62ovKKQtHe1qsD/xI9F1VvJLDV8sz1HM5zffM5j1?=
 =?us-ascii?Q?lw3ryyjtL9ID/fUSV8WaGZurcgEYomFkAhajVx1LppFt7F5R6dL1LTAa5G5t?=
 =?us-ascii?Q?7hmOTwT3rg2Ryue7EnPvDjkFooR3eNWNwj+E8EVBItxFgYu47EttMpMkCkyx?=
 =?us-ascii?Q?FTfpFPYSfW8Rqk4L4IpyyOh640jRHlJF7OH7UhGTeEi10ZelFwFWW605yWkJ?=
 =?us-ascii?Q?7i4SFCce4Iv9PwwslnojDXMqVtuwQSRosiO0V4kP2TOWd0dyhG/w+cMHVTh3?=
 =?us-ascii?Q?edUVwbRfURbNPWZ+Ke2L8tRgGdPGprkj/1ErlAJEyLFChhVErMCMJ8NzJ+B+?=
 =?us-ascii?Q?T+SPpA4scmEt0FxKM+fxytYSICIDv6QQuyMfTNCJzgGUHmOe7h5XHt6Y9lR1?=
 =?us-ascii?Q?sLWFWH5cQkBbaWTtfZfok20ncjuZM7S0tf1s1Qvo00Qk1SjU+7V0ZUUwWwEn?=
 =?us-ascii?Q?XjKLzTUCWdYHL8uAFuddlt9TkIisg+fZqI3ptIFEdmJQpbwAP6i6hKTJTymJ?=
 =?us-ascii?Q?Se3xVBpmGkputJa9yJH12cIDXCJGQvD6dD+U2cjdw+t8d7T78YZoFlNAZuh4?=
 =?us-ascii?Q?EfgWfMz+Qd/PD52Qrn75fbOn7mxF9DYQIN82ykRxohmxcIupj1vAe277LYf1?=
 =?us-ascii?Q?MvxhkdihdzcNq+mWH4qdR72Ni/FlW545j5d/uWeZaPsX+NcycHZ7BtZaU6hS?=
 =?us-ascii?Q?e7gydhf0z13oaDvVXiJhdxD1tB+5E6519XdGDC1eFYwKNQ2yng22gASg6eDU?=
 =?us-ascii?Q?siCyQs5fLLVb0t3mejqTQqyQFlEuOFWTb3Jx74N3b501Sv1CjyJ5ioBfqES2?=
 =?us-ascii?Q?dqrs4p+ngAmQOS2tonbOyKOp0L4yhuMSqEn2zhy3FX7itr3BU1I/ejMiB+bg?=
 =?us-ascii?Q?210gAzoh8ZmJzEzRiULQ4u5BhSSf/w14Eo9i4nC5WKXyFxgYLxIcnSa/SugL?=
 =?us-ascii?Q?AKbXJayzLhnwM6SvaN56JWFflMEwDRGJw7iUecHNjPArgWke2/icL8AYpF18?=
 =?us-ascii?Q?7RnKQHFYJ89VvUkSn4SCdqJlTla3/Lj/Ha58ChiB4j4dvdIEa0ZH7+Pgm2Ci?=
 =?us-ascii?Q?Gg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	L9TrK9jPqX+E5qExa+iuzvrOuMtoToM2BvziO/GBQqxAIAq0pkbNVK8mA27AhL1NehWS+3I+C5XbVrvdIvrjr3AYsPOTLUuZw9YG+VDldlw+jY/J2Hir/FcFCcFMOsDsYosAn9Cb1IvX7s5Mjkz9AIfhNBrBt5Mn0F+i69t7cOkYKyOtKKz1iVOtwuda5xHeO6DI4UD9ZldA4+ArhFAfButy6Zi6OE2sKiiLgdjVCnt7Qsvti8b8FCCnxwuSl1G/oKOk5XR8puGQh+712cTECudqRUCw9K5yxjZ3fLW7sK5fNjvXSZdAULWGhEVR5WL6FzwgMAVNLjScErhEbxHSqBwT+EmtUPGCyFM4bCXowIhGFp+RAO4UyyWePyDk2tAIH/mkpk19BfE31TmINz3PeAEQr/LIwb1jALgO8kp1qgVOpqbXlIQdUSZLhspzscQojJRQG6f7pIF1bVws3UviXzQyqp6xjbO97AE0/GVuwtbFDtzazyZL+vJ3qyc6vExUxG8KE5zSDL4aY1PCeg2BEgoBOhGsX8CnKgMVknwNRnO4bBiXUhL34IiA1OabNKlXaNil/kjrNsUo8HliZytCr/Dpk3zfSbMnQ5ltWSSUWFo=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: b86f1c04-6ab6-4a05-32bc-08dd34c275d4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 14 Jan 2025 17:39:56.4242
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: oF2ukasL3JvxUjY8pu6bP02WVWRFIGM+QiDPrO2a3Jvqueq4ySvD4Ucuo5kAla6oqg75/5Cke5NbaKDYsk3zIYhiH+xZfxGlh4vI7CWcDkA=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB5733
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-14_06,2025-01-13_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 spamscore=0
 suspectscore=0 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501140135
X-Proofpoint-ORIG-GUID: 3iFJznXLvlpDckzPy_i6n5wmFZYnU4Pk
X-Proofpoint-GUID: 3iFJznXLvlpDckzPy_i6n5wmFZYnU4Pk

Tom Tromey <tom@tromey.com> writes:
>>>>>> Luis Machado via Gdb <gdb@sourceware.org> writes:
>
>>> To sum up, my specific questions are:
>>> 
>>> 1. What is the maximum protocol packet size, if any?
>
>> It is hardcoded by gdb, but the remote can also specify that, but...
>
>>> 2. Would this functionality be better implemented in a single "q
>>> linux.vmcoreinfo" packet, or as a "qXfer" packet?
>
>> ... we have packets like qXfer that can handle multi-part transfers. So the
>> packet size is not a critical concern anymore, and it is best to use this
>> newer mechanism, if the usage fits the packet structure.
>
> Agreed, qXfer is the way to go.

Thank you Tom & Luis for confirmation, qXfer seems appropriate. With
that approach the buffer size is not really a concern: we can simply use
the minimum of the requested read size, and the stub's buffer size. So
long as clients use multiple requests until the data is fully read.

While the "os" object also sounds like a good place to put this (e.g.
within a new annex), it seems like that contains XML-formatted data with
well-understood schema and semantics. The vmcoreinfo is free-form text
(generally of a "key=value" format), so it probably should be a separate
object.

So I think we would prefer to add an object type, e.g. named "vmcoreinfo".
(But please do speak up if this sounds like a mistake)

> If you're adding a new object type, a patch to the manual would be good.

I'll definitely include a patch for the manual in the plan for this.
Another patch I'd like to write is to allow GDB's server to expose this
object type when the target is an ELF core dump with a VMCOREINFO note.
We're hoping for this to useful for all debuggers, not just drgn.

Thanks again!
Stephen
