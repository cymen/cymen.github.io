---
date: '2012-02-14 19:58:10'
layout: post
slug: day-10-getting-tic-tac-toe-ready-for-demo
status: publish
title: 'Day 10: Getting tic-tac-toe ready for demo'
wordpress_id: '337'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of a series about my experience at 8th light as an apprentice.


I spent the day cranking away on my tic-tac-toe project. I am still a little uncomfortable with the approach to unit testing the input-output. In short, the test is counting how many times certain functions are called. It did indeed catch at least one bug however this means if I want to test IO I need to occasionally make an additional function or method purely in order to count how many times it is called for testing. I'm mostly convinced just slightly unsettled by that requirement.

The other issue I have with the approach is that for every single method we have an additional variable to count how many times it was called. That gets messy as the number of functions or methods increases. Maybe that is a sign that too much is being done by that module or class? I was thinking one solution to this would be to add something that gets called when any method or function is called and it increments a hash value with the key being the method or function name. I think this is possible in ruby... I can immediately think of at least one downside but it might be worth trying.

At the end of the day, my tic-tac-toe is almost completely tested. I'm finishing up testing a module that does output for the board printing and line centering on the console. Then another round of making sure I didn't miss testing a function or method.
