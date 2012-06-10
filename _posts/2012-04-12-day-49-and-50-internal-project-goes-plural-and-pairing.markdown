---
date: '2012-04-12 21:07:29'
layout: post
slug: day-49-and-50-internal-project-goes-plural-and-pairing
status: publish
title: 'Day 49 and 50: Internal project goes plural and pairing'
wordpress_id: '639'
categories:
- 8th Light
- Apprentice
- Backbone.js
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of [a series about my experience at 8th light as an apprentice](http://blog.cymen.org/category/8th-light/apprentice/).




**Internal project goes plural**

The apprentice team is now working on multiple internal projects. The two are split off of one. I think the whole team was happy with this outcome.

**Pairing**

I've been pairing quite a bit lately and it has been enjoyable. I've now paired with Ben, Mark and Sue. My first pairing was with Sue and we worked on test driven developing of JavaScript using jQuery UI Dialog and Sortable. It was very satisfying to see our tests pass and the code work. However it became clear that developing this way was going to be very slow and without a good guide on how to structure our use of JavaScript the adhoc approach was going to cause pain later on. The testing itself was also close to the DOM.

I paired with Ben and Mark to work on using Backbone.js. Now we had more of a structure. The way Backbone uses models and collections makes sense. The place we've occasionally struggled and had to think hard about what we are doing is views and views within views. Mark and I created a reusable view that encompasses two child views: detail and edit. The DetailEdit view accepts a model and two view types to use and then creates the views and can handle switching back and forth between the two. This seemed quite clean however I am going to research views to see what other patterns are out there that may increase our productivity and avoid the event binding issues that can come up with Backbone views.

The test-driven development of JavaScript code that utilizes Backbone is very nice! Because Backbone is responsible for the DOM we don't typically have to get down to that level unless our views interact with the DOM (for example, reading values from the DOM when an edit view is submitted). Even in those cases it is straight forward to put the DOM interaction into a single method that can be mocked. The one place we've had issues test-driving development is with views at the DOM level. An example today was a view that was tied to a DOM element with the 'el' option. In this case, "el: '.project'" failed as it was looking for DOM that wasn't actually rendered yet. In other words, we had to fix where the view was being rendered to in the DOM before we could test drive it as it was going out to space as far as our testing was concerned. Again, more research and thought needs to go into how we are creating and using views.
