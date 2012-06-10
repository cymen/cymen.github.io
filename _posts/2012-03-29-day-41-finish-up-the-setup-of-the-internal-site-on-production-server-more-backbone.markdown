---
date: '2012-03-29 19:07:18'
layout: post
slug: day-41-finish-up-the-setup-of-the-internal-site-on-production-server-more-backbone
status: publish
title: 'Day 41: Finish up the setup of the internal site on production server, more
  Backbone'
wordpress_id: '576'
categories:
- 8th Light
- Apprentice
---

**Finish up the setup of the internal site on production server**

Ben and I completed setting up the internal rails project on a production server. We were mimicking an existing production site that used vlad for production. That was a bit confusing as "rails -T" didn't show all the tasks plus one of the rake files seemed to be in the wrong location. There is likely some room for improvement there. There were a number of little system administration things  and programming tasks that needed to be done so it took most of the day. We also changed the instance of our application running on Heroku to be a staging server which was interesting without having direct shell access.

**More Backbone**

I spent some of the morning looking into Backbone and jQuery UI Sortable. I wanted to use both but now Backbone would be responsible for updating the server and so forth. I figured out how to bind a Backbone model to an event triggered by jQuery UI Sortable however I wasn't too sure of my approach. Mark (another apprentice) and I looked it over. The event is happening on an individual item within a list. Each item is rendered by a Backbone view and the list is also a Backbone view. Mark and I wondered if we could bind to events on the list at a higher level instead of at the item level. We figured out an approach that worked but we are really interested in inter-list events (moving items from one list to another).

I discussed this with Mike (a craftsmen) to get his view on things. He mentioned that his approach is to make Backbone in charge of everything and one thing I might consider is having a Backbone view being responsible for rendering the list and item views. So adding another view layer to the approach. And then having that view be responsible for binding/configuring jQuery UI. We have another internal tool that is doing something similar so I'm going to look at it and see how this problem was solved before. One of the problems with separating responsibilities with events is that how things work can get confusing. One has to make that leap from the triggered event to the listener to trace how the system works.
