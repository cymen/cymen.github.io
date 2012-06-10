---
date: '2012-02-29 18:35:08'
layout: post
slug: day-21-splitting-up-clojure-http-server-into-multiple-namespaces-put-etc
status: publish
title: 'Day 21: Splitting up Clojure HTTP server into multiple namespaces, PUT, etc'
wordpress_id: '379'
categories:
- 8th Light
- Apprentice
- Clojure
---

Spec testing is lacking in my [Clojure HTTP server project](https://github.com/cymen/clojure-http). In order to facilitate testing, I split up the "all in one" core.clj file (and namespace) into a bunch of files (and namespaces). While doing this, it became clearer that some things shared between the functions needed to be separated out in order to be reused in multiple namespaces.

So the original project was basically:



	
  * core.js with namespace of clojure-http.core


This is now split up (and refactored where appropriate) into:

	
  * [core.clj - clojure-http.core](https://github.com/cymen/clojure-http/blob/master/src/clojure_http/core.clj)

	
  * [method.clj - clojure-http.method](https://github.com/cymen/clojure-http/blob/master/src/clojure_http/method.clj) which contains a [defmulti](http://clojuredocs.org/clojure_core/clojure.core/defmulti) which allows implementing a HTTP response method for each type (ie GET, POST, etc) as [defmethod](http://clojuredocs.org/clojure_core/clojure.core/defmethod)

	
  * [method_get.clj - clojure-http.method-get](https://github.com/cymen/clojure-http/blob/master/src/clojure_http/method_get.clj)

	
  * [method_head.clj - clojure-http.method-head](https://github.com/cymen/clojure-http/blob/master/src/clojure_http/method_head.clj)

	
  * [method_post.clj - clojure-http.method-post](https://github.com/cymen/clojure-http/blob/master/src/clojure_http/method_post.clj)

	
  * [method_put.clj - clojure-http.method-put](https://github.com/cymen/clojure-http/blob/master/src/clojure_http/method_put.clj)

	
  * [parse_request.clj - clojure-http.parse-request](https://github.com/cymen/clojure-http/blob/master/src/clojure_http/parse_request.clj)

	
  * [response.clj - clojure-http.response](https://github.com/cymen/clojure-http/blob/master/src/clojure_http/response.clj) which currently shares the implementation of the date creating methods for the HTTP response headers but should soon include more things like HTTP error code responses or should be renamed


I wasn't sure if it would work to put the defmethod implementations into separate namespaces but it worked out well. A blog post by [Colin Jones](http://www.8thlight.com/our-team/colin-jones) named [Clojure Libs and Namespaces: require, use, import, and ns](http://blog.8thlight.com/colin-jones/2010/12/05/clojure-libs-and-namespaces-require-use-import-and-ns.html) was helpful for understanding the options in Clojure for working with namespaces.

On the testing front, I read through the [speclj tutorial](http://speclj.com/tutorial) and tried some of the tutorial tests. It looks good! Now that the code is separated nicely I can write tests by namespace and look for more violations of the [single responsibility principle](http://www.objectmentor.com/resources/articles/srp.pdf) (in Clojure, this seems to be by namespaces in lieu of classes).

Finally, the server is passing the FitNesse-based [cob_spec](https://github.com/8thlight/cob_spec) test suite. I'm still slightly confused on exactly how FitNesse works. I think my issue is that it is a bit clunky and some of the test code is (at least in this case) in Ruby code. So the implementation is hidden from the wiki view and you can't really tell what the test is doing unless the test names and other names are crystal clear. It is at least starting to make sense. The final part of my Clojure HTTP project is to add a test to this suite so I'm mulling over what to do.

Oh, and my Clojure HTTP server is named clip-clop because I like it and it's sort of like the HTTP request-response cycle: a request (clip) always has a response (a clop). Maybe it should be cliplj-clopjl but that is ridiculous!
