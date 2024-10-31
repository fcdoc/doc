---
brief: Synchronize Baidu Cloud BCM alert events with Flashduty via webhook to automate noise reduction processing for alert events
---

# Baidu Cloud BCM Monitoring Integration

Synchronize Baidu Cloud BCM alert events with Flashduty via webhook to automate noise reduction processing for alert events.
## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Baidu Cloud Monitoring BCM** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Baidu Cloud Monitoring BCM** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In Baidu Cloud Monitoring BCM

1. Log in to your Baidu Cloud console, retrieve **cloud monitoring** products, and enter the corresponding console
2. Baidu Cloud provides a variety of ways to configure alert callbacks. For details, please refer to [the official documentation](/0) . The following only demonstrates the **alert Management -Alert policy** entry configuration method.
3. Enter the **alert Management -Alert Policy** page and choose to edit an existing or create a new alert policy
4. Alert In the **callback address** column in the policy, fill in the integrated push address (fill in the integration name on the current page, and the address can be generated after saving)

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/baidu_bcm/1.avif" />

5. Finish

## Status Comparison

Baidu Cloud monitors the alert level mapping relationship with Flashduty:

| BCM  |  Flashduty  | state |
| ---- | -------- | ---- |
| serious | Critical | serious |
| Important | Critical | serious |
| warn | Warning  | warn |
| Notification | Info     | remind |