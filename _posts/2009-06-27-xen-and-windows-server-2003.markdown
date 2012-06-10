---
date: '2009-06-27 13:19:59'
layout: post
slug: xen-and-windows-server-2003
status: publish
title: Xen and Windows Server (2003)
wordpress_id: '64'
categories:
- Xen
tags:
- virtualization
- Xen
---

I got a Windows Server 2003 Xen DomU up and running within a couple hours. The configuration was fairly simple but the issue I ran into with Debian Lenny was that that Xen defaults to xenbr0 as the network bridge interface while eth0 is the correct one to to use. After modifying /etc/xen/xend-config.sxp (actually, I first stated the bridge explicitly in my DomU configuration), networking worked and the VM fired up with the regular install screens. The integration with VNC works very well.

The next step after all the OS updates was to install the Windows paravirtual drivers. I used [gplpv_fre_wnet_x86_0.10.0.69.msi](http://www.meadowcourt.org/downloads/gplpv_fre_wnet_x86_0.10.0.69.msi) and the VM rebooted after install without issue except for the IntelIde drivers/service failing to load (guessing it just needs to be disabled -- not critical as far as I can tell).

So far, with my DomU installs, I've been doing it the hard way by which I mean I've been reinstalling from scratch with each new DomU. Next on the list is to clone a VM using LVM snapshots which should be much easier (and reduce all that update downloading and configuration).

Update: [Indeed, the IntelIde startup error is apparently fixed (hidden properly) in Xen 3.4](http://www.nabble.com/Problems-with-GPLPV-driver-0.10.x-td23155845.html)!
