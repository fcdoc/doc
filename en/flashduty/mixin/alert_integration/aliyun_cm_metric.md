---
brief: Synchronize Alibaba Cloud Cloud Monitoring alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events
---

# Alibaba Cloud Monitoring CM Indicator Integration

Synchronize Alibaba Cloud Cloud Monitoring alert events to Flashduty via webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Alibaba Cloud CM Indicator** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Alibaba Cloud CM Indicator** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Alibaba Cloud Monitoring
Choose one of the following two methods.

**Method 1: Configure by Rule**

1. Log in to your Alibaba Cloud console and select the cloud monitoring product
2. Enter the alert Service -> alert Rules page, select a rule, click the Modify button to start editing the rule content
3. As shown in the figure, fill in the callback address under Advanced Settings as the integrated push address
4. Click the Confirm button to submit the update

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/aliyun_cm_metric/1.avif" />

5. Repeat the above steps for all alert rules that you wish to synchronize
6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Finish

**Method 2: Configure by Contact**

1. Log in to your Alibaba Cloud console and select the cloud monitoring product
2. Enter the alert Service -> alert Contact page and choose to modify a contact
3. As shown in the figure, fill in the integrated push address under Webhook
4. Click the Confirm button to submit the update

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/aliyun_cm_metric/2.avif" />

5. Repeat the above steps for all contacts for which you wish to synchronize events
6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Finish

## Status Comparison

Alibaba Cloud Cloud Monitoring to Flashduty Alert Level Mapping:

| Alibaba Cloud Cloud Monitoring |  Flashduty  | Status |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | High |
| WARN         | Warning  | Average |
| INFO         | Info     | Disaster |
| NODATA       | Info     | Disaster |