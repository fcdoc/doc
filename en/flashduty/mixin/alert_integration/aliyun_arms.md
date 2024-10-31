---
brief: Synchronize Alibaba Cloud ARMS monitoring alert events with Kuaimao Nebula via webhook to automate noise reduction for these alerts
---

# Alibaba Cloud ARMS Integration

Synchronize Alibaba Cloud ARMS monitoring alert events with Flashduty via webhook to automate noise reduction for these alerts.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Alibaba Cloud ARMS** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Choose the **Alibaba Cloud ARMS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## The process is now complete
**Step 1: Configure Notification Objects**

1. Log in to your Alibaba Cloud console and select the ARMS monitoring product
2. Enter the **alert Management -> Notification Object** page, select **Webhook Integration** , click the New Webhook button to start editing content;
3. As illustrated, set the object name, select `Post`, and copy the push address for integration
4. Add a `Header`, input `Content-Type`, and set it to `application/json`
5. Enter `$alertmanager_content` within the notification template
6. Click "OK" to submit and save the changes.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_arms/1.avif" />

**Step 2: Configure Notification Policy**

1. Enter the **alert Management -> Notification Policy** page, click New Notification Policy or select an existing policy to edit;
2. As shown in the figure below, on the **notification object** page, select the created **universal Webhook** object;
3. Submit and save the settings, then wait for the alert to trigger.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_arms/2.avif" />

## Status Comparison

Mapping relationship between Alibaba Cloud ARMS monitoring and Flashduty alert levels:

| Alibaba Cloud ARMS Monitoring |  Flashduty  | state |
| ------------ | -------- | ---- |
| P1     | Critical | serious |
| P2     | Warning  | warn |
| P3     | Warning     | warn |
| P4     | Info     | remind |