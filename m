Received: from cu-ua11p00im-quki07171502.ua.silu.net (cu-ua11p00im-quki07171502.ua.silu.net [123.126.78.69])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3A02014AA9
	for <linux-debuggers@vger.kernel.org>; Sat, 29 Mar 2025 04:19:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=123.126.78.69
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743221954; cv=none; b=hLO3OFAEj499l5GNk38fFK6DuANi9qIc5UrfwGkZknLpqDNGAy5/KdZeBafjsg97S8MGUOAQKBkzm+yJqSt+YSzjWO0Fa+BiUSIo72Ve09mFWrPpNw75kGW4+8DTI/5nRDJooY38cxIKFUDnTK1/KQU8kc16z5WiqKpoN0tJSjs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743221954; c=relaxed/simple;
	bh=7QumWroqtBo+uRbtJUJB3SvfoJVdUnKNvHNkqZh0j6w=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To; b=C7w0ZWbFdj2i5dSP6yG3ECkhdZ826erd2+SDatpcmU/oPt9RfZtNbG2eDv8naUqikuhQVCn23IIuokSuRwH1Qge4KTVtzaAitVIXT/rNw0dNJGckdNmTl1hQMYLqwEnWOkNFabLjC3iXZV8yGTtfmH7GIdvaZj0ePnb6qzc+BZM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=co0X5xEk; arc=none smtp.client-ip=123.126.78.69
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="co0X5xEk"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1ca1ba; t=1743221950;
	bh=7QumWroqtBo+uRbtJUJB3SvfoJVdUnKNvHNkqZh0j6w=;
	h=From:Content-Type:Mime-Version:Subject:Message-Id:Date:To;
	b=co0X5xEk/WV4ZHlrvCiWKKURRB7njtq1en6irt5EMLnuhA6obQzPqFMgmOkEvvD5Z
	 0ZQhRFqVbM9QfvHwJdU38mYQMW69A8XCtSLqPDsNevHQ216TFg9sxodrKcXuehYS6N
	 lkQgjJ8r0HV4Vy9a/sMTvUdL0lz0ibojMQ+KevNASDk25UeEDeSduNy/9OxMKqcB+y
	 SNXi73mMFT3alI6yqpBH7xU9lyB57fvLI7KTzirBLbP0e83bpNcPEn4rsS5YLdh7Li
	 4FbK0FTI6Ai/Vgg4wnWCLXJXdC0LxcDOmN1dLfpe0hWmI10XIvOxwS26hpar91aaSa
	 cAZFByrVRpCYw==
Received: from smtpclient.apple (ua11p00im-asmtpcmvip.ua.silu.net [112.19.242.76])
	by ua11p00im-quki07171502.ua.silu.net (Postfix) with ESMTPSA id AD4DA24C05C0
	for <linux-debuggers@vger.kernel.org>; Sat, 29 Mar 2025 04:19:09 +0000 (UTC)
From: Lee Haoran <foxlee810@icloud.com>
Content-Type: text/plain;
	charset=us-ascii
Content-Transfer-Encoding: 7bit
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3826.400.131.1.6\))
Subject: Subscribe linux debugger mail
Message-Id: <9B1229D7-53FC-4E7D-A9FD-BD00BA7AF5C0@icloud.com>
Date: Sat, 29 Mar 2025 12:18:59 +0800
To: linux-debuggers@vger.kernel.org
X-Mailer: Apple Mail (2.3826.400.131.1.6)
X-Proofpoint-ORIG-GUID: zSYITSR5Djtg1NNdSvBAh8QI2yBloafb
X-Proofpoint-GUID: zSYITSR5Djtg1NNdSvBAh8QI2yBloafb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-29_01,2025-03-27_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 mlxlogscore=422 adultscore=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 malwarescore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-ER-2407290000 definitions=main-2503290027

Subscribe linux debugger mail
