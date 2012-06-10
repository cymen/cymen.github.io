---
date: '2012-03-21 13:56:12'
layout: post
slug: day-34-presenting-internal-project-to-paul
status: publish
title: 'Day 34: Presenting internal project to Paul'
wordpress_id: '529'
categories:
- 8th Light
- Apprentice
---

Today the team of apprentices working on the internal project presented our first iteration to Paul playing the role of the client. We completed the iteration successfully which was a relief however it was not without a lot of last minute effort. Thankfully, the deadline was extended from 10am to 2pm which gave us enough time to get the testing up to snuff. Paul as the client accepted the iteration then we collaborated to create the next iteration. After the purposed stories were created, the team without the client estimated the stories. Later on Paul returned and had to move one story to the backlog as our total hours were exceeded.

Then we looked at the code base with Paul and he pointed out some areas in which we were lacking "[screaming architecture](http://blog.8thlight.com/uncle-bob/2011/09/30/Screaming-Architecture.html)". We also discussed some of the abstractions present in the code base. The main questions were why were we using the abstraction? What was the value of having a layer of abstraction between the interactor and active record which we've called a database adapter? We also looked at some of the tests and Paul questioned why some testing was done as it was. Did we really need a singleton pattern in some cases? Or was that only present in order to make testing easier yet there were other ways to achieve the same thing?

These were all interesting questions. Our architecture has definitely become more complex and I think the reasons for this are:



	
  * using the interactor approach

	
  * inheriting an existing project and going with it instead of questioning the abstractions as a team

	
  * complicated testing



If we continue with the "controller actions pass a callback to the interactor" approach it seems clear to actually benefit from this we need to pass in a failure path callback which could do something like return an HTTP 500 response or some other response with error text. It would also be useful to see what exactly using a callback is giving us. Paul mentioned at one point we could simply call the interactor and get a response which in other interactor approaches would be a presenter object. Perhaps when Doug and I go over my work (as suggested by Paul) we can discuss this.

However I don't mean to be overly pessimistic. The project is going well. The next interaction has some exciting stories!
