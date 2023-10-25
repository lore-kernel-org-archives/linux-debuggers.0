Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E6498C07545
	for <linux-debuggers@archiver.kernel.org>; Wed, 25 Oct 2023 16:42:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232566AbjJYQmO (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 25 Oct 2023 12:42:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229583AbjJYQmN (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 25 Oct 2023 12:42:13 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A5A8412F
        for <linux-debuggers@vger.kernel.org>; Wed, 25 Oct 2023 09:42:10 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 39PEwSpu019306;
        Wed, 25 Oct 2023 16:41:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-03-30;
 bh=gSRKOrxWbB8c3YrGxyyjsjRBfSh8sNwlYBdEtQbzNAk=;
 b=FVjy/mESC51ombUhIRPTkrgYztS1Ei9nOi/xe1leq/FNbm/T19APWshmpRD5ncEQ4WPE
 bXZ0ec8qmrnM2dXMcna4WsRQm1Mao9SSFMSYNyA/DcnP+0NnaNsT18ooVve1I0tes4Bk
 UW63fyvPlU0vRNpl2YK9Hq+Va1MoHxdLp+bL/fFY86LxhNcE7qm8rPDNwFK3+UGz7HKD
 J/7KBimFEDX/b50ZJlw6+fww6iUoJ+eE/+7JXhyRIMjNMyFkvmT/ue9cA+qtPmki0u79
 yJxhZ7OZeyOZOmLZ9/bodF+ypaNi6qIIfeyUqtlMYP8UfWxotcfJVJ5Tt2db3wfN6HqG mQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3tv68tg6ra-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Oct 2023 16:41:55 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 39PGL0w3014062;
        Wed, 25 Oct 2023 16:41:54 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2101.outbound.protection.outlook.com [104.47.70.101])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3tvbfm5yty-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 25 Oct 2023 16:41:54 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=nVsqE5IhHGm/oMhXJ+mSrXXNlfmVQd4/itXIj9lPmFCwYwnOwSHyXwJryM13rcjiQ+OJaPkC39ucI7thcxdYV37nl/vpfUIszm3VLjlkMeB2b1liWLCm87XKEwXGgV0PMrlEvlIhvMP8iR1lt0S7sn0VOuFSonyY1wvReTU4ScT6KKEie44F7a86MQgx/OLuXGke6qdtlXmHaIpUGJQG/eLxZCP67yDWY0xExrzKTBCa0Mvz8QjNhd4nn+AggkAV/oJvMJPTp86r87NU/HSUHr5B6SNAZXs0PQ8AaC0CRWMETkvHQWcZ2MPJaBTSdXW7qMXg154HKo1jWDI7Dr9Rsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=gSRKOrxWbB8c3YrGxyyjsjRBfSh8sNwlYBdEtQbzNAk=;
 b=FWhzTJIir5FDr4bB7dh7P8tBQNcBRreckq5P0YaHJ0UMbZmBWg1A1ee4Jb8D+6/PnBEc+BqDWDTeexmmw1EY+Gl1uLjEaygTq+SiLXFs6jHfZTMBE6yw5qK2gUOovhvNtWtYRA2CKxmBf7oP0rWMZLvWSrIo7XDhfeNuSStifFz+bPfYTETq33a924jPJg0/YDhAI9BXRD96dhak40SazC+WUIM2U8Bsf3y7fjWO5thn6VhBIvGgPURtq71xLLxDZLlakQCDFKDUI3Jiwbt7QI8J2xMcnxTQR3I/g820hkLYCOSOWr0eQAqeG7S9ilKDlqaUsxNeuZ9fHcUkGQxk2g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=gSRKOrxWbB8c3YrGxyyjsjRBfSh8sNwlYBdEtQbzNAk=;
 b=L+jL8OBuEVMxKHc/DhoRrMpXRaGloF0ZeGPH84p0M/NTaQJG2CsrEBwrp/ZqoZ94ABRI8NE+E6uNYdInIS/DhysTJg/SQTbM+QMdcj5q4R+n9lJ7irBlrAjpXlAiYx+eeethKmAawoL4cBzvytq0zc2ikXRexsrQTvaJ8G90gjA=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by DM4PR10MB6111.namprd10.prod.outlook.com (2603:10b6:8:bf::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6907.26; Wed, 25 Oct 2023 16:41:52 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6d2c:be3a:dbc5:6f9e]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6d2c:be3a:dbc5:6f9e%4]) with mapi id 15.20.6933.019; Wed, 25 Oct 2023
 16:41:52 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     a b <dtsbt@outlook.com>,
        "linux-debuggers@vger.kernel.org" <linux-debuggers@vger.kernel.org>
Cc:     kgdb-bugreport@lists.sourceforge.net
Subject: Re: Does kdb hardware breakpoint supports the arm64 architechture?
In-Reply-To: <ME3P282MB1826A5F031A2E9747D66F1CDA9DEA@ME3P282MB1826.AUSP282.PROD.OUTLOOK.COM>
References: <ME3P282MB1826A5F031A2E9747D66F1CDA9DEA@ME3P282MB1826.AUSP282.PROD.OUTLOOK.COM>
Date:   Wed, 25 Oct 2023 09:41:50 -0700
Message-ID: <87r0lizmb5.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0358.namprd03.prod.outlook.com
 (2603:10b6:a03:39c::33) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|DM4PR10MB6111:EE_
X-MS-Office365-Filtering-Correlation-Id: e916b77b-31e9-4031-4ec8-08dbd5794a5d
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: PDE43q5xKVgBc5LTuk/t8pRchAnysj4I4EKDT4se89qKm/bQMpDhSAWH2CcRtyjZ8BUZMVELpptRhq7M5r1g1Y92PTsN0u+bIRhZt/pu0VKryqRyAnR/JupyR7YQ/pd9k5QN4zsbqQhr5viAPcfTzRPAusWdYF8cjKRtYh7OC3BnS2Vlry6sE6d5EzScLVeNjc44j4ijminGq+ms9ZTj6WXHh5Cs0xLSo4Mbp4sumXhdHeoitdFOsKiPNpgyiGU1gjfR2jFOc5A/ZdGXU4q7ThQEIhs64QRlRMkUTaQ+sshJ/PeYJnzEEqlXGwdp5MKNC5yKbphR5jV86JDFO8WywJQ+tJ4nCiTh+lSyy6y/eT3xIdF7f71fzqq2klzwbY1hlDq01e8YOITLXRtg2NfNqMYSkV4kS+JWGMmzxHZ16gQIZaDIESw0IVUi9sZNduYX1A75Dqz8EAYnN9y4k8L5cwg4XWZGndDJEaJCXTphUrwbVFnKMPr9XKIdh5l+dRTHsZA3EMHCrQ2+FSI1wRLTxe1PVwk7IU5muXrMWHQw9gTRMUHqfDT0vM6bYidAkOsRsbyyinpVB/bcI7Qeu7KuEQ==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(366004)(376002)(346002)(136003)(39860400002)(230922051799003)(1800799009)(186009)(451199024)(64100799003)(41300700001)(5660300002)(2906002)(8936002)(4326008)(86362001)(36756003)(8676002)(45080400002)(6506007)(6512007)(6486002)(2616005)(478600001)(966005)(110136005)(38100700002)(66946007)(316002)(66556008)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?SFXpfF87aE5sJu4xZLvPy4EscN6TSyC9CaVFHUouo5Rh4uVhFG/cTPwdEHMN?=
 =?us-ascii?Q?aQurMASTBW859Rr3xnNig5Chkkol2fGArc7O4HoThET1LVkow6MqhQt3aTKW?=
 =?us-ascii?Q?s27/HM+8S2lMLa+vjY325+y0VslnNAHGIuGe845H8e5qROIiM/2lKinBZNLP?=
 =?us-ascii?Q?bmz1TfdJf5mFK17SAyZFNgG6+7E+1snzN3l4TlGiu7rqloV18HDlbG/Wdv7P?=
 =?us-ascii?Q?WAjHOrKsDnn7aisdMeFJll80L7vKPcDPPg8itfKgFYGB4DggQfet4omNHtfm?=
 =?us-ascii?Q?lPmQXhtodPPV1gE7PB1H9sYsl7zTA2o25iTiggvndz52sKXnppAwfLawo4bF?=
 =?us-ascii?Q?v+73AG4Y3KWJyzxDEVBD0mOeLmbJZvQQDiQoEWyFB8D/O87rKu0L6h0yfe2x?=
 =?us-ascii?Q?v7REEH+FcY1jFcwAi4HOXeoNq8c0fHyJaNVzj+Bl4KFkSdM2KW1Z11SR2Q5Y?=
 =?us-ascii?Q?6OFtXGgBd+e3R25WnKN0zn35JbH/Qhbg+WtlNHRXacB8ZtWx7swx+UCIoKzw?=
 =?us-ascii?Q?tAkLi8+7dFjsio3uNEpGSTe11GFkAkEWnQBXAiGjWLkgsiCGBAVLtu6gda67?=
 =?us-ascii?Q?gV4CCnb3BjnjJCsR7IvOgjl97IoUx7pDcJCGEvF3v8YW841RHQDgbyJqykpm?=
 =?us-ascii?Q?58g1Z6WKT948WjxMwFMLMT4Wr/GTqjRTczhzyiB4GxzPK9zUyNLutgU0r2Rq?=
 =?us-ascii?Q?3houqsdeg6RCof/pcvTz9Fstnb9sVukkZQE1nMJT9lHNPRjhA6RRJuAbucxD?=
 =?us-ascii?Q?/MbXZkoGHP1cOHOFg2Yk1jxIH51iM8bpMXU+YumxG3inuM6p1DO653MJWGuN?=
 =?us-ascii?Q?aHZRJ8XFNlbHuAmAbfAZAtuBCR7b7+hBPo7YVulmmg4GPXkBwu9iTXhMmYld?=
 =?us-ascii?Q?QggQz/bJTn487kI/uq45sx5t9TApEhWqUAB77kjXw6wD9n8WQ1AvjiEkDd44?=
 =?us-ascii?Q?fOkFTdiWnXcDOGfqhxsFYfOiL1i73Yh3zowDsBc89HG+wK1IwgUNDaGxm/3r?=
 =?us-ascii?Q?SuZ+/S47OGfcLjBoE9LYW6ILataVM/ICUPLakuNtm8FksSJ9F+qah6UqqyR+?=
 =?us-ascii?Q?U562cqSIrkd0sAMJnitG0EN2WBSjTMOWpicdxxvdYhU7L+NMzCxzYUol+wjI?=
 =?us-ascii?Q?3prW2kPtvX0TN19MtrCWQnlocGxzB9xcnyRco0o1//gCxZlZFjRPCC+4rnSQ?=
 =?us-ascii?Q?rTuA1VQntdfuTELIK6V4FbfC9X45sv6OMY9GNV6waTIlLdygT4vY2w8V8eAU?=
 =?us-ascii?Q?LImJZmCjnmiSe4LzrnEkMGvZe5ojWyp4d8jvaTf9y570ysIqX7TQKTMWkMOA?=
 =?us-ascii?Q?980kLFnVLFuWYD0dqJniRgvKDH/oGWudPtHBjTQauPVBnJUzmfsMrwxTT7eZ?=
 =?us-ascii?Q?ssU/NAECYCVIeNCBjRexWE+P0dpdl5GC8cpoYkgSp2jmgFsNFCvp/csI/74s?=
 =?us-ascii?Q?NF/hReupCBizdQlZKVxiXTo9pWb6sLApvUqAQv7BoYPE2+5Irm1NN8SYIJ3S?=
 =?us-ascii?Q?lWHqUgxsUBpWrS7VM3TRBdidE9WbvMqAMRppA4nsaSs52g0xTCuUp2aUZoMd?=
 =?us-ascii?Q?c9ggDIIwMlC7pC1HJjSBb+dkpltcord2OGwrHuOZR1XHj3p71PImXxeD16mQ?=
 =?us-ascii?Q?OlxGwIl/bSgRHvJFcGaNdmE=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: Ck1AlQXrHFarPRmsALOeSPGP9kM1T9j9tatluPew/re4nI+Fy+7eKwcPJ4qp34xkxAY5Seu9RGXu5+DAyFFtgM7gVtJp6XMhJFzOm6JL2jDE6xOaAHb3ezXT3dDEhAoPXCCZ8lT9USCy114Fpq5IHkKt0/Jjha5o83u3RH7kR+LKjOYawu/0rVaCWmryshxLqV2L8RJCNAifXSwTYMqhpfy3iMnO13KCX1uvInWJjMsifoX0b2dlOn+mvagh8cxRSuGySD9zCx7WcXoMpVq3KhEnIsGDOaEXtr10wsLdUDfpKeVg/GCNOcrG5JRGcpoDmlhrg3EjvrE4fLXFXHSuvLVXkIzuQtU6MamINt2/j83sMela/TUq28PTyev+cCSX4bY4KH/RC1H20ef5r6fXrM/4Wv+53HouWgDqQvzVMnFMgTFwzN2stto0/x1YbI4ifJDA6Xqce3W2R2Rtme+vv6Fy8X5JxI8bmWN6NiLvBV6tRxgN4Wo5t4hOgYoMTU6E0D9C6YLza5pQYtLlDi2ZknV3QNcS8id8d0kf3G0RLCNDYmds7tkpX1tNudSKsOfXtzqYoYUTqdcqmUmpvP0T0LuAUxFIaGV94OqZSoE05ptsc3DuWEyg7dIP+lOz+ay/8HFmG0qn02y1K+VnbNRQe+AG47FA0lVMM1fPiQkxsdHerzgaufGbTU5dKHiv7aqmx6Oh8QbLMmeXRO4n9AiX8fgnlFZymBjMEP5+gYAvKf5/oHV8viRybTB6Dw0mZ+KmJapF7cS7mEDHN87vkY5mzlaXQuV3YH26n1zoK3UWDHypPYJl/Hrr4nD4orANRkK9+WPzmyKdHa106kpFrkZLXgEmP20Y8S7ydFqx9nP+iDA=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e916b77b-31e9-4031-4ec8-08dbd5794a5d
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 25 Oct 2023 16:41:52.0036
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 9sJINTT5KEpnh8HxoGxarbMBCGCBejtXhRv8J4W2fLwsAEjzWuK0tPHiVYWzGhxuumtX55HiR/ziH5aMlRNQd4nYaHg9SL7oCQ1em0hj4rY=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6111
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.980,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-10-25_06,2023-10-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 adultscore=0 suspectscore=0
 phishscore=0 malwarescore=0 mlxscore=0 mlxlogscore=671 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2310170001
 definitions=main-2310250145
X-Proofpoint-ORIG-GUID: SxduRyfT7W-x1zxcwQ6BmkXL8WMqVvuj
X-Proofpoint-GUID: SxduRyfT7W-x1zxcwQ6BmkXL8WMqVvuj
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello,

I've only used KDB a handfull of times, so I can't speak from
experience. But from reading the code, I see that there don't seem to be
any arch-specific debugger hooks set for the arm64 architecture:

https://elixir.bootlin.com/linux/v6.1.12/source/arch/arm64/kernel/kgdb.c#L336

Compare this to the x86_64 version of the arch_kgdb_ops, which has
several fields set:

https://elixir.bootlin.com/linux/v6.1.12/source/arch/x86/kernel/kgdb.c#L776

In particular, what you're interested in is "set_hw_breakpoint". Looking
through the code where your crash happened:

https://elixir.bootlin.com/linux/v6.1.12/source/kernel/debug/kdb/kdb_bp.c#L148

It does seem like KDB went right ahead and tried to call the NULL
set_hw_breakpoint function... There's no check to see whether the
pointer is non-NULL, at least not here. This would match your crash,
since lr = kdb_bp_install+something, and pc = 0.

What's strange is that KDB should not even _have_ a "bph" command
available, because it uses (arch_kgdb_ops.flags & KGDB_HW_BREAKPOINT) to
check before initializing the "bph" command:

https://elixir.bootlin.com/linux/v6.1.12/source/kernel/debug/kdb/kdb_bp.c#L590

So it seems that your kernel has "KGDB_HW_BREAKPOINT" bit set, while
there is no actual implementation of the function. Seems like a bug...
the arm64 code doesn't set that bit. I've added the KGDB mailing list
onto this thread, maybe they have more context?

Stephen

a b <dtsbt@outlook.com> writes:
> When I'm trying to use the kdb's bph(hardware breakpoint) on an arm64 board with linux6.1, the error kernel NULL pointer dereference at virtual address 0000000000000000 occurs:
>
> root@root:~# echo g > /proc/sysrq-trigger
> [ 2189.865491] sysrq: DEBUG
>
> Entering kdb (current=0xffff0003856b5700, pid 314) on processor 4 due to Keyboard Entry
> [4]kdb> bph jiffies_read
> Instruction(Register) BP #0 at 0xffff800008135ee0 (jiffies_read)
>     is enabled   addr at ffff800008135ee0, hardtype=1 installed=0
>
> [4]kdb> go
> [ 2220.051476] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000000
> [ 2220.051719] Mem abort info:
> [ 2220.051750]   ESR = 0x0000000086000005
> [ 2220.051841]   EC = 0x21: IABT (current EL), IL = 32 bits
> [ 2220.051898]   SET = 0, FnV = 0
> [ 2220.051934]   EA = 0, S1PTW = 0
> [ 2220.051977]   FSC = 0x05: level 1 translation fault
> [ 2220.052195] user pgtable: 64k pages, 48-bit VAs, pgdp=0000000402e23a00
> [ 2220.052254] [0000000000000000] pgd=0000000000000000, p4d=0000000000000000, pud=0000000000000000
> [ 2220.052804] Internal error: Oops: 0000000086000005 [#1] PREEMPT_RT SMP
> [ 2220.054226] Modules linked in:
> [ 2220.054509] CPU: 4 PID: 314 Comm: bash Not tainted 6.1.12-rt7
> [ 2220.054566] Hardware name: ARM64 board
> [ 2220.054595] pstate: 004003c9 (nzcv DAIF +PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [ 2220.054638] pc : 0x0
> [ 2220.054811] lr : kdb_bp_install+0x120/0x200
> [ 2220.054865] sp : ffff80000a46f870
> [ 2220.054879] x29: ffff80000a46f870 x28: ffff8000090b8000 x27: ffff8000090bb1c0
> [ 2220.054939] x26: ffff80000a46fb30 x25: ffff8000088dd610 x24: ffff8000088dd5d8
> [ 2220.054988] x23: ffff8000090b8ff4 x22: ffff8000090b8cd8 x21: ffff8000090bb1c0
> [ 2220.055037] x20: 0000000000000000 x19: 0000000000000000 x18: 0000000000000001
> [ 2220.055084] x17: 0000000000000000 x16: 0000000000000000 x15: ffff0003856b5bd0
> [ 2220.055131] x14: 0000000000000000 x13: 0000000000000000 x12: ffff8000090b9000
> [ 2220.055178] x11: 0000000000000022 x10: ffffffffff9836a8 x9 : 0000000000000010
> [ 2220.055226] x8 : 0101010101010101 x7 : 7f7f7f7f7f7f7f7f x6 : 0000000000220400
> [ 2220.055274] x5 : 0000000000000000 x4 : ffff8003f6d10000 x3 : 0000000000000000
> [ 2220.055320] x2 : 0000000000000001 x1 : 0000000000000001 x0 : ffff800008135ee0
> [ 2220.055371] Call trace:
> [ 2220.055392]  0x0
> [ 2220.055423]  kdb_stub+0x288/0x428
> [ 2220.055455]  kgdb_cpu_enter+0x168/0x740
> [ 2220.055493]  kgdb_handle_exception+0xd0/0x128
> [ 2220.055531]  kgdb_compiled_brk_fn+0x28/0x38
> [ 2220.055567]  call_break_hook+0x6c/0x80
> [ 2220.055597]  brk_handler+0x1c/0x60
> [ 2220.055623]  do_debug_exception+0x8c/0x118
> [ 2220.055655]  el1_dbg+0x38/0x58
> [ 2220.055690]  el1h_64_sync_handler+0xc8/0xe8
> [ 2220.055718]  el1h_64_sync+0x64/0x68
> [ 2220.055741]  kgdb_breakpoint+0x1c/0x80
> [ 2220.055773]  __handle_sysrq+0x90/0x1a0
> [ 2220.055821]  write_sysrq_trigger+0x74/0x98
> [ 2220.055855]  proc_reg_write+0xa4/0xf8
> [ 2220.055894]  vfs_write+0xd0/0x388
> [ 2220.055934]  ksys_write+0x6c/0x100
> [ 2220.055968]  __arm64_sys_write+0x1c/0x28
> [ 2220.056007]  invoke_syscall+0x44/0x108
> [ 2220.056061]  el0_svc_common.constprop.0+0x44/0xf0
> [ 2220.056109]  do_el0_svc+0x2c/0xc8
> [ 2220.056150]  el0_svc+0x28/0x98
> [ 2220.056174]  el0t_64_sync_handler+0xb8/0xc0
> [ 2220.056200]  el0t_64_sync+0x18c/0x190
> [ 2220.056592] Code: bad PC value
> [ 2220.083989] ---[ end trace 0000000000000000 ]---
> [ 2220.084622] Kernel panic - not syncing: Oops: Fatal exception
