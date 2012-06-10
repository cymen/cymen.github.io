---
date: '2012-02-18 16:12:27'
layout: post
slug: day-13-working-http-based-tic-tac-toe
status: publish
title: 'Day 13: Working HTTP-based tic-tac-toe'
wordpress_id: '348'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of a series about my experience at 8th light as an apprentice.


I worked on my [HTTP-based tic-tac-toe project](https://github.com/cymen/ttt-ruby). I can now play the game on the console with:

    
    ruby play_console.rb


Or via HTTP (using Sinatra) with:

    
    ruby play_http.rb


I am still figuring out how to do testing with Sinatra. It looks fairly straight forward but the part I remain unclear about is redirects. So I'm looking into that next. The game uses POST when the human/HTTP player makes a move but uses a GET when choosing if the human/HTTP player would like to be X or O. That should probably be a POST but doing a nice clean prompt for X or O and submitting the result with a POST is not as clean as I'd like. Maybe another attempt or two will result in something that is cleaner.

For more details, see the [TicTacToeHttp class](https://github.com/cymen/ttt-ruby/blob/master/lib/tic_tac_toe_http.rb)...
