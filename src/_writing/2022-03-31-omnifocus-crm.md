---
title: "Using OmniFocus as a simple CRM"
description: "If you're on a large team with many moving parts, having a CRM is an absolute necessity. But how long can you get by without one if you're a solo founder or indie hacker? Quite a while, if you've got a tool like OmniFocus at hand."
category: productivity
image: https://images.unsplash.com/photo-1566443280617-35db331c54fb
---

{% assign dateString = resource.data.date | date: "%Y-%m-%d" %}
{% assign assetPath = "/images/writing/" | append: dateString %}

I was perusing Twitter today and came across this question from [Joe Masilotti](https://twitter.com/joemasilotti), the creator of [RailsDevs.com](https://railsdevs.com/):

<blockquote class="twitter-tweet" data-align="center" data-dnt="true" data-theme="dark"><p lang="en" dir="ltr">How do bootstrappers manage leads/sales?<br><br>I have contacts all over the place (email, Twitter DMs, Discord, Slack, etc.) and am afraid I&#39;m dropping the ball on following up.<br><br>Is there a simple system to follow (e.g. in Google Sheets)? Or a very small CRM that works well for you?</p>&mdash; Joe Masilotti 📗 (@joemasilotti) <a href="https://twitter.com/joemasilotti/status/1509513582685294593?ref_src=twsrc%5Etfw">March 31, 2022</a></blockquote>
<script async src="https://platform.twitter.com/widgets.js" charset="utf-8"></script>

At [Tuple](https://tuple.app), we use [Pipedrive](https://pipedrive.com) to manage all of our Enterprise plan deals and renewals. There's no shortage of competitors in the space, and the options can be pretty overwhelming.

But do you really need a CRM if you're in a scenario like the one Joe finds himself in? I don't think so.

## Why use a CRM app?

If you're a member of a large sales team, having a dedicated CRM app feels like an absolute necessity. You want everyone to be able to dip their toe into the state of the world, especially if it's the world they're responsible for managing and delegating tasks within.

We don't have that at Tuple, but we **do** have three co-founders who care deeply about being aware of the state of our business. Having a place where any of them can log in and see what deals are in the pipeline at a glance is essential. It keeps them from interrupting people to ask for status updates and surfaces the in-flight tasks and important details quite nicely; it's a win-win!

## Let's not, though

If you're a solo founder, indie hacker, or bootstrapper like Joe, you're not bound by the constraint of needing to keep everyone in the loop about your activity asynchronously. Immediately, most of the benefits that I see in outsourcing your CRM away from your daily driver to-do list vanish.

Instead, you can use a few of the core elements of the [Getting Things Done](https://gettingthingsdone.com) methodology and a tool like [OmniFocus](https://omnifocus.com) to keep it simple and still absolutely **crush it**. Let's say you've got a business that has three main types of sales/success activities:

- New Customers signing up for the first time
- Expanding Customers who pay you more money for increased usage
- Keeping existing/large customers very happy

### New customers

In this example, let's ensure that we don't forget to follow up with the customer about some redlines we sent over to an agreement. We'll give them two weeks before we ping them.

![First Example]({{ assetPath }}/omnifocus-1.png)

1. The project name is based on the outcome you want to achieve, making it easier to reference at a glance when you've got these tasks together in a single list.

2. The task is descriptive. We know exactly what and who we're waiting on.

3. An "On Hold" tag is applied so that the task won't show up as something we can take action on until the due date.

4. The due date is as long as we want this to linger with the client before we jump back in and follow up; that's two weeks from today, in this example.

### Expansion customers

It's the same story for expansion; let's make sure we don't drop the ball and forget to follow up about how their ad campaign is doing so we can upsell:

![Second Example]({{ assetPath }}/omnifocus-2.png)

### Success

This one is a bit different. This client has been with us for a while, and we want to check in next week and see how things are going. There's nothing to remind them about; just a friendly check-in that will build the relationship.

![Third Example]({{ assetPath }}/omnifocus-3.png)

1. I use an "Email" tag to filter my tasks down to only the things I can work on in a given context. This element is entirely optional.

2. We use a defer date so that we don't see this task on our to-do list of actionable items until that date. There's no use in seeing something you don't want to work on yet, and following up too frequently can be annoying for the recipient.

## Working the list

This setup might seem lovely, but how do you use it? In my OmniFocus, I have a custom perspective called "Next"; this only shows me available tasks, **or** tasks which are on hold with a due date within the next 24 hours.

Nothing in the examples above meets those criteria, so my "Next" perspective is empty!

![Empty Next Action Perspective]({{ assetPath }}/omnifocus-4.png)

Let's change some things around, though, and pretend that we deferred our Success task to today's date, and our Expansion follow-up is due today as well. Now, when I open up my "Next" perspective, those two tasks are waiting for me:

![Populated Next Action Perspective]({{ assetPath }}/omnifocus-5.png)

## Job done!

As simple as it seems, handling activities with your customers as a solo founder really can be tackled with these three OmniFocus features:

- An on-hold tag
- Defer dates
- Due dates

If you're thinking of adding complexity to your life or business by integrating a more full-fledged CRM, I'll urge you to try a more straightforward solution with your current to-do list of choice as a first step. Your time is precious, and spending less of it bouncing between a bunch of tools and websites will ensure that you're focusing on what you do best.
