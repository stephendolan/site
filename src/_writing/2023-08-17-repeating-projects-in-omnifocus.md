---
series: "Mastering OmniFocus"
title: "Two Powerful Methods for Setting Up Recurring Projects"
description: "Single action lists are dangerous, but can be a force for good when used responsibly."
category: Productivity
tags:
  - OmniFocus
image: https://cdn.midjourney.com/5f05eeb2-b0da-4ba4-b98e-4893954215f5/0_3.png
featured: true
---

<!-- Include assets like ![Asset]({{ assetPath }}/my-asset.png) -->

{% assign dateString = resource.data.date | date: "%Y-%m-%d" %}
{% assign assetPath = "/images/writing/" | append: dateString %}

## Managing recurring projects in OmniFocus

Recurring tasks are pretty straightforward in OmniFocus. But what's the best way to set up a project (something that takes multiple steps to complete) that repeats? Things like:

- Completing your company's monthly book-keeping
- Hosting a monthly in-person meetup
- Running a weekly standup

I'll outline two methods in this post. The one you pick ultimately boils down to personal preference; how do you like to see your projects and tasks? How many recurring projects do you have? Which layout reduces friction the most and allows you to set up additional projects most quickly?

Let's get into it.

## Method 1: Tickler Tasks

The first method for handling recurring projects uses some rephrasing footwork to make them into recurring **tasks**.

Instead of thinking of the repeating item as the project "Host our monthly meetup" with four sub-tasks, think of it as the task "Set up the project for our next monthly meetup".

### Create the recurringing task

To make the task recurring, use the "Repeat" option in the inspector and set it up accordingly. If I want this task to show up each month, I'd select these options:

![Repeating Task Options]({{ assetPath }}/repeating-task-options.png)

### Add TaskPaper to the task notes

Finally, to reduce the friction between seeing this task and making the actual project, I add the project in its [TaskPaper](https://guide.taskpaper.com/getting-started) format in the note. This way, creating the project is as easy as copying the TaskPaper text (`cmd+c`), pasting to my inbox (`cmd+v`), and converting to a project (`cmd+shift+!`). [TaskPaper in OmniFocus](https://support.omnigroup.com/omnifocus-taskpaper-reference/) can support due dates, tags, flagged status, etc. Generating the taskpaper text is as easy as right-clicking a project and selecting "Copy as TaskPaper". Here's what the final task looks like:

![Repeating Task Full Details]({{ assetPath }}/repeating-task-full-details.png)

### Put the task in a project

Where you store these tasks is subjective, but I have a `Recurring` Single-Action project in all of my top-level folders that I use. I find that it's quite helpful to have one place to go to see all of the recurring projects and tasks I've committed to tackling:

![Recurring Project Container]({{ assetPath }}/recurring-project-container.png)

### The full picture

When I've completed this action, my system would look like this with a new project and a deferred instance of the next recurring tickler task:

![Repeating Task After Completion]({{ assetPath }}/repeating-task-after-completion.png)

Something about this approach has been feeling really great to me lately, especially for projects that might require some slight tweaks each time I spin them up. Creating the project itself as the first action is a great way to force yourself into a quick review, rather than just seeing the first task in a potentially-stale project that's quite tempting to skip or be lazy about in your weekly review.

## Method 2: Repeating Projects that Auto-Complete

The second method for handling recurring projects is the more "out of the box" method that OmniFocus encourages.

### Create the recurring project

Set up your project as you normally would, then check the "Complete with last action" checkbox and set up the "Repeat" option in the inspector. Here's what the same project from my previous example, which repeats monthly, would look like:

![Repeating Project Options]({{ assetPath }}/repeating-project-options.png)

{% rendercontent "posts/callouts/tip" %}
"Complete with last action" is totally optional, but can be great for projects that recur more frequently than your weekly review. As soon as you complete the last action in your project, it's status will change to Complete and the next recurring event will be created for you.
{% endrendercontent %}

### The full picture

Here's what completing the last task in a project with these settings looks like:

![Repeating Project Completion]({{ assetPath }}/repeating-project-completion.gif)

This approach personally feels a bit too bulky to me, and I find that I don't have many recurring projects that are simple enough to get the same exact tasks each month. As long as they're recurring less frequently than your weekly review and you're actively reviewing them, though, that shouldn't be a problem if you prefer this approach!
