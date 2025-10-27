Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36BFD1DDC1B
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Oct 2025 19:47:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761594429; cv=fail; b=aY9gZHC5v3kxBrg/pbAF7O8YgXvQvQ6x/BSfBv1Kemp1G1qWw1e3pcq2XJER6cv3Lagm/9fO0wQekp7ZxpoHraQXWztZFQc1M8I6H7UAfiijE5OezCXKm2Q5r4iRxtujpNbzS+rUnt1hkbI0Yofaaj3m7IIMQWhgeavoMAB1bas=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761594429; c=relaxed/simple;
	bh=lhjg2jaFo4w4mgeXb+0eDMeZggRct+C9luC9lrSzyuc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:Content-Type:
	 Content-Disposition:In-Reply-To:MIME-Version; b=WqD5Y607IJFrNInhJC9qM8XxENkCoI/XpviUq9RgYUQ0DtjBgNg4HVay0b23qtEkkM2uCTtkm8DS4ysU4yxAR39SRW63lW6Je81IxEIMBW+TeZF9GbkYYlVc8Vyo4AVF9d4q/EEL/Af3bWz6U++M/Nal5rSHv8Kb+Bk/g95UTEc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=XcDwxTop; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=OmViznQZ; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="XcDwxTop";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="OmViznQZ"
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59RJXCiZ019640;
	Mon, 27 Oct 2025 19:46:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=corp-2025-04-25; bh=NEOpglkz47mNlItP0B
	QiiPkA0sLKce4Q7GdJRaNLKNE=; b=XcDwxTopbsdxuonyz1hvQI6Zd3CLjka/rB
	1LN/AdA98S7wKlblofcCDXS5wL6FPjFW0qK2yKgPKaE9IeYqeq1kUznxX3m0Ut+D
	f+GRktqE+YiSBITM/OT99/h/i98YFuKzazSnJdt2INEvWaJNiaxxHU2+C1v5nQYg
	h6Vm5bMtwzcqzMmS92jXIN9kQGobw8Qny3BVKfdRQZfzlQV7OoydTxKOZ3qI2gbw
	AD1v3s5JfU6uy51NGhkVMTNpyYLDNMkqOrst+l7iMe4MqsVD/bZ40OrTAZGBMnXe
	6t8aAbR5h/eAV24+fVv3G7w1eXi9yYZ4vgv5dN+VcrHhs+wV0MNQ==
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4a23gvht05-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Oct 2025 19:46:50 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 59RJDp8N025676;
	Mon, 27 Oct 2025 19:46:50 GMT
Received: from cy3pr05cu001.outbound.protection.outlook.com (mail-westcentralusazon11013000.outbound.protection.outlook.com [40.93.201.0])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 4a0n07g3js-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Oct 2025 19:46:49 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wxGC32Hla+7FFKlkix7hTIKykKcRsV48Inqvta36N9V+cHpV8jJaqq++5gthD4jlMr2w0IpToVq0dTErkbE3MIszRpENJ9a2IqYkQsPwUrDKGJXj3LFwOlLL/IxSx1xl32YrWoPsNUhZ2LqdGZuxNFOpcK3EfhCpIvdOkDc32v3QQAectvhqF0KHAdX3CuaGDoUvzXgqwo2tjnMonsfmswS7Lmz6pLBcTNvT4MJ+2gIkaWyok1StZMpXVk2hNc5dNAHQA37pqjcem+O9cVAqhO1JidRR7kIXctsKpq7CIVpkpgghbtwnlRdbjHWB21hWkA1p1ln5dotR+HbWIMdl9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=NEOpglkz47mNlItP0BQiiPkA0sLKce4Q7GdJRaNLKNE=;
 b=SLW8VgcLwwzgEQuTbfY44PK6g+PJQjiO34E+zmdQj5uzaTh2YmERPK1cjCHe0rx1azkSipdJD2lRPlNnDC2g0qMhRiouvaSfeiuL2RkudN8SB70JsrgpvxmTnyRoxKpMQU7vVgjTYr5R9v2b7glFznnnuOm+FyrgH4STA4GayDMpLy4geP2/AE5JntGTGrYjz6R9q5rKBEMGiF1HPrnjM8A0qZGO+sXcpcbud5urWgl+9I7pEgC2ykrsWyq2p2v5O5z2rncVQE2JiV0chG4PaRuCZnUGKoD0LaIBNDbEnxRV3O+doPvua3n3b1req605V4IPt2y25IpYNHWKJLNOQg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=NEOpglkz47mNlItP0BQiiPkA0sLKce4Q7GdJRaNLKNE=;
 b=OmViznQZw4yQL6aC4Z+YXiQPEMM6slGspOsrkrjlHIIxxvGarwHTkWNjH2XZu7dh4hdluX741Ci5dAVUSZJwGqy8xqAFcplMdNuckKFbq+Jsb/66QVLEy4MxBoL/Ecp1W3jjbqB47d0WPEgPVWW2OHTAdADHnl5N5dbNZ5YpD94=
Received: from DM4PR10MB8218.namprd10.prod.outlook.com (2603:10b6:8:1cc::16)
 by PH7PR10MB6156.namprd10.prod.outlook.com (2603:10b6:510:1f3::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9253.18; Mon, 27 Oct
 2025 19:46:46 +0000
Received: from DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2]) by DM4PR10MB8218.namprd10.prod.outlook.com
 ([fe80::2650:55cf:2816:5f2%2]) with mapi id 15.20.9253.018; Mon, 27 Oct 2025
 19:46:46 +0000
Date: Mon, 27 Oct 2025 19:46:43 +0000
From: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
To: Omar Sandoval <osandov@osandov.com>
Cc: David Hildenbrand <david@redhat.com>,
        Israel Batista <linux@israelbatista.dev.br>, akpm@linux-foundation.org,
        linux-mm@kvack.org, linux-debuggers@vger.kernel.org
Subject: Re: [PATCH] mm: Convert memory block states (MEM_*) macros to enum
Message-ID: <3d3bfa52-3e13-4d23-8ef7-6cb8b1ab7d79@lucifer.local>
References: <20251026162156.12141-1-linux@israelbatista.dev.br>
 <811fd675-b231-45e4-b9d5-636fe63bde6b@redhat.com>
 <aP-2x314BKks2_N9@telecaster>
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aP-2x314BKks2_N9@telecaster>
X-ClientProxiedBy: LO4P123CA0284.GBRP123.PROD.OUTLOOK.COM
 (2603:10a6:600:195::19) To DM4PR10MB8218.namprd10.prod.outlook.com
 (2603:10b6:8:1cc::16)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: DM4PR10MB8218:EE_|PH7PR10MB6156:EE_
X-MS-Office365-Filtering-Correlation-Id: 78bd6bd7-82a7-422a-09a8-08de15918fb0
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|1800799024|376014;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?qLZDXo4FWdJfEXDBy1EwM8EUykmP+rEv3nZ2Y20HoM9pNNO6EeBrDAlwrLsa?=
 =?us-ascii?Q?0h8CwgA9GAXabzP5OEtrWNWwSyd3erEbVgTETczVjcBzZY+fE0YXdLTAsYn3?=
 =?us-ascii?Q?xyeyB0dwomH2fx78aGec34cff/erl2IU6zUuI25K96blMj25Dqtxf6ws71E/?=
 =?us-ascii?Q?0MPDZCjpGIu2m1SMQpn8EUAQzFhvNjHiyjaHUnoIMsN3XWsX0NIbziN+VZda?=
 =?us-ascii?Q?MgWvNau6m4VIYs90UYY1M5yIARjJmiQuT+Gn75V5qYLADiOMLTL+1FaXDQwT?=
 =?us-ascii?Q?Hr5XBpAPXup0S4Cz4hHRIO6TU8oEFvWgK1pRGAMzJBzhEHSOE5Q9RQAUL3Bu?=
 =?us-ascii?Q?ih0b82prOMJIgt7MwbOvdNiWkYypOOQsCXQ7VMhq/oJNLQ6UDNbX+NqPpb5B?=
 =?us-ascii?Q?cJ841CdufxCXYn77qaBJkYFonqZ9mitwQie8WmCTIeM1rDhRpyX77pdxxYVN?=
 =?us-ascii?Q?fBLrVxvQBDAVugTPaEi3eTbE4Gy+Cl8STCo2C77moWR72kEiwzmQ9BLx8NhH?=
 =?us-ascii?Q?29haTrc2vkOeAl04uZqGZwBp40PT0yn7x5ODallLkGy4+vxZ517MoFjcUn9j?=
 =?us-ascii?Q?ojs15rg4sNVZEx6pLp6AZtDjRQov3PVJ1zgQ7Kjkm63ZAP1pvNSDXNmgzwtd?=
 =?us-ascii?Q?E9dzYkF6CUvrt41+4ko0SwyRtIQWkiwJ1Ii8O43odUhHAJ/OJ7TaVyvP4MHs?=
 =?us-ascii?Q?Mu7EzxUlYPUhX0/WtuacIx6fUNebLX0sgd0N8CJfwJwGmXKmcqUCfVVwe6kN?=
 =?us-ascii?Q?7YBeVwaLVEgm9LlsX3OT8omdAc3/iOaU/5MCYCiXgDxqX09W1gReYb4IOaf0?=
 =?us-ascii?Q?9jwcfzfnMVS01z4rHcxpsfCWqBoJjv1NCCr0EWzHY4moBjdTUltaEs7CcQAC?=
 =?us-ascii?Q?vOGPlA8bcmubloadC5cFFunAWErTaWkIZmyLUBRVxgXdc1rWHoDugsWopXQG?=
 =?us-ascii?Q?luy6SBY5VRdNocqmlf3kNWuGRsPcWAYyS/puAAp+SixmbjiLaDSm1p3jQwX3?=
 =?us-ascii?Q?Qc5MOespwx08xwvInpLVSLdwNPuvJ4DPZhYeUgc/wNu9XB4/H9/9L/+zJknO?=
 =?us-ascii?Q?m3VqDgRB9ZE3F1LVJBOK9YjDUYwqZL8SoxTpAJFx12eKZVUrpcVR5sRv6yGY?=
 =?us-ascii?Q?zMKul5zyvDCWRNHhKk+jnCWbbeoM57i4wUwcsR97PrhBpJxC6I51Fxq38+Q5?=
 =?us-ascii?Q?tMIHou8Cylwp4J88lvt3ru152/jyCwsaP0+E7EEdv513ZrxfOrdDvTvHQvO0?=
 =?us-ascii?Q?qKBKM0WaKVtGouQYuuHSRypsAlf9+YP+IiHmEOlT7MOkAxVKZJvH9Picx3Yy?=
 =?us-ascii?Q?bYIYj8MAFIPexV0eexKUCNRVkImZzZ+Vf4y/uFdMr/xYbAstOIdrZqcKgYOH?=
 =?us-ascii?Q?IEkmYxGeQrVciLBeAly8BeCVVQi7JHnL6POvUVeNKi7nMkZm6tFCEPMalsLu?=
 =?us-ascii?Q?jdsfcEpchAZqEshBDP7+XoVfUy/TolZy?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM4PR10MB8218.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(1800799024)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?kZEpl1ZwYKcteEsqPuuh1+Ddb7Vv5CZjpTygpQBQtzPo10pWhdVVUgVhKXoM?=
 =?us-ascii?Q?NuXz7Oro0Ni5MhLbFq4Qyky+zJ7bPL4MYHyFWBz+Bv7mxjyPd1KxvsRvVb1/?=
 =?us-ascii?Q?gkugSHfNv58q/796a4TjBj5LooEsD649hpwHwzcFsbf3SnI7ueo51xXU3M6H?=
 =?us-ascii?Q?4eIQZdOg1oN2uJwH6ZAzRJ6IOucZtVSTkg9kcTjXP321yqllGl6tXKhzW+yB?=
 =?us-ascii?Q?+5o+hdBh2soI5JqzqT3lnQxQqTM62kjJHC6sYfpipV9OQZA4rdE9iHk2S/dd?=
 =?us-ascii?Q?4Gg1NckfMfhdSoLqaNzqEHKi+tePFkUAVdpmx8jGGUfLMVv/h9JJ1Z+Bh8NN?=
 =?us-ascii?Q?JOtqtxcfkNe88KdsxnnzIMh1OcCBxrV/+lvLgHQKkjTC5lAx7ZqnSqjmERdT?=
 =?us-ascii?Q?X7qtc+ADc0R04ah0LfkEf9ujaFRc5KFXnd5EP+HsU7Dh9geXEAtfrs10affU?=
 =?us-ascii?Q?9iiZQz4xCgB6tmc82F9S9tl2Bmbmt9XeZ/ZjE8ZVZH7GNBLnSap9yKP+Jmdb?=
 =?us-ascii?Q?EnmBtba1Zp2sJc/dRiW+wcQLxjmWuiCkGzKa8SJKa8fcMyvTHMnOWHguUs3G?=
 =?us-ascii?Q?WLnjLysGsf7yhrVb+3VyPJD6Z8uHV/+/9vblyq908E/ZbsHsS+U/19vVNxan?=
 =?us-ascii?Q?7pG9A96PUTxNtLd5jhRRv2LWRUR7n2M0kC/je35zOux5Y1il/BqaH8vnemQy?=
 =?us-ascii?Q?Io2QIhzIs2lmDURnjfBazTT+dmtcwuGVT8KhlnBzw9jvV/U3tvLlwubvGLsb?=
 =?us-ascii?Q?ivhwoLYHOxCjpCXFvbkFABdEid6Kxz2Cd5rzOkTSA5CHP0FloDIv2R7NxhzD?=
 =?us-ascii?Q?41+WNQNYY6cVGa1rHzbtBLNGHU29HQADClvSwzAuO4hHSh3LLWh+0wlGf+L0?=
 =?us-ascii?Q?auwGcercwvGNRTUH0TP3LMG+Us4k0kVU7ZUuSyTqWLS81MuP2k4OjN0Ey+od?=
 =?us-ascii?Q?lv2pFLeqQVjwboXMsKAZocqWcO/QojVCfuhzeFO0H59cVYQUoIHPuT4k6Pw0?=
 =?us-ascii?Q?LSwAOlg7d5dl0YX7zxztwo604pPgIMoaAAX+Z84jJDtB65hGOxMWWpBkm7cb?=
 =?us-ascii?Q?M7GR1MEDtXjFSW5q2QzOKB5FJ/1LD8416E8huHm9OATugJOpJvh7QOCtyu7/?=
 =?us-ascii?Q?s/JX+b2KTsaxg4luyGT+GCDqMeniF80V68KIeIN+4fF4wtKDtZNvCvVKryto?=
 =?us-ascii?Q?q2Y1OXBeOpnhaT5dn7wRwZS/WAVsQvLruVhPIFcRO2HbiGbqYA9cSAByUezJ?=
 =?us-ascii?Q?w0dqzHuW/EH+c+o371yi8ksspyq1PRrHvV/rVHNC4eCHEt9PGg2KEVBW0l/V?=
 =?us-ascii?Q?XBXU+GH2oyDm31EzZEjho7QOcezY9oeYXN1bYDRfY0/vwCT83NHoV75PQhpN?=
 =?us-ascii?Q?Xq0pvdK7tS14lCW5BwC8zELb7FbO2p2escXdJcjWw88o40gJ3Qc4KwPx6b4x?=
 =?us-ascii?Q?lot5pF7Sq5iab8yAm90NSS2CsC5Y2HoZAj25ML/gLzID7aKcPWGn011wuIzE?=
 =?us-ascii?Q?nLolvr30dy0o0ZTk7Jl5ArBzcuaumSS/bQgP9vD5Ysv1L5yjGyD8nTA+iLeo?=
 =?us-ascii?Q?5bxb72u61DspAyRbv6le5/kyXgsFoGX9JlALFryclcm7JUxgQJZpiY1Rqmi1?=
 =?us-ascii?Q?Zg=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	zi+yEhRXGdVfpYbiaRfRJhQHDcW8haXHVVI4VewpFbWZzzbIhyZZGM2b3DsZoi4nPIYngjltKFTyZ+nxB6pmHle5klO85ws++7hMWjRnTf8EI6hZTwyLuQ8Th70bhysqMllFuxvRzFIAcYG7nkW0tJuSzga3AugmwhSfJYzuv+VRy7fQbo7zmrf2TRaQ9R/AHcP/SSiP9a5DrdO3pRIV09W7OwTC9PlX0vO9eq1j6UEQuDLmxR8/8zlhahoJJ6Qnw7MMBgbQb6/P4VAqr7ixuaFyPpVBqwrUbKx3MxU8Rlm9JpwZPfL/i1yDWVQ70WJsOH2kUVoaxVckxhn+w9G3vHeudg6OFZuY2KJH+UACxLy4i3cnvDi9wqR5vKNyxZ6cICpoVRoPB2wnlLExM+cI70rpXZIDA2IGtdYEhhYLw2msuc3tBJopj+/ChtnheaaVtKdqbZpxdPNKbNE1M+tUrQZvlsGujREyGSy3mNaCqdyaNPEKN2esYwWAZUYPGPCFIq3OHIr5ac/D3jvrqxA3hXksxQtKodDazjskHZ/vdxqcpvGcx639vEWasiLW2deEMCmcISMb1Vt92bhNm15Q47mgemXhMU2O8TlzrYP9CFY=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 78bd6bd7-82a7-422a-09a8-08de15918fb0
X-MS-Exchange-CrossTenant-AuthSource: DM4PR10MB8218.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Oct 2025 19:46:45.9786
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: TyA7H1RiwHf9lOprg+iYhOmtJCfSF4HqzWTeid7lWeCQYdcNFnyZZAwhzKNz5L7sDlFQZSX/rCMOVMOFE6qtvyeFlOYBFwSFIHs9O+5yTGU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB6156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-27_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=960 adultscore=0 mlxscore=0
 phishscore=0 malwarescore=0 spamscore=0 suspectscore=0 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2510020000
 definitions=main-2510270181
X-Proofpoint-GUID: CdHS3MrE3pfYVqHvhIS1vBzXl82GS3bw
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI3MDA1OCBTYWx0ZWRfXzB0vSzU3aeFx
 w1tKoZmKV309A2MuxA3IlJM5EVVMWjR76kWzyiQrWy+wKKJs+KPf7tMiQ2tVzkiNhoRAfzy8sjt
 aciThhd6Ducp23/F0jRLibwVg/nEecppUvBMDUSM8ilK8yZuPdDiTm4wUMaF3BSORIbUe3HGBMw
 QEuqlyIavruGYtTleYUst1V+9M6+HCQbViTp9csLBLFxkebPBVTrhhwmkbmLvg5w32VpvjgMrDL
 J0r/lnngUM6M5XSLIFttfUzpzCJkCmf/bHe2kWbNDK5ZA5+QyrIZRckyapFlF8pClCoem8QDiuu
 SLPClrJS+jnxFzWJZNB/ZTSJeDKALbhLty/cYIyS7XF2fvxDIvp6uWNWcYxT5gv/Befgu4pgrV3
 i+zsXi1gfIUA1m0SRrocE7LJzs7J2g==
X-Authority-Analysis: v=2.4 cv=HsN72kTS c=1 sm=1 tr=0 ts=68ffcc2a b=1 cx=c_pps
 a=WeWmnZmh0fydH62SvGsd2A==:117 a=WeWmnZmh0fydH62SvGsd2A==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=x6icFKpwvdMA:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=YMJ4S7zjzT1Txv9Q5fcA:9 a=CjuIK1q_8ugA:10
X-Proofpoint-ORIG-GUID: CdHS3MrE3pfYVqHvhIS1vBzXl82GS3bw

On Mon, Oct 27, 2025 at 11:15:35AM -0700, Omar Sandoval wrote:
> On Mon, Oct 27, 2025 at 10:29:15AM +0100, David Hildenbrand wrote:
> > On 26.10.25 17:22, Israel Batista wrote:
> > > The MEM_* constants indicating the state of the memory block are
> > > currently defined as macros, meaning their definitions will be omitted
> > > from the debuginfo on most kernel builds. This makes it harder for
> > > debuggers to correctly map the block state at runtime, which can be
> > > quite useful when analysing errors related to memory hot plugging and
> > > unplugging with tools such as drgn and eBPF.
> > >
> > > Converting the constants to an enum will ensure the correct information
> > > is emitted by the compiler and available for the debugger, without needing
> > > to hard-code them into the debugger and track their changes.
> > >
> > > Signed-off-by: Israel Batista <linux@israelbatista.dev.br>
> > > ---
> > >   include/linux/memory.h | 16 +++++++++-------
> > >   1 file changed, 9 insertions(+), 7 deletions(-)
> > >
> > > diff --git a/include/linux/memory.h b/include/linux/memory.h
> > > index ba1515160894..8feba3bfcd18 100644
> > > --- a/include/linux/memory.h
> > > +++ b/include/linux/memory.h
> > > @@ -89,13 +89,15 @@ int arch_get_memory_phys_device(unsigned long start_pfn);
> > >   unsigned long memory_block_size_bytes(void);
> > >   int set_memory_block_size_order(unsigned int order);
> > > -/* These states are exposed to userspace as text strings in sysfs */
> > > -#define	MEM_ONLINE		(1<<0) /* exposed to userspace */
> > > -#define	MEM_GOING_OFFLINE	(1<<1) /* exposed to userspace */
> > > -#define	MEM_OFFLINE		(1<<2) /* exposed to userspace */
> > > -#define	MEM_GOING_ONLINE	(1<<3)
> > > -#define	MEM_CANCEL_ONLINE	(1<<4)
> > > -#define	MEM_CANCEL_OFFLINE	(1<<5)
> > > +enum mem_states {

Why are we naming a type we never use...

> > > +	/* These states are exposed to userspace as text strings in sysfs */
> > > +	MEM_ONLINE		 = (1<<0), /* exposed to userspace */
> > > +	MEM_GOING_OFFLINE	 = (1<<1), /* exposed to userspace */
> > > +	MEM_OFFLINE		 = (1<<2), /* exposed to userspace */
> > > +	MEM_GOING_ONLINE	 = (1<<3),
> > > +	MEM_CANCEL_ONLINE	 = (1<<4),
> > > +	MEM_CANCEL_OFFLINE	 = (1<<5),
> > > +};

If it has to be named, can we just expose the bits as an enum and the values as
BIT(...)?

> > >   struct memory_notify {
> > >   	unsigned long start_pfn;
> >
> > CCing Lorenzo, we recently had a discussion about such conversions.
>
> Yeah, I've been asking people to send out these conversions as we
> encounter them in drgn, but ONLY when the absence of a value in the
> kernel debugging symbols causes actual problems for drgn. I want it to
> be clear that we're not spamming these just to cause churn. This is an
> unfortunate corner case of debug info that leaves us with no other
> option.

Right. That really sucks, but I like drgn so if reasonable I do want us to
make life easier there... :)

>
> > The states are mutually exclusive (so no flags), so I wonder if we can just
> > drop the (1<< X) setting completely.
>
> FWIW, putting my C standard committee hat on, there is nothing wrong
> with combining flags in an enum. C11 is silent on the matter, but C23
> made this explicit. Quoting 6.7.3.3, paragraph 16: "After possible
> lvalue conversion a value of the enumerated type behaves the same as the
> value with the underlying type, in particular with all aspects of
> promotion, conversion, and arithmetic." Lorenzo may have been thinking
> of the stricter rules in C++.

I don't really understand the argument being made there.

That's just saying the enum behaves as if it's the underlying type? I'm not
arguing otherwise.

Consider:

enum some_name {
	X,
	Y
};

void some_func(enum some_name val)
{
	switch (val) {
	case X:
		...
	case Y:
		...
	}

	// compiler doesn't warn about missing cases.
}

This is already giving some sense as to the intuition that enums specify
all the values as declared specific enumeration values.

But intuitively, with the enum as a _named_ type, it's _weird_ for there to
be possible values for it that are not listed.

The problem here for me is the type being _named_.

If it's unnamed, then it doesn't really matter, it's just another way of
declaring the values.

If drgn needs it named, then just name bit values and use BIT(...).

>
> Of course, semantically, it makes more sense to use distinct values in
> cases like this where the values are not actually flags.

enum's are kinda defined by being distinct values...

>
> > IIRC, these values are not exposed to
> > user space, only the corresponding names are, see state_show().
> >
> >
> > Won't the compiler now complain that e.g., kcore_callback() does snot handle
> > all cases? (no default statement)
>
> Only if the controlling expression of the switch statement actually has
> the enum type. All existing code uses unsigned long, so the compiler
> doesn't care.

So why are we naming the type... does drgn require it?

Thanks, Lorenzo
