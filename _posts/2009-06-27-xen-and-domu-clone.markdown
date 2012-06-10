---
date: '2009-06-27 14:11:43'
layout: post
slug: xen-and-domu-clone
status: publish
title: Xen and DomU Clone
wordpress_id: '70'
categories:
- Xen
tags:
- virtualization
- Xen
---

This basic approach works:



	
  1. Power down target system.

	
  2. Create another logical volume the same size as the target system.

	
  3. dd if=/dev/$PV/$TARGET of=/dev/$PV/$CLONE bs=1M

	
  4. Copy Xen config and modify with clone details

	
  5. Power up clone, change hostname and any other relevant details

	
  6. Power up target


For a 32 GB LV, **dd** took just over 11 minutes to dump the data from the target volume to the clone volume on my hardware. This was for a Windows Server 2003 clone using DHCP so the only thing I changed was the host name (so far).

I'd think the LVM snapshot method might be able to do this more intelligently but I couldn't quite grok it right away and this method worked.
