---
brief: Synchronize Alibaba Cloud ARMS monitoring alert events to Flashcat via webhook to achieve automatic noise reduction processing of alert events
---

# Alibaba Cloud ARMS Integration

Synchronize Alibaba Cloud ARMS monitoring alert events to Flashduty via webhook to achieve automatic noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Alibaba Cloud ARMS** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Alibaba Cloud ARMS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Alibaba Cloud ARMS
**Step 1: Configure Notification Objects**

1. Log in to your Alibaba Cloud console and select the ARMS monitoring product
2. Enter the **alert Management -> Notification Object** page, select **Webhook Integration** , click the New Webhook button to start editing content;
3. As shown in the figure, set the object name, select `Post`, and copy and paste the integration push address
4. Add a `Header`, enter `Content-Type` and `application/json`
5. In the notification template, input: `$alertmanager_content`
6. Click the Confirm button to submit and save.

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/aliyun_arms/1.avif" />

**Step 2: Configure Notification Policies**

1. Enter the **alert Management -> Notification Policy** page, click New Notification Policy or select an existing policy to edit;
2. As shown in the figure below, on the **notification object** page, select the created **universal Webhook** object;
3. Submit and save, and wait for the alert to trigger.

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/aliyun_arms/2.avif" />

## Status Comparison

Alibaba Cloud ARMS monitoring to Flashduty alert level mapping:

| Alibaba Cloud ARMS Monitoring |  Flashduty  | Status |
| ------------ | -------- | ---- |
| P1     | Critical | High |
| P2     | Warning  | Average |
| P3     | Warning     | Average |
| P4     | Info     | Disaster |