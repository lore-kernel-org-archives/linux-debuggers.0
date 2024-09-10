Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 409AB17E8EA
	for <linux-debuggers@vger.kernel.org>; Tue, 10 Sep 2024 23:26:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726010806; cv=fail; b=aqIEg8cwi4H1q0dk5ELlRo0dHLUt7TFwuSFs4quCtOQjht9bgktgwG/wUha8PdzH/1ww/9479BaR5Dsxog3lgAX17ZL0fDV9EvnDkRwgha1RH1C6p3fLT2/qaLcLC1NHuZWj5+2pSNQ9ilq0+YFr5jrUYKLQJUbExu/j3Z/xhLs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726010806; c=relaxed/simple;
	bh=O92+9eha1b3YmsOkgUgf7aWv9TNqYWb+EACxmjf925Q=;
	h=From:To:Subject:Date:Message-ID:Content-Type:MIME-Version; b=dxDF1dioqlxKBUsBzDG+SdTn7GkzTPsZBFfrqiC583JcFSnbur+PVwHSRUMQ3ncPKlYL+PK638eDnRKrxXkgHuwIw94Gi3NLc5p5sPjM/wb3HRi+f0yoz1Ij2ODzYuIKQTmkfuOSmjMGsCtJRfie9ymWCAtN99tJ8ceLIwpl2vI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=koIVZEOz; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=jRCGP5jD; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="koIVZEOz";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="jRCGP5jD"
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48ALBXlp023509
	for <linux-debuggers@vger.kernel.org>; Tue, 10 Sep 2024 23:26:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:date:message-id:content-type:mime-version; s=
	corp-2023-11-20; bh=O92+9eha1b3YmsOkgUgf7aWv9TNqYWb+EACxmjf925Q=; b=
	koIVZEOzck/DTiP80JiOSLU8Mn34HDndBLGKaiDYnJAV+79NJUq6F5z6VF7JjEuI
	q8dYPxW7eOdf7INHJTsUU3KglGyTiEZIC65qDe2x6LJF0Y07dPyy7qb94QYq3cxV
	/z0WUvbwXlV9ie9GmpfVSnyDCIeZ7fVfAwFvuPVrJcY/gpYzHFrZJmwnwSfpujTu
	+Lgf5x3wSCH6yRVDje9e1MclXAExy83ywSmtfv4cpj/mNrESYTsOgQ07guc19TjR
	+OTtNkhXWG+SrLpkoZ6yF8e29Z9WEuPLb31otXJoIHxmDCgCSrzTyWzYSCxMj6Sv
	CZ3tauCHReRZ1LQP18ZFVg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41gjbupn2x-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Tue, 10 Sep 2024 23:26:42 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48ALAExn032386
	for <linux-debuggers@vger.kernel.org>; Tue, 10 Sep 2024 23:26:42 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41gd9fhfda-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Tue, 10 Sep 2024 23:26:42 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=gwUth4MXA8F7Aq2sVXOCkJ15EAdFh6/rsEVZRf+hZLmPRmbpJ1URP86tTzcjUXH3dgy/kJ2MSWODU7dCV8Q2zbvqNYjrFDo7vZA/zZj24IrN2WpdzRi2x4K1DJ1Qm/LA3DeMZj1uUQjn6x3QWOoFiqRRWYKZizAZN6Oj6RFQ5LbknMnNKIKNhFfk791GNhGUBFMpc65SIBblUf5t71llDMRBaGK+fftam+QAd6B6OIzX12B+g/W8BMEyprnHmmrDlyUfEelll0PH0OGJ+QC7lGuPYZ/t99NEdyRT3trrm8ZPwvIYRar9oniRq66TZ5/AFHmmZwn/ZSYntYXo7h6A/w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=O92+9eha1b3YmsOkgUgf7aWv9TNqYWb+EACxmjf925Q=;
 b=I08ssvqpK+owAY/jKAYRviQMPZGIzOxcdIE577X+tWYoJayPHIJxCR2zHO8+jBc1lWpWpnYu3xxyh+yFhtPvRze0uEnbfhDl5erOvPrgAALN2UnD9U3gIXgH2rMcm2dKX3JWhVzvHS5ZbkN6FjP1lhsVuYUcJ5AzBifCQCRSe5Cn9sb3g3s9g2cUdjkYsK9yDPae5yhpqFtDTMgaOBSefIU9PUWprs6eO1MZJjjxSLLzHxvRWna9HZ8VkFyPKPbzOmhL5nAED3LeFj0UJx6tUpnB1YvQCUXwmpBkYytt8zHNCLLJKVZykRwMKbUA3IPNYgq/4wKk3o8UcPD5i7+26Q==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=O92+9eha1b3YmsOkgUgf7aWv9TNqYWb+EACxmjf925Q=;
 b=jRCGP5jD6nsUFRN1NS8J4nCHsmB3aKcx4KGJMRwOr7A/MLOPJsGBNf52GtpV/GAoA1HYWDc7Fa0Y3JIOnhbab5k9MUMKD8dvyBKTvGA5OxogW8b7ctlgsT9Ec59Z+KH5k9JRSGoa86bFvzzxDqKLWvyN8aX/ollAZZtCTRoOjBk=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by BLAPR10MB4866.namprd10.prod.outlook.com (2603:10b6:208:325::17) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7962.17; Tue, 10 Sep
 2024 23:26:39 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.7939.007; Tue, 10 Sep 2024
 23:26:39 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: linux-debuggers@vger.kernel.org
Subject: LPC BoF - Linux Kernel Debugging & Drgn
Date: Tue, 10 Sep 2024 16:26:38 -0700
Message-ID: <8734m7nl8x.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BYAPR02CA0062.namprd02.prod.outlook.com
 (2603:10b6:a03:54::39) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|BLAPR10MB4866:EE_
X-MS-Office365-Filtering-Correlation-Id: 4b77802e-6c43-4c56-ce3b-08dcd1f00566
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?1q8z/7NjtW/+sZCwyfWpSJZpATh4j+ALUYAIEYoriX8l5ocuJHAMvym89s4T?=
 =?us-ascii?Q?+Oo4zhtb6rK92zORsS/4u3nicrvo25fe3ouB6keU82fZVomNdM6qaRQ6KxM/?=
 =?us-ascii?Q?vip9rXD5hWRObiQNo/9/f3xzJyRW7oPzLTObFpilhJwVwIyOzacVJxrIGClN?=
 =?us-ascii?Q?qqxfIXyWHK17JuPPPrHh+IV98La5qEg79KsmXnNZ0Cz12sdQ5f4ZTksyyajT?=
 =?us-ascii?Q?1L6exqoRVIXdkY9RUr5YcmPM6PGBd1T5iO/W4Uv1jHnNAjq+2ykn+LV+eKM4?=
 =?us-ascii?Q?SzFdc5WsXj4owKqG4U1Q18HrHCN1OcQz+6lLKfemNfiZHECrdEkBQSY6svDu?=
 =?us-ascii?Q?d/b0fwlVj0ItrpgrvUIo6Y9eboZxhoDo1fUJczCDHP4Y5yMN4qN2iXndgIBI?=
 =?us-ascii?Q?6jqojEBgs4zACOUWz1VSswdfrujc2RoT5jlmoXxaS1bAQGd+xDVv9XnHhMsJ?=
 =?us-ascii?Q?lnjfO5a76d9+nyAKl6+JsjKuXl/x5kNzWE2nKm55IxcppINmpmSn/sRqdmnn?=
 =?us-ascii?Q?8/RhiPQQlIDY98wmhD/nsV9m7qXgge49bEPS5MyDAbiHqFUVE2Pi3TT0pfIu?=
 =?us-ascii?Q?kK97ibm/YxvZOd2HavJIeU69spuEFQCQ1dD5uSn8KTnRF+nh3QJyJ2HV9bE2?=
 =?us-ascii?Q?xm4GRujUJ57+gJQJR6HaroJ2lGAAS6boR9lwCxBS8ScpSZ7Verf40Bkk43sT?=
 =?us-ascii?Q?mVpywLlfeYq5xuiQgtiO0GqZJFjNEp8gFm9HFji6nW4kdJWqOoJDcOxavqXG?=
 =?us-ascii?Q?Xa+vixOLMYNGo5v2YgQLqgbDIYDhWP7sicHyR2Jof4waVYPJSYPZJQhZjIOm?=
 =?us-ascii?Q?kJmayCmPtS19TARHc7aB0+SGVqPdm/Ojy03yG0oC5MFMjDs6ETOMa3bhK7F3?=
 =?us-ascii?Q?D4n3uj+qnKIt9GybAqFnlJR2Uz/yqUkHw6l3PydnpEoF1n1aBJkTgmjzmG63?=
 =?us-ascii?Q?+gRZvInbRK3398G25FLqnj1A6AP1d9alw4X0jagZ7XdbtWBvLVkRhkPpaP6l?=
 =?us-ascii?Q?+td9Q6CnU+20DHhyTdHJZJ99f/8Mqc1a0fdbeQSqmVZN+6bYLb2NX1BdoMJK?=
 =?us-ascii?Q?TQapGkRdlP9eUb5XG984idwmEyBm0on9PzyP/u/IJV5OmsjG+yb37inSkVKv?=
 =?us-ascii?Q?6a/v4gas51BJkZuewr4cViEh3BV8l1aslbpIcneEymS0TFm/PvPXogS2Uzlp?=
 =?us-ascii?Q?ZbdsrQuh3fG0kbOhCxmIm8+CwD2fZza5L2MfSTUeG+gbkc7GB+Up7HP7bo2t?=
 =?us-ascii?Q?KFIe+gDcQhqsf6ZpFpWNb0CSPzd9zSTKCIUf1ttPSjesREQIGI7yQs6yQRGX?=
 =?us-ascii?Q?L+Q=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?/1gmaTRkeFsYRczPRAjBxlx2tBjGjyofSt3nCvj4J4LifsgXFKUKpI6wATMZ?=
 =?us-ascii?Q?osctgKV6G5vcuJUix8mzhMI1LL/SC4uOs03CYXL2juQSTlXboipo7pot6hTV?=
 =?us-ascii?Q?5DIttFOvwRYPVovNO7sIJPiq5rT+oAfw5ZVwOURn98IYC3hXrpuCgEB/SraW?=
 =?us-ascii?Q?v8CTTmS8zF/Gd7so3zf0tNWUMSHv2KD5osak+4ii+1bTJMo6NQDxBAXDA1Gy?=
 =?us-ascii?Q?32YnGGUPAqs56QMY/BxVsZGmqzjToNnw1V0RWiRo7kXjBFB7OBmTE+IhTxS1?=
 =?us-ascii?Q?042QQsStwAunSQDf9LHehyHmKE1ZLG9dxUCbXnvQVqd+oX6kVsHsbSou8Ngs?=
 =?us-ascii?Q?iB8E8E9KtEJZZAOv+ZDfgGtI0HYgzO4y0Ez5BYsokZC66YVnKRn3YAdiNoMs?=
 =?us-ascii?Q?VheaZC5lAX7XhWngz7tgzvfbZYIAdBPxiXEVAsVP47eFeGCSWeM9OyThkzXp?=
 =?us-ascii?Q?7nCK1NnYJcx1EaWKw31cXjNl/79mtu9iIq+cK9ZVY3YoMvXsSfXgLKy6g9H3?=
 =?us-ascii?Q?mhrCsku2PpYfp8fwNjGALq+luMt25NsGxZsCgEx87CZkEU3J9PVK4VcNKgHo?=
 =?us-ascii?Q?uRW0jDc0fRaitp7Ed+Af5TfpYDhNmioJoiKrR4/vZVIi4hACrnB4ugKIyLM1?=
 =?us-ascii?Q?xS6W8XKaFLjsDP5YSdOn63nLwW7jpyDcQX2XtEY8+ksMEOqwmTQN8Ad7pBcx?=
 =?us-ascii?Q?jqoTCHIpSwdpnWlDi9fpBZDkaiVpEeAGp2mWDT/pjiZBlar1dKhwk80z0Qzf?=
 =?us-ascii?Q?sL7O4+PlN5MONCctarcju78FsrrHhAwlE8dERURZmvWZeEhw/vwPs4J2OEZJ?=
 =?us-ascii?Q?7M/cExeoLEKQWJ3TaLcSzvKEU7EQthwA6lmwh1YHjeLhHl2q0aNu10oCOyTK?=
 =?us-ascii?Q?DmPv9XwHgDeZyn8IhI5un8V5odcIEma+03G4skaAf0c1HC1i/JFMLWOWhai2?=
 =?us-ascii?Q?Ij1xQaUCANb92DX7C8dT0v9fj+EwtNoZ612eEfkJpeOsnb+jO8LJ/ea/j289?=
 =?us-ascii?Q?W8oKcx1KJrXvhJt7GpOpQFUkqdTYRaXofBbYn2ctDAQipjbjeHFHnFWpS0Ew?=
 =?us-ascii?Q?jWm4DtMmwh//+W2Te9T0lUcRrSeWlZzu43cBo0rSUPNsr7KLkyrDG1kmme64?=
 =?us-ascii?Q?0Vtm7BkCZdtAaU9gwM7R1kYxCNUVyyvFXhO8sKJJCuCi/u86TXOeNen/ZczS?=
 =?us-ascii?Q?fmVw5LkSdYKHmM01A3A91ppHO3suzWMKeP7jb/Gjn6OcB3kYVLYG6wdqkWkg?=
 =?us-ascii?Q?yvAS+o693x/0+LyjiAhPZ0u9MHeZkcUu8ZWSH9XmlrYG3AHAitIjwZRx5oTf?=
 =?us-ascii?Q?N4q+t8Sb8eGNe0g7wlktlNdib79BKm0/HqaK17YFi5Em1+QdCRU/OEITE4vL?=
 =?us-ascii?Q?hpNWKyv9LfpnRZ1Ww0d6/PEan1Rf9igWc+IInV7c4iJL4Qk9kqkB3nA2bKqA?=
 =?us-ascii?Q?7dpuwQtLq/hiPAx+PHDPIYJW6Tk1obTNvMhCA7SqHorVbkFziyBIhvDwyjPm?=
 =?us-ascii?Q?QBxg6w9vmBtEABQWVCkdtFnzF+V0DRfEwK62cq1ZgatCaeL8hzmbszmB0idH?=
 =?us-ascii?Q?SvbbYPnCgzkSLGII9jS+P2MO6SQ1fQvEsacOoM4hhdQ+J6TnQ7cY4/ErC2l2?=
 =?us-ascii?Q?BORAdv4igYL6osH4lpAuWBwF7xGZ8VXlkv4G5sH9a6Tn?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	t/umfLQLYUJ47qPXdZbXL8eWpnBEa79qGdB4dXGNL2z9QajYFk2A7vSy+cTmwRrTHb3Hh8wdAwhiKFHv59NCJ4J4unhlr91YUcvkMfxJChmI7+eE7vovO6EKA5uLvCwXIzwNh6Pw7S7JAao5Pz+fc535TUdgRnGKwl/Kcx2aIWlZtJs0PBFx2Uya1x/wkYo5xVFZjNjTligIK0j96ZjHxFzRy3Ukm4eXjlfMf24uzzXIbLQVBlfUhaPF80J5hMIEHwUU0cne52GoIrTeXsgdzbOPv528PlXLtsvs9JRX8eq7pszYFrVmGdliuA3wxQFp3TtuXNmNYa6VByXqtYVhRXRUd4+DlswcLfrFk4KlMRFl75UYqCp0ybvlY0Risn/D+QCO/p/cVZQqRHa2YvP3FDxP7imFO85vIhf+dCqPamDBYeDuy7LPf9eEvU+WEYAeVwSeDvxcXuK8ZSJxDk1GYMfhKx0NkBsTnxI7A2n6vnFGBMRiipaNQDJ6vr+hTb4Ixlo7HsaArEks/eJAv3V9VXu539E9B2rutUI+np7aJuIfjtwbVYsp0kLlv0qDBm0wCIW/P2vJJfJPCs4Xp7glLtZiWHmOc+kJzACY03dfi8k=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 4b77802e-6c43-4c56-ce3b-08dcd1f00566
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Sep 2024 23:26:39.3885
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: qP0C5bumBRgW3szlCIYUVxOYyUmT5sl+1UMV6DI2iCJP4xvBBGWTvurp0lfT0mlPRknM7ZkfS7TH5iC1kc2a09BOrQ5thsndMr0kjId1ON8=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB4866
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-10_10,2024-09-09_02,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 malwarescore=0 bulkscore=0 spamscore=0 mlxscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2408220000 definitions=main-2409100176
X-Proofpoint-GUID: G_v233m_qO0CggR5aHRFWqg0NPk3xCgG
X-Proofpoint-ORIG-GUID: G_v233m_qO0CggR5aHRFWqg0NPk3xCgG

Hello everyone!

For those attending Plumbers in-person or virtually, we will be having a
BoF session where we can get together and discuss debuggers. I'll have
some interactive demos which should be easy enough in case folks want a
quick and easy way to get started playing with Drgn, but really it's
just going to be an attendee-driven discussion. So please show up, bring
questions, ideas, or things to share of your own!

The BoF is scheduled for 3:45PM CET on Thursday (Sept 19), which is:

9:45 AM US Eastern
6:45 AM US Pacific

This has the nice benefit of avoiding the Toolchain track (Wed) and the
Perf/Tracing MC (Fri), but it does intersect with some of the BPF MC,
somewhat unavoidably.

But these times could be subject to change, please check the below
listing on the LPC schedule in case of any changes.

https://lpc.events/event/18/contributions/1982/

Looking forward to seeing everyone in Vienna or online!

Thanks,
Stephen
