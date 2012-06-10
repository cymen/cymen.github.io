---
date: '2011-11-18 08:55:48'
layout: post
slug: asp-net-mvc-and-dropdownlist-one-approach
status: publish
title: 'ASP.NET MVC and DropDownList: One approach...'
wordpress_id: '280'
categories:
- ASP.NET MVC
---

One thing that I'm not particularly fond of in ASP.NET MVC is figuring out where to put additional data one needs for views. If one is using a "model per view" approach it is simple -- stick it in that model. Otherwise you can choose to add it to a model that won't always need it or pass it via ViewBag/ViewState. I currently lean towards the last option.

The other annoyance is how best to transform a list of objects into a IEnumerable&lt;SelectListItem&gt; collection cleanly with the special case of handling a default value. I have started to approach this with extension methods and am very happy with how it is working.

**Transforming your List&lt;MyObject&gt; to IEnumerable&lt;SelectListItem&gt;**

Our current data tier has a manager class for each object type. When that object type is going to be used in a select list, I add an extension to IEnumerable&lt;MyObject&gt; like so:


<script src="https://gist.github.com/2904048.js">
</script>


To support the option of a default value, I have an extension method that applies to IEnumerable:


<script src="https://gist.github.com/2904050.js">
</script>
    

Here is an example of an actually call to this methods in:


<script src="https://gist.github.com/2904052.js">
</script>
