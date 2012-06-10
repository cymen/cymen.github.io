---
date: '2012-04-10 20:22:55'
layout: post
slug: day-48-internal-project-work-and-pairing
status: publish
title: 'Day 48: Internal project work and pairing'
wordpress_id: '632'
categories:
- 8th Light
- Apprentice
---

The team working on the internal project was humming along today with two pairs going. It was hard to split up the work but we seemed to do a fairly good job of it. We're all a little concerned at the growing complexity of the stories however we are making forward progress.

Ben and I extracted some basic CRUD methods shared by interactors into a base class. This cleaned things up quite a bit. I'd like to do the same with the mock interactors used in testing our controllers.

The afternoon was spent working on a new controller and hooking it up to Backbone with a new collection, model and a bunch of views. Developing Backbone with the test-driven approach worked very well. I am happy that the tests are serving to accurately document how Backbone is being used. It can be confusing at first as there are quite a lot of small pieces that interact together to create a view.
