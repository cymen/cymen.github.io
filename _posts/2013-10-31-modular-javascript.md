---
layout: post
title: Modular JavaScript
tags: ["Coding", "Architecture"]
---

JavaScript is a complicated language. One of the difficult areas is scope.  We
can think of scope as the world a particular line of code can see. In
JavaScript, if we neglect to use the `var` keyword for a variable, that variable
is seen by the whole world from any line of code. Some large JavaScript
applications intentionally use global variables to organize the system.
Alternatively, a better pattern has emerged in which modules are used to access
the other parts of the system. At first glance, this appears to be similar to an
`import` in Java, a `#include` in C/C++, or a `require` in Ruby. But there is a
very important difference: in most modular JavaScript approaches, the module is
a scope that can hold state which is shared between all consumers of that
module.

Almost a year ago, I started working on a huge JavaScript web application. At
one point, it surpassed 600,000 lines of JavaScript not including third party
libraries. The application used a framework that allowed for the creation of
controllers and views. When a controller was defined, it was attached to the
global scope by, in effect, omitting the `var` keyword. If this controller
needed to be used by other JavaScript code, one could simply use the global
variable to access it. The use of globals tightly coupled the system together in
ways which made it hard to write new code using test-driven development. The
tests would need to mock out all of the globals accessed by the code under test.
After working with the system for a couple of months, it was apparent to us that
this two year old application felt like it had four to five years of technical
debt.

The good news was that we were not the only ones who felt this way. While the
framework was firmly entrenched in the application, the team began to chip away
at the globals and the whole approach that encouraged creation of these globals.
The first step was adding asynchronous module definition to the frameworks
dependency management function with `define` and `require` functions. We took
this old school code:

{% highlight javascript %}
thieve('subject_controller.js', function() {
  ...
});
{% endhighlight %}

And converted it to:

{% highlight javascript %}
define(['subject_controller.js'], function(SubjectController) {
  ...
});
{% endhighlight %}

Here SubjectController is defined by subject_controller.js. This makes it
trivial to define SubjectController as a mock. However one of the problems is
that now the mock has replaced the SubjectController for the entirety of the
scope. Having to put all the tests that depend on the mock in one file and the
other tests in a different file seemed like a serious limitation, particularly
when one might want to use different mocks for the same module.

In response, the team added a `factoryFor` function that would behave like so:

{% highlight javascript %}
var subjectControllerFactory = thieve.factoryFor('subject_controller.js');
{% endhighlight %}

Now if _subject_controller.js_ depends on modules like so:

{% highlight javascript %}
define(['jquery', 'subject', 'grinder'], function($, Subject, Grinder) {
  ...
});
{% endhighlight %}

We can, with the factory, inject our own definitions for these modules:

{% highlight javascript %}
var controller = subjectControllerFactory(mockJquery, mockSubject, grinder);
{% endhighlight %}

While these examples are simple, they are obfuscating some aspects. So lets rewind
and see a practical example.

browser.js:

```javascript
define(['jquery'], function($, userAgent) {

    var ua = userAgent || navigator.userAgent;
    ua = ua.toLowerCase();

    var match = /(chrome)[ \/]([\w.]+)/.exec(ua) ||
        /(webkit)[ \/]([\w.]+)/.exec(ua) ||
        /(opera)(?:.*version|)[ \/]([\w.]+)/.exec(ua) ||
        /(msie) ([\w.]+)/.exec(ua) ||
        ua.indexOf("compatible") < 0 && /(mozilla)(?:.*? rv:([\w.]+)|)/.exec(ua) || [];

    var engine = match[1];
    var version = match[2];

    return {
        engine: function() {
            return engine;
        },

        version: function() {
            return version;
        }
    };
});
```

browser_spec.js:

```javascript
require(['jquery.js', 'browser.js'], function(jQuery) {
    describe("Browser", function() {

        //...

        it('can parse the IE10 user agent string', function() {
            var browserFactory = thieve.factoryFor('browser.js');
            var Browser = browserFactory(jQuery, "Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1; Trident/6.0)");

            expect(Browser.engine()).toBe('msie');
            expect(Browser.version()).toBe('10.0');
        });

        //...
    });
});
```

The point of this code is to check the web browser engine and version. The code
in browser.js is a slightly modified version of the deprecated jQuery.browser.
Remember the part about how modules are basically shared scope? We can see this
in browser.js, because any consumer of the module is going to get the exact same
instance as the first consumer. The first time the code is consumed, lines 3-13
are executed. These extract the engine and the version. The scope within the
module now has engine and version defined. All consumers after the first will
have only the return value supplied to them. This return value is an anonymous
object with `engine` and `version` methods. These methods are run within the
scope of the module so they will of course have access to the already set
variables.

Moving on to the test, it becomes clear that we need to be able to inject a
userAgent string that typically would be accessed from the current browser via
`navigator.userAgent` (as it is done on line 3 of browser.js). After getting the
factory for `browser`, we inject jQuery and a known userAgent string for
Internet Explorer 10.

At this point, I hope that it is clear what a JavaScript module is in the
context of asynchronous module definition. The aspect of scope within the module
shared across all consumers is an oddity, yet it has many benefits. If you want
to try this approach, choose your implementation of asynchronous module
definition carefully. Some offer access to the factory while others do not (in
particular, require.js does not -- wire.js is a good place to start). The team
that I am working with on the large web application has made great progress
modularizing the application using this approach. An interesting benefit is that
the modular approach encourages good practices like splitting up your code into
smaller pieces that are not tightly coupled. As the work to remove globals has
gained momentum, the mood of the team has turned from pessimism to optimism.
