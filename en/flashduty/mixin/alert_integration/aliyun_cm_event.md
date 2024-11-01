---
brief: Synchronize Alibaba Cloud Cloud Monitoring Event Center alerts to Kuaimao Nebula via webhook to achieve automatic noise reduction processing of alert events
---

# Alibaba Cloud Monitoring CM Event Integration

Synchronize Alibaba Cloud Cloud Monitoring Event Center alerts to Flashduty via webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Alibaba Cloud CM Event** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose the **Alibaba Cloud CM Event** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## Monitor CM Events on Alibaba Cloud
**Step 1: Add Push Channels**

1. Log in to your Alibaba Cloud console and select the cloud monitoring product
2. Enter **the Event Center -> Event Subscription** page, switch to **the Push Channel** tab, click the Create Push Channel button, and start editing content
3. As shown in the figure, select **POST** for **Request Method** and fill in the integrated push address for **Address**
4. Click the Confirm button to submit the update

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_cm_event/1.avif" />

**Step 2: Add Subscription Policy**

1. Log in to your Alibaba Cloud console and select the cloud monitoring product
2. Enter **the Event Center -> Event Subscription** page, switch to **the Subscription Strategy** tab, click the Create Subscription Strategy button, and start editing content
3. Fill in the subscription name, select the event type and scope, and configure the push channel at the bottom to the Flashduty channel created previously
4. Click the Confirm button to submit the update
5. The figure below shows the subscription results for two types of events: threshold and system

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_cm_event/2.avif" />

## Status Comparison

Alibaba Cloud Cloud Monitoring event alert to Flashduty alert level mapping relationship:

| Alibaba Cloud Cloud Monitoring |  Flashduty  | Status |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | Critical |
| WARNING      | Warning  | Warning |
| INFO         | Info     | Information |