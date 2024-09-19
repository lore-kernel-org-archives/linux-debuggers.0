Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CC2119E989
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 13:23:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726752208; cv=fail; b=NALKqGmaSdTtrztQj0+LzfbQ5fc6shjx1vuDtAd8qltd3mTLb0Qz+CMVEdk2pvN+gkmat75GD24s2RA7dbkfi2v0ZTCuFMfHtO1DTi2eaL2tTtrMWRd39h18u9bEzUhbawsOSaVhxsi5hv6jIid/v70JUILt/2xHEkrxKO8lCGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726752208; c=relaxed/simple;
	bh=8aqyDJ+lmmRKlGArpgwADJoFW3AXuGDkzGmAkN7A76w=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=Oe2bEAtxxbF+CFteXBsRGzqxWokrpu2jg9zZusjKNN8QUOP+J74b+tUC70O+6E79EzsxUQ3aCaxe5FutwDU/Onn6CyAj4KEyqKpnWjPTL2Cgzp5l9PfWRwFjunFL/IjOCYdsvjR0NKG7wiHl6hKGg+EjGSgaXlh8OWqsWAuV2n8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=HyWej4R0; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=poGDxNgE; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="HyWej4R0";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="poGDxNgE"
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J7tYxm008078
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 13:23:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:in-reply-to:references:date:message-id
	:content-type:mime-version; s=corp-2023-11-20; bh=8aqyDJ+lmmRKlG
	ArpgwADJoFW3AXuGDkzGmAkN7A76w=; b=HyWej4R0Pe9LRXOx2EKawRE4Ytbdg7
	dW8iDPrWvwbwZoaQQu7w7P8T8Y4lM2mzp9f3cy10SxYwr9ESp1PyEbZG7QP7UvQP
	8eTnTNvhJcG5I3t9jvrgf/WtrqgCkowLXPTws3Q5/eYyl6xS23RgP3RZQZR1eVwJ
	zjmCWxAzNXclYUIw45QhK81BpZ7L6kA3QspzMRb/qfcKdaKNzQhZ+giFSRxCC/bV
	1AdtWjsOx5jsYWol6XkDJZbnhB/qltrEYTwGz0t6XrsNWA3pfFJFU29SFpm3aBm/
	6tqwnrBWV/hcO7BmP9K1KFel4ql8SA+IB22QfDV+Qtwf2ChmGTAfkVyg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sd475n-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 13:23:24 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JC0Cfl008122
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 13:23:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2049.outbound.protection.outlook.com [104.47.70.49])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyfetmgp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 13:23:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=qYMn2zm0gYFnki3Ytcf60BU/epYQrkxcClCdDWfDB3JJ+kecydQ01m54MRmGdGEXIdoCXokdX7dfm4vC2f2sU5lDUsI8uDu4hPqdIKi+EpkjonjAaLXVU2xy7Q84O7Lw42CyTYhUkxlpmzlmKZTSlK7MNHtmLPWT2eigpN99NXEjwfF36hzgEFgYnhT0RWle2eNIZ7MZqJMxGo2BhtoSq1xk+bwA88ss9u/oRA1QROcWv/rK9wqU7dcLjywfW+I4ZcWEizQ/Sanrx7WjNurVh/zfQb3PfX4We6cMzEGSR/Hprjl00toiA6wa86B9YJTc3zaO5gm0/6MIW9fLCZD/Sw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=8aqyDJ+lmmRKlGArpgwADJoFW3AXuGDkzGmAkN7A76w=;
 b=Wb8WtGKovwLZMewDtbZSMT2qFaEDWp3+PkDpkCVZ2QNhykd+VV8XP7FFEN5P5wn7B38AowUW+5sT8pB9RwkJSXl+uJSb6D3tmxjBJmMa/VkKkSAxpSmElEagwpdJM0s8xs2EbNvt7RW3EUfPtCTBCpmHj06qEiGO9wMTe1/yYUjZAzHmLhtVZ5Ebbo5yRVgBDDk/bKhidTgsocbJNwtvH558kEK0+TxSrayJ5XBhrG51ZrtDQm64Gdj/xpypYmy0ZQF6W+XiRPUrysjgZ6Qi9PlJjEeS/CtxRUDBHeglP0IKQY98g3/YjWeEFZ6BFbPpnXXFz+NBsMYw5yVlCObKvg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=8aqyDJ+lmmRKlGArpgwADJoFW3AXuGDkzGmAkN7A76w=;
 b=poGDxNgEEH0qghzwQPazOoLCfN07jnnEbFARFhVjHbH8TZH8DVPiT6O7RuzVnuL61ZFt945zrt+lHRk/IyicfvJVitKeVsg033ps05vDpUmRIcEeAQwkh4udZlrKTtx7x0eVdqkxEp0CMQhshp9sAJCWvYTq/Q2hZkg/i76BDeU=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CH0PR10MB5051.namprd10.prod.outlook.com (2603:10b6:610:c5::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.17; Thu, 19 Sep
 2024 13:23:21 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.8005.006; Thu, 19 Sep 2024
 13:23:21 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: linux-debuggers@vger.kernel.org
Subject: Re: LPC BoF - Linux Kernel Debugging & Drgn
In-Reply-To: <8734m7nl8x.fsf@oracle.com>
References: <8734m7nl8x.fsf@oracle.com>
Date: Thu, 19 Sep 2024 06:23:18 -0700
Message-ID: <87ploz3hh5.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: VI1PR0102CA0036.eurprd01.prod.exchangelabs.com
 (2603:10a6:802::49) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CH0PR10MB5051:EE_
X-MS-Office365-Filtering-Correlation-Id: 466b6c2e-6f06-4580-89ea-08dcd8ae3b57
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|376014|1800799024|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?Q1GoW0uqDI/Rp5KubMHZDGnskHe9+sJm5tNgoFT72HG0K+Gk9IM2mMYaN30R?=
 =?us-ascii?Q?sHF+WWzlFcWEvl37sc60haJvQCH059Hjw84XHbfNIWC71Rc4umLFCKPBAxRL?=
 =?us-ascii?Q?nr2m6pxG7WahMqhqasM74vYFRuj8P1UzAhu+dO9qYaDRY4fM/r2MlPB6tYhG?=
 =?us-ascii?Q?qVvrBY/dfpTgzZh0F1xW+Q2nA+CW9OCbRzx5sZrn9EMd2R9OWg6prBgPfqIJ?=
 =?us-ascii?Q?ZDDa7dEJyDPDIXyg6hrT5D6s3ijH1oUWw36Y0CSACartCMwD8c8/GhDugKPK?=
 =?us-ascii?Q?+PEmo3kdq3Fo5WnvYcLN6JuIOEYYX0x9Y9AIo7Lhv1PfFvOugGzBH4mlNVDP?=
 =?us-ascii?Q?biXRoWS26noKbA1FQ6eZIC4t0+kxusnbjccGIAyxUBRIe8BwKo8dLuuHaWK+?=
 =?us-ascii?Q?XrfavMiofwBrv9V/o9CcNwRYu+WGoDNY4pSXC04rfBTCW/sWwHUtsJX2g2Y3?=
 =?us-ascii?Q?wdb/qdHKDAYtZCJQrEOrKDm2dt2gNtZZI/tJH4AU79z0ZFig88LTuoJ30qNY?=
 =?us-ascii?Q?oifUp8UJOE9BJ60rkl4Laulj2F1aPON/GK0TToY9ucDzYki/Al5jyGBpUB/m?=
 =?us-ascii?Q?I7T2Gymz6uO8qtgOE3C/Dr/T10lyKR6wvSs2PAzOzGBJSwo8Rixymvpel9/P?=
 =?us-ascii?Q?BHHUVDQ+2pgTb1325k2zkLTweMkYfJ9Sx+kJjeVn7IzajDEhY88/0fVKM8wm?=
 =?us-ascii?Q?0GdPHZR50Szjz3+72sOoZ2l9Ngr+Mbksszn24OL2HvLwCZm8mLEi2j89QyW0?=
 =?us-ascii?Q?y9QqgipkD3qeunj48KFTcUk2ybykFMKDr0GkHYEfy/uQ+5lzo4m8tQ+rkeFw?=
 =?us-ascii?Q?kCrtKg3R0wDMj7F06P2Y6lSAQBlER1dcD3tiZXAgYsRkMTaJQSkLd0n+9VzD?=
 =?us-ascii?Q?0VsQ1+rBrf5oNG13Vc6EQrY+8KfRc4ZHnR4EKfBikORnKDgmEX85ZOkenSX/?=
 =?us-ascii?Q?BuuGlrsPN6uXPbvPGAORjICkwQJcMmzvh5voM8xdwtAU5kcLhAwyYLfLixDZ?=
 =?us-ascii?Q?9K4VHipOej0El1jSPa3QXzUEHK0Zu8vzVOa9VTiov1XvuRU/mnonQkxNRv/J?=
 =?us-ascii?Q?ZyOQKADJzmNaQGjYZ2NPkxjtfTuH+/iBsqkxoOffZWH7qhyo+EMGzO+SKYGv?=
 =?us-ascii?Q?cUT+4dpHMUP8LL5HvQHfQnhNdUP7e7eq0z2v0iyY6O2UxTer5i3Q5leNxLKG?=
 =?us-ascii?Q?4tmDFzRAMlzPVcXyyWGZxfL/KXfD1PjfTBHSnp9rMXNr/HKSM47gy7iz2zae?=
 =?us-ascii?Q?XGS6Jfk3fixv/2MUA4cAKZCquEo6SENaYPXylvyfgWIavghF5UFwffA7BUKj?=
 =?us-ascii?Q?too=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(376014)(1800799024)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?U8N5S3qBH9e2R+28j2YAwbRRfhoHPYzjObJQG+F5j6OsHCYLvhrfQfxe5B/K?=
 =?us-ascii?Q?qjHLiBHRa8S02neB5d9DbeEfwL1v+Daht3l/cQylLHyPTPRT6Os0Tz1Fel65?=
 =?us-ascii?Q?cQXG22ECUC/y+aF9Hs4aUlBNlxTH+YE082KADWsquVd38F/P8NkZbkkYybT9?=
 =?us-ascii?Q?B97yHDdin4ZC3NZ9Sy4DfHbR/KyLmBuA5Kj9ToMGzfC//9ysOFZCR5sgVdDR?=
 =?us-ascii?Q?nF8Sf1muVZSgQ9PIXoLJs1FWIotpr5ksvMp4Ziqwnq+jYUK5DWkHCBnQStpg?=
 =?us-ascii?Q?B2LtGm+ZwVSEVdsNwlUwbJYta7cYcWYAQkVBySlxvI8wUHEyNXi7GA9E2P9Q?=
 =?us-ascii?Q?j774UxKJqeSOr0gJ6SPHAv6u6O7VstUZiA4WWU34RlhZT/msfc0M0NQsTRF6?=
 =?us-ascii?Q?jmfmWOzrcBdzgfrlNsm8XroFDEI0iLNVCyqJkSRnYdmj2mp8AOEX89bh5U8t?=
 =?us-ascii?Q?w/GUpKadspX8KCQTrWw56ur8N5GiTzk3ybvEmecbtpaVjGC4jfv/3fn8fyR3?=
 =?us-ascii?Q?J9LDQblTSUXC0FnhLYCCh4d68h8zbh0bIuvumFBPIinkzhaex9hId1EULn2d?=
 =?us-ascii?Q?z1BvPqJGJJkGlu2sDxl1syQMQBkNOqm4PGmrieCKLrg6B8Pta5GOjAxPcGSX?=
 =?us-ascii?Q?cm1n4mdFxGgsSzNiJf6TsW/z4b/d3au2bldFH4wKc0CG/6GB3g+NhWFVqt/f?=
 =?us-ascii?Q?oJS6JvHF8Al4AX8zEiHt2RsGQWLKjfsi3FHutNwLza0kf0hyUpQtodbUi7Ui?=
 =?us-ascii?Q?SU0cN2ZP6962tvQ2yRfSpOYyOLoAngnAjuzFv8+OlRfEwqkuECzLg65wmTMp?=
 =?us-ascii?Q?Arcnqi9Uzz50iU1yQ3LjadUiOoTP8VuLXBnvhoPcfU4HNkya4LRB81tBgENF?=
 =?us-ascii?Q?B9hmgpJRF6yVt3WLN0lRx4oZR6WWSXN/u2POENvCVjzy8ggWKcEUgaPjrZie?=
 =?us-ascii?Q?/C3AZoXFkq+O4Hl2HZNPrPwPyFHZqEDEZUW0XjHyZ/BaDD1CnHBaFQ0Z6lWw?=
 =?us-ascii?Q?AqbX/rrDbPrP2tK49KpIX5Pmci1II6iQ4nI2/GNf1ppQIY8A3s13hTspY2RP?=
 =?us-ascii?Q?U9R7Z+cdTRjThogazLg+w7iyVpHjdI9/TSy73eY1ysMgJmVNGvCw5jaIy+06?=
 =?us-ascii?Q?xoGsVLeLUDScuNGWbBKAt/zoPOCCQYgQibrJ2aFANnDZhaq05h3SJkzjswQi?=
 =?us-ascii?Q?gkS9yyu/LOvUZ1UiffazeURdB3BVZuB9m47wUBkQP2UlaAcKxFVeah2D9+wP?=
 =?us-ascii?Q?vwHbTSrvtCaxErWgRuOWzfIA98DmPimAiW/8Rk2o2fakyCk1Vk8A9wC8BFec?=
 =?us-ascii?Q?hElZAwNwzTm2g/l9BX9nrED3miwMCHeMJBDU2q1+BQvlTRVha+hRudhnK+42?=
 =?us-ascii?Q?4r0EAEg5fa8AEfypvCBgjNmNYQlkOuHPbrJfP3az5BO6e/Gh392C/Ebzudyd?=
 =?us-ascii?Q?mV24ODgN5Lb8sTkhVonUqUTm3jUk4gEIEDpGZqDA+pHC+I9WkO8Mo768Rb3m?=
 =?us-ascii?Q?eleZNJqSsBqNlmqeoZ21lurUUzcNzc5oq5WOVJ4vZPtmgKpgKTYSG/ylq1d8?=
 =?us-ascii?Q?fqkZmrURmUVLvKUk6d/Tacye3xvHg4zfC+66YpI9nvodRvWQ55Q3gBd68gRk?=
 =?us-ascii?Q?5w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	1BY9WFWAXcGrCzKW14CuXXJvnE7eXncsc3bF1/niFGcwenL4EHInuRs+OX8b59sYQ3YtGrvFijdpui7HNTJ0pQx5th3dKtWGa9XHg/SRA1iK4uVqMgIYWJz4g4J2MJiXEwboqShxO0H1062GnrNcN/t7UIsFH7Uju8Go/XTDnAec7n5mUzSPcTqo2AJoso8ahEoNamR9PULftvMia9RwB/E2S24L9dszfcNoUkWWC1CxjlglPUhzlP60ca3GMtMNiF2XfxAXgwWb4r66Axs48IwEW1hwH43V9Q4xyRJTp+jn4EZxREF46cfaU5wYGBbrKmFvzTAd+C24KgBe7FX2/mjNrRGGRnX2pHvveRrjF5Wfsg+aXANl5JRiaMTZEajczHBAIzUUSmsgxP5UZSphzGXtSBuEgbY+6SmDklnEmXWwkQN4Ur+I48+j6K8NrLQTVty1dttxUysDA4IrFKqrm3nUhYxgWKSKI/bYGXHXUGgAo7rPKpv3DW8FcjBTXgMxuffe1+f9gxcmZcj5NRY3XFlK3G9kXy9haZgHt4x2arM0BCKFExRvxzCncn8uyBkziLmthovAvbvcf234AF3CDb+ICVVUDhhLccfPSJxZb/A=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 466b6c2e-6f06-4580-89ea-08dcd8ae3b57
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 13:23:21.2969
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: Hqf4TdkT0wIsB1zM/oLH5i1eHpjcpWdbW7LX3C9lirtx6f3SyXQL78S/gC8hS59etVbPq5L89JSnUf+vg/7Vw7xqrfYmSAKiuvtCOngASb0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH0PR10MB5051
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_09,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 mlxlogscore=999
 malwarescore=0 suspectscore=0 mlxscore=0 phishscore=0 bulkscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409190087
X-Proofpoint-ORIG-GUID: d1PP-veDWnH-am7FP4gscs_SuIGFramt
X-Proofpoint-GUID: d1PP-veDWnH-am7FP4gscs_SuIGFramt

Hello all,

This will be happening in 20 minutes. Remote users can login at
https://meet.lpc.events, select the "Birds of a Feather" room, and join.
You can also join the matrix room for the BOF room here:
https://matrix.to/#/#bofs:lpc.events

Thanks,
Stephen

Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> Hello everyone!
>
> For those attending Plumbers in-person or virtually, we will be having a
> BoF session where we can get together and discuss debuggers. I'll have
> some interactive demos which should be easy enough in case folks want a
> quick and easy way to get started playing with Drgn, but really it's
> just going to be an attendee-driven discussion. So please show up, bring
> questions, ideas, or things to share of your own!
>
> The BoF is scheduled for 3:45PM CET on Thursday (Sept 19), which is:
>
> 9:45 AM US Eastern
> 6:45 AM US Pacific
>
> This has the nice benefit of avoiding the Toolchain track (Wed) and the
> Perf/Tracing MC (Fri), but it does intersect with some of the BPF MC,
> somewhat unavoidably.
>
> But these times could be subject to change, please check the below
> listing on the LPC schedule in case of any changes.
>
> https://lpc.events/event/18/contributions/1982/
>
> Looking forward to seeing everyone in Vienna or online!
>
> Thanks,
> Stephen
