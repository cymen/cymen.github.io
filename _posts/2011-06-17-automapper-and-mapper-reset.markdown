---
date: '2011-06-17 14:55:17'
layout: post
slug: automapper-and-mapper-reset
status: publish
title: AutoMapper and Mapper.Reset()
wordpress_id: '197'
categories:
- ASP.NET MVC
---

Did you know that AutoMapper's Mapper.CreateMap&lt;T1, T2&gt;() persists even if you use different options on the mapping? So if you have this in one place in your code:

<script src="https://gist.github.com/2904068.js">
</script>

And then later this:

<script src="https://gist.github.com/2904070.js">
</script>

That second usage won't map BrainSize! This is quite confusing... The cache makes sense but it would be more intuitive if the cache was sensitive to .ForMember() usage and other options so that the exact same mapping is cached not any mapping.

The solution is to use this (potentially both before and after your use of AutoMapper):

<script src="https://gist.github.com/2904079.js">
</script>

I haven't read the source yet but this is a very non-intuitive aspect of AutoMapper. Basically on the level of a deal breaker almost in my opinion.
