---
date: '2012-05-17 09:06:59'
layout: post
slug: designing-a-bare-bones-cms-for-asp-net-mvc
status: publish
title: Designing a bare bones CMS for ASP.NET MVC
wordpress_id: '723'
---

At my prior position one of my ongoing tasks was to create a CMS on top of ASP.NET MVC. If you're not familiar with it, ASP.NET MVC is very similar to Ruby on Rails without the magic and without any prescribed data access method (so no equivalent to Active Record in the box).

Now an important point is that this was not the first CMS my employer had gone through the process of creating. They already had one that was created in ASP/ASP.NET. It had some performance issues. One of these was that the performance of the data access method via an ORM was not well understood or monitored by the developers. One day I dove into this issue and discovered two facts:



	
  1. Performance increases by adding indexes where appropriate based on analysis of the queries in the SQL Server engine were easy to obtain.

	
  2. There was a fatal performance flaw: the CMS concatenated keys and then did lookups or joins by parts of the concatenated key. So like a composite or compound key yet the key was actually stored as a key and queried upon as a whole targeting subsets of the key value!


It is almost impossible to optimize for the second issue. It didn't look like it would cause the websites to fall over but it did increase the load on the SQL server and increase latency in response. This was typically a negligible amount but once you had a handful or more of these sites hitting the same database and occasionally getting indexed by a search engine all bets were off.

Based on this experience, one of the requirements of my CMS was to be very very simple. So no ORM and no more complexity than necessary. These restrictions, particularly the ORM one, where often annoying however in the end I think the CMS we created accomplished these goals. It certainly had some issues with how it worked that required some ingenuity to resolve however the performance was great and the code base was small. It certainly had less features than the old CMS however as those of us using ASP.NET MVC became more familiar with the MVC approach it became clear that making the CMS implement complex requirements may not be the best idea. Of course selling developers still on the old CMS on that idea was difficult. They would need to see this for themselves by working more with ASP.NET MVC. In truth, I suspect it was a bit of both the idea that maybe the CMS shouldn't provide everything and that it could provide a bit more than it currently did.

I will continue this series on the CMS with some background on the data access method , using the [nested set model](http://en.wikipedia.org/wiki/Nested_set_model) in SQL to find related pages at the same depth and branch in navigation and other interesting tidbits that came up while working on the project.
