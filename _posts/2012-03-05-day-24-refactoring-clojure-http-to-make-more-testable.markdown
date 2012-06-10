---
date: '2012-03-05 20:20:03'
layout: post
slug: day-24-refactoring-clojure-http-to-make-more-testable
status: publish
title: 'Day 24: Refactoring clojure-http to make more testable'
wordpress_id: '394'
categories:
- 8th Light
- Apprentice
- Clojure
---

I spent the day mulling over how to refactor my server to achieve two goals:



	
  1. Be more testable without having to mock input and output streams

	
  2. Allow logging of requests similar to Apache which is a cross-cutting concern: the log needs to know client details (IP), request details (method type, path with query) and response details (response code, response content length)


I knew that if I had some sort of data structure for each method type (where a method is GET, POST, etc) it would be easier to do this. My code took the easy route and just wrote straight to the output stream. I was able to mock an output stream using a ByteArrayOutputStream which has a handy toString() method but this seem like a bit much. I'd have to parse my output and what if there was a bug in that parser? Plus it's more code to test and more code to write.

After more time than seemed reasonable I suddenly concluded I could indeed return a hash-map quite easily in clojure like so:

    
    (defn my-method [request]
      (hash-map
        :Status-Line {
          :HTTP-Version ...
          :Status-Code 200
          :Status-Message "OK"
        }
        :Headers {
          :Date (date-in-gmt)
          :Server "blah blah/1.0"
         }
        :Body {
           ...
        }))


Why did it take so long to see that? I'm not sure... But I'm happy with my abstraction as I can now test my methods by passing in a hash map (the request) and getting back a hash map (the response).

The other issue I ran into was how to delay creating the body of the response. There isn't always a body for an HTTP response however when there is I'd rather push it directly out of my program than hold it in a buffer. That sounded familiar and I realized a closure would be appropriate. This made me slightly nervous as file input output in a closure seems risky however my IO functions seemed high enough and were only relying on filename so it seemed safe. For an HTTP GET, my hash map response looks like:

    
    (defn my-method [request]
      (hash-map
        :Status-Line {
          ...
        }
        :Headers {
          ...     }
        :Body (fn [output] (copy (input-stream filename) output)))))
        ; copy input-stream from clojure.contrib.io


The closure is closed in the main loop of the server (well, in the thread responsible for the handling the request):

    
        ...
        (if (contains? response :Body)
          ((:Body response) out))
        ...


I haven't run ApacheBench against the server after this change but I will after some more cleanup work to get all the response methods using this approach. Hopefully, the server isn't leaking file handles or consuming memory in some odd way due to this approach.
