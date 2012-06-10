---
date: '2010-02-20 14:45:42'
layout: post
slug: attractive-urls-on-database-driven-websites
status: publish
title: Attractive URLs on Database-driven Websites
wordpress_id: '125'
categories:
- Web Development
---

One of the annoyances with moving from URLs based on actual files on a file system to database-driven websites is ugly URLs. There are a lot of articles on working around the problem. Typically, the solution is having a numeric identifier along with a more verbose string that identifies the article. The verbose string is then ignored by the application.

This approach makes a lot of sense when listing categories of things that include many items. Common examples would be movies, books, etc. If a numeric identifier was not used then the database lookup would need to be based on the verbose string. There are two issues here: database lookups based on strings are inefficient compared to numeric values and the longer the URL the more likely it will be accidentally corrupted when used outside of the application (say in an email).

However, I argue that always using the numeric identifier is not necessary. A first class URL (one without a numeric identifier) should be used when possible. Two methods of doing this come to mind: registering all the URLs that are first class with the application so that the URL to numeric identifier is known by the application without a database lookup or by doing a database lookup based on the verbose string. I believe the first method is most performant so that is the route I am going to investigate first. I also believe the second method can be made to perform well particularly when there are a limited number of first class URLs (I am not arguing that one should use first class URLs for categories with large numbers of entries) however there are issues besides performance (see the case where the URL includes a "/" within the entry name but "/" is also used to separate the entries -- I suspect this is easier to handle with the first method).

My next article will focus on an implementation of this in ASP.NET MVC although this post has nothing to do with any particular platform so the same methods should work with any platform. One critical requirement is that URLs can be registered/deregistered during runtime in the event of adding/removing content.
