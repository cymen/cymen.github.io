---
date: '2009-06-14 16:24:49'
layout: post
slug: xen-lvm-and-domu-ext3-resizing
status: publish
title: Xen, LVM and DomU ext3 resizing...
wordpress_id: '58'
categories:
- Xen
tags:
- virtualization
- Xen
---

I'm using a Debian 5 (Lenny) host with Xen 3.2 from packages with software RAID and LVM. At the moment, all of my guests (DomU) are also Debian 5. To resize a guest filesystem, in Dom0 resize the logical volume:

lvextend -L +100G /dev/$PV/$LV

In guest (DomU), resize the partition by deleting and creating again. The trick is to make sure the first block stays. With the default steps on the Debian netboot installer with the "all in one" option, it makes these partitions:

/dev/xvda1 as / (1st primary partition)
/dev/xdva2 as extended partition
/dev/xvda5 as swap

So I unmounted the swap (swapoff /dev/xvda5), deleted all of the partitions, recreated /dev/xvda1 as the new size marked bootable leaving just enough room for the swap partition, and added the small swap partition. Then edit /etc/fstab to point to the new device (I changed swap to be on /dev/xvda2), reboot and do "resize2fs /dev/xvda1". I tried doing this without the reboot but resize2fs didn't want to see the new partition sizes. I used cfdisk for the partitioning so maybe it would work with fdisk or parted.

I did forget one detail -- I rebooted the DomU after resizing the LVM volume in Dom0. Mentioning just in case that is required. I'll find out next time I need to add more space to a logical volume.
