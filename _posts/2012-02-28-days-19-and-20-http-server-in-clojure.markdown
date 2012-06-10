---
date: '2012-02-28 20:33:12'
layout: post
slug: days-19-and-20-http-server-in-clojure
status: publish
title: 'Days 19 and 20: HTTP server in Clojure'
wordpress_id: '376'
categories:
- 8th Light
- Apprentice
---

I spent yesterday and today working on my [clojure-http](https://github.com/cymen/clojure-http) project. These features work but are still rough:



	
  * HTTP GET - can respond with text or binary files, directory listings and sort of 404

	
  * HTTP POST - can process body for text ("url encoded") data but still rough


The hardest part so far has been IO. Reading lines of text and characters from input streams can be tricky.
