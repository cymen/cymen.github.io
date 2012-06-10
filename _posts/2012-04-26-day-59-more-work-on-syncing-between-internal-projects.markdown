---
date: '2012-04-26 20:45:19'
layout: post
slug: day-59-more-work-on-syncing-between-internal-projects
status: publish
title: 'Day 59: More work on syncing between internal projects'
wordpress_id: '688'
categories:
- 8th Light
- Apprentice
---

On Wednesday, I worked with Darius on the syncing between some internal projects. For our main project we want to retrieve some data from another system. That system has a wrapper API on it. The API needed to be expanded to return more types of data for the project we were working. So we needed to modify the remote system, modify the code behind the API on the remote system and then modify the gem that can be used to abstract connecting to the API via HTTP to retrieve records. Then we needed to use the gem to actually pull remote data.

There are a lot of steps here and a lot of places to go wrong. The gem that sits between the systems was creating it's own Ruby classes. The initial version was very simple. A class would look similar to this:

<script src="https://gist.github.com/2504926.js">
</script>

That was fine but more complex records required more accessors and more line of boiler plate code to populate the object attributes. And that kind of code unless it is generated is a hassle. Did you forget one of 13 fields? Are you going to test every single field? It becomes a lot of work and it's just something one is going to get wrong eventually and it is likely going to cause odd errors.

I refactored this code by creating a base class:

<script src="https://gist.github.com/2504946.js">
</script>

Now the Person class looks like this:

<script src="https://gist.github.com/2504953.js">
</script>

And the much larger objects are similar -- just a list of attributes that are expected to come from the JSON request on one side and be populated into our object that is passed off to the gem consumer. And now it is easy for the gem consumer to call .attributes on the object and use that for populating its own class instance that needs this data.
