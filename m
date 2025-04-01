Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB3FF1DE2BD
	for <linux-debuggers@vger.kernel.org>; Tue,  1 Apr 2025 21:01:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743541302; cv=fail; b=HaylkjFx99J9MUDuaiPq1Eo4J/cNtOF4IUa2DS/oib+WW3o98bKbgpHTIrfcrDV6C7Jym8EnFwyBvVjcrUPIH/1emofVTq/M3u82XWDUchCXvIiasImrbp7gA80RnpTeD9ksEDOvmlEdot8yB74dqTpwUBwuQRjdtc3W9XKw/sk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743541302; c=relaxed/simple;
	bh=vTQl3ON4dhYEPZLUu5DUhY35a6ph3hz7V+oeyBaqZlw=;
	h=From:To:Cc:Subject:Date:Message-ID:Content-Type:MIME-Version; b=h3UEGuEy8dZ9H1evYY+qA6qcEYFJ7/1xbAEt7yDHN9OTmi+6HvLvM1w9sQL+0z3DM9KkXCKPqVzxBXYEqrGWFHH653guNuXMm/G72FyH+bNBBdYU/CGcMbBkO8OS6TjVyMud6L3T112wchogsYIn2WYE0X/rCu/I15GHpibctog=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=JtC1Ruve; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=iQE5Xnkw; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="JtC1Ruve";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="iQE5Xnkw"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531IJt9C021250;
	Tue, 1 Apr 2025 21:01:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=corp-2023-11-20; bh=//idLO4VOx7t+ykw
	LRLKi7WFFwY1AW8Frl6rWMwCkDk=; b=JtC1Ruve3D9CaBcLTuoV/pHY3DHBm5PF
	QUb0exm0U5G7i44Bbx45BfgL7FnoP2Z+8iXEDV7zpLiWHUKDuP4VQe43stKjMVnD
	EMpen8WVIyT3HtO2J0zawP+J2lm5axesO4Dt3OXyr2+aiBxVHwDXo+aJCvAYpXeO
	2GsGmFo8sdWhyGPrqEi926S28Nnfev+JXi8kB83u/UuJtVTLSFGmxETs2H5ZizCA
	5RnyQ2v0av0MaWYTRlfB5OLgT3Wf5Wntaip08eWXFFnpQwA31LWC3VVdDw4DTYjB
	M8X9nqEQ08eNjy+JJa17XFOiQVjOuYT/N34XEJWjGv3nSqd95fOnvw==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 45p7n29f68-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 21:01:38 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 531L00lt010697;
	Tue, 1 Apr 2025 21:01:37 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2048.outbound.protection.outlook.com [104.47.55.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 45p7ag0hcc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 01 Apr 2025 21:01:37 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=IGaOTH5ar2onH9EmhePbVx8a0caYjaARLE8XbrHy+8QMuN+Xk21LejHl3Ir4J6KJH6bzMpbflOE7ubJ7pzwl5hIqsXE0FLi8jQH7INQH5Gxq1UltRP6yiZsmZQZfUrWssrcN/d3Jmo6/qyQXCwDTD/xDIcyUeWGgikZXl+5HCGlxNiZsZE/MULAr/184D9JBVi5yAdLtFiB3Ec160EN+Ujmw4WrgK8arQZETVTU0RiA6erZy84WA39+HQHigEVxB3A/u7iKo1i+bQFT7I5wNV0KhKO8kSclpXTPtCX5e6IU3TTqWKn6qAO0k9p39t1OfrI1iY/c5N82ESdFWifqugA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=//idLO4VOx7t+ykwLRLKi7WFFwY1AW8Frl6rWMwCkDk=;
 b=w/IxDBCqeihomju3Klg3KCNHJtp35rO784MntlRrUe+R0xOxnJ318KpGOgsz4fEk5kyd1mMqlc7i538t4eqf88Y9tefryN1Tr7nQu8R2dwD3FQ7UNJAcgqlaMrE+WhyJH7bycBGFd62sr5ANM1aIh6kqvra8i48twc5S3B4Up0XQXaJ+pn/9LacPGpPlT0qTnmiJgaK550gO9d0J0eTpewR6oz4zCKnULMU0kn6KGWwGuasN8+O0TPMhoZ63yOLDkXZcl8aFLtj2GYkTHyxgy0owNs4HijqZw9E3IazNn8h32bKu19eW7wg+XLtbe58qzsQeAYPYEYH9oD3uURU11w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=//idLO4VOx7t+ykwLRLKi7WFFwY1AW8Frl6rWMwCkDk=;
 b=iQE5Xnkw8i/SLLpY78xbcItf8HhT4F+k0omD2WThhAVkQ3whBNFS6WOU6fRlsnUG0BUj+NeKOgjYmUpxJN81KSxILEC/5X/n3dQsPQpx3x8JlYpKSqlUXEEPA3itkMRyP3Y/h3eXhOisE0b/cUqCUq9+K59FBCd826D93XtbFuE=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SJ5PPFC41A007A8.namprd10.prod.outlook.com (2603:10b6:a0f:fc02::7ca) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8583.41; Tue, 1 Apr
 2025 21:01:34 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%7]) with mapi id 15.20.8583.033; Tue, 1 Apr 2025
 21:01:34 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: devel@lists.crash-utility.osci.io
Cc: linux-debuggers@vger.kernel.org,
        Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [PATCH CRASH] Fix module section load address when sh_addr != 0
Date: Tue,  1 Apr 2025 14:01:29 -0700
Message-ID: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.43.5
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: MN0PR05CA0026.namprd05.prod.outlook.com
 (2603:10b6:208:52c::8) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SJ5PPFC41A007A8:EE_
X-MS-Office365-Filtering-Correlation-Id: 89d31e02-b451-4a8e-ce2d-08dd716062d6
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|366016|376014|1800799024;
X-Microsoft-Antispam-Message-Info:
	=?us-ascii?Q?QkeedBjupOsNJgvOw33o8FpRRYcxC5gn499LgDhum1eUfLhKXSETOHztLIVI?=
 =?us-ascii?Q?q06P3friYFdLJ1OGup6ITRs0D8peKopZtumAX8AN2lp/qC1v/J+Ax1ZkE0Z9?=
 =?us-ascii?Q?67BRnivvn6MjjTEoq3xvYFZaP7i8lKTF2RLBqKS+T0xmS3Z4FBJyQMwes2VR?=
 =?us-ascii?Q?198pWhPCmcQj4KkSIJOWcQ7OrUsb7VLh0yplzplTRm2xjxSn/uwz5RJuugJw?=
 =?us-ascii?Q?EbHnHS3M8/rJjKkXln/2wLYaatU5PfJFxV/2d9cNrSEEdIApAzqGVC/qv0Xe?=
 =?us-ascii?Q?Z/BzL0DXjQz+5p3WY9bdAG/IjJ2S7R73AgrtOnjZvBzY2pRfBg1iWZSge5m5?=
 =?us-ascii?Q?GNaKaFzaRCov20edP+OUERMxSXqFmzMUFJNnhFRjUdDvMJ8kNwapdZRhxa8S?=
 =?us-ascii?Q?4/xb78lYgke6RK74+Qe5oRk1YcxnoW/z79oMXKMjabfLtOAZV9j5uf3DPQ+r?=
 =?us-ascii?Q?nSurUyF17YYVB030zb2qbP7qXmGlmv5/y3vRXQmsLsOyZ7/M8HKepL3MfaOS?=
 =?us-ascii?Q?dQtVsjL6i3Z1RfcOGJblakvPDY6Sf5uVzTK/phiWuYjOunFEE83d4JOqS7+2?=
 =?us-ascii?Q?C31f231eNfdfP9NbFqbstCQw1jCf9onXyWCwo7Ezh/b904iQVnHBGrBaa1fD?=
 =?us-ascii?Q?UAlQmJvTw7Hh0KPq2gOfN7U8FAknMKALCeSAyt3CXAiru1KxBFZkhmasCD3W?=
 =?us-ascii?Q?LZ85/GWSDYdfs9n/RvkY/kLSc20Og6RFqDKmIltQF41ZW9ZVoNP3Xk3biOw3?=
 =?us-ascii?Q?fRLMIJgxDt9Lc9IOh6QHQ2db61mzEhS8NDD74bWKbNca/h031+NBEl7FyiHR?=
 =?us-ascii?Q?m0PMoHpqFjA88hBITS79orJuA/zAjgCC+OYUsgMUi4oVIB2jn7Nrl7h8T1Bx?=
 =?us-ascii?Q?kE9iWEISnbqNs3FV3EXhLTUlM/Z0SDXvtjae5lXZKwGeLZeWaAGRWQPhIZAa?=
 =?us-ascii?Q?+xhfsIWUDfatzi6otjCJCYDXyBSnPXvS8wpkEhOQ8v9tYQ0WIFCCwXuwtdOO?=
 =?us-ascii?Q?l4hEjsm27cWSljZWoVxNMe/CYCmnKMFHDrNPfsWO45FI/ERqTPu3b+WnPoFc?=
 =?us-ascii?Q?ZQpZL1v79U5Bf9HaN2JFX/8XK6OHZRLMzA6yoIqQgvn1LM967SVp6RluXTj1?=
 =?us-ascii?Q?QmeNFGUjulX93xj8UCKlEvtvb7+HCMnB3G5m4osYXutwzl6NpgXrnAJkgb6D?=
 =?us-ascii?Q?sA/QUP7QoAHGy68gU320PPBFAbmT8Hhv6dLZlGs2KpTLFWveplwngRG+blaM?=
 =?us-ascii?Q?xZ0AYJ3Gos3RAAlqyK5jgwIvJDOPOejhPpKF6gZwPJCl0+7Tzo1ckqUidalu?=
 =?us-ascii?Q?LOVhwpWdXGytQ6UWa6dIYwLgzYLbAY348Tf8Gnn2Tk00IZVYAsThaBZOJs40?=
 =?us-ascii?Q?5ljLWYjpBIwDYt+L2cAHYjUtFBG4?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(366016)(376014)(1800799024);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?us-ascii?Q?olXx6xVKOgfcswqCgxThnHgjIURDVXld2marFcgjF2Xid7Juvh1QgihH32G2?=
 =?us-ascii?Q?aHFhcmInbimjrZqwGTcbXAVthEJtvEtYjdLBdW3PwDbGSiZdSdTjM//WbuPs?=
 =?us-ascii?Q?ilUuSVeg9CMkYEHI9zeWFBofc0WTyommZtA0Z8vONqUCRa9igf0nxgdg4h4T?=
 =?us-ascii?Q?z3uGjAc+wZMrEQWrCpJDqNIjC91YslSxYc2x6NFErp2cdNiZg1cG81ar2WBb?=
 =?us-ascii?Q?C88c/yAxnLb7g/j1wclFrn+hL/ZIncnoy3qPQSOX1dKIfhIM+G9334Hyckn8?=
 =?us-ascii?Q?So0Hkl2sJvDz/G7Pp6MLUlmUFQ1SqHQaevx00rgKnxdWxa8uWFUZidmA1w/p?=
 =?us-ascii?Q?j/Q9ANgE2tbB0+YTOerAACdm4jwGTvjOhqVrnO2UYUv1C5h1QuBadch5m1om?=
 =?us-ascii?Q?+tjAKJDj0yyJv7YRUoezMFsEHJQsx+k7Jv9wXyTr9XDsdzMQbvcqWpfAmtZO?=
 =?us-ascii?Q?IiromiC95BC/qwgzZgT+77NCWMxSUCPNCRGsiGpZRmGuFRWBrWgscYj+38RQ?=
 =?us-ascii?Q?77Oa88/RzI8YXHkJRPH554i5R8guV1HJQ2/kQWwUv7Kau5rrwSptqkSKELNi?=
 =?us-ascii?Q?4c5ZG3FWQKdTXEjJEFizmEjluOI4lEfwTwPACOBczeAQcub6KO8AXlh66QkQ?=
 =?us-ascii?Q?6i54lC5uN1V2nWZQ85S4fKDbcZgJPyOXpH8RafLupT6NjSgDrV0AMH2l1+st?=
 =?us-ascii?Q?HJP3EW15IDfC4Xr4Mt4zibKm3acb1kOAoSAz8Fle1HQOxvwYOwBohl/of6KR?=
 =?us-ascii?Q?9oNACYJq4Fupk07jZHRYwcTyiwu6ZsioST+eHt6sj/X5jcNWArIFtHDKySaO?=
 =?us-ascii?Q?yCtNK5Fzx2HOMWQIDnsV6nWdrCWOd8daI2Q7iKbFVMEbowGv2/g1nYxRPnQi?=
 =?us-ascii?Q?F1UeD5HJQpVM8yRXZU4GZUk5rKtd1qyo2go2tm5G17aGXBrdQm7vc19OFKxE?=
 =?us-ascii?Q?evtZT6PH6ORizhDB9bIfrR4N9gU6uQoc+duw488Mu32sF1Wy+ifn4ojNUltW?=
 =?us-ascii?Q?ZMGfrht2kEUrWj2XvZuvk5qZ2SIx8R4tecgc46c2mPKBIbAwDRr3yUD8Ffq7?=
 =?us-ascii?Q?Y3HatHaJICyOHTPF8HemsC7yQf8GW/WDab+Qz4XecIRw7LET9GerdZUYyxOG?=
 =?us-ascii?Q?q7Wv9GcGv5wrx78wj6hrR9lvwAs8cWaZ+crguWjGN7yEgLu7N0ulVKXBocS2?=
 =?us-ascii?Q?VWmG7+yBrKkEaIMIV4CazDxyZ85LxLm69cGaxpbWZL5aW2RHZEbv4vHfTMoq?=
 =?us-ascii?Q?ucmVaFHJDON/+wjwv4RA/T6WbSw3itx85as4XgXqUDMWwOZD7cGe4Qw7OWOi?=
 =?us-ascii?Q?jkO9QbvOxD8GlQBDz+bypXnqSWrGSxpKKKDBPDEtykJ8rU3TMFEv19RJEVWF?=
 =?us-ascii?Q?wjjV8xqc/nQqqp3PP8CVSeu98DOH8093ewIB4UtAgswHOZLyZeEsETXHZBTp?=
 =?us-ascii?Q?nFIRcjodKkQ6qHRQu1lquIjiGlE7GdGX4WaW/NcntLvM+pdcS6Xwa1TuJPhb?=
 =?us-ascii?Q?TJQZDa8oEmE775+1MQltrQ+oD/DSSIIp2/5Xr2JCxrav32NQRhYJyve9O2zp?=
 =?us-ascii?Q?rUEI3O/9XtPTjkxwckb7nE/gHSD/J1TdFOq0NPlK2h59b7LSYk07uBwvaOco?=
 =?us-ascii?Q?1w=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	VguE09iixON1mO5wl+ySSwUjy0UWu5pEtFPchHeqNGlLR+D1XLAZJpZ8fKc+rL8Kr7Zr+rPdBFUaPYbR1Wcoklyh68eev2jaiEOvP3ZIVm3c305pB4vdwumjW+DIBffB5tuVaNkGOxIrKxYPAFmfxOxPHpHSQcaKQKms3pAW6Wz/GqdQ500nft+JFdAcnas7ZsO+H+hDe1N6J/IzSz1L+dx/BQa0wIgOVSbl/NXUOkF3ko8foewK/rGlrH7dTEcLaUE5ou1Gh9BYSQvyb+XgFDfvuhLFl9UO9F6iq+4mswQrdXXlKCcW7saDSKxD0Rb0sd3ceBZ13mdh2tKVCWRIl/Lnh2V1Fjhyo/EFcPo4hYNFxWzNKoUTLmPGU/TtO9khri0kNdF0H8/pXJU8TSnhiL4DbX3FmNTQuAKPv3D1Tx8EwMh6daCvFOF/X/9r7jLl/1V7t2H1XsrSkisnSWPX+rnAT++lkgQhhmRe047my/6FDjMTZjtH6rcfohYnPHl0E0IjsZl5ySfrNpGzi/oFd5n9DUMgbLrVuY0d1hiTiZII/bkeJYi3MftaPLfyPfitiqtMwif+SzPEAJA8TI9lHe7zwqy9ux3FoVj1g4inFcM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 89d31e02-b451-4a8e-ce2d-08dd716062d6
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 01 Apr 2025 21:01:34.7565
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 66akq59XZQMg4SBSol7P3/21XHVPpmwpjn1/Tv2moTxHXf5GGSka83RCDaEB4mIIL5nOlK+6W8UF7ssMjePzFeSpAmZsok/g2xjJdghyYLE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ5PPFC41A007A8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_08,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 suspectscore=0
 adultscore=0 malwarescore=0 spamscore=0 mlxscore=0 mlxlogscore=999
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2502280000
 definitions=main-2504010128
X-Proofpoint-ORIG-GUID: uNCRyJnfl7q4Jz05yTLy9tJ8ulkck3e2
X-Proofpoint-GUID: uNCRyJnfl7q4Jz05yTLy9tJ8ulkck3e2

A user reported that crash was reporting the address for certain module
variables incorrectly. I was able to track it down specifically to
variables which were located in the .data section of a kernel module.
While the "sym" command gave the correct value, printing the address of
the variable or expressions based on it with "p" would give an incorrect
value. For example, the variable "ata_dummy_port_ops" variable is
included in the .data section of libata.ko when built as a module:

    $ sudo grep '\bata_dummy_port_ops\b' /proc/kallsyms
    ffffffffc0a71580 d ata_dummy_port_ops   [libata]
    $ sudo crash /usr/lib/debug/lib/modules/$(uname -r)/vmlinux /proc/kcore
    crash> sym ata_dummy_port_ops
    ffffffffc0a71580 (?) ata_dummy_port_ops [libata]
    crash> mod -s libata
         MODULE       NAME                      TEXT_BASE         SIZE  OBJECT FILE
    ffffffffc0a7b640  libata                 ffffffffc0a47000   520192
    /usr/lib/debug/lib/modules/6.12.0-0.11.8.el9uek.x86_64/kernel/drivers/ata/libata.ko.debug
    crash> sym ata_dummy_port_ops
    ffffffffc0a71580 (B) ata_dummy_port_ops [libata]
    crash> p/x &ata_dummy_port_ops
    $1 = 0xffffffffc0a6fe80

The symbol value (from kallsyms) is correct, but its address provided by
GDB is incorrect. It turns out that the .data section has an sh_addr
which is non-zero. The result of this is that calculate_load_order_6_4()
incorrectly calculates the base address for the .data section. This
patch fixes the base address which is later provided to GDB via
add-symbol-file.

The impact here is interesting. Only variables within sections that have
a non-zero sh_addr are impacted. It turns out that this is relatively
common since Linux kernel commit 22d407b164ff7 ("lib: add allocation
tagging support for memory allocation profiling"), which was merged in
6.10. That commit added an entry to the scripts/module.lds.S linker
script, without specifying a base address of zero. I believe that is the
reason for the non-zero base addresses.

I was able to verify that, in addition to the Oracle Linux kernel where
we initially noticed the issue, kernel modules on Arch Linux and Fedora
also have non-zero .data sh_addr values. This is likely the case for
most non-clang kernels since 6.10, but those were the only two distros I
checked. While my reading of the module.lds.S seems to indicate that
kernels built with CONFIG_LTO_CLANG=y should also have non-zero .data,
.bss, and .rodata section addresses, I haven't been able to reproduce
this with clang LTO kernels. Regardless, crash should properly handle
non-zero sh_addr since it exists in the real world now.

The core of the issue is that the symbol value returned by BFD includes
the sh_addr of the section containing the symbol. For example, suppose
a symbol with address 0 is located within a section with virtual address
0xa00. Then, the resulting symbol value will be 0xa00, not 0.

calculate_load_order_6_4() computes the base address of each section by
using a kallsyms symbol known to be within that section, and then
subtracting the value of the symbol from the object file. This
implicitly assumes that the section sh_addr is zero, and thus the symbol
value is just an offset. To fix the computation, add in the section base
address, to account for cases where it is non-zero.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 symbols.c | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/symbols.c b/symbols.c
index 5adbc30..e30fafe 100644
--- a/symbols.c
+++ b/symbols.c
@@ -12808,6 +12808,7 @@ calculate_load_order_6_4(struct load_module *lm, bfd *bfd, int dynamic,
 	asymbol *store;
 	asymbol *sym;
 	symbol_info syminfo;
+	bfd_vma secaddr;
 	char *secname;
 	int i, t;
 
@@ -12860,6 +12861,7 @@ calculate_load_order_6_4(struct load_module *lm, bfd *bfd, int dynamic,
 				}
 				if (strcmp(syminfo.name, s1->name) == 0) {
 					secname = (char *)bfd_section_name(sym->section);
+					secaddr = bfd_section_vma(sym->section);
 					break;
 				}
 
@@ -12890,14 +12892,14 @@ calculate_load_order_6_4(struct load_module *lm, bfd *bfd, int dynamic,
 			}
 
 			/* Update the offset information for the section */
-			sec_start = s1->value - syminfo.value;
+			sec_start = s1->value - syminfo.value + secaddr;
 			/* keep the address instead of offset */
 			lm->mod_section_data[i].addr = sec_start;
 			lm->mod_section_data[i].flags |= SEC_FOUND;
 
 			if (CRASHDEBUG(2))
-				fprintf(fp, "update sec offset sym %s @ %lx  val %lx  section %s\n",
-					s1->name, s1->value, (ulong)syminfo.value, secname);
+				fprintf(fp, "update sec offset sym %s @ %lx  val %lx  section %s @ %lx\n",
+					s1->name, s1->value, (ulong)syminfo.value, secname, secaddr);
 
 			if (strcmp(secname, ".text") == 0)
 				lm->mod_text_start = sec_start;
-- 
2.43.5

