---
date: '2012-06-14 20:14:00'
layout: post
slug: prawn-versus-wkhtmltopdf
status: publish
title: 'Prawn or wkhtmltopdf?'
categories:
- Ruby
- PDF
---

One of the internal projects I've been working on for the past couple months at 8th Light needed a PDF. At first, the PDF only needed to be one page long. With that requirement, choosing to reuse an HTML view by convert it to a PDF by rendering it via webkit with wkhtmltopdf seemed like an acceptable trade off. However, a month later we needed that PDF to support multiple pages. While wkhtmltopdf does have some paging support it is difficult to use. One has to apply CSS classes to prevent breaking over elements (so an element is not split over multiple pages) or use JavaScript work arounds. Perhaps there are other options but this is what we faced:

* poor/difficult multiple page support
* footer/header support depending on how the wkhtmltopdf binary was compiled
* cross-platform issues with the binaries: the binary needs to run on Linux 32 and 64 bit along with OS X and be statically compiled with Qt -- one gem worked out for us on OS X, another worked for heroku and the other Linux systems except 32 bit Linux (not 100% confirmed)

It was clear that moving from wkhtmltopdf to Prawn or some other PDF generating solution that provided more control had to happen. What wasn't clear was how painful this would be. It turned out to be fairly straight forward to figure out Prawn and reproduce the HTML and CSS view used with wkhtmltopdf in Prawn. I still haven't figured out how to have more control over one side of a table border but I can control paging with repeated header and footer areas along with page numbering.

The question in my mind is should we have gone with Prawn right away? Given our designers are used to working with HTML and CSS I think there was a lot of value to using wkhtmltopdf initially to let them tweak the layout without having to learn Prawn. But I would not rely on wkhtmltopdf after that -- once the design started to solidify I'd translate it to Prawn. There is of course the risk one could create something with CSS that would be very difficult to create in Prawn but if people experienced with both are on the project that risk would likely be a lesser concern.
