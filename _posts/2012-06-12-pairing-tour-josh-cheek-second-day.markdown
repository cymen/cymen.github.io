---
date: '2012-06-12 20:18:00'
layout: post
slug: pairing-tour-josh-cheek-second-day
status: publish
title: 'Pairing tour: Second day with Josh Cheek'
categories:
- 8th Light
- Apprenticeship 
---

[Josh](http://www.8thlight.com/our-team/josh-cheek) and I paired for a second day at a client site. As mentioned yesterday, the project is composed of many parts that communicate together to create an application. Each part is a Rails application or a Ruby gem that wraps a Rails application.

Today we picked up a story related to the one we'd worked on yesterday. It required that we change things in a number of different parts. Our final change for the day was a bit daunting: we only knew a Ruby gem wrapped a complicated part of the system and we needed that complicated part to do a specific thing in a specific case. In other words, we needed to send in something to a black box and have it give us an expected response depending on our input. Thankfully, this turned out to be a fairly straight forward change.

Pairing with Josh has been both productive and fun. We finished or made up on a number of stories. It was interesting to get a feel for his coding style. He has created [a number of Ruby gems](http://rubygems.org/profiles/JoshCheek) including:
* [deject](https://github.com/JoshCheek/deject): Simple dependency injection
* [surrogate](https://github.com/JoshCheek/surrogate): Better mocks including appropriately RSpec matchers, [help insuring mock doesn't get out of sync](https://github.com/JoshCheek/surrogate#substitutability), and more! Josh [wrote a blog post](http://blog.8thlight.com/josh-cheek/2011/11/28/three-reasons-to-roll-your-own-mocks.html) going into the why.
* [pbcopy](https://github.com/JoshCheek/pbcopy): Copy to the system clipboard on OS X from Ruby code just like the pbcopy command.

Next on the pairing tour is [Micah](http://www.8thlight.com/our-team/micah-martin) for Wednesday and Thursday.
