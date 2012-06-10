---
date: '2012-03-15 09:14:07'
layout: post
slug: day-30-progress-on-the-wordwrap-kata
status: publish
title: 'Day 30: Progress on the wordwrap kata, HTTP server update and ...'
wordpress_id: '511'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of a series about my experience at 8th light as an apprentice.



**Wordwrap Kata**

Since performing the wordwrap kata for those in the office as a practice run it has been much easier to keep on doing the kata every day. In Robert Martin's example of the kata the code ends up with a branch at the bottom of the method like this:

    
    if ...
      ...
    elsif ...
      ...
    else
      ...


My first change was figuring out how to simplify this down to an if-else and now I've progressed on my kata to the point I can eliminate the if-else with some refactoring at the end. Now I need to practice this approach with the screen setup used when performing the kata (we use a projector in the office which demands low resolution and large font sizes). I'm also trying to configure vim so I an run the tests within vim and have them displayed in a small part of the screen so the red/green status stays on screen.

**HTTP Server Project**

I've spent some time looking at using [Netty](http://netty.io/) in the second version of my HTTP server. It would be fun to have a server that supports [SPDY](http://www.chromium.org/spdy). Twitter [contributed a SPDY implementation to Netty](http://netty.io/blog/2012/02/04/) which I think is low enough in the stack that it would work below my HTTP server. It does look a little tricky though and time wise I'd like to go back to focusing on the task so I'm considering skipping it for this rewrite and trying it on a future one.

**Internal Project**

The rails-based project with the interactor approach is going slowly. Brian explained how another internal tool uses that approach however some aspects of it lag behind the currently favored or at least discussed approach. It is an interesting challenge. _Note I edited this after realizing the work we're going to do is in the upcoming week not for this week._
