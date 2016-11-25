Daplie is Taking Back the Internet!
--------------

[![](https://daplie.github.com/igg/images/ad-developer-rpi-white-890x275.jpg?v2)](https://daplie.com/preorder/)

Stop serving the empire and join the rebel alliance!

* [Invest in Daplie on Wefunder](https://daplie.com/invest/)
* [Pre-order Cloud](https://daplie.com/preorder/), The World's First Home Server for Everyone

ios-swift-nodejs-push-notification-demo
==========================

ios App + node.js server for a push notification

Sorry, this is just a bunch of code right now,
so it isn't tutorial grade.

  * com.coolaj86.push-demo - the nodejs stuff
  * HelloWorldSwift - the iOS Swift stuff

Resources
=========

Check out the READMEs in the subfolders for what I found to be the most useful links

Process & Gotchas
=======

Sadly, you can't run this demo without becoming an Apple developer and getting your
own keys and ids set up with Push Notification permissions.

I'll try to outline the gotchas and whatnot.

### 0. Update your iTunes account

Go into **iTunes** and make sure your **name** and **address**
match your **driver's license**, USPS, or business registration.

No "Chuck" for "Charles" or old addresses, etc.

### 1. Enroll in the iOS Developer Program

Once you've gone to the [iOS Developer Program](https://developer.apple.com/programs/ios/)
and hit enroll you'll have to wait **between a few hours and a few days** to get approved.

If your iTunes account has a nickname or the wrong address you can expect the process will
be on the longer end of the spectrum.

### 2. Check your SPAM folder often

Apparently GMail believes that an email asking you to upload a government photo ID for
personal identity verification is a scam.

In general that's probably a good thing so that idiots don't get ripped off by
get-rich-by-enlarging-your-body-part scams, but for us devs it's slightly inconvenient.

### 99. More to come

Some other quick notes:

  * make sure your **Bundle ID** matches in XCode, your application, and online (looks like RJC2BHMV96.com.coolaj86.push-demo)
  * You have to convert your keys to use them with node. See `convert-keys-for-node.sh` for that.
