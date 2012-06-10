---
date: '2012-03-12 14:28:22'
layout: post
slug: leiningen-and-lein-localrepo-how-to-create-local-maven-repository-for-jar-files
status: publish
title: 'Leiningen and lein-localrepo: How to create local maven repository for jar
  files'
wordpress_id: '494'
categories:
- Clojure
- Getting started ...
---

**Problem: Can't find the maven repository for XYZ but have jar file**

I wanted to use [netty 3.3.1.Final](http://netty.io/downloads/) in a Clojure project however according to the old netty site they left the jboss.org foundation which appears to have complicated the inclusion of the most recent versions of netty in the "central maven repository". There is probably a maven repository out there for netty which has 3.3.1.Final but I can't find it.

**Solution: Use a local maven repository**

If you can download the jar file then you can use the solution of creating a local maven repository and adding the jar file to it. I did this with these steps for netty 3.3.1.Final:



	
  1. 

    
    <code>lein plugin install lein-localrepo "0.3"</code>




	
  2. Download netty 3.3.1.Final from [netty.io/downloads/](http://netty.io/downloads/) with

    
    <code>wget http://netty.io/downloads/netty-3.3.1.Final-dist.tar.bz2</code>




	
  3. Uncompress the tar file:

    
    <code>tar jxf netty-3.3.1.Final-dist.tar.bz2</code>




	
  4. Add the jar file to the local maven repository:

    
    <code>lein localrepo install netty-3.3.1.Final/jar/netty-3.3.1.Final.jar io.netty/netty 3.3.1.Final</code>





Now the project.clj can look like this for netty 3.3.1.Final:

    
    (defproject clojure-netty "1.0.0-SNAPSHOT"
      :description "FIXME: write description"
      :dependencies [[org.clojure/clojure "1.4.0-beta1"]
                     [io.netty/netty "3.3.1.Final"]])


Note that I chose to put netty into the local repo as io-netty/netty. I should have used local.repo/netty however [lein-localrepo](https://github.com/kumarshantanu/lein-localrepo) doesn't have remove implemented yet so I left it as is. Using local.repo/netty would reduce confusion when sharing your project on github.

**Update: Manually removing items from local maven repository**

Having netty as io-netty/netty in my local repository bothered me. I found that the maven repository existed as ~/.m2/repository and removing netty was accomplished with:


    
    <code>rm -rf ~/.m2/repository/io</code>



After verifying the io directory held only the netty installation. I was then able to reinstall netty locally with:


    
    <code>lein localrepo install netty-3.3.1.Final/jar/netty-3.3.1.Final.jar local.repo/netty 3.3.1.Final</code>



Now my project.clj should be clearer:


    
    (defproject clojure-netty "1.0.0-SNAPSHOT"
      :description "FIXME: write description"
      :dependencies [[org.clojure/clojure "1.4.0-beta1"]
                     [local.repo/netty "3.3.1.Final"]])



