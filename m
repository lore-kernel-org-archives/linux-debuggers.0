Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B0B47010D
	for <linux-debuggers@vger.kernel.org>; Fri, 14 Aug 2026 13:27:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786714040; cv=none; b=KPEQU9nwZ0Evi2/MMRNmK/JFPGfUvUXp3mXZ+6AJMHxOWf0Iv9CrkaWhJPNupBV4k2LSO2P01RBHq9WSykKK5m/fsCu9uKN/AC0A3csCddbiaKP+hkFeoxKzCxwzoH6XvddvJjissGu861Z38izKTO5PxOs6DwpMJo4b2gpBSHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786714040; c=relaxed/simple;
	bh=CChEzwWKHqvAbDe82pqB+EpRVBOCxUp7FVLoHlKhGNU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SSrO4lXU5pDOJt2946uaFyBE6h5FjYLaO6BHDZbQXoQTlq4x1jQzmnN7mI8a7RpmJ2Iw79c5Zdomz1rWTQBhai+Dk6PUqXq5rQqj6FAv7ocFM8/CoCusR1+MS7k1pyc6WZmlMW0agR4xlk3j4sTP6euNR4qZ4zQEkxTXA9qxaYo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=TCpeiH/x; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="TCpeiH/x"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-66b13ee8801so1346296d50.1
        for <linux-debuggers@vger.kernel.org>; Fri, 14 Aug 2026 06:27:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1786714037; x=1787318837; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=n4ArN/eG59F6/a+Z1l3n9inh5iDgTQHyg71JvETU2wM=;
        b=TCpeiH/xCWeDcYJotQrUKR+96UF0MG/Njhh1rbUlHRGBrpdQAImKs6oRWI41Q8Eczj
         +mTDkleatlsNeXhOUaGWaFyd3U50OBJvlvu77XCYcYzSq7ARn4Or8iIhiP8w6JBZAK8W
         oAd1trrpj6Ef0CklV1H2zSfBzIviHXmk2sB71HcaujcqJrFDI2zHP23dmMR4YDojp+3v
         GBSdAv+vPbaIHQHbjNZQzTtWNO8h2nh2HWBKxy6PVDPoHfw/brhOp2p2xqx48wXcX9eT
         697sKEtDAhvD4AyqB7mtbV3UuRSbV7yerIPuq30uagL3Wo2jyOy2OULMcp8X/mprik3I
         2+ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786714037; x=1787318837;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=n4ArN/eG59F6/a+Z1l3n9inh5iDgTQHyg71JvETU2wM=;
        b=NW8s863HRa0zM7yj/H2Bbw5TMajuMtL0+h5YvCdXQfiKdRsulzCD05AyCqRMhIjXDB
         R5l+Z8z0WtFnHHQdGZ49vVufzd9QQ8e638gmah9Y/c3momPTCz+8JBQ6zkJx+5kHUn5p
         XQ5SjlK/cWzswGkRzWp6NCpnx5JPD6loXNtZEZw7jLuwY19OFhf90ODB6hNyOUCqX69t
         EcUVEpKQ/bqXLDESGg1ASkhTjmCuN87tGR0gUjIxTMwlQxAK4mXG1z4SPc0W/2agCiBG
         bYCver/p3Xb6STOzQd65ozokmwDR8c03fywgi+uW4Yb7Yk2ZRdc4k8uyYxdS7Q75umn5
         YBMQ==
X-Forwarded-Encrypted: i=1; AHgh+RrjNufIlJ9fyPq61GUzSJlLuBwD1++J39JwTeRQSvn6eCHGmfHtO0YNrPV0YAsfsNJIaDgUtyesfR0WxqPfKRw=@vger.kernel.org
X-Gm-Message-State: AOJu0YwvAJYGnVvZjYff69G3BGfY3iSHv89cfNLi3N+Fh2mkO+HAjmD1
	neixSW1GsA8hm7AQdTIuaDNz2Ww7m1WpEeDikWVlhtZMreAv+KSFkiLeqwcDE6BLTsw=
X-Gm-Gg: AR+sD12bRk0bchYtF6xrIi8BapKhw3DTCja3Iz/pG1mMapfBUj7Se9G/rsFVwhIo0RC
	zdVJr3Dqqbh2XsOaOI67Rg98wjeyu8iCcQ2NwubBNwSvHPmwmMWyOGKKUP8QhtThH1vqXJ5jGSb
	N6c1PxfRyAg5GfBEXW7AwZ8HcjKiNM5MmFInD21R2T/9wqteIumq8qNbwQnCelivWnm9FYIf1Af
	3zmegd/9+hzxfIF01Cy3lKLiS+9Txs4RmzifXcCfgeLiYs6ZtDS2RV8u9RES8UncthKuE9Y18PK
	ghsoSVCBBbnK/Hz7k0V76nHyut/hRIYoi5X5sMkETTFHQuJKNqZnBv8AsSvntrYKVG8zoSuLYQp
	VTzBfXk94Hx/npw0zDYi1uh6iiRKR8K4v2EGihwO/cZ97QG6ektaPfqnS8dTW2AUtWdiBjuSLuq
	ld6suFPRlG7gpHuJM2frpDhSmC6jdMNNKniXU=
X-Received: by 2002:a53:c584:0:b0:66a:3662:409f with SMTP id 956f58d0204a3-66c72ba0d10mr1917799d50.10.1786714036424;
        Fri, 14 Aug 2026 06:27:16 -0700 (PDT)
Received: from fedora ([2601:19e:8500:d3c0::28fe])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-66c75c9d90bsm1010793d50.8.2026.08.14.06.27.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Aug 2026 06:27:15 -0700 (PDT)
Date: Fri, 14 Aug 2026 09:27:09 -0400
From: Gregory Price <gourry@gourry.net>
To: Pankaj Gupta <pankaj.gupta.linux@gmail.com>
Cc: linux-mm@kvack.org, Zhigang.Luo@amd.com, arun.george@samsung.com,
	balbirs@nvidia.com, brendan.jackman@linux.dev, yuzenghui@huawei.com,
	apopple@nvidia.com, alucerop@amd.com, matthew.brost@intel.com,
	akpm@linux-foundation.org, david@kernel.org, ljs@kernel.org,
	liam@infradead.org, vbabka@kernel.org, rppt@kernel.org,
	surenb@google.com, mhocko@suse.com, corbet@lwn.net,
	skhan@linuxfoundation.org, gregkh@linuxfoundation.org,
	rafael@kernel.org, dakr@kernel.org, djbw@kernel.org,
	"Gupta, Pankaj" <pankaj.gupta@amd.com>, vishal.l.verma@intel.com,
	dave.jiang@intel.com, alison.schofield@intel.com,
	osandov@osandov.com, jannh@google.com, pfalcato@suse.de,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	pbonzini@redhat.com, osalvador@suse.de, joshua.hahnjy@gmail.com,
	rakie.kim@sk.com, byungchul@sk.com, ying.huang@linux.alibaba.com,
	kasong@tencent.com, qi.zheng@linux.dev, shakeel.butt@linux.dev,
	baohua@kernel.org, axelrasmussen@google.com, yuanchu@google.com,
	weixugc@google.com, yury.norov@gmail.com, linux@rasmusvillemoes.dk,
	longman@redhat.com, ridong.chen@linux.dev, tj@kernel.org,
	mkoutny@suse.com, sj@kernel.org, jgg@ziepe.ca, jhubbard@nvidia.com,
	peterx@redhat.com, baolin.wang@linux.alibaba.com, npache@redhat.com,
	ryan.roberts@arm.com, dev.jain@arm.com, lance.yang@linux.dev,
	usama.arif@linux.dev, xu.xin16@zte.com.cn, chengming.zhou@linux.dev,
	roman.gushchin@linux.dev, muchun.song@linux.dev,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	driver-core@lists.linux.dev, nvdimm@lists.linux.dev,
	linux-cxl@vger.kernel.org, linux-debuggers@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kvm@vger.kernel.org,
	cgroups@vger.kernel.org, damon@lists.linux.dev,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH v5 00/36] Private Memory NUMA Nodes
Message-ID: <an8Xrb5Phmvs0xE4@fedora>
References: <20260720193431.3841992-1-gourry@gourry.net>
 <CAM9Jb+jpJ-Ui4qDHxsp2WiERiv8gmrQfKQ8Z0BmabefeQ6pg4A@mail.gmail.com>
 <an0cAMh_m8ZhGIm2@fedora>
 <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAM9Jb+jmxPdL-CdWQHYMT5G=qmjB6z2WFg+4K8Fod5n=2N6YCQ@mail.gmail.com>

On Thu, Aug 13, 2026 at 10:55:13AM +0200, Pankaj Gupta wrote:
> >
> > A device driver could very well just call memory-hotplug directly,
> > or its memory could be brought up as a private node via a boot
> > paremeter (which I have sculpted for v7).  The former is preferred,
> > but there's a bit of a chicken/egg scenario for bootstrapping.
> 
> I find this interesting as this appears to be evolving towards a vendor
> agnostic framework for hotplugging memory directly to private nodes.
> 

Agnostic would depend on a common standard for such devices.  Otherwise,
there is still a need for per-device drivers - but hopefully the
interaction itself can be generalized.

> How you see this working? In particular, How would the kernel know which
> memory ranges correspond to HBM or other device memory?
> 

Device marks the region reserved at boot, driver hotplugs.

or

Device marks the region normal, but boot param sets the node private.

> Please also CC me when you post v7: pankaj.gupta@amd.com
>

Sure

~Gregory
