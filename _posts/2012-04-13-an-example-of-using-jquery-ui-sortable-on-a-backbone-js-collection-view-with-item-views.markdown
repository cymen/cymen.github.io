---
date: '2012-04-13 22:22:23'
layout: post
slug: an-example-of-using-jquery-ui-sortable-on-a-backbone-js-collection-view-with-item-views
status: publish
title: An example of using jQuery UI Sortable on a Backbone.js collection view with
  item views
wordpress_id: '653'
categories:
- Backbone.js
- jQuery
---

Tonight while browsing stack overflow I came across a post that asked something relevant to what I'd been working on recently: [Saving jQuery UI Sortable's order to Backbone.js Collection](http://stackoverflow.com/questions/10147969/saving-jquery-ui-sortables-order-to-backbone-js-collection).

I posted an answer with a link to this [jsfiddle.net/7X4PX/4/](http://jsfiddle.net/7X4PX/4/) that showed the approach I used to tie the two together. The approach I used was to have the item view listen for an event triggered by jQuery UI Sortable. When that event triggered, the item view would trigger another event that included the model which the collection view would listen for. Then the collection view can be responsible for updating the view and updating the server. The solution as shown in jsfiddle could be refactored to have the collection instead of the collection view be responsible for updating the server.

This seems like a round about way of doing things however I like some of the clarity provided by an event-based approach. I'm curious to see how others approach something like this so hopefully the question will receive a couple more answers.
