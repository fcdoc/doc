---
brief: Synchronize Alibaba Cloud Cloud Monitoring alert events to Flashcat through a webhook to achieve automated noise reduction processing of alert events
---

# Alibaba Cloud Monitoring CM Indicator Integration

Synchronize Alibaba Cloud Cloud Monitoring alert events to Flashduty through a webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods; choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the Add Integration page
    3. Select the **Alibaba Cloud CM Indicator** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and complete.

### Use Shared Integrations

Use Shared Integration

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and navigate to the integration selection page.
    2. Choose the **Alibaba Cloud CM Metrics** integration:
    - Choose the **Alibaba Cloud CM Indicator** integration:
    3. After clicking **Save**, copy the newly generated **push URL** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Finish.

## Complete
Choose one of the following two methods.

**Method 1: Configure by Rules**

1. Choose one of the following two methods
2. Enter the alert Service -> alert Rules page, select a rule, click the Modify button to start editing the rule content
3. Log in to your Alibaba Cloud console and select the cloud monitoring product
4. Click the Confirm button to submit the update

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_cm_metric/1.avif" />

5. Repeat the above steps for all alert rules that you want to synchronize events for
6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Finish

**Method 2: Configure by Contacts**

1. Complete
2. Enter the alert Service -> alert Contact page and choose to modify a contact
3. Log in to your Alibaba Cloud console and select the cloud monitoring product
4. Click the Confirm button to submit the update

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_cm_metric/2.avif" />

5. Repeat the above steps for all contacts for which you want to synchronize events
6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Finish

## Status Comparison

Complete

| Status Comparison |  Flashduty  | Status |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | Alibaba Cloud Cloud Monitoring |
| WARN         | Warning  | Warning |
| INFO         | Info     | Reminder |
| NODATA       | Info     | Reminder |