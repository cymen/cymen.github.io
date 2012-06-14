---
date: '2012-06-13 21:49:00'
layout: post
slug: pairing-tour-micah-martin
status: publish
title: 'Pairing tour: Micah Martin'
categories:
- 8th Light
- Apprenticeship 
---

[Micah](http://www.8thlight.com/our-team/micah-martin) and I paired today at the 8th Light office in Libertyville. We worked on an interesting project that involved loading data into memory to create data structures that will allow extremely fast querying. We are working in Clojure which I'm happy to use again but realized today I'm very rusty on. I wrote my HTTP server in Clojure and it took a while to figure out some basic things but then it clicked and I learned enough to complete the task quickly by reusing the same idioms in Clojure over and over again. However that was couple months ago. Thankfully, I was able to explain to Micah what I wanted to do and he helped me fill in the blanks when it was my turn at the keyboard. I didn't seem to slow down progress too much!

The work in Clojure was particularly interesting because while loading a large amount of data from disk we needed mutability. For this we chose to use atoms after trying some other options. We also tried type hinting and it seemed to cut the run time of one operation from around 60 seconds to 37 seconds which was quite an improvement. It was a lot of fun to pair with Micah and to work on a difficult problem in which performance is critical. I'm looking forward to tomorrow.
