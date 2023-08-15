---
title: "Adding Hyper key support to the Kinesis Advantage2 keyboard"
description: "There are apps that add Hyper key functionality to macOS, but this method will work on any OS without additional software!"
category: Productivity
tags: Shortcuts
featured: true
image: https://cdn.midjourney.com/10e3933d-3710-44aa-b390-3eabf3b0ec1d/0_3.png
---

{% assign dateString = resource.data.date | date: "%Y-%m-%d" %}
{% assign assetPath = "/images/writing/" | append: dateString %}

## What is the Hyper key?

The Hyper key is a specially-named modifier key that's really just a combination of multiple other modifiers:

- On macOS, that means `shift + control + option + command`
- On Windows, `shift + control + alt + windows`
- On Linux, `shift + control + alt + super`

It's nice because it gives you a level of keyboard shortcut that you know won't be hijacked by other apps or the OS.

Sure, `⌘ + o` is reserved for "Open"... but `hyper + o` is up for grabs!

## Alternatives to my approach

I use macOS, and started looking into how to add Hyperkey support. Luckily, a standalone app exists that does exactly that, aptly named [Hyperkey](https://hyperkey.app/).

This was fine for a while, but I kept running into a few inconsistencies where Hyperkey would be running but the actual key remapping wouldn't work. It was frustrating enough to go spelunking for other options.

The best option I found only works if you have a [Kinesis Advantage2](https://kinesis-ergo.com/shop/advantage2/) keyboard. If you don't, you'll have to stick with [Hyperkey](https://hyperkey.app/) or find a similar app for your OS.

## Remapping a Hyper key on the Kinesis Advantage2

So, let's assume you've got a [Kinesis Advantage2](https://kinesis-ergo.com/shop/advantage2/) keyboard and want to set up a Hyper key without additional software.

Here are the necessary incantations to get it set up:

1. Ensure you're on the latest firmware version (at least version `1.0.521`).
   - You can check this by pressing `program + escape` in an open text editor. You'll get a status printout with your firmware version, which you can check against the "Firmware Updates" section of [their support page](https://kinesis-ergo.com/support/advantage2/).
   - If you need to update, you can follow the update instructions in the [official Kinesis PDF](https://kinesis-ergo.com/wp-content/uploads/Adv2-Firmware-Update-Instructions-2-2-21.pdf).
1. Enter Power User Mode by pressing `program + shift + escape`. Your keyboard lights should blink four times; keep holding down program and shift until they're done blinking.
1. Mount your keyboard as a device by pressing `program + F1`.
   - Actually getting the device to show up on my Mac seemed to be a bit fiddly. Don't get discouraged if you don't see it. Just make sure you're in Power User Mode (press `program + escape` in a text editor for a status printout) and try again.
1. Head to the mounted device, open your layouts folder, and open the appropriate text file for your layout. This is probably `qwerty.txt`, but if you're a Dvorak user you'll want to open `dvorak.txt`.
1. Add a line to this file that remaps your preferred key to a Hyper key. I wanted Caps Lock to be my Hyper key, so the line looks like `[caps]>[hyper]`.
1. Save the file, eject the mounted drive, and exit Power User Mode with `program + shift + escape`.
1. You should now have a Hyper key by pressing your Caps Lock button! You can test by opening an app that supports it like [Raycast](https://www.raycast.com/) and trying to set a hotkey that uses it.
