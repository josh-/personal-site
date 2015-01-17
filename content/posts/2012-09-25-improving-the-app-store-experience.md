---
title: "Improving The App Store Experience"
created_at: Tue Sep 25 19:23:19 +1000 2012
kind: article
published: true
---

iOS 6 brings with it significant changes to the process of discovering, buying and downloading apps on iOS devices. Whilst most of these changes are welcome additions, many past issues haven't been addressed, and new, somewhat confusing changes have [irritated the developer community](http://www.lightwoodgames.com/blog/2012/09/everything-thats-wrong-with-the-app-store-in-ios-6/) testing the beta versions. Transitioning to iOS 6 myself made me think about how this absolutely vital part of iOS could be refined and evolved. Whilst developers are always clamoring for more features that benefit their ability to sell apps in the store, [such topics](http://furbo.org/2009/07/10/year-two/) have already been [covered in detail](http://www.macstories.net/stories/four-years-of-app-store-developers-weigh-in-on-search-discovery-and-curation/) by many around the blogosphere. I wanted to simply focus on improving the experience for humble end users discovering, buying and updating their apps:

<!-- more -->

## Handling Mac App Store Links
I should start counting the number of times I open an inconspicuous [http://itunes.apple.com/](http://itunes.apple.com) link thinking that it's an link to an iOS app, only to later find it's actually a Mac application. I must do it almost once a day, and whenever it happens the OS decides that the best thing to do is open the App Store and show you this:

<img class="responsive center" style="max-height: 600px" src="/images/Mac_App.png" alt="Mac Application in the iOS App Store">

For a novice user - one who may not even understand the difference between iOS and OS X, this vague and potentially nonsensical information and doesn't really help explain the situation at all. This flaw is quite critical, since at this point both Apple and the app developer lose a potential customer if the user can't understand the information or forgets to download said app next time they're on their Mac.

[I wondered how this could be improved](https://twitter.com/joshparnham/status/243113383224807424), and my thoughts turned to Amazon's "Send to Kindle" feature. If you've never used this before, the basic idea is that when buying a Kindle book on the Amazon website, you are prompted to "send" the book to one of the Kindles connected to your account. I thought the premise behind this feature could translate fantastically to iOS - where [Apple's "Automatic Download" infrastructure](http://www.macrumors.com/2011/06/06/apple-rolls-out-first-icloud-features-automatic-downloads-purchased-content-listings/) could be used to "send" any Mac App Store app to one of your Macs from your iOS devices. Here's a mock-up I created:

<img class="responsive center" style="max-height: 600px" src="/images/Mac_App_Mockup.jpg" alt="Mock-up of a Mac App Store app on iOS">

<img class="responsive center" style="max-height: 600px" src="/images/Mac_App_Mockup_2.jpg" alt="Mock-up of sending a Mac App Store to a Mac">

(note that I am not at all associated with 1Password - it's just an awesome app that is available on both platforms)

In my mock-up, after tapping "$10.49", the button expands to read "Send to Mac...". When then tapping on that, an ActionSheet is presented and the user is asked which of the Macs they have connected to their account to send the app too - this then triggers an automatic download on that computer. The app can then be downloaded on other Macs by visiting the "Purchased" section of the Mac App Store. This process is very similar to [buying Steam games](http://littlebigdetails.com/post/31269839825/steam-after-purchasing-a-game-from-the-webstore) from the webstore or their mobile app.

## WebViews, WebViews Everywhere
We've all seen pages like this:

<img class="responsive center" style="max-height: 600px" src="/images/App_Store_No_CSS.jpg" alt="App Store without CSS">
( Credit to <a href="https://twitter.com/meyerweb/status/236627613811101696/photo/1">meyerweb</a>)


Although not immediately noticeable - and probably almost undetectable to the non-developer community, the iOS App Store makes substantial use of WebViews (a component used to display web pages). So substantial in fact that every tab in the app simply presents another WebView. This approach of bundling web apps inside wrapper apps and declaring them "native apps" was popularized several years ago - with many high profile names like [Facebook](http://makkey.minibird.jp/2012/07/09/a-primer-on-hybrid-app-for-ios/) and [LinkedIn](http://engineering.linkedin.com/mobile/linkedin-ipad-using-local-storage-snappy-mobile-apps) both following this path with their applications.

For Apple, this method provides many advantages when developing and maintaining the App Store, including:

* The ability to add functionality independent of OS releases - like the ['Top Grossing' section](http://techcrunch.com/2009/09/09/the-app-store-gets-a-top-grossing-section-premium-apps-finally-have-a-chance/) and the ['Purchased' section](http://www.imore.com/ios-app-store-updated-include-purchase-history).
* The ability to completely change the design of the store - especially useful for the constantly changing 'Featured' section of the store.

These advantages sound fantastic in concept, but when actually implemented introduce a number of issues that native apps don't - simply because of the way in which Apple has crafted the Frameworks used by native apps. These include things like:

* Difficulty with caching data - for example, going back in the navigation hierarchy might cause the page to reload, thus losing your position in a TableView.
* Partial downloads/Interrupted Downloads - these are problems inherent to the native of the web, as developers must be able to account for a whole manner or reasons as to why pages aren't able to be downloaded or are interrupted. In the App Store this is commonly seen when the CSS or certain images fail to load, or when the JavaScript fails to load and buttons are rendered useless.

[Facebook](http://facebook.com) recently [ditched most of the HTML5 in its native app](http://www.theverge.com/2012/8/23/3262782/facebook-for-ios-native-app), opting to replace it with a fully "native" Objective-C and Cocoa Touch application, dramatically improving the user experience and satisfaction with the app. I would hope that Apple follows down the same path, but I'm highly doubtful - at least the App Store isn't anywhere near as bad as Facebook's original hybrid app.

## App Wishlist
The fantastic folks at [iMore](http://www.imore.com/) summarized my thoughts almost exactly about the [puzzling lack of iTunes' "Wish List" feature on iOS](http://www.imore.com/wish-list). It boggles by mind that after all this time Apple is still yet to being this feature across, unless of course there is an esoteric or physical limitation that prevents them from doing so (of which I can't think of a single one).

If implemented well, this Wish List could then sync via iCloud - meaning that all the apps, music, books, etc. you want are always safely stored for you to easily come back to and purchase on any device.

## Conclusion
This is by no means a comprehensive list of improvements - I didn't even touch on the can of worms that is developer improvements like paid upgrades, trials, app review and user reviews. It is however, a small selection of improvements Apple could incorporate into the next iOS release that I believe would greatly enhance the App Store experience for users. I'll continue to update this post as new ideas come to mind, but in the mean time, please [contact me](/about/) if you think I've missed anything or have any comments or suggestions.
