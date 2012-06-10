---
date: '2012-04-24 16:15:21'
layout: post
slug: day-58-working-on-a-rails-based-client-site-thoughts-on-ideal-backend-for-backbone-js
status: publish
title: 'Day 58: Working on a Rails-based client site, thoughts on ideal backend for
  Backbone.js'
wordpress_id: '681'
categories:
- 8th Light
- Apprentice
- Backbone.js
---

### Working on a Rails-based client site



Today I worked with Doug on a client site written in Rails. It was interesting to see a larger code base that makes more use of Rails features (helpers, etc) and testing those features. I wrote a script to import a bunch of data from a CSV file and wrote a migration to update the database schema to accommodate storage of the new data. I modifid the seed data generation script to be cleaner and generate more data so there is data present where additions where made in the schema.



### Thoughts on ideal backend for Backbone.js



The problem with using an MVC backend for Backbone.js is that typically the controllers are DRY but also do things that are un-DRY in order to make things easier. For example, say you have an orders controller that pulls up order history. You'll probably need more than just order data -- you'll likely need to join it a customer, product, address or some other table. The temptation which makes complete sense is to have that controller retrieve the related data even though it is out of the scope of that controller. There are of course ways of working around this in MVC frameworks but you're still trying to shim another responsibility onto a controller action that is unrelated to it's primary responsibility.

What is interesting about Backbone.js is that you can have it handle requesting completely unrelated data in order to build views without compromising the primary responsibility of your controllers in MVC. The most simplistic example of this that I can think of is needing to display multiple choices in a dropdown for a field on a form. The choices might be in one table and they are related to the model behind the form via a foreign key. This is a pain point in the typical MVC framework. The controller needs to load the model for the form but also the related choices from somewhere else...

The odd thing though is that if you take this approach with Backbone.js and have it be responsible for combining the model that is being edited along with the choices in the select list in a client-side view everything becomes very DRY. However it also makes one think that perhaps an MVC framework is immense overkill as a backend for Backbone.js.

**What does Backbone.js really need on the backend?**

Bootstrap: When you first hit a Backbone.js page the recommended approach is to serve an HTML page with the JSON-encoded data (collections of models) within that HTML. In other words the server takes all the data you initially need for your view and encodes it into a string that is put within the HTTP response to your browser. When Backbone.js loads on the client it converts that string into collections of models. The point is to decrease startup time by avoiding having the page load then having Backbone.js fire off requests for additional data. That way the application is fast and responsive.

Running: When a Backbone.js application is running in the browser it can be very economical in terms of communication with the server. It can also communicate in a way that is very DRY: each model/collection has a configured URL that the backend server can respond to and so each update can be posted separately keeping clean separation of concerns on the backend.

**So what?**

Well when using MVC it feels like the controllers are functional in the running stage but the bootstrap is painful. It also feels like during the running stage the controllers are immense overkill. During the bootstrap, all that work to remain DRY gets shot in the foot in the name of performance. That performance is critical but it also makes MVC feel like the wrong backend.

**Going forward...**

I'm still thinking about what the ideal backend would look like. I think it could be much simpler than an MVC framework. The controllers are much simpler as they are REST endpoints. Security is an important concern that has to remain in the forefront. But what would work well for both the bootstrap and the running phases? Hrm...
