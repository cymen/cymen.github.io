---
layout: post
title: Debricking the Netgear WNR3500L
---

A recent attempt to flash a new firmware to my Netgear WNR3500L resulted in the
top power light staying orange. At first, it seemed to take a tftp attempt to
192.168.1.1 on boot up with the special boot up sequence however I could not get
it to work.

After reading online, I purchased a USB-TTL adapter on eBay and waited for it to
arrive. Following the [unbricking guide](http://www.myopenrouter.com/article/13859/How-To-Debrick-Your-NETGEAR-WNR3500L-Using-A-USB-TTL-Cable-on-Windows/),
I could see the router boot up via the serial port (using the USB-TTL adapter).
I was able to enter the CFE console (I found it easier to press and hold down
CTRL-C and then power up the device as PuTTY kept sending the key sequence).
However the Ethernet portion of the router never came online so while I could
ask it to accept a tftp attempt by starting tftpd, it was of no use.

I almost gave up, however some searching found a report of the same problem
and the suggestion to try `nvram erase`. I ran the command and after the prompt
came back, cycled the power to the device. On boot, I was again able to enter
the CFE console but this time the Ethernet portion of the router came up and
a quick tftp of the stock firmware and I was back online.
