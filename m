Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1531CC77B7C
	for <linux-debuggers@archiver.kernel.org>; Wed, 24 May 2023 19:49:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229778AbjEXTtB (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 24 May 2023 15:49:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53560 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229551AbjEXTs7 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 24 May 2023 15:48:59 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 57EA2135
        for <linux-debuggers@vger.kernel.org>; Wed, 24 May 2023 12:48:57 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34OJAGxH028951
        for <linux-debuggers@vger.kernel.org>; Wed, 24 May 2023 19:48:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-03-30;
 bh=W0IcTSimfqXvLsE7ZgdOyLO2y9AM5/TG4IBPEBPHpSc=;
 b=nBZjOlO4ZPPGKcKN53/3g+5Zl/z9s0cFZKjYybeiYZOHKq5Wh4R9ZhTi0g252cBlKf9g
 0xfrM3C2ueZ5Ov/4JIof+E0NWToXx+Op7h4bnq6TDUAtFmE6xohlUnnOshWBMeMCB1jm
 EEWCmlUEJwXBXQOZFoDw6B+KodNq+fy4CsJhqiRWx6Itzp2UJmSbGOKMdYloNsNdtE5l
 zNfqyx3HbUTUsXae2QXAbkr9/tG9sTvHeLgK0V7h+pyad+4bxwhCQP5302RXnx7xZxQ6
 Wh4oqcQu4hEtLqv+APlFNXf/cIcKYiAi9FUO/nx3NnvRMT/hB2lGb5lhAyoeiNxRXq44 ZA== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qsrgar3ej-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-debuggers@vger.kernel.org>; Wed, 24 May 2023 19:48:56 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34OJ630c028896
        for <linux-debuggers@vger.kernel.org>; Wed, 24 May 2023 19:48:56 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2102.outbound.protection.outlook.com [104.47.70.102])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3qqk2cq1fs-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-debuggers@vger.kernel.org>; Wed, 24 May 2023 19:48:56 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=InSqhztRt8XJ+arRvOfv/s1c5bDXvht5qwWxuPeai8f6kXrG180uhthdIAKxoLv3ZnjMj8qQjfM8OjfGkYPaDIiuVenU2O048mm71rjQnxsXarfArdgkKcCsRb8HEABiqHbnegDm9x95nvomppbr/JIvsiPlc5cEn0/CaNcjo5KBJwYoQU8LuyDgEuutIPftW/U4fKBP3EHspXjUMrJYGjTpug3+jvC+zQtD/KnKGWoIcys5x9MFS4T5RLAh1npw/7qSpkbRne+v1eaJhW7j1OTZ2MA1WFnohrthvsuk8GNl4dqIkHlogStd5v8CUPscy+/EuiCmifp7hLnaEHeLQQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=W0IcTSimfqXvLsE7ZgdOyLO2y9AM5/TG4IBPEBPHpSc=;
 b=ScelXJkADcwwRZGlsTxEpZMJ7cVDmwnXz/D7Sq6GARIGoHrP8Xl8bVKvyJw+rb5k+d5wwfHV742G3niVYbkIkbcBq234deMdDJNsEJl/VT6kye/4qi914r4EcEsF1uSqES8LCw3wZJj9xT7CSz0xZIpXW7dVBatAkoutA6fRUnwxDrwQ7gCemcJyJl/btZrySwbByw/B9lfWgNrORUoY+RHiRAXwlgh3BJJ9m5nnLlXz5nj5yIu2fr/1IxdG/JOzcfzkxZrXI1vaiQndG4aifmXkVr8290NEXP/mSuB6I7fKbgG0jiDGpjtCbKxcor6tycnIJVthqI6B63SV5ih2Gg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=W0IcTSimfqXvLsE7ZgdOyLO2y9AM5/TG4IBPEBPHpSc=;
 b=SuRT37ScMtrRnuowhp5P5YPnOSwyvz8+8lrh/osKhO6yuPQReFv6zmbSPD79I9OtVudfYcYGMSTmAGgPYO8MOSwem6P1DLiqr2sP5e7SYVFCHsZJt70q04QE+lIlIz45wjo6gRzwSFFotsuEcI8ODa/H+GIM5kWBWIz+KUNSG7o=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by DS7PR10MB7156.namprd10.prod.outlook.com (2603:10b6:8:e0::9) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6411.28; Wed, 24 May 2023 19:48:53 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::831c:6600:b62c:936e]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::831c:6600:b62c:936e%3]) with mapi id 15.20.6411.025; Wed, 24 May 2023
 19:48:52 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, May
 24th
In-Reply-To: <877csy7p1a.fsf@oracle.com>
References: <877csy7p1a.fsf@oracle.com>
Date:   Wed, 24 May 2023 12:48:50 -0700
Message-ID: <87353l7bod.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0101.namprd03.prod.outlook.com
 (2603:10b6:a03:333::16) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|DS7PR10MB7156:EE_
X-MS-Office365-Filtering-Correlation-Id: cd54ee44-ab53-483e-1851-08db5c8fe6cb
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DPw0PS9Rc+Nt5YXpk/M/4/IbeA0Cpv6JvIhBKpjmJI8nRXmU4DXPBQBxAdA+i5EE29d4CRNuiXZ1QHtOu69QrakD//VmXbGCc321HtIzetGfic0BFPdCLYIBCJux3ocXLESbOm3e+mRhWJV8QEVdvaf5yZpwp5279CQBKwos4QC+VxPkTliO9KzBptS5gRBcu6oLnDpDBjy/oK65s0A1CIZ1dTtUakJ3jglpZGp666dVbtjY//eVL6DsfOf1KYgPoFiDM4/xbOdeM7/ZcCYJI/pumtImVs36tYN7SSpdjsVnxCRVkJMAOnyUb8NBelwv/jVVSzEbn5dXP5W42/T6SmswZhrR/gZwV+pH+2UNATRUNurrVVVk9kD8c9yB8iaOzOnwFX60xeVrs7dXR5PvclcK9nM06Vi8u0eU10JHkU57MYSS5GyZlVt8wU8QdJ7gvpsnKF842fD4dzlkQJrSObQC24c2Oc2Duc3/7IEODDysZyCGDIr6tWwROr/eakrOAsi4qOHPz0dn6blRKyWAfDJ/KDoz+CSlwccBgOXrESA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(376002)(346002)(136003)(396003)(451199021)(66946007)(66476007)(316002)(6916009)(66556008)(5660300002)(186003)(6506007)(6512007)(41300700001)(26005)(966005)(6486002)(38100700002)(36756003)(478600001)(83380400001)(2616005)(2906002)(8676002)(8936002)(86362001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?jXloTTGhnIKLmyGCOgjaqbm5H6RztHryJR6M++lvggw19H3PuqcbbQiKB0Sp?=
 =?us-ascii?Q?evzqUIxHIq4dT0DY6YG9Q60gR3gxg+Kqpq/4RcW8GNEh7+A7NNb+N6g2daz6?=
 =?us-ascii?Q?C0e37MLkSQOiiY/LK3la0B8oA7Z36FXHnepx8gFuIXOgrVTb6l8l3NApSuLf?=
 =?us-ascii?Q?uqxRbCA4F1MYEatV7d8vYZDK7Nliv0B+sxPKYwczFh2wC5k6cbo0WOiAFFL3?=
 =?us-ascii?Q?lfG7n7GOiIhiGTbw6e4nv6wn7Id45Dd/LSky8dtO06LPqMgYbmz5xYpsrO4q?=
 =?us-ascii?Q?yb21uuBnA4ynBFWFAU2zRHStluLlKYcn3CQAsFXjJd5NGieUAAFeaUQfniDg?=
 =?us-ascii?Q?g2+7xmZhO8wT8QDysCIKfXaul+JUchnrl7M4hY2t3goEyYNLCLoTdYyG9hGY?=
 =?us-ascii?Q?llZMLJH9mrsHwOaQ/GP1BMif5qX5VJlgdvwYfkgLYayVOgUE3X5z0NPpyVhZ?=
 =?us-ascii?Q?kxC/Uan/cHv/gD5lcsmTp9wrH5lnVoVffZBAJq66musu6Vf4HFUOfAeo7Bh2?=
 =?us-ascii?Q?ffQ0B8OJKlkVAbYHeey8GRCRAZSFoGvi2B1JQvzc7SZC3po2x88/d5sO3cCo?=
 =?us-ascii?Q?X2CbScjCPJtMXXV2xTpqFKv5YBezsO2G+C7PPMQ0OJAj7sHESGqFYsgLLchc?=
 =?us-ascii?Q?ANC1nS02wm1ejxIWPbVP/9u5M2GzqBEavhBmxN0yNHdwaaV34buehHXEwpji?=
 =?us-ascii?Q?tXQYUor3VMkbkI7lv89fZzVhzQyyT4k5sr3892nzVnA/A8eGtZ4P6ky9Vj7j?=
 =?us-ascii?Q?N5Af7s9OMGv9t00bJr6uXns6Iuh4Lire0CL/7oERMP+M2ggOt9ThQ60FXt77?=
 =?us-ascii?Q?TR6MP//bK+TiQzVQQJeEoTT9cMBU7Sb5zv73JFSc6mP9px3cgFYbE+dufcI2?=
 =?us-ascii?Q?oTDa5chMqDEKGfolzq9cFV0tmn0HDP1lfUueDUgE1Eh0df0yzGz9/udGG50/?=
 =?us-ascii?Q?vZRfESOjA5HLVFxqiJgfEFqwWGozQj0DVRSfYWF1YLJit1VYTd1zofM+pApI?=
 =?us-ascii?Q?D83s4EsVHXSGmQ12uj29Ln04x43StCXx6PdiEM1a9q/jOAniMjrVHdmnqun2?=
 =?us-ascii?Q?/p4nnQb05/fiBr0ZwRNAM89Lkza6/qHhoe+uji5nbOnTLrqXH3QVs3A5ZGpr?=
 =?us-ascii?Q?E/wnFnrLLSc7t27wnLcy/0wYic/P4YAmdiJVy5gHryeUpdONasNnI31cGrjY?=
 =?us-ascii?Q?oidXiXUB5CXhh3LCJMxDqj4u6TnIE116zJwVW8bEXLDO5mX2lqXtQ7HP+g/p?=
 =?us-ascii?Q?3DW9bhCFO4chjZyggeSAdb3f84IyBq7+3lE8WgilzPgsuomhxfXey/1RSIkz?=
 =?us-ascii?Q?RcHPcruifkLTO+pfz2JTM9rybqCkSQKFSdpx47g8a+o9Q6P3NIsrEgAyWksq?=
 =?us-ascii?Q?DBnsAe3iuAALHMWPUceVO/yZfOW5Xl0/L+rP/NAYwaXSuXi+t4xqco4hFZBR?=
 =?us-ascii?Q?x+ucZQTeAcTXUqJvTxdRHR3iloxV9BXV624mo5kRGtw2IHIt5IvltfMKePKh?=
 =?us-ascii?Q?5UuhBN1ZuCmqKxaKz2gXvOgr1AFj1ktGLyJaiSr10bRM1r6CKLyPV1W8LLZ1?=
 =?us-ascii?Q?SLr9aldzaDunhnKBFWPgIfckpGekWcWCjNMZ5yyShcP3e13JpxuziYMG38Fr?=
 =?us-ascii?Q?dA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: ymwfgpsTouUO3VugxPRFXOWJNUs0m2u7feBp8Z2D8PFV3igUQ9CbPuFY/X6QOVZRkSSejIGA2dnNWWhuAALel8WBIJ6CHPyql+SfSxjMKCYliCuLsvid9YSaxjlsFQlucedSyFk36ZUno/ehBzNCSw8vL7harmOrto5qg6mlEYyR3dKi5nygFaGorjji5s+n3ZCYSo0VnnbHUAOp3ThXn/ejO/yUiaACckP1OFrRgaQQ9ZN+nfhWLMqcDrECKUiHqwv95o9kfhZ5g03DQkozPoy8n9VcbpdkEDXa8KUQD8JxPPDDDeIr/7NYz2Yx+IEr+VJvI9cB5e1iZMryMNYpvGtz0lzdnJq5+8V6KPkjmf/8oR7XGA9Hg1tPG138kbvyWwZbTK2aMhO5BY37J7a9SlvTXSKHB+u34OOZvjMA4vkzwa7/zSFSXmXm+QrbKBo+e0Fp5CXYgikOnJJ7hhNERLEC7yfm3ioyG7GUC4i2VI9oOpIksSk1913o21HKm3PC0uYU3DSVOh42fzK3zYCIRVWwMibcHk1g6HWkbLWHOUEJX8zCXUDYl1xvMvhMB7rNYb0t0sOrsLvGp7duAHESp8NlWRWB/AIq06Yqt9CgNSBE6w/DrrkoI9PML8AM8VPYvBMM6vSQ/2ehqkAkaOJTtEnaDjgsuxK5kjgfksmK7q4ctowBOai6Njc9O4AeM+/U1eXGksSsqrxiBmxGRJ/I26n4ZxPV/rr1EPzxtXar7bc3DOB6uJSaCq730WGTV2rHt7rXFHERf611w4QsCh7pzQ==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: cd54ee44-ab53-483e-1851-08db5c8fe6cb
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 24 May 2023 19:48:52.7351
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ztpTya9fgwk9XDBY8C9s/rqfa9oMTrg4wk5mfZFAhpoEmgimeI6N91zPknoWJpwq7AArY9D/6N4CIboTjsFR93jYRj7IxPSmaEdT6IeSon0=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS7PR10MB7156
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-24_14,2023-05-24_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 malwarescore=0 mlxscore=0
 mlxlogscore=999 phishscore=0 bulkscore=0 suspectscore=0 adultscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2304280000 definitions=main-2305240166
X-Proofpoint-ORIG-GUID: 6W1xAtTfJ2OI3_NqI6Vukk9NC0rGTxvo
X-Proofpoint-GUID: 6W1xAtTfJ2OI3_NqI6Vukk9NC0rGTxvo
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello all,

We had a small catch-up meeting with three participants. There weren't
any major action items or pressing topics to discuss, but here are some
notes:

* As mentioned, LPC is coming up. Remote attendance is an option too.
  I'm not sure whether the MC is accepted or just "proposed" - it's
  possible that talk submissions will be folded into Toolchains if we
  don't have enough to fill a full track for a day.

* Philip mentioned some open questions he's been thinking about: Rust
  support for Linux debugging tools, especially crash (and Drgn will
  need to think about this as well).

  * Jay mentioned that the C++ support work for Drgn has laid a lot of
    groundwork that should hopefully make this easier, specifically with
    a few DWARF tags which weren't implemented.

* As a novice with DWARF, I asked about resources for learning more
  about it. Jay mentioned that the DWARF spec is the best resource, but
  doesn't recommend it for learning -- he suggested playing with
  "dwarfdump" on a simple program to get my feet wet.

* I shared a demo of Drgn running on a live kernel with CTF data, and no
  DWARF info. As of now, CTF debuginfo is not a feature in the upstream
  build system, so I'm demonstrating Oracle UEK, which carries CTF as a
  distribution patch.

  * Relating back to Rust for Linux, it will be interesting to see how
    CTF can adjust to the Rust type system. Similarly, BTF will have to
    start considering this as well.

Thanks for the folks who showed up! It was good to see everyone, and
I'll be looking forward to the June meeting, when we should be back to
normal with Omar hosting.

Thanks,
Stephen

Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> Hello everyone!
>
> After two months off, the next Linux Kernel Debugging Tools monthly
> meeting is tomorrow: Wednesday, May 24th at 11:30am Pacific time.
> The agenda is a bit light so far: please feel free to reply to this
> message with suggested topics.
>
> The virtual meeting link is changed from the calendar invite, since Omar
> is still on leave. Please email me off-list if you'd like to join. If
> you're on the calendar invite, you should have received a separate email
> from me containing the link.
>
> * Linux Plumber's Conference is November 13th-15th, and there is a
>   proposed microconference for Linux Kernel Debugging Tools [1]. There
>   is a lot of exciting work going on in our area, so please do submit to
>   speak there.
>
> * [ Your topic here? ]
>
> * If there's no other topics, I can give a brief update / shameless plug
>   of the current DWARFless debugging [2] branch of Drgn. True to its
>   name, it allows you to run Drgn without DWARF debuginfo (instead using
>   kallsyms and CTF).
>
> As you can see, not too much on the agenda, but I always find that these
> meetings stir up interesting discussion that wasn't planned, so I'd
> encourage you to show up anyway. Worst case, we chat for a bit and leave
> early for lunch!
>
> Thanks,
> Stephen
>
> [1]: https://lpc.events/event/17/page/200-proposed-microconferences#debugging
> [2]: https://github.com/osandov/drgn/issues/176
