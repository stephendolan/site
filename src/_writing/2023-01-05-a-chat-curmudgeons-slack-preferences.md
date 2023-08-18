---
title: "A Chat Curmudgeon's Guide to Slack Preferences"
description: "I hate Slack's default preferences, and so can you!"
category: Productivity
tags:
  - Automation
image: https://cdn.midjourney.com/d5c204fd-d4f5-4d76-a041-6e1eff5418d3/0_3.png
---

<!-- Include assets like ![Asset]({{ assetPath }}/my-asset.png) -->

{% assign dateString = resource.data.date | date: "%Y-%m-%d" %}
{% assign assetPath = "/images/writing/" | append: dateString %}

## My take on chat

I don't love apps like Slack and Discord for work, but they're here to stay. We just transitioned to Slack at [Tuple](https://tuple.app), and after a few tweaks, I'm pretty happy with how the app feels for me.

I thought it'd be helpful to catalog the settings and modifications I employed along the way to end up with a clean and minimalist setup with very few notifications that looks like this:

![My Setup]({{ assetPath }}/slack-summary.png)

## Use channel sections

I utilize [Sections](https://slack.com/help/articles/360043207674-Organize-your-sidebar-with-custom-sections) to categorize channels that I'm added to. The sections you use can vary based on what works for you, but if you have more than 5 or 6 channels, I recommend using them. Mine are:

- `Chat` for fun conversations, general announcements, etc.
- `Teams` for channels specifically related to teams at the company, like Engineering, Sales, or Marketing.
- `Projects` for ethereal channels related to something with a definite ending, like a specific feature or position you're hiring for.
- `External` for [Slack Connect](https://slack.com/connect) channels with vendors, customers, and contractors.

This also allows you to set section-specific visibility rules so that you don't see all of your channels displayed all of the time.

## Ship tasks to OmniFocus

I set up [a simple Zapier automation](https://zapier.com/shared/229fb66f346c69369338c30fecd49c5b6e91ad4d) to send bookmarked (saved) messages to my OmniFocus inbox. This avoids the all-too-common issue where someone requests something of you in a channel, which you promptly forget as soon as you've clicked away to another notification.

![Slack Notifications]({{ assetPath }}/zapier-integration.png)

If you don't use OmniFocus, use an email action to send tasks to your inbox there instead!

## Modify your preferences

Slack might change where these settings live as the app updates, but if you let me know something's out of date via [stephen@stephendolan.com](mailto:stephen@stephendolan.com), I'll help out and update this post.

I won't be showing _every_ preference, just the ones that feel the most important for the overall minimalism I'm going for.

### Notifications

I only want to be notified when I'm tagged, DM'd, or someone mentions a keyword about something I care about. My keywords are restricted to a mix of fun and work topics I'm interested in, like gardening, OmniFocus, or our Shape Up process.

![Slack Notifications]({{ assetPath }}/slack-notifications.png)

I also set up a Notification schedule to only get notified between 8:30 AM and 5:00 PM daily. Excluding weekends is reasonable, too, but not necessary or helpful in my case.

### Sidebar

I like to minimize the number of things I see in the sidebar to potentially actionable stuff, like an unfinished draft or DM I haven't gotten back to.

![Slack Sidebar]({{ assetPath }}/slack-sidebar.png)

Another critical setting for me is to show customized conversations per Section. This helps to reduce clutter and focus on only the things that might be actionable at any given time. For every Section except Starred, I set them to show Unread conversations only.

![Slack Section Settings]({{ assetPath }}/slack-section-settings.png)

## Mute aggressively

If you set up the notification preferences I outlined in the previous section, the only remaining distractions will be that every channel in your sidebar will show up in bold any time there's a new message. You can reduce how "loud" these are visually by running the `/mute` command in channels where you don't want to stay up-to-date with every new message.
