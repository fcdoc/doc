---
brief: Synchronize Huawei Cloud Monitoring CES alert events to Flashcat through webhooks to achieve automated noise reduction processing of alert events"
---

# Huawei Cloud Monitoring CES Integration

Synchronize Huawei Cloud Monitoring CES alert events to Flashduty through webhooks to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods; either one is sufficient.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Huawei Cloud Monitoring CES** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete.

### Use Shared Integration

When you need to route the alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Choose **Huawei Cloud Monitoring CES** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can directly set a default collaboration space as a fallback, and then adjust as needed.
    5. Complete.

## In Huawei Cloud Monitoring CES

1. Log in to your Huawei Cloud console, search for **cloud monitoring** products, and enter the corresponding product console
2. Enter the **alert-Alert Notification - Notification Object** page and click the **Create Notification Object** button
3. Select `HTTPS` for the protocol, fill in `flashduty` for the name, and fill in the integration address for the endpoint (fill in the integration name on the current page, and the address will be generated after saving)
4. Click the **OK** button to complete the notification object creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/1.avif" />

5. Enter the **alert-Alert Notification - Notification Group** page and click the **Create Notification Group** button
6. Fill in `FlashDuty` for the group name, and select `flashduty` created previously for the notification object
7. Click the **OK** button to complete the notification group creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/2.avif" />

Note that when creating a notification group, Huawei Cloud will initiate a request to Flashduty , verify the push address, and view the notification object list of the notification group. Only when the status of the notification object **is confirmed** , will it be pushed normally alert

8. Enter the **alert-Alert Rules** page, select an existing alert rule to edit, or create a new alert rule, and open the **alert Rule Details** page
9. Among them, **the notification group** is selected as `FlashDuty` , the trigger condition is checked **and appears alert** and **returns to normal** . Click the **OK** button to save changes

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/3.avif" />

10. Return to the Flashduty console integration list page. If the latest event time is displayed, the configuration is successful and the event has been received
11. Complete

## Status Comparison

Mapping relationship between Huawei Cloud Monitoring and Flashduty alert levels:

| CES  |  Flashduty  | Status |
| ---- | -------- | ---- |
| Urgent | Critical | Critical |
| Important | Critical | Severe |
| Minor | Warning  | Warning |
| Information | Info     | Notice |