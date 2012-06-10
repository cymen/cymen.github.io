---
date: '2012-03-15 17:11:42'
layout: post
slug: day-31-more-work-on-http-server
status: publish
title: 'Day 31: More work on HTTP server'
wordpress_id: '517'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of a series about my experience at 8th light as an apprentice.



I came to a realization today: spec tests in Clojure are likely going to be somewhat different than spec tests in other languages. Clojure is a functional language and this means my program is comprised of a large number of functions. The organization of the project is in namespaces instead of classes. An HTTP request is going to call a large number of functions in a many name spaces before a final value is returned that represents the response. My testing is also organized by namespace and for complicated namespaces the testing gets more complex as one reads down the file because simpler functions are tested first. I've extracted number of simple functions from complex functions in order to reduce complexity and improve how the code reads.

The part that is strange to me compared to say testing a ruby program is that at some point one seems to have to have a fairly large number of inputs (or a small number of complex inputs) in the tests... Of course, it may also be the nature of testing something like an HTTP server. In any case, I've asked a Craftsman to review my project and I am looking forward to discussing this with them.
    
