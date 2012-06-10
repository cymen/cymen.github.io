---
date: '2008-12-22 10:14:42'
layout: post
slug: shooting-yourself-in-the-foot-with-perl
status: publish
title: Shooting Yourself in the Foot with Perl
wordpress_id: '36'
categories:
- Programming
tags:
- Perl
---

**Returning Multiple Values**

    
    $error, $hash = function_a( ... );
    if ( $error ) { error(); }    // never runs


Correction:

    
    ($error, $hash) = function_a( ... );
    if ( $error ) { error(); }    // runs on error
