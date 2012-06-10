---
date: '2012-02-09 15:25:44'
layout: post
slug: day-7-testing-approach-pays-off
status: publish
title: 'Day 7: Testing approach pays off'
wordpress_id: '322'
categories:
- 8th Light
- Apprentice
---

I spent the morning bashing my head against Negamax trying to figure out why my approach wasn't working. In the afternoon, I decided to go forward from what I knew was working with my test cases so far instead of trying to make a huge leap (my huge leap was running it on an empty board which was returning 0 for all spaces).

The pay off was that I was able to resolve a sign bug in my implementation by writing another "small step" test and then fixing the bug that prevented it from working.
