---
date: '2012-03-27 14:03:45'
layout: post
slug: day-39-when-jquery-ui-starts-creating-unmaintainable-code-where-do-we-go-next
status: publish
title: 'Day 39: When jQuery UI starts creating unmaintainable code where do we go
  next?'
wordpress_id: '556'
categories:
- 8th Light
- Apprentice
- Backbone.js
- JavaScript
- jQuery
---

Last night I realized one of the stories for our internal project was not only about design and in fact had a huge amount of work in it that we had not adequately estimated. The story was about enhancing the user interface so that it would be an "all in one page" application. When clicking on an item, it would be displayed in a window within the main view. I think we estimated only the design part of the story. So I faced the decision: do I stay up late trying to get this done or do we present the story as incomplete? In the end, both happened and I think that is an important lesson.

So I stayed up working on the feature. I used jQuery UI dialogs to make the "windows within the main view" work as I've done before. However it was complete work as I needed to change all the links to work within the dialog instead of opening new pages. The server side was fairly straight forward: instead of returning a view with the layout (the layout having the site wrapper so logo, etc), return a partial which is only the contents of the actual view. Then I added some classes to all the links and had jQuery intercept the click action so that the content was fetched via AJAX and then put into the dialog window. This worked however I also needed to handle form posts.

Then after all of that was working, I realized we needed to update the main view if any edits had been saved in the dialog! This turned into a ball of wax that was solvable but quickly looked to be going the way of code that I personally would rather not be working on because changing it would be difficult. It was also untested as I knew from my experience during the day that writing it test-driven would take more time than I had that evening...

**What was really wrong with this approach?**

If one clicks on an item and edits say the name and saves it then goes back to the view by closing the pop-up dialog the main view now has to fetch the item again from the server as JSON and update itself. So if we edit A and change the name to BA and save it the record is PUT/POSTed to the server. Then we go back to our main view and we have another GET to retrieve the same data we just posted! This is not helping the speed of our UI although it is fast in practice. Our code has to manually decide what items in the JSON response need to be put into the DOM to update it. It's a very manual process.

**What would be better?**

Moving to a framework like Backbone.js. The way this would work is:



	
  * Main view: has three empty lists for our item. We may be able to optimize by having the server populate these for the initial request.

	
  * Main view load: Backbone.js makes a request to the server most likely using it's idea of collections. The server (Rails) responds in JSON with say an array of items. Backbone.js takes these items and puts them into a collection as objects using the models we have defined.

	
  * On edit: Backbone.js sends the update to the server but most critically also triggers an event that the item has been updated. The main view receives the trigger and can update itself using the data that Backbone.js holds client side. It does not need to make a request to the server.


There are a couple big things going on here however from a testing standpoint the big idea is **don't parse DOM** but instead have JavaScript responsible for updating the DOM (without having to parse it to figure out what to update) and the state on the server side. A big advantage of this is that we can leverage the power of convention as used in a framework to make possible things like client-side storage (using HTML5 local storage). We may not use that capability in this project but it's there. We also have a more responsive user interface as we do not have to ask the server what we just did in order to update a related view. We also in theory have less code to test as we do not need to test Backbone.js -- we only want to test our own code which should be fewer lines as framework should be responsible for some of the plumbing that was causing ugly code when we tried to do it ourselves.
