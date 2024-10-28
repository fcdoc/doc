---
brief: Synchronize Alibaba Cloud Monitoring Event Center alerts to Kuaimao Xingyun via webhook to automate noise reduction processing for alert events
---

# Alibaba Cloud Monitoring CM Event Integration

Synchronize Alibaba Cloud Monitoring Event Center alerts to Flashduty via webhook to automate noise reduction processing for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Alibaba Cloud CM Event** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Alibaba Cloud CM Event** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## Configure Alibaba Cloud Monitoring CM Events
**Step 1: Add a Push Channel**

1. Log in to your Alibaba Cloud console and select the Cloud Monitoring service
2. Enter the **Event Center -> Event Subscription** page, navigate to the **Push Channels** tab, click the "Create Push Channel" button to begin editing the content
3. As illustrated, select **POST** for the **Request Method** and enter the integrated push address in the **Address** field
4. Click the "Confirm" button to submit the updates

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/seOk8MgkEvjJCNzrDUEr8i0bnprzJyM5bb7-V_I3lqs.avif" />

**Step 2: Add a Subscription Policy**

1. Log in to your Alibaba Cloud console and select the Cloud Monitoring service
2. Access the **Event Center -> Event Subscription** page, go to the **Subscription Strategy** tab, and click the "Create Subscription Strategy" button to start editing the content
3. Enter a subscription name, choose the event type and scope, and at the bottom, configure the push channel to the previously created Flashduty channel
4. Click the "Confirm" button to finalize and submit the updates
5. The figure below shows the subscription results for two types of events: Threshold and System

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/yyNAM2bu8Z8ppbnnUX_irJpODrosO8QqejhB8egEojw.avif" />

## Status Comparison

Mapping relationship between Alibaba Cloud Monitoring event alerts and Flashduty alert levels:

| Alibaba Cloud Monitoring |  Flashduty  | state |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | serious |
| WARNING      | Warning  | warn |
| INFO         | Info     | remind |