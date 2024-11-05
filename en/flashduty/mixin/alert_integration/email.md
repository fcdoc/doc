---
brief: Generate a unique email address in Flashduty, and synchronize the occurrence and recovery of alerts to Flashduty via email
---

# Email Integration

Generate a unique email address in Flashduty, and synchronize the occurrence and recovery of alerts to Flashduty via email.

## ## Operation Steps

### ### Create Email Integration

You can obtain an email address in the following two ways, choose either one.

#### #### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Email** integration, click **Save**, and generate the card.
    4. Click on the generated card to view the **email address**, copy it for later use, and complete.

#### Use Shared Integrations

#### Use Shared Integration

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => alert events**, and go to the integration selection page.
    2. Select the **Email** integration:
    - Select the **Email** integration:
    - **Integration Name**: Define a name for the current integration.
    - **Email Address**: Set a memorable prefix for the email, ensuring it is unique under your account.
    3. **Push Mode**: Choose the conditions under which the email triggers or resolves an alert.
    4. Copy the **email address** on the current page for later use.
    5. Finish.

### Customize Email Integration

#### ## Customize Email Integration

By default, the system generates a unique email address for you. You can modify it, but note that **the email prefix can only consist of letters and numbers** and must be unique within your account.

#### Push Mode

### Push Mode

1. **Trigger or update alerts based on the email subject**: In this mode, whenever a new email is received, the system will search for unclosed alerts based on the email subject. If an alert is found, it will be updated; otherwise, the system will trigger a new alert.
2. **Trigger or update based on the email subject**: In this mode, whenever a new email is received, the system will search for an open alert based on the email subject. If an alert is found, it will be updated; otherwise, the system will trigger a new alert.

- You need to provide at least one **trigger** rule;
- You need to fill in at least one **trigger** rule
- You can choose whether to discard emails if none of the rules match.

Configuration Example:

- Receive all emails. When the email content contains the word **RESOLVED**, close the alert; otherwise, trigger a new alert
- Alert Key Extracted from the email header, the rule is **/ (. * ) /** .

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/email/1.avif" alt="drawing" width="800"/>

### Things to Note

1. ### Things to Note
2. If the email message body is larger than 5MB, the system will directly refuse to receive it

```
body_cut = true
```

3. If the text content of the email exceeds 32KB, the system will truncate it and add a label prompt in the incident details:

```
attachment_stripped = true
```

4. In the new alert triggered by email, **the title is the email subject, and the description is the email content**.

5. If you change your account domain, this email address will also change. Be sure to update the push address.

## Severity Mapping Relationship

### Severity Mapping Relationship