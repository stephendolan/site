---
title: "Automatic birthday reminders in OmniFocus"
description: "Using Google Apps Script and Google Contacts, you can automatically send yourself reminders to wish people a happy birthday."
category: Productivity
tags:
  - OmniFocus
  - Automation
image: https://images.unsplash.com/photo-1530103862676-de8c9debad1d
---

## "Happy belated birthday!"

Have you experienced that moment of dread when you realize that someone you care about celebrated their birthday this past weekend, and you didn't even send them a text? You either fall on the sword with an "Oh my gosh, I can't believe I missed your birthday!" or pretend you knew all along but chose not to send a text with a "Soooo... how was your birthday this weekend?".

It's probably better to remember in the first place.

I went to work searching for an alternative to Facebook and my calendar being my only source of reminders for birthdays. I rarely check the former and found adding personal contact birthdays to my work calendar (where I spend most of my time) way too tedious. If there was a way to maintain OmniFocus as my singular external brain, I wanted to leverage it!

## Enter: Google Apps Script

Google has this excellent scripting functionality that sits on top of lots of their services called [Google Apps Script](https://developers.google.com/apps-script). Most use cases (including this one) won't cost you anything, even on your free personal account.

Once a day, a Google Apps Script runs at ~2 am and combs through my contacts. If one of those contacts has a birthday two weeks from today, I email my OmniFocus inbox a task to wish that person a happy birthday.

## How to set it up

1. Add birthdays to your contacts in [Google Contacts](https://contacts.google.com/). Make sure not to miss parents, siblings, nieces/nephews, children, and close friends.
1. Head to [your Google Apps Script dashboard](https://script.google.com/home). Make sure you're logged into the Google account with all of your contacts and their birthdays.
1. Make a new project.
1. Paste in the following script, substituting out the `email_destination` user property for your own [OmniFocus inbox email](https://support.omnigroup.com/omnifocus-mail-drop/):

   ```javascript
   // Pull in DayJS for date calculations. Exposes `dayjs()` function.
   eval(
     UrlFetchApp.fetch(
       "https://cdn.jsdelivr.net/npm/dayjs@latest",
     ).getContentText(),
   );

   function main() {
     // Establish some local settings. These only need to be set once, but there's no harm in leaving them.
     const userProperties = PropertiesService.getUserProperties();
     userProperties.setProperty("advance_days", 14);
     userProperties.setProperty(
       "email_destination",
       "your-omni-address@sync.omnigroup.com",
     );

     let contacts = ContactsApp.getContacts();
     const dateToCheck = dayjs().add(
       userProperties.getProperty("advance_days"),
       "days",
     );

     contacts.forEach((contact) => {
       let contactBirthday = contact.getDates(ContactsApp.Field.BIRTHDAY)[0];

       if (contactBirthday == null) {
         return;
       }

       // Google's default date on a contact is 1604, so we normalize all null years to that value for consistency.
       let parseableDateString = `${contactBirthday.getMonth()} ${contactBirthday.getDay()}, ${
         contactBirthday.getYear() || 1604
       }`;
       let birthDate = dayjs(parseableDateString);

       if (birthDate.format("MM DD") !== dateToCheck.format("MM DD")) {
         return;
       }

       let recipient = userProperties.getProperty("email_destination");
       let subject = `Wish ${contact.getFullName()} a happy birthday on ${birthDate.format(
         "MMMM D",
       )}.`;

       let body = "";
       if (birthDate.get("year") === 1604) {
         body = "They didn't have a birth year set in your Google Contacts.";
       } else {
         body = `They'll be ${dayjs().diff(birthDate, "years") + 1} years old.`;
       }

       MailApp.sendEmail(recipient, subject, body);
     });
   }
   ```

1. Click "Run" in the top toolbar to make sure everything is working and accept Google's permission prompts to access your contacts and send emails on your behalf. It's helpful to manually set one of your contact's birthdays to two weeks from today to ensure items appear in your OmniFocus inbox.
1. Click on "Triggers" on the left side of your screen, and add a new one that runs the `main` function once per day between 1 AM and 2 AM.

## Enjoy!

If you've set up everything correctly, you'll see birthdays for the people you care about flowing into OmniFocus two weeks ahead of time!

For most people, I rename the task to `Wish {person} a happy birthday via text` and set a defer and due date for their birthday.

For others, though, I might convert it into a project to ensure I get them a gift or card, organize a party, etc.
