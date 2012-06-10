---
date: '2012-06-08 23:10:00'
layout: post
slug: fallback-with-twitter-bootstrap-modals
status: publish
title: Fallback with Twitter Bootstrap Modals
wordpress_id: '747'
categories:
- Twitter Bootstrap
---

I'm trying out [Twitter Bootstrap Modals](http://twitter.github.com/bootstrap/javascript.html#modals) and they are great however figuring out how to fall back to support browsers with JavasScript disabled seems like a pain. I went down a rabbit hole of trying to use partials that render partials. It's certainly possible but I ended up reverting as it seemed like a overly complicated and painful path. A possible solution lies in taking the path of defining the fallback form first and then progressively enhancing it to a fancy modal. Perhaps there is a reason the common phrase is progressive enhancement instead of retrograde fallback.
