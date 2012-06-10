---
date: '2012-04-10 01:51:17'
layout: post
slug: day-47-part-two-getting-testing-up-to-date-on-internal-project-with-backbone-js
status: publish
title: 'Day 47, part two: Getting testing up to date on internal project with Backbone.js'
wordpress_id: '629'
categories:
- 8th Light
- Apprentice
- Backbone.js
- JavaScript
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of [a series about my experience at 8th light as an apprentice](http://blog.cymen.org/category/8th-light/apprentice/).




I spent the evening playing catch up on the testing for the Backbone.js version of the internal project. All of the collections, models and views are now tested. I was able to apply the approach used by Mike in [Childermass](https://github.com/mjansen401/childermass) in testing and it turned out to be straight forward with Jasmine and Sinon.

I didn't get a chance to sit down with Mike on Friday. I wanted to discuss with him the approach used in test-driving Backbone.js application development. The problem with doing that as a beginner is that the architecture of the application is in flux. When starting out, it isn't uncommon to change the approach and this can be done fairly quickly however testing it would increase the time for the learning curve. But maybe there are aspects I'm missing and maybe that increased time is worth it. We do have some new features for the internal project so I will develop them test-driven now that the architecture is clearly defined.

One thing that was beneficial was keeping in mind Mike's advice: try to get away from the DOM as quickly as possible. With CRUD views this isn't always easy however it is possible to extract the collecting of the model attributes from the DOM into a single method in most instance. That makes it possible to mock that method with Sinon so that only one or two tests actually have to operate at the DOM level.

It all adds up to 66 specs that are taking approximately 3/4 of a second to run in a recent version of Chrome on Linux.
