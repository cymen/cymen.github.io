---
date: '2012-04-30 10:00:38'
layout: post
slug: day-61-another-iteration-meeting-on-the-internal-project-patrick-presents-at-8lu
status: publish
title: 'Day 61: Another iteration meeting on the internal project, Patrick presents
  at 8LU'
wordpress_id: '701'
categories:
- 8th Light
- Apprentice
---

### Another iteration meeting on the internal project



We had another iteration meeting for the internal project. We completed all the stories successful for the iteration. There were one or two design changes related to stories but the client and the designer made a side deal to take care of the minor changes for 0 points in this iteration.

Our simple syncing approach is working well. There are some obvious ways to optimize it: update the API to have an option to only return data modified since a certain timestamp. All of the records we're getting have Active Record timestamps which means they have created_at and updated_at on every record. It is easy however we'd need to make sure the API was time zone agnostic so perhaps require date times in GMT. For now though I think we made the right choice: there isn't that much data to sync so brute force is fine.



### Patrick presents



Patrick presented "Distributing Jobs And Data For System Scalability" as the final part of his apprentice challenge. It was a great presentation and a lot of fun. He incorporated audience participation as part of his presentation (as did the most recent two apprentice presentations by Stephanie and Wai Lee).

Patrick started a simple Rails site on his laptop that presented each person with a single character input box and a submit button. Then we all tried to spell out "helloworld" without a typo. On typo, the attempt restarted. It was very hard to do and even in later rounds when we were allowed to communicate with each other it still took a while. The optimal approach at that time would have been to give 10 people one letter each and have them go in order. That way they could pre-populate the input form and submit in order quickly. In any case, it was a lot of fun and an interesting presentation.
