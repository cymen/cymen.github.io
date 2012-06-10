---
date: '2010-02-16 18:56:47'
layout: post
slug: getting-started-with-asp-net-mvc-on-visual-web-developer-vwd-2010-express-beta-2
status: publish
title: Getting started with ASP.NET MVC 2 RC 2 on Visual Web Developer (VWD) 2010
  Express Beta 2
wordpress_id: '113'
categories:
- ASP.NET MVC
- Web Development
tags:
- mvc
---

Download the ISO instead of doing the installs over the net as it is highly likely that more than one installation attempt will be needed to get everything installed.



	
  1. Install Visual Web Developer 2010 Express Beta 2 from ISO (if virtually mounting the disk, make the mount persistent as there is a reboot halfway through the install and if the disk is not present, the install bails).

	
  2. Uninstall "Microsoft ASP.NET MVC 2" but not "Microsoft ASP.NET MVC 2 - VWD Express 2010 Tools". The VWD 2010 Express Beta 2 comes with a version of ASP.NET MVC that is pre-RC.

	
  3. Install [AspNetMVC2_RC2_VS2008.exe](http://www.microsoft.com/downloads/details.aspx?FamilyID=7aba081a-19b9-44c4-a247-3882c8f749e3&displaylang=en) (yes, that is the correct version for ASP.NET MVC 2 RC even though it has 2008 in the name).

	
  4. If "Microsoft Visual Studio 2010 ADO.NET Entity Framework Tools Beta 2" does not show up in Add/Remove Programs then force it to install by opening a command prompt and going to the \VWDExpress\wcu\EFTools directory of the CD and running **ADONETEntityFrameworkTools_enu.msi USING_EXUIH=1 /log "dd_ADONETEntityFrameworkTools_enu_MSI.txt"**





