---
date: '2012-03-07 10:04:21'
layout: post
slug: day-25-refactoring-the-http-server-begins-to-pay-off
status: publish
title: 'Day 25: Refactoring the HTTP server begins to pay off'
wordpress_id: '399'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of a series about my experience at 8th light as an apprentice.


The refactoring done over the last couple days to the HTTP server has begun to pay off. I am now able to test my HTTP response methods without having to use HTTP. The tests are still somewhat complicated as a hash of request headers is passed in along with an input stream containing any payload. I suspect if I had stuck with testing all along the structure of my code would be different (Uncle Bob has something to say about this in [The Transformation Priority Premise](http://cleancoder.posterous.com/the-transformation-priority-premise)). But at this point it is what it is -- I can't go back and recreate the likely more simplistic and more testable code along with the minor tests that both verify correctness and serve as documentation. I can try my best but it just isn't possible to do and I think that is an important discovery.

The interesting thing about this experience is the different feel in development. Without testing code does seem to get written faster but refactorings induce more anxiety. The other track of testing while developing provides a steady stream of assurances in the form of passing tests while going "up the mountain" so to speak. Refactorings don't have the same issue because the tests stand ready to either verify your work or reveal your poor testing ability.

In terms of this project, it felt like going up two mountains: the first was getting the server working and the second was refactoring it without tests in order to be more suitable for testing and writing those tests. The end affect on myself as the programmer is that testing is not particularly enjoyable with this approach. It is hard to fight the ingrained "it works why are you doing this" and continue work that has no immediate benefit. This is the opposite of the experience of writing a test and then writing the code to pass that test.

To sum up the issue, the key points are:



	
  * code written using test first is different in structure than code written with tests after

	
  * code first enforces a simple progression of tests that result in a solution which is hard or impossible to do with tests after because the structure of the code isn't conducive to simple tests that build up

	
  * refactoring code in order to make it testable is certainly possible but it isn't enjoyable and this is important because what isn't enjoyable becomes a chore

	
  * this things are present even in small projects where spec-based testing was put aside


On a side note, speclj can do exactly what I want in terms of printing the two values it is comparing if one uses the [should=](http://speclj.com/docs/should-e) operator. [As Myles commented on a prior post](http://blog.cymen.org/2012/03/01/day-22-attempting-to-retrofit-testing/#comments), the startup time issue can be resolved in most cases by using "lein spec -a" which keeps speclj running on a hot JVM watching for changes in your spec files and rerunning on those observed changes.
