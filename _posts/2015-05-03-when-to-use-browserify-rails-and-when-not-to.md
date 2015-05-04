---
layout: post
title: "When to use browserify-rails and when not to"
description: ""
category: 
tags: []
---

In 2014, I joined a startup and began rewriting their single page web application. One developer had been working on that particular part of the site and it was long in tooth. Startups need to iterate fast and try new ideas and their codebases typically reflect that. Many developers at startups talk about switching from one language to another as if that was the solution to their problems but in reality, most of the time, the rewrite is simply getting rid of all the cruft that has built up along with the knowledge the developers have built by working on the existing code.

So it was no surprise that the JavaScript didn’t use modules, had a lot of very confusing global usage and a fair amount of dead code. Because the rest of the site had been rewritten from PHP to Ruby on Rails, I wanted to use tooling that the average Rails developer would be comfortable with. But I also wanted CommonJS modules — my experience has been that the simple things like modules are critical.

In the Rails world, the tooling typically hooks into the request cycle. A developer can change a Ruby file, reload the page and their change is live. It would have been possible to use [browserify](https://github.com/substack/node-browserify) directly by spinning up a process (say via foreman which was already in use on the project) however the behavior with that approach would not be the same. The rebuilding of the JavaScript would not be synchronous with the page request.

Another great developer on the team was already using [browserify](https://github.com/substack/node-browserify) and I was excited at the prospect of using node modules. I found the hsume2-[browserify-rails](https://github.com/browserify-rails/browserify-rails) Ruby gem. It was missing some important features so I forked it and we began using it to refactor our existing JavaScript to CommonJS. I later was able to get my merges in along with getting the browerify-rails gem name from another developer that was not using it.

Because it was a painful process that would be easy to get bogged down in, we decided to rewrite it as is — to avoid spending too much time refactoring the existing code. That way we would work in phases: get the code base to modules then focus on refactoring the individual modules (while of course juggling add new features).

In the end, I contribute quite a bit to the gem and continue to work on it today. But I have noticed that not everyone is sure when using something like [browserify-rails](https://github.com/browserify-rails/browserify-rails) is appropriate. Of course, I think it is best that people make up their own minds but I will outline my thinking.

On an existing code base that already has a bunch of JavaScript that is typical non-modular code, using browerify-rails makes complete sense. You can rewrite to modules in parts as you go — just change the code to a module and have some other code require it and export it as a global again. That will let you refactor to modules without a huge amount of interruption and it works as one might expect in the Rails ecosystem.

On a fresh project that is expected to grow and have a large amount of client-side rendering JavaScript, I would not use [browserify-rails](https://github.com/browserify-rails/browserify-rails). I would instead use [webpack](https://github.com/webpack/webpack) or [browserify](https://github.com/substack/node-browserify) directly. This of course disrupts the synchronous build process but I argue that it is less important because if the rendering is all happening client-side, the asynchronous disconnect will not be a problem the vast majority of the time. There are also performance benefits to using [browserify](https://github.com/substack/node-browserify) or [webpack](https://github.com/webpack/webpack) directly instead of through the Rails asset pipeline and it keeps things simpler.

Of course, that begs the question: is Ruby on Rails an appropriate stack for a modern client-side rending web application. That is a very loaded question but I do think it is something that should be asked on any new project. Isomorphic web applications are coming and they are coming for solid technical reasons. Choose your stack carefully.
