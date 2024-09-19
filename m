Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA9D719CD01
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:14:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726758910; cv=fail; b=nkKzm1hJGfDicRaFBYIhcEuubUoKn1GBAI5Z04lRtxVrjglmdVudH6hqz7PWQnUMLxI5kPHSUu6pgVZvUOLhUiXu4qVMK5syOOM25bzuIMJlmWRSWJDkxw1hIEswKBUZtYRWWsRTrsGe5O3V0/cbA1WWMfPzm64rOtKaKmItWv0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726758910; c=relaxed/simple;
	bh=3m0k2mY2fon2TMydbyh2p6h80404apKVMnozCl/HnJg=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=o+QICxtPe0KXrSg8mdPstxAQNaqbL8CYDc8zrrNpJZD6nJm4+uPLicyHUzyHJ8Qp/q1QFbB19pw2O3aCGRcHSALKp3eadJ3dAGscn+gh0/oU47Pd1uOYFx5Ix3V9w8zWtMLsd19UOUDdDEvWxWT2ikwQnMJ0SwYBGW5mcsuKNes=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=S63m7X38; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=W4NKw9Fr; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="S63m7X38";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="W4NKw9Fr"
Received: from pps.filterd (m0246629.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48JF0V6Z014553
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:14:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:in-reply-to:references:date:message-id
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=5lUpJaZzHY7rnzoVoCnyye8QuLRQo7NhFbXTUypcd3o=; b=
	S63m7X38QY503Y/XWr1H6RyEdSrgZh6cAMMi2TyUFoJ0QZSl45z1yXPpRiXAU1+o
	n+9IZ6as5UsI1ifamY6UZTv69U11rPJL+XcIMLbEVZEEuM4N1CSYpMojmRMeqDPN
	x6nxpFY0EitGXdWiO3wcJST8IDrqDd3kPUbUSekEBqRRRMNw9VgYhvi3NaVacwOG
	iaOJGVPku2p19CFkvFHUIkngJqszO5OpxzS2ZGRGzRvH3RQq9rZt/L4Kp6GC9dyC
	97hX/EtH1obSMPINmPR2OTySHIpcBrCOOfkQistlu8l10vzyeb/44tSUdE4L00nk
	MbvO+tkNof9r5/js1I3fYA==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3n3mers-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:14:32 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JEkVrR040420
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:14:31 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nydy79kc-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:14:30 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=tpXVtwEHWykBuB3krNERO4ueUTEFgpBa0KV+/2jw4fvl3wTU/4JIY+pktZe6eRUTzfsp8Po47HXeNm1Gg8MsT++6SfOCodQrOY4exnW9sxeMh9lcoZGAt9/YgR8g4VYFrJRP+62dxEL2RbbqjCHaQEzOzpnRShcAunXREOIrcq8z8K5w4MlzoIkR6VweMGmy+TPJvHsRXvKyiGN/Y9tX/hZiKBmdpnAwhR6WDlqRCQWG7lgfhE0L7Lo2Qm67q3l+vPMwjIW+I7y2tdDgS9L1iQ29OwKcMDqxSKyYPT1dW0EiE29D9ev2rlXxF2DM3sTLGcLMVVFUgk6666MBxvi59w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=5lUpJaZzHY7rnzoVoCnyye8QuLRQo7NhFbXTUypcd3o=;
 b=QhBwTtbRNMcmYj2P1IfqOVtxgLkd7uXVgoalmWGJWcaGeyV9+mLGmF7CwcIOqGQK+zdRCgdE/rSBd4rR0JhtPmKRLcWOAz11b0A9QVY7e75AIN7mBnrZSxG0pFJCcSC+VZ4h5CCcC/4CcOfbzLyn973/2i9NL0mr53FgJsSvbf5ZtvO0Q4eQ7odwjm3PgUb5g++984S1rLLL5ocpMD0UeBKLZwojMwLcGhDkMi3lXK4FMn1uYPE5JLl6dsTnYZOYNXW8E5d6vHHX8h8UhXFrMfEgkMtN2TxczzdxDyOh2oNcNxNrMWBholPyiH6gWIUBnn+wUXan+/VZG0HMmbHOiA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=5lUpJaZzHY7rnzoVoCnyye8QuLRQo7NhFbXTUypcd3o=;
 b=W4NKw9FregspT1IF8HT942Ec70Izb0kD8WPfTateBFxzT9MoTlqfWm6g9ko7Xkr9HifAdjH4SYJkajV4lP6K+XiotxVicXZDn2x9lhuxpcmFVoAK/06WDXXyARXxLzPqUY+Rq7s1+cX+mQA6p6fVxHBMYw7JqWwYWq308RoJkUU=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by PH0PR10MB7064.namprd10.prod.outlook.com (2603:10b6:510:280::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.15; Thu, 19 Sep
 2024 15:14:29 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.8005.006; Thu, 19 Sep 2024
 15:14:29 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: linux-debuggers@vger.kernel.org
Subject: Re: LPC BoF - Linux Kernel Debugging & Drgn
In-Reply-To: <87ploz3hh5.fsf@oracle.com>
References: <8734m7nl8x.fsf@oracle.com> <87ploz3hh5.fsf@oracle.com>
Date: Thu, 19 Sep 2024 08:14:25 -0700
Message-ID: <87msk33cby.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: ZR0P278CA0107.CHEP278.PROD.OUTLOOK.COM
 (2603:10a6:910:23::22) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|PH0PR10MB7064:EE_
X-MS-Office365-Filtering-Correlation-Id: 6483bca4-9465-4ff9-0eef-08dcd8bdc18f
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UUtzdW85bXJ5aWw0VFZmUkt6UU1naHJLaTlpbm80UTBrd25HWUhFOU1ZZmEr?=
 =?utf-8?B?b280ME1TK1pXeHAzRlZ3T2N3RjFVQkhNRkhOdXo1TUJWeDFycDg3Y3ZYVysx?=
 =?utf-8?B?aFBlK1UyZ01KQUZWckJxVCtjbU0zWEcxNnV0dlgvdWxqbkZTYmZ4TlR3NnFW?=
 =?utf-8?B?ZlJVcHc4SjJnRWgrb09zSkduSzZZN0FicElqVTM0U0tlcjNVVkQycWRjSkZw?=
 =?utf-8?B?Tm0vNnpGcCtuMFh3NStMeVB0RkdDY0xqVFBKSjNBMXhHZ0s3Q2FKWS9yOWFL?=
 =?utf-8?B?SnpVZ0hFZ0VSUmpoaWdjbmhhaDhQZFFReVY5UzNkNmtGMjBLM0VDUTMzVmVO?=
 =?utf-8?B?MTI4NklUd3UrYjJYSXE0ZG0rL0p3ZWcxbGhhSTNkZVNTZ21zbUMwTDZQZm1D?=
 =?utf-8?B?alVONFdRTTJkZVFHMjNDRFl4eit4aUg5eWwyUWljZ3lFbXFCaGxveFUxU3lS?=
 =?utf-8?B?cFhxNTUwVmdwUDkyN2RjaDM5ZFRiRnVUckpWeUM1RG5lZ0lQU0tONUtKQTlh?=
 =?utf-8?B?cnFKOGs1RlNQN2JsUnhhKzhMM1lVc2dVd1d1NUhtakx3TU1yTTl0NnExK0hC?=
 =?utf-8?B?UExLOFRPV0RxajQ4MDMvcXdmZ3liUzRBaVZ6QkdhTWozNWlJYWgzOUUrOHdD?=
 =?utf-8?B?WXZYV2Y1QzRNVG16UUlOSExHaUhHWGgyZit3ZXBwRmN0cjdOZmZTZTltVlR6?=
 =?utf-8?B?b25lSkFjS0FlSWQ4eFRxM3N1VWdEOG5sdjh1Z1pubjlaS0NJT0pNamhKYmVT?=
 =?utf-8?B?czQ3V3RtYjdDSkJrcnQ1SHljMXFEaWtuZmhrY2VOSFRYVU1Id2FJamRYa1NL?=
 =?utf-8?B?SktvWDJWOHZRQ2JmdWdENzY0b0VxVTNnZExJTnpDMDdTMFhTNU51enJwYng3?=
 =?utf-8?B?UEEycU9JMExscXA3OUVnTCtnQjlaR1JwbUFTV0l5SEFaMHIvUVkxZlNXRWZ3?=
 =?utf-8?B?cGg4eDlLbEd4SFFJbGVWTHduWWRwMFFoZFhhWXA5bDBoUnhPYzJJeDRCVTBI?=
 =?utf-8?B?dUtwMXJ4KzVrWDJHeE9hWWt4ekRRdFpLWFVWS3BjNzUwRUQ5Nk43dXNqajM2?=
 =?utf-8?B?cHZMcnc0QlFCNUNkVmNzRGdIb0FseDZyVjBUUWRoNEc3Q3piS2pBcVhWRzZk?=
 =?utf-8?B?Y1ZacFVGVE9CSEdPK3pETzVsK3RQcEhuY29vQXpZYjd4dWtYaGtKVXpyOFlj?=
 =?utf-8?B?Q0tvempneGI5K0NIL0Z1RlE2UCs2OWluV2s2S1o5bENuZFVtVFdQdlJUcEk1?=
 =?utf-8?B?YXlCMWVCMDJtV1c4U1ArSEZqYmVQR0lBdTdoclVZeUU5U2tKdGh3NWZHODJ6?=
 =?utf-8?B?dVF5QnZDcC9sdm9kYVdIRTRxOXJEVWthZHdIejh3YUczdHlZMlhaWVYrdnNk?=
 =?utf-8?B?a3R6SWExWnY2WGd1VWQ3ZEhHOXY0Z0JYdzJCcjZ2cVRuVGZpcTFSUWovZ3Za?=
 =?utf-8?B?a05BbWxwVVlKeEJWYVNoM0lmckp5MGoyUXFaeXdrOFNjMG9XekFVUmJEcGNx?=
 =?utf-8?B?R1ZReXZZTEpmQmd3aFpScEhiQTdhS28yUDg1akc4NXhYbnhreE1TQldyVm5v?=
 =?utf-8?B?WDVXWTVRdUZhelZmYWlwYlNPTXM3SnIreVVrMU9lK1BWQkFldWFMSjhoaytl?=
 =?utf-8?B?UDBPSVZDcnEzSWJaNUlzT0poem1FN3ZOeFh5QnFBSGVsK2FucFlLMlAzbjZ2?=
 =?utf-8?B?WXFFL1FsRG14VFZBU293U1hhUDZJZXE3R3ZIQ1JaT0k4NEMvc0w2dmwvUE9F?=
 =?utf-8?Q?JoxU2EoGsruXWQSw58=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VGpLNUlQTGtZUFYyUUVMUlRnR3VCMENQVmhuSU8xREVJU3NpNmNuZWxaaEVy?=
 =?utf-8?B?WTJTb1VQZGlhRDlTL2VaQVRvaXcrQjdvNDl4NUl0NzBvZGt0UVNaTmRMeGNj?=
 =?utf-8?B?TlA0OFRzRXVLakR3VjhLZmVFbDhaZUpPYmRUS3YwUEliRktWdHV1MTRSRERu?=
 =?utf-8?B?bllKYUt1aGdiNi85WEI3TnJiTFZOQlA3cVBKemI5cGFuN2VPOTNEUkZqUnJH?=
 =?utf-8?B?eUgwT0UwNGdsbUZXa25qR0pqdzdLT1hiWlU2UFFORDc2M24zY1JWNGgrV1Ex?=
 =?utf-8?B?cjMyeXBCRWFaUWFIRFBvcW91S1lSMnpZdm5hMC9hUkNjZ0dhTS8rck5kYlJQ?=
 =?utf-8?B?MnhmZU45OHBRQ0JVS0lzTWlpS3E4eU9EZytyaml4V0JiK2wrN29nTFdZeXJo?=
 =?utf-8?B?TGs4aVVnRStucnBNN2szaEIxSkdhcDByMVBKa1NYSnQ3VDlRQ3RPVitMYnhw?=
 =?utf-8?B?NEJ3UU50NFZJb29kMHdCeDNuR215bUhSU0J5YXdpSUR4c29vamFXaCtLczhX?=
 =?utf-8?B?VjdDWjVKZmg1QjdlMnJ1NUJXWjc2NEZmbXVzUiszektxdW85ZFRkcm9HM3ZD?=
 =?utf-8?B?T1lsVnZrcSs2TG1IdGpyM0t1MTNvaEtjNVBjOFZ4WXNXb3Yxb0E4U3ZTWGFn?=
 =?utf-8?B?RWZRenpQdldseHJWRG12ZFJXeXdZK254U29tUUpGZzY3VlVXck5qRlZzM2o1?=
 =?utf-8?B?OVMrV2JpNDNualZKWjFIMnBhR3RCZUtLZWRRRTcwcDdDaG4rRXc0N2RJNlFQ?=
 =?utf-8?B?K3lqajZkdFFHc2ZKK2tDVncwcDdxL3cyUmRyOEI0UGxMV296K3BZWU8xSzRP?=
 =?utf-8?B?b0JWaWNRTVNEVHJmNWp3OGlQQ1czd0N0SmlmOWFQOEhTRzBNVnplZDVnMUZN?=
 =?utf-8?B?TmQ5WWs2Vi9kNU01ZmE2aDVIZXpkRGVjalRJbDRXRDZXdldJOWxNZjc0Qy9k?=
 =?utf-8?B?L1gxWmFYOXpYVHNoTmNPdTAydTU2K2RRTmNMdENLVGNPTUFVcjZweTNhRWRv?=
 =?utf-8?B?UVpVUE9nOWtoRWNhRWlCMFZrcWZmd1hTemcvOWFCZDZ4VGpwQ1JCTitBWWt2?=
 =?utf-8?B?N3J0Y2hibitkZUZXWWdKR1VpVHdzbE1va2NFam11Qk9FbE4xODdHRHFMdHBx?=
 =?utf-8?B?NXZpTm1uK3hZZTNCZnB4emYvQ0xhNll0VmV0NVdmVWdNWDNsT0FubU9QL2tK?=
 =?utf-8?B?MHRIMXEyMUNOS3hsRGN6YTFYL1lwVkZnUWpLTzBrbzRtamtxemxONkQ1Tk10?=
 =?utf-8?B?Qms3dnpDby9DL01HemoyU2h2ckVjNXBuM0tCaGQxNnYwdm1EQ0U3QU1pL3Bu?=
 =?utf-8?B?L3BVVzBra09QQlIyVURmazJOUVdIazVPZysyN3A4S0tRWXBOcDFYRHNsN0Uy?=
 =?utf-8?B?WnBqeXlmYjg0Mk55MTlmVXg1eUJlbi9nZTZFS29tTXMzbjVaU3Zqam45Rjkw?=
 =?utf-8?B?bklGMFlOV3dJbmpzZGpmd2pLZlFCNFpBOWp3VFl5UFpvTkU0KzQ2RkRJQnpO?=
 =?utf-8?B?Z0RmS1FwcG5BbUdVMEJmc29jL3ZucUxJQ25pQURPbVJYeENqT2RKKzZ6cG9t?=
 =?utf-8?B?QWF2c1hmVEx3MklaRW1ETDhjSUJKOWszck9Va0tTWHBGSjVBZGFYQXVMcjFZ?=
 =?utf-8?B?NlMwVGJVQzRCWFVRWlVYK0pSVS9yeUxiWW1SUGlzYkZ2TVFPbVBRWTU3blox?=
 =?utf-8?B?YkUzTG5BRThraEV5bHN4dWM4RUVXUCs0Rjl4RFlzekgzeGJjMzZvM3JjSngv?=
 =?utf-8?B?SUp3bEkzWFJQZ2ZZRTc5ZHJwU0lRWXdMRFZUbXFYM0VLU2IrMzdKdnh6TTY3?=
 =?utf-8?B?NFNNUGx0NHZBVU4zRjBMeEc5MjNXNXp2MUd0bEhtdU5sbmNVMVpRa0hEZDZB?=
 =?utf-8?B?QWhqTHNNcVhrRCtLdlBGbTFMbmR4eFN1NUVQaTJpMVRZdVhYOEUyenFRYS8z?=
 =?utf-8?B?U0tIMXUxZWNobmNpYkttbTBtSUozcEEvaXBLK0w1TlVtS2JmdkpoOGJSYzg3?=
 =?utf-8?B?YzYyV2J6UHNEQk5SaWhLemJTY1JiMXhRcTQxUFNoN0FtTVE1d216QXBXSkpO?=
 =?utf-8?B?WmhqY20wN1k0K1hGencvM1JyTFBBS084V29mRjVPSHRKYlMxUk40czQ4cFp5?=
 =?utf-8?B?M2dZWDZPbUh3RzFJT3h2b0tvY1lscjIwSjZyVVk4Si9KZyswcGkvQ0lFUyt5?=
 =?utf-8?B?R2c9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	6RJgArdZE2QkinpU4WKFbUjXWdb2/JkisqPWMpRs/54PIKdO4oMOrEPjJMf/sZWTFDFVabgL1FZoEZe/yMuKNdIeo506XTA4rYgFyPde2ZLiUvPh9k7kDyviIJFfU7UTJGsEIOvl61ATn0PgaeiiJLzsKGSt8urFy6CojghN/HKqK92v33CZ1PgyaDrDbaidw9tX77Ru2CoV6DxzNX7F1Kb1VwmplN4aD2c4XyZBL9EuzUq7MWZDUQyrLkjsy0GrGBwoJGqyIF+weHN1SjsRq+tGZpQDzM3h2BCtjNLRKOWWn6NO1nUKTTJF3zgs9f6iVB346ckuGuiTWRWKeAx9qwedo2VZMkVNrECgUgs5sAuaXZr6Jl579WMcD5hyH7tZ5/+VRsnUj9CY8n7nQwli1f6MePzQ0kWN+sLRm0kn3yd08cPrCgyhg8/Ooc/fPbZUStdu+614+wgcZli3ZGzE3C3LgSmgFr442SNY2JERASMof7yMosy2pLrNccEHGWbQa4VJMpj+wOZoouT5AP/t6rz2bvzmZ0D261+7EO8TFBtxty7ybzEeYZZT+FIXSlE55Hs+UrWOaZOTmTaM2f/WQqg5hv+kEEWNxvjHQwtYIK8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6483bca4-9465-4ff9-0eef-08dcd8bdc18f
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 15:14:29.0176
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: phNC/ZILXaemgq51RtAqWspyMdkAU99JDSZlDt886v2u2wUL0KfNv1ce+VM2iPidu10qeImqIbeJD/gvKKjwyKH10puCJNKavOyPQnsXxgM=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR10MB7064
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_12,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 bulkscore=0 adultscore=0
 mlxlogscore=999 suspectscore=0 malwarescore=0 spamscore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409190101
X-Proofpoint-GUID: OcYE7Qhqng4x5eLfMhnkoEyq2n-AwiT9
X-Proofpoint-ORIG-GUID: OcYE7Qhqng4x5eLfMhnkoEyq2n-AwiT9

Hi everyone,

Thank you for joining the BoF, by all indication it was quite
successful, despite my apparent attempts at sabotage by changing the
room last minute. I took notes as we went (though couldn't cover
everything), which I've included below.

Thanks,
Stephen

---

=E2=80=8B* Drgn within IPython notebooks!  Useful to help people follow & u=
nderstand debugging sessions. -Shung-Hsi Yu

* What is the criteria for "contrib/" vs "helpers/"? - Sweet Tea Dorminy.
  -> Unit test cases!
  -> Converting contrib/ to helpers/ is a valid and good on-ramp to drgn de=
velopment.
  -> Though, not all contrib scripts are expected to make it in.
  -> There is also a "tools/" directory which is actually tested & supporte=
d.

* Is there a "rosetta stone" comparison between operations in drgn and cras=
h?
  -> Not currently!
  -> I (Stephen) have some which I could move out of an internal wiki into =
Drgn's wiki.

* Drgn "commands" vs Crash commands. Drgn does not yet have a command struc=
ture, it's been discussed.

* What is the status of drgn without debuginfo? https://github.com/osandov/=
drgn/issues/176
  -> Symbol tables implemented, kallsyms in review.
  -> Minimal BTF implementation, has some issues.
  -> CTF is used in production at Oracle.

* What is the "backend" of drgn? How could you glue kgdb into Drgn?
  -> The memory reader interface is the main way.
  -> In addition to implementing memory readers, you'd need a way to commun=
icate the "vmcoreinfo" to drgn. This provides info such as kernel version a=
nd kaslr offset.
  -> We have a way to provide vmcoreinfo manually.
  -> we're discussing gdbstub options: https://github.com/osandov/drgn/wiki=
/gdbstub-protocol-proposal:-linux.vmcoreinfo-query-packet

* What's the minimum I need to do with root in drgn?
  -> just opening /proc/kcore

* Writing to kernel memory! New feature as of yesterday!
  -> See https://blog.osandov.com/2024/09/17/calling-linux-kernel-functions=
-from-userspace.html

Please join our Kernel Debuggers Matrix:
    https://matrix.to/#/#linux-debuggers:matrix.org
Please join our Kernel Debuggers Mailing List:
    linux-debuggers@vger.kernel.org
