---
brief: Generate a unique email address in Flashduty, and use email to synchronize the occurrence and resolution of alerts with Flashduty
---

# Email Integration

Generate a unique email address in Flashduty, and use email to synchronize the occurrence and resolution of alerts with Flashduty.

## Operation Steps

### Create Email Integration

You can obtain an email address using either of the following two methods.

#### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Email** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Email Address**, copy it for backup, and the task is complete.

#### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Email** integration:
    - **Integration Name**: Define a name for the current integration.
    - **Email Address**: Assign a memorable prefix for the email that must be unique within the account.
    - **Push Mode**: Select the conditions under which the email should trigger or restore an alert.
    3. Copy the **Email Address** displayed on the current page for backup.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

### Customize Email Integration

#### Email address

By default, the system generates a unique email address for you. You can customize it, but note that **the email prefix must consist only of letters and numbers** and remain unique within your account.

#### Push Mode

By default, the system creates a new alert for each email, but you can switch to:

1. **Trigger or Update Alerts Based on Email Title**: In this mode, upon receiving a new email, the system will search for an open alert based on the email title. If an alert is found, it will be updated; otherwise, a new alert will be triggered.
2. **Trigger or Close Alerts Based on Rules**: In this mode, upon receiving a new email, the system will match the email against your rules, triggering a new alert or closing an existing one according to those rules.

- You must define at least one **trigger** rule
- You must set up regular expression rules for extracting the Alert Key. The system uses this field to locate historical alerts for updating or closing; **if regex extraction fails, the system will use the email title to generate the Alert Key**, ensuring that alerts are not lost due to configuration errors
- You can opt to discard emails when no rules match.

Configuration Example:

- Receive all emails, and when the content includes the word **RESOLVED**, close the alert; otherwise, trigger a new alert
- Extract the Alert Key from the email title using the rule **/(.*)/**.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/email/1.avif" alt="drawing" width="800"/>

### Notes

1. The system will reject emails larger than 5MB.
2. If the email text content exceeds 32KB, the system will truncate it and add a label notice in the incident details:

```
body_cut = true
```

3. If the email contains an attachment, the system will discard the attachment and add a label notice in the incident details:

```
attachment_stripped = true
```

4. In new alerts triggered by email, **the title is the email subject, and the description is the email content**.

5. If you change your account's domain name, the email address will also change. Be sure to update the push address accordingly.

## Severity Level Mapping

The alert level for all alerts pushed to Flashduty via email integration is set to Warning by default.