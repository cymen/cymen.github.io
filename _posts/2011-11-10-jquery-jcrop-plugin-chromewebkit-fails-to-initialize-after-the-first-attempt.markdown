---
date: '2011-11-10 10:35:45'
layout: post
slug: jquery-jcrop-plugin-chromewebkit-fails-to-initialize-after-the-first-attempt
status: publish
title: 'jQuery JCrop plugin, Chrome/Webkit: fails to initialize after the first attempt'
wordpress_id: '261'
categories:
- JavaScript
- Programming
---

I recently ran into a bug when using recent versions of Chrome and the jQuery JCrop plugin. I am adding some HTML to a jQuery UI modal window that contains the image I want to crop. I am initializing JCrop using the onload event of the image within this HTML. That worked fine in the past but stopped working sometime in the past year or so.

According to [issue 7731](http://code.google.com/p/chromium/issues/detail?id=7731#c12) on chromium, the cause of this problem is that Webkit is more strict -- the onload event is only triggered the first time the image is loaded. So the issue was the onload event triggered immediately when the modal window was shown -- it triggered before the image was displayed (except for the first time). This is a tricky thing to work around. I verified that this was my issue by appending to the image URL the current timestamp (so + '?' + new Date().getTime()) in order to force the browser to reload the image each time. That did fix the problem but it also introduced UI lag as the image had to be fetched each time a crop was attempted.

I put in this short term fix: put my JCrop initialization code in a function named crop and then (still bound to the load event), attempt to initialize it. If the image isn't loaded, try again in 25ms up to 5 times. I can tell if the image is loaded by checking for a height > 0. The code:


    
    
        $('#cropbox').load(function (event) {
            var boxHeight = Math.floor($('#crop').closest('.ui-dialog').height() * 0.8);
    
            var $img = $(event.target);
            var productDiv = $('div#' + id);
            var sku = $('div.sku', productDiv).text();
            var product = productsData[sku];
            var height, width;
    
            // put crop loading code into function -- see comment below about chrome hack
            var crop = function () {
                height = $img.height();
                width = $img.width();
    
                var jcrop = $.Jcrop(
                    ...
                    });
    
                ...
            }
    
            // Ugly hack for chrome -- the load event triggers before the image is actually displayed/in DOM
            // but only on crop attempts after the initial one. One way to detect this is to check if the image
            // height is 0 -- if so, retry.
            // Update: issue probably this: http://code.google.com/p/chromium/issues/detail?id=7731#c12
    
            var worked = false;
            var attempts = 0;
            var attempt = function () {
                if (worked) return;
    
                height = $img.height();
                if (typeof height === 'number' && height > 0) {
                    crop();
                    worked = true;
                }
                else {
                    attempts++;
                    if (attempts < 5) {
                        // try again in 25 milliseconds
                        setTimeout(attempt, 25);
                    }
                    else {
                        alert('Bug with cropping image.');
                    }
                }
            }
    
            attempt();
        });
    



I reported this problem in [issue 63](http://code.google.com/p/jcrop/issues/detail?id=63) for the JCrop plugin. Hopefully, there is a better way to do this however if you need a quick work around now...
