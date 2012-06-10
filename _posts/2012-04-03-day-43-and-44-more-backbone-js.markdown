---
date: '2012-04-03 14:03:50'
layout: post
slug: day-43-and-44-more-backbone-js
status: publish
title: 'Day 43 and 44: More Backbone.js'
wordpress_id: '590'
categories:
- 8th Light
- Apprentice
---

I created a view which receives a collection of items. The view dispatches the items to one of three collections and then renders these collections using a collection view.

The application currently uses a jQuery UI dialog window to keep it "all in one page". The contents of that jQuery UI dialog window need to change so I created an edit view for an item. This works however there are some interesting side effects with the most minimal approach. When editing the 1st item, everything works fine however when editing the second item all items previously edited are updated with the contents of the second item. The problem is that each time the edit view is rendered event listeners are bound. Because the same bit of DOM is used as the container for the jQuery UI dialog the previous events remain bound too. There are a couple of ways to fix this one being using a singleton to handle the view that encompasses the dialog window. I took a short cut and modified the view to clear the bound events.
