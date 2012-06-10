---
date: '2009-06-30 10:58:16'
layout: post
slug: mediawiki-and-google-search-appliance-gsa
status: publish
title: MediaWiki and Google Search Appliance (GSA)
wordpress_id: '78'
categories:
- Google Search Appliance
- Mediawiki
---

The Google Search Appliance advertises via the Accept-Encoding part of the HTTP request header that it can handle gzip content. However, this does not appear to be the case with at least gzip-encoded content coming from MediaWiki.

The HTTP request header looks like this:
`
GET
HOST: www.xyz.com
ACCEPT: text/html,text/plain,application/*
FROM:
USER-AGENT: gsa-crawler (Enterprise; ... ; ...)
ACCEPT-ENCODING: gzip
`

The solution is to remove the gzip option from Accept-Encoding which can be done by:



	
  1. Go to GSA admin interface.

	
  2. Crawl and Index->HTTP Headers

	
  3. Set field **Additional HTTP Headers for Crawler** to `Accept-Encoding:`



The HTTP request header now looks like this:
`
GET
HOST: www.xyz.com
ACCEPT: text/html,text/plain,application/*
FROM:
USER-AGENT: gsa-crawler (Enterprise; ... ; ...)
ACCEPT-ENCODING:
`

Solution source: [A posting in the Google Search Appliance/Google Mini group](http://groups.google.com/group/Google-Search-Appliance-Help/browse_thread/thread/123115bac1e8c5d1/632734e187d9184b?lnk=gst&q=gzip#632734e187d9184b). I found that simply setting the field to "Accept-Encoding:" worked just fine -- no need to include "foo".
