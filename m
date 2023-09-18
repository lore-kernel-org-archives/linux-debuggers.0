Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B51D4CD3423
	for <linux-debuggers@archiver.kernel.org>; Mon, 18 Sep 2023 23:32:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230099AbjIRXcx (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 18 Sep 2023 19:32:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34602 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229690AbjIRXcw (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 18 Sep 2023 19:32:52 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1DB859B
        for <linux-debuggers@vger.kernel.org>; Mon, 18 Sep 2023 16:32:47 -0700 (PDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 38IK3pCC005717;
        Mon, 18 Sep 2023 23:32:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-transfer-encoding : content-type :
 mime-version; s=corp-2023-03-30;
 bh=Pm3vFC+oJNh3bjILkrO/d/tisJMQHSBfJpzsYE385mc=;
 b=RzNlop28ckk5MzBk4hfBuiEXrgcvB0NKCLzDDIGZfq3UmikIcvMaBzjWvHretOHPsfvk
 xXE8ZODIDfDUGl4G/QaPj7SHOF7d1IkwGuQf47WMxqbNeOKxELSWC6ULHwdxb+4RMTUu
 CU3e+MFGNp24uT4MuoNCYEutanyu6RhMaxCCeI5iLN+cbCw6IlUtdde/xiFfbNspcC0a
 fjpkg1ZvProgo5ASX+TKnCSebHmXY74d5s2alqDObmBU7hw246wKzFepb8+1612Dbyxn
 +FD/fnxKGRWXDFRLOeju3PMH6aL3+KUbFje0GoQoTBkjESy+WnZCD4FYBJ4lrzxPHc2M KA== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3t54dd3nu1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Sep 2023 23:32:39 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 38IMTYPF012290;
        Mon, 18 Sep 2023 23:32:38 GMT
Received: from nam02-dm3-obe.outbound.protection.outlook.com (mail-dm3nam02lp2045.outbound.protection.outlook.com [104.47.56.45])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3t52t55yy6-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 18 Sep 2023 23:32:38 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KcliI1mRbTf0We1HOHc+xDdrkMSTise2Bk8kkGLQimirbRrfYJeXRh61hzEPwi6wh8ChZuogkDVX3fidyi5RV8nA4RpA2V7pMtugUgSYDz34G0XDbgFv/Mckxv0mvqiJlavvVo6QZC50cK7pPptpALHP8BMtW0xwMkwvZrxFD6kJukmBZJyufnO6/doVhwwpdWfNwNrx5ZN/olTxgrqv1VRImyBQWRXAf2peoR520nNoOUP6H/rNaqCZyr/oxRLS4L1849I29s8r2iEGMtxYKjtie/QH9JPs8PNxy/2m1LXncjAmPAdITK4cH2ihQm6pKR1gv5q5lH76W6r0nHW7gg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Pm3vFC+oJNh3bjILkrO/d/tisJMQHSBfJpzsYE385mc=;
 b=fZaKx+L6bbTbU132X6hccUUR7ZL3ADnQS4JvRmm/FIJ/XI1Z2G9o8HSTbxTwy+0CVM8sVCoAkkHMY2/fO5WkPl6+51E5zIf/zx41OSF84Ho8HMJqZwkwP86TP+gUBbliXFgtNOY83rBhMdJphpbn81Q0NPOnKcJDRRoKuvCjTGiRJhWBEi0r7o7ZS64aOevcEUaChaiBKkTzD/FEsiSFN1y7Id2KEXcgbHzYqOrBBsCdJQG2mdHtlSugSBbOuPcyJwnqkXRt0kUmwsBtLONLTWAVR4KDZLAS9PapDCMNaZXJU2ERNga30gnlDV7NXEad3QRIS59V22hXaKRI2X38Uw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Pm3vFC+oJNh3bjILkrO/d/tisJMQHSBfJpzsYE385mc=;
 b=NZvOBGbLPIjNwi+d6Bdcoi07imUABrzIxFdi/9hyFN0sHqTujwEFJhxaBuqCQwKhgv2ysgG8gpNVfk7WWd+plcdMthVhic3i/uQxRMib9ooTx7Pztje7pZSXziXUBbhDxx3OVK8mrz3iTm82gFilP+5sxXQSgInIWe5Kpe8q+0o=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SJ2PR10MB7758.namprd10.prod.outlook.com (2603:10b6:a03:56f::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6792.24; Mon, 18 Sep
 2023 23:32:36 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::35e3:7e4c:72b2:cf74]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::35e3:7e4c:72b2:cf74%7]) with mapi id 15.20.6792.026; Mon, 18 Sep 2023
 23:32:35 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     qemu-devel@nongnu.org
Cc:     linux-debuggers@vger.kernel.org, stephen.s.brennan@oracle.com,
        =?UTF-8?q?Marc-Andr=C3=A9=20Lureau?= <marcandre.lureau@gmail.com>,
        Omar Sandoval <osandov@osandov.com>,
        Thomas Huth <thuth@redhat.com>,
        =?UTF-8?q?Daniel=20P=20=2E=20Berrang=C3=A9?= <berrange@redhat.com>
Subject: [PATCH v3 qemu 0/3] Allow dump-guest-memory to output standard kdump format
Date:   Mon, 18 Sep 2023 16:32:30 -0700
Message-Id: <20230918233233.1431858-1-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.3
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0333.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::8) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SJ2PR10MB7758:EE_
X-MS-Office365-Filtering-Correlation-Id: 11373db5-7686-4e8d-d7ee-08dbb89f89aa
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: fUJxmyv09jchGw2EiETagmUxn8rLXHaNe56ccC5kG71UDoUH2rHoSay3Upm8KOL9k/pmJNUNSi6h9cts/5mo3lAX8LdTqAbsyXH8YUMjDhlqI/9WebCN9JRmiElBKEa4IqaAr7CLhLXu/6+1eeLCBqcq74/J4ZxcLOQssiAoYcWeRh4uBDZQYnayJccp8paIlwBj6U5/0UPmmu/jut9qPSM1psOxTX+7BVxQyr2dMRsuceoIxzGatgEgWkcgGhKB3i38WLoHvbQ0NvKsc520reflqVoP+1t8nIAb8w8WaDqlFExRmPqNDPmcLcgUrw3gJ6Bb2Z8/rd2NhzWLNy7bYFfbc1RsRFG9Fe2RyraODGIfHLZPalYQi/+LrJ2qRwcLnhisMUHTsp1kMQzG+nz81xkqwEoGv8Xtfc2SwIgTIAg/knZePcCkqHpgf3EaxGvuiKKOg5OEBoZqwuOD5+yvNPhOVTzE955WIZcM25AyQnKV/xwEEEBBYmp73ThAFMhubYLQ09COiVtDD+4YFtRf4XBVmVvaXd8Ic8xqheR0NFZBdK800fQlmGGUrTTDuMsHAoX2T2iBHgym5Ppbwbu+/Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(39860400002)(136003)(366004)(346002)(396003)(376002)(451199024)(1800799009)(186009)(6506007)(6486002)(6666004)(103116003)(86362001)(38100700002)(36756003)(1076003)(2616005)(2906002)(966005)(6512007)(83380400001)(478600001)(5660300002)(316002)(8676002)(4326008)(8936002)(6916009)(41300700001)(54906003)(66556008)(66946007)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Mel3fJ7Tmc5MsQPgGDDRULGmRAyLU9Nj2WsnZHZD8AQtmfpG5rg3mMoJ3ps/?=
 =?us-ascii?Q?ZBAP6W7sDEr4Zfes4KeEK35RPNssDIWiF7KkedUT8Y7ylA9mZ0UkAO4cxTl2?=
 =?us-ascii?Q?5eDNJmgN968ec+0UKrKsOUSBuwySea/IpwwqDOGpT9QMLd592pnAGcXzhOY9?=
 =?us-ascii?Q?9rkhcTQ4kNTASIrirSHgaFES+bxSE4VQi8vF4KxhWIJ03e/ZfXmFU9PPL0eU?=
 =?us-ascii?Q?RZK6XgUWPrIpR86M8X3GzEcyznfrgwn5XVG3Ff4oguNRRIgCNTM7bAV2wBYl?=
 =?us-ascii?Q?aG/ILn+A3o4ooA1OyLuQ5Wg7ozK7oXbQngDipnq3qF70zKRQy9EFijw4nN8K?=
 =?us-ascii?Q?u/NlcfwABxVURbT3oXYQX6zkejtvk5K+8ayCvJgMXUgeynClLa/PkxyefU43?=
 =?us-ascii?Q?NCtMqLdJA2KUIUCNLNdDixxfdBrAdEMGJpNn/njjcyaHvvbiJkLZ7HIjhde9?=
 =?us-ascii?Q?oT442BFn+SqcVMAsY+GmOfL1SZM9rIm5006TPfo3S+JRPc6nwb+8hbHf/Lgm?=
 =?us-ascii?Q?JqP+dFYmpNIQ3XusVPpYft/9p3kwyCePfEVhL2ORAY1KtbHL0Bh6T1pCDSL/?=
 =?us-ascii?Q?b9zRGr1/Sg/6EYmbIQLXT4ezQg39DOqO2P8brhp1Faxpb010oQe9TRusW1ba?=
 =?us-ascii?Q?f5sZCP9cck3ekspor0BOQXGkwYkqSzLh+lqAN+4WM/IXYTIyC3TDC0xp55b9?=
 =?us-ascii?Q?qL3ZXGCNv6nP3LBt3JYWbHkQvMPXLkInpfIfjoEo00ICDbBYJELpOg/hf9tp?=
 =?us-ascii?Q?5BsKaRXWWkplVVMbF2iZ40E7CoBgIR2KNUwIM612kWnoGTszh7S19Wi5iSKO?=
 =?us-ascii?Q?pZ8pgwAqrvb8PBSYra/2VwFy92F/oPunxzOMT42JAvcXJLzYEFZL9+D8Mw2s?=
 =?us-ascii?Q?6SMQZxz9CQleIR03bsMWl6OSfB7GsR8+Zc5bgT3vsPb4GJT7kmwewJGwpCOG?=
 =?us-ascii?Q?sxzaAQXPgjYsBItZsi1rg8aSra9auA6uo8xFSIdy5zwKjJoWE6TnMVpi1QM1?=
 =?us-ascii?Q?9BYv07SvkCmU8AdteY+7L49ATSqizM7F/Yhehg11ZS3nzCvFznMZUTZKiM0s?=
 =?us-ascii?Q?1jqKaaz2G0d8w0S37Nuvk6ubsCdFCTiCBtaIFbMnPJt18c17aPztu3UEfE+D?=
 =?us-ascii?Q?/hzX6BwCXXkzz0NVCAo1sYhuEiRy84Lli+e1tmdJ1QEgMNBaI+69wnhQCW7b?=
 =?us-ascii?Q?vhomIRCc2rEEENviBWX/YzrUWK/lZMJXDJeFvKvt+nNfLuw7Kdf3LqiRNXTp?=
 =?us-ascii?Q?TKmG1rdEUj7ByQHSQpgLOpSBO1z0ai5i8HTaP4crRsRTg8V/jDX5aeRjiK63?=
 =?us-ascii?Q?R9opMfBSPxGvAtshU54Qqyo5arc+gGNKybg+J86ZWJY97arDM359tsS9gjZL?=
 =?us-ascii?Q?c4NApbn/b6ftBjQl9zOAbbhBJXPKQlTdU8LgIFqXiozWBVRbbHqFEwe0MhEf?=
 =?us-ascii?Q?jAoVe2kBjy21wO5MSJ3JRvtN+YFSJmF4RY37m1Sb1AYQfB1X3T4yo9YKqR88?=
 =?us-ascii?Q?kOo34LKkd6CZsJmxIv4fxd08gpuPmqbhlJ+QZk9X4CD+uVa/NhsqjCtMg9vb?=
 =?us-ascii?Q?8jPXk/5HppA2AdQqfRxNQc9gQV/xZ2bqGSaf3QCCfd7bAOX+jco3YRBXe+iU?=
 =?us-ascii?Q?d4j4C3QI3LnBNXBPdwrAM04kURVQKT/oDj/i30ReoF6g?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 7hFkBzhGyR4MgG17ogG7XD4u0FfZDU8KbZrsEgzzbIfVLiUeCstV32z7JzQ3CZOl229hUQebnW3FdU9QiQSUwps4Tya5u4K4hPyzzOiaUYyg5bf6/9Bry9ekrDeOv3CchaDvMOKVQ5BJBvJkXySPkw71pFExT9MSa1I5B0dNUat8VR9z9ptY40PYfjXp2cXLlNfEz9jyGJ/kFLNthRswU6a5Sbk5eRNjkMnp9VEy8Zmf2jCRUv3xxXx8G1EpWQKpyoFOS09CvEnQUmAhM4IcHqS54hPfxsRKMUyPmBB5yN14YLK0o6tIvytZeXsPdm7t+M0ZUjE3AJqWjML3rMcqaeRUR+lnjXENvGe+lKhfD4p7WARFENSB+jyZ5m7fAnWS//Y3dMspmIjfWhSq6UqwqUHs7qVVjPFNhdGQgGGJIvl2Ak229H+c3fPfbQ8zC5hEPXO7/oo+NHV9jSKL+zl/PFq+rMtwmm6EBHeBUuQ9qsn2xYqA0n4haG1fzSdgdfQVaYs4lFZwqj+H88js6m6/2wbK4lYG7Wvzky0PFWYPdUwpJcvPs8s4IeGFJ5RORKbnjNI6GxgOr4fwc4YjEUEO5iKLTmR+2OPyyPEC4ZtOIEkIFKvOch/EyCPK4ziJWeXWL+M8NA6Se/uwAG5B+LJnnbh4Bv6amfHOX8IM6EiTFSGls8yqYjVqibo9T9+KyN8s/cdg1UA9/JSxMVE4k2cZofVeRblkRfXrh2lgPaJ8gfwDDO0oDK7bD6QAthZ6Hd/DPpZ5i8uWyj5++T/07Uu63/inhhSqrFQAuqJ0gk0D0R7rhPpNaDzXWJON86LZ8aCT36rP5cnLXW+KoyZivZwPWAwRyKbXUoVGH8KGkJBNeRQUTNwf8h+PqpP4okbr99yJ
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 11373db5-7686-4e8d-d7ee-08dbb89f89aa
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Sep 2023 23:32:35.3658
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: gVtZqzr3rYoffM9H6nLb9earlqcxUgVtILSqqJNJWdQqTxLI8elnME/UedhS3ljI0zDj8AKt6DB2PV5NwPNgxV4JD0rKS2A4oZ7+TxMbk1g=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SJ2PR10MB7758
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-18_11,2023-09-18_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxscore=0 malwarescore=0
 adultscore=0 suspectscore=0 spamscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2308100000
 definitions=main-2309180203
X-Proofpoint-GUID: C8Z6AiE3phdT4Qd3k3UMKuAWnizDFIFD
X-Proofpoint-ORIG-GUID: C8Z6AiE3phdT4Qd3k3UMKuAWnizDFIFD
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello all,

This is the third version of the kdump patch series, the first and
second revisions being visible at [1] and [2] respectively. You can see
the history and motivation for the patch series described in the cover
letter of [2].

Thank you for your continued feedback and review.
Stephen

Changes from v2 to v3:
- Rather than use "reassembled" flag in QMP API, represent each kdump
  format "kdump-X" with a new enumerator "kdump-raw-X". (The HMP
  interface retains the -R option)
- Return an error if the file descriptor passed in is not seekable, yet
  the requested dump format is kdump-raw-*

Changes from v1 to v2:
- Keep the default as the flattened format
- Add QMP / HMP arguments for "reassembled"

[1]: https://lore.kernel.org/qemu-devel/20230717163855.7383-1-stephen.s.brennan@oracle.com/
[2]: https://lore.kernel.org/qemu-devel/20230914010315.945705-1-stephen.s.brennan@oracle.com/

Stephen Brennan (3):
  dump: Pass DumpState to write_ functions
  dump: Allow directly outputting raw kdump format
  dump: Add command interface for kdump-raw formats

 dump/dump-hmp-cmds.c  | 21 +++++++--
 dump/dump.c           | 99 +++++++++++++++++++++++++++++++------------
 hmp-commands.hx       |  9 +++-
 include/sysemu/dump.h |  3 +-
 qapi/dump.json        | 24 +++++++++--
 5 files changed, 119 insertions(+), 37 deletions(-)

-- 
2.39.3

