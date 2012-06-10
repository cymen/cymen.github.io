---
date: '2012-02-09 09:20:46'
layout: post
slug: day-6-minimax-to-negamax
status: publish
title: 'Day 6: Minimax to Negamax'
wordpress_id: '320'
categories:
- 8th Light
- Apprentice
---

I have a working version of minimax/negamax. On an empty tic-tac-toe board, it will return 0 for each square. This makes sense because it is basically playing itself so every choice is going to result in a draw. Only while talking to Wiley (another apprentice) did that become clear. That means there needs to be some more initial logic somewhere for the computer to pick the initial space at the beginning of the game if it is x as some spaces are better than others for optimal moves. Or the depth of the move could be a multiplier of the returned value so that good "more close" moves down the tree are weighted heavier than good moves further down the tree. Hrm...
