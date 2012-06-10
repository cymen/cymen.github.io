---
date: '2012-03-09 10:35:47'
layout: post
slug: clojure-using-clojuretools-cli-to-parse-command-line-arguments
status: publish
title: 'Clojure: using clojure/tools.cli to parse command line arguments'
wordpress_id: '455'
categories:
- Clojure
- Getting started ...
---

For my HTTP server project I want the option of configuring it on the command line for at least the port, document root and potentially IP to listen on (or all). I came across [Building a Clojure app with a command-line interface?](http://stackoverflow.com/questions/1341154/building-a-clojure-app-with-a-command-line-interface) on StackOverflow which informed me that clojure.tools.cli was the right path to take over the with-commmand-line.

Here is an example of using clojure/tools-cli which revealed some Clojure syntax I'd overlooked (more on that later):

    
    (ns server.core
      (:gen-class)
      (:require [clojure.tools.cli :as c]))
    
    (defn -main [& args]
      (let [[options args banner]
            (c/cli args
              ["-port" "Port to listen on" :default 5000]
              ["-root" "Root directory of web server" :default "public"])]
        (println "port:" (:port options))
        (println "root:" (:root options))))





	
  * **options** is a hash-map of the parsed options

	
  * **args** is the other arguments on the command line

	
  * **banner**is a string one can print for command line options -- for this program, it would contain:

    
    Usage:
    
     Switches  Default  Desc
     --------  -------  ----
     -port     5000     Port to listen on
     -root     public   Root directory of web server





Note that tools.cli throws an exception when an unrecognized command line option is provided like so:

    
    Exception in thread "main" java.lang.RuntimeException:
      java.lang.Exception: '-z' is not a valid argument




I guessed it would default to showing the banner it generates but it does not do so.



**Basic Clojure Syntax**
I wasn't aware one could take a returned vector and assign its contents to multiple variables with let as done in this line from above:

    
    (let [[options args banner] ...


In a prior post, I explained how I was passing back a response to an HTTP request as a hash-map of hash-maps. This can start to get confusing and I think the approach used above can make this simpler -- instead of a hash-map of hash-maps consider returning a vector of hash-maps.
