---
date: '2011-08-16 10:46:32'
layout: post
slug: idea-enhancing-msdeploy-with-skip-skip-production-etc
status: publish
title: 'Idea: enhancing msdeploy with .skip, .skip-production, etc...'
wordpress_id: '225'
categories:
- ASP.NET MVC
---

At work we use Jenkins (formerly Hudson) for continuous integration and for pushing out releases to our staging and production servers. It works well for this however the configuration for msdeploy is a bit of a cluster due to it being in a batch script -- adding or removing directories to skip for deployment is a pain.

I realized today one way to solve this might be to support creating a .skip or .skip-TARGET (so in our case, .skip-production and .skip-staging) files. Than add a batch or simple program to scan the project directory (for script, can use "[dir /S /B FILENAME](http://mattypenny.blogspot.com/2007/04/dos-equivalent-to-unix-find-name-print.html)" seems to be equivalent of UNIX "find FILENAME") and add a skip for the directory. That way anyone can add the skip option and it is clear in source control what is and what is not getting pushed out.

It seems like a simple enough idea to implement...
