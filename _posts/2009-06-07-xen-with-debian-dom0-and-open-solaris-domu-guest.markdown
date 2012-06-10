---
date: '2009-06-07 19:35:40'
layout: post
slug: xen-with-debian-dom0-and-open-solaris-domu-guest
status: publish
title: Xen with Debian Dom0 and Open Solaris DomU (Guest)
wordpress_id: '40'
categories:
- Open Solaris
- Xen
tags:
- virtualization
- Xen
---

Download "[osol-0906-x86.iso](http://www.opensolaris.com/get/index.jsp#mirrors)" and mount it using loopback (mount -o loop -t iso9660 /root/osol-0906-x86.iso /tmp/MOUNT_POINT). Copy off two files required for the install. One site suggested /usr/lib/xen-solaris:
`
mkdir /usr/lib/xen-solaris
cp /tmp/MOUNT_POINT//mnt/tmp/platform/i86xpv/kernel/unix /usr/lib/xen-solaris/unix-0906
cp /mnt/MOUNT_POINT/boot/x86.microroot /usr/lib/xen-solaris/x86.microroot-0906
`

The Xen DomU configuration:
`
name = 'open-solaris'
memory = '512'
disk = [ 'file:/root/osol-0906-x86.iso,6:cdrom,r', 'phy:/dev/thor/open-solaris,xvda,w' ]
vif = [ '' ]`

kernel = '/usr/lib/xen-solaris/unix-0906'
ramdisk = '/usr/lib/xen-solaris/x86.microroot-0906'

on_shutdown = 'destroy'
on_reboot = 'destroy'
on_crash = 'destroy'
extra = '/platform/i86xpv/kernel/unix - nowin -B install_media=cdrom'

Then kick off the VM:
`
xm create -c open-solaris.cfg
`

Now Open Solaris should boot up. These accounts are preconfigured:
Username: jack
Password: jack
Root password: opensolaris

The installer is GUI-only. The installer appears to kick off a vnc instance (or Xen does, haven't looked into who/what/where but xenstore has the VNC password but the guest has the vnc process?). To get the VNC password:
`
xenstore-ls|grep password
`

To get the IP of Open Solaris:
`
ifconfig -a
`

Now you can VNC to the IP address, use the VNC password and kick off the install.

Sites referenced:

[http://www.tardis.ed.ac.uk/index.php/OpenSolaris_Xen_domU](http://www.tardis.ed.ac.uk/index.php/OpenSolaris_Xen_domU)
[http://blogs.sun.com/levon/entry/opensolaris_2008_11_as_a](http://blogs.sun.com/levon/entry/opensolaris_2008_11_as_a)
[http://blogs.sun.com/levon/entry/opensolaris_2008_11_guest_domain](http://blogs.sun.com/levon/entry/opensolaris_2008_11_guest_domain)
