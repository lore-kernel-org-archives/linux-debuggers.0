Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69097381C4
	for <linux-debuggers@vger.kernel.org>; Tue, 17 Feb 2026 22:35:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771367745; cv=none; b=Kw2YAwIXkovKv3n6EhZPzs9uccuxV8XLtyOf8i4gwCV9yXEXxWIOh5AWsCtFiYMWEBNJ/eOX8cKRaiyOJO0CVi4D80YUE6alRMuI+w9yToKG7lfZLCzgGMJnnQscyF7/xNmD2WCInFPL/cfRgE05q/DUQG1W5zmfTzE9Sp9R0Rc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771367745; c=relaxed/simple;
	bh=4PRBnfJwMBbVYlxBzMtC6+d8qECtQSu43/i5to2yG/4=;
	h=Date:From:To:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JNfSjA1e75k13wvSRjsNz6xQVF1BdGQCzy67ErmmNOwoLH0k6CXqwsvi+3nE2oq1i9cuyzmfARhfjBeNtbucua5BD3Q8Z3FESPJm4atrAGeMo2X0vMx+Zbb49csltJs5Y40iompfAxU2OeCqiYPtRt9eolg36Ed9uITrcDeWPGM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com; spf=none smtp.mailfrom=osandov.com; dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b=Kdqdr8W/; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=osandov.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=osandov.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=osandov-com.20230601.gappssmtp.com header.i=@osandov-com.20230601.gappssmtp.com header.b="Kdqdr8W/"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c635d5d594dso606882a12.2
        for <linux-debuggers@vger.kernel.org>; Tue, 17 Feb 2026 14:35:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=osandov-com.20230601.gappssmtp.com; s=20230601; t=1771367743; x=1771972543; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4PRBnfJwMBbVYlxBzMtC6+d8qECtQSu43/i5to2yG/4=;
        b=Kdqdr8W/81CP18Qev8Ifxl+kMjTIcs48ET8nu18Efmgutav6qAL3LLOBZhknZeGXm9
         bfVyE+wQ9HoAkXcTmRoyt/m5qCaLi3RW2JiJLJZ8ztH0mJk7Dklj80RokLBy2ELqSwNV
         eFNB641jHC5+Srg11NRluMurcqm5DdgpKF5G7oVK6PwUciOCDE4c+Sxbo+/ZtBmi/R1M
         EFfY9Fh4BjGp2kkznB5YGxqtSq6Pi81CkouaV5aSYECAdBjyXO5cn0mXWanbxGz2Xm7q
         5jN2hMFSB3nxvCscKbdhyf9/mBCksPhndroGzjN8zEr9E4j95xz2I95dpzNn8bNaYsLP
         0mkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771367743; x=1771972543;
        h=content-disposition:mime-version:message-id:subject:to:from:date
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4PRBnfJwMBbVYlxBzMtC6+d8qECtQSu43/i5to2yG/4=;
        b=LxUCWWvI/rKq7mImAnYUKN9ra8nB0H4iPdmrePmLbDoAx1C38IER4q08+BE8Bp7Mq1
         zyBeoMI5ZuF6LeTS+2L6xrtevEXuJHzxfUel/IhLToD0ZjaawUGrcD4eQ9c8Lu5JmCxd
         eDqcLXBSynvwlyod1s57mgEIzOgv7hUZwqna9a9DgKxYv8D1yWOXrLaLZmCfOOiYwc/V
         yjvSYmtm82yHu/whEtTWvod/39E2d6LADifCSzGUmn3KTlvaYLuNc2ahq1hY3BhLi8e9
         gN0u8N0DhC3tAzj+oA+4LOClD6cNgL9Q/9MbtLJZUqD0FN5emQa1ru2G9X5m1r+fBpZg
         thJg==
X-Gm-Message-State: AOJu0YyJ4EYrYLrhUdZfa+q1QCsAeyvdLL/AKce+2qImty1PiDNAouwl
	lfv2uaFbk2OhjQ77kKTmH0wXKKYoigZ/9dVVHOnemG8m+r7hpwXB3df3Sg9DFGyAPtFUrglc5RP
	vdz1l
X-Gm-Gg: AZuq6aJS1fOOsxSVGzy+v61A32dtdyU2/ShnaICdFYP/UwwmN/vyuHZfquyNOzRK2Qn
	Uar2YSZ8Hr2RatgvL8XPRaIrzJkt++RT0Bx6UOJVQnPOZha3npQNW1+UKkZXHwVUZRTRulcq5j/
	ECtXeEeiJjDenRXh+dzRWEeg3yiAxuuh9hKmQXA3SQHOVljd8QOxJC7jyu7pcNMoEhPr5g3hs5n
	GlBiGQ6awPDUef+BvovM0KCOUa1q/9/ZHavP0Os1DljpgM7luHw7DZcZXAjAASh/Zcc7G6/dTN+
	Ya9u548w40Z3yAsPD+Jo7rC+kYGuV6JScUAT3jazybLMAA01gET9H0hEDDlg4zVycoGXLV/L3Ol
	dox4T//qxCYK9L56qGht5fa92FVilPcqbdbMYf3LyUkXAwDBA9WYm07cH8Nz3afbhK4gTijjAGU
	yxjdJxm/2CkVNufVvKU/BHkgYJ3QxUNGUB+cqeqU47aUcZKWkkDre+JhMihEb26NwUie4G9JA9m
	M9HvPLcpdUVasX8PoisF2ZV4wU18Q==
X-Received: by 2002:a05:6a20:1595:b0:38e:9479:8a4e with SMTP id adf61e73a8af0-39467263e6amr10265229637.4.1771367743353;
        Tue, 17 Feb 2026 14:35:43 -0800 (PST)
Received: from telecaster (c-67-185-21-237.hsd1.wa.comcast.net. [67.185.21.237])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c6e5332e0d1sm10702913a12.31.2026.02.17.14.35.42
        for <linux-debuggers@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Feb 2026 14:35:42 -0800 (PST)
Date: Tue, 17 Feb 2026 14:35:42 -0800
From: Omar Sandoval <osandov@osandov.com>
To: linux-debuggers@vger.kernel.org
Subject: Linux Kernel Debugging Tools Monthly Meeting on Wednesday, February
 18th
Message-ID: <aZTtPsRAMVd_6umd@telecaster>
Precedence: bulk
X-Mailing-List: linux-debuggers@vger.kernel.org
List-Id: <linux-debuggers.vger.kernel.org>
List-Subscribe: <mailto:linux-debuggers+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-debuggers+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The next Linux Kernel Debugging Tools meeting is this Wednesday,
February 18th at 11:30 AM Pacific time. This meeting is a forum to
discuss development of Linux kernel debugging tools like drgn, crash,
and more.

Here is the agenda so far:

- drgn release this week.

Reminder: I will be out of the office from February 23-March 27.

Please reply with anything else you'd like to add. As always, if you
would like to attend, please email me offlist.

Thanks!
Omar
