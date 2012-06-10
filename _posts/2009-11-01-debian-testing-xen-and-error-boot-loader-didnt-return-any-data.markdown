---
date: '2009-11-01 03:54:58'
layout: post
slug: debian-testing-xen-and-error-boot-loader-didnt-return-any-data
status: publish
title: 'Debian testing, Xen and "Error: Boot loader didn''t return any data!"'
wordpress_id: '95'
categories:
- Xen
---

I wanted to use Debian testing in a Xen DomU but after upgrading (including grub), "xm create " no longer worked. It failed with the error:

`Error: Boot loader didn't return any data!`

I followed the suggestion of running "pygrub /path/to/xen/disk" but each of my DomU get a chunk of LVM disk. Within the LVM logical volume, the DomU OS partitions the disk however it wants. I need to get at one of the partitions inside the LVM from the Dom0 or Xen host OS. To do this, get **kpartx** and run it like so:

kpartx /dev/physical_volume_name/logical_volume_name

After running that, I found my disk partitions from the DomU logical volume at /dev/mapper/logical_volume_name1, 2, 3, etc. So I could then run:

pygrub /dev/mapper/logical_volume_name1

That error out again but it was line 68 of GrubConf.py:

`    def set_disk(self, val):
        val = val.replace("(", "").replace(")", "")
        self._disk = int(val[2:])`

I added the Python lines to print out the value of **val** and found that it was getting set to an empty string. Then I simply mounted the now accessible root partition:

mount -t ext3 /dev/pv/lv1 /mnt/tmp

And editing the .../boot/grub/menu.lst revealed the debian upgraded and spewed some cruft into the file. Cleaning that up resulted in a working DomU. The upgrade probably mentioned this but I glazed over it. I suspect I'm not the only one so it's worth a check.

Finding **kpartx** made it worthwhile...
