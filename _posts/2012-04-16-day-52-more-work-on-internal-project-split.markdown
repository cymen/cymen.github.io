---
date: '2012-04-16 18:26:20'
layout: post
slug: day-52-more-work-on-internal-project-split
status: publish
title: 'Day 52: More work on internal project split'
wordpress_id: '656'
categories:
- 8th Light
- Apprentice
---

I spent part of the morning writing some CRUD code for an interactor. If you recall, an interactor is something a controller will talk to in order to retrieve data from the data store. The purpose of it is to move your application logic into the interactor instead of having it in the controller or the presentation models.

Then I figured out how to setup [capistrano](https://github.com/capistrano/capistrano/wiki) as vlad is painful. Maybe it's just the way we're using it but it just wasn't very clear. It was fairly straight forward to get capistrano working including have it run the database migration.

After that, I finished the configuration of a wildcard SSL certificate for *.8thlight.com. We now have a valid certification we can use for SSL. It was interesting to see the whole process from the certificate signing request through to adding the certificate and intermediate certificate to the web server configuration.

Finally, I finished the split of the internal application into two applications by migrating the data to one of the new ones. Our database migration scripts didn't handle data properly so that is one area we have to make sure we pay attention to now that we have actual production systems with production data. 
