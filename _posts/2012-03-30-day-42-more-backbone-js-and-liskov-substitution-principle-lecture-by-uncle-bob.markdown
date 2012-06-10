---
date: '2012-03-30 20:30:57'
layout: post
slug: day-42-more-backbone-js-and-liskov-substitution-principle-lecture-by-uncle-bob
status: publish
title: 'Day 42: More Backbone.js and Liskov Substitution Principle lecture by Uncle
  Bob'
wordpress_id: '580'
categories:
- 8th Light
- Apprentice
- University
---

**More Backbone.js**

I spent the morning looking at the branch of another internal project that uses Backbone.js to accomplish almost the same thing I need to do in the internal project. I'd started down the path of keeping jQuery UI and Backbone.js separate. On page load, I would kick off both and the communication between them would be by events. Another approach is to have Backbone.js be responsible for everything so it would configure and bind jQuery UI sortable to the lists. So far, I'm preferring keeping them separated by events because it seems cleaner to me. In either method, one is grepping the source tree to follow what exactly is going on and on that basis I don't see one being more optimal over another. But it is definitely something to think about and ponder on a long term basis. In the short term, I'm going to go forward with my approach to see if I hit any snags.

Update: and once I'd gotten to that point it turned out that there is only a couple lines of jQuery sortable code: binding it to the DOM element(s) and triggering an event with some parameters. I could definitely see pulling this into my Backbone.js code.

**Liskov Substitution Principle by Uncle Bob**

Today's 8th Light University was a lecture on LSP by Uncle Bob proceded by the word wrap kata in C. Unfortunately, there has been a run on the word wrap kata lately and I'm scheduled to present the same next week. Hopefully everyone can withstand it one more time. There is a slight wrinkle in my version that Doug has directed me towards and in some ways it's been better having Mark and Uncle Bob do the kata first so I can start at a different point. We'll see...

Getting back to 8LU, the lecture was interesting as Bob's lectures usually are. If you haven't seen one, you should come to the next 8th Light University. All you have to do is reserve (so we can order enough food). Typically, one arrives at or shortly before noon and the lecture is over by around 1:30-2pm at the latest.
