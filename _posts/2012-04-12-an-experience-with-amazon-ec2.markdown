---
date: '2012-04-12 21:18:25'
layout: post
slug: an-experience-with-amazon-ec2
status: publish
title: An experience with Amazon EC2
wordpress_id: '641'
categories:
- Amazon Web Services
---

This evening I decided to update the linux installation on the Amazon EC2 instance that hosts this blog. The machine image in use was from Amazon (aka AMI or Amazon Machine Instance) and was also fairly old. Somehow, the upgrade failed and I was left with an unbootable server. A complete outage.

Because my filesystem was on an elastic block store (EBS) I was able to create a new server using the most recent Amazon AMI and then attach the old EBS to the new server and mount it. I migrated the database files without issue and then the web server configuration, files, and logs.

This time around I created an elastic IP which gives me a static IP that I can point at an Amazon EC2 instance. This means I can create another EC2 instance and change where the elastic IP points without having to update DNS! I then updated my DNS records to point to the elastic IP and the site was operational once again.

I was initially somewhat dismayed that that the upgrade went wrong. However it was an interesting experience. If one has to do something like this with physical servers it can take a day. With Amazon web services it took roughly and hour and everything was back up and running. There are a whole host of issues with virtual servers but there are certainly wonderful benefits to be had too.
