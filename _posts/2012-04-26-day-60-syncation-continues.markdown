---
date: '2012-04-26 20:50:16'
layout: post
slug: day-60-syncation-continues
status: publish
title: 'Day 60: syncation continues'
wordpress_id: '694'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of [a series about my experience at 8th light as an apprentice](http://blog.cymen.org/category/8th-light/apprentice/).



Today I paired with Mark to finish up the work on syncing (really a one way pull) of some data from one system to another system. It was mostly straight forward however we ran into some odd bugs and learned that .to_json takes a :method argument that specifies what methods should be run on the object being converted to JSON. Otherwise it ignores those methods and you get nil values which isn't fun at all. Thanks to Kevin for pointing that out to us!
