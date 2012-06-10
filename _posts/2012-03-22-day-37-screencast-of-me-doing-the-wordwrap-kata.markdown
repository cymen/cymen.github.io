---
date: '2012-03-22 19:09:58'
layout: post
slug: day-37-screencast-of-me-doing-the-wordwrap-kata
status: publish
title: 'Day 36: Screencast of me doing the wordwrap kata'
wordpress_id: '542'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of a series about my experience at 8th light as an apprentice.



I'm going to do the wordwrap kata at an 8th Light University soon. Part of the process is now recording a run through and having it reviewed to ensure the kata is useful. I meant to get this done earlier this week but a perfect storm of nervousness, project deadlines on another projects, mulling over good ideas of how to show rspec output in vim (to avoid jumping back and forth) and figuring out screen recording in Linux meant I didn't get it done until today.




One of the criteria for presenting a kata is doing something new. I am doing this kata in a way that we end up with a two path branch (if ... else ...). Uncle Bob's example ends with a three path branch (if ... else if ... else ...). I am also presenting one of Uncle Bob's variants in which the wrong path is taken. Katas don't typically have a moral but this one does and it is that when writing test driven code the tests should indeed drive the code however one has to think carefully about the tests. If one jumps too far ahead and tests complex functionality that doesn't build on a solid base one runs the risk of having to backtrack. A sign of this is getting stuck when writing the code. If you're guessing, your tests are probably wrong and you should focus on fixing the tests not the code itself!

One of the facets of presenting a kata is that there is a limited amount of time to do so. Typically, a kata ends with a clean refactored code. This one does not due to the time limit. However, if one has more time it is indeed possible to refactor the two branches (if ... else ...) to no branches. I won't present the steps here to do so but one solution that I thought was relatively clean is this:

<script src="https://gist.github.com/2164828.js?file=gistfile1.rb">
</script>
