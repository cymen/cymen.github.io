---
date: '2012-04-12 21:52:23'
layout: post
slug: working-at-an-internet-service-provider
status: publish
title: Working at an Internet Service Provider
wordpress_id: '644'
categories:
- Internet
- ISP
---

While completing my undergraduate degree in Computer Science at the University of Wisconsin at Madison I worked for a regional Internet Service Provider. I need a job during the summers to help pay for school and it seemed like an interesting option. My prior experience with IT was setting up small networks, Linux servers, and Lotus Notes. I'd also learned how to create websites using LAMP (Linux, Apache, MySQL and PHP) and develop Lotus Notes applications.

The prior summer I'd worked for a different company testing all their legacy applications to ensure they would run on Windows. These were DOS applications and I remember some were written in Clipper. The problem with the DOS applications was that some had timing loops that were calculated on start up and the CPUs they were running on where too fast so the time measured between point A and B was 0. Can you guess where that is going? The time delta was divided by some fraction for use in the system and when it was 0 the program crashed with a division by zero error. I figured out a hack to get these programs to work: use a program that hogged the CPU in order to cause the DOS application to run slower and get a non-zero time for the timing delta. In some cases the source code had been lost for the application. It was an interesting experience but working at an ISP sounded like a good change of pace.

I started out working the help desk at the ISP. This was interesting... About two months in I had my first experience with someone so irate that they verbally berated me over the phone and would not listen to reason. Thankfully a coworker walked over and pressed the hangup button after I'd repeatedly asked the caller to calm down. Welcome to first level technical support!

I moved up the ranks to work on the network operations side which worked with business customers and monitored an incident queue that included automated alerts from production environments. We monitored everything. Some customers only wanted to pay us for power, cooling and rack space. Some customers wanted managed services which included having our company keep their servers patched and up to date and respond to any other issues (hardware or software). I became exposed to a wide range of hardware and software. My troubleshooting skills improved quite a bit as I needed to quickly determine what was wrong when an alert came in and then pass it off to the appropriate technology team.

After I completed my degree at UW-Madison I returned to the Internet Service Provider to work on the team responsible for developing and keeping operational internal tools. I was one of two people responsible for the daily operation of a monitoring system that monitored everything including remote customer environments. There were thousands of servers, network devices and applications that we collected samples from every 5 minutes and stored in a database in order to generate reports. The same probes responsible for collecting the samples actually checked for faults more frequently -- typically 30 or 60 seconds. When an alarm condition was met the message would flow through the monitoring system. If it wasn't matched by a filter, it would emit to a queue that would be displayed to those working in the network operations center.

So that a is brief overview of what it was like to work at an internet service provider that started to focus more on providing managed services. Working in the network operations center (NOC) provided constant challenges every day. If one worked nights (6pm to 6am which I did for a couple of months), one had the additional excitement of trying to determine if floods of alerts were due to system maintenance or an actual issue. Working on the monitoring and internal tools team was a relief after a couple years of experience in the NOC. Making tools that made my coworkers jobs easier was satisfying and ultimately that pushed me on wards to focus on software development.
