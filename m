Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C982C05027
	for <linux-debuggers@archiver.kernel.org>; Mon, 23 Jan 2023 20:26:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231893AbjAWU03 (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Mon, 23 Jan 2023 15:26:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232137AbjAWU01 (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Mon, 23 Jan 2023 15:26:27 -0500
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 72C9E303C5
        for <linux-debuggers@vger.kernel.org>; Mon, 23 Jan 2023 12:26:21 -0800 (PST)
Received: from pps.filterd (m0246632.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30NKE0JK014392;
        Mon, 23 Jan 2023 20:26:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2022-7-12;
 bh=mKwDgQcXl4DXFIkkMt6gJP2kJZKthbFmQE+w7MvMEPY=;
 b=zI/whS6lLqaTXsV0YK/lW/YVI2zIjxASJYQ/yE5d7ZoSQZvVPqh0Ae/a/bo16bGmzNsT
 nrM9niILqRFliHfjZ/KKavkh4jVn/uc4CV2ZgFaERy2VEqWY/j9Nv7Rn5Bk9Kp3/LPdC
 Chl6t5csPXQUTaUsl3K+U7twjMu2tekzVJU8w4MF8Q6t+sUZ6mN6IIvG5dX+nVHNmGaD
 ae7O3vSzaxuG5pHsEpIZXQaMxqrIagJAZwMDrwxidh79hSXnNm2zX/YT7FOqayk9RaQ/
 07ZM279sseuDIU7mBbS8ugVWkUNSJsK2r21kfTjOG5KjbaPEaPUjfJb63CBDl01/MRMM 2Q== 
Received: from phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta01.appoci.oracle.com [138.1.114.2])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n87nt3t1j-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Jan 2023 20:26:18 +0000
Received: from pps.filterd (phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30NJ5Tr6011629;
        Mon, 23 Jan 2023 20:26:17 GMT
Received: from nam12-dm6-obe.outbound.protection.outlook.com (mail-dm6nam12lp2171.outbound.protection.outlook.com [104.47.59.171])
        by phxpaimrmta01.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3n86g3hx1v-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Mon, 23 Jan 2023 20:26:17 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=Yyo5CxLQhr4/bss+9qsOZrOVOCgM6WSjuUYGZwxG5eyT630k0xSxdujl/Gh30Y5V5kVxlR/oVFUCzlMfIAvdqKMOO6o+gaZHVMpedq9tSqMveAapgYj2wIkIDnYgRntjEdJ3YR/3Nfrs3g0rsFWlU8LOMDj2TG3mHiPuK8LuZZ/c/X4igJfZxT1WdIk0DhtMDDvVric4UVmZru1ZoEvVakwjzimbdqN1Buo3Lgu5Oo/Y6qe8tpoUIP9VnH1hL7sUHYM7NykXWWD+BBGCOB53D4G/FLoi1RcO3zav9GQMj+4YP+nLQQFo8UkSHzKKdcsRNI/inq12f5RCBBzebTt+7Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=mKwDgQcXl4DXFIkkMt6gJP2kJZKthbFmQE+w7MvMEPY=;
 b=B6e24PhZbYYrn/KppA4vGCzRk4Z0e6BgOiE3YAL3///RagcYMWdciWJL0niKBbc51kqMHC7/jKojM3sENVHQFYgneksDApJMHLY74nGfYGyVghv9nUAA6ivBxa2yKKOtbvx8xHY/tuLE/rRHvfKkJ9ENMZcoSgjgSy+GNwTRVAv4xHz7V9eeti0l+oBrthP4u+wd7jk7gjTnfw4FhtDGtWJBU6NnJDfoPN+JCCGg0BAfNwVBp3fzX6js6Bxfo5nZSNlQenwiKmVd85YE8XHXWuZzIebmHKsukEYX2GzG2BRHp+c5n9kImSxWy6c215H8T3pN1q8kqbLW+STGMy9hLA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=mKwDgQcXl4DXFIkkMt6gJP2kJZKthbFmQE+w7MvMEPY=;
 b=ezelLYT1LSfNe9RxdcS5CcWHgPzk0yjiJxHVJjPdkF9A5mKetBx7BzAVt3mwHTlB5kWgnKaV0Lh7DRB2rv2SsHAXPXKiD5QZYJPI8O91a+pP0IZe6BQRnL2tAG1rIQKFEcUJ5CVMAzh2r3naecekkQ8DVvk5qT+0+uAoMGAincI=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by DM6PR10MB4186.namprd10.prod.outlook.com (2603:10b6:5:218::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6043.16; Mon, 23 Jan
 2023 20:26:15 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::fb4f:8219:b8cc:7084]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::fb4f:8219:b8cc:7084%7]) with mapi id 15.20.6002.024; Mon, 23 Jan 2023
 20:26:15 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc:     linux-debuggers@vger.kernel.org
Subject: Re: Diskdump / kdump format history
In-Reply-To: <20230114222936.73730968@meshulam.tesarici.cz>
References: <87v8lbcmc9.fsf@oracle.com>
 <20230114222936.73730968@meshulam.tesarici.cz>
Date:   Mon, 23 Jan 2023 12:26:13 -0800
Message-ID: <87o7qpngka.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BY3PR10CA0016.namprd10.prod.outlook.com
 (2603:10b6:a03:255::21) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|DM6PR10MB4186:EE_
X-MS-Office365-Filtering-Correlation-Id: 6ceac232-69e8-4e36-ea77-08dafd801347
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: mMULh4/8gEqJoy4JoVOOR3uAJuAhQQEHHOpxEWXrNLhVQGMHb99JyieWr3ONpujTEPxB/rdw0RucAmAN++JiDDlKuJuwATiSJVO8a5nFP2Mb9AlA7whJk+JiTZbI+CFceXfNaurJ7HY3hXDoZMaMpXum1NEjryA/7C3+k1toJ1F3aLEoWqqpqICOdgUui+YygoyJCICdtgGmEa99Ddcuapbd94QZF0eMjWo+52VTCIfniH5FskcjY8AB2wEISKZXlfWz6gu0xgoPg9G4XkjUPXUXk6WnvsSlkD9G9xBPPdCFUhbDgCmpiUrnovR0aLkuY4xiiPStvy2wy2sLAJJcByQfbR02/UxrN7w8c2y4z1oqbRB/VrBKjeHez3EkVNz4+pVAeor9oQkYkqCUMIpi8VnQvo+zoFb5orMIDUJ6notxracgPTOVbAEiOrmVGt0bzrw2vFgl0xN3U0wdcLx4F86eFgkL6x2Soko2zo6+RVaB/rzrehbzitTNRqh/9vYYeT40Lk+NwRuDa5G2uBAQluOiTWBJVeCRjJaCcKRig+i279KlSWOq+luAKkiLNrv5WZMIQAAa4SF+aKmBWfMD9cjt+aiCSvQ8aUbA4akjPWt4ofv64o8A7WBmz/52u7eTstOf/oZy66KkyGH+GxybYOYIAMZCr5HKHGkNTo+EA5Q=
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230022)(39860400002)(366004)(376002)(346002)(396003)(136003)(451199015)(83380400001)(66476007)(66946007)(66556008)(86362001)(6916009)(8676002)(4326008)(66899015)(36756003)(316002)(6506007)(26005)(186003)(6512007)(966005)(6486002)(478600001)(2616005)(8936002)(5660300002)(41300700001)(2906002)(38100700002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?utf-8?B?UnpDeXJ3U000dEtzUjhFS3JNSGZ2VmpHNTArRloyUXErRDlGRGZzV01XSVc1?=
 =?utf-8?B?d0VmRGdhbUFvQ1MxeHpRNTBrZTNBdm9vTEVVaGRxemdVam5rSTdST0NWYXMz?=
 =?utf-8?B?OG4vS2RzNkhMNGZwcU1vTFlRRngzaVdKc2h0dDN1cDNVK2dqOUQvU1BiM3E1?=
 =?utf-8?B?MFBnMUhmdmwydGkzL25BbDBGL1RxanNnQ0UzQy9vQWZzSzlTQXNpNlVXaVZF?=
 =?utf-8?B?SUFuNS9ub01aVlNRekp1bGR6OUZRNzhYS2NZajBkdWY3MWdwb2ovajlGbEds?=
 =?utf-8?B?OG9MRVJUSFdYNXB1QkFlRm9GdTFVUVFKZGhZSGdTa0k3NDJ3V1A4L3A2bzlt?=
 =?utf-8?B?U0IrVVdUZHFoZTNYaFFaN01rKy8zZVNHSzRvTTRtU1RrVDhoVko3NGhtWlJE?=
 =?utf-8?B?MUtReklBRU1sZHQwN1BLUlQ0aHNsdHpzQmtadllhUkNRL3REM1NFZWVicDVH?=
 =?utf-8?B?Rlo3QXVxVVg5Lyt6ZlFvUnozUlRGSjlmbU8vZmNzVnJCdUtBeUJmdUlXVFFv?=
 =?utf-8?B?RS82Z2FjRUJ0a0RtVU9qZEFacTBva2VYTFNOUE1FYkp6TWhxaWJaSDV6c2F3?=
 =?utf-8?B?TWRsY3NEWnRtRlQ0eENWWlFPOFJwSVRBdUs0cTVOMVY4MCtJRWNvcUZFS3pY?=
 =?utf-8?B?U0cwYlkzTXhLQUZDL2RaajE1ajN1a1c4M0NxUmMyV2V5Q0lWazlJQ21iTldj?=
 =?utf-8?B?QnFFajdkN1dQWXhSMTVieVlVNExvekVUN0pNWkVtWGRnUnNFcXRkZzZoMXZX?=
 =?utf-8?B?bHFac1VUUjlCRk1pKzRJTjQwL0hFRm5NMnNObWtRakJrQmJGTkUvemJSdHVl?=
 =?utf-8?B?enNXQ1BXdVFUTmdmd0Vrc0RrNk9NOVJBUjhGa0c5UEFwQVk5ZXd0c0Q2ck1C?=
 =?utf-8?B?V1Z0bnEvekVUcU1BSVRSQU9SOStaa25WUTY4bUJRQ0NiVCtNTG9KeW9qU1V2?=
 =?utf-8?B?bjNVT3YzTVJUMXRMVExlV3Fycy9mVDAyN3hEWE5WcnU0MjVaUDRsbDE2cVJh?=
 =?utf-8?B?aFdDam9SZVhheDhQVTBTdDBVQWxJMzhZaHVDd2FwbkZrSlZvSXNKSGtDSVNF?=
 =?utf-8?B?Q2dhM1BUNkZoU3UzOHp0WFM1bDZ6TnZoN1J3SmJOKzhHL01JYlI2dEJuZm5t?=
 =?utf-8?B?WVd1bEVrK2N0aDdDdVU1eHV1OCs1cDYwUXpBcmJPaUVXdURvYW9Ic0FNNkwr?=
 =?utf-8?B?VG1LejRUOTMxdm1vR0ZRK05uczN3ZzAxTytGM3J4N0ZTZjUwMG5kZlgyVGFv?=
 =?utf-8?B?dm1TTDFkTjIyZHJwRHRxM0gySE9LWm9RNUd5UEVrTS9RTHNFZ0pBZGVIZEZi?=
 =?utf-8?B?M1Y3TlFySHFDYnZKSXBIMUsvNC92WWFEZFI4bWNuR0NLVnkvSXlUSXVjTGN1?=
 =?utf-8?B?SHRZZXVvSWhMSzExdTdLM2hYLys0YWhGbHRvODNMMkY3WThhZmJOOUVsUjR6?=
 =?utf-8?B?MUQ0UFhoQzZaNk5MVjZIRDNCTTI5MWs5SnRZUEhIUHpCZ1JSV3BLbkpRRHZi?=
 =?utf-8?B?aVpiY3ZZVWVFTTBQYjBnUjMwVzM4dkJsR2pPb3FSRmFHalJHVG0ydmJCQVh6?=
 =?utf-8?B?WjEyTkpiSVE0cDl0dG43NGhha1F2Z0FPWk9lYmQ2QnFTclkweFdPVFJWcU56?=
 =?utf-8?B?QVJVV29VMk5zdUdoOS91OWdZY0l0YisrUTh6ZFBJQVVRWFNmV3RUTzBQL2U4?=
 =?utf-8?B?Qm9ackR4ZWozNGdTLzlEdE5adk03Q29tSE01SFFmaEJGNE96Q2c5SHJOOVRp?=
 =?utf-8?B?L0NXZ09rZkU5YTBZclBKOGpVMFh3emtrTkk5QnBLSkZvOW5VUFBGT055aURT?=
 =?utf-8?B?WTZSUmJPK3NMcm9JOXZNQmNLaHBVSmppQ1RaYWgveEFEc2VJeFJFTU9hclRD?=
 =?utf-8?B?cTNCK2d0MnU4S0p0Q21xaGRrVmovdmhsY2t5YjdMcW1xblF2SmwrbzBWTHRw?=
 =?utf-8?B?eWdDa0dTQTl5NWZXN0c1aEFpdERYMXhJSlNoZlBOTlI5OWM1dlVBc21mcDk2?=
 =?utf-8?B?TmdqVUFad296RGUzZDRqVWRCUWlYUUIrZk1IUkh4MkErOWxFcHduVDZtMzlP?=
 =?utf-8?B?Mk12MklVWFNMZEVYK1FEbkNETFArbnBCcHdYcTFvUkpJNDNvc0xFNHJiaytu?=
 =?utf-8?B?eisyVS81eVh1RFNDaVVpK0c0SGhQbEtoM2haZy9mMWFQUE5MclY5RHliQ2Jn?=
 =?utf-8?B?M2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qkgb1EN5YP5c3+WsLHyskgF6NyYQjrZbXK3czx9xPoDMFJYvNjzre3aMYM6bTitl5jHJIxgSskp2dmyyB4uLQRyEIssMj0JyWIM4p3rYBghia1hBCPvjNJ1mokf60l9ZneYGBXyls5n7t4dAWUVT6gWHS/RseQ4KLjqOc4UvCKBHZycYit9ssq+CN8CTN7prnFk5+AgYxmrj0TQR1kSVCJHVJ8sFmb/w1gf+zRZ+gd1SC/PTboxj7nrhao8pJkxVy8zHviGLIrlt+8NDcBbI0q7SjbzgFtA21R4NPRYpvSZIiO54UA6V49+fmk3n3aYxV0Fw2iotHm+cAklZTbv834jdLun5SMq+HUvtEOJ9NTnZeD0bvC69gzSIs13qNd3gB6/EWkXFkzwYxPEppa4EuAtbki1pYR73xmiat4Fs1DoV86YvEYc6LnUEIG8Hbid1IFwDBvyjmCWaQRad6ObOatqxFFMZEKapePdOUE8jtciS7TKadWsx1GWWOPHATH6IMW4l87XctCRmMB1hSxpgLjEb62+gky+fXwjfgic6OB/pzDATSHv+kzFjzHp5OWtCKS5zGVkOHwJBujojYZcxFOu/nq7OU9OQ1th5uUsyB3rl7BS79DHZGvGOod5e7kA2R310oY942wp0YVM0DdJrqhjm9rmSF9VM3aKwVvx0F1IVItewDiDN5kN8IThsSflwJ9K7FjTWjyCnghWK20SO8pWNqvR6Ysgiv1mpPwA5mLeO/R8JafBpwqy/S8qie6frqXjis10zWA/41aNjn9y7iYSCOlDZaR70YsWgCZ1VuFw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6ceac232-69e8-4e36-ea77-08dafd801347
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 23 Jan 2023 20:26:14.9498
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: EwSfI5zlW9eXvrMEUxmdXXu+bKq4ZayPo5hfNIvuQ9o7BQfj4eX8gp6jKrW3CQGVLwbHnolhSFd4MLHHSbuBiU6Cwb1KT4cEa73F51oyD2o=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM6PR10MB4186
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-23_12,2023-01-23_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 mlxlogscore=999
 malwarescore=0 mlxscore=0 bulkscore=0 adultscore=0 phishscore=0
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301230195
X-Proofpoint-ORIG-GUID: IZdOU4GcY_84fyP28T5-xUt9G8WQikc8
X-Proofpoint-GUID: IZdOU4GcY_84fyP28T5-xUt9G8WQikc8
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Hi Petr,

Thank you for these insights, especially regarding the flattened format
and the lkdump + diskdump origin stories. I don't have any particular
follow-up questions, but I do intend to take a deeper look at the
different header files used by different projects and try to build some
documentation. I hope to make some content in a community wiki or
something which could summarize the high level ideas, and provide links
to all the different implementations, past and present. I hope to share
any and all of that with you and the rest of the mailing list as I have
updates.

Thanks again,
Stephen

Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:
> Hi Stephen,
>
> thanks for your trust. I've been around for some time, but I actually
> came late to the party. Below is my understanding of what happened.
> People who were really involved in all that may add a lot of
> corrections.
>
> On Thu, 12 Jan 2023 16:25:10 -0800
> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>
>>[...]
>> First, regarding naming. I guess I always assumed that "diskdump"
>> referred to some older utility which performed the same function that
>> makedumpfile now is commonly used for. Is that the case?
>
> Not quite. It did not perform the same function...
>
> Let me make a short historical excursion.
>
> When I joined SUSE, SLES9 was the latest release and it was based
> on kernel 2.6.5. There was no kdump at that time, but a team at
> SGI worked on LKCD (Linux Kernel Crash Dumps), which was an
> out-of-tree patch to the Linux Kernel, some user-space tools for
> setting it up and the lcrash analysis tool (which was, as a matter
> of fact, simply horrible). Most importantly, the dumping itself
> was performed by the crashed kernel, using a special polling mode
> that was implemented by a few device drivers. LKCD offered two
> options: netdump and diskdump. This is most likely where the term
> "diskdump" was first coined.
>
>> Do you know the origin of the diskdump format?
>
> Yes. Fujitsu developed their own Linux kernel dump project called
> lkdump. It was conceptually similar to LKCD, as it also ran within
> the crashed kernel, but it did not use the LKCD file format. IIUC
> they first modified LKCD for their Mission Critical Linux (or
> MCLX), but they soon discovered that there were some issues with
> the format itself and designed their own format with the signature
> "DISKDUMP".
>
>> Do you know where to find the code for
>> this older diskdump tool, if it existed?
>
> Yes. Have a look here:
>
> https://sourceforge.net/projects/lkdump/
>
>> Second, I have some confusion regarding headers. I've seen headers for
>> files with the content "DISKDUMP" and "KDUMP   " -- and according to
>> src/kdumpfile/diskdump.c, you have too. diskdump_probe() shows that you
>> check for these two headers and set a different description depending on
>> which is seen. Do you know why or where these two headers are set, and
>> which one is chose in which situation?
>
> "DISKDUMP" is the signature of the original Fujitsu lkdump
> files. "KDUMP   " is the signature of the makedumpfile modification
> (that's the meaning of "_mod" in makedumpfile's diskdump_mod.h
> header file name). Yes, there was a header_version field, but that
> wasn't deemed sufficient. Since the lkdump project was not known
> to be dead for sure when makedumpfile was written, Ken'ichi
> Ohmichi (the original author) was afraid that lkdump might make
> conflicting extensions to their format and bump this field,
> leading to two incompatible file formats with the same signature.
> Note that makedumpfile was a project by NEC, not Fujitsu.
>
>> Third, sometimes I see an additional header with signature
>> "makedumpfile", and a few 64-bit integer fields, and then the
>> KDUMP/DISKDUMP header occurs at offset 4096/0x1000. I wonder if you're
>> familiar with that header, why or why not it occurs?
>
> This is the flattened format, which is used if makedumpfile writes
> to a file descriptor that cannot be seeked, e.g. a pipe. You
> should rearrange the file with "makedumpfile -R" (or the
> makedumpfile-R.pl script) to convert it to a standard diskdump
> file.
>
>> Finally, and this one is a long shot, do you know any good central
>> document describing the diskdump / kdump format? From everything I can
>> tell, it seems very much like a "living standard", one which lives in
>> code more than documentation.
>
> This is very much the case. For the "DISKDUMP" format, whatever is
> in makedumpfile's diskdump_mod.h is authoritative. The "KDUMP    "
> format is essentially dead.
>
> HTH
> Petr T
>
>> But I would be glad to be wrong here, if
>> there's a document which describes the format then I'd love to read it,
>> and if not, maybe I could be part of creating it to help everyone out.
>>=20
>> Thanks,
>> Stephen
