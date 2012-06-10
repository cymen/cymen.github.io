---
date: '2012-04-05 11:10:38'
layout: post
slug: day-45-backbone-js-mustache-js-templates-and-backbone-js-views
status: publish
title: 'Day 45: Backbone.js, Mustache.js templates and Backbone.js Views'
wordpress_id: '601'
categories:
- 8th Light
- Apprentice
- Backbone.js
- JavaScript
---

**Backbone.js**

The internal project now uses Backbone.js along with Backbone-Relational.js to manage items and item comments. There is one complication though: the user interface relies on a "pop up" window which is a jQuery UI Dialog window (in other words, it's not a real pop-up but one within the page that mimics a real popup without some of the annoyances of a real popup). So a lot of the Backbone.js views need to render into this dialog panel instead of using a controller and rendering to the page. The problem with this is that Backbone.js relies heavily on events and one has to unbind events instead of letting Backbone.js manage that (at least I think that is how it is supposed to work). Hopefully, we can figure out an approach that requires less manual work.

**Mustache.js templates and Backbone.js Views**

Mike's [childermass project has a SimpleMustacheView.js](https://github.com/mjansen401/childermass/blob/master/app/assets/javascripts/views/SimpleMustacheView.js) which I've used in the internal project. This works great however I ran into one need that I didn't immediately see the solution to: I want the text attached to the item in a rendered view to be based on multiple attributes of the model. In other words, say the model has two text fields named Identifier and Owner which are not required. If both are populated, I want to show Identifier + " - " + Owner but if only one is populated show it.

The solution I came up with is in the view that SimpleMustacheView.js is being inherited from add to the presenterDate function like so:


    
    
    presenterData: function () {
      var attributes = _.clone(this.model.attributes);
      var that = this;
      attributes.display_name = function() {
        // logic here to return name as combination of fields
      }
      return attributes;
    }
    



Now the Mustache.js template can have this:


    
    
      ...
      Name: {{display_name}}
      ...
    



The approach I took is to clone the model attributes that are passed to the Mustache.js view. I don't want to change the actual attributes. This works however it would be nice to be able to define a function in the model that could be called from the view. Then I realized this really is a view requirement so should the model know about it? So I stuck with this approach and resolved to think about it some more.
