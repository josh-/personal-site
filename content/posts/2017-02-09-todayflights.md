---
title: "TodayFlights – Notification Center Flight Tracking"
created_at: 2017-02-09 16:00:00 +1100
kind: article
published: true
---

I've just released [TodayFlights](\\joshparnham.com/projects/todayflights/), which is a simple  Notification Center widget that allows users to track flights.

It includes a map of the flight path, as well as detailed information about departure and landing times, including any encountered delays.

<!-- more -->

<div style="text-align: center;">
    <a href="/projects/TodayFlights/"><img class="responsive" style="width: 300px" src="/images/TodayFlights/1.jpg"></a>
</div>

Users are able to click on the bottom panel to cycle through the departure and arrival times, flight duration and time to arrival. Pan around the map and click on the departure or arrival airports to zoom in to them on the map view.

<div style="text-align: center;">
    <a href="/projects/TodayFlights/"><img class="responsive" style="width: 300px" src="/images/TodayFlights/2.jpg"></a>
</div>

It uses the FlightUtilities private framework, which is present in both macOS and iOS. This framework is responsible for the built-in flight tracking that was [introduced in iOS 9 and macOS El Capitan](https://9to5mac.com/2015/08/12/how-to-quickly-look-up-flight-status-data-on-ios-9-and-os-x-el-capitan/). I used [class-dump](http://stevenygard.com/projects/class-dump/) to extract the header files, and [otool](http://www.unix.com/man-page/osx/1/otool/) to decompile and assist in the investigation of the framework.

[TodayFlights](\\joshparnham.com/projects/todayflights/) is available now to download for free.