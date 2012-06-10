---
date: '2012-04-23 11:46:23'
layout: post
slug: easy-cdn-making-use-of-amazon-cloudfront
status: publish
title: 'Easy CDN: Making use of Amazon CloudFront'
wordpress_id: '674'
categories:
- Amazon Web Services
---

I've had a few issues with the micro EC2 instance that hosts this blog on Amazon Web Services. I've adjusted some database and HTTP server settings in order to prevent the server running out of memory (it's never a good thing when the OOM or out of memory handler on Linux has to randomly pick something to kill). While working on that issue, I discovered how easy it is to use the [Amazon CloudFront CDN](http://aws.amazon.com/cloudfront/) or content distribution network.

The purpose of a CDN is to offload the hosting of static files like images, javascript and CSS to another provider that has geographically distributed servers that are close to your audience. These static files can then be served from the CDN which means your web server doesn't have to handle all the requests for static files. The reason this is a big benefit is that typical HTTP servers are configured to respond to any request type. So even if all you're asking for is a simple static image file the server thread responding to your request is ready to parse some dynamic content, connect to a database or do some other potentially computationally expensive and more importantly memory intensive operation.

So the CDN servers can handle all the static requests and your web servers handle the requests that actually computation. Another benefit to this is that browsers typically can request only so many files at a time from a web server. Now that the static assets are off on the CDN the browser is connecting to a different web server for those assets. Which means more requests at the same time because it is talking to multiple web servers and thus the total response time should be faster.

What do you need to do to make use of a CDN? A CDN, a way for the CDN to get the assets and the asset URLs need to be rewritten to go to the CDN in the content served.

[Amazon CloudFront](http://aws.amazon.com/cloudfront/) can work in two ways: serve items from a simple storage bucket that you are responsible to load or it can be a proxy to your web server. I chose the later option so the CDN becomes a proxy for blog.cymen.org. I then used a plugin for this blog that can rewrite the assets to the CDN URL.

So what looks different in the end? To the average user, nothing except perhaps the site is a bit faster (and your page rank may go up a bit on Google due to the faster response). If you dig down into what is being loaded, you'll see that this URL:

http://blog.cymen.org/wp-content/themes/journalist/style.css

Becomes:

[http://d3prtklht4pqfy.cloudfront.net/wp-content/themes/journalist/style.css](http://d3prtklht4pqfy.cloudfront.net/wp-content/themes/journalist/style.css)

The [Amazon CloudFront pricing](http://aws.amazon.com/cloudfront/pricing/) is fairly inexpensive to experiment with so if you're curious it is well worth trying it. The biggest issue for a legacy site is modifying the static file URLs to use the CDN however it isn't an all or nothing: you could start with the biggest static resources and start reducing the server load and increasing the performance of your site within minutes.
