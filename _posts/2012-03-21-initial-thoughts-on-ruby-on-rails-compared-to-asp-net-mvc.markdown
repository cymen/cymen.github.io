---
date: '2012-03-21 14:33:57'
layout: post
slug: initial-thoughts-on-ruby-on-rails-compared-to-asp-net-mvc
status: publish
title: Initial thoughts on Ruby on Rails compared to ASP.NET MVC
wordpress_id: '535'
categories:
- ASP.NET MVC
- Ruby on Rails
---

I'm coming to the Rails world via the work of 8th Light on the [Clean Architecture approached advocated by Robert Martin and 8th Light](http://blog.8thlight.com/uncle-bob/2011/11/22/Clean-Architecture.html). My prior experience with web frameworks is Zend (PHP) and ASP.NET MVC 2 and 3 (using C#). My initial thoughts on this is that Ruby on Rails has a lot of "magic". Way more than ASP.NET MVC. I think this is because of the collaborative nature of Rails. There are tons of gems at rubygems.org and Microsoft is playing catch up on this with [NuGet](http://nuget.org/). However my opinion is that Microsoft would do well not to fully match the Rails experience. At first, gems seem like an excellent idea. But the fast pace of change with Rails, the locking down to specific gem versions in Gemfiles and the perverse extent of "magic" sometimes cause quite a few problems that aren't present with ASP.NET MVC.

It's as if all the work to improve Rails knocked off all the sharp edges (some still present in ASP.NET MVC) however it kept going. Now your JavaScript files are not static resources but are instead parsed files on the server side for doing inclusions. The same thing is happening with Stylesheets! These two things are examples of "magic" which I think goes too far. Rails is overly complex when you attempt to go against the grain. At least if you attempt to start from vanilla and withdraw (as [Clean Architecture](http://blog.8thlight.com/uncle-bob/2011/11/22/Clean-Architecture.html) advocates away from the tight integration of business logic into models that tie into ActiveRecord database logic). I have seen some blog posts arguing that Rails 3 makes things much more modular and that this fact is not currently well known or popular in the Rails community. I would like to learn more about this...

I see something similar to [Clean Architecture](http://blog.8thlight.com/uncle-bob/2011/11/22/Clean-Architecture.html) advocated in the [ASP.NET MVC in Action](http://www.manning.com/palermo/) (Manning) book by Jeffrey Palermo, Ben Scheirman, and Jimmy Bogard. It is not presented as abstractly as Robert Martin has done in the 8th Light blog post but instead wrapped into the presentation of how the authors use ASP.NET MVC and AutoMapper to separate the business logic from the framework in a complex web application. The book actually feels somewhat like two stories in one: how to use ASP.NET MVC and how authors use it in a specific context. However it works well as it is an "in Action" book and it deliveries more than expected (dependency injection, testing, etc).

Similarly, I've split this post into two streams:



	
  1. Rails versus ASP.NET MVC

	
  2. Clean Architecture


I don't have anything more to currently say about Rails as it is early days. No doubt the "magic" will soon seem inconsequential. However I wonder if a better approach to Clean Architecture (which still conforms to Robert Martin's blog post) is to let the web framework be the web framework. Don't fight it. Let it have it's models but use those models for presentation and use Interactors to populate those models in the controller actions from a completely separated code base which can be tested in isolation. The way the ASP.NET MVC in Action authors have accomplished this is to use [AutoMapper](http://automapper.codeplex.com/) to map between the framework models and the business logic models. I think that approach makes a lot of sense and results in a clean separation of concerns.
