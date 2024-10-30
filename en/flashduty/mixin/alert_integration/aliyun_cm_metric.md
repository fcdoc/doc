---
brief: Synchronize Alibaba Cloud monitoring alarm events with Kuaimao Xinyun via webhook to automate noise reduction processing for alarm events
---

# Alibaba Cloud Monitoring CM Indicator Integration

Synchronize Alibaba Cloud monitoring alarm events with Flashduty via webhook to automate noise reduction processing for alarm events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Alibaba Cloud CM Indicator** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Alibaba Cloud CM Indicator** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Alibaba Cloud Monitoring
Choose either of the following two methods.

**Method 1: Configure by Rule**

1. Log in to your Alibaba Cloud console and select the Cloud Monitoring service
2. Navigate to Alarm Service -> Alarm Rules, select a rule, click the "Modify" button to begin editing the rule content
3. As illustrated, enter the integrated push address in the "Advanced Settings" as the callback URL
4. Click the "Confirm" button to finalize and submit the updates

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_cm_metric/1.avif" />

5. Repeat the above steps for all alert rules that you wish to synchronize events for
6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Finish

**Method 2: Configure by Contact**

1. Log in to your Alibaba Cloud console and select the Cloud Monitoring service
2. Go to Alarm Service -> Alarm Contacts, and select a contact to modify
3. As shown, input the integrated push address under the "Webhook" section
4. Click the "Confirm" button to finalize and submit the updates

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_cm_metric/2.avif" />

5. Repeat the above steps for all contacts that you want to synchronize events with
6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Finish

## Status Comparison

Mapping relationship between Alibaba Cloud Cloud Monitoring and Flashduty alarm levels:

| Alibaba Cloud Monitoring |  Flashduty  | state |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | serious |
| WARN         | Warning  | warn |
| INFO         | Info     | remind |
| NODATA       | Info     | remind |