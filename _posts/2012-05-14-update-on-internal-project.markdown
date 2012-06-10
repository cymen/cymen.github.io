---
date: '2012-05-14 21:54:38'
layout: post
slug: update-on-internal-project
status: publish
title: Update on internal project
wordpress_id: '712'
categories:
- 8th Light
- Apprentice
---

The work on the internal project continues. We're almost at a point where it is usable. This last iteration was the first one in which a story was not completed. It was disappointing but ultimately understandable. During the iteration we accomplished a few things that didn't have a specific story but really needed to be done. One thing in specific was modifying how Jasmine was testing all of our Backbone.js code.

Jasmine can load HTML fixtures into a specific DOM area for use in tests. The default path for these fixtures is relative to the Jasmine installation. In our case, we use a lot of mustache templates. So we'd copy over the templates but changes in the "real" templates would have to be manually copied over. This was really bad because our tests were not useful. We modified Jasmine to point to the rails view directory and updated all the fixture inclusions to use the new paths and it worked out great!

In our project, Jasmine is installed at ./spec/javascript/ which contains the helpers and suport directory along with any other directories one might want to create. We added a file called backbone-views.js to the helpers directory:

<script src="https://gist.github.com/2698739.js?file=rails-fixtures.js">
</script>

Then a call to loadFixtures would look like:

<script src="https://gist.github.com/2698748.js?file=gistfile1.js">
</script>

It is a small thing but clearly became essential over time.
