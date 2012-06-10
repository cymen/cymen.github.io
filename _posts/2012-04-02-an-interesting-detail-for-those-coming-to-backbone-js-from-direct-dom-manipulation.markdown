---
date: '2012-04-02 10:07:32'
layout: post
slug: an-interesting-detail-for-those-coming-to-backbone-js-from-direct-dom-manipulation
status: publish
title: An interesting detail for those coming to Backbone.js from direct DOM manipulation...
wordpress_id: '584'
categories:
- Backbone.js
- JavaScript
- jQuery
---

The context is a simple page with two lists named A and B. One can drag and drop items between or within the lists. The drag and drop code comes from [jQuery UI Sortable](http://jqueryui.com/demos/sortable/#connect-lists) using the "connected lists" option. When I move an item, I want to show on the item the status of the background save. One easy way to do this is to apply a CSS class to the item and that class has styling that shows a background image that has animation.

Now when one uses Backbone.js the code changes. The items in lists A and B are Collections of Models that have Views. This works great! The jQuery UI Sortable code is very simple -- the 'sortstop' event triggers a 'drop' event on the item. The Backbone.js view for the item listens for the 'drop' event and if moving between lists removes the item from the old list and adds it to the new collection. The view also handles sending an update request to the server. The view for the collection (the list) also listens for the 'drop' event and submits an update with the new sort order for the collection. Some of the code here likely should be in a Backbone.js controller however that isn't the interesting part.

The interesting part is what happens at the DOM level when you drag and drop between lists. Before Backbone.js, the DOM for the item being moved was removed from the old location and added to the new location. So anything added to that DOM persisted. With Backbone.js, the DOM for the item at the new location is not the same DOM as at the old location (instead, the new DOM is a new render() of the model for the item). The DOM does not persist unless one specifically accounts for it.

The Backbone.js framework is driving the generation of DOM. One can no longer set say a class on an item while it is being moved and expect it to persist unless it is specifically accounted for in Backbone.js. It is entirely reasonable and makes sense but it is an interesting difference between the two approaches.

**Minor footnote**

This post assumes it is a good idea to reflect the internal saving of the state change to the server in the client UI. It may not be sensible to do so except for the case of failure.
