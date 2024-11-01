---
brief: Synchronize Tencent Cloud Monitoring CM alert events to Kuaimao Nebula via webhook to achieve automatic noise reduction processing of alert events
---

# Tencent Cloud Monitoring CM Integration

Synchronize Tencent Cloud Monitoring CM alert events to Flashduty via webhook to achieve automatic noise reduction processing of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Tencent Cloud Monitoring CM** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose the **Tencent Cloud Monitoring CM** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In Tencent Cloud Monitoring CM

1. Log in to your Tencent Cloud console and select the cloud monitoring product
2. Enter the alert Management -> Notification Templates page, click the New button to start editing notification templates
3. Fill in the callback address as the integration push address, and select the notification language as English
4. Click the Save button to save the template

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cm/1.avif" />

5. Enter the alert Configuration -> alert policy page, select the alert policy for all events to be sent, enter the details, and add the notification template created in the previous step

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cm/2.avif" />

6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Complete

## Status Comparison

All indicator alerts in Tencent Cloud Monitoring correspond to Flashduty "warning" level alerts.