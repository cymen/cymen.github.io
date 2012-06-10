---
date: '2012-03-01 19:13:32'
layout: post
slug: day-22-attempting-to-retrofit-testing
status: publish
title: 'Day 22: Attempting to retrofit testing'
wordpress_id: '383'
categories:
- 8th Light
- Apprentice
- Clojure
---

As mentioned previously, I didn't manage to do all of these things with my Clojure HTTP server project:



	
  1. develop test-driven using spec testing

	
  2. learn clojure

	
  3. implement HTTP protocol

	
  4. learn intricate details of Java-Closure interop for reading/writing string lines, characters and bytes to input/output streams


Everything went well except #1. So now I'm faced with refactoring my code to be more testable and learning how to write Clojure in a test-driven approach. This isn't fun. I can now see clearly why Doug was suggesting I get going with the testing approach. The biggest problem is that it simply isn't attractive to write spec tests after the fact because it will require refactoring and the code already "works". No doubt there are some bugs in the implementation. But of course the proper thing to do is to do spec tests as they force one to:

	
  * write code in a more separable approach to make testing easier which also has the wonderful effect of decoupling your implementation quite a bit more than the non-testing approach

	
  * document how the system works by writing spec code which is functional: if the specs fail the system is not working as expected and the failing point is (hopefully) clearly evident

	
  * avoid having to litter your code with distracting safety checks because your spec tests can be referenced more easily to figure out how the code is supposed to be used instead of reading a method definition and hoping for the best


So I spent more time today splitting up my code. This was relatively straight forward except for a few things:

	
  1. Using multimethods in Clojure with the defmulti in one namespace and each defmethod in a separate namespace is tricky. I ended up having to do this:

	
    1. Parent namespace - has a :use line for the defmulti namespace and each defmethod namespace

	
    2. Namespace for function definition - defmulti

	
    3. Namespace for each function implementation - defmethod


Then I could :use the parent namespace to pull everything into the project. Without the parent namespace I would end up with circular :use that would cause a compilation error. This seems very strange. I wonder if there is a better way or if I should really have my defmethod in the same namespace as my defmulti and keep them short by separating out code into additional short functions.

	
  2. The before and before-every function in speclj didn't seem to work and the spec runner isn't nice like the Ruby one -- if you are comparing to items say string "a" should equal the output of mymethod() the Ruby spec runner prints out the differing result. This is most excellent as it makes resolving things quick. As far as I can tell, speclj can't do this and it is a shame. Particularly because Clojure is functional so you can't easily toss in a print statement like you can in an imperative language. It's not that hard to do but it certainly requires more jiggling around (I usually wrap the part I want to print in a do and then use a let to save the result to a variable and then print the result -- so that  is at least three things to change and you have to watch your brackets plus the next thing...).

	
  3. Clojure on the JVM is just slow enough to start that it makes debugging painful. I saw news of an implementation of Clojure on top of python/pypy which is not as fast as the JVM but has very fast startup times compared to the JVM. I don't think they have solved the Java interop issue though so it isn't useful for everyone (and indeed isn't for me on this project). The other option is to look more closely at the Emacs integration however I've always avoided learning Emacs primarily because I like the more minimal world of vim. But I would definitely look into Emacs integration more closely if I was using Clojure regularly. Update: I found [VimClojure](http://www.vim.org/scripts/script.php?script_id=2501) which might be a solution for vim lovers!


I am very much in love with Clojure so while some things are annoying it is very fun to work with. I have briefly looked at other functional languages in the past and found that the interaction outside of the core lisp "world" looked very painful. The way Clojure ties into the JVM and allows dropping down to Java is awesome.
