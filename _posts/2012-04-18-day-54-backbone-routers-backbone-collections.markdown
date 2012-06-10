---
date: '2012-04-18 16:04:46'
layout: post
slug: day-54-backbone-routers-backbone-collections
status: publish
title: 'Day 54: Backbone routers, Backbone collections...'
wordpress_id: '663'
categories:
- 8th Light
- Apprentice
- Backbone.js
---

On February 1st, 2012, I started a [Software Craftsman apprenticeship](http://www.8thlight.com/apprenticeship) with 8th Light under [Doug Bradbury](http://www.8thlight.com/our-team/doug-bradbury) in order to study the agile approach to software development. This post is one of [a series about my experience at 8th light as an apprentice](http://blog.cymen.org/category/8th-light/apprentice/).





### Backbone router


We're getting closer to the end of the iteration for the internal projects and we need to bring the design changes that Chris is making into the projects. Our pattern up to now has been to have everything in one window with any interaction (editing, creating) taking place in modal dialog boxes. That worked up to a point but now our applications are becoming more complex. So I began to look into [Backbone.js Routers](http://documentcloud.github.com/backbone/#Router) and to think about how to refactor our modal approach to one that can do edit/create in modal but navigating a hierarchy like a normal website where the page contents is replaced and the back button works. It turns out to be fairly simple and that is progressing well.



### Backbone collections


We started out using [Backbone-Relational](https://github.com/PaulUithol/Backbone-relational). The parent-child relation with this looks like:

    parent.get('child')  // get a collection containing the children
    child.get('parent')  // get the parent of the child

This works okay however I'm starting to wonder if it would better to have a collection of each model type. So all of the parents would be in one collection and all of the children would be in another collection.
