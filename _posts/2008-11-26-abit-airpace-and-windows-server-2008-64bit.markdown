---
date: '2008-11-26 00:49:36'
layout: post
slug: abit-airpace-and-windows-server-2008-64bit
status: publish
title: Abit Airpace and Windows Server 2008 64bit
wordpress_id: '30'
categories:
- Microsoft
tags:
- 64bit
- abit airpace
- drivers
- server 2008
- vista
- windows
---

To get the Abit Airpace wi-fi card to work with Windows Server 2008 64bit grab the generic Atheros drivers from with a file name similar to **vista-7.6.0.126-whql.zip**:

[http://www.atheros.cz/](http://www.atheros.cz/)

Then edit one of the two .inf files depending on:

32bit: netathr.inf
64bit: netathrx.inf

And add these two lines under [Atheros.NTX86] (or 64bit: [Atheros.NTamd64]):

<script src="https://gist.github.com/2904102.js">
</script>

Now reinstall the driver using the folder with the modified .inf file as the driver source. Note that these instructions will work for Windows Server 2008 32bit, Server 2008 64bit, Vista 32bit and Vista 64bit.

[vista-760126-whql-airpace](http://blog.cymen.org/wp-content/uploads/2008/11/vista-760126-whql-airpace.zip) (locally-hosted modified version to support Abit Airpace)
