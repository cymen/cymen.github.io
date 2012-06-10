---
date: '2012-03-08 15:34:36'
layout: post
slug: leningin-and-exception-in-thread-main-java-lang-noclassdeffounderror
status: publish
title: 'Leningin, uberjar and Exception in thread "main" java.lang.NoClassDefFoundError:
  ...'
wordpress_id: '440'
categories:
- Clojure
- Getting started ...
---

The bare minimum to get a leningin uberjar to run properly on the command line is:



	
  1. The [namespace that contains -main method](https://github.com/cymen/hello-world/blob/master/src/hello_world/core.clj) must have :gen-class applied like so:

    
    (hello-world.core
      (:gen-class))




	
  2. The [project.clj](https://github.com/cymen/hello-world/blob/master/project.clj) must have a :main setting that points to the namespace containing -main:

    
      ...
      :main hello-world.core
      ...






Now both **lein run** and **java -jar hello-world-1.0.0-SNAPSHOT-standalone.jar** produce the output **Hello world!**. This project is [on github as "hello world"](https://github.com/cymen/hello-world).
