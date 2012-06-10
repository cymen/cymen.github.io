---
date: '2012-04-09 13:20:42'
layout: post
slug: day-47-beginning-to-grok-backbone-js-more-progress-on-catching-up-with-testing
status: publish
title: 'Day 47: Beginning to grok Backbone.js, more progress on catching up with testing...'
wordpress_id: '619'
categories:
- 8th Light
- Apprentice
- Backbone.js
---

**Beginning to grok Backbone.js**

Backbone.js is starting to make sense. At first, everything seemed simple and it mostly was. But then I started needed to render an edit view of a model and I tried to do this in place (tied to the same DOM element) as the display view. This created all kinds of problems with events. The symptom of the problem with events was that an event would be triggered once for the first edit attempt. Then the next edit attempt would trigger it twice. And it snowballed from there into a gigantic event storm. This matters because an event might POST an update to the server.

What does one do about this? Well I know that Backbone binds a view to DOM element. When we swap between the detail and edit views we're attempting to bind to the same DOM fragment. Instead of doing this, why not use a different DOM element and hide/show the two elements based on the current view?

That didn't quite work... However, I also know that when we create the edit view and it is bound to the DOM element that is when the events are also bound. Now that we have two separate elements when edit is clicked check if we already created. If so, just render it again don't create it again. This works great and the code looks like this:


    
    
      ...
      if (!this.editView) {
        this.editView = new ...View({el: '#xyz', model: this.model});
      }
      this.$el.hide();        // hide the display element
      $('#xyz').show();       // show the edit element
      this.editView.render();
    }
    



Is there a better way to do this? Maybe... But this is fairly simple and straight forward.

**More progress on catching up with testing...**

As mentioned in my last entry, the last iteration on the internal project had some testing left undone. I've been working on catching up on the testing. That is going well -- with Backbone.js all of the controller actions now return JSON instead of a rendered view which means I could clean things up at the same time so that unused code and views are removed.
