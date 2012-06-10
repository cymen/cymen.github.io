---
date: '2012-03-07 22:55:31'
layout: post
slug: day-26-decision-to-redo-http-server-code-katas
status: publish
title: 'Day 26: Decision to redo HTTP server, code katas'
wordpress_id: '432'
categories:
- 8th Light
- Apprentice
---

**HTTP server**

I discussed my HTTP server with Doug and he mentioned one option I had thought about earlier: why not start over? The main issue is not writing it with a test first approach which means the benefits of emergent design and series of simple tests serving as documentation aren't present. The github repository for the second attempt is at [clip-clop](https://github.com/cymen/clip-clop).

**Code Kata**

I'm working on the [wordwrap code kata](http://thecleancoder.blogspot.com/2010/10/craftsman-62-dark-path.html) which is an exercise in writing a method to wrap text to a specific column length. So for example, "word word word" with column length 6 would wrap to:


word
word
word


And "word word" with column length 3 would wrap to:


wor  
d  
wor  
d


While that wrapping style might seem odd that is the aim of the code kata.

I find doing katas to be a real struggle. The idea is to do things in a specific rehearsed sequence that shows a progression from nothing to a tested method. Doug encouraged me to think of katas as a form of acting and I'm attempting to do so (clarification: Doug actually said that about a specific part of the word wrap kata).

Uncle Bob has more thoughts on the [word wrap kata](http://cleancoder.posterous.com/the-transformation-priority-premise) that explore why sometimes it can result in a dead end that requires backtracking.
