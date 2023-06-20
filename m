Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75EB9EB64D7
	for <linux-debuggers@archiver.kernel.org>; Tue, 20 Jun 2023 18:03:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229707AbjFTSDl (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 20 Jun 2023 14:03:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47232 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229638AbjFTSD2 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 20 Jun 2023 14:03:28 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 060121997
        for <linux-debuggers@vger.kernel.org>; Tue, 20 Jun 2023 11:03:24 -0700 (PDT)
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KGEVOW018906
        for <linux-debuggers@vger.kernel.org>; Tue, 20 Jun 2023 18:03:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=corp-2023-03-30;
 bh=vAXJbv6DNEdicFQFYgX++RjiMpwTmG+5BjFZqMN6wgE=;
 b=sTOGFAFB7VKpdt8xVI3XXgAalmzxY6XFd+CaUNcOTSeNo36W9YLEFmykvYl4yYfG3AR9
 ZIrom9kh43yexP8chup/iKOY+ZP0KIRCwAsjRPUyg0IgAl2g3FpV7E5szGi0SpciUJmG
 7uJzGoF/v33GlmUQEueRJFuezjhxekX8EzsqJEwhWDY5mK8Za73+nuUP37zseJb91MSo
 ljGUnc64S+tbU2Gzw+XTaLE1Sh+b68Df6MHhYoAsdkmu9iPezTszosWWmkiy1xTT0nsi
 GBglr2vp3yoTYWzEvKr+vGDWYc3GVa9asW/S38KtdtczxiAwZY/m7CUmW9hmYNaoWRSj Rg== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r94qa5bus-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-debuggers@vger.kernel.org>; Tue, 20 Jun 2023 18:03:24 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35KH8PlB032868
        for <linux-debuggers@vger.kernel.org>; Tue, 20 Jun 2023 18:03:24 GMT
Received: from nam02-bn1-obe.outbound.protection.outlook.com (mail-bn1nam02lp2047.outbound.protection.outlook.com [104.47.51.47])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r9395xc5t-2
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-debuggers@vger.kernel.org>; Tue, 20 Jun 2023 18:03:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=BygNCARVgGjoWbxG7vDLkL3VquJf5Zt3O8TeqB4jfcWRVtOckR9H9qDbceUNqxCDeDsLOQWft+AVCK/NGLP/l9+rwOp2SRm5VX33fz+bqJH4hkSmj58GnOvVl+WjGBtquEhiazI7dA7fQyUtnyezpin0c8Q5YpGTbwV1M+MHxF+uxghj+zZGDoCqXb1ePRS/8K4cQd1AkbhMjeoXlMJfqEflip2MtisID4R0oxGyVEYQYk9FDfyh4ttJkwZe22/SngENPs1iMyyBPU6XC2n0dQ2bzliYEJ5jAK8lwrgnQZ3kCA1ga5ba6NfJ8b8jtTjMyqGVTKnUxewcX8stZkBYNQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=vAXJbv6DNEdicFQFYgX++RjiMpwTmG+5BjFZqMN6wgE=;
 b=N3xIQdL/C5g3tcRiojZ9UZ/a5XjEh0Zc3z3VZW0D6AowOnm7GOzYhcsqE7lBaNAC3534nvrcTLCSqA4EwV8LS3DkoXfFiacgE1LWbbwPKfV2t0B9/3biBk0j8GdRQjOH0s/jF2wDQ3Ic1pz8Bup6rtYIpdAO0LEK4Kr32l6jitTqhROJNBJ+io9IShiNcirWeolsl5yqdMvRLulCBnx82CBuaW3OZX2A77djCRZncfc4jHthAWWs43u0eIfT8r+NGJ3lNcGOGFui/kZ5WayICTnozmT+2rICu+h+uOM2H0jm/VyaQxqBN9eu4s8iE6PeUWdv48Gxt3GLCIg1WZn1zw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=vAXJbv6DNEdicFQFYgX++RjiMpwTmG+5BjFZqMN6wgE=;
 b=Ld4JHmChX36idgLzCzRbGb8BSDcz6aYjqsmcZoueaRyphmn/y2xMk5gkSQPXtc+r1lndPFJ3WZDcrYT+JITK7ELiOe2d8ogJIxPDrTOIUQMBhnqGBBgsnYdQrJqUd05b6EuMbm+L5PJ8sAYg7TGaWgEEI2+g06Jx3kcwO3IGg50=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA2PR10MB4537.namprd10.prod.outlook.com (2603:10b6:806:116::23) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.36; Tue, 20 Jun
 2023 18:03:21 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef%2]) with mapi id 15.20.6500.031; Tue, 20 Jun 2023
 18:03:21 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     linux-debuggers@vger.kernel.org
Subject: LPC: Linux Debuggers MC - Submissions Open
Date:   Tue, 20 Jun 2023 11:03:18 -0700
Message-ID: <87sfamvwnt.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: BY3PR03CA0017.namprd03.prod.outlook.com
 (2603:10b6:a03:39a::22) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA2PR10MB4537:EE_
X-MS-Office365-Filtering-Correlation-Id: e683e346-5198-49bf-8617-08db71b8a23a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: vDTo7BY1Xf+8Ezy8IyyCB8wj/9oq8Qf1b/Pz8CVrKP+itE2sPVFAkatRWGFOrwEWvVKgC2JmMzwMU68fjF4idckD1d+3+oBdB81py5BEYEUqb8xX4GC03OB1jJcSwYunUJ2aqHNVvBddsjz70MyOFCa6lx4tcqXwQznuXkCf3GrMAhpypLnAHyfofKr1ytbwqvdmnRTxExODHrP105vTrzcsxKzko0vs4neTBX0xnP52sXnBB4YqPdOmgtmPFIxgLv/SL188biBCL5ThtnmtJ/fbcrmnX5YWe6a7I5pzQ+Z/Kr8OqFS5WW+Eng7jkeFpwdMJhsDqbv8uIQ7L7DMqazKgXowKZZETUOXIZgfcGDS25a2m3w696f7nNpbddpFX8Jx+S6NhskE8UwpsVfdMESRBvbz5dqQv/v5oH1bF0HLFt8FRTEMNukS7MeABcfaOZN+Xf6J+2PE6L3zok7eKaJQrKTpzZJfOGp6NUWi3B8eo2iH1FteM1B8m0twERUJWhMmKzI7PWCH580+pNjcqUQun/JEsTZkz4pQyWzzFiTo=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(396003)(346002)(39860400002)(136003)(366004)(376002)(451199021)(66556008)(6486002)(6666004)(316002)(38100700002)(8676002)(8936002)(6506007)(36756003)(86362001)(2616005)(186003)(41300700001)(66946007)(5660300002)(6916009)(66476007)(6512007)(966005)(478600001)(2906002)(4744005);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?bod55i2GLgOq1poxBOl/tg0cXWcmqJjMdeOXGHQt5eQttzFd/Ha8FtmPiY1r?=
 =?us-ascii?Q?yCkOwUg6ye3pjkILLP9ua9LK8Os8VIZvxYU6ZNl3mcbBBpnQFEszFH+NsxE9?=
 =?us-ascii?Q?Em4l6B3DN4L0vTI4NBc/AudJG4bzQ0XuQ8eK2nMY2S41D06awOQP0vIHofIR?=
 =?us-ascii?Q?Z3C4vACFI8Piaw32O5jktemTzly3pN+KsW4amOz+wacqLZN21mLUfEZzOCL0?=
 =?us-ascii?Q?BRrXICjvdOlgj/XbKOwigkYk6Ib2s3XR0p8vtktgy75vkaDC1ODQyERrshAz?=
 =?us-ascii?Q?MzUjqoU2x3/0alXaJkRiyjhVVCHlPe8ff76s8FkgYO1lz9QAODX3XxZqAmHy?=
 =?us-ascii?Q?VokwKrPqf96pwuOCHGvFOVjdB9pJgnHXAswwLETVUzu97QdYQ1zlLLm6BLiB?=
 =?us-ascii?Q?+ioH0D1aRoeKF0r/b3J1iFWLfQ+aTLoKI/42sUHNeKf8rmC8Nr5c3vGOxX01?=
 =?us-ascii?Q?U2AvlbhvQjdxOgn92peouw53uWfbQW7Lluf5bRNcZ4RUaaVeiNOeOUCMHNzj?=
 =?us-ascii?Q?xPDaHasjLUIIKsov4ikpvf56uOkVQvbQ5uju4ixf0JIUua+VHIHW1Z12RxjX?=
 =?us-ascii?Q?XwtnUuWHfnp91q4yxF6vng1k8j+xVIMI6p5qoyrSz6OLz/XK38KaOJrux4w9?=
 =?us-ascii?Q?8HlV+NU4R8aACFqTgCmGvg8RULHoFR0Nz3SSONvsN7RPLSvSEY9hZmTAa97o?=
 =?us-ascii?Q?uqvpEWXNuoeYgJ/pGeMjC0KsTRuhZlN3J33QaezdpeE4g3iRoj+5g48DWzSt?=
 =?us-ascii?Q?GybHwKwGDAC2OcciPEID5+Xldt85UOTkXSy9RbS0SZDivt+UlS6XIlxBBocK?=
 =?us-ascii?Q?M9vdDKXnMakMkY3lGu/Q9G8bfML32/S/0QFnkjKBWI71p8HZUCdPQNJOoy4o?=
 =?us-ascii?Q?8hSiWfvIeHJ03NhCIC42evkFIWBeO8c7oDLd0n+lhgvhHmlx0jZcbtNYL5n4?=
 =?us-ascii?Q?+QaY88yBk7iGpN8gQuiQijKmX5Uy6e4FDPhKADabfblErt0e7Ffuz/jhKwon?=
 =?us-ascii?Q?X2dvh5I5t8WRwhEn7tq8MEsRV3SKiTRoO0m6bWhkdcuR23wivQgXIHGjOJdS?=
 =?us-ascii?Q?M3v+l60wwUqfJHNsJbVkUQJqhaM5Sve+RiKJzrTRG5rCZZ1lhb3Kjdub6Zfp?=
 =?us-ascii?Q?GfXPZW4sGYWQR5/EdvgB3tERA4CHHpiAJvKczngEb7s9oUtkPu/cKtfpsNtE?=
 =?us-ascii?Q?uv86iBlJB+0PiEb3GbvrcXwLZ5OJgkkcAhMGS/d7VbPdLbxSefG5x3RodoOC?=
 =?us-ascii?Q?QU7bzdecAD6qpxkQeAhUSnp9I0FA0VykeMe/lV7XrL8jnSW3qG+X7LsH+ooV?=
 =?us-ascii?Q?ODQw0cvHQFtBLsVeAWzyVX0tf9iMN/6KyNhkjt4SJrwH53vS3RwTfY2cXQ1v?=
 =?us-ascii?Q?F7hgtodqhxQasNc4VNJyRJZQ04E3T21HL/uj5QasOUWjWjLCZJUcws4wSQyd?=
 =?us-ascii?Q?54TaY5aVlpiR5j3SFSw8dhcWf6/D10wswXLTW/VLECatLAgURvYH0iWdJrdb?=
 =?us-ascii?Q?LZ8ADYQ/x8QkSqJKjTbqzWGOTSk0JHUSIaYyMdGOvPGeZrWiZw4qDBAmJovT?=
 =?us-ascii?Q?W9xlX66mdK6Wrdz/t+LyMjzOMegD7tTBiOUJNDd1LUIJibnauqPi6AtvLv54?=
 =?us-ascii?Q?R6nzCROo99lbrA4ZeeNMs9w=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: hlzevja81BssZDFR3sQJimbYhpREWx0ooQ8NYjfsJiCe9foVNZnvLm9xUVE5XSQ3iu6ukIw2dAW7GLG+TBKXuWwdjelIjuwqtIg7VBEIqiXSUEdmqdZnsOaoxEJ3N92INl9naI7YPB7655mrrm8ZuOHb72gTW88w3m0sgyCrjDd0I80zna1a64C1qMQuz4fK25VjgBbPlIkTOXJRPGjhkgh5k08yk8EJa0fm/jypgMG+mGeZnTa9oihDVM+TLInjs4NHNa4uXQdIBLdy9xBLqWGbEVuIhxLuQWFipI5Kls7LfGOMaEvOridYWu/BBZ99ehVoLgGMqNQn9X+EMQgw66lmflNiPcl6rFN/cIC0EvwLRR2KIhI+kJmVBSMgMACFYINShYOh+nNIndVOYerzSNdcNZYU7fsprcnTbolJCBFwLwiwNXVjQsre2jzoqsm77ahsHACrI3kK+tiSV0lTnxfkb0QGmxyvUbDyk5T4L4oIurA18j3Hvj2AI78DSetEmgJdHh2y31dR9PzlrixJIsiY7mNyvNnvRTB/0ZzGijTZ/LNU44l13DEfpDdbgx13W8dU1ZDRz89SlM6Hqyh0Qra1kT2BlxeJMhWpQFjYO7USL/cPIiBjkKj4Vs+rzkB1CM4Zhp8fYH9PkckGaxHpJbuHOII3WofFE/Nfj2TpNzhHNAefVB3dHA3SmS3+koxaaRV03oXagm7mjhPBawpAW/Xxn7PEJoh8qHQEkuU43npod3kJ9r0qo9Za0JsnY5YRI5i9PzetjfPewwB1msAvDg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: e683e346-5198-49bf-8617-08db71b8a23a
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 18:03:21.4162
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: ZY9Ex+hbf7cylz8+jBOGecZpq3omV9UYrZzxzqkE8g6CEnJ8ZigsC1eysapNMtClL/nG9SONCpN4hWzCXb+6/2UbOX7yf4BBDSiv/SwjHhE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA2PR10MB4537
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_13,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=939 phishscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200163
X-Proofpoint-GUID: ZxHI-ozJuU81m4qQ6gijNWUithEG60pS
X-Proofpoint-ORIG-GUID: ZxHI-ozJuU81m4qQ6gijNWUithEG60pS
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello everyone!

I'm pleased to share that there will be a "Linux Debugging"
microconference at Linux Plumbers (LPC), November 13-15 in Richmond,
Virginia.

The microconference format is a great way for us to get together and
share the ongoing work that could use some discussion and development as
a group. If you've been joining our meetings or following along, or
doing some cool hacking on any of the Linux debugging tools out there,
I'd encourage you to write out your problem statement and submit it to
the Call for Proposals here[1]. Use the "Submit Abstract" button and be
sure to select "Linux Kernel Debugging MC" for your track.

Please do reach out with any questions!
Thanks,
Stephen

[1]: https://lpc.events/event/17/abstracts/
