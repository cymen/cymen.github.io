---
date: '2010-11-23 19:30:06'
layout: post
slug: quick-php-script-to-generate-gem-installation-commands
status: publish
title: Quick PHP script to generate gem installation commands
wordpress_id: '175'
---

Sometimes one needs to replicate one gem environment to another host. Maybe there is a ruby way to do this but here is a quick script that runs "gem list" and then makes a list of "gem install PACKAGE -v VERSION" commands. It's quick and dirty but maybe it'll be useful for you too:

<script src="https://gist.github.com/2904087.js">
</script>
