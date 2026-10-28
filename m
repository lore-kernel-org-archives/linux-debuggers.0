Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793210938;
	b=IJsH+URABuj8JTGC3gJf4d7c4s3E2ZH71qORUjCeHblMYBdSkWmthAqopmug9lpmluWE
	 vuAgOQ5YNz0rKEN5Z5+WypHfvfzvKM+PdAF2+2hnSj9x9d2PjD4Rhfsu8I+NdNmYk6Zjl
	 SQtOPp07e1DdsG2+q+Km6nudHdwjXrFQ13Wj+XudvI7F6/jbzQ51ANAQX/d37sz9qjoHw
	 wRYczBipUleHFI7snmeo3earfMaJTvTfbXIWeGV6UMxyZjSXQGzHfieqPOQUZhzrScKdv
	 eF1M0NT1AYxXjZP+NTRCzqZfHPF6VdmAzPaN0nhB+O7U/GKoi4c/Sv53YjpalTUsj2w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793210938;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:
	 DKIM-Signature:Received:Received:Message-ID:Date:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding:X-ClientProxiedBy:MIME-Version:
	 X-MS-TrafficTypeDiagnostic:X-MS-PublicTrafficType:client-request-id:
	 request-id:X-MS-Office365-Filtering-Correlation-Id:
	 X-MS-Exchange-SenderADCheck:X-MS-Exchange-AntiSpam-Relay:
	 X-Microsoft-Antispam:X-Microsoft-Antispam-Message-Info:
	 X-Forefront-Antispam-Report:
	 X-MS-Exchange-AntiSpam-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-MessageData-0:X-Exchange-RoutingPolicyChecked:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount:
	 X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:X-OriginatorOrg:
	 X-MS-Exchange-CrossTenant-Network-Message-Id:
	 X-MS-Exchange-CrossTenant-AuthSource:X-MS-Exchange-CrossTenant-AuthAs:
	 X-MS-Exchange-CrossTenant-OriginalArrivalTime:
	 X-MS-Exchange-CrossTenant-FromEntityHeader:
	 X-MS-Exchange-CrossTenant-Id:X-MS-Exchange-CrossTenant-MailboxType:
	 X-MS-Exchange-CrossTenant-UserPrincipalName:
	 X-MS-Exchange-Transport-CrossTenantHeadersStamped:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID;
	bh=wOI/UChRht8wJYlNh/xIGS8ecP2LhCGcFHDkx/Cj5bA=;
	b=2VL6v8qR0+q7J1vB9l4RGrMTXagvRmqiUQ6N21DzbikIsxFWR5p1q7QE1HTHKU9qlMP/
	 G7kU2vkgj/FYFqfYAJUQlBvXxj8PbYXA/OhwyCUUFT5MmE8MG3vsDPhHUBVnBsuLKI4/P
	 TxwTS30e8XQGhGFlJPyE3GDOXuFq9eGbVYMM8BR/r3RwKifX1tsJxnm089JXVzc3/hYQe
	 e2CQUe8nCm5w5CJ/mGDn6hOlWzN5+Ty1torjioX2xp6HF0FgZsEmm7xE+NvdxgsGpP60f
	 u0KfdzRPKe4X9HEb7lBU+6C8GsbrCd6uWBKgDmi41ICFUY+RPKHUzVIDBiECPKAZ/3Q==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oracle.com;
	spf=pass smtp.mailfrom=oracle.com;
	dkim=pass header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=bISRS0uB;
	dkim=pass header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=fRqidA6b;
	arc=pass header.oldest-pass=0 smtp.remote-ip=205.220.177.32
Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDC5B606A321
	for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 18:08:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DDC5B606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=oracle.com header.i=@oracle.com header.a=rsa-sha256 header.s=corp-2025-04-25 header.b=bISRS0uB;
	dkim=pass (1024-bit key, unprotected) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.a=rsa-sha256 header.s=selector2-oracle-onmicrosoft-com header.b=fRqidA6b
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69SDIhE52857955
	for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 18:08:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2025-04-25; bh=wOI/UChRht8wJYlNh/xIGS8ecP2LhCGcFHDkx/Cj5bA=; b=
	bISRS0uB4HSORPJkEjAo8ocsfbgC6SE9pKgWGoA/MY9UFIS2q/KliItwHiLr6/RF
	gR7bPmFzFeJpXmA1V+Y6J1LLQldH8r7OVskkhVYWNPtmpqlhBhNV2jMQpS/GpTjC
	yJ9NrgJwrWIFgQJNTlC73CxSAtFVURez7B8zT2qia4OcubN807lVfi1KKG5BhFni
	D+bFsrS9B9owcQ76K2r7zK3N2MYcnIfVMgWh6v+un0rlSrWIOJ87/ypzPNMQ6F4G
	sYTcMIGjJXEq4zikGvBEdUW2RKAM8Cd99fJ9d5frz5ztvXHETiXRLou6D8+t43FP
	gVuReXHbOGY4eipDIZUXsg==
Received: from iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta02.appoci.oracle.com [147.154.18.20])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4hgkf1xe6q-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 18:08:51 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.11/8.18.1.11) with ESMTP id 69SH6JbE3932289
	for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 18:08:51 GMT
Received: from ph8pr06cu001.outbound.protection.outlook.com (mail-westus3azon11012071.outbound.protection.outlook.com [40.107.209.71])
	by iadpaimrmta02.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 4hkn5hsv73-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=FAIL)
	for <linux-debuggers@vger.kernel.org>; Wed, 28 Oct 2026 18:08:50 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=wwxXCJ0RYGdEDrho9EEraUN/7Z6Oj5JbBx7nIyXocxYbT+QNFxFPljiGmAERtID6a9fLnoDZURdKIAhQfRiUmROTgp9CK/JxLTG6HPXFVtH9H4WpsOCZzTSqW+FmOA9H46t9yUd/o+xi5SBH7Z1csAJtGxvV/3OX1RmbQcea+1cV12xoeYaN8A40eFYD72yE0CnS0P6D0dCkuvoe92KqT/tlzeGre9612RbGzMNsUtR+D/hdR1+S0KGFYJZ6hZTN2pT/9sRTKi5zPZQgsX8HGFQ+YVXmeN15upKBAYKDO9zBpV/k8quV9hgVobYVWQaTtFIGj8AHzRBDVjPYU48i+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=wOI/UChRht8wJYlNh/xIGS8ecP2LhCGcFHDkx/Cj5bA=;
 b=vqn2HxNWCdykJxM+GpQkoF4Qujtu+w+T9L0nN9shcvt8giTow2RlousqkEFXDK2k0EuOzpRymTtuqA/OWuxsoat+Nf9nX6X+5IcY6JBPK0ffWOPwCyKU5EvlagKpNQZ5Ztt+eb0hpIcgCdcwZqyfXeFP4eT5BqecvCDf5wA/ODtbKL9CnmRU9ncn/p1FRtNbOnB61iJsuqATMk4QIcsoH418VuCKl0e+Sjanes7NTegetdTCAQ8EG7Ki7XZxEGQrpvyzXNBTXMphYIgi6KnLqnySv90invLkJ3ZAmeLEWafDCrnf/tUIPRLqxRmFpUGtzuOBwcKl+v9J2VCh/EuNag==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=wOI/UChRht8wJYlNh/xIGS8ecP2LhCGcFHDkx/Cj5bA=;
 b=fRqidA6bvdTVAqAsBLQVSY4WmsCUagdzjoSBMpjK4yKRWgK7kpBXcfx2rNE0KePvhQ5T8Gj3Nh+2jwzbDlQY2lhIHfYOrUwtMwNsO5Nt7FI8O2vPL/AvwT+b3VQj6TiUEce8LYYLZ+XhU46wzlSJtCICg23hdtzoq93ADjAYr4A=
Authentication-Results: mx.microsoft.com 1; dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=oracle.com;
Received: from SN6PR10MB2557.namprd10.prod.outlook.com (2603:10b6:805:3f::22)
 by CHAPR10MB997723.namprd10.prod.outlook.com with HTTP via P2P; Wed, 28 Oct
 2026 18:08:49 +0000
Received: from SN6PR10MB2557.namprd10.prod.outlook.com
 ([fe80::fbe3:8d9e:af79:5c73]) by SN6PR10MB2557.namprd10.prod.outlook.com
 ([fe80::fbe3:8d9e:af79:5c73%4]) with mapi id 15.21.0546.021; Wed, 28 Oct 2026
 18:08:48 +0000
Message-ID: <91f8d6dd-4475-498a-b512-412537e30f46@oracle.com>
Date: Wed, 28 Oct 2026 11:08:47 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: Linux Kernel Debugging Tools Monthly Meeting on Wednesday,
 October 28th
To: linux-debuggers@vger.kernel.org
References: <auEJ6HR8g3jNLIIa@os-N5J97HY9XQ>
Content-Language: en-US
From: Stephen Brennan <stephen.s.brennan@oracle.com>
In-Reply-To: <auEJ6HR8g3jNLIIa@os-N5J97HY9XQ>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ClientProxiedBy: PH7P220CA0156.NAMP220.PROD.OUTLOOK.COM
 (2603:10b6:510:33b::12) To SN6PR10MB2557.namprd10.prod.outlook.com
 (2603:10b6:805:3f::22)
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Post: <mailto:linux-debuggers@vger.kernel.org>
List-Help: <mailto:linux-debuggers+help@vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-debuggers+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-MS-TrafficTypeDiagnostic: SN6PR10MB2557:EE_|CHAPR10MB997723:EE_
X-MS-PublicTrafficType: Email
client-request-id: 6b420eb8-e6c0-4c1b-b890-0d95a060ade2
request-id: 08b4767b-0bb6-41e9-7859-08df351e839a
X-MS-Office365-Filtering-Correlation-Id: 08b4767b-0bb6-41e9-7859-08df351e839a
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|376014|366016|1800799024|23010399003|6133799003|18002099003|22082099003|5023799004|56012099006|261021123027099003|261021121427099003|261026140227099003|261026121527099003|10067099003|261021135927099003|261022105027099003|261009223027099003|261028144727099003;
X-Microsoft-Antispam-Message-Info:
	6gj58WUgs+AaEPhhBAAf9+H/aZW0ICAu33OjbIof+HQ5U8nQdq5bLGuITxe0ypVAIEZjodXzbjvALBtuTmkjHnf2048HOjCH4FF6/uPqSIJ8mt0sCinD+wS+TBDjRc4INPX29MoUw0THZ/b9AXPvmG9214omZyPF1UBR7rOMFuQnRuwNbnn1y9IGgS2ZbHwfSCgHi/2yTPm5WQZd7nnyFl9iPuWY3enPBGiqpzR8iF9IR8sDGWAyA1gXdJHvgnY8QSYfipPYmltxC5EAc1vLARhxwmI7gg0lLCKPE/NIinTQsUKWOUksIIcndKYa2nQKwxF29wR2RxNehk/rLp0ww/YTK/gxUOwZluKXwN6RPUnw1MU1nT7rfhE/rNv+ykWAMoBBBcaP0Mo+KzM+iDvIj97a31oC6YehCpAQLTTvyYumYj3FSzc8tUP4twn7V8/SqNOlXNXxgePpfLd9ymfxqAkSeZLL8XNnwnrjwEmb5pYiH5p2hzfGMW8xzFgwCWZ3nw7Lrn1hENy/xpwBM2yKRyZx8UvMjPq5B1GKqSP5hTB6OhyJgURRRitUULeUSkTxz1rrW3bvfaLXDfJ1DX6fPGjN/g+Qra1raNCFACDbpinKMLppCcmYoFkMbLWykY/U
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:;PTR:;CAT:NONE;SFS:(13230040)(376014)(366016)(1800799024)(23010399003)(6133799003)(18002099003)(22082099003)(5023799004)(56012099006)(261021123027099003)(261021121427099003)(261026140227099003)(261026121527099003)(10067099003)(261021135927099003)(261022105027099003)(261009223027099003)(261028144727099003);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?Qll1TVAxb1lDRDQ0YytVUk50ZEtWcDhjbG1MZ1NOb2o2Mk0xaW1YanN2NThl?=
 =?utf-8?B?TXpjMFVXQXhNVEc2emFaS2IxcE1LRTFJa2Q0bXBwYURUWVJuMVBob2hSaUc1?=
 =?utf-8?B?ZldIVSttSFRpb1djblpoZ0IwNSthcFdrdmZYV1NwQmdydEE0QmFmdGNPc1ZB?=
 =?utf-8?B?dTNRekFuZHJNdHFaTXV2REJmOWZJNVNKQmNqeWFUWk1vRnJCclNzZzR6YkRs?=
 =?utf-8?B?OVQxMGJ4dlRCT0ZPWFdFY050N2tGS1pWMVp1QVpTWkRjSm11cVBjbzAyTjUr?=
 =?utf-8?B?RjdhaS94bit0akl1MHdmVWNyYzlhLy8rNjFpd2Y3N0dWTW9RSEo3VmIwNlNm?=
 =?utf-8?B?RGlUOXlwRkljb0hvSVFDT3BYR2lyTmhDeU83NjJpcllZSjkwbEozeTU5RENm?=
 =?utf-8?B?ZUhRZEFFNHJSRU1SSDZkUEJBRm5IUnBCZTFqY0lQaEt5cmYvZytDaXR6bVRL?=
 =?utf-8?B?OW5rRlVpb0VjTmpoam9XckhCVS9JSVNxZm5RTXR0MVZTRjMrNG1CbFFTTGhv?=
 =?utf-8?B?dGRGYWFzNlh1dEdxcENxZU5SeVYzeWgyZkJxd2hSOEZBRDNJWFNVUElrQVRp?=
 =?utf-8?B?YzNUNTFVWnEyQTZZM1JyQjlvZll1S0cvUkdvN3h4L21QWVlLZ0RiRmo2QXFZ?=
 =?utf-8?B?UGJuNkg2dzJiVm5RWElQbVpTeGp3T3N2NnhDek1XTEJ6d1ZnOGNiYXJYaUdC?=
 =?utf-8?B?WWkxR1N5MUtsRzBnazVoeW1uSE92MmsrWkZxU2YvWGV1NllIaGZvNmEvSUc2?=
 =?utf-8?B?UVpvRVhIcGNYajFsbko5TDJHMFdkUEZDMUN5dW1QWUZvZWtCbFlmazFRSmZ3?=
 =?utf-8?B?WjloODhpQjZWQlkyNHlEblpVQTROMCtEaEE3MFlaWnJMVjFKVXU1cDg3S0VM?=
 =?utf-8?B?d1NldlloNUJ4T1FtT0JnUjhvbjFteEExZGZWd3dhNGJQbEluQ09CS3ZTd1FY?=
 =?utf-8?B?Wkt6NEpXVlcxMGhkZjFhSzA0ZldNSlowZVRZK01zQUFvM2JTMmJWVG9Ed1p4?=
 =?utf-8?B?MS8xMnc5SkJoa0ZCUVRrTUUrOVhCNktKYXV3WTc1T0xEUzNnMzVCOXhsaVhZ?=
 =?utf-8?B?c2lYb3hFd0hJQnpKTVUydnNjRExLdlVBaWpXQzlYUy9zaVlzTzFPOU1MbUln?=
 =?utf-8?B?Y2hJNUJHZ3VYMENQNDlrbElWeVdSMDFsZExQaklQK3hlbWVsZlc0R3UyUHY0?=
 =?utf-8?B?a0lwSm55Tk5RK0k5RG9qYmtiekRoQzFTQjY3TW9GajJka1dqOWpQN1V4NFNm?=
 =?utf-8?B?NjlVRTl5QTN6bGo5N01qbVdRd3VRZjIrVEt6YTZ5dllEamt6cnpTWU5yd2Fi?=
 =?utf-8?B?Z1RkeDZ4aVVmcUhTNFFqSGZ2RWR1SlpFMi9LaGJjeEdTYjJ5ek1aSG1aY0tD?=
 =?utf-8?B?OE5wWlplMko4TjNVcFJvVXFyb2pWYUYwaUhiaUU4ZTIwVlM2UHg2Q2VZVFVu?=
 =?utf-8?B?M24wT0hPeEZLUWR0Nm0vdVhNY21BdkxiSXRXMEc4ejZTWFhYZlhNOHlValRJ?=
 =?utf-8?B?K1J2RWlBeEZ6U3ArcnhlVXY3T2cwUWVZWCtMM3VJcEFpSExCQ2xkQzErVFpz?=
 =?utf-8?B?bTYwNFIwZW1HaStSSitlRndna01FV1VtdTVKOGtqaGxUWjk4dFlXQ1lveFQ3?=
 =?utf-8?B?M3JtdkdJMEFEeHE1aWMzcGJLMlduK2Q3dU1IWUI2ZzdiS3FqWFI4bFRxOUtT?=
 =?utf-8?B?WnNIQUFzUDdmNFJoUnB6QWtGa0R3NkUxY3grd0t3cnZEYnVraXVxc2RLa0pr?=
 =?utf-8?B?L3dmMndBZ2d0UkY0UGZObW5ibTV0SUFqWG5reEdYR0hYOUhDQTBlUjBwNS9W?=
 =?utf-8?B?WWpUbGZRZEg5bVJ2d2p4NjdYa3U4RmRhK2lTM2M5ZHNyNkNNeHEwVUZzRFM5?=
 =?utf-8?B?VnNtd3hocDBrRFNYU2JzczNLSDB0UG9hNVd4RlRDSU93ZVFEeUFxSFhjMHVN?=
 =?utf-8?B?b0ZvdGZkbi9Zcms2cGhpSW1EN3hFQ3ltSWYvdHNoRCtYdG5Wc0xmdDdTam5o?=
 =?utf-8?B?TUo4b0p4Q3kwUVBsZi84THRDRFFURGF1Q0hVRUczMEFOSW1BdlAvbnhPSStv?=
 =?utf-8?B?WDMrdW1WcndVYUxwU2x2UjVuVGxqZFo3SDNmbGd2ZkM2RUNIUVlkTERmREp6?=
 =?utf-8?B?cWFxZVBzTFFTY2FTdmR0YjFBVVBYbTBuTmNXRkQ3V3JJcnhPRE42RTV1YkVt?=
 =?utf-8?B?ZHZVWXNhM1Q4L20zQWR5enhlZjgzVmFVYS9HeEtvcjYrenBVbHl1cWkvOWZk?=
 =?utf-8?B?OXZQVjNhdzNBV0ZoOGtJZVpDN05VM0VrYWNKQklwUjluRENFbFhQOE9JMU5y?=
 =?utf-8?B?VUhTQ0wyNUFGekkvZ2l6SmRxQ3Y0dmtPRUJXc0VnTDJYajA0S3M3TUg3VVBm?=
 =?utf-8?Q?uyTxUF2f4GDmy+qM=3D?=
X-Exchange-RoutingPolicyChecked:
	FGtoG6wFvD8AfvCbWEXxfbHTK+VgEhy6jfj4dTL5Yao7RaPiXgqtOZ4hluonEElLkCpnsFQObL4OqBHrm/fU6SUz9Ymz2slDyHLl+lWOogFFafNgMQ4p2lI4h9dZOAyN1A+r41MypE8fl3vgzdEH7030sRIgq4uk5dT4H2t6pGKVWoc1s9UJ25Mn56lpuM6uv28yC+9qXituVOjZYNR6I0uKJ3u7wX80gcYEnO0/xxAEDd5BVBlV0Kxg4omY90P6x06+FdeF2iWKZpAKm6m+Lz+ZlH/86SGBjzN7DU7soyf8SXIu1f+P3ugOnsrhZv83nj2N3/GN7K2UvRBOyujS8w==
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	yS9uUMXuzNeiJc83Bu+j5Jx4rTvHjn5OZYT5OQZCW4ce0ebSQpRGGwIOXG6XH8be61/wPdgvpEfvAPA/lTfhfu9t8NDmqsfiLRhUu4QbAW10/YyniqToNmt01cz8b17f6lRDwZckMknTHov2LGG0hWLqh+umoKazCaJjkLdggqFRn/E20kkcR1EQtDGNoUKxh3adYjuLHikGd3zdaEii/8XEY0ZjVLijJ6mzH1vscwlmCtmXeMs6lHDHBR4TYc4keadWOh0PPOiXevtaglGASVWzMNwdyqMd7Y9MNc3mrp4t/IdKy3xK/NUHwNxZScvJrMvSVdc7W6slSJC17KzjNypcTSsH50Cx/yclucf6JQczeA3wcKf6exolwTApbqiLJ6fhPXPM6HeVZpuCGY+BT2xw6ti3oTsiZq00tg4f+OQIeKSTA7//XVHIwM3OsY3xqhT7Va1wksF0AuxbV/gSYaLxeoH+o/NiKzxKeItU82eyTOFJv6SZlZZtddsKZbEMM6FdBVAQWyft6AajB5AM5brOb05S8oA6nQFAwpLW5rqJQiyHE9WPPD8TdGDEjoyYG8Cb3dmaBLpsMagg1cafQkHERfUBSVVEl9RcjpVtMAc=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 08b4767b-0bb6-41e9-7859-08df351e839a
X-MS-Exchange-CrossTenant-AuthSource: SN6PR10MB2557.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 28 Oct 2026 18:08:48.8572
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: /ASB+8iV/4teaCWjEdOlIskQ+pW8M0IBhkqm2mqk9kNCJO+SBodHkJEUM9z8nsoIZaw7MjsSucYkiTaodP/n0FY5cWd47AxVH1QuyUJjiHQ=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: CHAPR10MB997723
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-28_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=100 bulkscore=0
 adultscore=0 mlxlogscore=-999 mlxscore=100 suspectscore=0 malwarescore=0
 lowpriorityscore=0 phishscore=0 spamscore=100 classifier=spam adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610280072
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX33ws0mjHrveW
 6ASxLTFegQlTJZMwaDIXE1trPaDkEIphXz581RVRzQCxAGUTaslEjNAJ17SMIzmLG/zR+32s0FQ
 8v1cdy7RNgUOar1oe4D4JLYWhKxwLmn0Rcmh2U8iBbeKzu8O69Ex
X-Authority-Analysis: v=2.4 cv=V//oQuni c=1 sm=1 tr=0 ts=6ae23a33 b=1 cx=c_pps
 a=e1sVV491RgrpLwSTMOnk8w==:117 a=e1sVV491RgrpLwSTMOnk8w==:17
 a=6eWqkTHjU83fiwn7nKZWdM+Sl24=:19 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=660iZSQnnn4A:10 a=GoEa3M9JfhUA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=jiCTI4zE5U7BLdzWsZGv:22 a=o5oIOnhZENCTenyL_yNV:22 a=UXIAUNObAAAA:8
 a=NEAV23lmAAAA:8 a=YA9mtIftFvGRrKtmsF8A:9 a=QEXdDO2ut3YA:10
 a=a1s67YnXd6TbAZZNj1wK:22 a=5yU3S35YU4bGjq-dph-N:22 a=Bho9c0fBagfJEIQBS7DQ:22
 cc=ntf awl=host:13537
X-Proofpoint-ORIG-GUID: ygvliYdJL1lSsO_wtOxeZW0i4No1CN1F
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDI4MDA3MiBTYWx0ZWRfX1s7dbF6bwDTG
 rfQLNENpv5bZ0FyrRIQMeWc7JOSDQVvnGyrzimbau4Dzl6yqVGtAT4KES0l49v20K/MaC7TM4sb
 bitgaE9y/dCd0QZcq22z6+omJZ/I8Fn0V5qHWxoohwY//Ep4uST+qdyjTX4th+FX1gXsKsHAsmF
 D77oI+/BsjW6lblyTzBZdJqaMTRBwtckEWQnXOHOtVXsz9e0C+Z4EUZajXz6zeYly8HDxP4vtUL
 byrmBGrk+Gg8p1ar5B34lUaI5x4EsiFKpL14Uqk8wAMzADyyFEzLYz7iMFZKZ2XDoYqKGHDj+Mc
 e/Lo71sLqaWvxSONn0fVIytAJ2wKkADwJIBUYG4cvdrE1+cJ0Fw+aOO7wl6i+oAah6s7yjhdmgW
 v+ioRo6s6cYZ3nXQlnsameOK9hy7jx4nKFd9pgpk85fX36TiuHqjkQtbuAnm3Gphhl2Nn72Umft
 BOA6/3b90muUUPzTYRbJXKd3hn3o0qAh/HzxyQq0=
X-Proofpoint-GUID: ygvliYdJL1lSsO_wtOxeZW0i4No1CN1F

Hi Omar,

On 10/27/26 1:30 PM, Omar Sandoval wrote:
> The next Linux Kernel Debugging Tools meeting is tomorrow, Wednesday,
> October 28th at 11:30 AM Pacific time. This meeting is a forum to
> discuss development of Linux kernel debugging tools like drgn, crash,
> and more.
> 
> Note that the meeting will now be hosted on Google Meet.
> 
> Here is the agenda so far:
> 
> - Threat model for kernel debuggers. Philipp, Petr, and I had a
>   discussion about this at LPC that would be nice to run by everyone
>   else. I wrote a brief summary of my take in the drgn release notes:
>   https://drgn.readthedocs.io/en/latest/release_highlights/0.3.0.html#hardening
> - drgn AI contribution guidelines.

Both very good topics, thanks.

One more topic I think would be good to touch base on is setting the
aarch64_insn_pac_mask for custom programs. I think the open question is
what would be a good API. The existing approach is new kwargs to the
Program() constructor (like vmcoreinfo). But I'm not sure if that's
appropriate to keep expanding.
https://github.com/osandov/drgn/issues/647

Thanks,
Stephen

> Please reply with anything else you'd like to add. As always, if you
> would like to attend, please email me offlist.
> 
> Thanks!
> Omar
> 

