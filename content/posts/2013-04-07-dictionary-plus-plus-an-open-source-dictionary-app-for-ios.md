---
title: "Dictionary++ - An Open Source Dictionary App For iOS"
created_at: 2013-04-07 14:59:50 +1000
kind: article
published: true
---

Since iOS 5, Apple has [included a system-wide dictionary](http://www.idownloadblog.com/2011/06/07/ios-5-dictionary/) within iOS, accessible from text fields in all applications on the platform. Whilst this is a fantastic solution when you come across an unfamiliar word as you're reading a webpage or iBook, for example, it's far from perfect when you need to arbitrarily define a word.

On OS X, this is simply a case of [typing the word into Spotlight](http://www.cultofmac.com/171140/) (however, I prefer to use [LaunchBar](http://www.obdev.at/products/launchbar/) to perform the same task). But on iOS, I've found myself jumping between three different processes:

<!-- more -->

* **Using Siri to "Define \[word\]"** (which actually uses [WolframAlpha](http://wolframalpha.com) to find definitions for words). However, this solution not only requires a fast network connection, but also forces you to speak the word aloud (not feasible in a classroom situation, for example) whilst also relying on Apple's speech synthesising (which tends to perform relatively poorly with my Australian accent).
* **Awkwardly accessing the system dictionary** by typing words I needed to define into Notes.app, selecting each one and tapping "Define" in the resulting MenuController.
* **Using a third-party dictionary application from the App Store**, however, as iOS already includes a full dictionary it seems ridiculously wasteful to download *another* dictionary.

Ultimately, none of these solutions appealed to me, and so I was incredibly happy to see [this @reply from Daniel Stine](https://twitter.com/KC9HZN/status/308415837092581377) about [Dictionary+](http://www.best10apps.com/apps/dictionary,498743181/), which did exactly what I was looking for.

After contacting the developer, it turns out that Dictionary+ had been pulled from the store by Apple and so I thought it would be a fun weekend project to whip up a clone. The resulting app is [Dictionary++](https://github.com/josh-/DictionaryPlusPlus). I don't expect it to go anywhere, especially since it requires one to build, sign and install the app themselves. However, I am most welcome to pull requests and issues from those who do use it. Enjoy.
