Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B04A7ECF
	for <linux-debuggers@vger.kernel.org>; Wed, 10 Jan 2024 01:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="lCS/kCox";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="o82XfIQR"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40A1Gnm9016918;
	Wed, 10 Jan 2024 01:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=Z5iVX4XlnONK6GddibaVgdhL8dTtFO1LJB/8g3cIYxw=;
 b=lCS/kCoxxTZ7kLwV+rb4xfDs7smR+fs5BhU0S4SaVHkVr9ofpMcmtmylNRXo838g10rs
 4K4Rmp83IV2RMOua04rQcc6ZT7iwHui2D2dwjjqWt8RuYZmy1wj63u8YVB7wRAntjlwc
 tzCThJOXqRSrw+0lGkDRDWgmFXKMLU9wu3xRgcLJk7yTnVffoQ4nrv0PeG9DITQeYGyd
 9dxEe7NGW4fOG1P60z/0uJnKb63ZVo7lRU+vRT/sSnAJmN56yPYRYPlT/DEl7J78OLze
 ydoySjEAamOMNhGjpWGj5uXU12luW8ne+3QZ4wq/GMEFXMszvav+dZZ95zMXoJCJnyL4 vw== 
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vhhe600rg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 01:40:20 +0000
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 409NvBE9006678;
	Wed, 10 Jan 2024 01:40:19 GMT
Received: from nam12-bn8-obe.outbound.protection.outlook.com (mail-bn8nam12lp2168.outbound.protection.outlook.com [104.47.55.168])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 3vfur4nm39-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 01:40:19 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=ZUHD9Ge0/ctCI0xA3SdyRaNQE2pS9PIuROIv40XQD4DR64GS7sYdjoPwWPpda/sJpHB4qX/lahh1EfHurbVG3WGf7YiVTTq8vGcd1AOpldcdJotZYYFSD7WPSJPYBHGBzdGEtdqfWp36MOqmpyat86QuHj3nlXc9/GWf+jNUedCVVLGzib2XE/cCwOBbDcVrTckiWSXkiXDuwZl9gYMjuRuwQyJAdqfsRfsLvWZKDqqKRCWkG0NaOWy8DHVlMbfyuMlQyt5TWq1BpW5LwN/mLCxKRMQfmdD32hegsNSGPE9slCo+6fTRgCAcrqqBGp4azAaPOHFgLv3JTKSlcsUPfg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Z5iVX4XlnONK6GddibaVgdhL8dTtFO1LJB/8g3cIYxw=;
 b=Br7paLnfotAfOWuaEwX+Kywi26+gKJhTGQBkzbZYtwX5dSEoNg/6tDh2dmvtGenRsFSSYqC/PO4dDil+uOG4Fmyso2UWKoAJSShSG6lZlvB+zX2wjANS/TsvWiyUic7WIH+7V3n41Y76/6CWe6EKkTvtkHapCHZ0ATGCxMGEFGqpPywj9kds2tJTOnIycdhUluO9vc58I3K46rMMqgOQhy9hfhyFa+/SGRcndveqIECt4aLa35R2vRsuF5TraBGEi0CDqz7wBqqKpLd3vJCCDhy/g3WqJmdFn5A3a7E+VgYjrXrSVklIhScUDFj6gR/3rWLPGbQbYrgub1Yozh1qmw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=Z5iVX4XlnONK6GddibaVgdhL8dTtFO1LJB/8g3cIYxw=;
 b=o82XfIQRt+b550E8Ol89PgZovuigKxZ2N45In5pCsbkL664lr+8aqirA8Oszd0tjiyKFpxNJ+ugU2Y2i7KfBDCPiMkTCyoehIUlM6SPosX3yQG3KnEC48Ivv7b7QkBGGu3qeykDj3xYznqMQl/kw3sGXpSduavpPcxZaGyQod1s=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by CY8PR10MB7291.namprd10.prod.outlook.com (2603:10b6:930:7e::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 01:40:17 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::d190:4337:a77b:b21e]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::d190:4337:a77b:b21e%4]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 01:40:17 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Subject: Re: Segmentation fault with drgn + libkdumpfile
In-Reply-To: <20240109100609.4e956beb@meshulam.tesarici.cz>
References: <8734vb1v8n.fsf@oracle.com>
 <20240105202339.09db6ed5@meshulam.tesarici.cz> <87zfxjzbuc.fsf@oracle.com>
 <20240108214008.32f807ee@meshulam.tesarici.cz>
 <20240109100609.4e956beb@meshulam.tesarici.cz>
Date: Tue, 09 Jan 2024 17:40:15 -0800
Message-ID: <87sf36yni8.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: BYAPR11CA0069.namprd11.prod.outlook.com
 (2603:10b6:a03:80::46) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|CY8PR10MB7291:EE_
X-MS-Office365-Filtering-Correlation-Id: 367fb296-3e44-420d-b203-08dc117d1905
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	VcOm01s59OauMBzMOYeuac95tpELn70JiCbPX3ykZFO3MBNkluts5TKT0wQJetDbb/P3lFjHjt1kb9dStPtha2C/s8FO+pUTiPIRK1f1DXm0ypo+fAkq53zt3UpV2QOMmqdX1bM8Ga+sdBaJC0YYI+FYou6v5KHy3eMJyCxWwkXti8xev8O5VO2RC9nQNBcUpKijpj2EOECT7cT8n060k6tlngAtMGgsaoXWNdKkQaVoGOBeSrfpGCasEuvE6cGdpCXHDnDBv3KY30YqUraZOReEGadjo69vY3KQoyMwHXy102Fa3ffkGEIvlgbkaFbo2MJYdnTW/DWnZAt1OEMX+SIyL9pSyu5p5j7fzLDIubA0/1OkKsd338+BCztUI31/t/6K1OplF7irCh2mIgW7gGOgvEK+w9htFhEEtR5CqYWUeM3AWfSSfbm+5b6oY4RvyL9xEu+ucdYAGk/R+AGPaS01q+CCXDXeKAzInEgxShtb9j/Lpbj5kPQmDL64VIoCmqnj3oOYZeGF16YjbTxb7c9vHdpBvo8QVl3nBKxMtPhNgyozriVzZIDnsMuPCiQG
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(396003)(39860400002)(376002)(346002)(136003)(230922051799003)(1800799012)(64100799003)(451199024)(186009)(2906002)(5660300002)(41300700001)(478600001)(6486002)(38100700002)(83380400001)(2616005)(6506007)(86362001)(6512007)(66556008)(4326008)(8936002)(8676002)(66476007)(66946007)(316002)(36756003)(6916009);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?NFhvNlpRMjNZdGlCeE12a0dUdW1GOFJVbnNYeDJtejM0OHhHbU1xSnhOWDQz?=
 =?utf-8?B?UlNCOFpBcVkxOXNqNEI5ZFd1YmpwSlE5eDc0YTFCQ2RTVHQyeC9nRC8rYW5u?=
 =?utf-8?B?NWRKeVZLdGYybkpLdDNqcFJIVzN5RVYySjBaQU5TNVNPeDZMTHQvaDh1VFpi?=
 =?utf-8?B?YnF5SEUvb215TUVUYUtZVDlwcVhuUW9LdFFMa3hJY2ZGVUJZNkFYNStoalhr?=
 =?utf-8?B?eGRTWC9naTdjUmpsbDlYRUVNdHBUZTRzZHozZlZGaUVxVlpZUUpwcUQzVm1Z?=
 =?utf-8?B?bkJ1bUpqclh2SEh5MFpmalp5NnRWZC94amRiT3Z6bDhzdCtibW9NMUkxd3o4?=
 =?utf-8?B?M1dSc2kvY1dJNUovRUhkTG5Ud21DUFlhVElHeGFlRXpqZ1pQRkdMaG9qRXhy?=
 =?utf-8?B?RTQ0cnlQZnYxK1M4eU12aU1ma1ZRRlZIZmpZRjJJMVUydGE4L3lwN0gwR1BU?=
 =?utf-8?B?OEdsems5NldIREhQczVDZ3N6b1JMOUNoN2FjWUVMWXNzaTRkVHAyNTZnSk5F?=
 =?utf-8?B?blhiNEY1S3dnQlArekM2T3BlQzdkUmFyMkZYOTAxNWpNdnNDR2RSRnJUZWor?=
 =?utf-8?B?NGdNai9kaitMdDRlVVl0SzdIeExiYmJGQVRqTmdpdE9zNW1kVEFGNGM2MWZw?=
 =?utf-8?B?SzB1YnA0djVpamtTOHZERUlGeTRKWmZSNkNuN2pDbXNSeUI0dGFpUHRraUJJ?=
 =?utf-8?B?cEhrR0o0YVNNRnBPdG91R2tyTVYzcEY0ajZJaWw2Nm0yWFk2Um0zZkQxeFRX?=
 =?utf-8?B?a1ZydVFqUWtkVmZYcVltaXJ1VGU5QlFZVGI3UlhtUGR5dDJGUXh5bFVydW1j?=
 =?utf-8?B?V3N0czRBUUpjQ1NDY3Z2NTV4TTh3UUliT1NUT2hCTTZQeHdnTVpPbEtUVkJF?=
 =?utf-8?B?eGt5Mmp2dkJ0eDdyc3lFWENMWGhNSXRhK2xLWWhOczJuK2Z6RnRiYXVYRXJk?=
 =?utf-8?B?cHYwY3lINzVGZ21meE82M0UxL0JOUUR4TFZ1MjdOU3N2cmQweDBJQzhsengr?=
 =?utf-8?B?ZWNVM3JCYzJ0WGRtcW9lUlV0RjhmL0FNUVJVQmdiNDNucDNxZEN0WmZUYkdL?=
 =?utf-8?B?OHNuUXdmdWt0N0FMV0JxSHRZNmJnUFFQZmJ3RG1JTmRVOExrajhZdzhNWHJn?=
 =?utf-8?B?d0V2N3VLMElIYzYxVzhQZjhiQUNZS2dqV0trK0ZkeDVWWXUvVndkUWNBcnMx?=
 =?utf-8?B?Ynh3V1c2SVlHUHlzcUhma2tKeFAzeVpmVWhnTy8xWUJRY01kV2hWcWhDb2Ir?=
 =?utf-8?B?MFhXMmZ5TVBYUEhQVG80d1dGT21UcWFaWVFwOTRWMGtYcnlRa0FmRGFTQWcr?=
 =?utf-8?B?cFdacGxSaEYxU1dCYXRSUExuZVJlNlZBaVZXR09iNy94MStEZDVDTDFQZXBM?=
 =?utf-8?B?cWJKOC9lMzZLclJSbmpzUDJlUm9EVVM3Nk5wMVVwSE1iMGRHc1ZWR3NBK2dn?=
 =?utf-8?B?TFRwb0JNWEN0VnpuVFBNNlFsQ1lmanVhWjEySUNrUFFqeDFpaVpENU5ocXhr?=
 =?utf-8?B?eUNCWm5MU3I1VVVBUEZBemNsOFNBRUVqakVZSGFTL3U1dnF3c2N0dm9Bdzd5?=
 =?utf-8?B?aXNNU0MzbG1GR0VMOXpBbnFiK04reExOaGNwMWxLSjFpVDlrUGpJM1ROenhF?=
 =?utf-8?B?T1plck5EVGFlYUpJZzFQRE1KVkwybXMvNCtvdEMvdnF6bkw5VTNjejdSY05r?=
 =?utf-8?B?MERHMVhuYndTUEx6MUdsOG9VMEJLNk9qMmwrL052ZGlSMlhoZzFqdkplR2tx?=
 =?utf-8?B?VWtmSCtCUnJ0TDRrckQ3WjdUWSthU0RqU2d3ZXM4bzllS0pqZWhJbzNLQkVV?=
 =?utf-8?B?M3plcEkya0IwZThCM204ZmM2WE12WjJGSzErZlZ1c0ZPYTY5U0NBQmJ1VDI4?=
 =?utf-8?B?QnJhSWgyd3BKa0RWcENiQm5jSmlRUmJnT1ZnblI2R1NsTnV6bjcrZks4N2xB?=
 =?utf-8?B?ZFhpeGZnOWJaYTdFbmVKR2d3dE5rUTEyZld1WFhESDVXZkxmQ0ZMTWhFRENJ?=
 =?utf-8?B?QkhvY3ZnZkNnbGZLd3pBSG5sQkxVeXF1ZjdKd0pSR1orMGZyU0kzUXRzRTR6?=
 =?utf-8?B?QklZSUhYT2ZVRDE2VDc0U1lhVGYyY3dsemkrZDBoL2xIYXZISUxSNDZ3T3pv?=
 =?utf-8?B?UWpNQUliMnRYS09DNVArNWI5R0RrWDlJYzV1akR1aktoUTFVSnFCNmg5OEZH?=
 =?utf-8?B?L0lQcFdWTmFwMXE1blVUTXBVWU05YWoxeU5ycEdNTklyaCtmOC9qdWQxN1FD?=
 =?utf-8?Q?wbEpdP1TvVXbDUCJOPrdwJ3dC220vXSf4kRd1ykqEk=3D?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	9uamc1HNaKQr3Abzdgj4Rwh3qTQk1z7zlSXziTB9LHC2ndvaCY/UFsAxF4Tn3a3wQSsIpF4gB/i228jG6Kzc19Rs3G8Qb8nQcZca3ckdKrjZ5v19Xx0qO0Nmu9iLN9mWdnxsgH2TTq7vcSzFuyH1qaxMHdBGGXAoU8t0yFBgIj5swo3uESntsQk1/tXj/nQp0RkoyL/ST1e7GAcKvEeq9kBVmgwC6UDYwVM9fKab9IfkiKKxsuJ1fRTwAXsISam4VegUpLchz7mSiNZwWeE4FihLCjZ+pA7oz6Lpruosnj0TW89sn1r8ud1gCXMyZPAFfSNFVSmObajk/86rzeJSezx2dxn/QOwKyHTeKwWeUds0vSwAfRuEJk+bh04vg7oD0tZZByfqkZRpr/JuHHexguRgzpSqcIprxGC/2bwk7fSK73g62nBQtdsMaeS9awIHbnF0ErTqAJfMq0KNu/mArW+eUBzT2edYl3P9Q9TShqCgaEOy4bWm3ZWxstS9SaCsGWpa72v5I44Oa9pHyyDjVXT6TT+0WbzJHhlBs6JFIP6YwJ7Mfv4SCmc0kYFglQijvW4R8fd0ilhgWgvKFTxHoQTXZc73nDUAsU0VRQxC00g=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 367fb296-3e44-420d-b203-08dc117d1905
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 01:40:16.9685
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: 19RNfT+KbQp9SB7Efw024ZXcw5OM9WuRv+OVll+LEVj6S7zEcyWK4/TnRcdDD1xZ0Fzf2cLri2zIe+OuXXKRz2JFGIAWkmTUclSBuoRYw2s=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CY8PR10MB7291
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-09_13,2024-01-09_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0 malwarescore=0 spamscore=0
 adultscore=0 mlxlogscore=999 phishscore=0 suspectscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401100012
X-Proofpoint-ORIG-GUID: yBoTQpUFGO6unjKj7YBQN44VT_ukeb4f
X-Proofpoint-GUID: yBoTQpUFGO6unjKj7YBQN44VT_ukeb4f

Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:

> On Mon, 8 Jan 2024 21:40:08 +0100
> Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
>
>> On Fri, 05 Jan 2024 13:53:15 -0800
>> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>>=20
>> > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes: =20
>> > > On Fri, 05 Jan 2024 10:38:16 -0800
>> > > Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>> > >   =20
>> > >> Hi Petr,
>> > >>=20
>> > >> I recently encountered a segmentation fault with libkdumpfile & drg=
n
>> > >> which appears to be related to the cache implementation. I've inclu=
ded
>> > >> the stack trace at the end of this message, since it's a bit of a l=
onger
>> > >> one. The exact issue occurred with a test vmcore that I could proba=
bly
>> > >> share with you privately if you'd like. In any case, the reproducer=
 is
>> > >> fairly straightforward in drgn code:
>> > >>=20
>> > >> for t in for_each_task(prog):
>> > >>     prog.stack_trace(t)
>> > >> for t in for_each_task(prog):
>> > >>     prog.stack_trace(t)
>> > >>=20
>> > >> The repetition is required, the segfault only occurs on the second
>> > >> iteration of the loop. Which, in hindsight, is a textbook sign that=
 the
>> > >> issue has to do with caching. I'd expect that the issue is specific=
 to
>> > >> this vmcore, it doesn't reproduce on others.
>> > >>=20
>> > >> I stuck that into a git bisect script and bisected the libkdumpfile
>> > >> commit that introduced it:
>> > >>=20
>> > >> commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6
>> > >> Author: Petr Tesarik <petr@tesarici.cz>
>> > >> Date:   Wed Jan 11 22:53:01 2023 +0100
>> > >>=20
>> > >>     Cache: Calculate eprobe in reinit_entry()
>> > >>=20
>> > >>     If this function is called to reuse a ghost entry, the probe li=
st
>> > >>     has not been walked yet, so eprobe is left uninitialized.
>> > >>=20
>> > >>     This passed the test case, because the correct old value was le=
ft
>> > >>     on stack. Modify the test case to poison the stack.
>> > >>=20
>> > >>     Signed-off-by: Petr Tesarik <petr@tesarici.cz>
>> > >>=20
>> > >>  src/kdumpfile/cache.c      |  6 +++++-
>> > >>  src/kdumpfile/test-cache.c | 13 +++++++++++++
>> > >>  2 files changed, 18 insertions(+), 1 deletion(-)   =20
>> > >
>> > > This looks like a red herring to me. The cache most likely continues=
 in
>> > > a corrupted state without this commit, which may mask the issue (unt=
il
>> > > it resurfaces later).   =20
>> >=20
>> > I see, that makes a lot of sense.
>> >  =20
>> > >> I haven't yet tried to debug the logic of the cache implementation =
and
>> > >> create a patch. I'm totally willing to try that, but I figured I wo=
uld
>> > >> send this report to you first, to see if there's something obvious =
that
>> > >> sticks out to your eyes.   =20
>> > >
>> > > No, but I should be able to recreate the issue if I get a log of the
>> > > cache API calls:
>> > >
>> > > - cache_alloc() - to know the number of elements
>> > > - cache_get_entry()
>> > > - cache_put_entry()
>> > > - cache_insert()
>> > > - cache_discard()
>> > > - cache_flush() - not likely after initialization, but...   =20
>> >=20
>> > I went ahead and logged each of these calls as you suggested, I tried =
to
>> > log them at the beginning of the function call and always include the
>> > cache pointer, cache_entry, and the key. I took the resulting log and
>> > filtered it to just contain the most recently logged cache prior to th=
e
>> > crash, compressed it, and attached it. For completeness, the patch
>> > I used is below (applies to tip branch 8254897 ("Merge pull request #7=
8
>> > from fweimer-rh/c99")).
>> >=20
>> > I'll also see if I can reproduce it based on the log. =20
>>=20
>> Thank you for the log. I haven't had much time to look at it, but the
>> first line is a good hint already:
>>=20
>> 0x56098b68c4c0: cache_alloc(1024, 0)
>>=20
>> Zero size means the data pointers are managed by the caller, so this
>> must be the cache of mmap()'ed segments. That's the only cache which
>> installs a cleanup callback with set_cache_entry_cleanup(). There is
>> only one call to the cleanup callback for evicted entries in cache.c:
>>=20
>> 		/* Get an unused cached entry. */
>> 		if (cs->nuprobe !=3D 0 &&
>> 		    (cs->nuprec =3D=3D 0 || cache->nprobe + bias > cache->dprobe))
>> 			evict =3D evict_probe(cache, cs);
>> 		else
>> 			evict =3D evict_prec(cache, cs);
>> 		if (cache->entry_cleanup)
>> 			cache->entry_cleanup(cache->cleanup_data, evict);
>>=20
>> The entries can be evicted from the probe partition or from the precious
>> partition. This might be relevant. Please, can you re-run and log where
>> the evict entry comes from?
>
> I found some time this morning, and it wouldn't help. Because of a bug
> in fcache_new(), the number of elements in the cache is big enough that
> cache entries are never evicted in your case. It's quite weird to hit a
> cache metadata bug after elements have been inserted. FWIW I am not
> able to reproduce the bug by replaying the logged file read pattern.
>
> Since you have a reliable reproducer, it cannot be a Heisenbug. But it
> could be caused by the other cache - the cache of decompressed pages.
> Do you know for sure that lzo1x_decompress_safe() crashes while trying
> to _read_ from the input buffer, and not while trying to _write_ to the
> output buffer?

Hi Petr,

Sorry for the delay here, I got pulled into other issues and am trying
to attend to all my work in a round-robin fashion :)

The fault is definitely in lzo1x_decompress_safe() *writing* to address
0. I fetched debuginfo for all the necessary libraries and we see the
following stack trace:

%<-----------------------
#0  0x00007fcd9adddef3 in lzo1x_decompress_safe (in=3D<optimized out>,
    in_len=3D<optimized out>, out=3D0x0, out_len=3D0x7ffdee2c1388, wrkmem=
=3D<optimized out>)
    at src/lzo1x_d.ch:120
#1  0x00007fcd9ae25be1 in diskdump_read_page (pio=3D0x7ffdee2c1590) at disk=
dump.c:584
#2  0x00007fcd9ae32d4d in _kdumpfile_priv_cache_get_page (pio=3D0x7ffdee2c1=
590,
    fn=3D0x7fcd9ae257ae <diskdump_read_page>) at read.c:69
#3  0x00007fcd9ae25e44 in diskdump_get_page (pio=3D0x7ffdee2c1590) at diskd=
ump.c:647
#4  0x00007fcd9ae32be0 in get_page (pio=3D0x7ffdee2c1590)
    at /home/stepbren/repos/libkdumpfile/src/kdumpfile/kdumpfile-priv.h:151=
2
#5  0x00007fcd9ae32ed4 in get_page_xlat (pio=3D0x7ffdee2c1590) at read.c:12=
6
#6  0x00007fcd9ae32f22 in get_page_maybe_xlat (pio=3D0x7ffdee2c1590) at rea=
d.c:137
#7  0x00007fcd9ae32fb1 in _kdumpfile_priv_read_locked (ctx=3D0x55745bfca8f0=
,
    as=3DKDUMP_KVADDR, addr=3D18446612133360081960, buffer=3D0x7ffdee2c17df=
,
    plength=3D0x7ffdee2c1698) at read.c:169
#8  0x00007fcd9ae330dd in kdump_read (ctx=3D0x55745bfca8f0, as=3DKDUMP_KVAD=
DR,
    addr=3D18446612133360081960, buffer=3D0x7ffdee2c17df, plength=3D0x7ffde=
e2c1698)
    at read.c:196
#9  0x00007fcd9afb0cc4 in drgn_read_kdump (buf=3D0x7ffdee2c17df,
    address=3D18446612133360081960, count=3D4, offset=3D1844661213336008196=
0,
    arg=3D0x55745bfca8f0, physical=3Dfalse) at ../../libdrgn/kdump.c:73
%<-----------------------

In frame 1 where we are calling the decompressor:

%<-----------------------
(gdb) frame 1
#1  0x00007fcd9ae25be1 in diskdump_read_page (pio=3D0x7ffdee2c1590) at disk=
dump.c:584
584                     int ret =3D lzo1x_decompress_safe(fch.data, pd.size=
,
(gdb) list
579                     if (ret !=3D KDUMP_OK)
580                             return ret;
581             } else if (pd.flags & DUMP_DH_COMPRESSED_LZO) {
582     #if USE_LZO
583                     lzo_uint retlen =3D get_page_size(ctx);
584                     int ret =3D lzo1x_decompress_safe(fch.data, pd.size=
,
585                                                     pio->chunk.data,
586                                                     &retlen,
587                                                     LZO1X_MEM_DECOMPRES=
S);
588                     fcache_put_chunk(&fch);
(gdb) p retlen
$7 =3D 0
(gdb) p pio->chunk.data
$8 =3D (void *) 0x0
(gdb) p fch.data
$9 =3D (void *) 0x7fcd7cc33da4
(gdb) p pd.size
$10 =3D 816
%<-----------------------

As far as I can tell, pio->chunk.data comes directly from the
cache_get_page() function in frame 2:

%<-----------------------
(gdb) up
#2  0x00007fcd9ae32d4d in _kdumpfile_priv_cache_get_page (pio=3D0x7ffdee2c1=
590,
    fn=3D0x7fcd9ae257ae <diskdump_read_page>) at read.c:69
69              ret =3D fn(pio);
(gdb) list
64              pio->chunk.data =3D entry->data;
65              pio->chunk.embed_fces->ce =3D entry;
66              if (cache_entry_valid(entry))
67                      return KDUMP_OK;
68
69              ret =3D fn(pio);
70              mutex_lock(&ctx->shared->cache_lock);
71              if (ret =3D=3D KDUMP_OK)
72                      cache_insert(pio->chunk.embed_fces->cache, entry);
73              else
(gdb) p *entry
$11 =3D {key =3D 1045860353, state =3D cs_precious, next =3D 626, prev =3D =
626, refcnt =3D 1,
  data =3D 0x0}
(gdb) p *pio
$12 =3D {ctx =3D 0x55745bfca8f0, addr =3D {addr =3D 1045860352, as =3D ADDR=
XLAT_MACHPHYSADDR},
  chunk =3D {data =3D 0x0, nent =3D 1, {embed_fces =3D {{data =3D 0xffff880=
ff1470788,
          len =3D 140728599320032, ce =3D 0x55745c1003d8, cache =3D 0x55745=
c0fb540}, {
          data =3D 0x55745bfd42f0, len =3D 140728599320112,
          ce =3D 0x7fcd9ae330ef <kdump_read+102>, cache =3D 0xffff88003e569=
c28}},
      fces =3D 0xffff880ff1470788}}}
%<-----------------------

And here is the cache structure:

%<-----------------------
(gdb) p *pio->chunk.embed_fces->cache
$16 =3D {split =3D 487, nprec =3D 1020, ngprec =3D 248, nprobe =3D 3, ngpro=
be =3D 239, dprobe =3D 2,
  cap =3D 1024, inflight =3D 626, ninflight =3D 1, hits =3D {number =3D 168=
473, address =3D 168473,
    string =3D 0x29219 <error: Cannot access memory at address 0x29219>,
    bitmap =3D 0x29219, blob =3D 0x29219}, misses =3D {number =3D 1913, add=
ress =3D 1913,
    string =3D 0x779 <error: Cannot access memory at address 0x779>, bitmap=
 =3D 0x779,
    blob =3D 0x779}, elemsize =3D 4096, data =3D 0x7fcd997fe010, entry_clea=
nup =3D 0x0,
  cleanup_data =3D 0x0, ce =3D 0x55745c0fb598}
%<-----------------------

Thanks for looking into this! I'll continue investigating more as well.

Stephen
