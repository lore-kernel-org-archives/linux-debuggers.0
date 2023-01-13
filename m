Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DAE5C54EBE
	for <linux-debuggers@archiver.kernel.org>; Fri, 13 Jan 2023 00:25:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231546AbjAMAZ3 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Thu, 12 Jan 2023 19:25:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38636 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231896AbjAMAZ1 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Thu, 12 Jan 2023 19:25:27 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE361BD
        for <linux-debuggers@vger.kernel.org>; Thu, 12 Jan 2023 16:25:27 -0800 (PST)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30CLBmFd029896;
        Fri, 13 Jan 2023 00:25:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : content-type : mime-version;
 s=corp-2022-7-12; bh=x+bKHysgHZzWSWnpDw4sxxwZiRQywqHdpLDZn33PRpY=;
 b=Lx1/Z53jRfz0e/7s8PSg5IR9UEQjc4ZovdYybTQ8MY+TMragzmpe93vfrHdbLDepwRRt
 QoPqe5rXwFXBMktmJgjubE5DyJHg26aZ/9O3JWGhgXYdQOi8v7eS7znIRFExDys+QSdg
 iGSZ3d5Rckr4dHF2PvzmDTA+9hBBxKetyoD3teV1td2fjc+uUBd7S8z8pahd4t890l9i
 UnY0XteK9zQEwt5RBFYjkvDygU64HokKQmYDkLmUDMAwANtr9WjV2h0+Dbc4vl6Ad7Wu
 bCJM9Z+uU9H4dY3p9IZbMc1N+cPVil9SkMW5n+dQTNt+AHRGylLAu3hmLpLolmhoCGHM ag== 
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n2pm50tvq-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Jan 2023 00:25:17 +0000
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30CMnbmM016031;
        Fri, 13 Jan 2023 00:25:16 GMT
Received: from nam10-dm6-obe.outbound.protection.outlook.com (mail-dm6nam10lp2104.outbound.protection.outlook.com [104.47.58.104])
        by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n1k4rgha3-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Fri, 13 Jan 2023 00:25:15 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=kAlrUF4yvD9y50EdzI8uLUgipHfJcC2hoD7jzzypjfl62GvqSZ9yZbXuORvVv+bPJS/EvNdE0Kzkliz2U7aX8QNDah/0BwxhAX1DRmdVAFQLi4KY3wgDkrKxIkhPQoR31C8yUrHmJu8Fr+if7oNi9RqMTO5Dy29dSrEINutSBcOK8v964IRplrVGdwlMXmy4wCdZsr/OsLhaMGNr2byN+Z3bPkeid7FuHZNIOIbNUz8kPPKEiTOJmsEvjBCkTJaYt0C00VaaWoWhypukDMFY9zvoI7j+PdIUbpwgS/AjmQgslmZlU8Sz8O1fIs/+EGgPpLvpc3TFgXxjQJoNchx3qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=x+bKHysgHZzWSWnpDw4sxxwZiRQywqHdpLDZn33PRpY=;
 b=R+qr368nuNg3HbIIkezxdQw6NI5+S0OHrjrmh7vlizVSA/OBRcb0PVCcluW3JKDyYDw3zUJhhPker9tSNjCrqYZJoQm4ooYvslwmlnx6geNTbqxT0gJI7/eXmImTPPahyeOTtAA6MpGGu1c9ZqpkGDPuvq/Z4eVUMyxCZS0JQ0k9ysgwAfajs70NAVRvZl6dWK585GprPv14uEqL7aGAPempKYu/3iE0/eYM6SqDVVlLgXYsBX6lcGUD6Rud1iZ1VWEtpVS5rdODcdwSABZ30TBmaM145Wkckecc2gPO2f3J0+nLmUK6+dKzfOTOVOdrFAzac3jWf5bZP1zHZ1dk7g==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=x+bKHysgHZzWSWnpDw4sxxwZiRQywqHdpLDZn33PRpY=;
 b=kkja76q8RHEaBrj9k8+fZ3VPkY5ta7oyHb9BpbyD+QT9JEyOH93gPZqWRU/dkI1Mu9V878+SNoE4r59pgFPDW20WRsHvHemYMYy/6xz/cPO5+r1Jy8XcgBaWtn2BI7nHU8g0Uyf/fgfSCv7YWfA1++yo4iFoePa6/FrZ0JFG5iA=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by BN0PR10MB5061.namprd10.prod.outlook.com (2603:10b6:408:12b::5) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.12; Fri, 13 Jan
 2023 00:25:13 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::fb4f:8219:b8cc:7084]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::fb4f:8219:b8cc:7084%7]) with mapi id 15.20.6002.013; Fri, 13 Jan 2023
 00:25:13 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     Petr Tesarik <petr@tesarici.cz>
Cc:     linux-debuggers@vger.kernel.org
Subject: Diskdump / kdump format history
Date:   Thu, 12 Jan 2023 16:25:10 -0800
Message-ID: <87v8lbcmc9.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SN7P220CA0019.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:806:123::24) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|BN0PR10MB5061:EE_
X-MS-Office365-Filtering-Correlation-Id: 57ce7a17-2f79-4f9b-a605-08daf4fca325
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: AhhjHoRZCNfjVTIBqp2dTnOFwneTnMOmLPPCkufc+t861LNWV0cWfklaiM9B10w8jUsw4WF1LInpaKzkB8Irp/XSEu6hgyEg3JsPmPDGq/piF9fTq7/3ipNLUmYX9MEUT6P1xJgP/X6t1RzcHM3KYiV7v+VQ7Lu3eSE6yjX1rOJgN8CKKg0tutahWS8gS4mZnkG3tzfgauA6ETirf6WmHTvN3wxZu2bZxMxY4NGPGIRW9S/xlaraIBXwJpTtKLXoFgwYH6aCqUWGDaUUGND4QtKWSDA7kKrHNSal9GJlfbSslbuk9nenKU1aw4eoQPv2FrdKvaJVfwCdynhjXdhOSibQjJl2LD/Jv4hCnVIc7gTjRf/VFgAviR/JZ2JPW7ZeURkT4B0ex3by0MMPZ9kpOUWAvGllyzaJ0f6EIAss8IRRWbqPtPPubfBcbdPmI9gwStzhEpLjop4Zma1P6/KyUtt8xPtidkBxm3eKmmUdUD7dFR6FyS9/zLHis7Ffeqql6FjmwwQtXrTk4gmtD36BvaO0zp2CV3hdjvvMuZQoLO1wtEPPvidYlIoJ4ROUgiELn1Prm8o6D4kvKGIzcU5YzeWLE8WPi7FeyqTUOkMS9fZXitZ0DhPNfuZ++RaktwxP92DuBxidMXI4Fky8M5Mz0Q==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(396003)(366004)(346002)(376002)(39860400002)(136003)(451199015)(8936002)(5660300002)(41300700001)(316002)(66946007)(2906002)(66556008)(4326008)(6916009)(8676002)(66476007)(478600001)(6486002)(38100700002)(186003)(26005)(6512007)(36756003)(6506007)(86362001)(2616005)(83380400001);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?uQSuEUeXpZtt0rhnvw2HtGCysEQow8Dc/B5v5P/1wgw8+E93b6VM4zbIv4uT?=
 =?us-ascii?Q?GAw7g614UmjPpzfeOr8bR4Q+5HWhlu+QfdUhPypOyPuGNHnDF3A9FnLvixUM?=
 =?us-ascii?Q?ssS0de/rHATLvRrWSFiG0uZxl5oONnQaUoBL7eNpfHLXnsNAh3tpkSccXUqy?=
 =?us-ascii?Q?MgoarL5RcS/dDx98oLHDJjFaTD/+mXuTMj4ZezCoxei/x2OD+aRqTV9uE+2h?=
 =?us-ascii?Q?SRxJ3NHs8PVK1D5oOgv7pnVOxsROka00WNZWdFSPUKSBHsn3OPtLDY+7HSDV?=
 =?us-ascii?Q?o5KK0lLj+C9DsLHzCcnSoMdV/EDXYS+g05/ud8AnVChfSuu3AOvmQjrzD6T0?=
 =?us-ascii?Q?W9UUztWoZ4YJBQnuaVp8HN4r/XaiBtoYL5BrHy6D0bhurYAsUfvamSLjBANP?=
 =?us-ascii?Q?NuXP6kZvmoaVvTbvxZC+4Jc1pJg34ipt6HLKxRK3X40GkjoA+BvOhflFs7p4?=
 =?us-ascii?Q?wUFqVoiuABfQskVWAxwGkCoShBkGJY/IQ5mzSjseDQpb9TfXlmbbWnzFh9Xy?=
 =?us-ascii?Q?ppxjTEDWXZEgJScvoDRKhkWYiSYWCSkKmrUugPUphaqs2Gvo4WbR47JOovsz?=
 =?us-ascii?Q?8RvndQKCL73g/BGZ0iWsAtnHlV53Ku7eGmtW3PFWi4xt/RoCIElH5XGS6pRk?=
 =?us-ascii?Q?nZLRNvvlb2d8DI8TCoLgobR23bBO0k6c/J16Yuar7S5SsO9YPuJ+DcZnnEiv?=
 =?us-ascii?Q?5qwOBBON7A330WRzKKOK6N5JjMQSOyrqMI95FlYDP7v39ayPgKI0XJydo6++?=
 =?us-ascii?Q?Ji7lYYbjNIwzr3uC1p2qcUvE1ohZ05OE5JRfwxupB1OnEZH4Bs5FIoEU09xx?=
 =?us-ascii?Q?GKHb7aS5bLOkBxf2ATLXbhIwZ1Oxg5oax9s1FZx+C8zT05bl2ydLAxbgySln?=
 =?us-ascii?Q?DRfK8ggdfHLdV32t/xMMqbO34nc/apv0MMo6JqgawSGSUcJqIDOZ9MeBQCA7?=
 =?us-ascii?Q?zunahRorQd82MMgC/fXdHk6wFtmHhRPhqUDuF0pOVojIOJJgQQVW9kPBGX6k?=
 =?us-ascii?Q?4qmxInpXBvJl9AmjU44+atyHQoAlzTlNl2ZTsqoO6Qj2th2M5jgMav/jQCQ1?=
 =?us-ascii?Q?GtjaQop8eJvMt+BTZEgCToc4QQ5BW2tjZ7gLQr4ryTZS/QyzJvxV6Yz8Z6bZ?=
 =?us-ascii?Q?Pm1IUeWMwEqyhw+v9QJvSU2m4fz5SI/mn9vsPjohFH2fO4E0uF5ISTXBr5FZ?=
 =?us-ascii?Q?/3b1ucdROLddBaEk1G2ygF8ovoANDb42skTXmAm8Am2mGtv+AfZp0wUq8aUU?=
 =?us-ascii?Q?d9Wb1xJehgwaRC3eLV8TKObUXuZ5AWTMRAb21aZbF0/RFH6WP7mE4PpyzCgS?=
 =?us-ascii?Q?tRz8ZzX3Q18WpdEOU0rm8R/XVx16z/BQ+w76E489ev1FIn+YoAG0ZJ4RBUIk?=
 =?us-ascii?Q?isFY//Yduwzaa4VVPCe6KjheFHNQMLg3c8BwvV9PBcJjliZzkJ8DSAp1d8Iq?=
 =?us-ascii?Q?ZC0aw9v2Gi/aNe01Druqsb9gyqpVKaewycDDxK/mnmmk2B04XKo86LlTz0pX?=
 =?us-ascii?Q?OPl5S6IzbSN8DW5/1v4MUQ+MhTqd6WzoDx5V5YNfyLb5unfoH0JErpBFJLap?=
 =?us-ascii?Q?BRsYPhkLCECrWnVo1+WnGLfcRSJ2djWeEkfMveZlF+sqrWUqbgFQcCLo1vcU?=
 =?us-ascii?Q?SQ=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: iG70Lvhfz4sK8v9lzisiawQ4R9x/3K40zLszi5fEIyJ5blF0wCSZPc85m2CZ69iCr0bA3DRDNvWjK6KymNmEa8smPEo6stKyHtvgBtsHFG6TprSd/nDmBcJXvSc3n7MlA28nBHs0d3wwEfi1GoKsBVi3RpNdJt6yxisF7aNCOa5u1mQi3WTlMInon0eW8+KthFQbUrmCYQtOotkGjJG2qLJkkzBUTgUsdHw82h7XFjw7RryjslzXQe/HQNAjyNyqzqmtLM3yfEfVtceAduwPAKd3y6YntG6YK9qb3aDVqKeeOlgFm1t2QWXSy6GTFt4rcU+q4qw2PyWwhDvZ25coqp6Yijb1PPfZih+PTWInK3rN14ThtgIg384ZKN3jTWxeyG85s/lxNTc2u8TXNbnCIJJKmKFrQxBnNgTa1XtyvbuEWmXHNf62GR+pKD5v3C8VPPlQO2k2TLY/pePnSsDEj2tkd6Xs8ishyn5M+aiko+JDobY2YFg3MDDWCL58z9rSIJuRQcD27oo8JQuXGZjTl/x3KLx93XGxw2qM0Dz9f9iS7RCnempaBpne7niCA0VCjMHH/nkzaSzTuzqyIbE4MfgGzFiLUi6qS7GKlgF4OjRGPlrh1xTfSuOPn/mOrEUDAT+JEABQbBd6bhmlvUvc5P2Qpj8JmcAN4TiAiEfRg32eldO7/89ia0iwb9DTrRyl+iAWsO22qtn9hKLT/W+TNpawDQrbljrivXFvu3/8HFDGBtEw+zcjke5fpHoJMo3CtbZmgq1Lysn4Nl0MdQLVsVWrvt4U7psGbKidzqIUuW4=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 57ce7a17-2f79-4f9b-a605-08daf4fca325
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 13 Jan 2023 00:25:13.3842
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: iiK4fzy6qK0UvRtomOFXpNvrB99YmC9bO31oMta8ejoahOJyjKMugqdFN3O+J5zV2S2e85X/Nav+Htew7/7DGXvUIepsywT9Fx+82H1rFPo=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BN0PR10MB5061
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.923,Hydra:6.0.545,FMLib:17.11.122.1
 definitions=2023-01-12_13,2023-01-12_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 suspectscore=0 malwarescore=0
 adultscore=0 spamscore=0 mlxscore=0 mlxlogscore=892 phishscore=0
 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301130001
X-Proofpoint-GUID: pf9gOd--tfPU27A20psRNmG7DoojNUeX
X-Proofpoint-ORIG-GUID: pf9gOd--tfPU27A20psRNmG7DoojNUeX
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi Petr,

I wanted to ask you a bit about the history of the diskdump/kdump
format, since it seems like somebody who has written an entire library
for parsing it would have some interesting insights. I've CC'd the
linux-debuggers mailing list here, which I believe would be its
inaugural post! I think anybody interested in debugging kernel core
dumps could use any answers you have.

First, regarding naming. I guess I always assumed that "diskdump"
referred to some older utility which performed the same function that
makedumpfile now is commonly used for. Is that the case? Do you know the
origin of the diskdump format? Do you know where to find the code for
this older diskdump tool, if it existed?

Second, I have some confusion regarding headers. I've seen headers for
files with the content "DISKDUMP" and "KDUMP   " -- and according to
src/kdumpfile/diskdump.c, you have too. diskdump_probe() shows that you
check for these two headers and set a different description depending on
which is seen. Do you know why or where these two headers are set, and
which one is chose in which situation?

Third, sometimes I see an additional header with signature
"makedumpfile", and a few 64-bit integer fields, and then the
KDUMP/DISKDUMP header occurs at offset 4096/0x1000. I wonder if you're
familiar with that header, why or why not it occurs?

Finally, and this one is a long shot, do you know any good central
document describing the diskdump / kdump format? From everything I can
tell, it seems very much like a "living standard", one which lives in
code more than documentation. But I would be glad to be wrong here, if
there's a document which describes the format then I'd love to read it,
and if not, maybe I could be part of creating it to help everyone out.

Thanks,
Stephen
