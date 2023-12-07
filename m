Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nec.com header.i=@nec.com header.b="YKV8Xz1D"
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2043.outbound.protection.outlook.com [40.107.114.43])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5A33D18D
	for <linux-debuggers@vger.kernel.org>; Wed,  6 Dec 2023 16:25:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=gMxFSchZJZQNyD6qMloS6YvReaG0rBQep1Dn130y1er4WmpbAL62drzOJ8I4ur6J6uoT6TpVLuVYeQXyepGI+e+V1CqAo5qCfBwh4sJAOMLi2fmI6Gl8FmM1P1UNxEPvSRzrPO2Hp9Km11k0A5Ru9lgDjrnBpv9DUFa6KZ00KwTBZXpoddjsnlN5lFnUnqfx5s186OnUBoVULNYEzjEdt0gUF/jyIsHtYaNnCJgfTUgl+qqoIbzB8/Ez1A/gSzr+LJ8X/QN9ZM2dPXbpsskrv0RWzdK3Ju9lIu21h1xKS1d0mUEdGu+lvaEpY6M6elkkT6KBKn4SxbDlvPGmIrXN2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=tvA1orrsZ0hi1pJXelUo9x+SI5ebqxVtNX5JO8iIBis=;
 b=Vp0zA/9xP9kNprUUpAnr3cp+dLkg9li6/XuvknPwicfYnOEzzAEMCMHlDBSnKTQAaheik3ndTK2E6fI8TD3XBuxWx1W99quizbN/8jVXLt59Vpn1jRX86lsczyFiTF9/c6H7hPErrjVaCszZuampllRu5R06Yg+C52zlve8fpXZiCb0QOAshxlxrVqW7MfLkDxCXDwDJLwGTcfTWOBl3Yh3bgNLebNHcGIQtyYFW6Yx+L8iyzVyn6X0zVFD8nrmniZVou6Yb28DkJJZ1k9VEggol+gUaQn4ObwbdWV/qg5Ig2CcOXQk94uXnexqLwXKu1jZ71DU+nZiT/s/6hnMKMQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nec.com; dmarc=pass action=none header.from=nec.com; dkim=pass
 header.d=nec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nec.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=tvA1orrsZ0hi1pJXelUo9x+SI5ebqxVtNX5JO8iIBis=;
 b=YKV8Xz1Dt9k85JAij5NzJ9fXPs/2OlZj+tuWPxjwtgNkV6iF9CXyo8Bwba1h6mz4j0T6VChka6FKW5r/Ui4yUjYwgJDtyH0EEhGFWZsLmJbOPfGs3sG0U/+vHeuLdcPCswBmcb8t4awXanljWETtxFiDXQ+OOkXtIt2+8Jm6N1s=
Received: from TYYPR01MB6777.jpnprd01.prod.outlook.com (2603:1096:400:cc::9)
 by TYWPR01MB10724.jpnprd01.prod.outlook.com (2603:1096:400:2a4::7) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7068.25; Thu, 7 Dec
 2023 00:24:48 +0000
Received: from TYYPR01MB6777.jpnprd01.prod.outlook.com
 ([fe80::a38e:2545:fc3c:c13]) by TYYPR01MB6777.jpnprd01.prod.outlook.com
 ([fe80::a38e:2545:fc3c:c13%6]) with mapi id 15.20.7068.025; Thu, 7 Dec 2023
 00:24:48 +0000
From: =?utf-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+44CA5LiA5LuBKQ==?=
	<k-hagio-ab@nec.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>,
	"devel@lists.crash-utility.osci.io" <devel@lists.crash-utility.osci.io>
CC: "linux-debuggers@vger.kernel.org" <linux-debuggers@vger.kernel.org>
Subject: Re: [Crash-utility] [PATCH] symbols: handle module symbols outside
 strbuf
Thread-Topic: [Crash-utility] [PATCH] symbols: handle module symbols outside
 strbuf
Thread-Index: AQHaIlbRyJb++rwM/km7Ch6Sf+vQ/rCT+EQAgAeV+YCAAXSmgA==
Date: Thu, 7 Dec 2023 00:24:47 +0000
Message-ID: <20472161-0420-883d-08c0-9712e8c1ffd4@nec.com>
References: <20231128145723.689860-1-stephen.s.brennan@oracle.com>
 <0a214318-5bde-a495-9d19-356c5dc8c63d@nec.com> <877clsgjwq.fsf@oracle.com>
In-Reply-To: <877clsgjwq.fsf@oracle.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: TYYPR01MB6777:EE_|TYWPR01MB10724:EE_
x-ms-office365-filtering-correlation-id: ff72f61c-3800-41df-c305-08dbf6baeb9d
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 xl2RZ4MpN5YuF13OWyWRCz2y0c8CvYEFDqIT+Xr6EKyw/q6bhe/ZUYtMDcfFqe+EKi7PD5QGD1GZ6eVfGWqq7TFgQUdC5ugDqJ+iY6ynwWhATycXRY2So3lFJOzaJ+Qv4vi9IC+HO8LyiL3xJcVYanVVYPTWXAaZtyY6rz01NIsKgWOR8xk6QFcfF8ESxOWgiYEFOEB8T2MwyAyucV4qeGjGbUMvZwd66Wb/w7QxGJehTg7tNo1wxF9ZhTIgLn5UP1MX8Xm2steTvyfyEHvgNQAUlDHWbiF5Y00VsUHnZ2wijmfjC9Ye65clAYMgmO6YkrMjFRMXhR56bDTuYLvaWsoNTdNaDU96daKbiY9jSqf1XnUh66qTrYe+QckbcDM6nQMyDFevXSoZypNLxuH8W0s34lL6dtjOmRPOpX48hmB+lj/587E2UcLXPvczZp6ePCjqIMtTrxneG5bZXrlTJFlI8n51qdtx8pZiaHom+c+eInmIJTIltGDB+bMd/hzbkUw1RJGslHNeRgctlxMw4+nhADUC4qQBXllDvCOHB4UzSEu9ODyf+Dx0OjjguKbj5hm8kCjzkXKtAQYMvzC+jdtp9imf19fignXFL1v7JpngOww5mUjP2p5Wy6gOiRFOdzvGszuNCegPyr00pcxqVg==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:TYYPR01MB6777.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(136003)(376002)(366004)(396003)(346002)(39860400002)(230922051799003)(451199024)(64100799003)(186009)(1800799012)(31686004)(38070700009)(71200400001)(478600001)(6506007)(8936002)(66476007)(8676002)(6486002)(4326008)(122000001)(2616005)(53546011)(6512007)(26005)(66556008)(64756008)(66446008)(110136005)(66946007)(76116006)(316002)(83380400001)(38100700002)(85182001)(82960400001)(36756003)(2906002)(5660300002)(86362001)(31696002)(41300700001)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?dXZvQUMxdkFSeHk2ZWdwbDdHN3RUSWdrQk5pL016Zmk3ZS9YSGlTT05BMm9m?=
 =?utf-8?B?NEFSU1ZRS2tJcGkyanNmZjJlL0NtWjJTTEsrNWdtQ0xZNTVzU1VlVER1VmtS?=
 =?utf-8?B?NGx5ME1ZTVZCa3NBRURKeEQ2VS9ZNDVGRXl4blBQNkVzSkhMbjZOQms2alVk?=
 =?utf-8?B?MWI5ZzRnOVJEeHA0Tk5KSkhyV0dvWGhDNkRqazNQcWplZHl3QnRYeW1ZSUJv?=
 =?utf-8?B?UWZxWDMyUTh6NnNhR0E4MXE1TVljWktjUGZreWp2UUtOWlZVd2tyaXhPeG1K?=
 =?utf-8?B?Z3BoUmhsM09CRDlJcW5Mcm1WTnBhYllWbm9EMXdFUHB4Y0U2OXgxd1lQWm9L?=
 =?utf-8?B?UTF1R0tNaEJ6Vk1WWU9IaGc0cnFJWWxTM3VyMGMvdXZjL0UxUmdEekxTelNu?=
 =?utf-8?B?dUJvdldMYnB1Nm9TTGZZb2t5MnJQbVZZT1pBa0tva0YvZUNDZ2FlUkx3RmFF?=
 =?utf-8?B?cjd4T3hTVFBqeVNNcGg0TFJGcFRsZHphbVRrWm5sYUVLTE9GcDh3NzZ3dGVR?=
 =?utf-8?B?YzhSYm5PM0tYOVgvS2tMRGVYd0xXbkJCbnU1SEozeHVaUHZlNTlDTGZMYzlu?=
 =?utf-8?B?czdvUW9HaGZyVDdLbzlVUFhBQ3Q0clNXamkvQnhQb2VxNTRaL1RndXJLVzNj?=
 =?utf-8?B?aldySFFrdnpURUhmMWhGRjNtUlp3WUd3RUJhWXhaVHVpanpKaWU0K2NJUjNw?=
 =?utf-8?B?U2JybE02cXd4S1ArK0FnVFVjbDQ5Y2VRS3l2WjlJcWJGaUpHeEVrSUN0NkRa?=
 =?utf-8?B?eEp2ZmxvZlFnZGdVM1NtemJPSXZpNFhkOFNaRmw2RWxNQ3c2anQzd1dEYXZs?=
 =?utf-8?B?YlNXR2hXYlNHMmdady9hT3IzWmpaVnRTZTY3bThyeFNmdnFWNlFGcmJDYTNa?=
 =?utf-8?B?ZGRQMVNReDNBdDZwek95b3NvSEs3Q1FScEtacUxjVDFncFozUHVJKzdZRzY2?=
 =?utf-8?B?TzJzSXJNWkYxR045YXpjL3Nma1Y1MEFTZEVGUDNJRFdVOE1aWTFraG01M0Ro?=
 =?utf-8?B?UWpQR2NSUDJZQkg1c1RzaWtjd0VxcGYwenA1bzdNTlJ6eDJFT3loVzZSMDg2?=
 =?utf-8?B?U0NnVWFEOVdpeUlucGJ4Zm50bTFxRTVXTE9rVW1rOEd2RmxadUl0N2ZJWVVj?=
 =?utf-8?B?dFdicTJhSEZYUytxeHM1K1dFbkRXMkZEcG1UT2JpcGkxTDFydVdnSkxvVVRK?=
 =?utf-8?B?Rmt3SU00b1JraVN5NnJWdTFCWGhDcnBZZklSbE05aTFhV05sSmZRUWIySWdv?=
 =?utf-8?B?VUUrMVNqeERrZ3FFemI4QjNmUmZRUWhoYjB3VnEydFNERWc0MnQ1RTRZZENa?=
 =?utf-8?B?VjFoL0M3MDIwaWU3WHBmS0VRZ0FzY0FVOWcyM0pHOVZaUlQwMGFISnlvdW1F?=
 =?utf-8?B?ZFdJbXoyQy9MeEM3bVdzVjM1TkpoYzdLZENaaEtSb2p4NG9scnNmdWtNaVBF?=
 =?utf-8?B?endGdXVMZGNGcGloWkhteG1TbEw2VkE3Ukg5cWdQWkE3ZElHY2RKUTBNbTlH?=
 =?utf-8?B?MGZ6bVFlRVZpeVBYSitBQ0pOZTdvZkdzOFlOWkFqNFl3SnQ0bjdNeEhzazNl?=
 =?utf-8?B?MjRRMnZuL3dkcWlhMC93WnJPUnlUdnhBcWV0ZGlTTUZWd0dWUVBCSjRpcTFU?=
 =?utf-8?B?WnBCOEJPZGo2cGJmbzNyNCtPUWwrZ25oQWZhSjI1Q1VpZEZIWCtmT3N5WHFF?=
 =?utf-8?B?RlVzVGxmMy9MdXEwdzBJM1NxNUVGWjNiNW1jdFBrMXorSVBaMG0rbGVIcnJr?=
 =?utf-8?B?Z245M1dOa0JJajgzb0d1ZlFOeVlHVWhqWW5ESUNaNThtVzdleHNZSDJ1SVJ1?=
 =?utf-8?B?QlRnclhGUnhpWFhBQkRlVXdyb3hPU3RLS2NmcVY4Z01PYSt2bXZhWHRZSnJW?=
 =?utf-8?B?K3E5WnY3UVdoN0g4a2gzTWxCUGlLc0NaSm9Kc3FoZmZBZHBHZlQ3RWVNRzFi?=
 =?utf-8?B?cnRsaG00QWdhV3F5bDEyTm5DYnp2RDVXQnl5MGx0UHhpVFhCWVkzMkxzS2tN?=
 =?utf-8?B?cnhLMm9DMnVoMGJNbnNkeWpoS1BpNlVORTQwOERwSXBTbGwvbmp2TWFDY1Fq?=
 =?utf-8?B?SHdQSi9lOXhuYXUvZUFsMmlsZ09mbFM3TGhDcTRoNEkvTE9hcmF1NEw0YzZW?=
 =?utf-8?Q?iZUc/rkHw27fxIfptnUhsDP7e?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <900B0C6E2232B847BAD130897BA2EB0A@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: TYYPR01MB6777.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: ff72f61c-3800-41df-c305-08dbf6baeb9d
X-MS-Exchange-CrossTenant-originalarrivaltime: 07 Dec 2023 00:24:48.0310
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67df547-9d0d-4f4d-9161-51c6ed1f7d11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: GY9fcV8v+lGHPuxi3wNeN063uKwWsW0VH2w2v+hVBqtKbQW4XP3Ms06wGGUB5+3gq2SKdwIBMSrNOU/V757Wiw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYWPR01MB10724

T24gMjAyMy8xMi8wNiAxMToxMSwgU3RlcGhlbiBCcmVubmFuIHdyb3RlOg0KPiBIQUdJTyBLQVpV
SElUTyjokKnlsL7jgIDkuIDku4EpCTxrLWhhZ2lvLWFiQG5lYy5jb20+IHdyaXRlczoNCj4gDQo+
PiBPbiAyMDIzLzExLzI4IDIzOjU3LCBTdGVwaGVuIEJyZW5uYW4gd3JvdGU6DQo+Pj4gTW9kdWxl
IHN5bWJvbCBuYW1lcyBjYW4gZ2V0IG92ZXJ3cml0dGVuIGJ5IGxpdmUgcGF0Y2hlcyBvciBrc3Bs
aWNlIGluDQo+Pj4gb2RkIGNvcm5lciBjYXNlcywgc28gdGhhdCB0aGUgcG9pbnRlciBubyBsb25n
ZXIgcG9pbnRzIHdpdGhpbiB0aGUgc3RyaW5nDQo+Pj4gYnVmZmVyLiBHcmFjZWZ1bGx5IGZhbGxi
YWNrIHRvIHJlYWRpbmcgdGhlIHN0cmluZyBkaXJlY3RseSBmcm9tIHRoZQ0KPj4+IGtlcm5lbCBp
bWFnZSBpbiB0aGVzZSBjYXNlcywgdG8gYXZvaWQgcG9zc2libGUgc2VnbWVudGF0aW9uIGZhdWx0
cw0KPj4+IHJlYWRpbmcgb3V0c2lkZSB0aGUgYm91bmRzIG9mIHN0cmJ1Zi4NCj4+Pg0KPj4+IFNp
Z25lZC1vZmYtYnk6IFN0ZXBoZW4gQnJlbm5hbiA8c3RlcGhlbi5zLmJyZW5uYW5Ab3JhY2xlLmNv
bT4NCj4+PiAtLS0NCj4+Pg0KPj4+IEhpIGZvbGtzIC0gSSBlbmNvdW50ZXJlZCBhIHNlZ2ZhdWx0
IG9uIGEgdm1jb3JlIHdoaWNoIGhhZCBhIG1vZHVsZQ0KPj4+IHN5bWJvbCB0aGF0IGhhZCBnb3R0
ZW4gaXRzIG5hbWUgb3ZlcndyaXR0ZW4gYnkgYSBrc3BsaWNlIChsaXZlIHBhdGNoKS4NCj4+PiBJ
dCBzZWVtcyBsaWtlIHRoZXJlJ3Mgbm90IGEgZ3VhcmFudGVlIHRoYXQgbW9kdWxlIHN5bWJvbCBu
YW1lcyBfbXVzdF8NCj4+PiBsaXZlIHdpdGhpbiB0aGUgc2FtZSBzeW1ib2wgYnVmZmVyLCBhbmQg
dGhlcmUgaXMgZXZlbiBsb2dpYyB0byBwcmV2ZW50DQo+Pj4gcmVhZGluZyB0b28gbXVjaCBkYXRh
IGludG8gc3RyYnVmIGluIHRob3NlIGNhc2VzLg0KPj4NCj4+IFRoYW5rIHlvdSBmb3IgdGhlIHJl
cG9ydCBhbmQgcGF0Y2guDQo+Pg0KPj4gVG8gbWUsIGl0IHNlZW1zIGxpa2UgdGhlIGxvZ2ljIGlz
IGp1c3QgdG8gY2FwIHRoZSBidWZmZXIgc2l6ZSBiZWNhdXNlIG9mDQo+PiBhZGRpbmcgQlVGU0la
RS4NCj4+DQo+PiBJZiAibGFzdCIgaXMgb3V0c2lkZSBvZiBhIG1vZHVsZSByYW5nZSwgeW91ciBw
YXRjaCBjYW4gZml4IGl0LiAgQnV0IGlmDQo+PiAiZmlyc3QiIGlzIGZhciBvdXRzaWRlIChsb3dl
cikgb2YgdGhlIG1vZHVsZSByYW5nZSwgc3RyYnVmbGVuIGJlY29tZXMNCj4+IGh1Z2UgYW5kIGNy
YXNoIHRyaWVzIHRvIGFsbG9jYXRlIGEgaHVnZSBtZW1vcnk/ICBJcyBpdCBwb3NzaWJsZSBieSBr
c3BsaWNlPw0KPiANCj4gSGkgS2F6dSwgdGhhbmtzIGZvciB0YWtpbmcgYSBsb29rLg0KPiANCj4g
WW91J3JlIHJpZ2h0LCBpZiBmaXJzdCBpcyBmYXIgYmVsb3cgdGhlIG1vZHVsZSByYW5nZSwgdGhl
biB0aGVyZSB3b3VsZA0KPiBiZSBhIHNlcGFyYXRlIGJ1ZywgYW5kIG15IHBhdGNoIHdvbid0IGFk
ZHJlc3MgaXQuIEkgaGF2ZW4ndCBzZWVuIGEgY2FzZQ0KPiB3aGVyZSB0aGUgc3ltYm9sIG5hbWUg
cG9pbnRzIGJlbG93IHRoZSBtb2R1bGUgYWRkcmVzcyByYW5nZSwgYnV0IEkNCj4gYmVsaWV2ZSBp
dCdzIHBvc3NpYmxlLg0KPiANCj4gVGhlIHJlcGxhY2VtZW50IHN0cmluZyBjb21lcyBmcm9tIHRo
ZSBrc3BsaWNlIG1vZHVsZS4gU28gaWYgdGhlIGtzcGxpY2UNCj4gbW9kdWxlIGdldHMgYWxsb2Nh
dGVkIHRvIGFuIGFkZHJlc3MgYmVsb3cgdGhlIGN1cnJlbnQgbW9kdWxlDQo+IChsbS0+bW9kX2Jh
c2UpLCB0aGUgY2FzZSB3b3VsZCBoYXBwZW4uDQoNClRoYW5rcyBmb3IgdGhlIGV4cGxhbmF0aW9u
LCB1bmRlcnN0b29kLg0KDQo+IA0KPiBBIHNpbXBsZSB3YXkgdG8gYWRkcmVzcyB0aGlzIHdvdWxk
IGJlIHRvIGFib3J0IHRoZSBsb29wIHdoaWNoIGNhbGN1bGF0ZXMNCj4gZmlyc3QvbGFzdCwgaWYg
d2UgZW5jb3VudGVyIGEgc3RyaW5nIHdoaWNoIGlzIG91dHNpZGUgdGhlIG1vZHVsZSBhZGRyZXNz
DQo+IHJhbmdlLiBTb21ldGhpbmcgbGlrZSB0aGlzOg0KPiANCj4gICBmb3IgKGkgPSBmaXJzdCA9
IGxhc3QgPSAwOyBpIDwgbmdwbHN5bXM7IGkrKykgew0KPiAgIAltb2RzeW0gPSAodW5pb24ga2Vy
bmVsX3N5bWJvbCAqKQ0KPiAgIAkgICAgKG1vZHN5bWJ1ZiArIChpICoga2VybmVsX3N5bWJvbF9z
aXplKSk7DQo+ICsJaWYgKG1vZHN5bV9uYW1lKGdwbF9zeW1zLCBtb2RzeW0sIGkpIDwgbG0tPm1v
ZF9iYXNlIHx8DQo+ICsgICAgICAgICAgICBtb2RzeW1fbmFtZShncGxfc3ltcywgbW9kc3ltLCBp
KSA+PSBsbS0+bW9kX2Jhc2UgKyBsbS0+bW9kX3NpemUpIHsNCj4gKwkJZmlyc3QgPSBsYXN0ID0g
MDsNCj4gKwkJYnJlYWs7DQo+ICsJfQ0KPiAgIAlpZiAoIWZpcnN0DQo+ICAgCSAgICB8fCBmaXJz
dCA+IG1vZHN5bV9uYW1lKGdwbF9zeW1zLCBtb2RzeW0sIGkpKQ0KPiAgIAkJZmlyc3QgPSBtb2Rz
eW1fbmFtZShncGxfc3ltcywgbW9kc3ltLCBpKTsNCj4gICAJaWYgKG1vZHN5bV9uYW1lKGdwbF9z
eW1zLCBtb2RzeW0sIGkpID4gbGFzdCkNCj4gICAJCWxhc3QgPSBtb2RzeW1fbmFtZShncGxfc3lt
cywgbW9kc3ltLCBpKTsNCj4gICB9DQo+IA0KPiBXaXRoIHRoaXMgY2hlY2ssIHRoZSBidWZmZXIg
d29uJ3QgYmUgY3JlYXRlZCB1bmxlc3MgYWxsIHRoZSBzeW1ib2xzIGFyZQ0KPiBpbiB0aGUgY29u
dGlndW91cyByZWdpb24sIHNvIHdlIGRvbid0IG5lZWQgbXkgYWRkZWQgY2hlY2sgZnJvbSB0aGlz
DQo+IHBhdGNoZS4NCg0KQWgsIGdvdCBpdC4gIEkgZ3Vlc3MgdGhhdCB1c3VhbGx5IHRoZSBudW1i
ZXIgb2YgbW9kdWxlcyB0aGF0IHRoZWlyIA0Kc3ltYm9scyBhcmUgb3ZlcndyaXR0ZW4gYnkga3Nw
bGljZSBpcyBmZXcgaW4gYSBzeXN0ZW0/ICBzbyBJJ20gb2sgd2l0aCANCnRoaXMgYXBwcm9hY2gu
DQoNCkkgd2FzIHRoaW5raW5nIGFib3V0IGNvbnRpbnVpbmcgaGVyZSAobm90IGFib3J0KSBpZiBp
dCdzIG5vdCANCklOX01PRFVMRShuYW1lLCBsbSkgYW5kIHVzaW5nIHN0cmJ1ZiBvbmx5IGZvciBz
dHJpbmdzIGluIHRoZSBtb2R1bGUuIA0KYnV0IG1heWJlIHdlIGRvbid0IG5lZWQgdG8gZG8gc3Vj
aCBlZmZvcnQgaWYgdGhlIG51bWJlciBpcyBmZXcuICBBbHNvIGl0IA0Kd2lsbCBtYWtlIHN0b3Jl
X21vZHVsZV9zeW1ib2xzXzZfNCgpIGEgYml0IGNvbmZ1c2luZywgc28gaXQgbWlnaHQgYmUgDQpv
dmVya2lsbC4NCg0KPiANCj4gSSB3aWxsIHNlbmQgYW4gdXBkYXRlZCBwYXRjaCBpZiB5b3UgbGlr
ZSB0aGlzIGFwcHJvYWNoLg0KDQpQbGVhc2UgZ28gYWhlYWQsIEkgdGhpbmsgeW91IGNhbiB1c2Ug
SU5fTU9EVUxFKCkuDQoNClRoYW5rcywNCkthenU=
