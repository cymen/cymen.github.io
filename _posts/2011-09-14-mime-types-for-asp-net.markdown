---
date: '2011-09-14 12:28:59'
layout: post
slug: mime-types-for-asp-net
status: publish
title: Mime types for ASP.NET
wordpress_id: '229'
categories:
- ASP.NET MVC
- C#
- Mono MVC
- Programming
- Web Development
---

One of the annoyances working on the Windows/IIS stack is that getting mime types is a pain. They are located in multiple places and there is no really ideal "best practice" method to get mime types without what I consider overly-complicated solutions. In light of this observation I wrote a basic C# program that fetches the mime.types file from the Apache project and converts it to a C# Dictionary&lt;string, string&gt; keyed by file extension. It is a basic program but might be useful for others wondering why in the world this is so complicated.

[ApacheMimeTypesToDotNet](https://github.com/cymen/ApacheMimeTypesToDotNet) on github

The output looks like this: [ApacheMimeTypes.cs](https://github.com/cymen/ApacheMimeTypesToDotNet/blob/master/ApacheMimeTypes.cs)

<script src="https://gist.github.com/2904066.js">
</script>
