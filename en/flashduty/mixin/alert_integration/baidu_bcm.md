---
brief: Synchronize Baidu Cloud BCM alert events to Flashduty via webhook to achieve automated noise reduction of alert events
---

# Baidu Cloud BCM Monitoring Integration

Synchronize Baidu Cloud BCM alert events to Flashduty via webhook to achieve automated noise reduction of alert events.
## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Baidu Cloud Monitoring BCM** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose the **Baidu Cloud Monitoring BCM** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Baidu Cloud Monitoring BCM

1. Log in to your Baidu Cloud console, retrieve **cloud monitoring** products, and enter the corresponding console
2. Baidu Cloud provides a variety of ways to configure alert callbacks. For details, please refer to [the official documentation](/0) . The following only demonstrates the **alert Management -Alert policy** entry configuration method.
3. Enter the **alert Management -Alert Policy** page and choose to edit an existing or create a new alert policy
4. Alert In the **callback address** column in the policy, fill in the integrated push address (fill in the integration name on the current page, and the address can be generated after saving)

<img alt="drawing" width="600" src="https://fcimg.3ti.site/zh/flashduty/mixin/alert_integration/baidu_bcm/1.avif" />

5. Finish

## Status Comparison

Baidu Cloud Monitoring to Flashduty alert level mapping:

| BCM  |  Flashduty  | Status |
| ---- | -------- | ---- |
| High | Critical | High |
| Important | Critical | High |
| Average | Warning  | Average |
| Notification | Info     | Disaster |