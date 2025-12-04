Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3CC52F0C7F
	for <linux-debuggers@vger.kernel.org>; Thu,  4 Dec 2025 20:07:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878832; cv=fail; b=VJ4wH4A6bPC6O7S2OxBHubI8+zfd8KwF6Idtg7yY8Hkbmz5vaGLOUiMBY14HkPQXw+JC7ktgufnIoUx90Tcu6W8g+d/9mW3k0T5DrdTiJ0SCqVFiDp5C4vD1RZfCQo1I7UmFcPd9UcHyztXaCBKmpnWsDDdbGe04ePjZrQxIg0w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878832; c=relaxed/simple;
	bh=ZPG/L3Zcbz7fDS3DAVGATZDq3S5cvz7YmTH4B+o/ogI=;
	h=From:To:CC:Subject:Date:Message-ID:Content-Type:MIME-Version; b=pieREJrJ1HuyUht9etpKWCH01je+iwwoO5CPRjzNOn2OJxDDmXkgnVrQc/6lZNx3XGdUnmRCluvuc35DHtlvxLF1T0VNxoZsXJrqIVoOA9BEs/e9SQOYd0Jj7OLDHdc5wBKCHNICkpcsl9fqbG3kLs7MU9K9DOwY3rdPWw/Pg0U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Dt1uq7LQ; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=qG/9+Xas; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Dt1uq7LQ";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="qG/9+Xas"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5B4JELPK1693975;
	Thu, 4 Dec 2025 20:07:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:message-id:mime-version:subject:to; s=
	corp-2025-04-25; bh=ZPG/L3Zcbz7fDS3DAVGATZDq3S5cvz7YmTH4B+o/ogI=; b=
	Dt1uq7LQAxfpLxjtgWrjABqJz3TkCsM/2eFPqbGytnnFUut5KjtWUUNy6fAFO0Dg
	tjM91TFnrBOzP8Yh84nynwccLm1DDWBvzH0kEUNI2Pwl3JCZblPF6QbiamfuLDNz
	MLGS03UI43PlgVTGdsJqqcqv8NCV2lV5rIPy5SU6akcRw4etIH2jeyCk3o06D484
	5boiqtz3LSmfrEgwcWvzZAJARFIi8ZFn/rITpv8vTOudaRVbZLB2G9thV/858kVS
	r6hX5Se817ZTuO/9E7q106UdkynqePshIqWYze800aYSEppBm6c7gAyTGSB252bN
	ka9ybTrQdjqzOGaOjDv58A==
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4as8460rrp-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Dec 2025 20:07:01 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 5B4IwZoN016901;
	Thu, 4 Dec 2025 20:07:00 GMT
Received: from mw6pr02cu001.outbound.protection.outlook.com (mail-westus2azon11012016.outbound.protection.outlook.com [52.101.48.16])
	by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4aqq9ccf82-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 04 Dec 2025 20:07:00 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=hg8UIKwKdwZRw0Mda56AIzEeTbrDQn9O0ALXm6FucluR31PLtupJt6JTXoBp8wb5rf1jlQtXDLEh5aPuHry789voC40uAYKzPWFGAgIXwG8cW92jYJX/uRfY8OVbfZJrrvvvudVc5NqrSEynDauT5MLUxATRW0h+frdXy19Kcv6yTaNsYCQGufF6CWe89T9W5xKiBiGzIaWSHsQZv+Z7VwmUqALCxTysn7lNRv9Uu7nvtpy5rsv1Rw6VnXQwqtoo3SEixQgbAy6EH6qo3V0eh+L6Haz5IpFsd/u8AF6Su9qYDKhtgHYFmkFWJdvRqFjw58+bz4Exuh1sOIyigxRxjA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=ZPG/L3Zcbz7fDS3DAVGATZDq3S5cvz7YmTH4B+o/ogI=;
 b=putODEF5WNkR8Aj5s3rPmgJPQtburFkQB4MQTD4F7V/waWeXGh0uVgdhyerKpLDohSoHkkM7knYIKrgi6LNw1IpImyvOZKKC1kxSzPZnrx+4bUJ0MPFi2b/sjixkmn559vrQ8u0XqZLQZr9TIgaON+MN8gfVOI6d0XE7Jn1fGQEQfkuWnCc76cZZ7EGUIwJVMN4yEQXlmpRtzvI/pqZGuw+IOGtaqPptk8/ddmf1QdUjwhuW/IQUmqL8MSGekxn31eVnLHvfO6uYXmFQMVnywgY/3cbD/UpYxnWMqEaWZ+zUQnhjR65Z4QV0WbPvIk45JjNwRr09b4UcMB3KvDp2Gw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=ZPG/L3Zcbz7fDS3DAVGATZDq3S5cvz7YmTH4B+o/ogI=;
 b=qG/9+Xasos3Aa8i8gSLbDiQ0w1GotHfwRRHQmJQZMh31C77uFsqLv91jpJJmd+ueiHooduMBTAGUGMfAUSQMA7Lkp9b2IQCWFK+lKN0vqrv0Q8lNbihazs/YcSw5ELnoPs1B8wkQ5fi8Ul/LrH4SbGjgPZtdN3az+p8HTDu6WYY=
Received: from PH3PPF654CF2C22.namprd10.prod.outlook.com
 (2603:10b6:518:1::7a9) by SN7PR10MB7046.namprd10.prod.outlook.com
 (2603:10b6:806:346::13) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9366.17; Thu, 4 Dec
 2025 20:06:57 +0000
Received: from PH3PPF654CF2C22.namprd10.prod.outlook.com
 ([fe80::a94c:94e4:9c1d:d98d]) by PH3PPF654CF2C22.namprd10.prod.outlook.com
 ([fe80::a94c:94e4:9c1d:d98d%7]) with mapi id 15.20.9388.003; Thu, 4 Dec 2025
 20:06:57 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Philipp Rudo <prudo@redhat.com>
CC: Omar Sandoval <osandov@osandov.com>, <linux-debuggers@vger.kernel.org>
Subject: Unknown ORC entry type 5 on RHEL 9 kernel
Date: Thu, 04 Dec 2025 12:06:54 -0800
Message-ID: <87h5u6j9k1.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: PH8P221CA0048.NAMP221.PROD.OUTLOOK.COM
 (2603:10b6:510:346::29) To PH3PPF654CF2C22.namprd10.prod.outlook.com
 (2603:10b6:518:1::7a9)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH3PPF654CF2C22:EE_|SN7PR10MB7046:EE_
X-MS-Office365-Filtering-Correlation-Id: a4a3495a-87c6-4a17-1ee7-08de3370ad2f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?5ZnUOCWDPuaAmCCoQIQ8cQT3dSKpfAvFwbYgMC0DObqnTjvlgdHB4xwfCS/u?=
 =?us-ascii?Q?2zZIFyplqJ2laime6iFbF+2CBDBwqoCVqxmYUmzfZdSbUfXmWSL2iPRljnGl?=
 =?us-ascii?Q?C6W6Lehhu1YMm8vuoWpoLDWdQ9tuulemkCiJDR/BDK5TSKdrasLQmjW2Nzx0?=
 =?us-ascii?Q?gB+FCqRJYwZDNg4UNgWYk9AXFbCM4MVFzOa+eDaLxyx54MP8p2gaG1rY6LaL?=
 =?us-ascii?Q?F9Fg4/GcsB4BQZ7VkgyX/RLRVj1QOdD/IKVZ7EU99lpMY2DXGx5NiT2v1oaH?=
 =?us-ascii?Q?GjLz6+Neu3InhtgeTUY4Xxw0O3bALhU8I4HPlq6mTSmOrwPJbZuZ6m3/Nr6B?=
 =?us-ascii?Q?AlR39geFSY7vGou4oljs5Q4I911FSJZn9h3WR+jgWgVB9NAMjmEMgeDirl8R?=
 =?us-ascii?Q?DK6NxDVwwduoEymBSPyJYVjtok97CBYG9+BzPIS6wob/2YEFeVLdt+28nCt+?=
 =?us-ascii?Q?HSm0vBxbksRmhY7cYgXXRawsytWMeZorPHXFaOkQADYUrrtvyUhOQLKNCfLd?=
 =?us-ascii?Q?zdpFTQ9bcA1vT7dfoAIgSAg6Gua+YTw9Gufj9Fi/g5qDDxs3Mov72/ISs8xt?=
 =?us-ascii?Q?L42cnp0IUhNH7X3O7RMHCTg97jpAU3nAxwbEWf5rJmiLvrLofGq81URhyLJL?=
 =?us-ascii?Q?U2UKjNvarskwBhhy1mBgBkD+rc6wZ4n3ioOgUfu1gMpNQF55oaXVzrX34q7p?=
 =?us-ascii?Q?OaEPIw+nqqJBMV7s0Pd7P2YgC1QVht65oCPIU+Njvm2oU8Q6Z/lvrrjWQGMY?=
 =?us-ascii?Q?3EKvPi2AYWGvVHqJ36RmyiYbZeatcCOk/+flpvl1+XnLlSzKbgkVERl9OylS?=
 =?us-ascii?Q?v0RCsqAymg6yBqJ1PgmvUntvbMj4CFPMVSvD4LRTJ1V064xrFMi8pOwAvd53?=
 =?us-ascii?Q?BMuj+bmm5N/bKofY0+DOWgp/Al/+znK6jtAffDh4lUNcDxKsMAjSWbRMOgp6?=
 =?us-ascii?Q?6g8SVQDeHwnnu4k5Q6EQMIKG9Po0jcXzJgEIZYkwnMnnhuvrpDYWppJytinr?=
 =?us-ascii?Q?aYGOkg5uzHjEH4147rL1jZAZvN8SSV3DU7UBgpv3UXwfXIJk6xqnE5L3+Tw8?=
 =?us-ascii?Q?mGpLfOAmZyu0SgXQT8Um0uwo4joDcVOQw7p4XeW/FP3G8MQQHqlpfNNZtRfT?=
 =?us-ascii?Q?E66+uuqvTk7OvAP3sZmHj9VRAAGnJFOc3mN9G5DghBokLcJXD66K/Li+8E9K?=
 =?us-ascii?Q?6hlIWRcFTqXPi81wSQu0wB1N4TBY627n0yOjR9zArHb7cWU8OT8FDU89aQo2?=
 =?us-ascii?Q?E7dFzm2b4/9wNB5QVAAL5eSxVwkw6rKKlVE0SKsdkkIvRiU8KqOdLnS/U4Vg?=
 =?us-ascii?Q?+AMSim9GRR+qqXxbv9U+79yrOFpHT50dSm3MKODC19pF0Wrqm0pZw/IQHaOF?=
 =?us-ascii?Q?CMX/Vl37aUotq5l5hNnylwjYVrwtTqfTxzs+GA9/1EkyqhQp1EnohEoiMayu?=
 =?us-ascii?Q?qsxxvbtAX2kpZxsVIdktOTS2JYoClVUkQFY1ezO/jIt1dYvVfYsFrA=3D=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH3PPF654CF2C22.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?IaKYYN4J7CI5Is/njhPHg5y7QQFRvaiuPW/m8f1GFhpCbbKjN2J4Yq06VhHk?=
 =?us-ascii?Q?AkPNp29FaXuhIFgCbz8M9t0QmtqwiVDUL5YK9kO/mI4shDP7k/4gsmqR2wKA?=
 =?us-ascii?Q?aC5hxWYGfynz1FGk7k4yClKkCVq/6A9hOw1obSTneS2X0GxDDy4ALBHChwFg?=
 =?us-ascii?Q?Ufu+d6z8BlBgi7F5GbrEaEIxFs7iqD5FxqMqIKDYNd0ExyEaOBM8Po1NZ2bJ?=
 =?us-ascii?Q?RZg2m5LgjWVX2jNbyZwE33XlZwyXC7F93ser5B/qWfUTWVJ5/3ItCIpAHWnB?=
 =?us-ascii?Q?cjbcsfHYswVGjSS7pfZfzX0o8Y09f84a+jmXmseCxPWLfntJHrsO0SRGCkwr?=
 =?us-ascii?Q?DOJotbWKbSQxUkEhhxuR4K1e6RYFlgi9X57chwEjQSgdAkUzQlM79q5Oqhi0?=
 =?us-ascii?Q?fm9SfhCmc9lOjm8OhFkezsrRGPeiMFYzooQGycCLl/gSD7RnHgxb6fEHstbr?=
 =?us-ascii?Q?diG09yuUFOCBsgh4ZSyjRQVtpOFHR12sHzrr8ixuI9XIrlBgcMbch5xv+X1F?=
 =?us-ascii?Q?wwqeU8fAIio6XtyPdNPkoaV78/wrhUsymmjCbu30EbEFQDZuH91FOMPJDbnM?=
 =?us-ascii?Q?F7OMVx92Yt1TbnOlUZfsHgA9qVWgMmSJpSGB7SmPJwaUxRhAMqzvoF69KeTm?=
 =?us-ascii?Q?NFK5Xsfj7N5OqXnvHevFkM7E2crCsq0BkjF3U66L5enkmFIOyuN1Q5wLfXMp?=
 =?us-ascii?Q?2ZYfRbhbaOSqyaDPn/fmDK02CYw/JEJI4Hkjawp6//O3qOUjuA7DzlAa+mbJ?=
 =?us-ascii?Q?8i6UNjfsiEXiPL2juyl0O+SpxkZM9J2k9VoYUw592fw0RAP7NIkb8YDA4cfb?=
 =?us-ascii?Q?JuGeq1TvZ5PEOhSzskgxKmwfI2UdrEwYfUOHX7SNlPwvFe2XqbCbFkbn0f3R?=
 =?us-ascii?Q?9QpXe91bSfoPK/8RIHJoNdtr3ppJfNHH+d6q+M2KkajJMtg8MSrZFf8USyU1?=
 =?us-ascii?Q?Q8RlMBRKMY/OhzFFfDm8MyWhCaOc7X9GfQO3mWA5p0fySLpIy6VhKPuUT5B8?=
 =?us-ascii?Q?Bro5+35dfEOq20+Z4orFvY/q7rp9DjPHT6IJe1QjGRJoJ9DzSa2t+V+MI/uQ?=
 =?us-ascii?Q?K5jkHMp8AZ1St6JyrXeL3g9BB1WZQSxRp7kEYikII1V1sC8LeC6MXlHzSuwk?=
 =?us-ascii?Q?m4uesItWKOtPpzdgnnPb1hcLcP4WHmHXi5KMxKwaKp7XHZGond9uZCsC4iLU?=
 =?us-ascii?Q?+ooQwnl8pZyh5lXQcQs4xTTFKXA4SrpL8teST1NzvxBeg4dNMneF7iZHhBD5?=
 =?us-ascii?Q?252wfRU3kIiSWyfoY1CrkH+EZx9rbhWtyy8qEMioGxd6ghWe3WIl/d2nGL8k?=
 =?us-ascii?Q?Vlf6/tQPvRcOhKieJhAHEETX6jEwjYH8YRuM9FGrqpcB8I765mWxva3tftwd?=
 =?us-ascii?Q?z6vv6vvLVoti1IfhpMj5Q2P/d1lEVUn1rNrKPuCM5e2Mywgl62R58rxBvtbu?=
 =?us-ascii?Q?mMhUjPryI1vMUY3SqeiiIzo6Lm2zJ3zzY8zjeymGf6gCwtGPtx2ZQj6dhlep?=
 =?us-ascii?Q?AKXv4X5LmmaIVHojDNKVjIja8CRVHf4AKChqIVpgtX4XfSh8ZSEB6z5YF53j?=
 =?us-ascii?Q?LFGgB2Fxx7D0WnUXFuN1uYqWoE8UZouKQy0M22lVgSV2PMM87KAVk2CiRsra?=
 =?us-ascii?Q?Ug=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	B3R6EFiqdIPMEsmHrNL9mb0FKzioJEEI98MgQd5kJX1C/ATcl9HZLVQDEuJa/mOYnLm6LWPxDftiItoXO0a+S/XsfpoWw3qqMY9cFwpFkjJ6BIwj9KNTmpXu3P/iuZ6frVs2VCCuJyDzKT9M0F3ShoNLd7tPTIp+d7gLawIyI7zV6ZrYabRsbF1Cqvg5C4MavDXG4QCLHbnqgedsXFJ0A/uWWPDPozNc/mfysHuIen31vxXMm5WrFMDR96tHejsOZ9bixi1SmW2Z3cJuBG2Ed/cBeraATEnfukKym1o6Sk25oOT9lScMroj7n9SXc9z4bRXtqvopE2hf6Xj1llb1RVJyt1nArzSJwY+h8kQyR2sL3653SpXvwFNOdb2Fn4zeFRWgC181aMTOBlI4JeC5QGv4jZe9SojlZAz+WXYOJUUQfmVEpw0GsEakiZ55bmKejNDEWrcvSxsSqXGg3IDqCNr1HbPPZyM9PIBOReWpGdshikpjmWbmrHqyKNtO+GHPNGf/Gd9p2VeCCSwzxac+xR15+Avb3ulEO1gAm7UNz+lFH6iBOy5EvX5DQphu6IOA58YxtAgs5bOKZ0a3So4dzwoHsMvOZU6TR4X5KB+9V38=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a4a3495a-87c6-4a17-1ee7-08de3370ad2f
X-MS-Exchange-CrossTenant-AuthSource: PH3PPF654CF2C22.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 04 Dec 2025 20:06:57.1213
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: X+dJ/I4AbzXp2VzmuwlyjOnd4opWJiToddED+Q8DDVamb9rs2lcSaobFyvvsfXpT3MOG9776vbgDfCI3WxDYAihCoAyxpg50joseiXv1tJ8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN7PR10MB7046
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-04_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 adultscore=0 spamscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 phishscore=0 mlxlogscore=750
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510240000
 definitions=main-2512040163
X-Proofpoint-ORIG-GUID: cHO47RAa-Ous7w5n4ElNU-Z0rO03ckV-
X-Proofpoint-GUID: cHO47RAa-Ous7w5n4ElNU-Z0rO03ckV-
X-Authority-Analysis: v=2.4 cv=W8w1lBWk c=1 sm=1 tr=0 ts=6931e9e5 cx=c_pps
 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:117 a=XiAAW1AwiKB2Y8Wsi+sD2Q==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8
 a=Fg0a1JEIXGhjAZdTRpsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA0MDE2MyBTYWx0ZWRfX23rJfSAAK2FP
 qLWFMoPrs2MkVU4YL8IOZFZb8Hg87VZeNQkSclfp7rGU5+KsOsZLP+06Wbj59K5EWsDYDymvxNK
 /Vd7o865GG/ticcJGuFLAzlS1YQ282VF1aVSy7oZZbSzQ2Yh8c8cC1X/4zzsolOSXsx/Y9Ykp6Q
 bMrlLv936XLHdaDstodBtleygIMfecYQPVB7GL8O/pZRX2chjOk2jbsjIYTxEWIN/utY+ObWVPE
 sM+eZUxYdhrZKFYFuGRmj8waI3d5Md9W9Czt1NQ4vHl9h0btIk0o+9nj9RL4z3GfRjB7fFVL1xV
 1wBAulqJ7/2Rkn3znPiMo2H9DnYAqE1qGXFgJWh0hlj70+0wlW7IkteLKjYyUm/JvHy2L3lQba3
 x1odUvI3xy3XseNtMtDP4FJFwi6pew==

Hi Philipp,

I wanted to let you know about an issue with drgn's stack unwinding on
the RHEL 9 kernel. It looks like that kernel backports some ORC changes,
without including a change Omar made (including an .orc_header section)
to help identify the ORC format version. I've included more details on
this drgn issue:

https://github.com/osandov/drgn/issues/578

The result is that drgn can't unwind stacks on the RHEL 9 kernel. I
think the best path forward would be to include the .orc_header patch:
b9f174c811e3a ("x86/unwind/orc: Add ELF section with ORC version identifier")

As it is, the RHEL 9 drgn can't unwind stacks on the RHEL 9 kernel,
which seems less than ideal.

Thanks,
Stephen
