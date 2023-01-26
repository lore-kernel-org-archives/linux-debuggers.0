Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 43378C27C76
	for <linux-debuggers@archiver.kernel.org>; Thu, 26 Jan 2023 00:47:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229844AbjAZArJ (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 25 Jan 2023 19:47:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235569AbjAZArI (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 25 Jan 2023 19:47:08 -0500
Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A36C61422E
        for <linux-debuggers@vger.kernel.org>; Wed, 25 Jan 2023 16:47:07 -0800 (PST)
Received: from pps.filterd (m0246617.ppops.net [127.0.0.1])
        by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 30PM4PDI029954;
        Thu, 26 Jan 2023 00:47:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : subject :
 in-reply-to : references : date : message-id : content-type :
 mime-version; s=corp-2022-7-12;
 bh=c/BqTyBmyAwAqjHAy6iZOnWIMxE8/wBvZCh8MnRLVUI=;
 b=cv3z77TgESCLpxCFj3VD3OntbFoagg5Gaqb4C+fT8UUDg7p2lEhosqKuSLClOOHXOBzf
 zlzkxoIgULNPXLjNwx3dj/doaSyS3q2DV1tJnwBKzuITji/l8MTi4jkpiHLgEuIYbQdt
 RIqBghTfb/ojhcBihRIGSWbTgHsXRrXlckslwebNSvx6sFtlTSIeTev1Dhq8PpLfGRZF
 iM2xS9cr/qlpBj3ulVniuUy9L7YraUIGUmlS9avATspeOOWl6wvBDXY2bm2oT5CFreSg
 kbRlu9gIxQrDTdLduJBmY89M5fpzZqT9ToymHLqhT1YKsTBtvlG1nwW834hCnC19lidq 0Q== 
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
        by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3n88ku1a19-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 Jan 2023 00:47:06 +0000
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.5/8.17.1.5) with ESMTP id 30PNdn5x019083;
        Thu, 26 Jan 2023 00:47:04 GMT
Received: from nam11-dm6-obe.outbound.protection.outlook.com (mail-dm6nam11lp2173.outbound.protection.outlook.com [104.47.57.173])
        by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3n86gdntwd-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
        Thu, 26 Jan 2023 00:47:04 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZeuLEWVU2CU8QBR27G53x209tol7bitmThX2HNAhlAtlqBP2qfqVbi87yYIHgPwDMqXsAG74sJ5si0p8cns3ostQssjYYFIngp5LCWexPsORTGsChQcKF5lTv1PuNxT1J3SvEMDvL5XqYUCy4RdabWDyxVNwzGDn6djA3LvILf2pT++XVTeEJl+BNHAjHNMX+n9qNv9nT46+/5vDx+vvuJbmq45S1hF/wXjAcKKqJDtnX6p8g/ou3VEwGn5ATrU/zk4K+RLHLvoABffdSUxJJexZ9Lg+QmT6Zl0GGJ2Mtr091RT95RImkpNHmvqHsNYat/wgeoqY01fDo4mBlq8FYw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=c/BqTyBmyAwAqjHAy6iZOnWIMxE8/wBvZCh8MnRLVUI=;
 b=Xu5azvYjSDwDsGpocy620PJTRkUBqYokHlQ+XNyIApikkL+gxw1Mb/VqwHbyqJS8d9IamS/OTv7KTGp03eJXkNTNlfKoPRu2X8WREi5kCe+FfRQzg77ChDKkHSaLtc5qKpxSmjmyp3op6Fh/onZhE1eRgHLCpUQ3AGrGFwlvrg1GtC0/1TYBqfUjyfJaLSqecBxRutV8WU+y9jNV2tKaUbofunEqmh8H0rdBpxqUYdFVdmEAGhgeXdsJVD+7m0TjfHoJ30WTFN+Xv12jYud4PO9fxj8MmLeQ9WXFXZm2x0OtXwGv7FUg4RXC8fGduAFPv07KFHEcehQWo8Nd/tGW1w==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=c/BqTyBmyAwAqjHAy6iZOnWIMxE8/wBvZCh8MnRLVUI=;
 b=aQyO7sRkyuYH1i8OTsaGB2ks/sJfQOQxL17+xOp5ky2Cw+NhxPnE27DsVdGiQT2nTg4jE6czd6UWpQ2EcaVq/2LbcLaV9GamZ1X92oP6DdSvI4dBUwPwLdVjC8ZJtCfmLtWoj45Ujj3mVeh+kLrkhG9skxnuhDJYn3+NC3pSaQc=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by IA1PR10MB6854.namprd10.prod.outlook.com (2603:10b6:208:425::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6002.27; Thu, 26 Jan
 2023 00:47:02 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::fb4f:8219:b8cc:7084]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::fb4f:8219:b8cc:7084%7]) with mapi id 15.20.6002.024; Thu, 26 Jan 2023
 00:47:02 +0000
From:   Stephen Brennan <stephen.s.brennan@oracle.com>
To:     Omar Sandoval <osandov@osandov.com>,
        linux-debuggers@vger.kernel.org
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday,
 January 25th
In-Reply-To: <Y9Gg+PqIVjSTn1wn@telecaster>
References: <Y87pyvDebF7YBQTZ@telecaster> <Y9Gg+PqIVjSTn1wn@telecaster>
Date:   Wed, 25 Jan 2023 16:47:01 -0800
Message-ID: <87r0viazqy.fsf@oracle.com>
Content-Type: text/plain
X-ClientProxiedBy: SJ0PR03CA0253.namprd03.prod.outlook.com
 (2603:10b6:a03:3a0::18) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|IA1PR10MB6854:EE_
X-MS-Office365-Filtering-Correlation-Id: 22102b51-0ae2-4ccc-2c52-08daff36d6b1
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: H/hlEcZ8fh6Ge8FL50o8sKCfakhSG9JmoX8DCJXAUzHAFQVxJh2FuYTc+1MbAts5e3tI1+pd60VAhCSGYQQDfXPX7m/IqpMD0T6+1QW62EPqd8ST/v8TjLpBn5avELubKXXVmcEWzu6AUGxYAK4fT+ezFb7G/ZLBcYoLb7ypjOA+oAQp8hXV6ay1ADP/DxQ6XQhOgBCZNOAgAjbcAYpo7wAXIrJvRiu9OdXCAN33cIB3UNq8JP2IRCk2udMaLEL7MybfRO/RtolksQxHLI2eeMDQifRbSJ0JC1BjTmpw6o0Pn4iwP99CdayRxld/WCI6J3pwfQbkU2eP1HABLQ6wKfSzQE0GeOBLr87e7Ea2zMsJ1HJRGWkFFl3Xnh06qQmtpDQMwFiN69n15B/Gep+hogYUm+fMhWEGY0YB/Fko8eJVAmEVH7XAJssVJBHqMvvDqLJWLA35+6CQMFdvKIPeeT6O4NAk0ABULZe3eLBRz5zpcWsZpIsUGtZ1xT+UTZj9iZLbprx+XUkRoJbl9g9LYPfu6p8zFMPtC4cqzJ7yo+65odWfUpU6c3pTkxiQMjbiJfG773g3YLTAXtP9cO2+CREQqSTqTc1ejWGmPpHUNkMN2oeacMRS3Mi59tEFzSHoL8Q73nm5PZKGnKvMFg+8IyJ+dZdx4/R25chcYaYKBS/vOR8dMN0KmYrbrMffjvkQOH+nQt4ZfmT+fmcGuCMrkA==
X-Forefront-Antispam-Report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230025)(396003)(136003)(376002)(346002)(366004)(39860400002)(451199018)(66899018)(6486002)(478600001)(86362001)(316002)(36756003)(26005)(83380400001)(6506007)(5660300002)(6512007)(2906002)(186003)(66946007)(966005)(41300700001)(38100700002)(66556008)(8676002)(2616005)(66476007)(8936002);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: =?us-ascii?Q?3AATNbeHKoJ5L07hTJXbNhF9PKGbV2iFML4Frq9ZkhnwvzzdI4ket4zWDSkt?=
 =?us-ascii?Q?gBUjVMOPYcsmEJtz97ZmY3lnUC3ZfPRqQG8nUBxuGzHSlyJ3WsVgjCR5S+DC?=
 =?us-ascii?Q?Q/eLqLQV4vhI5Qz7myBqIrZeyfIRC63sYsKfNOJYYwW21X/XPYJcxioKDNwg?=
 =?us-ascii?Q?UAyWlxPJo71MJbgdzfAJQlF3XvDWz1oMMGMwIBJeCNfGfFVF7zbuwdSyY4mN?=
 =?us-ascii?Q?aHKasy71+xy2EhVS1LiGxQzKpD0LDyvSyg1pQmS8oaQB8Y5GS2mVyoIks99M?=
 =?us-ascii?Q?tO11UuVbs4IKdsZQTSPVRct9k2t8r81kFngRJ6UWBWYMbRNB6POOCtMN03FI?=
 =?us-ascii?Q?MLyAF7lVuLbcmFAr0HY4jebaKJObvhA/h2bs3687Otj1Pdr3LvxwFbGGpXBr?=
 =?us-ascii?Q?OdszdfJ8XP6Y69/Z1i1f5pGt0Z1MdFA6L3YOwizVBMBn9OlE8v0GjLtDYuzh?=
 =?us-ascii?Q?aEeD5b6R5pRhdxJXv+xqkt/kxh4SnsCnf7bIAa21PznUllfq4k89lVcQNkX5?=
 =?us-ascii?Q?gQhzvN1/FMcep+AfH90GYp2UvF3gmjsYzvUmGW8jUkHsqkMLFo8MipoRLm5A?=
 =?us-ascii?Q?MarLBpBV8EUqTFsEjM6BwDkbxQu2IRnDOCTaMO5N1ad35cNdR+Kkjcz2ap6q?=
 =?us-ascii?Q?gLtqzUnGXgXTCMOn4hFEInZhYeNz/XhXPdvye6/cbCliDohjz3sJ7YarrYvJ?=
 =?us-ascii?Q?LycFRcXed9lidA51VR4HDXO9k78afjJkHLKH0uueYt0h+PBvLm/Ywl8pdmC6?=
 =?us-ascii?Q?/byHsFYSgAsjuQW+db5t1KIgx7zC6bhvibKl7GYYay+WpoNmTEuErhDEc0DL?=
 =?us-ascii?Q?iiQjNEIgEuiv1wHImPG3XFwe5reoPuDf+HGE+AqS7rDwn8Q7N1TQkL08CWUZ?=
 =?us-ascii?Q?LfTFF4OgHF/qc/9DZ4kS8vxe5xVb8/6zLXwrGTGBCdnjdC/tBwITgFo88qbl?=
 =?us-ascii?Q?b25sdIbnp3YWBl00rjBlI3eoaNdWmkJlraKiGOvdMFLJBBvUUit8S4P7UUbe?=
 =?us-ascii?Q?s5dSlomAEGjL+sbgwfVEZx8gSxn/0H+hT8u3YL75rCbKWqjFeNuYbzz/yf5B?=
 =?us-ascii?Q?1+cpgXK/62cuPhplJGJhNbnZ2K4XzEG4jhwUoZdPmEXn0XMSDIH8zs5dX9Jk?=
 =?us-ascii?Q?2nTJf0LsaLQcWmSYFCe9oqaDclZF9V/JR0Iw8gEYx2xo1aIPAnA7joAYYljy?=
 =?us-ascii?Q?cnZ3Nd8zsPkqsBxkALDz8u9fmXHNm0Q9iGbiHGjUWzlbDIP5GUDCrOpOHtJ9?=
 =?us-ascii?Q?LFuMzRJFgLKaLyPF8suuQnHXi9Pj81oyC4Jf9mo7WsdRyQtTxnQKeYlORF8h?=
 =?us-ascii?Q?GbiDk2IIFgCz8rFTgaGtqjVWN/46egyMl12ixbwfZVshMyInT/TK1GFocM/h?=
 =?us-ascii?Q?jytn46LPGxcUDlDBcrRU5YEPG3zo474xgckXwIk8XfLGjg81MdCjofjK6rOs?=
 =?us-ascii?Q?s5aVXV1HCAcw2X85XUlrRQPEhS0VxBOIBxeo2pgeZYSflY476RvKMcmmBYvS?=
 =?us-ascii?Q?oyaBdGDwW6DAx8Yljn3nWPtQHz7s8Yjq+kgCoKgpvtrGMoib/8W6N22hpSfF?=
 =?us-ascii?Q?Dg4++UGKRHeXLmsGgHdiMJT1xfsp8uec07HqdWjMYGhyCoXLpSVUMvOMqYNb?=
 =?us-ascii?Q?xA=3D=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: qh0agB416nokEybwWRNw2u/4gN/j2oNBVix3tsXBwsGcEe5N1sji6dLEYNOVEbP8VHLoth3d6D25hU3gO37uBAgAzDJ0XAild6oAS/st6MXa03JlzrKlXCsyvPG5wbBOwO89U4QlEDmyPBE9O8aViQhevgdCgd3D9xawAs6Cn4OSUVmimlPtVIO5e9g7Fuw/LC9Dy5sXcIGFBD0aHG0v6n8llv2Y+XCoEJNcUf3wXRndDKlIiPiYE9gru2+/7n3BOELQk0q++jEelg60GkvCAdcZNdE5qfvAgwFPPJAhWHovf4ZakD66gnryt2EH0FngTaI+BA6flLiRI+UOFPpAqA2ikJB42o9t4IDOj3nKoHKxpAnQz4a8lASAQmxeNUR0gF57DIZ11lilyfcty92M7sQPSPBkuxFaXzAHNW9tj0AS2wyXZrw2OY6YbXYh3NFg3qVF7KSnhIxwwiW026cpBXJ8KJk0y/3DreFNOt11e3mKZdbxjPHyY7UaK3WX/41ah31g+LmiUCESde1cVhuUY+D15ODnnhzcJuQ+NRhoIFkYvzfvT0ypVivcUtKLisw0vCM3ziwv/yjTChtbRlBmfVfSZraJkgdQArO0YqUyDQqHHTdGeurwq2P3/d9+HP/7qeFnGXoEPhXC0PZYgJlplD0iaUEtX56ih9BLopXsaaax9VHKJVS6AWB5UNUF2/e0yLW/T/ojjsDq6YW0Fi90uPtnxERhBB/tuaP/SGbPq0MG3Da9xK54LkHIiXunPbV2hTLy0kwIKhPYLAo//YYKpMY/SH2J755dickVixPuLd8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 22102b51-0ae2-4ccc-2c52-08daff36d6b1
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 26 Jan 2023 00:47:02.3629
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: PbMGyeobTKIcYjwO0DwtHhLsWVVCpTJLLKtDibcw73V1WmZ5J2GasbKMRdedAtFl6tUzAe2uFLNwCK0O8I7y1k1aaIZetwyHZDl8HrepxQs=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: IA1PR10MB6854
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.219,Aquarius:18.0.930,Hydra:6.0.562,FMLib:17.11.122.1
 definitions=2023-01-25_14,2023-01-25_01,2022-06-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 phishscore=0
 mlxlogscore=999 adultscore=0 mlxscore=0 suspectscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2212070000 definitions=main-2301260003
X-Proofpoint-GUID: 5lpvQXqpXinVFXSQLKXPIJzqYfAXGMtU
X-Proofpoint-ORIG-GUID: 5lpvQXqpXinVFXSQLKXPIJzqYfAXGMtU
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

Thanks for the notes!

Sorry for running out the door at the end of that. A couple comments inline.

Omar Sandoval <osandov@osandov.com> writes:
> On Mon, Jan 23, 2023 at 12:10:50PM -0800, Omar Sandoval wrote:
>> Hello! The first Linux Kernel Debugging Tools meeting of 2023 is this
>> Wednesday, January 25th at 11:30 AM Pacific time. We've been having
>> these for a few years as a forum to discuss development of Linux kernel
>> debugging tools like drgn, crash, and more. Now that we have this
>> mailing list, I figured it'd be nice to publicize it more widely. If you
>> would like to attend, please email me offlist.
>> 
>> The agenda so far is roughly:
>> 
>> - Is there a good way to iterate over all online `struct page`s? See
>>   https://github.com/osandov/drgn/pull/228
>> - Pending drgn work
>>     - Pluggable symbol finder from Stephen
>>     - Slab helpers from Imran
>> - Dealing with `DW_OP_entry_value` and `DW_TAG_call_site_parameter`. See
>>   https://github.com/osandov/drgn/issues/233
>> - Call for drgn/contrib scripts:
>>   https://github.com/osandov/drgn/tree/main/contrib
>> 
>> Please reply with anything else you'd like to add to the agenda.
>> 
>> Thanks!
>> Omar
>
> Here are notes from the meeting:
>
> - There doesn't seem to be a better way currently to get the constants
>   needed for iterating sparsemem. We should bite the bullet and make
>   them enums upstream. This won't be too hard, but it'll be a bit
>   tedious since they're defined separately for each architecture. And it
>   will only solve it for new kernels.

Initially I read this and thought: "future BTF and CTF type backends
wouldn't be able to take advantage of this". But the more I think about
it, I'm wrong. BTF and CTF include enums and enumerators. I think
there's an open question about when a type gets included into BTF. For
instance, if no function or global variable has an enum type, will its
definition still be included in the BTF? I need to do more research
there.

I only remark this because I want to keep track of what the future
"alternative debuginfo backends" will be able to support: which drgn
features will be available so that users aren't surprised. EG: source
code mapping for stack frames is (maybe obviously) not available for CTF
and BTF.

> - Stephen Brennan is working on making symbol finding pluggable (as
>   opposed to only from ELF symbols). This will make it possible to find
>   debug info for kernel modules from `kallsyms` without loading the
>   module debug info, for BPF functions, and more.
> - Imran Khan has a bunch of new slab helpers, and on top of those,
>   helpers for validating that the slab metadata makes sense, to help
>   with debugging memory corruptions. Some of these require `slub_debug`
>   to be enabled.
> - Ross Zwisler is working on setting aside the vmcore from the kdump
>   kernel for the full kernel to access. This works on x86 by marking it
>   in the e820 table, but Arm will need something different (maybe in
>   device tree).
> - I'll merge the workaround for `DW_OP_entry_value` from
>   https://github.com/osandov/drgn/issues/233, but there's potentially
>   more we can do to actually recover the value when
>   `DW_TAG_call_site_parameter` is available.

Honestly, it's a bit tough for me to visualize or understand what the
DW_TAG_call_site_parameter values would be, or even how common they are.

Do you think there's a possibility of some very basic, almost throwaway
implementation that could be put into an unstable API somewhere?
Anything from a patch that could be applied so I could distribute a
pre-compiled beta, all the way to a release containing an "unstable" API
that may be changed or removed at any time.

Sometimes having _anything_ to play with will help come up with a
design, even if it means we throw away the previous implementation. I'd
even try to do it myself if you had an hour or two to share some
pointers.

> - Jeremy Carin, a teaching assistant at Columbia University's Operating
>   Systems course, is looking for good resources to teach beginners
>   kernel debugging.

Honestly bravo to Jeremy and this course. My Operating Systems course
was entirely pseudocode, and we were allowed to substitute Java for C on
the homework assignments, if we preferred.  Don't ask me how that
worked: it didn't.

>     - We weren't aware of anything great that already exists, but we had
>       some ideas for the future. Specifically, I would love to have
>       step-by-step walkthroughs through kernel bugs with the core dumps
>       and debug info available for download so that you can follow along
>       with drgn.

I've thought about this for the purposes of onboarding and training with
tools. The main difficulty I see is finding the actual bug to debug.

We can of course manually corrupt data, insert a use after free, or add
some logic error, but that's... unsatisfying. And many bugs tend to
require so much background knowledge that it would overshadow the tool
training. There have been precious few bugs where I looked at a vmcore
and found a solution readily apparent (and most of those times were when
I was the one who wrote the bug).

I don't know if I have a solution there, just some thoughts.

> - I may or may not be around for the meeting next month since I have a
>   baby coming around then.
>
> Thanks everyone!
