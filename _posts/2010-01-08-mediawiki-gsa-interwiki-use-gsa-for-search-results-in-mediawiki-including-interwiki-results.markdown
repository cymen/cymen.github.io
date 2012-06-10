---
date: '2010-01-08 14:01:30'
layout: post
slug: mediawiki-gsa-interwiki-use-gsa-for-search-results-in-mediawiki-including-interwiki-results
status: publish
title: 'mediawiki-gsa-interwiki: Use GSA for search results in Mediawiki including
  Interwiki results'
wordpress_id: '110'
categories:
- Mediawiki
tags:
- Mediawiki gsa google search appliance interwiki wiki
---

I've released [mediawiki-gsa-interwiki](http://code.google.com/p/mediawiki-gsa-interwiki/) which is based on [mediawiki-gsa-engine](http://code.google.com/p/mediawiki-gsa-engine/) but adds support for results from multiple local wikis by hooking into the interwiki part of the Mediawiki search classes. This is useful for those that have multiple Mediawiki installations indexed by a Google Search Appliance (GSA) and want the search results for the current wiki to be results from the current wiki but also have a sidebar with results from other local wikis. Not a huge market there but useful all the same for those that need it. There are some other subtle changes documented at the project site.
