Return-Path: <linux-debuggers-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF6ADC0032E
	for <linux-debuggers@archiver.kernel.org>; Wed, 25 Oct 2023 09:17:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233987AbjJYJRP (ORCPT
        <rfc822;linux-debuggers@archiver.kernel.org>);
        Wed, 25 Oct 2023 05:17:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234163AbjJYJRN (ORCPT
        <rfc822;linux-debuggers@vger.kernel.org>);
        Wed, 25 Oct 2023 05:17:13 -0400
Received: from AUS01-SY4-obe.outbound.protection.outlook.com (mail-sy4aus01olkn2169.outbound.protection.outlook.com [40.92.62.169])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E8489DE
        for <linux-debuggers@vger.kernel.org>; Wed, 25 Oct 2023 02:17:10 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=cvvuhN+bkneNDHS6G8FDddRK8f15TC6qhGSh4pCQKCbPnVUm4gpeowLjFPczV7g5kC8aHvg2577jETcBYuvUclAQd+dSX8FFNpElsoQDYVBocNl/B92IDRUXeqtn7GQ2utgIzyNK3jjvfMZeaXWMjPNq2yLQ3KgJbpHcdgMcSQ8ipxWHzDpVuIrjt90TWaHar9jrpvfsvGdKom6t/UuGJwy3D1GnTa2GbG0J9SrNPvGHEHPP3sw2PgXG0cgBK9e4I3nvh7uLgwvkLzZfJ49N78rIZ1xBm1x4cRSXoFgF1o3yfI2YfxB0a6dRZXMBMJ14e6VUU/cR104bLTMhSDDA0g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=V7DTKr03BxSvn9JxCc6rNmwtgeaio2tzrudTrLLRaWY=;
 b=ihpU3Hth77p9ZNmHxujGlC/LivhtC1GvpCwG1s6po4lWKTRAdW/llr8ciBljZ3QLmnbkqmxLg2sXzKb2yipOOqaJfeFoQBdF9uScLpwXzvT3Iv8fqFzfp22qhIcznK1E1n/eLM2HYuUrH2c9w/Dj0Rp+LytIvtd+kOKdK05fDyM45bn1VKnyKaEwHb9S0Bji8y/xF7sv9fvZFXEua5XoKwp0ZAmNl5dC0j0NOMnrjseRA6p5wXP+S2iz8r/+eN3x4UBDDqqjh8P/BN+GiBvgfk6ItA6MCSogLVLovdi1fJv4rc7Dkch1OuF4NOxZMmqdX/8EUv2kxh0oEQIx+TfT9A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=none; dmarc=none;
 dkim=none; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=outlook.com;
 s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=V7DTKr03BxSvn9JxCc6rNmwtgeaio2tzrudTrLLRaWY=;
 b=rOgGKxVzOzzxieV5ZIgFNVK0cyVplfyOJ1dDn8ayuVt3eADYk9WACCKD6KcJbodIxY8OJhkDIRxNlwtl+Ihwn7tvfqEWOCMo2HaljXNKVYiJATBPmbugh8HxrTiaAUQA/NKsJceUeAAKBXtDPQNvxiF/K6n3OtKrAdYDaUCX+w00RFphbRi5HNPiFQhiVXu7QF5+tdrywXPCt+yLEEM38yO2G8o0MOzvMKdi3mIMaP3ddu44glIng8eu8CHHdpxmWd+m+1/XLvAu7WsIZgDTQku4d7CZ97k8fkQhT4mcmkB//qW5cu80oG04omXIeE3wM0Rg5jdTCAKOk1yNkM95vg==
Received: from ME3P282MB1826.AUSP282.PROD.OUTLOOK.COM (2603:10c6:220:a4::16)
 by SYYP282MB1230.AUSP282.PROD.OUTLOOK.COM (2603:10c6:10:76::14) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.6933.19; Wed, 25 Oct
 2023 09:17:07 +0000
Received: from ME3P282MB1826.AUSP282.PROD.OUTLOOK.COM
 ([fe80::fc80:5fd8:af80:d2ea]) by ME3P282MB1826.AUSP282.PROD.OUTLOOK.COM
 ([fe80::fc80:5fd8:af80:d2ea%6]) with mapi id 15.20.6907.032; Wed, 25 Oct 2023
 09:17:07 +0000
From:   a b <dtsbt@outlook.com>
To:     "linux-debuggers@vger.kernel.org" <linux-debuggers@vger.kernel.org>
Subject: Does kdb hardware breakpoint supports the arm64 architechture?
Thread-Topic: Does kdb hardware breakpoint supports the arm64 architechture?
Thread-Index: AQHaByKPhVEuA8v1jU268n8eLOnvWA==
Date:   Wed, 25 Oct 2023 09:17:07 +0000
Message-ID: <ME3P282MB1826A5F031A2E9747D66F1CDA9DEA@ME3P282MB1826.AUSP282.PROD.OUTLOOK.COM>
Accept-Language: zh-CN, en-US
Content-Language: zh-CN
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-tmn:  [0D63oT1wBJl9wWhHBznB+YXcOm/ycGE3]
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: ME3P282MB1826:EE_|SYYP282MB1230:EE_
x-ms-office365-filtering-correlation-id: 021d65e6-3332-4ee5-86f4-08dbd53b2946
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: RliMMrqEbXTdpb7YwhF3sKNTWLwwfrswEKL/yxVbYla6k3jsvwJ3y26yoJermetK0oaNcZkt+DKcyKcH0nDb86b64PNwZVHcp5oAbPejZVmkb2i2cYoydsupCjXkgEn9Sh6qgsnv971YeEapKyg8uF+2/nG3iZ+soQ7HyRVxbf7cBUY18B+39KvuJt2GUNbrBa9PPL1l6IfwGgrrJAr4xUpMuvKmOyVOzsP9zHHWCHxvtZwZqoiRYpTbQCSuJAmDFQiiufkDs/y42aUsb4KWpCdbig/xHy2RGjzh8WzWeIYhuLBftLLqSOqRQ/722C43ypHVBqb0tOtd3sul+ruMbfT7/IOtXH63miXv+jSFFev/hdcPxiFJ4PoH/FhmutBASphiuVhGqvZ4Usw3V+MIYu+/JJXWiSgaoRHuDXEDmyKufFRjXxjdon5nZxw84KI3nGM+mXMzzn3FOYN5+D4d7mW6zWxdTLuKHmhntrXfA3rZsR2KnU/OTMsSGH8bhITDQowpWSKQDwxB5U4N+KV1tPCPinZvWmVQfvqjkXJh+cvDHUMU4ogn85Eh2aka+Ea9
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?gb2312?B?Y3VpWDlFTDRzWWRHT05xQXZSUFZsQTRqdk9QVlR1MFV4c090ZTNWRHpYc2dP?=
 =?gb2312?B?VGErcitYTFo4NUNZcHJFMHhTdGUvL1dHS3ZIZFNEajBQMERoZ0xYSGloeHJj?=
 =?gb2312?B?bERqd2poQ1RxZXVoVGVaV3RyMHJQbkVRRG1Ic3g4VE5zaFFuY0FPSXI5MDlr?=
 =?gb2312?B?UXBJU09mWUlFNDE4b0syeW5ud0lhWkFaT0xBbDlseS9CSnlhbm5MM3NYYyt5?=
 =?gb2312?B?d2t4N0VwR1hwU1hWTFJmYy9tZjYwUHBTSGZ1TTBzODc1cVlQTlgvL1VmYkxa?=
 =?gb2312?B?Z2lCckFzNGJLMmI5SDJ5STVwWnIrRWwxTUpCUVJENFZJVU1iaHFubmd2TnQ4?=
 =?gb2312?B?SS9nMXdzS1NnTzdDL2lIWVZKZHdzQlVvYnJkQjZQRHFHUXlIa3dnNlBHK3VT?=
 =?gb2312?B?em5tc1N6ci9WN1p1bUk3UjFia05ERHJBTS9zc3VFeFVLSDJCNnE2MXVnb2pW?=
 =?gb2312?B?aHZZU041NTBIYTZpdTlkeG10K0RZV3d0cEIxb2tQWGhhY3dmSndsckVZMFBi?=
 =?gb2312?B?NEdQcVJnWHVFWHc5b1U0cW9yU0gycTdBdUtWMUtFZmd3czRWcnNPOFA1T1RO?=
 =?gb2312?B?TzRCY0JNQ21GdFZxSllybC9VaUlDazdHTk5uQ3NBOW1PRWpGK1Q2ejRzSlVr?=
 =?gb2312?B?TjNLZkw3ZFNTV0lTbUlsbGxZbVlSL3pDcmNvN09pRmRvMVByODIyVktFUSsz?=
 =?gb2312?B?d2o1bDl3dVEzRm81cXRudVFTT2l6SHpYaWxKSnFFbzVJSnpEMXpwYnNVdmxF?=
 =?gb2312?B?OXRvemhsWURkbmM0Tnc4YjV6cjB5SnNMNzBselNVZmI1Z0FkWm02dnlMRjBv?=
 =?gb2312?B?b3o1WXhsWmJEbjdPODU2UXQ1UjZpM0NjeUVxQllTVTJvMEdGNW01R1UyQnBP?=
 =?gb2312?B?T1JhaXV0K0lDbWZxM1Jmcmc1ZUhOVEpteEpkTWJLaEduRitjT3dtS0NPRjlF?=
 =?gb2312?B?ZTZIcnoybC9JaGwybTZSUlBKOFptNW1LaHo0MjBlOElUQXdKTVI2bGI2WTB0?=
 =?gb2312?B?NVRwbno2dkhvS2JMZVhCcHh2aDZFa2tjdFY0eWFkOFZUSEk2d0FIVVhZWFVB?=
 =?gb2312?B?cmszYXgyU3ROa3lNR0YrQVlVYnV6YXdiMlRJQUlyNVVnVGxHQyt1NEIxa3Q2?=
 =?gb2312?B?RTE2SE5MTld5ZnZ5bU1Rd0lHSks5VWYyZVl3STc2WG53NEZGaTNDbmhaQ3RH?=
 =?gb2312?B?QzhzV0k5RS9YeHZGdzdId0puSTFISElQekNnMHRQbkRCWGRUSENQSURweTNu?=
 =?gb2312?B?RFlyRUtQUGc2bDBpMnlxME5aV1E2cnBuTC8yVVJkRGJ1c1NCQmN6YlZ5cnF6?=
 =?gb2312?B?MDcxNENHWDZYcy9iRVltYmZnQ3BBVW9EcjhRSnhTTWNpRnJxOWZNY0tuYlZK?=
 =?gb2312?B?Q0RaNXlKMnBmK3NVVjZzNllXRkdZdTRLRHdLL3lxYm5sclhNQkozekFxTWl2?=
 =?gb2312?B?N21jTkRvNEowWEJlYUVRZEpFSjAxVU5EcnZ4cllrQXo1YmFZbndVejFEcGNs?=
 =?gb2312?B?UFRlK2tSVHBiejFsYm8yR0xJWXFvWklMMzhGVkFOQ0JNdFM0K3lla2JIWHZo?=
 =?gb2312?Q?3EMChrIHKRynXJKIzOUybvAmTi3V06XqSQAXBR7Zl1/9vf?=
Content-Type: text/plain; charset="gb2312"
Content-Transfer-Encoding: base64
MIME-Version: 1.0
X-OriginatorOrg: outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: ME3P282MB1826.AUSP282.PROD.OUTLOOK.COM
X-MS-Exchange-CrossTenant-RMS-PersistedConsumerOrg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-Network-Message-Id: 021d65e6-3332-4ee5-86f4-08dbd53b2946
X-MS-Exchange-CrossTenant-rms-persistedconsumerorg: 00000000-0000-0000-0000-000000000000
X-MS-Exchange-CrossTenant-originalarrivaltime: 25 Oct 2023 09:17:07.4913
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 84df9e7f-e9f6-40af-b435-aaaaaaaaaaaa
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SYYP282MB1230
Precedence: bulk
List-ID: <linux-debuggers.vger.kernel.org>
X-Mailing-List: linux-debuggers@vger.kernel.org

V2hlbiBJJ20gdHJ5aW5nIHRvIHVzZSB0aGUga2RiJ3MgYnBoKGhhcmR3YXJlIGJyZWFrcG9pbnQp
IG9uIGFuIGFybTY0IGJvYXJkIHdpdGggbGludXg2LjEsIHRoZSBlcnJvciBrZXJuZWwgTlVMTCBw
b2ludGVyIGRlcmVmZXJlbmNlIGF0IHZpcnR1YWwgYWRkcmVzcyAwMDAwMDAwMDAwMDAwMDAwIG9j
Y3VyczoKCnJvb3RAcm9vdDp+IyBlY2hvIGcgPiAvcHJvYy9zeXNycS10cmlnZ2VyClsgMjE4OS44
NjU0OTFdIHN5c3JxOiBERUJVRwoKRW50ZXJpbmcga2RiIChjdXJyZW50PTB4ZmZmZjAwMDM4NTZi
NTcwMCwgcGlkIDMxNCkgb24gcHJvY2Vzc29yIDQgZHVlIHRvIEtleWJvYXJkIEVudHJ5Cls0XWtk
Yj4gYnBoIGppZmZpZXNfcmVhZApJbnN0cnVjdGlvbihSZWdpc3RlcikgQlAgIzAgYXQgMHhmZmZm
ODAwMDA4MTM1ZWUwIChqaWZmaWVzX3JlYWQpCiAgICBpcyBlbmFibGVkICAgYWRkciBhdCBmZmZm
ODAwMDA4MTM1ZWUwLCBoYXJkdHlwZT0xIGluc3RhbGxlZD0wCgpbNF1rZGI+IGdvClsgMjIyMC4w
NTE0NzZdIFVuYWJsZSB0byBoYW5kbGUga2VybmVsIE5VTEwgcG9pbnRlciBkZXJlZmVyZW5jZSBh
dCB2aXJ0dWFsIGFkZHJlc3MgMDAwMDAwMDAwMDAwMDAwMApbIDIyMjAuMDUxNzE5XSBNZW0gYWJv
cnQgaW5mbzoKWyAyMjIwLjA1MTc1MF0gICBFU1IgPSAweDAwMDAwMDAwODYwMDAwMDUKWyAyMjIw
LjA1MTg0MV0gICBFQyA9IDB4MjE6IElBQlQgKGN1cnJlbnQgRUwpLCBJTCA9IDMyIGJpdHMKWyAy
MjIwLjA1MTg5OF0gICBTRVQgPSAwLCBGblYgPSAwClsgMjIyMC4wNTE5MzRdICAgRUEgPSAwLCBT
MVBUVyA9IDAKWyAyMjIwLjA1MTk3N10gICBGU0MgPSAweDA1OiBsZXZlbCAxIHRyYW5zbGF0aW9u
IGZhdWx0ClsgMjIyMC4wNTIxOTVdIHVzZXIgcGd0YWJsZTogNjRrIHBhZ2VzLCA0OC1iaXQgVkFz
LCBwZ2RwPTAwMDAwMDA0MDJlMjNhMDAKWyAyMjIwLjA1MjI1NF0gWzAwMDAwMDAwMDAwMDAwMDBd
IHBnZD0wMDAwMDAwMDAwMDAwMDAwLCBwNGQ9MDAwMDAwMDAwMDAwMDAwMCwgcHVkPTAwMDAwMDAw
MDAwMDAwMDAKWyAyMjIwLjA1MjgwNF0gSW50ZXJuYWwgZXJyb3I6IE9vcHM6IDAwMDAwMDAwODYw
MDAwMDUgWyMxXSBQUkVFTVBUX1JUIFNNUApbIDIyMjAuMDU0MjI2XSBNb2R1bGVzIGxpbmtlZCBp
bjoKWyAyMjIwLjA1NDUwOV0gQ1BVOiA0IFBJRDogMzE0IENvbW06IGJhc2ggTm90IHRhaW50ZWQg
Ni4xLjEyLXJ0NwpbIDIyMjAuMDU0NTY2XSBIYXJkd2FyZSBuYW1lOiBBUk02NCBib2FyZApbIDIy
MjAuMDU0NTk1XSBwc3RhdGU6IDAwNDAwM2M5IChuemN2IERBSUYgK1BBTiAtVUFPIC1UQ08gLURJ
VCAtU1NCUyBCVFlQRT0tLSkKWyAyMjIwLjA1NDYzOF0gcGMgOiAweDAKWyAyMjIwLjA1NDgxMV0g
bHIgOiBrZGJfYnBfaW5zdGFsbCsweDEyMC8weDIwMApbIDIyMjAuMDU0ODY1XSBzcCA6IGZmZmY4
MDAwMGE0NmY4NzAKWyAyMjIwLjA1NDg3OV0geDI5OiBmZmZmODAwMDBhNDZmODcwIHgyODogZmZm
ZjgwMDAwOTBiODAwMCB4Mjc6IGZmZmY4MDAwMDkwYmIxYzAKWyAyMjIwLjA1NDkzOV0geDI2OiBm
ZmZmODAwMDBhNDZmYjMwIHgyNTogZmZmZjgwMDAwODhkZDYxMCB4MjQ6IGZmZmY4MDAwMDg4ZGQ1
ZDgKWyAyMjIwLjA1NDk4OF0geDIzOiBmZmZmODAwMDA5MGI4ZmY0IHgyMjogZmZmZjgwMDAwOTBi
OGNkOCB4MjE6IGZmZmY4MDAwMDkwYmIxYzAKWyAyMjIwLjA1NTAzN10geDIwOiAwMDAwMDAwMDAw
MDAwMDAwIHgxOTogMDAwMDAwMDAwMDAwMDAwMCB4MTg6IDAwMDAwMDAwMDAwMDAwMDEKWyAyMjIw
LjA1NTA4NF0geDE3OiAwMDAwMDAwMDAwMDAwMDAwIHgxNjogMDAwMDAwMDAwMDAwMDAwMCB4MTU6
IGZmZmYwMDAzODU2YjViZDAKWyAyMjIwLjA1NTEzMV0geDE0OiAwMDAwMDAwMDAwMDAwMDAwIHgx
MzogMDAwMDAwMDAwMDAwMDAwMCB4MTI6IGZmZmY4MDAwMDkwYjkwMDAKWyAyMjIwLjA1NTE3OF0g
eDExOiAwMDAwMDAwMDAwMDAwMDIyIHgxMDogZmZmZmZmZmZmZjk4MzZhOCB4OSA6IDAwMDAwMDAw
MDAwMDAwMTAKWyAyMjIwLjA1NTIyNl0geDggOiAwMTAxMDEwMTAxMDEwMTAxIHg3IDogN2Y3Zjdm
N2Y3ZjdmN2Y3ZiB4NiA6IDAwMDAwMDAwMDAyMjA0MDAKWyAyMjIwLjA1NTI3NF0geDUgOiAwMDAw
MDAwMDAwMDAwMDAwIHg0IDogZmZmZjgwMDNmNmQxMDAwMCB4MyA6IDAwMDAwMDAwMDAwMDAwMDAK
WyAyMjIwLjA1NTMyMF0geDIgOiAwMDAwMDAwMDAwMDAwMDAxIHgxIDogMDAwMDAwMDAwMDAwMDAw
MSB4MCA6IGZmZmY4MDAwMDgxMzVlZTAKWyAyMjIwLjA1NTM3MV0gQ2FsbCB0cmFjZToKWyAyMjIw
LjA1NTM5Ml0gIDB4MApbIDIyMjAuMDU1NDIzXSAga2RiX3N0dWIrMHgyODgvMHg0MjgKWyAyMjIw
LjA1NTQ1NV0gIGtnZGJfY3B1X2VudGVyKzB4MTY4LzB4NzQwClsgMjIyMC4wNTU0OTNdICBrZ2Ri
X2hhbmRsZV9leGNlcHRpb24rMHhkMC8weDEyOApbIDIyMjAuMDU1NTMxXSAga2dkYl9jb21waWxl
ZF9icmtfZm4rMHgyOC8weDM4ClsgMjIyMC4wNTU1NjddICBjYWxsX2JyZWFrX2hvb2srMHg2Yy8w
eDgwClsgMjIyMC4wNTU1OTddICBicmtfaGFuZGxlcisweDFjLzB4NjAKWyAyMjIwLjA1NTYyM10g
IGRvX2RlYnVnX2V4Y2VwdGlvbisweDhjLzB4MTE4ClsgMjIyMC4wNTU2NTVdICBlbDFfZGJnKzB4
MzgvMHg1OApbIDIyMjAuMDU1NjkwXSAgZWwxaF82NF9zeW5jX2hhbmRsZXIrMHhjOC8weGU4Clsg
MjIyMC4wNTU3MThdICBlbDFoXzY0X3N5bmMrMHg2NC8weDY4ClsgMjIyMC4wNTU3NDFdICBrZ2Ri
X2JyZWFrcG9pbnQrMHgxYy8weDgwClsgMjIyMC4wNTU3NzNdICBfX2hhbmRsZV9zeXNycSsweDkw
LzB4MWEwClsgMjIyMC4wNTU4MjFdICB3cml0ZV9zeXNycV90cmlnZ2VyKzB4NzQvMHg5OApbIDIy
MjAuMDU1ODU1XSAgcHJvY19yZWdfd3JpdGUrMHhhNC8weGY4ClsgMjIyMC4wNTU4OTRdICB2ZnNf
d3JpdGUrMHhkMC8weDM4OApbIDIyMjAuMDU1OTM0XSAga3N5c193cml0ZSsweDZjLzB4MTAwClsg
MjIyMC4wNTU5NjhdICBfX2FybTY0X3N5c193cml0ZSsweDFjLzB4MjgKWyAyMjIwLjA1NjAwN10g
IGludm9rZV9zeXNjYWxsKzB4NDQvMHgxMDgKWyAyMjIwLjA1NjA2MV0gIGVsMF9zdmNfY29tbW9u
LmNvbnN0cHJvcC4wKzB4NDQvMHhmMApbIDIyMjAuMDU2MTA5XSAgZG9fZWwwX3N2YysweDJjLzB4
YzgKWyAyMjIwLjA1NjE1MF0gIGVsMF9zdmMrMHgyOC8weDk4ClsgMjIyMC4wNTYxNzRdICBlbDB0
XzY0X3N5bmNfaGFuZGxlcisweGI4LzB4YzAKWyAyMjIwLjA1NjIwMF0gIGVsMHRfNjRfc3luYysw
eDE4Yy8weDE5MApbIDIyMjAuMDU2NTkyXSBDb2RlOiBiYWQgUEMgdmFsdWUKWyAyMjIwLjA4Mzk4
OV0gLS0tWyBlbmQgdHJhY2UgMDAwMDAwMDAwMDAwMDAwMCBdLS0tClsgMjIyMC4wODQ2MjJdIEtl
cm5lbCBwYW5pYyAtIG5vdCBzeW5jaW5nOiBPb3BzOiBGYXRhbCBleGNlcHRpb24=
