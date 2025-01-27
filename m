Received: from mx0b-00069f02.pphosted.com (mx0b-00069f02.pphosted.com [205.220.177.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DBB0617ADF8
	for <linux-debuggers@vger.kernel.org>; Mon, 27 Jan 2025 18:43:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.177.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738003419; cv=fail; b=e45/873bVX9HQz9pDohEKYoXxXChIvrpSImI0/YM9cu5xGOlTsXnaz7WRy1Oog2MULK+YrBqtGpD0wA/XrjYU9BwFP4gGNg/+4lP+decWi9Mg53DIQ2eNdZ1ADdGtXIrIMP5u4NdF8/f7E2VBipUrS7Uqu7sir6HthvkYm6yTJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738003419; c=relaxed/simple;
	bh=mCNOVhc2uU8PgMYjl7cj0sKIby91nPNcrUBYadYK6nI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 Content-Type:MIME-Version; b=qTA77Imn3PC2eNowUl1BG2hJPAj0N5n+w/FCw7ov3/koh2OcIZ/3NBK6qBDAbzkZyDsVXEChC/t7yklWwamDJM+I4xDgy+G3YaN1GW1yNlEP1M07ihUwLNW14H6MlRY4ZiseiJul0Sfgaur76L4xf6agJAqOsbpVJ2fccBQMTxE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=A/H35sy2; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=UwIVA+2j; arc=fail smtp.client-ip=205.220.177.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="A/H35sy2";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="UwIVA+2j"
Received: from pps.filterd (m0246631.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 50RIaneB022350;
	Mon, 27 Jan 2025 18:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=6lgQGsMnarsmwDNBv+aYrwXd2BBZzP4ZAWerX8Edh5Y=; b=
	A/H35sy2GyAPFM4WuJiHXQLRiGEqUFqXtX4WHR7Ev1bzMFv7SrJe3X1qbzrXY9nS
	qEcoFxuOGC16dvcJUnZvjHy1fcbUfon9R3ZeQE7XaOyjSykFb6QHoWTWa1GrRZGv
	607SohEhXLXe3MA//sGoAmo+k9+JYDjipE4WBE3Bx+nQFY9GZvioYqm2baNvV6kO
	pqtq+UtJ40Tp+GAWNNFaY3/+FlHrEuegC+faXvAzX85P3p7Oohms1ncUjxmUxQ8V
	CGaEe02P4j1j1H4C3hqHzyZ1jSZlVUCoQpLKRoIL8KfLoUpMJ2MRCjC9VjGXszpp
	Trg9/m2oUSKVImk0j3aD6Q==
Received: from iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (iadpaimrmta01.appoci.oracle.com [130.35.100.223])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 44efju80f0-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 18:43:22 +0000 (GMT)
Received: from pps.filterd (iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com [127.0.0.1])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 50RI7Utj023974;
	Mon, 27 Jan 2025 18:43:21 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com (mail-bn7nam10lp2048.outbound.protection.outlook.com [104.47.70.48])
	by iadpaimrmta01.imrmtpd1.prodappiadaev1.oraclevcn.com (PPS) with ESMTPS id 44cpd7bw3b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Mon, 27 Jan 2025 18:43:21 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=WE7btDFUbGCA+vyN2YV3nn32eYsz1dijKBRZAH96ZRiXi65D1feSzbcipdIV6cw8oZ9DG1JhwdWskKizGSQkYdoKTc4ygCyp01fKT37PU0SetFx0De77tIiAiHzPTrSVMPnd0NAqeX6LZLOmJbsd3Fvk11LeKiNT17igW6RF2TKMAez2G22kk5Jwgfy6CXsTDhLP9vbedElI7PgPkNf5fzppIFk+IGifqyUfMZFqwHXxHVC3m8SKzkcpnY1Bx8I+s8lld/PoyZyJlD1rTY2wsziDBRBjjUHd6Xb4taY16uL7BnNN85H+wJ+sbLs8LuRM0gi1dOoYycZ5OIv2uKtjSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=6lgQGsMnarsmwDNBv+aYrwXd2BBZzP4ZAWerX8Edh5Y=;
 b=tfUxHUGzFm5sVDv2+zn+hUnip5xAQ6riL/sCmyHv7ytRySaPHWmRlBDABWohrw4oUndQQTDacE89vJoa04zmK0gD2P1NltfBmTe+ln6/ngnlrF4lK/wl72Lfxq9dgMu6t1g5lmgxfz4VJx0+eZYH6e6VBCPI1XSHPMiGlweVtOtMPVdFvmgAO8cV+SW38kY4ZU9aW6BFSHJDeosyKv73alvZXyH1NQve6rAk5amMc/zVLQ2jL69iUgfVSLJS0SBheBCA1IB63aF3sodoul4ZAkpCKurs3cngev+9cd5UbYnwseF2xRJGuiRrnwFi8xsRYRPlxO685DWUXtBKqT/TEw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=6lgQGsMnarsmwDNBv+aYrwXd2BBZzP4ZAWerX8Edh5Y=;
 b=UwIVA+2jMeNEkr/PnZ5292MyP44Un3IBBft23qeQnI22Qd+uHkDwVmAqxg2ThrUL+LZ+Ni4hEHcNh0Cw7wemozUXevw/LquSY6ux3YJhPyLowGJC7vQ3zoTP4ADDICGzLaP3G36MfIdm3PtPC2yC3kM0EG/zxGs9O/Wqd2rt8y0=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by DM4PR10MB6110.namprd10.prod.outlook.com (2603:10b6:8:8b::11) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8377.22; Mon, 27 Jan
 2025 18:43:04 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%4]) with mapi id 15.20.8377.021; Mon, 27 Jan 2025
 18:43:04 +0000
From: Stephen Brennan <stephen.s.brennan@oracle.com>
To: Omar Sandoval <osandov@osandov.com>,
        Thomas =?utf-8?Q?Wei=C3=9Fschuh?=
 <thomas@t-8ch.de>
Cc: gdb@sourceware.org, linux-debuggers@vger.kernel.org,
        Amal Raj T
 <tjarlama@gmail.com>
Subject: Re: GDB Remote Protocol Extension - Linux VMCOREINFO - Request for
 Feedback
In-Reply-To: <Z5fMtZOoYaV6aXwf@telecaster>
References: <8734hmtfbr.fsf@oracle.com>
 <766010fa-49a5-4e86-a730-bf79bb73e928@t-8ch.de>
 <Z5fMtZOoYaV6aXwf@telecaster>
Date: Mon, 27 Jan 2025 10:42:59 -0800
Message-ID: <87y0ywgkss.fsf@oracle.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-ClientProxiedBy: LNXP265CA0090.GBRP265.PROD.OUTLOOK.COM
 (2603:10a6:600:76::30) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|DM4PR10MB6110:EE_
X-MS-Office365-Filtering-Correlation-Id: 7a71e924-be4a-4728-f82b-08dd3f026f34
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?ZDUwYjRuRDNYZFN0S2svS1p4L2s2VC80UkhYM2szSFUrME45OWIyTkxBUHF3?=
 =?utf-8?B?aldWamRqWXFyaU5BaXBieXptS2dKWHFRTHF5emhOMmNWNFYwWjZxL1l1Sjdj?=
 =?utf-8?B?ZnFSNlpvMG51RzFBREk2ZWNMRDlwZ1pZQjRSZkN6VXFibVkwOUVkQnRvUVhs?=
 =?utf-8?B?NWkwMnJtNit0TzRaNEVDTzBvV21hcGZFdzJMNXhXZEZ4VmR6Q0R5Qm9venRm?=
 =?utf-8?B?RXdDSVhwMTloczcwaWM1U1dmNFpucGxoYkJnMGFkU05nRUswdml6VzBDMWx6?=
 =?utf-8?B?SW5DRGlzcWxybGhUU1dXVjRPTHV0amRkbVAyRUxIYmoyKzNGN1I0aTVPQndM?=
 =?utf-8?B?NmJEbWV6Wkd2dnRKT1NYc3Y5Y1lKaGNoQ01TWTdsYi9hc1FaWERSSFA2bE0x?=
 =?utf-8?B?bDN4NE9CNXpXVG9vU3hDaCtBQngwNU5pTmx0OHRkeGdReFduVlRFSEN4M01D?=
 =?utf-8?B?MVFCNUFwU0hidTdvbFVOSFlMMkNBMUh2bnNBVW44Tkd3NGEyQjJyakdRSUxM?=
 =?utf-8?B?WUltVHVvVlhaaGhUOS9iUUlmSndzNG42L2lkeFVqNmFhVGJBZ3VsdWt4aWtU?=
 =?utf-8?B?dHRyVGxpZGM0MTRIUXNWK1BZSS94TTVSRWZFdjMxWjJIaTZsVm1QTEdxVjRN?=
 =?utf-8?B?NU1KV3VVTmR1TklpaVBKS05GQlhBVzRiRXpkZEEyRkNTTC9nNm9qR2VsWjVw?=
 =?utf-8?B?Y2xDOGk0T2U4REVIM1p1ZzdaaUoyRittYkwzNWVJeGd4ODdFSkt1aXZTUko0?=
 =?utf-8?B?d3FBNTFrdEt6OVVPTFBzd3lZYU4ydEZrUGt0S0lUdkt1dVVHSncyNHRvRXF2?=
 =?utf-8?B?OU50ZDRrZ0Z4Z0lCWFczRUJrRDJ3SXZwOHV5L3h2Z0t6UkJVOTVSUHA2a3hi?=
 =?utf-8?B?YXNRcm5DdTJmMWtjcjNEdS9aY1NlUTFtNjI1cFk0VW51V0Ivd0hKbWxXenBq?=
 =?utf-8?B?MEg0dWhHMW1kalRROE5ySlZxekJjZ1B0c2FwREgzSDBHM2ZsZzlySk56d3ow?=
 =?utf-8?B?eExiOTBaQTFDL1dYVkFoeEZ3QmM1QWVGVnZyT2RqTnRmaWkwY1NZTU1qK0Qv?=
 =?utf-8?B?UWpaSlFJc0IvUU5UTUN5VjU0V3lWVmV1NytRV05QM0hsZTlkdXVjckRKczhj?=
 =?utf-8?B?YWpYZTVOSytmUGloVTVna2twamUzT1ZlYUIyazFhRHowRWx1S3BUM3JKbU1Y?=
 =?utf-8?B?L0hVTlNWNjNvU0ZqNnQxMzQ0amNGNWNLaGlTYWJhZVU4T3cyeUk3NTlqenNM?=
 =?utf-8?B?UzA1eWVhMjgrazExMHdhdWJCTXM4Z0RZQ3l4ZTMwRXB6ejZ2dDlOTGtnckl5?=
 =?utf-8?B?STlBZW5VbVBOVXk1aElkRVlrQytmazZRZG91TGc2aG1IVEcwYWI4TmU3Rmdm?=
 =?utf-8?B?cS96U2tYVXJ6bmorYmMwaDExc0UycDRGVHcrQnFSUWhnYXpDa05vSXRDWmIw?=
 =?utf-8?B?MTJodTQ0eHpkZnpReWY4TTBHVzlVWjhVVy85NE5QcWFnb0Ezc04ycEpsVTN2?=
 =?utf-8?B?VUoyUG82cU1PUWhLZEp2YUdYcGRSVTVPMXNiclNXa0M3ZEErd3dtQ25KYXJW?=
 =?utf-8?B?SjBEbnJPalgrQlJTc3FFYUdvSUFwQ0Q0dS9NNjdETDlPV1FFc1k1VVpIWmZ4?=
 =?utf-8?B?aUFHa3RuazhYSXhCdGZ2YXdlb25uZXd6NzN3U3dTeUNCUlRZVFZqQXFIeUJN?=
 =?utf-8?B?MUhud0xCR2JueWlOZm1YQ3RVWnVIWDFTVkIvd3BsOWdnckt5RUlvQXNQZFk2?=
 =?utf-8?B?aFJlRkdjVUdoeEhmamsrVWJmOTFxM29oaVFhUGlmRzFqaG1oZmREb0tRanVw?=
 =?utf-8?B?N01ja29BbnRtbHdMVEtDQT09?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?SlpIRHJLenl4MncxbUIxREgzZEdCZ1ZFWnlkWmgvYngzb25iRGNvRXFFSnJl?=
 =?utf-8?B?QWcrUEkzK0h1UVBDU3huOUlzSUpUNnJtYUU1UFpMRVF5NnlZN3NqNm5Na00y?=
 =?utf-8?B?SUR3NVhHOW9uVVR5WTlJS2NybGRvaEE5dHNtUlNYV3BaQ0xFOEZTYStCR3dl?=
 =?utf-8?B?c1hDdnM2WUozbUtpYUsrV29oL1dIUllxYWxEd1RZcnNoMUlNWlFNbm5KNFA3?=
 =?utf-8?B?aFFFbHQ0SFV6alkza0pxRXJQaFU2KzRzTm5ta2RDL0thRkwvZVNaTkt2NktR?=
 =?utf-8?B?d0ZGNm10MnhDNU16LzErMXZpWkd1RHpDTnFQR2Y2ejVObC9KL3ptUTZ6S3Yw?=
 =?utf-8?B?bUM0ZloyeVhSci9GMVVhRzlpaHcrek82OXFJQksyY25MVlU0WDlJNS9Sem15?=
 =?utf-8?B?blQ0b2VBVzM5anE4TXJJcll4SmdmZDJ0SGpNWHZhNm13OVRhSmxlS1NmS2lU?=
 =?utf-8?B?bk1pb3hSM0dMODVtM3llWS9zZ1FvT1dEWE5qcU5pcVNtd3pZTW5XTFNlV25T?=
 =?utf-8?B?K3YycTdtckRTSi92OVpKNTRCWHVQeG5UWWpTZDJXbDNONy80dU5nUE9qNWxz?=
 =?utf-8?B?cHcrQTQxa3lmdW5xTk9sU3FhZWNFUElGeUFObTZTZ3lueTR3Y3oxS2pUOTZD?=
 =?utf-8?B?bDNoM0FzMlpjQ2RET2p0UmF2UzFGa292b0s3WU04TkFqWE11bWNXRjIwcTZ2?=
 =?utf-8?B?K3ZnVVp4ajZzVUc2V3l3TzBnTCtaMGVGWHFLU3FVb1RYZU8zN2FyL21QU2NK?=
 =?utf-8?B?TG1QQjZFc0hkN2lDaHIzZy9RNE41Zm11VXZFNGlzM3p2ZkRTSFJXcUZVT2Ji?=
 =?utf-8?B?dmVwNVduaTAwcGZSSkQrLzh3bUk3a2VUZEcrZXVOVWc4WkVEd0JlSWZCaGNW?=
 =?utf-8?B?aWFkM0RxWnQyK1ZrYWhhb2F3TGU1MzlZb0xzdXkyV2EyYmpXTm1IdlE3OVRS?=
 =?utf-8?B?VlUzUEJ0bVRIZHdGUDAweEt5Qzg0citCams5Y1JnUFNWaEhmblFQcVhPT1BN?=
 =?utf-8?B?aFlkbzF4ZTVNS1lFLzI5TTFObk4yMnFlcTVCejM1Y3hZZDZCc1VhbWp0U1Ex?=
 =?utf-8?B?YzByRFhnSmxJM1loVER3Ymw4V2pETVA1aWRBOWdpYi9kdHVia0RBRU1PVFox?=
 =?utf-8?B?anFhb09YVUVuRURmZHE2ZjJVYjBvN2x0TklBN0RTWTQyRjNTSndkQkZXQU1y?=
 =?utf-8?B?N0E1cGdzM3hpd2N4QVhSa2tsdFNEYlU0WUFFRTNkNDZ4d0N3RzVSR3h2NlR0?=
 =?utf-8?B?ai93NElmY3ArQ2NYNSttVlJWaURMVGRmR2hqanVhU3RYRFlTMkVwNnhjOTlY?=
 =?utf-8?B?ZFpKV2N0cXZDMU9mV05razB1L2VEUWsrUkdueVYvREFFaU41dGpkK2FBUGp0?=
 =?utf-8?B?MGRkY1QzMWNtQTBpVmNPaS9JS2lOM1gvZ3NHOTQ0VHNYMkdmMVpYL29lVzRp?=
 =?utf-8?B?SUNCUFRhR3VHTFJYelhqWUx4M0JPZHJpaGljZDlXS2RVc0xiLzNxY1A1MUto?=
 =?utf-8?B?VXR6N2M2NmVqcjhFak1pLzFtVFMyRzJEQy9Qdjh6bmJXNy9vOGVxOVNKbTJQ?=
 =?utf-8?B?a1hoUlMvZWt3SzJNOTNtaG9Vb2wvaDVPVlgyaTJzYTRaVnhaQnhtMFZiNWFO?=
 =?utf-8?B?bXU0UFRVWmRWQWVJNTRpNWtqQWN5a1BlMzlnWUJFNmtnak5kbDhjR2V0dUhF?=
 =?utf-8?B?YmhMdjZVZERia2dPL0NaYVl3c2RMVXQ0eXNRaGpteTByMnJ3TFZGd0NPRjdm?=
 =?utf-8?B?MFlRbXJUQTQ2bThSSVRvR0hOcHl1SFhmTHlCODNydzNKSnlmalNrRHh0Ti9k?=
 =?utf-8?B?dDJidXltZFlISDVjS1VyaWIzd0JZQVhOZFZmNjQyK0NkWXQxVVJqd08wblFP?=
 =?utf-8?B?SXUzdTBRSVl2UHNYNVlsNWp5MGtublNJZm5HMW5oQnVSeWdDWVJjelFEdkNY?=
 =?utf-8?B?MUtnL1Z4eE15NFRJdDduUm5hVGhKa2NVYitPc1pFcm0reURoNDQwcDhmL3Rx?=
 =?utf-8?B?YmhpQjY0M2Q1dnVPTW1TNFhUQmZUTXllWkM4TlVnbDdhcG1xUW9PaGJMMDVO?=
 =?utf-8?B?WXpkT1NnVm5XTm0xaTZVbzA4Y1VDNGRrSEVvKzJudXdGMngrTmtMSkYvMnRR?=
 =?utf-8?B?RnMxa3VpZmk3VENGSVFRWXhZVFRIbmRHRWRPanVZSHFlZkV1QWFxajJoMW5T?=
 =?utf-8?B?QWc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	/Y0DxRL5WIRVqYDmUHA2g+9Fqh9qAG1fa3uSH5zv68Dw4eCZRxV/LGBhSa51ro6wswiJGXjp6sZTyMah0zJy+FGPrIS2/xkBy4A7lCZm1QH9Ick6Gi+nW2S10RbqZ8HVWIf5BgN1jvdl84+y50VDNfRbThpfRr6j6ffr43Nyk1Rv0jvqq8IHwJdRauEzjk6enB5PqoHXQ8mOhuJdWW5qHsw13nlCNksLcuc6YNbTwl0iiXmYWDe1zxFcS/ilMjYBmeowQCl9ZXOYmBysFToTGXcZNoOGOqzfwvlIy7csRA5y8nBUrYurK4Ob+8g1dtqLEOPuibtfS8q/Ukw9gujisGZjwY4GtHpQR3XWwO9no4oEaOFQENuPNhMhLhhq8ggrbN1yOnodHQ1pTRNVgo9MQP6QamZ2jrS+KT41+iBNrLWY0Y0i6UoOkv9xiarBIHMIOIk9sG8DdyzNsN6Evjq0S7tFDqIzmYNSaFCWrcCc1s/Dmt/rm/ZWmfw/2IowSnrwXP3GlN23Qnp7ocogUz8tp9ahJFIGH79jzStmrzy99mKqbxgJrlQ8PBFLwY/3yuB9pKV/jDY28rPJvKmM1HRikcVfjW9NL2oIl0SLA2PCLvQ=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 7a71e924-be4a-4728-f82b-08dd3f026f34
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 27 Jan 2025 18:43:04.6519
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: eXRDAnA6PDLmkWHdAxgR0UX6MU3GRC6ugurlfO/eeAofLxy5aEYnq32HSK0iBXrYbijEcvEQbGFgjYsq4EBPGGCpnWHMCdqPBOozSEwUyDU=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: DM4PR10MB6110
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-01-27_09,2025-01-27_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0 suspectscore=0
 mlxlogscore=999 bulkscore=0 phishscore=0 mlxscore=0 spamscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2411120000 definitions=main-2501270148
X-Proofpoint-GUID: jg8NNpvcHElOwtbPC5GJ96HUE6ttIf-N
X-Proofpoint-ORIG-GUID: jg8NNpvcHElOwtbPC5GJ96HUE6ttIf-N

Omar Sandoval <osandov@osandov.com> writes:
> On Sun, Jan 26, 2025 at 07:07:47PM +0100, Thomas Wei=C3=9Fschuh wrote:
>> Hi Stephen,
>> On 2025-01-13 16:22:00-0800, Stephen Brennan wrote:
>> > I contribute to the drgn debugger [1], and work on debugging the Linux
>> > kernel a fair bit. Drgn is particularly well-suited to the Linux kerne=
l
>> > and contains a lot of support for it. It currently supports attaching =
to
>> > live targets via Linux's /proc/kcore, and core dumps. We are looking
>> > into supporting remote targets via GDB's remote protocol.
>> >=20
>> > One piece of information that is very useful when debugging the Linux
>> > kernel is the VMCOREINFO note[2]. This is a free-form piece of text
>> > data, typically around 3k bytes, which contains information that
>> > debuggers would find useful in interpreting a Linux kernel memory imag=
e.
>> > In particular, it contains the KASLR offset, the build ID of the kerne=
l,
>> > and the OS release. With this information, a debugger could attach to
>> > a live GDB stub (e.g. kgdb, or QEMU) without needing to specify
>> > debuginfo file names or memory KASLR memory offsets.
>> >=20
>> > To that end, we hope to extend the GDB remote protocol with a facility
>> > that would allow the debugger to request this information. We've writt=
en
>> > up an idea for this proposal at [3]. The summary is:
>> >=20
>> >   'q linux.vmcoreinfo'
>> >      Retrieves the Linux vmcoreinfo data.
>> >      Reply:
>> >      'Q [DATA]' data is encoded as described in the Binary Data doc [4=
]
>> >      'E.<text>' with an informative message if the data is not availab=
le
>> >=20
>> > However, with the candidate kgdb implementation taking shape [5], we'r=
e
>> > becoming concerned regarding this design. It seems that there is an
>> > implicit maximum packet size which is not described in the protocol
>> > documentation. Many stubs have small(ish) shared output buffers. It
>> > seems to me that data which would be 3k bytes before escaping is too
>> > large. We've noticed that there is a 'qXfer' query packet which allows
>> > specifying an offset and a number of bytes. Maybe it would be better f=
or
>> > us to add a new 'special data area' for the 'qXfer' message, and reuse
>> > that command?
>>=20
>> Do you need to transfer the full vmcoreinfo data?
>> Wouldn't it be sufficient to only include the address/size of the
>> vmcoreinfo note in memory and the debugger can read the data from there
>> with regular memory access commands?
>> That information is enough for QEMUs vmcoreinfo device.
>> It would simplify the design and implementation(s) significantly.

I do agree that this would simplify the protocol design, and it's a good
idea I hadn't considered. Thank you!

> Oh, that's a good idea. I guess the downside is an extra command round
> trip.
>
> QEMU and KGDB also only implement the `m` command for reading
> hex-encoded memory. We'd probably want to implement the `x` command for
> both since it doesn't (usually) double the transfer size.
>
> One more caveat is that KGDB doesn't check the length passed to the `m`
> command and will happily clobber memory... QEMU's gdbstub does seem to
> check, and also advertises its packet size, so we probably want that in
> KGDB, too.
>
> Stephen, what do you think?

One of our core constraints is that the vmcoreinfo is quite a bit of
text data, around 3k bytes right now. Doubling that to 6k would be a
real problem, so it would be really helpful to keep this to using the
'x' encoding. However, I think there's a couple good reasons that
neither QEMU nor KGDB support the 'x' packet:

1. You cannot know the required buffer size easily, so you cannot know
whether you will be able to satisfy an 'x' request in your static buffer
size. This is most relevant to kgdb. The 'x' packet documentation says:

  The reply may contain fewer addressable memory units than requested if
  the server was reading from a trace frame memory and was able to read
  only part of the region of memory.=20

I'm not certain what trace frame memory is, but the vmcoreinfo is not
that. I'm not confident whether this means the protocol allows fewer
bytes to be returned for other cases? Certainly, the 'qXfer' packets
explicitly allow for fewer bytes to be returned, as the documentation
states:

  It is possible for data to have fewer bytes than the length in the
  request.=20

2. The 'x' encoding permits NUL bytes to be transmitted in a packet.
Thus, adding support to an existing stub has a hidden pitfall that you
need to ensure you can transmit NUL bytes successfully. You could
circumvent the problem by escaping them, but since NUL bytes are
typically quite common, that eliminates the benefit of the binary
encoding. (You could do run-length encoding, but I'm not actually sure
how common it is to do run-length encoding for escaped characters -- is
it tested anywhere? Certainly, neither kgdb nor QEMU implement
run-length encoding today).

Currently, kgdb implicitly assumes that the buffer is NUL-terminated,
and it would be quite a bit of work for it to instead track the number
of bytes in the response instead of NUL-termination. It seems that QEMU
is in a better state for that: it uses a GString for the response, and
according to the docs[1], it can hold arbitrary binary data.

[1]: https://docs.gtk.org/glib/struct.String.html

So while I think the cleanest design would be the one that simply
transmits the address of the vmcoreinfo note, the most practical one,
with the protocol as it is today, seems to be implementing the 'qXfer'
packet described in the other branch of this thread. For that, #1 is not
an issue (because we can just return fewer bytes than requested), and #2
is not an issue because vmcoreinfo is text data (which can't be
guaranteed for the general 'x' packet implementation).

Thanks,
Stephen
