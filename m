Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7647335A7
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:24:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726759462; cv=fail; b=crbrehi5zOROr0/RsyJFAHWt2aaQJMvUlULaAggdBGPbHhpBvEEkk8MmMYxKdsGVb1rOz85XEVSDir2+IgApBv8e9qXTWQNHRO4g8vMGINiWZBl10XTkBeh1HwTqZZPjkeWR+YaWjCBWE+3Yc2ZcpN4q9bZkoqG7fb3ukpcLklc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726759462; c=relaxed/simple;
	bh=kvVlIPTZz1FQvSm5FL1c9sXZ9VCC/T+Sr+hEfvYWA6E=;
	h=From:To:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=MiZb0O+ei1HUxeJqJEyAHAitN+RadlCj2kzgHZ8wRUUOXEtKTHJGvWYovVV5mrFI2qwrEP5GrQ8v8UHQnJl0M+x/gYH1hkhNtK01YBymfS+CTjoLJWhOqGD1ibcCSWXI9R+dEfT7oVpTIFZf6wA1txS0J/kJXeoYvE/2/Pb/ufE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=Ves2EG+c; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=PTPWunur; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="Ves2EG+c";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="PTPWunur"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48J9LYU4011988
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:24:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=
	from:to:subject:in-reply-to:references:date:message-id
	:content-type:content-transfer-encoding:mime-version; s=
	corp-2023-11-20; bh=4IVt7a9Xj8rqTnZ9SbF+v6fhKl8L4lc/vkkGLuer9OM=; b=
	Ves2EG+cOVlX98rnUm59cjOkv8BifC4BGltDpdcz8WbiSwqHj8KuOpC0y5ZmMXy2
	mdo3NbF0a8Q1cXF1BxmguyCJzzGQoCEcE82kcM/n+TBqvNA14FbbSYBthUmlXV9i
	5/b1/z/h39WOk6clgP37uh7uWDjx1pyT4ssBSOG/8DRu9FUMe5i76ejt+2ibEy7B
	Sq9wvaExseT9h2pDndvpQp85KUamKwBkrEv3/n1E8TE1TPhoD8H/FCIvABR/HFPI
	HlJxjwVxJpXoknVKS9lECr64EUF66qWwHOIMXw638dQaaF0TKIymCyY/Qoq4DeLW
	iXeuflB2RYkHGzaGrhD+PQ==
Received: from iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta03.appoci.oracle.com [130.35.103.27])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 41n3sfve3t-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:24:19 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 48JETjk4015658
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:24:18 GMT
Received: from nam12-mw2-obe.outbound.protection.outlook.com (mail-mw2nam12lp2048.outbound.protection.outlook.com [104.47.66.48])
	by iadpaimrmta03.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 41nyg67q8d-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK)
	for <linux-debuggers@vger.kernel.org>; Thu, 19 Sep 2024 15:24:18 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=O1pdQDJHAOlL9LDO9j6diDtVPPuP5kHZz/7zToNSDrxO8KwL7OAkKJIThyy/MrGfBUGAX6qY3wgqwaaY0L0S2qL8c23wrbBHt2mJRXAID7QdGnpO6p5JU2Y1/p2R6J8HUaVq+pfAoQdsJ4biPwcVsWwpxjkCsyA+kmE5/sZM+p4E98Hstflpd2A2cu9b8vtimcfSlemh6dwEGO8rQFotXcv5GYIF97PJz4aKrFz2OX3Bi+8WLm+eEkPY03xnvt9ZtTGm/Mb3sY4Acm188cELeRFHPh/u2n0+R0P2ker0p/W/LE5rXFLbroWW9fExZyhVU7BiMBM205qTrkNe5XUcyQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=4IVt7a9Xj8rqTnZ9SbF+v6fhKl8L4lc/vkkGLuer9OM=;
 b=qnjO44/15MFRHnIB8I/cVkeAaESGVahNI0JgO/36/tKOh8AvvnxgD3m629jd+Mhd3+mxTPibvUvXZ9mX1GOHH9e9eUgp9NdKkAuCvDUD9eL7X8ZlsZ1EUUqVeFPT0RIXiiEL/nZz5sJ0+Ys/LCvVEMSeI0ATRX1foRAjg3asCmdo5Qg9HH5fMwSHr3J1cQPfulci3deYXlDE7hCxgh3zpbbfsA3cTnik6p4AXoPHoez110zxolIVV9Sffo/ZnUrsj0czCC5se5IkIrCOYMkTIaqkobvRa0IMaacH8S//6ElqwWJU1satHH0t8ncfttoUP2KKfnzKST+2K4c1PB4WXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=4IVt7a9Xj8rqTnZ9SbF+v6fhKl8L4lc/vkkGLuer9OM=;
 b=PTPWunurrT1cOl8Jfl2anH/6JYt3axK6tuFBlUDxL9zwKZ/itya/9sv7gwJRP2sKnpA56151cvD0YCmNi2oPFSRSQe/X/Ow7Hcdv3DsfvUo7i7ro2lfl3lNNNE/5hIFfkyqBVaK8+gJ9zXG6xoE9mGHkOpyvHQgxKeT9i5GRzoQ=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by MW6PR10MB7640.namprd10.prod.outlook.com (2603:10b6:303:245::13) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7982.16; Thu, 19 Sep
 2024 15:24:15 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%3]) with mapi id 15.20.8005.006; Thu, 19 Sep 2024
 15:24:15 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: linux-debuggers@vger.kernel.org
Subject: Re: LPC BoF - Linux Kernel Debugging & Drgn
In-Reply-To: <87msk33cby.fsf@oracle.com>
References: <8734m7nl8x.fsf@oracle.com> <87ploz3hh5.fsf@oracle.com>
 <87msk33cby.fsf@oracle.com>
Date: Thu, 19 Sep 2024 08:24:11 -0700
Message-ID: <87jzf73bvo.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: VI1P190CA0001.EURP190.PROD.OUTLOOK.COM
 (2603:10a6:802:2b::14) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|MW6PR10MB7640:EE_
X-MS-Office365-Filtering-Correlation-Id: 37a6d05e-c613-41e2-acfa-08dcd8bf1ede
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|376014|366016;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?YUlpcGd3OFdoMnVzTTNwR3JtbmpkRlM0Wk43TWtLTnhNY0FlS2VLOTJ5cXo0?=
 =?utf-8?B?QXh4TE1KMkFkRi8yMFBhOTE4cXY3NnNaSlFUbVVQeDJEb1o4WVhQcEU3Y2tK?=
 =?utf-8?B?cmh4M2NZUk5SRXdITW5PSXFWeDZaNTBTUXpGa2NhY0o5b21DcW1lRXl0YzZJ?=
 =?utf-8?B?WlBSWlQ4US9DT3pJcUMyLzBNdGNpaFVHMzZKL1ZsSkdaR3ZiV0gxSTNqT0kr?=
 =?utf-8?B?L250ZktQc0JRTlhVT2VlSTBDUDlQZFBYeHRTSlVxVFgwSUdXcXcxbmFIRWVW?=
 =?utf-8?B?a1kzVWxvU0JBalZZK3JTcG43bU9Ia0J0c0xBRWQvQ25OSFNBQzJiRmo5bElV?=
 =?utf-8?B?OGM2VEJ0VXJZajBvWU5aOExTa0hlVVdjS3V4bFBaSHoxMEs1RDZZUmpyc1ha?=
 =?utf-8?B?ZjJiWWs5T2JOckF4ZEUxZXVPbk9remJTdjBTU1ZVOGdmVm5aSDEvMmw4V3Vi?=
 =?utf-8?B?S3l1Z2RZTkpMbWxnQlJrdXZBVmZqMk5ENVNGeGQ4cjZDci9NL0tjV1UzUWsv?=
 =?utf-8?B?MjdVMS9sMklSZm9ZNnFWY1AxZ25tOW1ueDNBNkhrT0RDdTVaSHczYy9aR0Fm?=
 =?utf-8?B?OEZBLzdEZUswOWJIQ29Ia20zT3FlZ2hFS2tzTW5qTitSWGpOYlBCNmh6MjUz?=
 =?utf-8?B?aG8xLzdJdEhaZ3c2N3NIdFh1YTZWcmFuT0kxRFRncjlpN0RpK2FUSFRtSjZS?=
 =?utf-8?B?N01OSEJqWFVxYitpMURoRVNWVzA1cHJVNlhJWW9xN050Q0F1bUdncHFWakpD?=
 =?utf-8?B?Y2E3NVpyNFlOU3owamJNQW1ra0xCNFJEN3hCN1lqMVZ3YjYzRU11UXM3WTNG?=
 =?utf-8?B?N1dnWDR0R1k1VkVFV1JvV1ZBUGVwMW9yVS9RWFpjRmpNTXFnQ0dBWjVmTlFr?=
 =?utf-8?B?VFZaVzZVNFdlQ0tTellwbVhQQVBRb3RIMFBZdlFGTEpMUmRjZjhmUSs2cnEx?=
 =?utf-8?B?UnYxbjVOZDZ3QUZzSWZXbVhVNkRsdVB1NHJMRDJGTFZ6SnlwUUxvT2pYUzVm?=
 =?utf-8?B?Z1gwSzRVYmFPUC9sQ1hhWHM3WENFZ2xmU3RXcDlMcjgzMnpIUjJGdnNOdHVr?=
 =?utf-8?B?RTNOdUxjQmtHclVmK1RyVVdncGU0U2laSjBpcWRPa2NEU0N4ZWlUcXJJbzFR?=
 =?utf-8?B?aFdndkU5NVBoYkNqUzJKTUxjeGw1eEUwL2hoakMyS0RXN3BleURKQk5wcjI0?=
 =?utf-8?B?Y2FTVlZtRWgrWDdPb3ZMOVA5eU5JWDc1bjZDekZ3ZWpYd0RqTytFL2VlM0JD?=
 =?utf-8?B?SXFRNWx5eXJWaDVzekdJeTBuYkZNNFRobzdzYUY5MEUzMU5kWTVzZVR2dk1B?=
 =?utf-8?B?RkxqakF4VEhMWHliS0NXUzN2QlpFcGZYOGpYeTNJKzAxSEkrR2pkY0Y5L2Yz?=
 =?utf-8?B?UitnVmFySjhBajNRS0hzU3l0WVJENzR4amg0RlRENlJqcnQ4N0JsVzFjQjJJ?=
 =?utf-8?B?U2RKNDA1eTRxSUdMVzFNQ3FnbmRKUnNiSWZnYlZ1RmFIdU9rWmpvZDZsZnR6?=
 =?utf-8?B?cmVYb3h2TGlEcURENDNCeDFCWm1xY0djM201NStrcjhhMU00TTNtNHlwcW5X?=
 =?utf-8?B?K3hvdU9aRFdjNTRBcGM3alc4aXpHSlFvVUtlMUM2d3ZocThQdDRoM1FSdlkx?=
 =?utf-8?B?ZU1naVRsSG95STd0VCtpV2FOblFwZGVuS0tzYWYyaUljUG5jU3ZGSmpzUGVN?=
 =?utf-8?B?eEE5VERTaTNPekxGb3Z6NTNRdXUweUptUE5jSVRFM2h3cW45V3lzbGN0TmpW?=
 =?utf-8?Q?xb+A1IPIM4vJuO1rak=3D?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(376014)(366016);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?a2U2czcrUGdrM2FMbGNVNzhoVUxkMEZWNjFLSkVFVkV1cFRxM2tCVGRsYnI5?=
 =?utf-8?B?T0hjRlRpUysyRVNTNE1QeVVSZWp5T2ZaczBlQ2VCV0lva05qdVgyVWU3bnpx?=
 =?utf-8?B?SFBoVmtlY1Z6YWJDaCs5ZEphUi9tV1RNenRIbE9ITC9tQVNSSDMwaXU5UWtU?=
 =?utf-8?B?NnNnVE9FK1E1TjdBMkpIQlQ1QlZ0UysvWGlKY21RWWNnZWk3NDIrVmkxTHZT?=
 =?utf-8?B?UGZDcEdFR1ExMksraWd3YXpEWS8vWmdJcHQ4WU9HaFZaODRLellWZ0pXK2U5?=
 =?utf-8?B?Y0RXOVJpSDUxeE96eXR5aWREeG1MVFVxMk4ydmdmUGZlN3NYaE1jRVFHWkNY?=
 =?utf-8?B?R2s4K3RmYlZldWo5MW8xOExYUTIyaWxudkFCNkE5THJVTHdPQnNxdkZSd3da?=
 =?utf-8?B?dVpWcjNuVGlqUmdTZ1dWUXBTSUdyY2RnM1ZQY2N5RjNXVnN5VTJab1MweFJp?=
 =?utf-8?B?dlNUSFd1MXVSWmkrbVpMMTY2NnJmOElQNWU4L3I2blhKcEVqTmNCVFdUM1RZ?=
 =?utf-8?B?UEtGNEw2WHJKbWF3YnNWbDcyUndFa2hKTEI4SUV4TWEweVBXUWFRMkd4RUM5?=
 =?utf-8?B?RXJvTEhKUWp2eXI4ZndhSndzN1JiWnV6NW1YU0wrMitGN0FEYURUUlkrNHJt?=
 =?utf-8?B?a1NGbVNNbEJNWHE1elJZSFZRNzNlK3d5R3VXOTZ0cTRjMUJQaWt3Q0Mwa0g2?=
 =?utf-8?B?SndVcjEydzdXV0J6V1hTeHg3N0wxdzBMRFlPbHJDUUx6UERQVVlzYnlhOURI?=
 =?utf-8?B?YmVIbVAvcFQ1WDYwSGM3K0s1TVA4a21xQ1hRNkZIelJuMDB1dUVhZXc4N1l1?=
 =?utf-8?B?NFlzNXRWU01TRXJJRG96WjNvTnUrY3dPWm9YKy9iT0I2eERIWmlpRGNzV1Vs?=
 =?utf-8?B?NzMyWEpNVXhJUUxZcUZmRUhDamRidktsLzRaR2UrcFBDbFYwN1NXZGNKYzEw?=
 =?utf-8?B?bE9EaExZRGxxMzZ6SHlJUFRtMFhsWGNQbWhMQzZVSEVQdGVvRjJjMnkxVWF3?=
 =?utf-8?B?aTNaWVdJWWhYMFpSdWVqN3ZxNWYvQjZIZ3pvbWIzcHYvNDVYazdZWmpURU0v?=
 =?utf-8?B?Q3Z6a3N5ZzhmTG0wdGJRMGdPZkxwRkJ0dG0wL1ZwcC9wQmNVdlRxRnhGbXN1?=
 =?utf-8?B?MkFnQXZibEx0WFB6c1JyUFliZWYvVExTTW82Y1Z1UFNRbllYek96Ri9ycmZZ?=
 =?utf-8?B?c0ZYL1pkem5LSm83Kzk0RlVXMlNSVnJTcUw4cnlYTVZuMlNrRXcvRzdCam41?=
 =?utf-8?B?ZlpTSkFtbGt6dERvZ1owU1FaY0ZMdFNJYnVJMEdJMmQwZTliVE05N3BLRmUr?=
 =?utf-8?B?Ky9sYUpmcFdOMjUrL0VpSm5LN0RObW8weXlMYjZsY0tUZkxWVjJZb1VDU0do?=
 =?utf-8?B?ZDMzTnl0ZTViSnVPdENBV3hNazhwWG90RGhzcEVKVStuNk5wQ1REK3h3R2t2?=
 =?utf-8?B?enZIMm16MEpScjhDSnpJb1E5ZElSVTllS0lIV0J0N3lhVDlWME4rY2d6azRh?=
 =?utf-8?B?YUVtYko5Yk1BWjJ1dDVTaFVWU1RWZ2FISXIxdjNRZFRRZ0VDN2RVSWYzbkk0?=
 =?utf-8?B?VlhZcmpuY3lrNndkK29xcUU5Y0piUnJsNzk5NGkwN1RvRTI5WUxaWXlJbnhq?=
 =?utf-8?B?SGxqZHQrc3IyTWsva3ROOGRXU3dzLzZMMWlGS1pZNDZWWkRUc2tPUUdBUlQw?=
 =?utf-8?B?UWZ4eU9lN3RDa2xWZnRmTE05RURzaXNQYzJqMFJHOCtCa20zMm5MZkYvNy8w?=
 =?utf-8?B?NlVhN1lKdDlHNnBxM3lBamI5eDR2bndNU3ZjUlpQN0hNeHhlb3BGMFloSlgv?=
 =?utf-8?B?Mkg4SSt0NEMwTjc3QTNjWGplUkFOdXhKRU15NGNDd2Jna011NEdPZGJudExk?=
 =?utf-8?B?S1djNDhHWUxKNmFrbDRIRmVxR0R1UU5vd1F5WS9CT1VUVkNUakU3UFNNOXB5?=
 =?utf-8?B?aWo1eFFQN2hQamppZXNMUUNLMlh4VCtNNDl3UnEyNitXKy9Jckt2QzRUeUpC?=
 =?utf-8?B?bXl3bUpUR21nN2VHN3FlZUgyby9RS0lKMXBBQ0JtaFBSbHV3c0I4T01uMzlv?=
 =?utf-8?B?UEJyWGp1Q3djcGVPRWhkcmhtQy9lLzdjZDhwZEQ1R00wbXVodnFNTmkzeUlz?=
 =?utf-8?B?SXV4Ti9zRDYrQTBxS0owdHRCTWR0cEN3eHEvd0tPTWs5ZE9WU0VOZnNXeHBH?=
 =?utf-8?B?Rmc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	vb3J3/AnqNUAWJQfY5jYWYUL/po35wgdwzJ8c4GZsE9t3T/w/34wq8ZPTmykLIwtH9sGI9LKimnA2858A1+r0HdIbDrs4fOSpYfZck+AebRXmyy0A9UXQqE+Wisf0NmuTBO+4ZK/JZVB3wMqtChv2LwyvQNThSwz/1/HO6Op/BiJbLtV3vakY5AlAdbmx7LtGFCRp5a1xBxQ8G0J0lwUBuxwRscKvhVgNoX01W1oSf5eFGNGWHAPV3OoqiD9x/A5/k1oM5pmIxpdn/fDtYi/BLcJNE+Nx1xsNPeRM6dAikLxMhzoXPxZA6nlUJPZmSWR4xi9NVZJ4DexTDmoQ+5U96eXIyYIRhYNYhSoP7daOXFDHELiJyVAiFSuolJTAkgIHsye09Z5VeM+VqE+hUNzoObwXNlBCNe9fLIh2fChjY4BaUhOtfUUsEyhaxUmP/LT/C4dM1METBV/VlxFKXlEZwPyD0Ewuyh3ob4duC3JQxSfdLhreEVA9HLcHLq0Mktxr+z6k5tE6rEGHf9UdVG7GofmXNMZvYD93/30F1gxDZC1AOaTgeJND53FuNbd8nltNIZni7CZGhoLKkPqC1PEyFP6AU2IRpA+8Kr7ADHLCbw=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 37a6d05e-c613-41e2-acfa-08dcd8bf1ede
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 19 Sep 2024 15:24:15.3175
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: xq1w5yh+mIjS9+rqHzv7ZmkBWyWeF5UMHwb4RdsZI7hlnraaDQwZr34CQG+smXpJxIwq06U9H2Z6oNsGj1HgPITk7oEnTh5See8xIFMGwYE=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MW6PR10MB7640
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1051,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-19_12,2024-09-19_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 spamscore=0 bulkscore=0 adultscore=0
 suspectscore=0 mlxlogscore=999 phishscore=0 malwarescore=0 mlxscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2408220000
 definitions=main-2409190102
X-Proofpoint-GUID: gWAbsv61LbO8UZLC6Th0TvNVHcyK5QJx
X-Proofpoint-ORIG-GUID: gWAbsv61LbO8UZLC6Th0TvNVHcyK5QJx

And for anybody who didn't join, we had this guide as a way to get
started with drgn, using a locally built kernel in virtme-ng:

https://gist.github.com/brenns10/2064f16ea9b18235b47038d78775410d

Stephen Brennan <stephen.s.brennan@oracle.com> writes:
> Hi everyone,
>
> Thank you for joining the BoF, by all indication it was quite
> successful, despite my apparent attempts at sabotage by changing the
> room last minute. I took notes as we went (though couldn't cover
> everything), which I've included below.
>
> Thanks,
> Stephen
>
> ---
>
> =E2=80=8B* Drgn within IPython notebooks!  Useful to help people follow &=
 understand debugging sessions. -Shung-Hsi Yu
>
> * What is the criteria for "contrib/" vs "helpers/"? - Sweet Tea Dorminy.
>   -> Unit test cases!
>   -> Converting contrib/ to helpers/ is a valid and good on-ramp to drgn =
development.
>   -> Though, not all contrib scripts are expected to make it in.
>   -> There is also a "tools/" directory which is actually tested & suppor=
ted.
>
> * Is there a "rosetta stone" comparison between operations in drgn and cr=
ash?
>   -> Not currently!
>   -> I (Stephen) have some which I could move out of an internal wiki int=
o Drgn's wiki.
>
> * Drgn "commands" vs Crash commands. Drgn does not yet have a command str=
ucture, it's been discussed.
>
> * What is the status of drgn without debuginfo? https://github.com/osando=
v/drgn/issues/176
>   -> Symbol tables implemented, kallsyms in review.
>   -> Minimal BTF implementation, has some issues.
>   -> CTF is used in production at Oracle.
>
> * What is the "backend" of drgn? How could you glue kgdb into Drgn?
>   -> The memory reader interface is the main way.
>   -> In addition to implementing memory readers, you'd need a way to comm=
unicate the "vmcoreinfo" to drgn. This provides info such as kernel version=
 and kaslr offset.
>   -> We have a way to provide vmcoreinfo manually.
>   -> we're discussing gdbstub options: https://github.com/osandov/drgn/wi=
ki/gdbstub-protocol-proposal:-linux.vmcoreinfo-query-packet
>
> * What's the minimum I need to do with root in drgn?
>   -> just opening /proc/kcore
>
> * Writing to kernel memory! New feature as of yesterday!
>   -> See https://blog.osandov.com/2024/09/17/calling-linux-kernel-functio=
ns-from-userspace.html
>
> Please join our Kernel Debuggers Matrix:
>     https://matrix.to/#/#linux-debuggers:matrix.org
> Please join our Kernel Debuggers Mailing List:
>     linux-debuggers@vger.kernel.org
