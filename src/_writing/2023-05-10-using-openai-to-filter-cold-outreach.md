---
title: "Using OpenAI to filter cold outreach emails"
description: "I've seen an increase lately in the number of bad cold outreach I've received. Let's use AI to detect and filter them out!"
category: Productivity
tags: Email AI Automation
image: https://cdn.midjourney.com/23046ddf-45d1-4441-8056-0918d637e8b9/0_1.png
featured: true
---

{% assign dateString = resource.data.date | date: "%Y-%m-%d" %}
{% assign assetPath = "/images/writing/" | append: dateString %}

## The AI Arms Race

AI is dominating the world of technology right now, and you're seeing little AI helpers pop up all over the place.

They're pretty good for reasoning about basic things, interpreting and modifying language, and brainstorming.

I'm already seeing the results of this in my inbox in the form of cold outreach emails - this technology is making it easier than ever for people to send _decent enough_ emails to avoid spam detection while remaining equally useless from a practical standpoint.

## Enter: Google Apps Script

Google has this excellent scripting functionality that sits on top of lots of their services called [Google Apps Script](https://developers.google.com/apps-script). Most use cases (including this one) won't cost you anything, even on your free personal account.

Here's an overview of how I use it:

1. Every few minutes, a Google Apps Script runs and combs through my emails.
1. If a series of criteria are met, the email is processed by the OpenAI API to determine whether or not it's cold outreach.
1. If it is, I toss a label on it and throw it into a [split in Superhuman](https://blog.superhuman.com/how-to-split-your-inbox-in-superhuman/).
1. I give these marked emails a cursory review once per day; it generally results in me selecting all the messages and dumping them in the trash.

## How to set it up

{% rendercontent "posts/callouts/warning" %}
If you have a massive inbox full of unread emails, processing all of them through the OpenAI API could be expensive. Set appropriate API spending limits on your OpenAI developer dashboard, or modify the original search query used in the `main` function below.
{% endrendercontent %}

1. Head to [your Google Apps Script dashboard](https://script.google.com/home). Make sure you're logged into the Google account with the email inbox you want to scan.
1. Make a new project.
1. Paste in the following script, reviewing the `setUserVariables()` function to replace things like your OpenAI API key:

   ```javascript
   const userProperties = PropertiesService.getUserProperties();

   function setUserVariables() {
     // Ensure that your account has access to the model you're trying to use.
     userProperties.setProperty("openAiApiKey", "sk-your-key");
     userProperties.setProperty("openAiModel", "gpt-4");

     // We can use a regular expression to check for participants that should always flag a conversation as valid
     // Put your own personal email here, or a wildcard matching your company's domain
     userProperties.setProperty("allowListRegex", ".*@yourdomain.com");

     // If you're using a nested label, separate the sub-labels with a slash like 'AI/Processed'
     userProperties.setProperty("processedLabel", "AI/Processed");
     userProperties.setProperty("outreachLabel", "AI/ColdOutreach");
   }

   function haveReceivedFromSenderBefore(thread) {
     const threads = GmailApp.search(
       `from:${thread.getMessages()[0].getFrom()}`
     );
     return threads.length > 1;
   }

   function isAllowListedConversation(thread) {
     return thread.getMessages().some((message) => {
       return new RegExp(userProperties.getProperty("allowListRegex")).test(
         message.getFrom()
       );
     });
   }

   function itsProbablyNotSpam(thread) {
     return (
       isAllowListedConversation(thread) || haveReceivedFromSenderBefore(thread)
     );
   }

   function alreadyProcessed(thread) {
     const processedLabel = GmailApp.getUserLabelByName(
       userProperties.getProperty("processedLabel")
     );
     const outreachLabel = GmailApp.getUserLabelByName(
       userProperties.getProperty("outreachLabel")
     );

     const labels = thread.getLabels();

     return labels.includes(processedLabel) || labels.includes(outreachLabel);
   }

   function looksLikeColdOutreach(thread) {
     const messageBody = thread.getMessages()[0].getBody();
     const apiKey = userProperties.getProperty("openAiApiKey");
     const prompt = `Does this email content looks like cold outreach from a company I don't know? Answer with one word, "Yes" or "No"\n\n ${messageBody
       .trim()
       .substring(0, 250)}`;
     const apiUrl = "https://api.openai.com/v1/chat/completions";

     let data = {
       model: userProperties.getProperty("openAiModel"),
       messages: [{ role: "user", content: prompt }],
       max_tokens: 1,
       temperature: 0.5,
       n: 1,
     };

     let options = {
       method: "post",
       headers: {
         Authorization: `Bearer ${apiKey}`,
       },
       contentType: "application/json",
       payload: JSON.stringify(data),
     };

     const responseBody = UrlFetchApp.fetch(apiUrl, options);
     const response = JSON.parse(responseBody);
     const aiResponse = response.choices[0].message.content;

     if (aiResponse === "Yes") {
       return true;
     }

     return false;
   }

   function addInvestigationLabel(thread) {
     const label = GmailApp.getUserLabelByName(
       userProperties.getProperty("processedLabel")
     );
     thread.addLabel(label);
   }

   function removeInvestigationLabel(thread) {
     const label = GmailApp.getUserLabelByName(
       userProperties.getProperty("processedLabel")
     );
     thread.removeLabel(label);
   }

   function addColdOutreachLabel(thread) {
     const label = GmailApp.getUserLabelByName(
       userProperties.getProperty("outreachLabel")
     );
     thread.addLabel(label);
   }

   function main() {
     setUserVariables();

     const inboxThreads = GmailApp.search("in:inbox is:unread");
     inboxThreads.forEach((thread) => {
       Logger.log(`Processing thread: '${thread.getFirstMessageSubject()}'`);

       if (itsProbablyNotSpam(thread)) {
         Logger.log(`\tProbably not spam. Moving on!`);
         return;
       }

       if (alreadyProcessed(thread)) {
         Logger.log(`\tAlready processed. Moving on!`);
         return;
       }

       Logger.log(`\tCould be spam. Investigating!`);
       addInvestigationLabel(thread);

       if (looksLikeColdOutreach(thread)) {
         Logger.log("\t\tThis looks like cold outreach.");
         removeInvestigationLabel(thread);
         addColdOutreachLabel(thread);
       }
     });
   }
   ```

1. Click "Run" in the top toolbar to make sure everything is working and accept Google's permission prompts. It's helpful to manually move an email that was cold outreach and one that definitely wasn't into your inbox and mark them both as unread.
1. Click on "Triggers" on the left side of your screen, and add a new one that runs the `main` function however often you need your inbox scanned. I run mine every 5 minutes.

## Enjoy!

I'd expect that I'll take this post down in the next few months as tools like Gmail and Superhuman implement some of this basic detection directly in their apps. In the meantime, though, I've ended up with a much more pleasant inbox that leaves me feeling frustrated less often.
