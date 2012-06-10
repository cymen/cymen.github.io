---
date: '2012-02-16 15:47:05'
layout: post
slug: day-12-http-based-tic-tac-toe
status: publish
title: 'Day 12: HTTP-based tic-tac-toe'
wordpress_id: '345'
categories:
- 8th Light
- Apprentice
---

I spent some time reading about [Sinatra](www.sinatrarb.com) today and yesterday in order to put an HTTP interface on [my Ruby-based tic-tac-toe game](https://github.com/cymen/ttt-ruby). By early afternoon, I had a board that was fetched via HTTP with a URL to GET to play a space. I hooked up an instance of the ComputerPlayer class (which uses a [Negamax](http://en.wikipedia.org/wiki/Negamax) solver) and had the player on the HTTP side always be first (so X in tic-tac-toe). I used Rack::Session::Pool so that I could keep the game state on the server side (instead of the default session which would put it in a cookie). I saved the Board object into a session variable by using Marshal.dump() on it to serialize it to a string.

This worked out well! However it is untested and the Scorer hasn't been hooked up yet nor the prompt to choose if human/HTTP player wants to be X or O. So those are the next steps...
