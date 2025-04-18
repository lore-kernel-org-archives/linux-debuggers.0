Received: from mx0a-00069f02.pphosted.com (mx0a-00069f02.pphosted.com [205.220.165.32])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00074267B61
	for <linux-debuggers@vger.kernel.org>; Fri, 18 Apr 2025 03:11:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=205.220.165.32
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744945908; cv=fail; b=rQRcg1WJ++P0UNIgS1T6jNgmQUNCfc/kbJYtSbnYjiztxKk4zZsMu3OgmGsiRZh6sqy8CagICO3c2zkciH8e9a93+VPOcMp+HDgnY00nUnLfDwSNToo53A6KJR32aI/1+9U12nY811fpmqei+pG4CQOjEa5hPGN+mR/wdhTMcf4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744945908; c=relaxed/simple;
	bh=InJU0JoPfIYEKvUh037v7FPEBEX6ESLS7XmLXJVHWIY=;
	h=Message-ID:Date:Subject:To:Cc:References:From:In-Reply-To:
	 Content-Type:MIME-Version; b=I+nVJzLMVehn5AZKmwJhdqZY51qYo8EV5JFw0M6sh0cJWJMswZlCyzbXizFF2xRMANv1TTlaiUMmXyNr4aAaMIylwzJcywh4mTlqtaxher7+X6Uy6BmH/Vl4kR3umg+DP4F0yoQip4QtyKTH+JF2qxKf/a0hS6kuOMOnTXB1O+I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com; spf=pass smtp.mailfrom=oracle.com; dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b=ATSgaPnI; dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b=cTlWar+T; arc=fail smtp.client-ip=205.220.165.32
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oracle.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oracle.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=oracle.com header.i=@oracle.com header.b="ATSgaPnI";
	dkim=pass (1024-bit key) header.d=oracle.onmicrosoft.com header.i=@oracle.onmicrosoft.com header.b="cTlWar+T"
Received: from pps.filterd (m0333521.ppops.net [127.0.0.1])
	by mx0b-00069f02.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53HJsWxQ013375;
	Fri, 18 Apr 2025 03:11:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=
	corp-2023-11-20; bh=L0iHNqGErtFaRaOpxUYT4jZN0exypESgySls34KcXEc=; b=
	ATSgaPnIFecrN/bJIdrJEpTanF0g6/36XlwA9je1DHr9DoHqLY+8uQH3fDbRQDyk
	dMMsL0Odf7/ONfU3v2mBZYHVNvrUkB609jhaF+JFe21A80dCPSKnwvLQpxUesd+E
	UZ6cNU0i3ekU5Sgke7uxk+TzXPsGgbGVVf0xhE9F4yMcLBsjlUEad3nAMC+GiZX5
	1PixHu5S76ctPJKyqlx0vSj3tFj3fqX1TWGFiYp+JrbrDsu8NryztqjRf9h6AVeW
	SfRfr8nxOJMAT+sh4SgHf8Kq6vjSvy/BtGGAJqO+APSpHd1WSENZ9IpCnZ1bVMYc
	cuUkkjr7+w1lP4Ij79/Igw==
Received: from phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (phxpaimrmta02.appoci.oracle.com [147.154.114.232])
	by mx0b-00069f02.pphosted.com (PPS) with ESMTPS id 4619447f2a-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 03:11:42 +0000 (GMT)
Received: from pps.filterd (phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com [127.0.0.1])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (8.18.1.2/8.18.1.2) with ESMTP id 53I1USLm005917;
	Fri, 18 Apr 2025 03:11:32 GMT
Received: from ch5pr02cu005.outbound.protection.outlook.com (mail-northcentralusazlp17012050.outbound.protection.outlook.com [40.93.20.50])
	by phxpaimrmta02.imrmtpd1.prodappphxaev1.oraclevcn.com (PPS) with ESMTPS id 460d60b4yr-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 18 Apr 2025 03:11:32 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=t/zKnEB65SJuZHs6Tb7xrWNhC+BwDi+/hwVRv3/nYsj+JDIH3VXZ83eZ+bKCoXwOL5wOA+n/udcdw7BZg0h7arQPXwoY9cMM88xLBC4sTUHbFvZFU/51qK16Z6dQFBvcWieff+g5AtHa7A0tNdIDdTxym9A9mk3hNfe2ri/UiqX0HGJkbKSWYIONFT30kVuj1Sb7NPHEmtdCrlqIc6SdYasN7Lx6BeweRQ2hROJ87PGEmJaG94RvZtGuSzLQcjK5zCCgb5k6gYy3jIJKuvBVCi7n93A7Yft/N+KGRx+nocw3HqgyviODYlt03eu88m8xbkDdvq0QQ27sw0wUXRE7Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=L0iHNqGErtFaRaOpxUYT4jZN0exypESgySls34KcXEc=;
 b=XOf6hpAqThYFppINrzwLGDsQji4d/vZLF4aoBtav1cP9YUpS7ZO/5+VNT934uOGpZr6CcOebyc3rkAAflmqK0zrn4FLjQ15DSxwB1DZhHEic9Zh1AaX3dYeVQ+kQz7TdQ0sWzBKTrLDEdqpdEBqLyXPBe/bPezzmH8A4jVIUs+XwQ4BoljxP5juJcz03SJmqO+qv5i39/WnvklzHnAvF5foNKfWi8nI5kJKsPj0JdXdtW2nm7e/k99xEFombq3ROh5FBT62G4r7ZnNy6IbPT93PodqPKV+/ORDGenzT/GutPnVFBmzPpan+j7RSGAGrz0CcgXJuwFG5nNGmnBdlorw==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=L0iHNqGErtFaRaOpxUYT4jZN0exypESgySls34KcXEc=;
 b=cTlWar+TQCOvLS4Ug/4BBcIOdJzBPZLeemsZPnidTJU2X4PhIwa75ZDNDP+ma8edAweZEryD/lVuji9JgtN6deRon06c90c1p8kw8tv/qVGtXXOxfABWebi6IEoMhFT/+T4Ws28BD4clO1R6rjOo53PqDKus+itn4AqBSHklme8=
Received: from PH8PR10MB6597.namprd10.prod.outlook.com (2603:10b6:510:226::20)
 by SA1PR10MB7700.namprd10.prod.outlook.com (2603:10b6:806:38f::22) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.8655.22; Fri, 18 Apr
 2025 03:11:30 +0000
Received: from PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca]) by PH8PR10MB6597.namprd10.prod.outlook.com
 ([fe80::6874:4af6:bf0a:6ca%7]) with mapi id 15.20.8632.030; Fri, 18 Apr 2025
 03:11:30 +0000
Message-ID: <c90d660f-6222-4bca-ba61-000dcd6f7155@oracle.com>
Date: Thu, 17 Apr 2025 20:11:27 -0700
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH CRASH] Fix module section load address when sh_addr != 0
To: lijiang <lijiang@redhat.com>, Tao Liu <ltao@redhat.com>
Cc: devel@lists.crash-utility.osci.io, linux-debuggers@vger.kernel.org
References: <20250401210132.171107-1-stephen.s.brennan@oracle.com>
 <CAO7dBbVa=HMvZEsFTCYwULSgjbfac7SCZNEKgYePgPXb9kNvgA@mail.gmail.com>
 <877c42ywxw.fsf@oracle.com> <871pu8zx1k.fsf@oracle.com>
 <CAO7dBbUAOfK-k-CKFgBopN_i4bGBO+bykO9VMQ0pu6Ja4hSGEw@mail.gmail.com>
 <87y0wfy06z.fsf@oracle.com>
 <CAO7dBbXBsXwniUQm0ox-XgwzHPTfRf2GCjSvt2ger2VYK28ZxQ@mail.gmail.com>
 <CANU+ZyeHSoJXUu5m9SaNEy0gQi+HDCzA+NMzp-w=XngGyFMADA@mail.gmail.com>
Content-Language: en-US
From: Stephen Brennan <stephen.s.brennan@oracle.com>
In-Reply-To: <CANU+ZyeHSoJXUu5m9SaNEy0gQi+HDCzA+NMzp-w=XngGyFMADA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: BL1PR13CA0208.namprd13.prod.outlook.com
 (2603:10b6:208:2be::33) To PH8PR10MB6597.namprd10.prod.outlook.com
 (2603:10b6:510:226::20)
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: PH8PR10MB6597:EE_|SA1PR10MB7700:EE_
X-MS-Office365-Filtering-Correlation-Id: c24925e6-e984-4be7-1c89-08dd7e26b6e4
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam: BCL:0;ARA:13230040|1800799024|366016|376014;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?cG1kT1E1Z3g0bEV0RzNueHBkN3g1ZEZzbW5MZWpkVEZUcEVHVVpWb1NwRkEy?=
 =?utf-8?B?SksvL2JQdWVGbU1acDNoWEVrTmU1a29OVmpYbFpMWTNkZzhiYXhMdHJSd1VD?=
 =?utf-8?B?MHV0U05rVWpjWnBVREhtZFFwVXNkcVF4MWpnbGhORUhKekFFd21JZTZuQVVF?=
 =?utf-8?B?WFczMzJPZ1FnS3dhclRkL01uTmxtTVMxYVJWc3BIeUZLNlJOVFFxNmlGazJr?=
 =?utf-8?B?dCtqWkppRTFFWGRseHRJdXJxWSs3Q1VGNjc1ZGhUNXBWQjN2ZlBmUm81SzVW?=
 =?utf-8?B?dmVqNFFyYkdidGFpeFVWc3RrS2RGK2lQK0wyZ0V4WUlRRVBhOFhPRW52d3NO?=
 =?utf-8?B?MTZubkxoM050UXI4TmR6bDVhdVZuMVU2RkZLaTBzS3BoZjF5ZzhHWmtQS0lv?=
 =?utf-8?B?TnA3dFhsbWluSDVKQ2FmMGpqSXlaSFd0dUJRYTkzZ2JJVUJtbTZDRWxxTXFz?=
 =?utf-8?B?WXdrV0JRek5aVzV2WkN0NXRKa2QraXdLQXAwakJsd09Nd3M1MWVJNDJYTTB2?=
 =?utf-8?B?R2NWWUFpRiswRFhkcVZCVWUxdDhvem1Nd3A5RmNOazh4NDZMNFVxM2FlUG5t?=
 =?utf-8?B?SS9wS2IwYUZlS2hwbURFUHVtKzh4R1FYSlVJSm0ySFU1eEdRZUF3VjlNUzhY?=
 =?utf-8?B?NGRKaytzZlVCMG1WQXNZSHRlM2JSdTNsWG9XcFVIdWZ2WnZ1dHRrMkZwS2cz?=
 =?utf-8?B?WmRJWEF2MnFrVmFZVW1tUjh6RzZsY2NBN2tEb1ZvdWNPd0xTMVVOYUtZbFJB?=
 =?utf-8?B?V0ZMdTE4b0ZZc2t6ZFZYOHhkdzZZUzRIcUZVY1dGQ01WczlFaUwxZ0J3RFVq?=
 =?utf-8?B?b1JRSENUemRPeTNhdndqT1ROUTJxeDBwSWZlK25QZW1LU24veGFRaGx2ZFJx?=
 =?utf-8?B?dXA1aURiMmZCakU0ektvN3U3d2Q1WkFBOW01RmgvQ2tIQjVSdTVyZnJ6bXF4?=
 =?utf-8?B?VjJuRE5mVWJpKzlJb0RIdlZpc0w4NGwxR0hCLy9RQzQveGlzQlE4NzJMWFFj?=
 =?utf-8?B?L1ZaSDIwRi9CaUs2b0gxVDRNZUZpdSt5aW8vL1E0SDFSQ0Uvd08zL09lc1FO?=
 =?utf-8?B?U0RKV08wc0tuekpkSUZtVThjQlo2YTZvRnJZRG43ZERScHhndnlJWTJudUZk?=
 =?utf-8?B?VG1iNGV2V2tmTWU4K1JCNUZuYndIWCtSUjByanI3SWFqcXdpdjJUdnBlSndO?=
 =?utf-8?B?L1pGdlRXOWI3ZjkxNkNhdWFjTkwxN2t4b0U2d0w0N09ac25RQjc0bmhYM0Fx?=
 =?utf-8?B?SktpK2FWVThxVi9ObUVqOUFRRUdnNzMxQXh5d2FXeVRlNms0aVBpZlF6c1hj?=
 =?utf-8?B?bHhvc1J5TDhzalJrT1NGbjZadkJNQVB0RzA0QTVnclZMcGdMOUZadStVRytl?=
 =?utf-8?B?WHNnZUlVZVZJeUNhZHRsc3RPRFZFaUJGa1JteEpPdHRWamE3R1Z2TGxIMUFU?=
 =?utf-8?B?QkdSenliRnRsNUttQUJnc0Y1eFdOaXE5Sk5xN3locFRsT2NseDM5UTZETVpH?=
 =?utf-8?B?ZENidGR0MFNxclpLZkdVdFJWOHh1Q2tUeTVCVFdxREdCWkZKSkxIMzkwTlNU?=
 =?utf-8?B?VXFFbkp2cCtaOTdBYWc5Mk9Wamlvb04yY3pRRHlsb2lrbHVweUxCUlNVRXBF?=
 =?utf-8?B?VzBQa3lZWEE4SmtSZGVGS0YzQ1BQQWlsM2JxREhyMm4rWDBTdzBVYnhhV0V3?=
 =?utf-8?B?R0xoZ1ozNEcxbGJISUtVRWU2a3JuNzJHSXRkU2hHajFpU2FURE95SmFucDZn?=
 =?utf-8?B?blVKUG1tZlJYMTlYYWZPMlh6bDRPOS9qM2VlQnZ2ckRzQ29PRExxY2VxSVN5?=
 =?utf-8?B?T3ozdFUyUFhTdlFURUR0dktIWEJFWG13SjFNUnpzTzVLWU94bmlrWEdwZkFr?=
 =?utf-8?Q?HhJIK9jCV7FAp?=
X-Forefront-Antispam-Report:
	CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH8PR10MB6597.namprd10.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	=?utf-8?B?VXg1REUzRUVlcWEyZUMzUEpVU3dGNVJzYkYzRmk2bXNyRTN6YXp0blQ3QS92?=
 =?utf-8?B?eFIrM1VUcW5PNWJNRndJZ2V2dU9nOFBhTWpGQnNkUXBtaGVzMCtXc1h5dmZu?=
 =?utf-8?B?aVE0NXk4SmxOL1lJelIyUTRmN2VSRGs3eGwvMWd4Rm51WjJPSEkxR3NRakgy?=
 =?utf-8?B?bnB4eFZDR2x1aUxCaUxIKy83M1RsOTloR09BT1hxNHhEeWpuaGd3WUc4ZkxZ?=
 =?utf-8?B?VzljN0ptNXMwajdpTVFpdEVRUDVkUE44NnNtTFhCSGZuM1FvTitPWWhJQUd4?=
 =?utf-8?B?QkcveGo1RzcwVXBRdzVXRGlLb0RvMGhmSi9DeDNDVkVaRUsrL1RCcjh6R29a?=
 =?utf-8?B?bnVNR1FXRUE4a0IwUURJOU1YTHVvdWVqZXlOazVYRWRYTmkrL2xSUDhDZkpW?=
 =?utf-8?B?M1BHY3FwQmR4U2hUWEYwY2o3SUZmZ0FYdi9jOHp1cFRiamhKZFJwMU4wSG00?=
 =?utf-8?B?eVU5TWkwYlYzejcvSkVoMHIrM2cwUmRQUHpqdm5NcHpqU3lxQlJLblErVEVw?=
 =?utf-8?B?enE2Uk9JeExoQW9CSzZncHpCU1JJUHhNb2dPdkNMSlJ2NFhXa09qdnJwb2dq?=
 =?utf-8?B?bGlQOVEwOHUrdDl4RzBXNU12aDhVeVBReklOeEhDOTJ2ZTRvZHFSN0Q0MTVV?=
 =?utf-8?B?OUIwMUdVV2hLVkw3SmJjTm1FcDZTZVpHZzdocUVSTDlsVXJDa20xUnVxMmZS?=
 =?utf-8?B?YU1TOXJ4RE9UTGI1bndRbVQ0TG9pTEFsMTN4RGowdTBoVmZ2a2JKS3lGRGd0?=
 =?utf-8?B?a1RBM3ZuUjN5NGl2aVdUYnZmM3JOY2ZWem1vZkx4V1U5Rk5ueWNUbUZwOXhh?=
 =?utf-8?B?MytYaXczRUErc3RSeFZRTmk5bnVYNHhTeWQ5Z29wd3krUm5neUp4MkdkTlhC?=
 =?utf-8?B?T09rSWhRWW0wV1V2eDJMWWtoQWlBd3JlWllCd0pCbjdFbWgyTnU3cTZBS0Zi?=
 =?utf-8?B?NU04ell1VFhWQ0Nlcm5XK2V6ZGo0c25EOG9wQ015ekJLWGRzMmdLWDBnVzdF?=
 =?utf-8?B?dm0veHh3UExMcXRUOExhWDdHSVhJcnFKNHlucVpjek1oSTJvU1lkRDM3Ulc3?=
 =?utf-8?B?OTFCNld0WHhCVGVrS2ZjMTRobWVMNlFETzZaVUJhcDJRdkhOUStoSXZ6VzhI?=
 =?utf-8?B?anFyNEpSbEFDL1BWVFIrRGhPdUx2TDFIa3FwZm1ZQlVjakJtYUswekI5Z29o?=
 =?utf-8?B?QTU4eTBDL3BhdUJGM0FZUUlqbjRHV2pQSExSbGNwSTFmV09ib3ZQcHRtSGhx?=
 =?utf-8?B?ZFJhVG53R3ZyV3N5OXJsS3ZhaHZnZE9pZjRoV3VQTkVmNmczbjlqVXhJVlI1?=
 =?utf-8?B?L2JxaFBiTHB4MHRIZzlCa21Nb2s4cEdJN1RCWXl3VWNNWmNpMUJXZzZHb1Z6?=
 =?utf-8?B?TnJheVRLMTRmVkYwWFk5WnBNZk1scSt3YVJQa09PenZxQnpzbDJrZEhYNHhi?=
 =?utf-8?B?QnZiM3BjOEpRYmI3VVhXYmpUTG8yY0s3UWh0OFAzUkt6d0lzQTFLMVZjZjN1?=
 =?utf-8?B?U1hOMUJDUzBPZGVBTEFXVDZVY1czMjJhQ243SXNsaHB0S2p6WDdJMlZibDFu?=
 =?utf-8?B?TnNZcUVRZjk0aHVsUGJCMHQ3SElvK0hRUlM1WDdiTUhjdmhoNjlGSmkwaUp5?=
 =?utf-8?B?UDdtVGo2OEpXOGdLRGRjUEhvQyt3WTEzbHNXaU5Ca2d5OWdkcFNibU5HdjNz?=
 =?utf-8?B?ZXlBV2hpNVlmRFBkWUpnTjBUSkYxcWRBY1owSjVEWkx0eG5nOW1RUWIwUVNo?=
 =?utf-8?B?cVNYQlpjaVd2QklBOXhyb2hUQml1djdPRk5XajJaTExBbGt6TURvRjJoUzdt?=
 =?utf-8?B?Q2MyOVVsVFd6RExzQ21odzYzUlVLRGNSb0dySXI0bFN5TnU1MFp3OGIyRTJv?=
 =?utf-8?B?cEdySEV6eDdka0hXd3dXVWsxblFTVFV6VEJEQVpWV0lWQjRxZlJtOEhDRjhm?=
 =?utf-8?B?UDhGZitXaDVTNXpxN2VYb20vVkg1SW9sRkZaVVJUYllEMGprN202b0l0WTNk?=
 =?utf-8?B?R1ZkdmN3dnFhSFZBdkQrM3pxNWxJNWpUbGRheC92cU5aajJyekFyalk2N0I3?=
 =?utf-8?B?bHc3cU9NZ2FHbzRydksrd0hiMXZGMWJwdldTYUtQdUsyeDdWNkFKQ2V4Ri9i?=
 =?utf-8?B?cW1NVzNqbDhlb2FrRUZFd2hMZElDS2hvS01tbDh4ajYyR2Fwdk5EMVZnaU85?=
 =?utf-8?B?RGc9PQ==?=
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0:
	uqijpT/W7hRQ3aX2WbHfNKLTa90V4N3+ObvguWbfTzzt3IKobrx4onhlTcBF3Y7h3mVWUyFpx5tA4UQTyiVYjtLOe91645xDPr678FU58PCz2O0u196aZODEAZiKL/sQpLyLKI+mOW+kKtyJn03xtXGRTivwAeIV7ffVejlsgt4XhsyhXK0j6jzbQ4fYU/QUdHtNvGNpoHoLc1O1rq601FCk7A6cQbdH3WSjwk9/NLTQP3dcngwXlNSx+P7qdk0xG6+clGl7mP0AmLC7MGC7mXkn3FS7rpeEEsqVOYPJEGLmGN2YqyE1VsMfI6EJl9QLEicWH1LGP8ZbfdgaYRz0iJVgNODX8ODL4DJJiC0KGSUDVlrjVQ+EGapLeuO5vdWNe3zcI4gpLtiMIMZRK/W3on+AG/9kg76cIRw3+7UbIVjAXo+twyXaJA1LdnsjIzkg6pnYwG1yjnC/GdMZBneN7XWfWtPMIf43g9wNdXcEfSJmiMRJdlsXmcwVbdjWhko0ygoeAwTh1XS5lh1otJ9WAyrBE2GKFbAh5ffEj7mb7ZJcNk47h0L+ls5+oC1OBzoV7hcT+cR487dyJSp4IfNJz3vzwlUWeJEzKGjrNs5kzO8=
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-Network-Message-Id: c24925e6-e984-4be7-1c89-08dd7e26b6e4
X-MS-Exchange-CrossTenant-AuthSource: PH8PR10MB6597.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 18 Apr 2025 03:11:30.2429
 (UTC)
X-MS-Exchange-CrossTenant-FromEntityHeader: Hosted
X-MS-Exchange-CrossTenant-Id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-MailboxType: HOSTED
X-MS-Exchange-CrossTenant-UserPrincipalName: VlhQYSgeL+9tg/UqzgdEc10kPUPOo2Ih46tEEyWie+A5KZJNLYpNXtYKryNGUOJeVJ8rPwbraG2CBbrYXNu+r6Cs9bp8vSIDvtIoluqpSao=
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SA1PR10MB7700
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-18_01,2025-04-17_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 phishscore=0 mlxlogscore=999
 suspectscore=0 spamscore=0 bulkscore=0 malwarescore=0 adultscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2502280000 definitions=main-2504180021
X-Proofpoint-GUID: ztWU9zfmJNFUwJhVK92ZNbv5EC0n3VCg
X-Proofpoint-ORIG-GUID: ztWU9zfmJNFUwJhVK92ZNbv5EC0n3VCg

On 4/17/25 18:43, lijiang wrote:
> On Mon, Apr 7, 2025 at 4:18 PM Tao Liu <ltao@redhat.com
> <mailto:ltao@redhat.com>> wrote:
> 
>     Hi Stephen,
> 
>     On Sat, Apr 5, 2025 at 12:30 PM Stephen Brennan
>     <stephen.s.brennan@oracle.com <mailto:stephen.s.brennan@oracle.com>>
>     wrote:
>     >
>     > Hi Tao,
>     >
>     > Thanks for digging through the code with me. I'm not very confident or
>     > familiar with it, so I don't have 100% confident answers, but I'll
>     do my
>     > best to answer:
> 
>     Thanks for your explanation! I think your modification is reasonable
>     and I have run tests against your patch, no regression is found.
>     Though I still haven't figured out whether it is a gdb issue or crash
>     specific, however I think it is OK to accept your patch for now. So I
>     will ack your No.1 and No.2 patch. Though No.2 patch needs some
>     cleanup on the code, but I think that is just a minor change, I have
>     no objection to its major part.
> 
>     So ack.
> 
> 
>  Applied:
> [1] https://github.com/crash-utility/crash/
> commit/2cf1a93805a8df6a2a4b7fde8d57b6d873c1bbeb <https://github.com/
> crash-utility/crash/commit/2cf1a93805a8df6a2a4b7fde8d57b6d873c1bbeb>
> [2] https://github.com/crash-utility/crash/commit/
> b982ddc4d66dcd59e567201428eb6191e4a24695 <https://github.com/crash-
> utility/crash/commit/b982ddc4d66dcd59e567201428eb6191e4a24695>
> 
> BTW: regenerated the patch for [2].

Thank you!
Stephen

> 
> Thanks
> Lianbo
> 
> 
>     Thanks,
>     Tao Liu
> 

