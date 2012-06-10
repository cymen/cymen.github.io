---
date: '2010-07-09 17:09:47'
layout: post
slug: asp-net-mvc-route-registration-and-areas
status: publish
title: ASP.NET MVC Route Registration and Areas
wordpress_id: '162'
categories:
- ASP.NET MVC
---

I need to be able to register a route via an instance of RouteCollection to an area. I couldn't put it in the normal area route registration as it had to be registered last. It took a while to figure out that this works:

    
    
    public static void RegisterAreaRoute(RouteCollection routes) {
        routes.MapRoute(
            "MyRouteName",
            "{*path}",
            new
            {
                // options
            },
            new[] { "_Namespace_.Areas._Area_Name_.Controllers" }
        ).DataTokens.Add("area", _Area_Name_);
    }
    
