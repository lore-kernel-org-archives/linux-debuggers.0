Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1FEE2EB64DC
	for <linux-debuggers@archiver.kernel.org>; Wed, 28 Jun 2023 21:04:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230499AbjF1VEC (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 28 Jun 2023 17:04:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48500 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231956AbjF1VD7 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 28 Jun 2023 17:03:59 -0400
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CA931FD5
        for <linux-debuggers@vger.kernel.org>; Wed, 28 Jun 2023 14:03:58 -0700 (PDT)
Received: from pps.filterd (m0246627.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 35SKibYL019779;
        Wed, 28 Jun 2023 21:03:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references :
 content-transfer-encoding : content-type : mime-version;
 s=corp-2023-03-30; bh=+VAfp3ZdUOIwvrPlTG0ayUGVWICam5CKEanLf6PSLYA=;
 b=2EMJ1whMB2IFVyhlR9TCBIxQzxVQglWbJTWM1XIK60bjSPyuSPqViIHSpfssr4iiTMpK
 wmidEHF0EfLE2YAnpCdCSaXtPfoAvkSySeO8H7nUDQfb7IeF+w9Te1TOAGh7h3RiYTmp
 JH+xk9SPKH5SQFnRXSZuG9copAT5Q6NTUSuM2yfpYrQO2Xtj29v0HavikW9NboQyl9zE
 N7QrD+HZo/+SB9P3G2Hdk4IR3XrcYHo3F1bDCYDIWqHGuuWkT8cLiJEBvlQSztaWGARK
 wBL2lK1+zZ+ZBr0sAQtT4yII5y9xSuRcVfuZtDsGTgM+pxn46VpvYQzeAfukwKtF0gMz TQ== 
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3rdq31199y-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 21:03:53 +0000
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 35SKhqu1029663;
        Wed, 28 Jun 2023 21:03:52 GMT
Received: from nam11-bn8-obe.outbound.protection.outlook.com (mail-bn8nam11lp2168.outbound.protection.outlook.com [104.47.58.168])
        by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3rdpx6jjdj-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Wed, 28 Jun 2023 21:03:52 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=baIG0j529eWPtC7pvr8xs6Fy6W0mOTy+9BMMkRKjpO8Tn1JCjs585/geRyIidibDyzjUy2W+Yj6l5VQVYciY+KFywh2sN9IHu7mdyYntlVlvGl0EyEwb4QVSks+Vxsym4vadIaeF4W6FEGmZtjQbKe6dqyghxcho48CS7/JcKhWsgAnUCxXdVD8EBUk3rRyXUKFus4JR9D1TN0oJEcBz1uCVQEN6mywIrGmj+dlPopzGF1Ot9sAmnP6D4jVekmFgV9u6Uzi4MommoK+WVFGF1KZTFj3tlIz3BwnJj1Nd9f2rp2L2JqsXgh181qX4UOA0jKV6JiTDt73gxZuzCiSswA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=+VAfp3ZdUOIwvrPlTG0ayUGVWICam5CKEanLf6PSLYA=;
 b=Hg5tZb1NQgIft5Xwb61pPtgRl6C4OFkEhORB8BtJfUkT9FljPMUzGX30bgiT5oemlZIn5KmjEA5m2K+42m6mRlRK46CVxTi4y59GwFj1+6pZRfK0KsxZvSLiMI1UjnRT3HH5ml+OsDZ5QtNuzdKFsatsArBJ3P9hoMJGJeiqyjZVyVGtdWXBiyZF2FbJOap0rIzCvXQxrq4M2+UgQMzQ3B3+YD3vInyC1qDTjcwDpKrWUN1LEtgIQ+TR7wedW0UwxVJSx51DEwRRw8VrPXHb0ckA0mzCXpVDmQy/AKfYedzvxvccIoqR21Ek6HKMdIKSpXZoodTWI0Rf4lpRT1pGfg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=+VAfp3ZdUOIwvrPlTG0ayUGVWICam5CKEanLf6PSLYA=;
 b=dtBwchOCcALJ4b/IP+JHbqUF7mZPBMAwKyHfSG+Kz3xuqE69PR5Z+hR39H0rq6E2O8zr29T6G0uyKp2KMiFVuvzg2ysK6n7/EUwhOHeT8hoW7f+8Rn/zch2BQGwvOlQqdTtMKEqha8avIARWR2CFYF9SQrc5F9jUDonKU80g84k=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by BLAPR10MB5219.namprd10.prod.outlook.com (2603:10b6:208:321::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6521.26; Wed, 28 Jun
 2023 21:03:49 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::59c4:9f51:3ccb:bdef%2]) with mapi id 15.20.6521.023; Wed, 28 Jun 2023
 21:03:48 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     Petr Tesarik <petr@tesarici.cz>
Cc:     linux-debuggers@vger.kernel.org,
        Stephen Brennan <stephen.s.brennan@oracle.com>
Subject: [PATCH kdumpid 1/3] cdefs.sh: require bash
Date:   Wed, 28 Jun 2023 14:03:42 -0700
Message-Id: <20230628210344.357073-2-stephen.s.brennan@oracle.com>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
References: <20230628210344.357073-1-stephen.s.brennan@oracle.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR13CA0004.namprd13.prod.outlook.com
 (2603:10b6:a03:2c0::9) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|BLAPR10MB5219:EE_
X-MS-Office365-Filtering-Correlation-Id: 3b7829b3-00f4-4bf2-b2dd-08db781b2b29
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: WtSW27Hb7cgsHg75WO3e0XdibdNXwBrAtitv77phgUGJBZnQSIfSTv4jD4pDdazcwVam25j3bA2NcIVIpFyCyWheJw6m8nyWN1C+QS//cxbGZSITG31nryHkSOeT+VpzgShqldB7Rs5JfBhVHHjP/W2oFBwx5okFK8fYkkGyfSfJOy1gcYLxgjWjahSVNym9Z0rsKm7PPTQ0DXujOppF/xJThRJum7cZHNMk8JeNcV8SQiiNfiOGZOWFEEPAwa57ZdR/06B17pQRWEqrxuLI/1zw2+7sLk6HSKbaXvIklAOnHGGUkadX7Y2VrNOpFtyNDjA/V99AMqLTSkQsGhvpVxEkvU89mu6NUy/ao+1PKjVsroa64srul+HntJGuhAeORoXabAp4LS2aovRvBj2NdpOZjhRmmChnzsCDP8fOkOml4tBbU7rJyXtwhtIyi4QHbqT8bKCJJb6sqRRgAY5eZr4898gTRC2bQ+0YP05WTXI1C2RsoZj8elDkgZi6QHIiEP+jvXAD5/e67y2TdCmhk3H6SmQsOOaz9iCqrWawLNLGyPA5GQGowD5zd4uG9ZTa
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(39860400002)(396003)(136003)(376002)(346002)(451199021)(36756003)(5660300002)(38100700002)(86362001)(41300700001)(66476007)(6916009)(8936002)(103116003)(8676002)(316002)(4326008)(66946007)(66556008)(478600001)(1076003)(107886003)(6486002)(6506007)(6512007)(4744005)(2906002)(186003)(83380400001)(2616005)(6666004);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?Zz59V9b5tQnLw17sJUX3pKUHsunaHsGcokoiRm7gFFZCEq+MxzLlR14SlIJk?=
 =?us-ascii?Q?uIFyzr1wjdwfSTc+/VcYNDEhPUOnDCSxtA9mHNE8MSRfzbNqli0PGvMlWoL+?=
 =?us-ascii?Q?AqOPChsjhQHGm9OiBLG0gWlwkxcrQAnPrF3Jd8l06E98AybDD4ma89Ag9RPd?=
 =?us-ascii?Q?Prj+zJnKvFn3zFb7dHR9xugZow5IbKQUMZoJJZTxY7PsaePGsdzOFxXzUAb9?=
 =?us-ascii?Q?PBJWQNgMRicbTaXhzGEDMjM55j+5TxcaaJvpeMhAu+qV6ITYYuv2W94h4ah7?=
 =?us-ascii?Q?uUMSNn6f6JFHX3QVxNTg01sO718OfSwAmjptsP/3tMhzSOVQr1tVKUURvshF?=
 =?us-ascii?Q?SPRlWHFxTc9LdsRzR4pNRd+FwU1p60LReQSa1xr3p3EfqVaTyc2nIKL7RdhE?=
 =?us-ascii?Q?4HMtu19j2xJPqxlwyUDgdJgeNEavrKIZu4UoitWxs5CPsvO+nNMd9K5x8BRV?=
 =?us-ascii?Q?0XdKIfdi0G1RQDSP3ErHbwdVLAGIwH0fVulhJeK65wL8jO9uSt685MVspMIi?=
 =?us-ascii?Q?f4DMCIgPUYNivugefYCySFEutD63Xg8EV1qhy4zTHns/Q8NS/U0rmaV290HO?=
 =?us-ascii?Q?YkRZmNlbljxoremQ7C36wxSKfYYu0/iDmLXHHYDFWtv/wIeN7EwtxJcrTrIB?=
 =?us-ascii?Q?gSv8MqM3f2IaIweWKt0gE/0+raSDULSX1Dpqt3FTRhw9ffJJwQum5EphtuPS?=
 =?us-ascii?Q?oN9qkcm0FKIJ4Md+X34fmvKlg+VHJ7+ynpS08xcNuMRmok+n5OOUDZbjq9h2?=
 =?us-ascii?Q?ij5t47g50ykBUU+NJWh+5lk+UtOYpfLTzRitPdKX2xx0bsLdHHQ1/IUvDi2t?=
 =?us-ascii?Q?3ML3p/gn4hl9m4u1SaxO1ESuNLB273DZ8VDbznV1DbXYpxtDM9Lnf7nJw4Cs?=
 =?us-ascii?Q?3MAIWb+MKZL+pCndtVxIG/2k0pczNuZjMLMJsp0Pixqq+F/uJOumFzkRssal?=
 =?us-ascii?Q?zvSUgwctQpA17sptE8ScRe0cnhRhpmA5wRanmbYUSJwiYgZYZl51TnTotXAC?=
 =?us-ascii?Q?liOEem/FEnT9I8WbCfcQP85/FO8asWNSigvP2vJfCTApbh4/gWgc77ctT5cX?=
 =?us-ascii?Q?H9gAMWgr6/uMRQ3Eo1zUvyy8xvcquKmHVX1IogFyYq0rbVA6ezI3V7q2tpqw?=
 =?us-ascii?Q?MmF5cDPuC6N6AH3Pj1OdY2rGsV6PZkqRNwiLGlNU1YwPtonqu2LCglK+QtZn?=
 =?us-ascii?Q?m6BTyZXig5MMenPiGfM3VIFWnwknNwAo5UknXNwmjl4p5bO7MjnF4AQujuS6?=
 =?us-ascii?Q?bN+LQo3MvQtCnViRIRk+cQMNFPHsmmv2DocNMaaqhpeAH8diUreGs9VqDCAA?=
 =?us-ascii?Q?jGa4ldBohz0h+IBxcjZv3UDaCVi9ONZp/GguMTsaOZ84LOJoKigDL58YItWd?=
 =?us-ascii?Q?zvVWqt5fAvHCyIy4bcc79PcCD5Pv9BS9LDcUDTbjIU1X4xJ9wv7MStarj4/3?=
 =?us-ascii?Q?R6zZ3Bb1bK4PdrfvHJVR9tiLbVWOsvtipo0b9dw4DM8jaO+WdSGnfTbvbOpJ?=
 =?us-ascii?Q?NyWlRyz6SlW9Ajn/EuHKnaixjpLjU6oiGq4HSKtLbuam7DH049359mWDuVns?=
 =?us-ascii?Q?7zEQ0U5ggeZ78dohoQfO0DZf66CdpemlOHg1hlJ8DQfI50dTv4HZhmjEdMgl?=
 =?us-ascii?Q?hHJrA4Q+sAW6J6R+yLQx4CRvuRhBws6rpUEdhsFr6SRP?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: uhj0rE9JhAmqFbfbsL8aJ0IB3hq+gck7Y3dH3KkZdLGzTSd3TU03PCOY6UdvBCeE4jI5N7PQO2xdFSYH70lSJ8BD7aZsRJfiC5a1Cnq94zTn32Vm5lC0Pk8HMHa5h7aQzfgevp3G0CnuDoqp7pigU2nPG6UoAPvbHpkbxNBVXsYGoU2hq8eUi/3OP/C+y4PKLNSg6OUejVMSI55ECtC/BIQQfLDIN0m7ksFnbNukOCJBABOA9ZsoxkyM5FUMdJ7i6MdHItLamfY3pUCMgqcaoQHnwicBqqhDHeSix5+bhloC29FBbUOBK1Xa9K3az+HxcrK/DQMJ0Z86yfK9xzKxbj76iipMEhztgQ+KvFEN8uujJEkFOpviGBTNiMFZLQkpXaxzNdfdBRniRCrEg51Hb1lHDRo80yW2i8S6F2uzV+yCCXthFCSjsEs3anenfLv1zqayGPSa4ZEU2Ki5scGRAANTgMI0s+l1Kd88XMCQdoNT5kID+Xeob5sKBSY9+qlvjmOQtDGqoHpoui7a5NulXI9+mQv7xHbrmhwZO/iDJexI62V7vM+QibdU76stZbAH8HXdU1DvalgZoUMnDnf3PlCNYHCngUM2HbSaiT4/GN0ZQNwlvy6tsWdb5GqsK7u/Nva99IrXRABHxgBI61kqNh7mRViIIuF8wW7r0nWKJM00sC5f9ICPLz8q6xylTTNtvDJurmCnqwtfT/gbaqOcmeADUqjWXYFHsITboy8ZMnrNUi1HL7VOoziVM4qTVq7WhTczfeteBahNlG5u1cYW2RX10pvqU2sGqOngqZ+4+zU=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 3b7829b3-00f4-4bf2-b2dd-08db781b2b29
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Jun 2023 21:03:48.7893
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: AIJ91JmkW0xs0WkLSamaUkNugjGZKBcStC9eE10OgGz4QImwTlBULlDbj2TmU9Uxi/AYMdCg3QktXTdcfpFVqoWLXYxXPu0LBpKmkt+RkaU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: BLAPR10MB5219
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.254,Aquarius:18.0.957,Hydra:6.0.591,FMLib:17.11.176.26
 definitions=2023-06-28_14,2023-06-27_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 suspectscore=0
 malwarescore=0 adultscore=0 mlxlogscore=999 phishscore=0 bulkscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2305260000 definitions=main-2306280186
X-Proofpoint-ORIG-GUID: rHnWfvNJalAT5aE23aFQWm5evvfURnKS
X-Proofpoint-GUID: rHnWfvNJalAT5aE23aFQWm5evvfURnKS
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

The "&>" stderr redirection feature is a feature of bash, not sh. Use
the correct shebang to avoid the error:

make: *** No rule to make target 'dis_asm.o'.  Stop.

Signed-off-by: Stephen Brennan <stephen.s.brennan@oracle.com>
---
 cdefs.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/cdefs.sh b/cdefs.sh
index c2d3de6..a056556 100755
--- a/cdefs.sh
+++ b/cdefs.sh
@@ -1,4 +1,4 @@
-#! /bin/sh
+#!/bin/bash
 tmpdir=$(mktemp -d)
 trap 'rm -rf "$tmpdir"' EXIT
 cd "$tmpdir"
-- 
2.39.2

