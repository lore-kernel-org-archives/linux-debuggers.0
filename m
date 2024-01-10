Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CDE0BD51C
	for <linux-debuggers@vger.kernel.org>; Wed, 10 Jan 2024 19:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ZLY+qMwP";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="Fu7JB8Ew"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id 40AJfpCe023885;
	Wed, 10 Jan 2024 19:48:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=from : to : cc :
 subject : in-reply-to : references : date : message-id : content-type :
 content-transfer-encoding : mime-version; s=corp-2023-11-20;
 bh=2Ckp00f6bWA+sm9wJ/nPOxtput2lJcr24Fqsl2d6MUA=;
 b=ZLY+qMwP+toGaNHle0zc3kJs8Hs0ROmZ+85A9Qp9ovJ+PLSIDIovMj7Ef+X/BB44uWvZ
 /m5tpXB/SlUdsUNjXYvaDPs2jDB7+pwwvvQwOLEhN4g8JcNeLsUK99kGTpdLH82Pm4uS
 7FVB983BT7ubYyKTFyt+ehjiFVxQCfYSiWefPCF8feMu3b+Lpd37A1kGLp6apRUnzbf1
 Jm7yCMTun86ot5zTtpiSuMe6jTVrBrQgfhtiMc4fwz9Hl16XzZA3/OPuSod34sYi9jsZ
 +YpvWxVUyeFeQ6BThIiJePqilJWBsma1GDOEDXmmxbhaNlzeHBcXeu9rKbdoWhtS09xI oA== 
Received: from phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta03.appoci.oracle.com [138.1.37.129])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 3vj1m5r0ev-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 19:48:26 +0000
Received: from pps.filterd (phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (8.17.1.19/8.17.1.19) with ESMTP id 40AIV4fr013684;
	Wed, 10 Jan 2024 19:48:26 GMT
Received: from nam10-mw2-obe.outbound.protection.outlook.com (mail-mw2nam10lp2100.outbound.protection.outlook.com [104.47.55.100])
	by phxpaimrmta03.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 3vfurdj056-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 10 Jan 2024 19:48:25 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=jjGRQLkMLBCl2VsahK2IXJRTPkrvdEfhO9aha6nnRgqE/mOlPgjEFgNx6axNgzKyseLceFk6tSgwcEw1XwBF0kNcqzYL0m4/olbENRRrmKQ2vsVxNCwMIV5oBXNJuUsFdaW2PYINUxn1liibU4lhROLsMxcNWxocDNTZaq0VIIEZE4ZbCqrlmIXad+OD284bsI78cl53Saqv4sMtzNu+WOpGf7fLE6si3YCtiYoa8TTTAOmDlCFYVu6hQsd13TB080pw7jQGyMLpoBmClFxQfLLRsFZ2GT/1UuMMDqOnNHlwjx+HH0RxFONHJoblTcGZeYiin+ZfFQ9jQ3LdTOHeJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=2Ckp00f6bWA+sm9wJ/nPOxtput2lJcr24Fqsl2d6MUA=;
 b=Bz0uwjTaKgmCpcoalADHLjxLUwWwZ0EFwOSKzb/V9RXB8gelPRqQcbNVk4TJxCb3ghlDOkrZkd6F/OA2yn+DdTdbI7McLI3xM1mVCueCtnN0lL89kpqevw4za2OV6s5ai8JQaZkXqVi3pns9NVDcYozJagBU9CXeTNz/hrdn/kUsSL1xxO1SvAQyOUHkIoAanAOCyHbckTCLWPOC8z26wRCE5gmee9MTbIeCMw0fQn6kDe7r+CSb+IB9wjfi1bmEYp9NM5CfUkPQpfzazv6w+U+UgrzQxtV334Y8zkJg9BlQhDCK2KTAt1lo43vKIKPVDtRynQcStlf874nFn/TPkw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=2Ckp00f6bWA+sm9wJ/nPOxtput2lJcr24Fqsl2d6MUA=;
 b=Fu7JB8EwJrSFlX/NMMwg8UQV3tfVmXUKDQHw08R7lTQ2hBPBOGCRDbn1UDFCwIvp2MpKSOhl9cnaAnHyLlE4m7R6uR5eMLihYiGraxssCZ7eBMs4EAU8ND4MBHy0VnbnBifwpzL2+1yHLbTb0wFUWlC1Fmb3Q1rhIlZoupUJAeA=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by DS0PR10MB6151.namprd10.prod.outlook.com (2603:10b6:8:c5::20) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7159.23; Wed, 10 Jan
 2024 19:48:23 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::d190:4337:a77b:b21e]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::d190:4337:a77b:b21e%4]) with mapi id 15.20.7181.015; Wed, 10 Jan 2024
 19:48:23 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Petr =?utf-8?B?VGVzYcWZw61r?= <petr@tesarici.cz>
Cc: Omar Sandoval <osandov@osandov.com>, linux-debuggers@vger.kernel.org
Subject: Re: Segmentation fault with drgn + libkdumpfile
In-Reply-To: <20240110190354.0ff56adc@meshulam.tesarici.cz>
References: <8734vb1v8n.fsf@oracle.com>
 <20240105202339.09db6ed5@meshulam.tesarici.cz> <87zfxjzbuc.fsf@oracle.com>
 <20240108214008.32f807ee@meshulam.tesarici.cz>
 <20240109100609.4e956beb@meshulam.tesarici.cz> <87sf36yni8.fsf@oracle.com>
 <20240110093600.61005acd@meshulam.tesarici.cz>
 <20240110144928.19010b9a@meshulam.tesarici.cz>
 <20240110190354.0ff56adc@meshulam.tesarici.cz>
Date: Wed, 10 Jan 2024 11:48:22 -0800
Message-ID: <87ply9ynp5.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: PH0PR07CA0033.namprd07.prod.outlook.com
 (2603:10b6:510:e::8) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|DS0PR10MB6151:EE_
X-MS-Office365-Filtering-Correlation-Id: f7b3f280-f586-4a1c-8467-08dc12151ab2
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;
X-Microsoft-Antispam-Message-Info: 
	eJK6wfuB0Nmdtl+jLEixmCB1kXD4Y2MVA+B8/zGZBU5mRvZzeIfWfHvJtU6OkdnZbhuxTWwPxMqfYpFSZUqXBzTTUV7EEFGIIDHsj4OulGmnqfpNBmPPexcJmPKMdDkoYQzAcTNXAm2NFHJaG5p5yaNOUrK8NaMKWUa4LQwcBCYiy9yU/k+3zL7Got2SPbscXdy+lKbsf8uK6iYZwnd9Y3X45VfNORvzFhuw7AYiKWSJ6qyrCLuIT4oq2DIpDJ8T4lrcRGNsE3YuF8Ml+4RRem8eelmqKpN5/qnGCWLgWX/X56pB/Wn/+T3LbaVIp3n8Ao9C13SSVR4hLl9dFIYgNpLMrnbZjREnYzOrWG1bRjRGBmv5Qq4R+kbZeLatFcql292d8r4iLIyYct60XOf4UEj3i+jLl/uTGblvQ3lFJOZzZZDt+yVDJh0Rn5o/1yJ5GYMgEud7S8aUY/dGVbwHRmkUHvMar2h99l05By/29mu4ZSGLSLCfSnoT9ksClq9sAujq3Dl35pX7FUVwvHEF8g+BUpxrXwE5vJlFpgK3ePOk3Ct8sttmxH8ggiKjq7sUTEi6cH74YGiELhWkRpsK39UyMIzXjB9M8p5uJtQ0ze8=
X-Forefront-Antispam-Report: 
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(396003)(136003)(376002)(39860400002)(346002)(366004)(230922051799003)(186009)(64100799003)(1800799012)(451199024)(30864003)(5660300002)(2906002)(41300700001)(478600001)(6486002)(38100700002)(83380400001)(6512007)(86362001)(6506007)(2616005)(8936002)(66946007)(8676002)(4326008)(6916009)(66476007)(316002)(66556008)(36756003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0: 
	=?utf-8?B?TktiWmlweFlFRlhBRUZHWDRsREpIMWRhQjVyY3k0MlFha01xZHovMGEvdXYz?=
 =?utf-8?B?d0Y5c3E3QmViYlE2YlBsZHpnckRLUEFvZVp0V1ZoQXMvSnJrV0FzZEt6S3NU?=
 =?utf-8?B?NG54TXozVkpKeVY3THV0YUJTWWFWMTAxamJWQkRLOG9XeGJwemZGa1dDS3dz?=
 =?utf-8?B?MVhyS21RczU3c0VraTdxelhyTXpKMTdIUkswQnJvbUc3ZUsvOWRENTZZY1hO?=
 =?utf-8?B?R0pnZFVDSEtJNFdwMUNqelRya1BVR1hKeWdPR3VhcEJZeGpiMWRUTlo3aUJ4?=
 =?utf-8?B?YjRrV0ZsYmhhVlJRWHlDdTM5bEJSSVYvaVVEQTZGamFGSkpNZ29pWjVuaDN3?=
 =?utf-8?B?YTFwSTZBeDJLWHRqWDE4eGdBdjlxSWZiYkhHZzlUa3Jrb0t1QmdZNGpyWFhI?=
 =?utf-8?B?MnNiZGtmaUcwd0VIWE53ZUI2VjdZYlQyNG1aT1dtbUtIZU9idDFDUTlWdVpC?=
 =?utf-8?B?YkpLR0pZWXZVNjdhQ05Odi9GZDhDb1BSYTE5T0V1MkVFT2xHSytaVC8wS3ZV?=
 =?utf-8?B?cWpJTGZtQjRIc3BpM3NDZHlMVkphUHducWhFYUNndEZpK2V4cktDeXZ3K0xn?=
 =?utf-8?B?N2hLYktYN1h1dk9HOXNsa0c0aWJ0YVJKby94M0xKMG85bkN4aUw5QjdYcWox?=
 =?utf-8?B?NExndnVMU3RMcVJKM3FNa29pWitWU0I4NEU3NWtCTTJ6NDR1ekJ4MHJuclEz?=
 =?utf-8?B?VS91aUFOU3BZV2k3S0puUjhVdzdZeVRBNWF4Mi93TVlIWU9MSFBabXkzY0JW?=
 =?utf-8?B?N1VkMlZqall2aXhVeVVkWXkrcWFsWVdNb2JTM0ZUemh2ZW1aRjM4YW5RTUVG?=
 =?utf-8?B?L1h2RThpbHJrVldPemdCYy9zY1JQK2krUW1MaFUySS9vNGJjSnlGZ1pOaEZz?=
 =?utf-8?B?S3c1RWZvYy85Y2RzamxBaU1KNmk3UEFYN25SOTdreUJTTFc0QUNvQVdybVRk?=
 =?utf-8?B?MzdJN3JFSUc3YytJTklIanJmSVluajd5NDA1c3dkbzZ0VUQ4QmVJbytwNWw2?=
 =?utf-8?B?VElJRytiSncrYisrS3VyR1Nxd3A0MCtyTlQvTkd5cFBCeG5iNXlmU0o5QUpw?=
 =?utf-8?B?clVKWHVmdUFCRFQxK0pVVldnR3BDS1VIcUd0YnJZQ1NkVVMwOEgra09LYWZs?=
 =?utf-8?B?RUU1Ullvb3VYbkxPREFqTHdqNjRwWUhaWDFFNFF6ZU5tVkF4OW1Ma2tWVEFm?=
 =?utf-8?B?WWlOR2hleWJVMDRlaWZJLzUwN3luZ3Via3J3dytlVjlDYnRVcWxXdC8yM0dZ?=
 =?utf-8?B?MjlreG1RVTJ1dFM3TE15YlR4Q2JyU3RlQ0kxejhla3BvWmM0eTQyOSt6Vysz?=
 =?utf-8?B?NEFlbVU1MHJHL3ZSS3JWM01zQTJxOHMySlp2QUUxd3hIV2xzVzFmSUNSbXZa?=
 =?utf-8?B?MFNjNTl4NWd0T2pkWVFUazhDTkQwNXNwODlzT3E1S2w5V1lmdDVYbUE5ZlQ2?=
 =?utf-8?B?Qm01MGJ5ci9rSUJYOUhwUmVXaUVNZFBOdFJSSXMwNnNiRnFNOXF3WHVFSHVo?=
 =?utf-8?B?Rm1BLzQ0dzl2aXptbVFjMVliOURDZlJINzlvRWhzdHMzZS9KSTAxZ1pvUGRO?=
 =?utf-8?B?dWdFdEZlc3dEcGxyZTJvdWttUm5XeVI2RzViWXFxNVJyMDV1MlFWVGtPczVK?=
 =?utf-8?B?SUZxVDNvek9hVm8yL1hNL01TMzhBTUpoMnZiY3l2REJFUkNlM0theTZzdmQ2?=
 =?utf-8?B?ME9XQ0RhZWdZQU43dlk0V3F0RWdqMFlkeWorQWZMYlFPVy9jVURXZ2NHY2Qy?=
 =?utf-8?B?UnFnYjlaOURxeFRzb0RpeHZxandSK2xJUmFFWS94YkloS0UwMjRUaXdtTnd5?=
 =?utf-8?B?aUdiVEpMWUs4dGhrVFprT2oxNUxQNHBkRllHVDlGaUl6dmJnK2RtR25nczNI?=
 =?utf-8?B?MWtabVB2cGRTSng4WWNQZUZGMHE1cFZiQkoxWkp1aS9wMTFHb3BOd28wb0FB?=
 =?utf-8?B?VjlPTFV2N29RN2ZNbm5JRGJKSWpEaDRMK0JvSWNvZUNhcUFWU2Y1VzFOQmZY?=
 =?utf-8?B?UjhyNFIxUG1Wam5wY1FTT3FGU0RQZjNQdmNyODNQRm9OQXFhMnRCSGU1aG90?=
 =?utf-8?B?NWloRlFzcEZlQlR6aFR5V0Z6MnpmRm9SdHlEczN4c2ZWSXBJZFNXeU5WVXJR?=
 =?utf-8?B?enZZUjFKcDZRUkt4cFVCUzVoLzRGUU50bjZudHh4M2V3OVI2UEoxUWZnYVlr?=
 =?utf-8?Q?WoqFh/xsH+LckJu4yGh5IlLdGmbxb8Tjz7pt7tqSFXCc?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	v7PEfWD+wSSeqma2W1ccMYRhsjECPVO7UwmPZH6zEJGbHX7mJRS61pVGQGtAhhLPz2cpDDd6xRXZafPqv0BrYume/J9j1lQp6GahIexvl1DL3tRKa+KzpWxWJbOXJvaR/Cf/19DkKOP2pigMf3bRE1M9H9sS5LpLeZwE9w3bU+/eyjNoM5JKY0+BLMF5rB8T+sEgeJ5oX+yTt1qsGzThAkSgXqPT9vqRs85Nov8BCyIoIF+mmb1jzFdT927ZBIaj1kmFCEgTTKQ+TvG6cK1aZEQhnU0BhZT5BVg0ubwz9nKMiDR6TR7ZlpfRSII/H6xo6N1esxYOpAvDte1w6cJUeIgNk1nMe1vFLb41GPgZWdxFGCDfzxj7AeawV9SJkUh8hWUL3kmhCdMW0kcWsOPyvJ630h56tW35aHUQguphvcNirMmkl8s4nIHBWq6gi7g2oCsEhXpGBrhDdgPM0Kj9BC6cJe9Vv8jBT/9T3ExejWA6tzAR4NeBciSrkXXdpeEtxWw7lvQod9RW8F/+i8ksuAPTvYwo027TnLrKDbUMFq5Ut3ILQfvjue7sa/WNvJe0ltRfAueiYxCXII7R1uLy2he0YaJGqV4vVsj7DoKI5cM=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: f7b3f280-f586-4a1c-8467-08dc12151ab2
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 10 Jan 2024 19:48:23.3425
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: uL82HAXedMS+QUG0U/vNLHiT9J0XiSsGNYY6jatAEuCxkYLc2cTvQhMTEY43nWax0vbps+5JczLeZnkQxuvw9YfwrOu4T3LBRi1seyfaCTQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DS0PR10MB6151
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-01-10_10,2024-01-10_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxscore=0 adultscore=0 bulkscore=0
 mlxlogscore=999 suspectscore=0 phishscore=0 malwarescore=0 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2401100157
X-Proofpoint-ORIG-GUID: kRHsgCVu9H3hULAH5gzjr9qVdIggsZ7E
X-Proofpoint-GUID: kRHsgCVu9H3hULAH5gzjr9qVdIggsZ7E

Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:
> On Wed, 10 Jan 2024 14:49:28 +0100
> Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
>
>> On Wed, 10 Jan 2024 09:36:00 +0100
>> Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
>>=20
>> > On Tue, 09 Jan 2024 17:40:15 -0800
>> > Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>> >=20
>> > > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:
>> > >  =20
>> > > > On Mon, 8 Jan 2024 21:40:08 +0100
>> > > > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> wrote:
>> > > >   =20
>> > > >> On Fri, 05 Jan 2024 13:53:15 -0800
>> > > >> Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>> > > >>    =20
>> > > >> > Petr Tesa=C5=99=C3=ADk <petr@tesarici.cz> writes:     =20
>> > > >> > > On Fri, 05 Jan 2024 10:38:16 -0800
>> > > >> > > Stephen Brennan <stephen.s.brennan@oracle.com> wrote:
>> > > >> > >       =20
>> > > >> > >> Hi Petr,
>> > > >> > >>=20
>> > > >> > >> I recently encountered a segmentation fault with libkdumpfil=
e & drgn
>> > > >> > >> which appears to be related to the cache implementation. I'v=
e included
>> > > >> > >> the stack trace at the end of this message, since it's a bit=
 of a longer
>> > > >> > >> one. The exact issue occurred with a test vmcore that I coul=
d probably
>> > > >> > >> share with you privately if you'd like. In any case, the rep=
roducer is
>> > > >> > >> fairly straightforward in drgn code:
>> > > >> > >>=20
>> > > >> > >> for t in for_each_task(prog):
>> > > >> > >>     prog.stack_trace(t)
>> > > >> > >> for t in for_each_task(prog):
>> > > >> > >>     prog.stack_trace(t)
>> > > >> > >>=20
>> > > >> > >> The repetition is required, the segfault only occurs on the =
second
>> > > >> > >> iteration of the loop. Which, in hindsight, is a textbook si=
gn that the
>> > > >> > >> issue has to do with caching. I'd expect that the issue is s=
pecific to
>> > > >> > >> this vmcore, it doesn't reproduce on others.
>> > > >> > >>=20
>> > > >> > >> I stuck that into a git bisect script and bisected the libkd=
umpfile
>> > > >> > >> commit that introduced it:
>> > > >> > >>=20
>> > > >> > >> commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6
>> > > >> > >> Author: Petr Tesarik <petr@tesarici.cz>
>> > > >> > >> Date:   Wed Jan 11 22:53:01 2023 +0100
>> > > >> > >>=20
>> > > >> > >>     Cache: Calculate eprobe in reinit_entry()
>> > > >> > >>=20
>> > > >> > >>     If this function is called to reuse a ghost entry, the p=
robe list
>> > > >> > >>     has not been walked yet, so eprobe is left uninitialized=
.
>> > > >> > >>=20
>> > > >> > >>     This passed the test case, because the correct old value=
 was left
>> > > >> > >>     on stack. Modify the test case to poison the stack.
>> > > >> > >>=20
>> > > >> > >>     Signed-off-by: Petr Tesarik <petr@tesarici.cz>
>> > > >> > >>=20
>> > > >> > >>  src/kdumpfile/cache.c      |  6 +++++-
>> > > >> > >>  src/kdumpfile/test-cache.c | 13 +++++++++++++
>> > > >> > >>  2 files changed, 18 insertions(+), 1 deletion(-)       =20
>> > > >> > >
>> > > >> > > This looks like a red herring to me. The cache most likely co=
ntinues in
>> > > >> > > a corrupted state without this commit, which may mask the iss=
ue (until
>> > > >> > > it resurfaces later).       =20
>> > > >> >=20
>> > > >> > I see, that makes a lot of sense.
>> > > >> >      =20
>> > > >> > >> I haven't yet tried to debug the logic of the cache implemen=
tation and
>> > > >> > >> create a patch. I'm totally willing to try that, but I figur=
ed I would
>> > > >> > >> send this report to you first, to see if there's something o=
bvious that
>> > > >> > >> sticks out to your eyes.       =20
>> > > >> > >
>> > > >> > > No, but I should be able to recreate the issue if I get a log=
 of the
>> > > >> > > cache API calls:
>> > > >> > >
>> > > >> > > - cache_alloc() - to know the number of elements
>> > > >> > > - cache_get_entry()
>> > > >> > > - cache_put_entry()
>> > > >> > > - cache_insert()
>> > > >> > > - cache_discard()
>> > > >> > > - cache_flush() - not likely after initialization, but...    =
   =20
>> > > >> >=20
>> > > >> > I went ahead and logged each of these calls as you suggested, I=
 tried to
>> > > >> > log them at the beginning of the function call and always inclu=
de the
>> > > >> > cache pointer, cache_entry, and the key. I took the resulting l=
og and
>> > > >> > filtered it to just contain the most recently logged cache prio=
r to the
>> > > >> > crash, compressed it, and attached it. For completeness, the pa=
tch
>> > > >> > I used is below (applies to tip branch 8254897 ("Merge pull req=
uest #78
>> > > >> > from fweimer-rh/c99")).
>> > > >> >=20
>> > > >> > I'll also see if I can reproduce it based on the log.     =20
>> > > >>=20
>> > > >> Thank you for the log. I haven't had much time to look at it, but=
 the
>> > > >> first line is a good hint already:
>> > > >>=20
>> > > >> 0x56098b68c4c0: cache_alloc(1024, 0)
>> > > >>=20
>> > > >> Zero size means the data pointers are managed by the caller, so t=
his
>> > > >> must be the cache of mmap()'ed segments. That's the only cache wh=
ich
>> > > >> installs a cleanup callback with set_cache_entry_cleanup(). There=
 is
>> > > >> only one call to the cleanup callback for evicted entries in cach=
e.c:
>> > > >>=20
>> > > >> 		/* Get an unused cached entry. */
>> > > >> 		if (cs->nuprobe !=3D 0 &&
>> > > >> 		    (cs->nuprec =3D=3D 0 || cache->nprobe + bias > cache->dprob=
e))
>> > > >> 			evict =3D evict_probe(cache, cs);
>> > > >> 		else
>> > > >> 			evict =3D evict_prec(cache, cs);
>> > > >> 		if (cache->entry_cleanup)
>> > > >> 			cache->entry_cleanup(cache->cleanup_data, evict);
>> > > >>=20
>> > > >> The entries can be evicted from the probe partition or from the p=
recious
>> > > >> partition. This might be relevant. Please, can you re-run and log=
 where
>> > > >> the evict entry comes from?   =20
>> > > >
>> > > > I found some time this morning, and it wouldn't help. Because of a=
 bug
>> > > > in fcache_new(), the number of elements in the cache is big enough=
 that
>> > > > cache entries are never evicted in your case. It's quite weird to =
hit a
>> > > > cache metadata bug after elements have been inserted. FWIW I am no=
t
>> > > > able to reproduce the bug by replaying the logged file read patter=
n.
>> > > >
>> > > > Since you have a reliable reproducer, it cannot be a Heisenbug. Bu=
t it
>> > > > could be caused by the other cache - the cache of decompressed pag=
es.
>> > > > Do you know for sure that lzo1x_decompress_safe() crashes while tr=
ying
>> > > > to _read_ from the input buffer, and not while trying to _write_ t=
o the
>> > > > output buffer?   =20
>> > >=20
>> > > Hi Petr,
>> > >=20
>> > > Sorry for the delay here, I got pulled into other issues and am tryi=
ng
>> > > to attend to all my work in a round-robin fashion :) =20
>> >=20
>> > Hi Stephen,
>> >=20
>> > that's fine, I also work on this only as time permits. ;-)
>> >=20
>> > > The fault is definitely in lzo1x_decompress_safe() *writing* to addr=
ess
>> > > 0. I fetched debuginfo for all the necessary libraries and we see th=
e
>> > > following stack trace:
>> > >=20
>> > > %<-----------------------
>> > > #0  0x00007fcd9adddef3 in lzo1x_decompress_safe (in=3D<optimized out=
>,
>> > >     in_len=3D<optimized out>, out=3D0x0, out_len=3D0x7ffdee2c1388, w=
rkmem=3D<optimized out>)
>> > >     at src/lzo1x_d.ch:120
>> > > #1  0x00007fcd9ae25be1 in diskdump_read_page (pio=3D0x7ffdee2c1590) =
at diskdump.c:584
>> > > #2  0x00007fcd9ae32d4d in _kdumpfile_priv_cache_get_page (pio=3D0x7f=
fdee2c1590,
>> > >     fn=3D0x7fcd9ae257ae <diskdump_read_page>) at read.c:69
>> > > #3  0x00007fcd9ae25e44 in diskdump_get_page (pio=3D0x7ffdee2c1590) a=
t diskdump.c:647
>> > > #4  0x00007fcd9ae32be0 in get_page (pio=3D0x7ffdee2c1590)
>> > >     at /home/stepbren/repos/libkdumpfile/src/kdumpfile/kdumpfile-pri=
v.h:1512
>> > > #5  0x00007fcd9ae32ed4 in get_page_xlat (pio=3D0x7ffdee2c1590) at re=
ad.c:126
>> > > #6  0x00007fcd9ae32f22 in get_page_maybe_xlat (pio=3D0x7ffdee2c1590)=
 at read.c:137
>> > > #7  0x00007fcd9ae32fb1 in _kdumpfile_priv_read_locked (ctx=3D0x55745=
bfca8f0,
>> > >     as=3DKDUMP_KVADDR, addr=3D18446612133360081960, buffer=3D0x7ffde=
e2c17df,
>> > >     plength=3D0x7ffdee2c1698) at read.c:169
>> > > #8  0x00007fcd9ae330dd in kdump_read (ctx=3D0x55745bfca8f0, as=3DKDU=
MP_KVADDR,
>> > >     addr=3D18446612133360081960, buffer=3D0x7ffdee2c17df, plength=3D=
0x7ffdee2c1698)
>> > >     at read.c:196
>> > > #9  0x00007fcd9afb0cc4 in drgn_read_kdump (buf=3D0x7ffdee2c17df,
>> > >     address=3D18446612133360081960, count=3D4, offset=3D184466121333=
60081960,
>> > >     arg=3D0x55745bfca8f0, physical=3Dfalse) at ../../libdrgn/kdump.c=
:73
>> > > %<-----------------------
>> > >=20
>> > > In frame 1 where we are calling the decompressor:
>> > >=20
>> > > %<-----------------------
>> > > (gdb) frame 1
>> > > #1  0x00007fcd9ae25be1 in diskdump_read_page (pio=3D0x7ffdee2c1590) =
at diskdump.c:584
>> > > 584                     int ret =3D lzo1x_decompress_safe(fch.data, =
pd.size,
>> > > (gdb) list
>> > > 579                     if (ret !=3D KDUMP_OK)
>> > > 580                             return ret;
>> > > 581             } else if (pd.flags & DUMP_DH_COMPRESSED_LZO) {
>> > > 582     #if USE_LZO
>> > > 583                     lzo_uint retlen =3D get_page_size(ctx);
>> > > 584                     int ret =3D lzo1x_decompress_safe(fch.data, =
pd.size,
>> > > 585                                                     pio->chunk.d=
ata,
>> > > 586                                                     &retlen,
>> > > 587                                                     LZO1X_MEM_DE=
COMPRESS);
>> > > 588                     fcache_put_chunk(&fch);
>> > > (gdb) p retlen
>> > > $7 =3D 0 =20
>> >=20
>> > This is a bit weird. Looking at liblzo sources, it seems to me that
>> > the output length is not changed until right before returning from
>> > lzo1x_decompress_safe().
>> >=20
>> > > (gdb) p pio->chunk.data
>> > > $8 =3D (void *) 0x0 =20
>> >=20
>> > OK, here's our immediate root cause. ;-)
>> >=20
>> > > (gdb) p fch.data
>> > > $9 =3D (void *) 0x7fcd7cc33da4 =20
>> >=20
>> > This looks sane.
>> >=20
>> > > (gdb) p pd.size
>> > > $10 =3D 816 =20
>> >=20
>> > This also looks sane.
>> >=20
>> > > %<-----------------------
>> > >=20
>> > > As far as I can tell, pio->chunk.data comes directly from the
>> > > cache_get_page() function in frame 2:
>> > >=20
>> > > %<-----------------------
>> > > (gdb) up
>> > > #2  0x00007fcd9ae32d4d in _kdumpfile_priv_cache_get_page (pio=3D0x7f=
fdee2c1590,
>> > >     fn=3D0x7fcd9ae257ae <diskdump_read_page>) at read.c:69
>> > > 69              ret =3D fn(pio);
>> > > (gdb) list
>> > > 64              pio->chunk.data =3D entry->data;
>> > > 65              pio->chunk.embed_fces->ce =3D entry;
>> > > 66              if (cache_entry_valid(entry))
>> > > 67                      return KDUMP_OK;
>> > > 68
>> > > 69              ret =3D fn(pio);
>> > > 70              mutex_lock(&ctx->shared->cache_lock);
>> > > 71              if (ret =3D=3D KDUMP_OK)
>> > > 72                      cache_insert(pio->chunk.embed_fces->cache, e=
ntry);
>> > > 73              else
>> > > (gdb) p *entry
>> > > $11 =3D {key =3D 1045860353, state =3D cs_precious, next =3D 626, pr=
ev =3D 626, refcnt =3D 1,
>> > >   data =3D 0x0} =20
>> >=20
>> > The key (0x3e569000 | ADDRXLAT_MACHPHYSADDR) corresponds to the
>> > requested virtual address 0xffff88003e569c28.
>> >=20
>> > > (gdb) p *pio
>> > > $12 =3D {ctx =3D 0x55745bfca8f0, addr =3D {addr =3D 1045860352, as =
=3D ADDRXLAT_MACHPHYSADDR},
>> > >   chunk =3D {data =3D 0x0, nent =3D 1, {embed_fces =3D {{data =3D 0x=
ffff880ff1470788,
>> > >           len =3D 140728599320032, ce =3D 0x55745c1003d8, cache =3D =
0x55745c0fb540}, {
>> > >           data =3D 0x55745bfd42f0, len =3D 140728599320112,
>> > >           ce =3D 0x7fcd9ae330ef <kdump_read+102>, cache =3D 0xffff88=
003e569c28}},
>> > >       fces =3D 0xffff880ff1470788}}}
>> > > %<----------------------- =20
>> >=20
>> >=20
>> > Looking at pio->chunk->embed_fces->ce, struct cache_entry is at
>> > 0x55745c1003d8. Assuming that sizeof(struct cache_entry) =3D=3D 32 on =
your
>> > system, this is element 626 in the cache entry array. The next and
>> > prev indices are also 626, which looks good, because cache->ninflight
>> > is 1, so this is the only element in the (circular) in-flight list.
>> >=20
>> > Since state is cs_precious, but the data was discarded, this cache
>> > entry has just been recovered from a ghost partition, evicting another
>> > entry, and _that_ entry had a NULL data pointer.
>> >=20
>> > It would be really helpful if I could get the log for this cache
>> > instead of the one you posted earlier.
>>=20
>> Let's recap:
>>=20
>> 1. Data indicates that a reused ghost entry has a NULL data pointer.
>> 2. Reverting commit 487a8042ea5da580e1fdb5b8f91c8bd7cad05cd6 masks the i=
ssue.
>>=20
>> My conclusion is that the data pointer was taken from an entry in the
>> unused partition. This partition is empty, except when the cache is
>> new, or after calling cache_discard(). Given the statistic counter
>> values, the latter is the case here,
>>=20
>> I think I found the bug: reinit_entry() finds the unused partition by
>> skipping over the ghost probe partition, but if the target itself is a
>> reused ghost probe entry, cache->ngprobe was already decremented in
>> get_ghost_or_missed_entry().
>>=20
>> I'm going to write a test case and fix.
>
> I was able to write a test case for the NULL data pointer. The bug
> should be fixed by commit e63dab40c8cefdfc013dc57915de9852dbb283e4.
>
> Stephen, can you rebuild and verify with your dump file that this was
> indeed the same bug?

Hi Petr,

I went ahead and pulled the latest from tip and ran my reproducer. The
segmentation fault is indeed gone!

I tested c10036e ("cache: Optimize data reclaim for missed entries"), to
be exact, which contains e63dab4 as well.

Thank you so much for taking the time to go back & forth with me on this
one! I suppose there's a reason that caching is one of the two hard
problems in computer science ;)

I owe you a beverage of your choice next time we see each other!

Thanks,
Stephen
