---
layout: post
title: Brother HL-2270DW and DD-WRT
---

The Brother HL-2270DW is an excellent and inexpensive laser printer with support
for both wireless network connection and duplex printing. DD-WRT is a useful
firmware replacement for many network devices. At first, the two did not want
to play together but I figured out that the network settings for DW-WRT need
to be:

* Security Mode: WPA2 Personal
* WPA Algorithms: AES

The key is the second option -- if it is set to TKIP or TKIP+AES, the Brother
printer cannot successfully connect via wireless.
