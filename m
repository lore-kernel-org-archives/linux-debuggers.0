Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD7A61A28D
	for <linux-debuggers@vger.kernel.org>; Thu, 23 Jan 2025 01:12:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737594742; cv=fail; b=UoL+BYl/ehYi51Yf6HaSmNDuvYoyvkJ7YQ+R+j2Saw/Q7TEhJ8xm/U2rRyyPcHr0KqCgzBvRYEtFu16owDST3eIVuRZr6X94E1BhJEeWE8sMxmasuMSFn1nItyV1/UzRAhC1jkGiGmLircJfWFFIG+4tO/KScWU4uLmuyWlzsU0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737594742; c=relaxed/simple;
	bh=mXb/ACR5CWCiUJTF3ZLP15wgGTlJOazQu9nX7Dm52o4=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=XaQQtEVPApEa85kNGebWz0jPWQOOZwpziAaeXu6q2TWQGTpDO6L2JPKv8BmMy6peUjlqC72eR+yhaCrq9MKITQQ/2IttwlZlFHpu4lVyvJw+ewVw977gssViZnc4WX8d10WLf4dpRyfsSe2vhCfV7PChYE/8bqgncm9zaDHWLZI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=QQy9FagX; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=Vj/faNmX; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="QQy9FagX";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Vj/faNmX"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50N0gWuq029577;
	Thu, 23 Jan 2025 01:11:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2023-11-20; bh=gObZmB1N327WvTSrY+
	aBKsjDJ66xskp+Oc1+L0Qz32A=; b=QQy9FagXh+umlERgQUhbYmxA7n9efhI7Yj
	OGb4jNof9ADlCeP3qaGAlht/Nb//I2OQ4xgDemZWP/LhlvwEbhMBHSJc6WDAM3Jv
	7fFu9jnPfY9Qstc0/rIn1p56YUsPawkqXC6+3IyH6ILP6rRoTYtIiLJJXMJRtLx4
	LLwST0ZhnZ5SEkkaHYI3COzGGASQNZJrVQHfaPdzWUcUuiUqQ7iJ4fID2GoWpne2
	niU7PFB/mGPKaDckHXjb3CQzm7QFphyHuoFeOsA9mBQURMF+SAUKQkauvmuWhb1O
	vxz8MTKZH348qbhzj8VE2MC4AIfxZkxx6DqKMJeuT8WknZj39IvA==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44awufss9f-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 01:11:52 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50MNaesb005423;
	Thu, 23 Jan 2025 01:11:52 GMT
Received: from nam04-dm6-obe.outbound.protection.outlook.com (mail-dm6nam04lp2049.outbound.protection.outlook.com [104.47.73.49])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 449196c0e6-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 01:11:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=U6w9dIGi41z5d1BMOBjLkXlDBYVVZxMjU1yviItQKz0VN/PT/DQBn9FAjutO82rkNJjBPztixXDP3xQA+sxxpo7nh2WGNrOOJdN5bYjHrvZmUz8e+mmdY5/gu8pWDuoTJu+j8oP9HPv/+5BXhDJtsAj3KDiiJqPcWr85YZsjkvQm4asnb3eeocJprOyfN/6wZALQ16Mk8TYInfCLppIJHO77lqwqeD8XmsDNbziBs48REou6rPK4mpUa9+BvK6jArTnjjNkEd+9VETQOJAfmJPRXa2Uvn0hTbK/XizEW4EvZpD0O6LyUD4nEgMIq7/Yclewr30LFl6Qq73O8pH4++g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gObZmB1N327WvTSrY+aBKsjDJ66xskp+Oc1+L0Qz32A=;
 b=e3MCX4711XiFHIGxTiZ7m8fRaFRPNv113ATd8ZwQKD/zQ2b3CrpCsTJbNrOZgAT4Y3DK1JUAglVh6X5BMOodHbYrdiVwrG9lQ5+JM7k23ExCKB+m0Uc1Oj7UOujAeReFWT8UOp1zqDd2AQCljO1Y+A1cp848BnLPPCJZSuXDr4AVNynWtWxBnItsClwuscicMpR4m9FpuNpIrqE8sGLXQo9ppRJ0Ekm8jd4PKyWCCrw1D3EC3YiNck/z5yURfRgs9NRO3IvB+IUNXsoHZfW2WStQsGOUQRX094WgHZM9wv6PgjJMtaAZevjXAjL+hiJIJUcYhWstRbD/LFZ8TPbyKg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gObZmB1N327WvTSrY+aBKsjDJ66xskp+Oc1+L0Qz32A=;
 b=Vj/faNmXR7c+/YLTMfLyKEqxC2YlSFO+PH38JOb53NKhFi4OFS1ttvIdOz7uVBggp2COeXdypTJ8su1VcOUUvSx974rqHQc6CiIC53EvtvMqXlR8mrwysdbWCXr5JueXceuUA5l4LNcEN8D1bYEThK4G7N9ZGEPv+N5twDK9SqA=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by IA1PR10MB6217.namprd10.prod.outlook.com (2603:10b6:208:3a6::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8356.20; Thu, 23 Jan
 2025 01:11:50 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8377.009; Thu, 23 Jan 2025
 01:11:50 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Andrew Burgess <aburgess@redhat.com>, Tom Tromey <tom@tromey.com>,
        Luis
 Machado via Gdb <gdb@sourceware.org>
Cc: Luis Machado <luis.machado@arm.com>, linux-debuggers@vger.kernel.org,
        Omar Sandoval <osandov@osandov.com>, Amal Raj T <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <87cygnoxi2.fsf@redhat.com>
References: <8734hmtfbr.fsf@oracle.com>
 <5e1c692b-b103-4c47-8cc3-d8ce487d98e1@arm.com> <87plkpqpuj.fsf@tromey.com>
 <87y0zds39y.fsf@oracle.com> <87cygnoxi2.fsf@redhat.com>
Date: Wed, 22 Jan 2025 17:11:48 -0800
Message-ID: <87a5bil4ff.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0217.namprd03.prod.outlook.com
 (2603:10b6:a03:39f::12) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|IA1PR10MB6217:EE_
X-MS-Office365-Filtering-Correlation-Id: 2ad18d9f-4f2e-4e9b-c269-08dd3b4aea0b
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?SdSCuevPmq1XzWBYkF7pYpHA/1IlY71pCrgZNPl6naWWg1GtOm+esuc3uwHM?=
 =?us-ascii?Q?GZLCDLzI5um6KOXx/t/MoSaRpNfSpJ/i7/ITKXcE6ReqnJkauQCf3+7b49sQ?=
 =?us-ascii?Q?yKSdaEtMpXem19FigE4gzmIvY/kMufvK82hfLcM6r4LpGcg4F/ieRrNMLmHV?=
 =?us-ascii?Q?fP1qZiFAqWgSU5vGBBcJkp7M5k1+ylF7imPUoDFlFfk21R8iPo4gtu25ZA5l?=
 =?us-ascii?Q?G6rrDfDz3LCzimojoLdrszTZ44Dk3sM2yFTyQqwuJJ8aDpzf20xu8czRZ3eo?=
 =?us-ascii?Q?F51acoZ8r52SzvKadV6uT3O+LbYjtYZTJ7TGaZKp2ZnD1ujlRfjeY507OVvn?=
 =?us-ascii?Q?ZXOAMYwU2rzb69prO+4avVV2aKO6LRKZy2XOZaGJjJNSPvgGNTVy39px94Vp?=
 =?us-ascii?Q?rtGYoWkSvHlNXPpeUV7uX19p3uyTMwFlGSHwsnu2T5wb8tK7FuxQpWybhloY?=
 =?us-ascii?Q?N1poMn/+3L9dKU1nnh5Hk3sl+mgw8i/sYaryhZTguXlQ3ZMf61G5SL0qnGEv?=
 =?us-ascii?Q?6iZP8IXI0wR1B9+W1PTskzXTtb9PRd6dH3+b+1gV+oNrI7UyrvfT2PpXzprb?=
 =?us-ascii?Q?edy9gZecyuxTg3G12m5pkB1S8FTaqyWd2v/h4w9QU18I8Suj4KZ/TimOZWPY?=
 =?us-ascii?Q?LdkkPFZmDbepPn9xm/pJJGSXldNryncRHCFw3H6/fPABtZLie63ScruUvs5Y?=
 =?us-ascii?Q?cDQsBbyaaFn0w2slnI5w2/ojKYTZ/borDKdL8VhBM5rH3D2luyvamz0TL85g?=
 =?us-ascii?Q?AoDs1RoQJy68nNnuBn+nQd4rBfQuMA6cozYQd52S5ZGXbpDt9DTVNdlBkz1i?=
 =?us-ascii?Q?6amITiCbb26RcGg9pe95u6rNQP6aDUYbBfM5fI+TeInGHBlLx3ru3qHzJxKg?=
 =?us-ascii?Q?U1bSeqJ7k01brh5EjjkhHpEIfnZ6QWtStPpbx1Vqx0zgoc7FQpqgAxWV9wM7?=
 =?us-ascii?Q?haQ9x5430DQppSdzUA2ISnTxklPR7dPGXLDUIdlBeEAP8bNbHWjjCz/w3rjJ?=
 =?us-ascii?Q?6pBFNVscfdofbETV/8AZU+9jWL+36Hh6miwwGtgKVx8Ik/d6f8dQOxpbbb1z?=
 =?us-ascii?Q?cfKT5j65bC56Jo179Hg4kETpWxkGIDyH9TvWHJql5vwepBvKjnBdEyCZ6Kv+?=
 =?us-ascii?Q?ipf06zJ5XQpnEZr6hZ6jvMaVZIhZgCbW4iLqUYG6B43RlZB8+112JdJd2v3I?=
 =?us-ascii?Q?RzZD9C6t59h74DtA7+3fprd7LA3UblZf1OPwvcRSGY3NyxswUV+eeFdT5Vdn?=
 =?us-ascii?Q?yAlVk3Oy91ccAiXmNRmdAlp3lcnHxzXNIaQ3HtHHzuCBuZ9dqLkUqAAyxnmX?=
 =?us-ascii?Q?BbCWVrECdxVMATfUfZp+MCta+bzfe0gPTjNhVRi8/roWPw=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?r+BYhfLJrvzzWXce4o+t9Q8RxfwjM7jSG+WRfE7WL/97Emb2A2FUjPNoFzKW?=
 =?us-ascii?Q?iUhd6LWgCjSebANkjT/GlJXjQlNGj+xsF25geYgw59ZS3heiwL4Fd6Y7vgc6?=
 =?us-ascii?Q?8agiBnBF27DQN69VA1x61kgkRKcJvtznT9ZNQRk0ddrUxlc9O8TeNXPAYBv0?=
 =?us-ascii?Q?jn3vuendpCoxgYQUN9RJGYe6IU/n+WKCd+onj40CEHBkKUUtXSD5Gz8p2Cdw?=
 =?us-ascii?Q?rE/PeAWX/DcRMhrVf/O2UtQheIIU8mu13I7HbbTpNodgERCxk5Q2RsUHB+ks?=
 =?us-ascii?Q?p+xKtVnTJNg060ca8fBDFPBTLDsJ0crECcMIvunnlliNUlWcQNCfROvk9Dj2?=
 =?us-ascii?Q?8COszqwbXb1kQx1lAAWRqTsw+BYH2xGRMkD5+VS4OyVES6JUFH/Qs3cgY7LU?=
 =?us-ascii?Q?eKlZ3CZ8ztpdY/JfMMv1a/0DchVwU3/p3XmSQG9UEPgFne6nGazbwrrqOy91?=
 =?us-ascii?Q?JNERshkqSGZBDYjMS34yC3A9MJhxajy+7R6lIKTnhMHejAwyKxXj3o3i2wL7?=
 =?us-ascii?Q?I0X7NvFU5/7odbWvVrsTdcFDUsU9dRdw/8epNHARH3qrwhS0JPvTYgMIK8M8?=
 =?us-ascii?Q?0V0WjHxlQO1PPMmakdQ+jkEXnBNa+p/4SB8HIqCWME4pG59BbSGjcceKVhgl?=
 =?us-ascii?Q?u/+R1faNzBEMHQ9tM//W2mvdk/jR/dGjy+9gJagfJ+1peaaKM/B7UWY2jp0l?=
 =?us-ascii?Q?QzsL0taTmr2AEzbIyZT8YkDeyViDEilBZ6N3Uu6ypAy/MPu2by/sNn94Gm2h?=
 =?us-ascii?Q?9pnPXGy+/YhrhWM9LctzzWHUowiI0c+OR3KDzaL5Jthecp+KbjuQX+BmEmkH?=
 =?us-ascii?Q?Ez57XPSRTyjIGKYYPhVZPBR/3oDPCLJD1YV+MB23VGnTmiMIg3jhIbXldLLO?=
 =?us-ascii?Q?2li2d/AWMpFUxcDYsQFx89uzzWQW/3RmBR/J7bqQLogRcvOdNicrZ8P4tn7p?=
 =?us-ascii?Q?qAiPqBvNHWz3jDoSj0Bfh4tbcMJ8k1TEyweynOFux6d+ESLnVi2/4f9W4zPZ?=
 =?us-ascii?Q?VFaB7K1JxUD/LDwIbrD+BUz90no/2Cj5U17/HVe0JEH9qEJfrQCn0F7IiNBP?=
 =?us-ascii?Q?Aft0szVOCIdfuZVa6cAR3lol5/qzvV4JuXe9CcL+iXUEqHP9hLzupsBR91L5?=
 =?us-ascii?Q?GDVmqiBuHXQEcp0JOYkQySCQeKr7OP2fOJ7tCxBFSXtZxIcSUOHr3trMdHA1?=
 =?us-ascii?Q?1pb92NR0kz7zjTwQpkH0W/0vZ5Y1/J9XGdInZwwphkysXlMCGPu/jg7BclZm?=
 =?us-ascii?Q?D+iW2KHvvepqHDFjtF2uovrblpGmvGhbkYdLosKNDmQXLXJkjSyqAVPYvJnA?=
 =?us-ascii?Q?LTlskZ/M6ZzuAKkIUdKG6lxXk/Q0KmJx6TOOrm3fcJIxWJdMspUagF989U5Q?=
 =?us-ascii?Q?Q7VeHcf/FT9jom9kFRh22e0MUXXOX5QiBLxDPKq+arw+9I096Zz/7G64kNhK?=
 =?us-ascii?Q?hbd2olyIQGv1i79vnWEei1JIUSJ3bPXv3htxR36/aToh1qY+nwK1d/N0b+6Z?=
 =?us-ascii?Q?XzK5hAW5GmeNKl7x3QRHPIc0rzY3VedQURw4swK8AFkjouzV7KqK3ZyaaW1H?=
 =?us-ascii?Q?iG/H7yEOOFclk64WMlWDsvxTDQSaUV0AccAgdouLa9rpA09ZT4el1p910fpR?=
 =?us-ascii?Q?pg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	AcalsD2PZRU6nlrAVLdyBBL7NZyoLMPbDLQ6sO4IqNhZFU/TBO/cnBiK/+nr2B9jd3hc5GrbHxKNjWj0JPy/neqXwRb4o3A0ziAdICwBXcxoihP4LD0l34sOmkiuliybcvkjET7fnrFlX1oeFumr/p6T1tuJhjgmXeFjlHoEFyHCRADbH4Vr+Yvgc6t1zCU1f10fqRqaSayidg/rdNohLEY81lYHtOVkgbPE+ir4H6OAQ8qCVzjr2L9qCPZBEU+cvpEAVR0whJnn4smWdWeiRDxWg7suP1Obtp0luCOfrVlZXx7rB14TKq2U6c5vixdx7HgAyZ8HevNqliussgKBizuv4PEjUrhlHcfwabhQTK/mnKKgMdwUrk0Mu7WH+spKBe0I+hDbJK7/jwGTSFUxiGvnxB/sXQ2CDJ8fsrSKUbvGdk9PqNzcFbJ0a80Jg/Tb+++xSOHDMrTT/2kG593AAB4Vd5/2wFFh3bf81feKqidEi7ZwPiYJvEHatgttgjz/SoldAYSNDwlSlNcksQZkqw1vUT/jP4Y6g6H6XAsOqAwWryBRc5HMlwrSHOE86pkUFTDtavR/S8vPbiCjbpQ/ky4VJ7G2lHb+i1HeNBkcQyk=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 2ad18d9f-4f2e-4e9b-c269-08dd3b4aea0b
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2025 01:11:50.0129
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZDlrCEFHjKVBhnMyhyr2MMBdwf43W3hBny6Xmi9QCMLX80xb7hjy3aynbDjvzVIMyDNsnYCZ0zFf+Ev32P1CMY8EXLdRr6eRCiEItSWghdE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6217
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-22_11,2025-01-22_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 phishscore=0 bulkscore=0
 suspectscore=0 mlxscore=0 mlxlogscore=999 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2411120000
 definitions=main-2501230007
X-Proofpoint-ORIG-GUID: b7BLui5tlcLh5FBWfjpELaX9AmK6a4VS
X-Proofpoint-GUID: b7BLui5tlcLh5FBWfjpELaX9AmK6a4VS

Andrew Burgess <aburgess@redhat.com> writes:
> I have included below a very simple example that implements 'info stuff'
> which just displays the 'threads' information from a remote target.
> Place the code into 'cmd.py', then from GDB 'source cmd.py', after which
> you can 'info stuff' and 'help info stuff'.

Hi Andrew (and others)

Thank you for your initial script for the qXfer command. I've started
implementation with QEMU and I used it to great effect to help me debug
and test that. I'll soon be submitting it to the QEMU mailing list (once
I address those 32-bit and other-endian concerns).

I went ahead and updated your script a bit, mostly to my own tastes. The
only major change I made was that the arguments to the qXfer command
need to be in HEX, not decimal.

https://gist.github.com/brenns10/c936c8e7ef8193e668884ed70070ccfb

In any case, at this point, I would like to submit a patch to GDB to
update the manual to include this new qXfer command, since I've at least
got a client & a stub both speaking the same language on it. So I know
it's a feasible design.

I surmise that I need to update the (very large) gdb/doc/gdb.texinfo
file. But when I run commands like "make doc/gdb.dvi" to build the
resulting output, I get errors related to a missing file "gdb-cfg.texi"
(see below). I confirmed this not just on Oracle Linux but also on Arch
Linux. I'm happy to try out another distro via a container too. I have
texinfo, makeinfo, etc. istalled, so it's a bit confusing.

Does anybody have any advice for building the docs?

Thanks,
Stephen

Error below:
$ make doc/gdb.dvi
texi2dvi  doc/gdb.texinfo
This is pdfTeX, Version 3.14159265-2.6-1.40.21 (TeX Live 2020) (preloaded format=etex)
 restricted \write18 enabled.
entering extended mode

(./doc/gdb.texinfo (/usr/share/texlive/texmf-dist/tex/texinfo/texinfo.tex
Loading texinfo [version 2019-09-20.22]: pdf, fonts, markup, glyphs,
page headings, tables, conditionals, indexing, sectioning, toc, environments,
defuns, macros, cross references, insertions,
(/usr/share/texlive/texmf-dist/tex/generic/epsf/epsf.tex
This is `epsf.tex' v2.7.4 <14 February 2011>
) localization, formatting, and turning on texinfo input format.)
./doc/gdb.texinfo:10: I can't find file `gdb-cfg.texi'.
@temp ->@input gdb-cfg.texi 
                            
@includezzz ...and @input #1 }@expandafter }@temp 
                                                  @popthisfilestack 
l.10 @include gdb-cfg.texi
                          
(Press Enter to retry, or Control-D to exit)
Please type another input file name
./doc/gdb.texinfo:10: Emergency stop.
@temp ->@input gdb-cfg.texi 
                            
@includezzz ...and @input #1 }@expandafter }@temp 
                                                  @popthisfilestack 
l.10 @include gdb-cfg.texi
                          
No pages of output.
Transcript written on gdb.log.
/usr/bin/texi2dvi: etex exited with bad status, quitting.
make: *** [<builtin>: doc/gdb.dvi] Error 1

