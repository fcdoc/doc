---
brief: Synchronize Huawei Cloud Monitoring CES alert events to Kuaimao Nebula via webhook to achieve automatic noise reduction of alert events"
---

# Huawei Cloud Monitoring CES Integration

Synchronize Huawei Cloud Monitoring CES alert events to Flashduty via webhook to achieve automated noise reduction of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Choose the **Huawei Cloud Monitoring CES** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose the **Huawei Cloud Monitoring CES** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In Huawei Cloud Monitoring CES

1. Log in to your Huawei Cloud console, search for **cloud monitoring** products, and enter the corresponding product console
2. Enter the **alert-Alert Notification - Notification Object** page and click the **Create Notification Object** button
3. Select `HTTPS` for the protocol, fill in `flashduty` for the name, and enter the integration address for the endpoint (fill in the integration name on the current page, and the address will be generated after saving)
4. Click the **OK** button to complete the notification object creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/1.avif" />

5. Enter the **alert-Alert Notification - Notification Group** page and click the **Create Notification Group** button
6. Fill in `FlashDuty` for the group name, and select the `flashduty` notification object created earlier
7. Click the **OK** button to complete the notification group creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/2.avif" />

Note that when creating a notification group, Huawei Cloud will initiate a request to Flashduty , verify the push address, and view the notification object list of the notification group. Only when the status of the notification object **is confirmed** , will it be pushed normally alert

8. Enter the **alert-Alert Rules** page, select an existing alert rule to edit, or create a new alert rule, and open the **alert Rule Details** page
9. Among them, **the notification group** is selected as `FlashDuty` , the trigger condition is checked **and appears alert** and **returns to normal** . Click the **OK** button to save changes

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/3.avif" />

10. Return to the Flashduty console integration list page. If the latest event time is displayed, the configuration is successful and the event has been received
11. Complete

## Status Comparison

Mapping of Huawei Cloud Monitoring to Flashduty alert levels:

| CES  |  Flashduty  | Status |
| ---- | -------- | ---- |
| Emergency | Critical | Critical |
| Important | Critical | Critical |
| Minor | Warning  | Warning |
| Info | Info     | Information |