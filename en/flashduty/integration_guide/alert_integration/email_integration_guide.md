---
brief: Generate a unique email address in Flashduty and synchronize alarm occurrences and recoveries to Flashduty via email
---

# Email Integration

Generate a unique email address in Flashduty and synchronize alarm occurrences and recoveries to Flashduty via email.

## Operation Steps

### Create Email Integration

You can obtain an email address using either of the following two methods.

#### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Email** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Email Address**, copy it for backup, and the task is complete.

#### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Email** integration:
    - **Integration Name**: Define a name for the current integration.
    - **Email Address**: Assign a memorable prefix for the email that must be unique within the account.
    - **Push Mode**: Choose the conditions under which the email will trigger or resume alerts.
    3. Copy the **Email Address** displayed on the current page for backup.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

### Customize Email Integration

#### Email address

By default, the system generates a unique email address for you. You can customize it, but note that **the email prefix must consist only of letters and numbers** and remain unique within your account.

#### Push Mode

By default, the system creates a new alert for each email, but you can switch to:

1. **Trigger or Update Alerts Based on Email Titles**: In this mode, upon receiving a new email, the system searches for open alerts based on the email title. If an alert is found, it is updated; otherwise, a new alert is triggered.
2. **Trigger or Close Alerts Based on Rules**: In this mode, upon receiving a new email, the system matches the email against your rules, triggering new alerts or closing existing ones accordingly.

- You must define at least one **trigger** rule
- You must set the regular expression for extracting the Alert Key. The system uses this field to find historical alerts for updates or closures; **if the regular expression fails, the system uses the email title to generate the Alert Key**, ensuring alerts are not lost due to configuration errors
- You can opt to discard emails when no rules match.

Configuration Example:

- Receive all emails; when the content includes the word **RESOLVED**, close the alert, otherwise trigger a new one
- Extract the Alert Key from the email title using the rule **/(.*)/**.

<img src="https://fcdoc.github.io/img/UzSAxxB8q30joMRUlGUldv2u9iiYGCNCXG0uJmiRvtA.avif" alt="drawing" width="800"/>

### Notes

1. The system will reject emails larger than 5MB.
2. If the text content of an email exceeds 32KB, the system will truncate it and add a label prompt in the fault details

```
body_cut = true
```

3. If an email contains an attachment, the system will discard the attachment and add a label prompt in the fault details

```
attachment_stripped = true
```

4. In new alerts triggered by email, **the title is the email's subject, and the description is the email's content**.

5. If you change your account's domain name, the email address will also change. Be sure to update the push address accordingly.

## Severity Level Mapping

The current email integration pushes alerts to Flashduty at a Warning level.