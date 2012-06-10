---
date: '2011-11-17 09:07:38'
layout: post
slug: ssl-certificates-ocsp-and-crls-how-to-troubleshoot
status: publish
title: 'SSL Certificates, OCSP and CRLs: How to troubleshoot'
wordpress_id: '269'
categories:
- Internet
---

Recently, I ran into an interesting problem: a website that my workplace was going to start hosting was about to be cut over however the SSL certificate was failing. By disabling OCSP in Firefox, I determined it was likely due to the certificate authority (GoDaddy) revoking the certificate.






The warning displayed by Google Chrome is:


> The server's security certificate is revoked!
You attempted to reach www.xyz.org, but the certificate that the server presented has been revoked by its issuer. This means that the security credentials the server presented absolutely should not be trusted. You may be communicating with an attacker. You should not proceed.








The warning displayed by Mozilla Firefox is:



> Secure Connection Failed

An error occurred during a connection to www.xyz.org.
Peer's Certificate has been revoked.

(Error code: sec_error_revoked_certificate)

> 
> 
	
>   * The page you are trying to view can not be shown because the authenticity of the received data could not be verified.
> 
	
>   * Please contact the web site owners to inform them of this problem. Alternatively, use the command found in the help menu to report this broken site.
> 









At first, we thought there was perhaps an issue with the intermediary certificate bundle. However that bundle matched GoDaddy's current bundle so it was time to take a closer look at the certificate. Firefox wasn't much help however Chrome could display all the metadata attached to the failing certificate. The two essential parts for to check the status for OCSP are the serial number and the CRL list.




The CRL list was located at [http://crl.godaddy.com/gds1-18.crl](http://crl.godaddy.com/gds1-18.crl) and I was able to retrieve this file however I couldn't find a decent way to view a CRL file on Windows in a searchable way quickly. I found that openssl can dump a CRL to text and I did so with the GoDaddy CRL using this command:






    
    openssl crl -inform DER -in gds1-58.crl -text > list.txt







I then opened up list.txt in a text editor and was able to find a revocation entry similar to this one:






    
        Serial Number: 049A85BD85BE83
            Revocation Date: Oct 26 18:56:06 2011 GMT
            CRL entry extensions:
                X509v3 CRL Reason Code:
                    Cessation Of Operation




Of course, if you have login access to the registrar for the certificate it may be quicker to simply login and see if there is some sort of mention on the account about the failing certificate. But if you need to determine why a certificate is failing OCSP hopefully the above will help. I suspect there are additional CRL to check however I'm not sure how to determine what they are.
