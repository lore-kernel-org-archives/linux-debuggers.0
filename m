Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 548BDC7EE26
	for <linux-debuggers@archiver.kernel.org>; Tue, 23 May 2023 20:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230296AbjEWUsL (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Tue, 23 May 2023 16:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42872 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229483AbjEWUsK (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Tue, 23 May 2023 16:48:10 -0400
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 18389DB
        for <linux-debuggers@vger.kernel.org>; Tue, 23 May 2023 13:48:07 -0700 (PDT)
Received: from pps.filterd (m0333520.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 34NJED96022071
        for <linux-debuggers@vger.kernel.org>; Tue, 23 May 2023 20:48:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 date : message-id : content-type : mime-version; s=corp-2023-03-30;
 bh=2Ng0waV94/Z+7APc/gaF1d23gbIpPp2W5WkqKrWCCeo=;
 b=184jZri/cNq7AltApiTFazBuEKJClsFmHuVchqiNBYM+5EEl6OtopLxCMK2on9bS8lg8
 EPRe8xQmFKwHk2YKnRaOiKdeqZuOnAd5C6G+Gha4baNib1NbDhG68uOEXaRWChOj2kXS
 chcsj3N23tv9R8fbMoH3XDjk46psYt4c+7MuoLsdUuH4MLtJPGhXb39CGZVgitGK1mtK
 /4+7EWtvUuw4YAeZGj6lLMOai9+pURB2z2pt9F+H45xi6plC1Va4eWOttSJ6u1PrC9zu
 w97dFHAPQB2q53uVA0n3TtOqRQ/dYvtWL6dXF0UWP0uhPd+MtTuoUk6TOUIywDeOrdiT dQ== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3qpp8ceb17-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-debuggers@vger.kernel.org>; Tue, 23 May 2023 20:48:06 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 34NJ2KZF015775
        for <linux-debuggers@vger.kernel.org>; Tue, 23 May 2023 20:48:05 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2174.outbound.protection.outlook.com [104.47.55.174])
        by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3qqk6jvdt1-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
        for <linux-debuggers@vger.kernel.org>; Tue, 23 May 2023 20:48:05 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=KaiDyhUpkLugE8B/Vy9kRZJcjJmqDKjz1d+65ugK8X3C1KQZJqeStpUdWc4gTw6u2yDyHX3FVAXgSHd9tQ7Xormb2CD6cJLRVnLJF2cqxCpxIgBFM4bXq+dnfv5zgl9WG/rPwzePxogCDkpMzs5Er6C5afATOEObk7y22YRBXcTJns7IC8O+kvSjFIwRjBAnJJ8gKjoEhP82dGS+0m6vIHeHizhP5oapg+cu8QtSSvpPP09qfhaPUEmzdtMSaCbtbRAW05vI2WnCgboLPiO/qGsYDExCyOmgvGC0Eywp80UDMBHUIpvgqHdieapIcffnOsytQb83AN8PrWr7B53xMQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ng0waV94/Z+7APc/gaF1d23gbIpPp2W5WkqKrWCCeo=;
 b=ZJHNrLJ87sUXwQr/xE2VrFmmJ/ab0dHWVs6qs73h1q35KQ8YyRh3uXyYK3EdmiR7+V0d6yX2RbWU8rI2/bMfcUKrGZmd78wqujdJlQQ/G4DmMvPTFXaFB4hmnf3WTGttUUGQTPqa88+f/Mf+UYOtudNh5Fj43X+IPmLMTbhj8eT277Qemmucw8k63HqxfxFArKbjvPSvnfZ6QBOxGlpYBqLfiIONRbGcQwJ64rYzBtM72foekxzDbk8cqI4QBkWOX1mg5xQE+i3Upb8cThQ+2qrhODJJCXaEtvAPnmQqBcd7UJzvbT9yegq6rxNkUzBSlNYNC4uNqzwqQv/lHwDrdA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ng0waV94/Z+7APc/gaF1d23gbIpPp2W5WkqKrWCCeo=;
 b=C6sK/S2sHooo4HI21MjZoi3ghTpIhLZR15ib0iaR1Lq7XLwf0eUVsgp//0iGSnzYGzSnGydrVBM/2a1BETH6WZsAliE2XqrP/MdqskgYAvtyzsEILX81bf8umVYiGC+I6hlUbHdpasACwGEx0NXiZocudgZI/tdSduDAMCVsCLg=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by PH7PR10MB5771.namprd10.prod.outlook.com (2603:10b6:510:127::15) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6411.28; Tue, 23 May
 2023 20:48:03 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::831c:6600:b62c:936e]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::831c:6600:b62c:936e%3]) with mapi id 15.20.6411.025; Tue, 23 May 2023
 20:48:03 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, May 24th
Date:   Tue, 23 May 2023 13:48:01 -0700
Message-ID: <877csy7p1a.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0025.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::30) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|PH7PR10MB5771:EE_
X-MS-Office365-Filtering-Correlation-Id: 8afabbaf-ecb4-40e0-39c5-08db5bcf00c5
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: ldGoE3+nuQLx+3prsu5TyLeZQk5JWUzwdoLBlqccrgu+L+QzUc8Wltzgft8+nsqzbF6SdaMcXW8SPPzZObnPkAC4uStt8eUZJ2YJDboHR7ucfK4Ff50Jqg2bBlArD/j8+OrR4Ds3n5ehFqvPps8YmEo/hB8HpDfYtlgPyhP+ifCMp1o+oLPXvNdfw9KX3ZwTTCccXkrDFdpSOY6dFhtEbLQZBvTeNkeQW24I/ccOG9k5nAIz8j36f9OC3boqWutyadI4CWSROIjav6MFSVSRMn3kruyJIGnCt26Rbun1cRNcw+o7yi4PA0b95IgI22IjFVbXOr9pqPDi2dA9rLaozN1je3FqRmXZX81eyYP7QNsMSi3oDBhxOc3+MMm1DHiWOpefeJ9bYow1TV2syOcx+Lc3GXzM5cRHnNUtRXZHJW8enDVq3a1wJwMM2BeYZUYeUQ4VWtTjdx6IXXE0XISSTRiTsur/SdM3m1VlmdS2vFyfPCQdYaBKCzn8rtxUKki170YIV4MayQD/smhtojP/66zCrdApISAVZhZ9CBbYkHA=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(136003)(376002)(346002)(39860400002)(366004)(396003)(451199021)(316002)(38100700002)(66946007)(66556008)(6916009)(66476007)(478600001)(41300700001)(6486002)(966005)(8676002)(5660300002)(86362001)(8936002)(186003)(6512007)(26005)(6506007)(2906002)(36756003)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?AGiehTGwco+3Qec0HZjXccFrkMU1VWHJiL+Aso4Na+xjTKEuop6Pyp78Nh7M?=
 =?us-ascii?Q?jm5wUhPZ42Jllr3In0SSh4j6ik4scZg4BFS71ThTV3FFv/JqDVacaJBRmR72?=
 =?us-ascii?Q?iReFtJg/cMPqQ1SnoUEflEstKB+F6tvc8igkljo77yInnrqwIAxqv9FaLDGL?=
 =?us-ascii?Q?HsPBiMqPnGNNGzSIdZjJfBCZfMHOUbVSRTYnoLWIomkRVOtyHjeAUO0vrFQY?=
 =?us-ascii?Q?b+orLhl/iVKKvicygcyiilxpFMmDpMjWE8ROiE5sZM3BsXh+BHCcHcrNc0Nj?=
 =?us-ascii?Q?XaUIyN2u2QZpbnNA0Y2q+SVp+86HLeNSdGOp924Fkv0it6tNc8StfjhbWNvv?=
 =?us-ascii?Q?y+ilgESsukTCINggvWtEShR9ssCQeJ2oYFshP47PK5e7oYTBFttoFildSe1e?=
 =?us-ascii?Q?pzJrUIzsXjlppE/uyKzeno+zVVe4NNRTQertFxKDmQmd213E7lS12NB+ks/A?=
 =?us-ascii?Q?7rLAdnDYCBKehFWndEDnpmIISkcCBKpTnnxREfqrX5kCe6Ruo7+8xsG/Yf9f?=
 =?us-ascii?Q?mDZLAHiHG2uY3iq6BGtKsaKaJ5ughN3Rqt/F5iRNFuZUHVcW+12F4ZV2HZeZ?=
 =?us-ascii?Q?zCfr6BzanobW0XWmqMCzEYvDccpWMnGI0tYWwh9429JRuPAK/mNISUOrqZ4K?=
 =?us-ascii?Q?C8vYvZIoWT/kjOAXh1pIP5nb2QeiXN2GmUMSZSj3F4zjf+TclWOs/AoPStfk?=
 =?us-ascii?Q?15K/pIuva7oew4jzYWhF1JiwsH6ZlgZ3/HnwQxsIyB8zSxJ04F6xaX2Vu+jP?=
 =?us-ascii?Q?Jo/q6vuTbXb8tKOFZN9yIM8cvyYolrMsFigbdeZW/QCsNbCu4EvZymLnzkgY?=
 =?us-ascii?Q?paR3736Fu+nNqNB6Xa0n2ucRcHDgAk+swoe6Mm8gSZXdUDiXVznP7pXV3Gic?=
 =?us-ascii?Q?RL0CZR9bQp4tdFkEkJ2zzPIvgL2dilmFA81rgXqaPsQmfnJW+7PZ++VGXFlB?=
 =?us-ascii?Q?Wt9DkQnIZ9Zj7V15VzhgZ2w9YmYQVcrqssRPWKxEQdY31F1ANTaVhOiln8+J?=
 =?us-ascii?Q?+H+JJe7N0j9dw/qoeWJe6bsQPBEnUaZcg4N0t95YdZCif9F4SL+aNW9z1wpj?=
 =?us-ascii?Q?Xi+Yxqek9v8W/0oqOy110dNdHfd2wospBVz/6hlmr9vTAMPnXgABvElypHGc?=
 =?us-ascii?Q?MR9wl8FRcpnBO6IF+nM30k72bKX2Y0L6RxinYFC5GAEsfUa8rZzfBWY2n1U5?=
 =?us-ascii?Q?PYL16Y2dAs5tHSa6y8C9yTNorHz5122Dp1SFD/p9ntI093PAsk07tI9DceLM?=
 =?us-ascii?Q?8lcdz5VHeK2HGqMJ9J1hk/agtZC3vlETNAfVNvUHUV1fS44k9uIxrM2ZKPOs?=
 =?us-ascii?Q?ehX+oNriZojpwWmD62TXnKieNXWL/TNOxGPQqgNKcWNuelXfOmHTdPXJ+yZI?=
 =?us-ascii?Q?o3zCILL8KGL2mVu6gK2IhyD7chlE4eFU6Wk+rTbaXta7Dtc6mNw43tDn3Smj?=
 =?us-ascii?Q?0bIxCpqFNz443Ee7UvKoiNiqLPdIF1w88S3+HCdp8WxLcfuhMSu8CxMtk4n2?=
 =?us-ascii?Q?1p83Gpu3AqjGsWsIuBpuvJUrtYEkTqWea5j+X5XJK26WDVr/6SL42gdhHFsg?=
 =?us-ascii?Q?r6eHsXP6FI89xONf9HG/JWUPCZYumzSUjXcCmejZG4Y80WAdy75/dSF3Lla7?=
 =?us-ascii?Q?GA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 967WGQPwKOYqhbOsEPQn8K/cpBeXavq0g8pI/kZ4PXGmYg/0KLEKv3IIhQz4aEgeym+cJ98qkN0FnqbW3JRDu85i3jE/or503Hr8xJplNp+cxKFCkXJ9MgKyRzZwDOIO62RmrdnerjFzH7qlqCff8ZV516/anAIA+OWTHWRTLkwpKNiZdaJfC9WVxiyWslDLMyTpiKxuLDv6Edp1cnuEAlCqjRbeDi4tezG9mUNDsnRoF/gpqeea/3wDdHTUhhH9J5b170aNCmTOn0fyZ2xbnTjwU5/pQNOFHJ2wBpD2Mk0YoGOYP4vmBYdavBv0wNGyeNPTwwy4bvj/lm55jdHufYzNzilO4YV63TS6AkviQs/EpxSlr+eRVQOFt4D8Hs/ULIIjbco28403+GrqYin4cc6ozLvupVNHKEOkc21xjzlBFaYkURkVtrlFNKcG/kBepX1Ucefalt6e6nIdstU7jz1rFlvXh98317JDQ2ANSwLTcO1yK7zz7CvRWPaHQadlo3RMK8H9w9WO5pyGblNBRGolk6rfhT/UGaDnRD2uhzMdT1qckdLvBJhLcspt3Hm72DN5H3sNHtQtoiijYMsnF+zwg6rwqfeo2bfshYuFR+sFgrduro4elSZo70Ec42gFiuYxZz/bSLOC6ndNIdEehTMvRe1Ol+qBb2540IkYQJQ9bCtUi5v/c9PXGfrUgoutEulkcBnI2+hoMkxxhZE9ZRpZHZlBfqkP5XWWppi35HfzLSDe3regS32rJ+f6F99CrbcmDT2GOOc5F8CkAmGYTg==
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 8afabbaf-ecb4-40e0-39c5-08db5bcf00c5
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 May 2023 20:48:03.4038
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iepMGFHLLuxEyx6gvGI4Fb6nqUbd1wUVfuyGqWrsCylBLe1iVxr9rFNHadz7+zkybU7NSyEkgBn/lG5+boi+yuIoEyNw6oGdcJMUQjtJ7E4=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR10MB5771
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.573,FMLib:17.11.176.26
 definitions=2023-05-23_13,2023-05-23_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 malwarescore=0 bulkscore=0
 mlxlogscore=801 mlxscore=0 adultscore=0 spamscore=0 suspectscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2304280000
 definitions=main-2305230166
X-Proofpoint-ORIG-GUID: rwnW1s9ebcRqqCNZTKuXX8F8f3egI58E
X-Proofpoint-GUID: rwnW1s9ebcRqqCNZTKuXX8F8f3egI58E
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hello everyone!

After two months off, the next Linux Kernel Debugging Tools monthly
meeting is tomorrow: Wednesday, May 24th at 11:30am Pacific time.
The agenda is a bit light so far: please feel free to reply to this
message with suggested topics.

The virtual meeting link is changed from the calendar invite, since Omar
is still on leave. Please email me off-list if you'd like to join. If
you're on the calendar invite, you should have received a separate email
from me containing the link.

* Linux Plumber's Conference is November 13th-15th, and there is a
  proposed microconference for Linux Kernel Debugging Tools [1]. There
  is a lot of exciting work going on in our area, so please do submit to
  speak there.

* [ Your topic here? ]

* If there's no other topics, I can give a brief update / shameless plug
  of the current DWARFless debugging [2] branch of Drgn. True to its
  name, it allows you to run Drgn without DWARF debuginfo (instead using
  kallsyms and CTF).

As you can see, not too much on the agenda, but I always find that these
meetings stir up interesting discussion that wasn't planned, so I'd
encourage you to show up anyway. Worst case, we chat for a bit and leave
early for lunch!

Thanks,
Stephen

[1]: https://lpc.events/event/17/page/200-proposed-microconferences#debugging
[2]: https://github.com/osandov/drgn/issues/176
