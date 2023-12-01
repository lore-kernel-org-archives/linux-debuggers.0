Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=nec.com header.i=@nec.com header.b="AD65lP/4"
Received: from JPN01-TYC-obe.outbound.protection.outlook.com (mail-tycjpn01on2064.outbound.protection.outlook.com [40.107.114.64])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E260B1703
	for <linux-debuggers@vger.kernel.org>; Thu, 30 Nov 2023 22:20:34 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=X60AIagMHzUUtq77kfJxRG+dK46DyWJfkoaLlDBo1Iow22TiHtFD5sXobvnzW7iOeEXAiTO2OpqA0jACfnOwP4djGRXEtO1bohjXcvEQxdoSXy8dzPUWMnIBfj/yhgcyL93vFl+mOTIRX1GxROj4oCOFjS4N20CXXTTk5OVfDlfL09zCn4zoVjxor3VeKMqUjIMNW7DWEzKJpLqaaQdVHJg/D8Wiq6dLX8CSTgCnL/SUCOjQtdUJrrA/HwdyvUg++YyhfgKTatst8teI8kqxt61j7Fxm7obGv9yuOVdPuUyaVQ9fHeSLBP+7E2NcRPGo2LeW/IX0jZf1X/GMa+V9ZQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=EGfftgJkN0CYSk/7QtdHsRTuXcHcCUNXTG70EnvqD9w=;
 b=OE+hFt5S6h6ZipOxeyabL3kmntmdv66othI4xjPi3/vsVhrPKLXYGMppp66YNdttfEV5479ahS3jqWTG10LGMb39RgoXH+gZZRJlIqEyK0QwB6nrFza6iZd/tMNR58tcwGJX6ca5JE11TUXxiX/Z4KhcKMWkpz/PT3rB7lsYXZG5/LpsgtjZXaQ8vI8LEscZ+CdACexG49mQkYvti7NszZsQDOV3Um3bUBtpmvHcbUMxkL/xtBvZB8Agi2O/LvQvemyu4bd1noYpzRvB5tnxvG3rcJ/2RDNX1Z85fgmwBpJmZxnhlG6cVv5gCTj9Fppmi6WLZS97mvDZp2sjPb6bXQ==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=nec.com; dmarc=pass action=none header.from=nec.com; dkim=pass
 header.d=nec.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nec.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=EGfftgJkN0CYSk/7QtdHsRTuXcHcCUNXTG70EnvqD9w=;
 b=AD65lP/4LQ2mPDWCHUcLvwsdUbEHeiracxXtmrMnYE1S4JffS/SQsNYfH8CtstuH5kcyyZMBPlUnHVZwRVyn5h9NSLeoLoVeBY0pNTCOVb0s5pAPjFMVRoTjam4lTQpKIfmyQ6Aqv3hmLcYzXCOSPrrKErq5VXfUcXkMP4pQZkM=
Received: from OS3PR01MB6776.jpnprd01.prod.outlook.com (2603:1096:604:126::6)
 by TYCPR01MB9289.jpnprd01.prod.outlook.com (2603:1096:400:195::12) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.7046.26; Fri, 1 Dec
 2023 06:20:31 +0000
Received: from OS3PR01MB6776.jpnprd01.prod.outlook.com
 ([fe80::b6d6:5ded:c1d9:5a4]) by OS3PR01MB6776.jpnprd01.prod.outlook.com
 ([fe80::b6d6:5ded:c1d9:5a4%7]) with mapi id 15.20.7046.027; Fri, 1 Dec 2023
 06:20:27 +0000
From: =?utf-8?B?SEFHSU8gS0FaVUhJVE8o6JCp5bC+44CA5LiA5LuBKQ==?=
	<k-hagio-ab@nec.com>
To: Stephen Brennan <stephen.s.brennan@oracle.com>,
	"devel@lists.crash-utility.osci.io" <devel@lists.crash-utility.osci.io>
CC: "linux-debuggers@vger.kernel.org" <linux-debuggers@vger.kernel.org>
Subject: Re: [Crash-utility] [PATCH] symbols: handle module symbols outside
 strbuf
Thread-Topic: [Crash-utility] [PATCH] symbols: handle module symbols outside
 strbuf
Thread-Index: AQHaIlbRyJb++rwM/km7Ch6Sf+vQ/rCT+EQA
Date: Fri, 1 Dec 2023 06:20:27 +0000
Message-ID: <0a214318-5bde-a495-9d19-356c5dc8c63d@nec.com>
References: <20231128145723.689860-1-stephen.s.brennan@oracle.com>
In-Reply-To: <20231128145723.689860-1-stephen.s.brennan@oracle.com>
Accept-Language: ja-JP, en-US
Content-Language: en-US
X-MS-Has-Attach:
X-MS-TNEF-Correlator:
authentication-results: dkim=none (message not signed)
 header.d=none;dmarc=none action=none header.from=nec.com;
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: OS3PR01MB6776:EE_|TYCPR01MB9289:EE_
x-ms-office365-filtering-correlation-id: 43e36d3a-abaf-4af2-e4f5-08dbf2359c70
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info:
 wObA9zHd+/+Bm7GVecQAMTd242ue99JzxsxshTGQ0ulWYNwWqnlO3g7u59xCqEeF1GU/rd2HmYwqS3/PvHgf5KoEa0+VmEnqJyH2UiPwg6unqtwt6d0CfDFXA5Rhs2bx7Qsh/bNw1J6pnJDgY6sifeRpkZ2bbV3iB14IzaUGFOJBKmHzpF5HYck6FM8RKBgDsIMdJz4nJlMJUv2pGXeUxkugJ58BdRwm7V7+stUBTWBlYJl372UGdDtvpYkgB8URRJVzIohKu/Q//n+XEJAkNW8VKWCa9P9RTNU20duDXfi/tWIZBF9w8RKhS/7Y2dfiaTX3Po9RNC42F+AWOj1u/nND+UK0f3iC4hG6VAddljgVSXvW1lPFXLeLC9tXjo3htSPqmt343r9N++nN2KFcYgle2VVDeYNXRshrJHWjfghJQTaY2g69VudrSswj9et//B9OxbnqeVenk2rzhu6E8Oy8HWkEJyIifZ65p+6P9jEdW4rJAQqbWKGDJ7ui257TYIUUadUJqU54pa7hwd8YwAwn94+nm7fziyM7lUG8+8vpHKoaJ7muMFXte9Kt5Cc2U9PbCc9rlcRcSIMCm6d5sc2p6gmhL4RV6v6flSAkFp4qhBDgZxzXjUOcVxcK4QNIQOqSLwIJd3SuTGstkovBtQ==
x-forefront-antispam-report:
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:OS3PR01MB6776.jpnprd01.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230031)(366004)(376002)(136003)(39860400002)(346002)(396003)(230922051799003)(1800799012)(186009)(451199024)(64100799003)(83380400001)(82960400001)(38100700002)(26005)(2616005)(8936002)(86362001)(8676002)(6506007)(53546011)(55236004)(6512007)(31686004)(122000001)(478600001)(6486002)(71200400001)(91956017)(66556008)(66476007)(66446008)(64756008)(66946007)(76116006)(316002)(110136005)(85182001)(2906002)(41300700001)(38070700009)(36756003)(4326008)(31696002)(5660300002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0:
 =?utf-8?B?ejRxZnV1WWcyeWhXZkxCUHgvVkJraUsxc3hUNEpXMWx1THkzL0NZL2ExaWx2?=
 =?utf-8?B?bEtaZWcrOWxxekw0QVBoTjM5QVd3ei9hNkNrUmQ3YnJpUkgycmsrRzM5ajZZ?=
 =?utf-8?B?WGlmREM3TXpxMTdiMXJxK1M2aGdETGpBZkkyazR5bk9sdVZVenprQnZzbjdh?=
 =?utf-8?B?a21xNy9raHlNT1lWTXlLVmpsRnNBRi9Yd1c0SzgvMzIzWmRHei9NQ3g4aWlB?=
 =?utf-8?B?N3d6cjVUdWkyNksvVkNFN0hLVkpIb0haY3U5TFA0bFh5QUhaMmNnVHRHZkdy?=
 =?utf-8?B?T05lZitDd3VVNGhUWXl1Qkdka0o3MFFhRm9IL1hVY2hkTU56NjdabWdEdWs1?=
 =?utf-8?B?UTAwZHEvZ0VCeHJaajU1bWp1S29CVFl2ZEV3QWtGSnd4aGp2MnozRlIvQ2U3?=
 =?utf-8?B?dWVuLzI5VFg0WWhFYUVaeFZlNzJHNVgxK255UkpMNUt4K3lZU2pkWlBReEov?=
 =?utf-8?B?MmtTcjdJbEFoOG1IZlZnQTRFWFVqRXlZQTRMTSt6dFEzTXhGNGpka09iNnp1?=
 =?utf-8?B?aDFDa0xQL0ptci9UTjlJa2IxUkxkNXVoTVpNOTZlUGorckc1MkZNbFkrT1VF?=
 =?utf-8?B?dUJpbFZ3SENtSnVPeUxBWjNoUi9tMmNab2lSVXNhYmxyMjQrTVRQZnVSV3hN?=
 =?utf-8?B?M0w1cHRKUk51cWFIU2xaMXlSVmdFaVk2SFBEdlU2b0xHSE1HaGo1MmZIbjg2?=
 =?utf-8?B?WG9la0s4VHhiVXlkS1JDNTR1MVRoaG9tMTlZcHdFUEV3ZG9DWXRMYXFHY3lZ?=
 =?utf-8?B?ellndi9PbWhJb2tQVDVzdmc4VDUxZkd3blRPNnVyczZCM1NpNkQxVkg4WVJa?=
 =?utf-8?B?OUpHLzB1dzlRQ01GUi9mSkZJb2gyV1Mxc3grcXlnU2ViaGlYaW0vU3dhK3NK?=
 =?utf-8?B?TDhqSVBvVURlRzlyTU0xZ2xuZGV1VHdDUGttUzYxSVRBVzJXMXdCZzl2dHFs?=
 =?utf-8?B?NXhsYXBVeE1LaEpjVzZDVlMwWWVpRktPYVdZN3ZXVkNoaXFIY0wyNzhoZE1S?=
 =?utf-8?B?bWRvUGpjOWZPVGN6dWg4SDljcDk3cTU2c3I5VS9ObmhLL3FZdVIrYitOODVV?=
 =?utf-8?B?TDQ5ZmpXWDBBbmNOTDNDaFBHZ1VhbC9jTldlQ3NYRC9JeXIzalhBMGN4SHRI?=
 =?utf-8?B?R1BzaUdXMEx6aU9rUzJCZGVjUVVmT3FSdit6b3dIbkFVenB3c2trSitXYmI2?=
 =?utf-8?B?WHZiSWlJaC8wVGFDSmFxQ1BsMEJOQk1YeE9xNGFUU3gybTJkckZtMXFkaFl5?=
 =?utf-8?B?cXNyU2psaTZJRWo5NmdSaEoweVk3NmtrM0FrR3RacnF2WFRNMXBWSXZPSGI3?=
 =?utf-8?B?MFU3bUJ5UE9jZHBPa25PdkVCNzduRXowbXlZOWtPSElZdVZmem1xVnVaM2NJ?=
 =?utf-8?B?dEsvT0JUTzBTaHlnY3VqRjhVRXltQlNuSWY3SnlTZWZncGV5UFZ4RkFpUWRH?=
 =?utf-8?B?OUYxY0E2cCtZcS8wK2h6THRMVGowMnFOUTVtYjRIWFFyZkYwZGRoMmhOVlgr?=
 =?utf-8?B?NUpNM0JmTUo4NG5nRWsxbjFRbS9NeHd4N1MyOERwejdrdDU2Z1BrOEdadC8v?=
 =?utf-8?B?dEtMSUt2Z21FVFAybk5LcmY4NE9GelBBSGJ2Y0lsMlRIZ2krRXhIMzFYVGlR?=
 =?utf-8?B?MTg2UlppVm8vNnVadGY4WjRQc3UvR1pkVzRpRm9BTEZOcUJTVzhjY1B6dzk5?=
 =?utf-8?B?KytYdS8xVm5NelU4Szh6cmNmRkN1WVlLMWJ5Q3ZkQVdMRC9Gc1UzZ3ZJLzBr?=
 =?utf-8?B?YlNWRm1objJxWmwwN3pVcjk3S3FvRXlVUnZmL2tjSFE4K0Z5VWJQeExIOGdy?=
 =?utf-8?B?aXpha0R6U0JaSWhhZWFYdHpPNVpOR2dtekg5UWx6VnBVeWp1WVpHZ0lyOUlm?=
 =?utf-8?B?YmU1MEhzWXMwSW5hMExWMnZRN0wvWm5lZGY5UW0vRDlOek93UWJVaG55SlZv?=
 =?utf-8?B?ZWpST0o4WXI2L3RPcStZMndLUVcxdDkvL0dnQnBmUTkzMHRVRldjUW56M0Qx?=
 =?utf-8?B?N0RoZVlkMCtyUDZHTHFsK1krbklITkJTVVFwcFV6dU85dWFYKzBsWG9oYjE1?=
 =?utf-8?B?SVNzYTNXYUZKS1orS1dnS3Q4cW83SHhnQjZoeFRNcitoRDlaalM4OUFjU2o3?=
 =?utf-8?Q?AWTOAJ8UULaBW4M8UWpt60HUb?=
Content-Type: text/plain; charset="utf-8"
Content-ID: <CF7BFC2FD38CD048AC27BF97821D696C@jpnprd01.prod.outlook.com>
Content-Transfer-Encoding: base64
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-OriginatorOrg: nec.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: OS3PR01MB6776.jpnprd01.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 43e36d3a-abaf-4af2-e4f5-08dbf2359c70
X-MS-Exchange-CrossTenant-originalarrivaltime: 01 Dec 2023 06:20:27.4741
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: e67df547-9d0d-4f4d-9161-51c6ed1f7d11
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: EYpuwpDUGi9Q5ZMmDJMPYsmLNxsa2S2sT12EogAyBUAH2HymiOLiMAvvuMTZS18euy342BLyxRnnKucyDcfMLQ==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: TYCPR01MB9289

T24gMjAyMy8xMS8yOCAyMzo1NywgU3RlcGhlbiBCcmVubmFuIHdyb3RlOg0KPiBNb2R1bGUgc3lt
Ym9sIG5hbWVzIGNhbiBnZXQgb3ZlcndyaXR0ZW4gYnkgbGl2ZSBwYXRjaGVzIG9yIGtzcGxpY2Ug
aW4NCj4gb2RkIGNvcm5lciBjYXNlcywgc28gdGhhdCB0aGUgcG9pbnRlciBubyBsb25nZXIgcG9p
bnRzIHdpdGhpbiB0aGUgc3RyaW5nDQo+IGJ1ZmZlci4gR3JhY2VmdWxseSBmYWxsYmFjayB0byBy
ZWFkaW5nIHRoZSBzdHJpbmcgZGlyZWN0bHkgZnJvbSB0aGUNCj4ga2VybmVsIGltYWdlIGluIHRo
ZXNlIGNhc2VzLCB0byBhdm9pZCBwb3NzaWJsZSBzZWdtZW50YXRpb24gZmF1bHRzDQo+IHJlYWRp
bmcgb3V0c2lkZSB0aGUgYm91bmRzIG9mIHN0cmJ1Zi4NCj4gDQo+IFNpZ25lZC1vZmYtYnk6IFN0
ZXBoZW4gQnJlbm5hbiA8c3RlcGhlbi5zLmJyZW5uYW5Ab3JhY2xlLmNvbT4NCj4gLS0tDQo+IA0K
PiBIaSBmb2xrcyAtIEkgZW5jb3VudGVyZWQgYSBzZWdmYXVsdCBvbiBhIHZtY29yZSB3aGljaCBo
YWQgYSBtb2R1bGUNCj4gc3ltYm9sIHRoYXQgaGFkIGdvdHRlbiBpdHMgbmFtZSBvdmVyd3JpdHRl
biBieSBhIGtzcGxpY2UgKGxpdmUgcGF0Y2gpLg0KPiBJdCBzZWVtcyBsaWtlIHRoZXJlJ3Mgbm90
IGEgZ3VhcmFudGVlIHRoYXQgbW9kdWxlIHN5bWJvbCBuYW1lcyBfbXVzdF8NCj4gbGl2ZSB3aXRo
aW4gdGhlIHNhbWUgc3ltYm9sIGJ1ZmZlciwgYW5kIHRoZXJlIGlzIGV2ZW4gbG9naWMgdG8gcHJl
dmVudA0KPiByZWFkaW5nIHRvbyBtdWNoIGRhdGEgaW50byBzdHJidWYgaW4gdGhvc2UgY2FzZXMu
DQoNClRoYW5rIHlvdSBmb3IgdGhlIHJlcG9ydCBhbmQgcGF0Y2guDQoNClRvIG1lLCBpdCBzZWVt
cyBsaWtlIHRoZSBsb2dpYyBpcyBqdXN0IHRvIGNhcCB0aGUgYnVmZmVyIHNpemUgYmVjYXVzZSBv
ZiANCmFkZGluZyBCVUZTSVpFLg0KDQpJZiAibGFzdCIgaXMgb3V0c2lkZSBvZiBhIG1vZHVsZSBy
YW5nZSwgeW91ciBwYXRjaCBjYW4gZml4IGl0LiAgQnV0IGlmIA0KImZpcnN0IiBpcyBmYXIgb3V0
c2lkZSAobG93ZXIpIG9mIHRoZSBtb2R1bGUgcmFuZ2UsIHN0cmJ1ZmxlbiBiZWNvbWVzIA0KaHVn
ZSBhbmQgY3Jhc2ggdHJpZXMgdG8gYWxsb2NhdGUgYSBodWdlIG1lbW9yeT8gIElzIGl0IHBvc3Np
YmxlIGJ5IGtzcGxpY2U/DQoNClRoYW5rcywNCkthenUNCg0KDQo+IA0KPiBUaGlzIHBhdGNoIHNp
bXBseSBlbnN1cmVzIHRoYXQgc3ltYm9sIG5hbWVzIHdoaWNoIHN0YXJ0IG91dHNpZGUgb2YgdGhl
DQo+IHN0cmJ1ZiB3aGljaCB3ZSBjb3BpZWQsIGFyZSByZWFkIGRpcmVjdGx5IGZyb20gdGhlIGtl
cm5lbCBpbWFnZSwgcmF0aGVyDQo+IHRoYW4gaW5kZXhpbmcgcGFzdCB0aGUgYm91bmRzIG9mIHN0
cmJ1Zi4gSSBlbmNvdW50ZXJlZCB0aGlzIGluDQo+IHN0b3JlX21vZHVsZV9zeW1ib2xzX3YyKCkg
YW5kIGhhdmUgdGVzdGVkIGl0IHRoZXJlLCBidXQgSSByZXBsaWNhdGVkIHRoZQ0KPiBjb2RlIHRv
IHRoZSBvdGhlciB2ZXJzaW9ucy4gSSB3aWxsIHRyeSB0byB0ZXN0IGl0IG91dCBvbiB0aGUgb3Ro
ZXINCj4gdmFyaWFudHMgYXMgd2VsbCwgYnV0IEkgdGhvdWdodCBJJ2Qgc2hhcmUgdGhlIHBhdGNo
IG5vdy4NCj4gDQo+ICAgc3ltYm9scy5jIHwgMTAgKysrKystLS0tLQ0KPiAgIDEgZmlsZSBjaGFu
Z2VkLCA1IGluc2VydGlvbnMoKyksIDUgZGVsZXRpb25zKC0pDQo+IA0KPiBkaWZmIC0tZ2l0IGEv
c3ltYm9scy5jIGIvc3ltYm9scy5jDQo+IGluZGV4IDE3NmM5NTAuLmU3MGRkNjkgMTAwNjQ0DQo+
IC0tLSBhL3N5bWJvbHMuYw0KPiArKysgYi9zeW1ib2xzLmMNCj4gQEAgLTE3MDQsNyArMTcwNCw3
IEBAIHN0b3JlX21vZHVsZV9zeW1ib2xzX3YxKHVsb25nIHRvdGFsLCBpbnQgbW9kc19pbnN0YWxs
ZWQpDQo+ICAgDQo+ICAgCQkJQlpFUk8oYnVmMSwgQlVGU0laRSk7DQo+ICAgDQo+IC0JCQlpZiAo
c3RyYnVmKQ0KPiArCQkJaWYgKHN0cmJ1ZiAmJiAodW5zaWduZWQgbG9uZyltb2RzeW0tPm5hbWUg
LSBmaXJzdCA8IHN0cmJ1ZmxlbikNCj4gICAJCQkJc3RyY3B5KGJ1ZjEsDQo+ICAgCQkJCQkmc3Ry
YnVmWyh1bG9uZyltb2RzeW0tPm5hbWUgLSBmaXJzdF0pOw0KPiAgIAkJCWVsc2UNCj4gQEAgLTIw
ODAsNyArMjA4MCw3IEBAIHN0b3JlX21vZHVsZV9zeW1ib2xzXzZfNCh1bG9uZyB0b3RhbCwgaW50
IG1vZHNfaW5zdGFsbGVkKQ0KPiAgIA0KPiAgIAkJCUJaRVJPKGJ1ZjEsIEJVRlNJWkUpOw0KPiAg
IA0KPiAtCQkJaWYgKHN0cmJ1ZikNCj4gKwkJCWlmIChzdHJidWYgJiYgbW9kc3ltX25hbWUoc3lt
cywgbW9kc3ltLCBpKSAtIGZpcnN0IDwgc3RyYnVmbGVuKQ0KPiAgIAkJCQlzdHJjcHkoYnVmMSwg
JnN0cmJ1Zlttb2RzeW1fbmFtZShzeW1zLCBtb2RzeW0sIGkpIC0gZmlyc3RdKTsNCj4gICAJCQll
bHNlDQo+ICAgCQkJCXJlYWRfc3RyaW5nKG1vZHN5bV9uYW1lKHN5bXMsIG1vZHN5bSwgaSksIGJ1
ZjEsIEJVRlNJWkUtMSk7DQo+IEBAIC0yMTQ4LDcgKzIxNDgsNyBAQCBzdG9yZV9tb2R1bGVfc3lt
Ym9sc182XzQodWxvbmcgdG90YWwsIGludCBtb2RzX2luc3RhbGxlZCkNCj4gICANCj4gICAJCQlC
WkVSTyhidWYxLCBCVUZTSVpFKTsNCj4gICANCj4gLQkJCWlmIChzdHJidWYpDQo+ICsJCQlpZiAo
c3RyYnVmICYmIG1vZHN5bV9uYW1lKGdwbF9zeW1zLCBtb2RzeW0sIGkpIC0gZmlyc3QgPCBzdHJi
dWZsZW4pDQo+ICAgCQkJCXN0cmNweShidWYxLCAmc3RyYnVmW21vZHN5bV9uYW1lKGdwbF9zeW1z
LCBtb2RzeW0sIGkpIC0gZmlyc3RdKTsNCj4gICAJCQllbHNlDQo+ICAgCQkJCXJlYWRfc3RyaW5n
KG1vZHN5bV9uYW1lKGdwbF9zeW1zLCBtb2RzeW0sIGkpLCBidWYxLCBCVUZTSVpFLTEpOw0KPiBA
QCAtMjQ1Niw3ICsyNDU2LDcgQEAgc3RvcmVfbW9kdWxlX3N5bWJvbHNfdjIodWxvbmcgdG90YWws
IGludCBtb2RzX2luc3RhbGxlZCkNCj4gICANCj4gICAJCQlCWkVSTyhidWYxLCBCVUZTSVpFKTsN
Cj4gICANCj4gLQkJCWlmIChzdHJidWYpDQo+ICsJCQlpZiAoc3RyYnVmICYmIG1vZHN5bV9uYW1l
KHN5bXMsIG1vZHN5bSwgaSkgLSBmaXJzdCA8IHN0cmJ1ZmxlbikNCj4gICAJCQkJc3RyY3B5KGJ1
ZjEsDQo+ICAgCQkJCQkmc3RyYnVmW21vZHN5bV9uYW1lKHN5bXMsIG1vZHN5bSwgaSkgLSBmaXJz
dF0pOw0KPiAgIAkJCWVsc2UNCj4gQEAgLTI1MjksNyArMjUyOSw3IEBAIHN0b3JlX21vZHVsZV9z
eW1ib2xzX3YyKHVsb25nIHRvdGFsLCBpbnQgbW9kc19pbnN0YWxsZWQpDQo+ICAgDQo+ICAgCQkJ
QlpFUk8oYnVmMSwgQlVGU0laRSk7DQo+ICAgDQo+IC0JCQlpZiAoc3RyYnVmKQ0KPiArCQkJaWYg
KHN0cmJ1ZiAmJiBtb2RzeW1fbmFtZShncGxfc3ltcywgbW9kc3ltLCBpKSAtIGZpcnN0IDwgc3Ry
YnVmbGVuKQ0KPiAgIAkJCQlzdHJjcHkoYnVmMSwNCj4gICAJCQkJCSZzdHJidWZbbW9kc3ltX25h
bWUoZ3BsX3N5bXMsIG1vZHN5bSwgaSkgLSBmaXJzdF0pOw0KPiAgIAkJCWVsc2U=
