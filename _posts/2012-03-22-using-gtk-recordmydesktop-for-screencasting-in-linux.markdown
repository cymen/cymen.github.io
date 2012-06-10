---
date: '2012-03-22 20:07:21'
layout: post
slug: using-gtk-recordmydesktop-for-screencasting-in-linux
status: publish
title: Using gtk-recordMyDesktop for screencasting in Linux
wordpress_id: '547'
categories:
- Linux
- Ubuntu
---

The program [recordMyDesktop](http://recordmydesktop.sourceforge.net/about.php) works well for screencasting but the process of recording, converting and uploading to a Vimeo or Youtube is not straight forward. The versions of ffmpeg and mencoder (from mplayer) in even Ubuntu 11.10 cannot transcode the Ogg Vorbis output of recordMyDesktop to a suitable format for the video hosting providers. Fortunately, there is a way to transcode that is fast and straight forward.



	
  1. **Change recordMyDesktop settings**: open recordMyDesktop and click on the Advanced button. Go to the Performance tab and uncheck "Encode On the Fly". You can try leaving it enabled but some people report the audio gets out of sync with the video.

	
  2. **Verify sound settings**: if you use an external USB headset (highly recommend), you likely will need to open the system mixer and set it as the default input as recordMyDesktop requires the system mixer to take care of the audio settings. Under Ubuntu 11.10, you can open the Sound application and go to the Input tab. There you can select the correct input, verify it is not muted and also verify it is working.

	
  3. **Test recording**: make a very short recording while speaking and play it back to verify it is working correctly.

	
  4. **Record screencast**: note that recordMyDesktop puts a small red circle on your system status bar. You can click that to pause or stop the recording. Because we disabled "Encode On the Fly" when you stop encoding recordMyDesktop will need to perform the encoding. This takes a little while and it grows in time with the length of the recording. You can cancel the encoding if you want to trash it. The output file will be in your home directory as **out.ogv**.

	
  5. **Use HandBrakeCLI to transcode to MP4**: install HandBrake if you do not already have it. I used [these directions](http://askubuntu.com/questions/71128/how-do-i-install-handbrake) from AskUbuntu. The transcoding process is extremely simple with HandBrakeCLI:
`
HandBrakeCLI -i out.ogv -o out.mp4`


You can now upload the MP4 file to Youtube and/or Vimeo and it will work as expected.
