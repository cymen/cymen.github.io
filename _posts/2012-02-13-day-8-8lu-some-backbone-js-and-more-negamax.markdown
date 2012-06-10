---
date: '2012-02-13 11:06:13'
layout: post
slug: day-8-8lu-some-backbone-js-and-more-negamax
status: publish
title: 'Day 8: 8LU, some Backbone.js and more Negamax'
wordpress_id: '325'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of a series about my experience at 8th light as an apprentice.


I forgot to write my blog post for day 8 so I'm writing it on day 9. Day 8 was a Friday at 8th Light which means we host [8th Light University](http://university.8thlight.com/) also known as[ 8LU](http://university.8thlight.com/). Part of the responsibilities for apprentices is to help clean the office and help with 8LU. That took up a fair amount of the morning as I also setup a Waza board as directed by [Doug](http://www.8thlight.com/our-team/doug-bradbury). The Waza board is for listing the open source projects being worked on after 8LU by anyone (typically an 8th Light employee but it can be someone who happened to stop by for 8LU as it is open to everyone). The board has a column for each project and the rows are name, team, ready (stories), working (stories) and done (stories). This seemed to be popular as [Paul](http://www.8thlight.com/our-team/paul-pagel)/[Doug](http://www.8thlight.com/our-team/doug-bradbury) wanted to streamline the stand up and move the Waza related content out of the main stand up to make it faster.

For Waza, I worked with [Mike](http://www.8thlight.com/our-team/mike-jansen) on Backbone.js. He is giving a [presentation on Backbone.js to the Software Craftsmanship McHenry County](http://www.meetup.com/Software-Craftsmanship-McHenry-County/events/47498232/) (link goes to meetup details for 2/15/2012). Apparently, that meetup location doesn't have a good internet connection so he wanted to modify his Todo list example to use HTML5 local storage. He had an existing project in rails which relied on something on the rails side for some template formatting so we needed to abstract that. We had a hard time doing that quickly and settled on temporarily hard coding the few templates to JavaScript functions. This got us to the point we could try the local storage plugin for Backbone.js and it turned out to be super easy -- a minor change to how we were using collections in the page and adding a single line to the initialization of the collection and it worked! We committed and ended our work at that point. I believe Mike is going to look into the issue with the templates.

In the evening and on Saturday I worked on my Nega implementation for the tic-tac-toe project in Ruby. I've posted that project here on github:

[https://github.com/cymen/ttt-ruby](https://github.com/cymen/ttt-ruby)

By the end of Saturday, I had a working Negamax that passed all my test cases. I then quickly hacked a play method into my Game class and added a play.rb that loaded up the classes/modules and kicked off play so I could try the game on the command line. Next is to cleanly implement the console display and input in a tested way and look for violations of the [Single Responsibility Principle (SRP)](http://en.wikipedia.org/wiki/Single_responsibility_principle).
