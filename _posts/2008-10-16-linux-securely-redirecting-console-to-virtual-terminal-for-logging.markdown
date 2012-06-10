---
date: '2008-10-16 16:43:53'
layout: post
slug: linux-securely-redirecting-console-to-virtual-terminal-for-logging
status: publish
title: Linux - Securely redirecting console to virtual terminal for logging
wordpress_id: '18'
categories:
- Linux
tags:
- console
- Linux
- screen
- script
- ssh
---

I want to be able to log a ssh session to a unused virtual terminal (/dev/ttyX) so that I can leave something running yet not allow any intrusion into the ssh session by unauthorized users at the keyboard. This is what I ended up doing:



	
  1. Give user write access to /dev/tty devices.

	
  2. Install screen and script.

	
  3. Run screen with simple "screen".

	
  4. Run script with output to virtual terminal and flushing option: "script -f /dev/ttyX".

	
  5. Do regular ssh session and begin whatever it is you want to monitor.

	
  6. Disconnect from screen'ed session (CTRL-a d).

	
  7. Switch to virtual terminal script is dumping to.




This works out quite well in practice -- I'm not noticing any issues and it is fairly simple to accomplish. On my debian etch install, I had to add my user to the root group (or I could have given all users write access to /dev/tty devices).
