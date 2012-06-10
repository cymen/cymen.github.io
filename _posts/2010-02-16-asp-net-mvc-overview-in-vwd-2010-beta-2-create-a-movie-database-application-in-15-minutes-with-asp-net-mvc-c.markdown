---
date: '2010-02-16 18:59:17'
layout: post
slug: asp-net-mvc-overview-in-vwd-2010-beta-2-create-a-movie-database-application-in-15-minutes-with-asp-net-mvc-c
status: publish
title: 'ASP.NET MVC Overview in VWD 2010 Beta 2: Create a Movie Database Application
  in 15 Minutes with ASP.NET MVC (C#)'
wordpress_id: '112'
categories:
- ASP.NET MVC
- Web Development
---

I am going to blog about each tutorial mentioning just the issues encountered with VWD 2010 Beta 2 and ASP.NET MVC 2 RC installed.



	
  1. The Model generated using the Microsoft Entity Framework named "MoviesDBModel.edmx" did not have MovieSet as in the article but instead Movies1. There is an option in MoviesDBModel.edmx on the properties of Movie that has "Entity Set Name" defaulting to Movies1 -- that should be changed to MovieSet.


