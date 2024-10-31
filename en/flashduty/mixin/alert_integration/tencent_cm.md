---
brief: Synchronize Tencent Cloud Monitoring CM alert events with Kuaimao Nebula via webhook to automate noise reduction for alert events
---

# Tencent Cloud Monitoring CM Integration

Synchronize Tencent Cloud Monitoring CM alert events with Flashduty via webhook to automate noise reduction for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Tencent Cloud Monitoring CM** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Tencent Cloud Monitoring CM** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In Tencent Cloud Monitoring CM

1. Log in to your Tencent Cloud console and select the Cloud Monitoring service
2. Enter the "Alert Management" -> "Notification Templates" page, click the "New" button to begin editing the notification templates
3. Enter the callback address as the integrated push address, and select "English" for the notification language
4. Click the "Save" button to preserve the template

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cm/1.avif" />

5. Enter the Alert Configuration -> Alert Policy page, select the alert policy for all events to be sent, go to the details, and add the notification template created in the previous step

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cm/2.avif" />

6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Finish

## Status Comparison

All indicator alerts in Tencent Cloud Monitoring correspond to Flashduty "warning" level alerts.