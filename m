Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 37846EB64D7
	for <linux-debuggers@archiver.kernel.org>; Tue, 20 Jun 2023 20:31:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229576AbjFTUbb (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 20 Jun 2023 16:31:31 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34892 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229478AbjFTUba (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 20 Jun 2023 16:31:30 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3E008E6C
        for <linux-debuggers@vger.kernel.org>; Tue, 20 Jun 2023 13:31:29 -0700 (PDT)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35KK8v2h019479;
        Tue, 20 Jun 2023 20:31:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2023-03-30;
 bh=XuitM5iCMmT2rIYvMOtOJ7Sei1gxy3ZuIBBaq9U/Nwc=;
 b=eGe+3K7tFhtYc6qHGYUSzuB7j4IWCtLVR8KRNkxv9NyrEiJ1M3q8LNFM4hhk15H3QdXO
 kKXEADWTuA2eaBOqs9OeiTBqd6K3VA+SkXZRuIocWZN/ljSPYbc3PUY7Q7RqGNm7+PJW
 8b9FRGeIv7gRru+/ONoR16DkeKAfeO6M9Ol9bsoVv2nPM3ew19O3kDKIaJzc71pd+xAM
 EZCdlMQyV/RzwOc9FO/X+5n3VxRnXqnx9RKLRgLfAAzTf+d4UdnFnEu9x0ikkVfTidsQ
 IW3JUI12XGX6j8Mbo4AbIMLD9N+q03HrEEmjleZK3L+mqK2pU4gp213Yul1pKFJrXqY1 Pw== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3r94etnsc0-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Jun 2023 20:31:20 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35KItmB4032868;
        Tue, 20 Jun 2023 20:31:19 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2171.outbound.protection.outlook.com [104.47.57.171])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3r93963u9k-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Tue, 20 Jun 2023 20:31:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=dKNcb746YxxkgkX7DXYqE7ktxf1bv9M9tWPNgYE4XUN6KbaAGfAVASZmOlLX6ixlZv6LSHf64C5iS1SKFbW2/7rlcEg9jGk4r80fz8qflqv8nHqCGDuyWNGewi0ykOlVmvHBdr9T8sNDnloqEdFyy2/MT8kn6qTq4Ebk/AKm6AYVW21heHUw/aVEgnPKK1kkV/Z5rF4eGx7beo+cuLUBxdH9NnpQHBcgHAp1TXPBTI7UGHU2OTDGnIl452WBivKyYURUmJw0SArTLnzLtJd4LbkbP/Z0lMUnOeHcQt3OhFZ6aQu7XEDcoltV3iDbHqoygWd9G+NSSkXGKyq8Dy/lnA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=XuitM5iCMmT2rIYvMOtOJ7Sei1gxy3ZuIBBaq9U/Nwc=;
 b=gWOEVAeX40Ax5Jwn/VbMjvzhlCFZdHIK4naFcaUHhOnG5vB1W+gTzjwBaGfadwMHgT6b2Rsrc7YyyVMZReDDFfWPnX15XNegCOenUxaU1XgbF7wd1MxC81Q6xIWXpWqqb+JSV49D0JZSGsNiPJyN6K9LBid5+TiSJxSpEpFstqbc5dcokb8DXLVXzYSLhua8IzgyZaG8V2GBmwe82JkdRHv9nCcGeU4Jsliy5bvGE963N3nU1Y0KX3bm/WvuaLpgG8eE7zdtMP40OL8/KBFYc+1cY9V7X8u70Z0tJp12nhCZE5fnMPE9OQC3Ip4cxliWtDvNs7bbVyB+iHHc8/10nA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=XuitM5iCMmT2rIYvMOtOJ7Sei1gxy3ZuIBBaq9U/Nwc=;
 b=mYU5k9mmkCpuHKLivNaRFfTRn66xBRSNZN2jS/g+6cQa+pzTPI0JlxVIlYSWt7MFJ4eDTaJ+BBfKfA9/0Ob9rhz5cD9BatXIgfpCACzjHeooL7hgtGgUdYxCCHClD7H1WvGCCHZzsUdoLzIlOQP5K0Nk+z/A5gEEQVjqwzQ0bR4=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CH2PR10MB4151.namprd10.prod.outlook.com (2603:10b6:610:aa::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6500.37; Tue, 20 Jun
 2023 20:31:17 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef%2]) with mapi id 15.20.6500.031; Tue, 20 Jun 2023
 20:31:16 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     "Guilherme G. Piccoli" <gpiccoli@igalia.com>,
        linux-debuggers@vger.kernel.org
Subject: Re: LPC: Linux Debuggers MC - Submissions Open
In-Reply-To: <44179b06-6d15-eb41-fb0e-81ebb963d972@igalia.com>
References: <87sfamvwnt.fsf@oracle.com>
 <44179b06-6d15-eb41-fb0e-81ebb963d972@igalia.com>
Date:   Tue, 20 Jun 2023 13:31:14 -0700
Message-ID: <87pm5px4dp.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SA1P222CA0077.NAMP222.PROD.OUTLOOK.COM
 (2603:10b6:806:2c1::24) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CH2PR10MB4151:EE_
X-MS-Office365-Filtering-Correlation-Id: 80191f80-9480-459a-5960-08db71cd4c50
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: DJsF8TTNpojyzXfh3DE7Qgy19/b4k+qMHULv+YIFCggH3FyHQSDtwe3KDv5YFrOLyoJ9oabTZbFpk/CWG7fBAGXFrr945VCe7HyDYLEmUml/W0culm17+2RF0P1b5qoSZink3egJSyqZCxm3+9035ygh9d6EzUf8EeYlZzdsfV2uHgof/ICwh1sUzgrI/DUYlLAJq8p+tzAnePxvFNDlMR4Vprr6PQFA1tLYXxFxEWkFSrXA6UBkNDS3dcBSqgaclzTG5k95HVxvBJ8t1TeasTJU09ETi8hLLmnhGmlfKY8UfiYNPBnwfjjCvMfjLiSvHAatJOrft/BxhqEzlaFasXGcvqoycAAT/WrBxg00Asj6Q3MPTWkkn0VOYgJcQdmYpUqRTUjeG13+tXhwb+Uv7VvZUbcpj8NXSu9VmxG5D3lQADWyVeED/yktiK/jCtk/JdwHAORFAdTny8+BBobBa0I8vnfN5n6rViqbIfgE7Rt7C2DpCI5bZpsZYY7xwlARU2IatRYUKTRIOhW45F3Xx4z3cCiKgMNh68E3ESegFFU=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(376002)(136003)(39860400002)(366004)(346002)(396003)(451199021)(966005)(6486002)(478600001)(2616005)(83380400001)(6512007)(53546011)(6506007)(2906002)(186003)(5660300002)(36756003)(38100700002)(66556008)(66946007)(316002)(86362001)(8676002)(41300700001)(8936002)(66476007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?LU7vHS1s8Ur8WhBJnUvhXhT2Gw+GTwZ1MIO04B9mLn8jlLNjorYdvYzRVmlU?=
 =?us-ascii?Q?wNJq+FvK4UbBgo2tKBo9W3jgN8UGd7/FT04hAC6olczaYU3TBZHFiQ/Egk19?=
 =?us-ascii?Q?j4DOJFgBMheT+r4DrP0I9jxlxjwgEwhaVcEguvWp1NNdb/k3AwYdDqvQwfBK?=
 =?us-ascii?Q?ms2dXWnqj7I32qihlljOgB/m7mUuVG4kNbbdzzQxN/1+UvCzkraTMyINFjMn?=
 =?us-ascii?Q?6V2+T/qVIw5rqXA5+554C9g54x+MuKAZuNkeZSn2E52DjovfChzSxA62wdIq?=
 =?us-ascii?Q?VJwY7v6XQBZcnLkNKwa4Y7SxiNrZ+UliwshyTta0JBVpq8BX22Ujn8WSmf8J?=
 =?us-ascii?Q?JkE5BUVGDTikg2z3amWmeFG0CkOHVUVaX303/puR35d938f4/0YBMTwxe+aE?=
 =?us-ascii?Q?0RdFKM9EGn+d4r6aQGoJEytZ/sXlnaVPrcBCIHnmziyB3OBFlvEtlgh/KGy1?=
 =?us-ascii?Q?qg8C0Q6QRLI8o1mueA2iWqhazUlR8O+5R90oGNam+Yr1A5qiQS2iBJTGAvoo?=
 =?us-ascii?Q?3HnwWypZpEBLJSQrsrJWd2PKvqFQsouy5RWYyPjkgJhrWjkfiwyPZJcDKyGZ?=
 =?us-ascii?Q?5gMcq4HrSOvUwfqmcuXqEuWubC7hGOnPXQLoAv1vkFwpJ8W8rUifF/wtU0Ym?=
 =?us-ascii?Q?Dn7C6Va25xJH+Wbl4agum32xgHPhO+e380hBC5Y7+uYUPQYI63mATK0daHXR?=
 =?us-ascii?Q?M+QV1VuRAvIrrgOXuzQbcXohAxYQiRS0gsI7q8+koiulKBXzAvuFC8j8CcH3?=
 =?us-ascii?Q?VjMOnDBEfF0sU5P4mpmyxT8zkQ5I10B65Vr7Fz2Lh9E9MRHEdtprHp9W9fT5?=
 =?us-ascii?Q?aQg3n+MV6CGQCUbuBdhPwqlbjcu15lyDO1zih3HoyhjuUS9qLj4FplB8l4ku?=
 =?us-ascii?Q?sJZsVB+1w1hbRsF3pGQOH4q5e5TlPpq/4czHHbKTfUhwyfnn+4xpx9c+lErW?=
 =?us-ascii?Q?US8qTEXD5VTN+e9byyZReSD6W8xPvIXAsFxOKMx7z+XW3dNzogaK7zPY+T3j?=
 =?us-ascii?Q?7fPSHhg1wIK3iyjE+7azcWzKM3DEmwhyA0EjooQZHl97Zo8QWx7NSWOznufe?=
 =?us-ascii?Q?gX5pNb3XZ3bbLTabAdX5cZ7UIV2S/HHafXL/3Ikxo1N8bH+MR6u7DR3B8RJs?=
 =?us-ascii?Q?9HHZORFhqV0JA0VBOVzuU5YVZqAgDkN9P/Vfmj2SyHV+bZPA6gEm2QZYbHj4?=
 =?us-ascii?Q?/gNC6zCkD9nsCunhljj9X9DaUUsNaU/t8lofv2z3KXKyGamqnk7dYyCzEz2p?=
 =?us-ascii?Q?B48/sfI/ugex9zAWAl7q8jvY3R6kbDIp8xoB0MNZ/Sl7HnR0P+yDc/1q78fM?=
 =?us-ascii?Q?+HlxofF0COzMEsTOOU70YxjHkbk1d8kC5VQ5QD5uSOacLPjMx3luoZAgB2fe?=
 =?us-ascii?Q?Qm21BqZzvrAeUKRjW5FeytIgK6h6vEwJKe2Ic25eVD4SBdChy5Ul/1P0gttO?=
 =?us-ascii?Q?o/o7vgl9ziIsFgdp19Y9c6uiFY7bRXZiGbWMb8KR+cm4wyd61rA9d0vnb59r?=
 =?us-ascii?Q?I04RCgKg9vMxb05B/hIZ+6sn08snJHMcsWl1C3xitUDqttaRzMrbUVr614+0?=
 =?us-ascii?Q?jDs3JefN6BppOwH3X2sfxzGcTN6RnTRKf4ApiJezmpuWLrgTxR1r86JH9e9i?=
 =?us-ascii?Q?rZ+GT0ntoUAeDPMwGGRRewo=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: xxtZzoRAwzqVmX4DxzcnhV9eaHv4tKMknURv5XzV2400eRt/O0xEnxqX77jT1bs8wLkuFWQ6Po4Kd60fkOp/J99Appod+2zurOaAIc5/68tNpsPECblPvkOamtHsE3K1sLw9DD67wEYhMo1NjuEXOcyemQQf8FOb/ozBTWudzzvE6UdY1Dnw0nm559L7MQ/BajD8V8vd/zD7LO1crg8jBhrQXnHH7p0souY1ziit5AvKGZsEJGM1QYQkPKn+YoFOrDAJRuWIbntBcx0kq06q0rlDRy5noKiO5pMuzZPxc9EKkw/z3xn8KN8UvgEuJk9nuFZlP/AQ6d/FoqiEQjBd4+oaY1nzmPCpxUeZhcNcq8jK0kdah5ki6XTP0rcuvjvSmk5w0ExnFjdjDdVl7GREnU+AU4v/qhiRrGnnaBkkDQRYSITttB9TROBwee3LXNp4hrISolelyfmOxOne8z37Iut1k3Rf428nSHt3B0pf4Pwoeb7H8kUqryzV7MKuv9r+HqIxHMg6U8L7Rk+UYgDsXh+8PCJEu5g6GFu43Xd9yJ2xsAr+q+hN+owY7rFgsuobYU+ubsfKZWpWlgoQaHtUAWIMMnjFbTdKVfGrV67AcOp4cPSAYHPlAaS9AkOmyksyQdCkrxkkUAbcVS/kmUsOc9MshQH1f5Fph5TBHTEv+mJ2yarfb/OAOfz273LDU8CSOgcrr0A//JHRY3EzODtXByLFPEmig0UEzLdwEdK6GTODSG4z7ncmKp75QXWJdsC18PsaorJ0ybrevnjd9TVuZGRBcZVT0b/TD1KRwyXvcz8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 80191f80-9480-459a-5960-08db71cd4c50
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 20 Jun 2023 20:31:16.7823
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: CD4iwGB1R1mD1+hr7Ra4i1JO4VLIYb4Q72EoFMp5kMECZWuroInfklrS46vjVH2xYilPF+nqIkwtu3HAsT6bnMnXud21AyiZ8wWFuDsBPQk=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CH2PR10MB4151
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-20_16,2023-06-16_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=999 phishscore=0
 bulkscore=0 suspectscore=0 mlxscore=0 spamscore=0 malwarescore=0
 adultscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306200185
X-Proofpoint-GUID: HDCs6CwOrA4FGH01u81YfpM8BaBFmWY3
X-Proofpoint-ORIG-GUID: HDCs6CwOrA4FGH01u81YfpM8BaBFmWY3
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

"Guilherme G. Piccoli" <gpiccoli@igalia.com> writes:
> On 20/06/2023 20:03, Stephen Brennan wrote:
>> Hello everyone!
>> 
>> I'm pleased to share that there will be a "Linux Debugging"
>> microconference at Linux Plumbers (LPC), November 13-15 in Richmond,
>> Virginia.
>> 
>> The microconference format is a great way for us to get together and
>> share the ongoing work that could use some discussion and development as
>> a group. If you've been joining our meetings or following along, or
>> doing some cool hacking on any of the Linux debugging tools out there,
>> I'd encourage you to write out your problem statement and submit it to
>> the Call for Proposals here[1]. Use the "Submit Abstract" button and be
>> sure to select "Linux Kernel Debugging MC" for your track.
>> 
>> Please do reach out with any questions!
>> Thanks,
>> Stephen
>> 
>> [1]: https://lpc.events/event/17/abstracts/
>
> Hi Stephen, thanks for the announcement!
>
> Let me ask: in order to present, is it necessary to attend in-person?

It's preferred to be there in-person, but not required. If you're
familiar with the "Big Blue Button" system that has been used for LPC
for the last couple years, it will allow you to present remotely!

> I'm planning to attend virtually only this year, but I'm working in
> correlated areas, so I'd propose something if possible to present virtually.

Please do submit it! I'm happy to help test your presentation setup at
the venue, maybe during a break before or during the MC. That way we can
avoid any technical hiccups.

Thanks!
Stephen
