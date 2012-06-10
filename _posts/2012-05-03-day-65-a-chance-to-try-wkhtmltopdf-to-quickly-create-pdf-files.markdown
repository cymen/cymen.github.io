---
date: '2012-05-03 19:49:19'
layout: post
slug: day-65-a-chance-to-try-wkhtmltopdf-to-quickly-create-pdf-files
status: publish
title: 'Day 65: A chance to try wkhtmltopdf to quickly create PDF files'
wordpress_id: '704'
categories:
- 8th Light
- Apprentice
---

About a year ago I came across [wkhtmltopdf](http://code.google.com/p/wkhtmltopdf/) and thought it sounded wonderful. There are many ways of creating PDFs however almost all are very painful. The idea with wkhtmltopdf is to make a PDF based on HTML including CSS and JavaScript. The program includes the full webkit rendering engine and has some tweaks to force page pagination.

When I came across it last, we already had a solution in place. It wasn't pretty but it worked. For the internal project at 8th Light I looked at another alternative that was already in use: [Prawn](http://prawn.majesticseacreature.com/). The problem with Prawn is the same as the problem with most PDF generation techniques: you have to learn a new language or custom language and while it may allow you to have exact pixel output it also requires a substantial investment in time. Our designers already know CSS and HTML and we didn't need pixel perfect output so I picked the [PDFKit](https://github.com/pdfkit/PDFKit) gem (another choice is [wicked_pdf](https://github.com/mileszs/wicked_pdf) which I'd also like to try) and got to work with a sample mock up of HTML and CSS along with web fonts from our designer Chris.

The biggest problem I ran into was that wkhtmltopdf requires absolute paths for all the external resources. PDFKit has a method to load stylesheets that uses a relative path but for all the images, CSS and web fonts I'd need to use a view helper to write absolute URLs. With that problem solved I had a working PDF. Well, sort of... The version of wkhtmltopdf I'm using is an older release and it didn't seem to like SVG web fonts. Thankfully, the SVG variant wasn't needed so I was able to remove it from the HTML presented to wkhmtltopdf.

The generated PDF looks great! It includes the web fonts and the background images as desired. The sample logo definitely looks a bit fuzzier however it is low resolution so once we substitute a higher resolution one or use web fonts to create the logo we'll have a great looking PDF in a minimal amount of time. There certainly are trade-offs with this approach but I have a hard time imagining doing anything else until how the PDF should look is completely nailed down.
