---
brief: Generate a unique email address in Flashduty to synchronize the occurrence and recovery of alerts via email
---

# Email Integration

Generate a unique email address in Flashduty to synchronize the occurrence and recovery of alerts via email.

## Operation Steps

### Create Email Integration

You can obtain an email address in two ways; choose either one.

#### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Email** Integration, click **Save**, and generate the card.
    4. Click on the generated card to view the **email address**, copy it for later use, and complete.

#### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Select **Email** Integration:
    - **Integration Name**: Define a name for the current integration.
    - **Email Address**: Set a memorable prefix for the email address, ensuring it is unique under your account.
    - **Push Mode**: Choose the conditions under which the email triggers or resolves alerts.
    3. Copy the **email address** from the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

### Customize Email Integration

#### Email address

By default, the system generates a unique email address for you. You can modify it, but note that **the email prefix can only consist of letters and numbers** and must be unique within your account.

#### Push Mode

By default, the system creates a new alert for each email, but you can switch the mode to:

1. **Trigger or Update Based on Email Subject**: In this mode, whenever a new email is received, the system searches for an open alert based on the email subject. If an alert is found, it is updated; otherwise, a new alert is triggered.
2. **Trigger or Close Based on Rules**: In this mode, whenever a new email is received, the system matches the email according to your rules. Matched emails will trigger new alerts or close existing alerts based on the rules.

- You need to fill in at least one **trigger** rule
- You must set the regular extraction rules of Alert Key . The system uses this field to find the history alert so that it can be updated or closed; **if the regex extraction fails, the system will use the message header to generate Alert Key** to ensure alert it is not lost due to misconfiguration;
- You can choose whether to discard emails when none of the rules match.

Configuration Example:

- Receive all emails. When the email content contains the word **RESOVED**, close the alert; otherwise, trigger a new alert
- Alert Key Extracted from the email header, the rule is **/ (. * ) /** .

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/email/1.avif" alt="drawing" width="800"/>

### Things to Note

1. If the email message body is larger than 5MB, the system will refuse to receive it.
2. If the text content of the email exceeds 32KB, the system will truncate it and add a label in the incident details:

```
body_cut = true
```

3. If the email contains an attachment, the system will discard the attachment and add a label in the incident details:

```
attachment_stripped = true
```

4. In the new alert triggered by email, **the title is the email subject, and the description is the email content**.

5. If you change your account domain name, this email address will also change. Be sure to update your push address.

## Severity Mapping Relationship

The current alert levels pushed to Flashduty by email integration are all Warning.