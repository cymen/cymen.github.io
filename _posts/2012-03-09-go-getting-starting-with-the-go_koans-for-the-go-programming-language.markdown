---
date: '2012-03-09 16:05:54'
layout: post
slug: go-getting-starting-with-the-go_koans-for-the-go-programming-language
status: publish
title: 'Go: getting starting with the go_koans for the Go programming language'
wordpress_id: '476'
categories:
- Go
- Programming
---

**Installing Go on Ubuntu**
To install Go on my Ubuntu system I used the directions at [golang.org/doc/install.html](http://golang.org/doc/install.html) using ~/dev/go as my build location. The initial attempted to run "./all.bash" failed. Go requires bison which can be installed with "sudo apt-get install bison". The second run of "./all.bash" succeeded and after a couple minutes ~/dev/go/bin contained the 6g set of executables for amd64 (as [opposed to 5g for arm or 8g for 386](http://golang.org/doc/go_faq.html#What_kind_of_a_name_is_6g) or [something else on other operating systems](http://golang.org/doc/install.html#fetch)).

The final step was to add the folowing to my ~/.bash_profile:

    
    export PATH=$PATH:~/dev/go/bin
    export GOROOT=$HOME/dev/go
    export GOARCH=amd64
    export GOOS=linux


And then run "source ~/.bash_profile". Note that you can also get the 8g compiler on the amd64 platform by running "GOARCH=386 ./all.bash" instead of "./all.bash" along with installing gcc-multilib ("sudo apt-get install gcc-multilib").

**Vim Syntax Highlighting**

The go repository includes a syntax highlighter file for Go in "go/misc/vim/" which you can copy to your vim syntax directory with "cp $GOROOT/misc/vim/syntax/go.vim in ~/.vim/syntax/". Then enable the syntax highlighter for go files by editing ~/.vim/ftdetect/go.vim and adding:

    
    au BufRead,BufNewFile *.go set filetype=go




**Getting the Go Koans**

One set is at go_koans: [github.com/VictorDenisov/go_koans](https://github.com/VictorDenisov/go_koans). A quick git clone and a "make" and you're all set.

* I'm running Ubuntu 11.10 amd64 but likely very similar install for other versions.

**Update: More Go Koans**

One of the craftsmen at 8th Light has written go-koans: [https://github.com/sdegutis/go-koans](https://github.com/sdegutis/go-koans)!
