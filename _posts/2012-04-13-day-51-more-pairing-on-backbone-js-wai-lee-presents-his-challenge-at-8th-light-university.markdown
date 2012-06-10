---
date: '2012-04-13 22:13:27'
layout: post
slug: day-51-more-pairing-on-backbone-js-wai-lee-presents-his-challenge-at-8th-light-university
status: publish
title: 'Day 51: More pairing on Backbone.js, Wai Lee presents his challenge at 8th
  Light University'
wordpress_id: '649'
categories:
- 8th Light
- Apprentice
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of [a series about my experience at 8th light as an apprentice](http://blog.cymen.org/category/8th-light/apprentice/).



**More pairing on Backbone.js**

Mark and I paired in the morning on the internal project that utilizes Backbone.js. The project split into two and we worked on renaming from name A to B in both source and file and directory names. We used some bash scripting along with find, xargs, rename and sed to make the change. We were able to verify success by running our tests.

We also worked some more on Backbone.js views. When rendering a collection of items it can occasionally be confusing as the child item may need to append to DOM that is not yet attached to the document DOM. I think we're both starting to understand how Backbone.js works internally which is proving to be useful. The source code to Backbone.js is available in [annotated format](http://documentcloud.github.com/backbone/docs/backbone.html) which is quite useful.

**Wai Lee presents his challenge at 8th Light University**

[Wai Lee](http://wailee-apprentice.blogspot.com/) presented [fountain codes](http://en.wikipedia.org/wiki/Fountain_code) at 8th Light University. Fountain codes can be used as a form of error correction on binary streams. With say 5% overhead on the binary stream one can correct missing portions of the stream. The scheme is typically used in digital video transmission so there is a good chance it is used with ATSC or over the air HDTV in the United States. With this form of error correction, a very slight interference that corrupted a small portion of the binary stream that comprises the encoded video shown on the television can be corrected. This is likely also why it seems like one either has a good digital picture or it's basically not watchable. Analog television broadcasting degraded more gracefully to the white static that most of us today are familiar with but future generation will only see if a device happens to use a [recorded loop of static to show an error condition](http://recroomhq.com/downloads/2010/04/14/tv-static-freebie.html).

I also wondered during the presentation if [Parchive](http://en.wikipedia.org/wiki/Parchive) uses fountain codes. [According to wikipedia](http://en.wikipedia.org/wiki/Parchive), version 1 uses Reed-Solomon error correction but it doesn't mention what more recent versions use.
