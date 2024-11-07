---
brief: Synchronize Alibaba Cloud Cloud Monitoring Event Center alerts to Flashcat via webhook to achieve automated noise reduction processing of alert events
---

# Alibaba Cloud Monitoring CM Event Integration

Synchronize Alibaba Cloud Cloud Monitoring Event Center alerts to Flashduty via webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Alibaba Cloud CM Event** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Alibaba Cloud CM Event** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Alibaba Cloud Monitoring CM Event
**Step 1: Add Push Channels**

1. Log in to your Alibaba Cloud console and select the cloud monitoring product
2. Enter **the Event Center -> Event Subscription** page, switch to **the Push Channel** tab, click the Create Push Channel button, and start editing content
3. As shown in the figure, select **POST** for **Request Method** and fill in the integrated push address for **Address**
4. Click the Confirm button to submit the update

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/aliyun_cm_event/1.avif" />

**Step 2: Add Subscription Policy**

1. Log in to your Alibaba Cloud console and select the cloud monitoring product
2. Enter **the Event Center -> Event Subscription** page, switch to **the Subscription Strategy** tab, click the Create Subscription Strategy button, and start editing content
3. Fill in the subscription name, select the event type and scope, and configure the push channel at the bottom to be the Flashduty channel created previously
4. Click the Confirm button to submit the update
5. The figure below shows the subscription results for two types of events: threshold and system

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/aliyun_cm_event/2.avif" />

## Status Comparison

Mapping of Alibaba Cloud Cloud Monitoring event alerts to Flashduty alert levels:

| Alibaba Cloud Cloud Monitoring |  Flashduty  | Status |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | High |
| WARNING      | Warning  | Average |
| INFO         | Info     | Disaster |