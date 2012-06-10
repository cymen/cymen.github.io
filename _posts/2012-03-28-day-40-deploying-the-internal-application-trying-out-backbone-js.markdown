---
date: '2012-03-28 18:13:31'
layout: post
slug: day-40-deploying-the-internal-application-trying-out-backbone-js
status: publish
title: 'Day 40: Deploying the internal application, trying out Backbone.js'
wordpress_id: '563'
categories:
- 8th Light
- Apprentice
- Backbone.js
- JavaScript
---

**Deploying the internal application**

I paired with Ben for a good part of the day in a big push to get our internal rails application deployed to a production server. The server is running a specific version of ruby and while it does have RVM so in theory one could use any version in practice Passenger running under Apache is going to use a specific version of ruby with global gems for everything. You can install the passenger gem and compile an apache module and then use that in your virtual host configuration in apache but it's really ugly and a total hack. So we took the easy path and changed our development environment to match production. With the low cost of virtual machines, I think it makes sense to either have a couple of big servers with one running the most recent stable version of ruby or having one for each application if there is only a handful to begin with. On the other hand, maybe we can get the other applications on that server up to a more recent version of ruby and everyone benefits (if I recall correctly, 1.9.3 had some performance improvements over 1.9.2).

This deployment is complicated by the fact we also want to use SSL and authenticate with our google accounts (using OAuth2). We finished the day with the stack working except for redirect issues between the google authentication services and our host preventing any actually usage. Hopefully, it's just the DNS update for the new server name taking time to propagate.

**Trying out Backbone.js**


I spent some time today learning more about Backbone.js. 8th Light craftsman [Mike Jansen](http://www.8thlight.com/our-team/mike-jansen) has a project on github named C[hildermass](https://github.com/mjansen401/childermass) that has been quite useful:





> Childermass is a way to browse GitHub. It dives into the depths of repos and users and plucks out the most interesting information for you to read.

Childermass is largely an experiment with Backbone.js, sitting on top of Rails. The goal is to have a sufficiently complex example of structured, test driven Javascript for people to emulate and use in their next project.


Using Childermass as an example, I recreated the "three list" view of our internal application in Backbone.js. My reason for doing this is that currently the JavaScript code for the view has to manually update the items in the lists after they are edited in a "popup" (really an in page jQuery UI Dialog). There is also a lot of parsing of the DOM going on to figure out what to send to the server. In short, it is trying to do what Backbone.js is doing but it's painful and it's more lines of code that have to be tested. It's also inflexible compared to Backbone.js. For example, say in the list you want to show another field from the item. With Backbone.js, this is a simple change of the template that renders the item. With the DIY approach you'll likely have a couple of places to make changes and your testing is likely going to need to change.
