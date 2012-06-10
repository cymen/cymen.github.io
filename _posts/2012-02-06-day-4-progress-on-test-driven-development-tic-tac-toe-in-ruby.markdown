---
date: '2012-02-06 23:19:30'
layout: post
slug: day-4-progress-on-test-driven-development-tic-tac-toe-in-ruby
status: publish
title: 'Day 4: Progress on Tic-Tac-Toe in Ruby using Test-Driven Development'
wordpress_id: '308'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of a series about my experience at 8th light as an apprentice.


After figuring out rspec I created classes for the board, scorer, and selector. I initially started on the minimax implementation after the scorer however in talking with Ben (add link) it was clear the single responsibility principle would be violated without separating out the code for selecting the horizontal, vertical and diagonal rows from the board.

Ben and I talked a little bit about the implementation details on how the spaces are stored. It sounds like most people are using an array and converting the 0-8 indexed array to 1-9 labels on the front-end. I mulled over my options and went with a hash with the keys 1-9. Still not 100% certain it's the right path but I'd rather not deal with off by one errors (even with testing one still has to write additional code -- even more to test that off by ones aren't happening).

I was happy to see how quick it was to refactor the scorer class into a scorer class and a selector class. The first iteration was taking everything relevant to selection over to the selector class and adding or bringing over tests without changing the scorer class. Now that those tests are passing, I can go on and refactor the scorer class to use the selector class.
