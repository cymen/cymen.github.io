---
date: '2012-05-16 22:16:48'
layout: post
slug: recent-experiences-pairing-using-amazon-s3-with-aws-s3-gem-another-kata
status: publish
title: Recent experiences pairing, using Amazon S3 with aws-s3 gem, another kata
wordpress_id: '718'
categories:
- 8th Light
- Apprentice
---

## Recent experiences pairing


This week I've paired with Angeleah, Michael, Mike and Ben. We're all working on the internal project. Angeleah and I worked on a story that was not completed in the prior iteration. The reason it wasn't completed was that the interface wasn't done. We had some minimal HTML with input fields while the mock up shown to the client had an edit link next to each field that could be edited and looked much nicer. When we tried to actually implement this we discovered it was very annoying to have an edit link. The work flow would be:



	
  * Click edit

	
  * Make change

	
  * Click save

	
  * Repeat for each field that needs to be edited


We discussed how we felt it should work and what are options were. We decided that it would be much nicer to have an edit view that toggled all the fields to editable status and then one would click save and return to the non-edit view (which could then be submitted or edited yet again). We checked with our customer via email for approval to this change and then went forward with it. The end result was a much nicer work flow and we brought over some style changes that resulted in a much improved appearance.

Michael and I worked on a couple of stories. One of the more interesting ones was an export feature. Michael had written the backend already with Ben but we needed a front end for it. It was a new feature on the site and starting something new even when it doesn't seem that big always has the potential for taking more time than expected. It was a pleasant surprise to test-drive it to completion in much less time than estimated.

Mike and I worked on an export feature that required an oddly formatted CSV file for import into a proprietary application. This was frustrating as the import would do odd things like sum up two lines and create one import item instead of two import items. We had to try many variations of the file format to come up with one that did what we wanted. Mike spent a lot more time than I did on this story (along with Michael) and I was very thankful for that.



## Using Amazon S3 with aws-s3 gem



Ben and I paired on a story that required we make some small test scripts to upload and then retrieve files from Amazon S3 securely. We used my Amazon Web Services account and the aws-s3 gem with Ruby and it was extremely straight forward. The file upload was very easy. Instead of making a download script, we made one that would print out a URL to the file on S3 with an access token that granted 30 seconds from the time the token was generated. This was also very easy and straight forward.

I spent some time considering how we would use this and realized that if we have a list of resources that can be clicked on we don't want to have to generate the S3 URL with the access token when the list is made. The reason for this is the aws-s3 gem requires a connection to generate the URL so apparently some kind of interaction is required with the S3 API and generating a lot of URLs for resources may be costly in time. A simple solution to this is to have the resource point to our server which then creates the S3 URL on demand and redirects to it.



## Another Kata



I'm working on another kata. Doug had an interesting idea. I've been trying to figure out the right tools. It is taking longer than expected for that part and I know I should already be much further along. I really need to figure this out by the end of the day tomorrow.
