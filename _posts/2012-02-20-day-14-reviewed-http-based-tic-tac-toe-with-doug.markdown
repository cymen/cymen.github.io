---
date: '2012-02-20 12:01:42'
layout: post
slug: day-14-reviewed-http-based-tic-tac-toe-with-doug
status: publish
title: 'Day 14: Reviewed HTTP-based tic-tac-toe with Doug'
wordpress_id: '352'
categories:
- 8th Light
- Apprentice
---

Doug reviewed [my tic-tac-toe project](https://github.com/cymen/ttt-ruby) to see the progress I'd made on the HTTP implementation. We discussed some of the aspects of testing that were difficult. He is going to return with the next challenge but in the mean time I'll work on making sure my [HTTP-based tic-tac-toe using Sinatra](https://github.com/cymen/ttt-ruby/blob/master/lib/tic_tac_toe_http.rb) is completely [tested](https://github.com/cymen/ttt-ruby/blob/master/spec/tic_tac_toe_http_spec.rb). I split my state interactions off to a [TicTacToeStorageSession class](https://github.com/cymen/ttt-ruby/blob/master/lib/tic_tac_toe_session_storage.rb) which made [testing](https://github.com/cymen/ttt-ruby/blob/master/spec/tic_tac_toe_session_storage_spec.rb) easier as I could inject the session as a hash instead of a Rack session (the Ruby hash has the same interface as the session for my purposes).

I added more testing of to the project. Testing the "actions" in my Sinatra-based tic-tac-toe application was straight forward and thankfully there are few of them. I also added more testing to other parts of the application where prior refactoring exposed methods to use to set values for testing of functions that use those values (typically, along with other input).
