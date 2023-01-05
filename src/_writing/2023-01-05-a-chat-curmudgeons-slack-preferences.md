---
title: "A Chat Curmudgeon's Guide to Slack Preferences"
description: "I hate Slack's default preferences, and so can you!"
category: productivity
image: https://images.unsplash.com/photo-1563986768609-322da13575f3
featured: true
---

{% assign dateString = resource.data.date | date: "%Y-%m-%d" %}
{% assign assetPath = "/images/writing/" | append: dateString %}

## My take on chat

I don't love apps like Slack and Discord for work. I think they're great for building community and having fun, but when they're used for actually trying to get things done can end up devolving into lazier requests, disjointed decision-making, and a lack of clear accountability for actions.

That said, chat apps are here to stay. We just transitioned to Slack at [Tuple](https://tuple.app), and I'm actually pretty happy with how the app feels for me. I thought it'd be useful to catalog the settings and modifications I employed along the way to end up with a clean and minimalist setup with very few notifications that looks like this:

![My Setup]({{ assetPath }}/slack-summary.png)

## Use channel sections

I utilize [Sections](https://slack.com/help/articles/360043207674-Organize-your-sidebar-with-custom-sections) to categorize channels that I'm added to. The actual sections you use can vary based on what works for you personally, but if you have more than 5 or 6 channels I'd really recommend making use of them. Mine are:

- `Chat` for fun conversations, general announcements, etc.
- `Teams` for channels specifically related to teams at the company, like Engineering, Sales, or Marketing.
- `Projects` for ethereal channels related to something that has a definite ending, like a specific feature or position you're hiring for.
- `External` for [Slack Connect](https://slack.com/connect) channels with vendors, customers, and contractors.

## Ship tasks to OmniFocus

I set up [a simple Zapier automation](https://zapier.com/shared/229fb66f346c69369338c30fecd49c5b6e91ad4d) to send bookmarked (saved) messages to my OmniFocus inbox. This avoids the all-too-common issue where someone requests something of you in a channel, which you promptly forget as soon as you've clicked away to another notification.

If you don't use OmniFocus, just use an email action to send tasks to your inbox there instead!

## Modify your preferences

Slack might change where these settings live as the app updates, but if you let me know something's out of date via [stephen@stephendolan.com](mailto:stephen@stephendolan.com), I'll help out and update this post.

I won't be showing _every_ preference; just the ones that feel the most important for the overal minimalism I'm going for.

### Notifications

I only want to be notified when I'm tagged, DM'd, or a keyword for something I really want to chime in on is mentioned. For me, those keywords are currently restricted to a mix of fun and work topics that I'm very interested in like gardening, OmniFocus, or our Shape Up process.

![Slack Notifications]({{ assetPath }}/slack-notifications.png)

I also set up a Notification schedule to only get notified between the hours of 8:30 AM and 5:00 PM every day. Excluding weekends is totally reasonable, too, but not necessary or helpful in my case.

### Sidebar

I like to minimize the number of things I see in the sidebar to potentially actionable stuff, like an unfinished draft or DM I haven't gotten back to.

![Slack Sidebar]({{ assetPath }}/slack-sidebar.png)

Another critical setting for me is to show `Unread conversations only`. This really helps to reduce clutter and focus on only the things that might be actionable at any given time.

## Mute agressively

If you set up the notification preferences I outlined in the previous section, the only remaining distractions will be that every channel in your sidebar will show up in bold any time there's a new message. You can reduce how "loud" these are visually by running the `/mute` command in any channels where you don't want to stay up-to-date with every new message.
