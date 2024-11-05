---
brief: Synchronize Tencent Cloud Monitoring CM alert events to Flashcat via webhook to achieve automatic noise reduction processing of alert events
---

# Tencent Cloud Monitoring CM Integration

Synchronize Tencent Cloud Monitoring CM alert events to Flashduty via webhook to achieve automatic noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods; either one is acceptable.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the Add Integration page
    3. Select the **Tencent Cloud Monitoring CM** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and complete.

### Use Shared Integrations

Use Shared Integration

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => alert events**, and navigate to the integration selection page.
    2. Choose the **Tencent Cloud Monitoring CM** integration:
    - Choose the **Tencent Cloud Monitoring CM** integration:
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Complete.

## Complete

1. Log in to your Tencent Cloud console and select the cloud monitoring product
2. Enter the alert Management -> Notification Templates page, click the New button to start editing notification templates
3. Log in to your Tencent Cloud console and select the cloud monitoring product
4. Click the Save button to save the template

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cm/1.avif" />

5. Enter the alert Configuration -> alert policy page, select the alert policy for all events to be sent, enter the details, and add the notification template created in the previous step

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cm/2.avif" />

6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Complete

## Status Comparison

All indicator alerts in Tencent Cloud Monitoring correspond to Flashduty "warning" level alerts.