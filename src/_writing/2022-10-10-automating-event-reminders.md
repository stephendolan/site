---
title: "Automatic event reminders in OmniFocus"
description: "Using Google Apps Script and Google Contacts, you can automatically send yourself reminders for key events in your life."
category: Productivity
tags: OmniFocus Automation
image: https://images.unsplash.com/photo-1435527173128-983b87201f4d
---

## Becoming a well-wishing, event tackling machine

Where do you keep all the miscellaneous events that you want to keep track of in your life? For me, these run the gambit from personal events to mundane to-dos, but they're all important:

- Celebrating my parents' anniversary
- Renewing my car registration
- Decorating for Halloween
- Celebrating my wedding anniversary
- Setting up an annual review at work
- Scheduling Fall and Spring AC maintenance

My goal is to approach each of these with laser-like precision; people should be _amazed_ at how attentive I am and _astounded_ that I remember something year after year with no lapses.

There are many tools you could use to achieve this goal, and while the approach I've landed on may not work for everyone, it's a system that works perfectly for me.

## Exit: Google calendar

I prescribe to the GTD methodology, so the only things on my calendar are items that _have_ to happen on that date. One approach for storing all of the events I mentioned previously is to simply create a new calendar, add these events to the calendar, and the set up a 2/4-week notification using Google's build-in functionality.

That works for most things, but what about odd-ball holidays that don't fall on specific dates like Easter and Thanksgiving? We might enable that beefy "US Holidays" calendar and set up notifications there, but then you're inundated with holidays you don't need to action on or missing ones that you do.

Another weakness of this system is the innability to calculate the length of anniversary tasks. I want to know how many years of marriage my parents are celebrating right in the reminder, not by storing the date in a note somewhere and having to do the math each year.

## Enter: Google Apps Script

Google has an excellent scripting functionality that sits on top of lots of their services called [Google Apps Script](https://developers.google.com/apps-script). Most use cases (including this one) won't cost you anything, even on your free personal account.

Once a day, a Google Apps Script runs at ~2 am and combs through a list of events. If one of those events occurs 30 days from today, I email my OmniFocus inbox a task to handle it, including a note stating how many years the item has recurred for when relevant.

## How to set it up

1. Head to [your Google Apps Script dashboard](https://script.google.com/home).
1. Make a new project.
1. Paste in the following script, substituting out the `email_destination` user property for your own [OmniFocus inbox email](https://support.omnigroup.com/omnifocus-mail-drop/). Add your own custom events with optional years to `customHolidays`, and define the set of standard holidays you care about in `setInitialHolidays`.

   ```javascript
   // Pull in Moment and Moment Holiday libraries.
   eval(
     UrlFetchApp.fetch(
       "https://cdn.jsdelivr.net/npm/moment@latest"
     ).getContentText()
   );
   eval(
     UrlFetchApp.fetch(
       "https://cdn.jsdelivr.net/npm/moment-holiday@latest"
     ).getContentText()
   );

   const userProperties = PropertiesService.getUserProperties();
   userProperties.setProperty("advance_days", 30);
   userProperties.setProperty(
     "email_destination",
     "your-omni-address@sync.omnigroup.com"
   );

   const dateToCheck = moment().add(
     userProperties.getProperty("advance_days"),
     "days"
   );

   const customHolidays = {
     "Car Registration Due": { date: "11/4" },
     "Marriage Anniversary": { date: "9/22", year: 2018 },
     "Spring AC Maintenance": { date: "4/1" },
     "Fall Heater Maintenance": { date: "10/1" },
   };

   function addCustomHolidays() {
     for (const [name, data] of Object.entries(customHolidays)) {
       moment.modifyHolidays.add({ [name]: data });
     }
   }

   // Set this to the holidays you want to monitor from your locale:
   // https://github.com/kodie/moment-holiday/blob/master/locale/united_states.js
   function setInitialHolidays() {
     moment.modifyHolidays.set([
       "Valentine's Day",
       "Easter Sunday",
       "Memorial Day",
       "Mother's Day",
       "Father's Day",
       "Independence Day",
       "Labor Day",
       "Halloween",
       "Thanksgiving Day",
       "Christmas Day",
       "New Year's Eve",
     ]);
   }

   function sendEventToTaskManager(eventName) {
     const recipient = userProperties.getProperty("email_destination");
     const prettyDate = dateToCheck.format("MMM Do, YYYY");
     const subject = "Event incoming! " + eventName + " on " + prettyDate + ".";
     let body = "";

     if (
       customHolidays[eventName] !== undefined &&
       customHolidays[eventName].year !== null
     ) {
       const dateClone = moment(dateToCheck);
       const yearsFromInitialEvent = dateClone
         .subtract(customHolidays[eventName].year, "years")
         .format("Y");
       body = `This event marks ${parseInt(
         yearsFromInitialEvent,
         10
       )} years!\n`;
     }

     MailApp.sendEmail(recipient, subject, body);
   }

   function main() {
     setInitialHolidays();
     addCustomHolidays();

     Logger.log(`Checking date '${dateToCheck.format("MMM Do, YYYY")}'`);

     let events = [].concat(dateToCheck.isHoliday() || []);
     events.forEach((event) => {
       Logger.log(`Sending a task for '${event}'.`);
       sendEventToTaskManager(events);
     });
   }
   ```

1. Click "Run" in the top toolbar to make sure everything is working and accept Google's permission prompts to send emails on your behalf. It's helpful to manually set one of your events to 30 days from today to ensure items appear in your OmniFocus inbox.
1. Click on "Triggers" on the left side of your screen, and add a new one that runs the `main` function once per day between 1 AM and 2 AM.

## Enjoy!

If you've set up everything correctly, you'll see event reminders for the things you care about flowing into OmniFocus 30 dyas ahead of time!

In most instances, I convert these inbox tasks to projects and get to work defining the next action to appropriately celebrate or tackle the event.
