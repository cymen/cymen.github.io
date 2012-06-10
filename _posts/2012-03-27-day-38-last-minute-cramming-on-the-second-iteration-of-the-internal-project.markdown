---
date: '2012-03-27 13:42:02'
layout: post
slug: day-38-last-minute-cramming-on-the-second-iteration-of-the-internal-project
status: publish
title: 'Day 38: Last minute cramming on the second iteration of the internal project'
wordpress_id: '554'
categories:
- 8th Light
- Apprentice
- JavaScript
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of [a series about my experience at 8th light as an apprentice](http://blog.cymen.org/category/8th-light/apprentice/).



As mentioned previously, some of the apprentices began working on an internal project. Our iteration meetings are on Tuesday mornings so today we were working more intensely on the iteration stories. The story I worked on was making items drag and droppable between three lists on a page. I'd done something similar with jQuery UI sortable before but not test driven. I wrote the code last week to know what the direction was and today I left that code literally at home. Sue and I paired and wrote the same code using a test-driven approach with Jasmine. At the end of the day, we had completed the task including mocking the jQuery AJAX call that went to the backend. The best part was writing a test for the case where the server/internet disappears. It is possible to simulate this without testing but it's a pain to do over and over again. However with testing, it is easy to mock the AJAX call so it fails (calls the error parameter of $.ajax()). So now when the server goes away and one drag and drops between lists the item goes back to the original list if it fails to save.

It was an interesting experience but it made it even clearer that the typical mash up of putting some data in the DOM for your jQuery script to use has a lot of flaws. For example, we put data-val-id and data-val-modified attributes on our list items. When the view is loaded, the server is rendering it server side. Then our jQuery script can use these attributes to do sorting and make AJAX calls client side. However, sometimes it has to update the DOM depending on what the server returns. And it has to do some conversions between JSON response data and DOM attributes as strings. And sorting the lists again requires conversion if sorting by numbers (well, technically it appeared to sort integer strings as expected but it seemed like a bad thing to rely on).

The hardest part of testing this was when we were close to the DOM. Jasmine has fixtures so we can populate the DOM with some HTML content and then run our tests on that however doing comparisons of jQuery objects and DOM objects is problematic in some cases. There are some weird work tricks that are ugly. If one is practicing test-driven development, the impetus to move on to a more structured approach to asynchronous user interfaces comes faster and harder because there is now testing pain on top of development pain.

**What is an asynchronous user interface?**

Simply put, it is a user interface in which the state seen by the user does not always match the state on the server. An example of this would be dragging and dropping an item from one list to another. The drop of the item onto the new list at that moment in time happens on the client without knowledge of the server. The client then sends an update request in the background to change state on the server. The whole purpose of doing this is to make the user interface fast. In our case, we indicate that we are doing something in the background by putting a small image next to the item that animates indicating action. Then when the request to the server completes, we remove the image and that conveys to the client that server state now matches client state. In the case of an error, we move the item back to the original list. This works however it really needs a bit more information as I would want to know why the item suddenly went back to the original list.
