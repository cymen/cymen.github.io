---
date: '2012-05-30 21:50:51'
layout: post
slug: day-92-internal-project-and-kata-practice
status: publish
title: 'Day 92: Internal project and kata practice'
wordpress_id: '732'
categories:
- 8th Light
- Apprentice
---

**Internal project**

I spent the day working on a form in Backbone to send an email that allowed editing the To, Subject and Body. The Rails action responsible for the actual sending also attached a number of PDFs to the email. This turned out to be fairly straight forward and is mostly complete. Mike and I paired for part of the day on this and we styled the email form very nicely. It's not perfect but it look good and it uses good HTML markup (a DL with DT for the labels and DD for the input/display). I'm a big fan of definition lists for forms primarily due to working with Nick at Webitects.

**Kata practice**

I'm continuing to practice the kata. The steps are getting smooth although it is hard to remember to run the tests that confirm the incremental refactoring step is successful. Most Katas use test-driven development with a red-green cycle of writing a tests, running the test to see it fail and then writing the code to get the test to pass. The refactoring kata is focused on keeping the tests green while refactoring the code. This kata feels different too because the narration is important as starting with existing code with three classes is a fair amount of context. It should be interesting to perform.
