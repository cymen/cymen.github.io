---
date: '2011-08-03 20:48:59'
layout: post
slug: when-not-to-use-automapper
status: publish
title: When not to use AutoMapper
wordpress_id: '209'
categories:
- ASP.NET MVC
---

AutoMapper is great but it is both specialized, heavy duty and lacking in documentation. The lack of documentation can bite you: if you need to map two objects in different ways in different places things may not work as you expect. For example, say I have Mapper.CreateMap&lt;MyObject, MyObject&gt;() with a number of .ForMember(x =&gt; x.Something, opt =&gt; opt.Ignore()). Now if I create the same mapping elsewhere but with different .ForMember options the prior .ForMember mapping options persist into my current map. To fix this, one can do a Mapper.Reset() which will blow away the global mappings. But creating mappings is expensive. Food for thought.
