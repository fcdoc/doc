---
brief: Synchronize Huawei Cloud Monitoring CES alert events with Kuaimao Nebula via webhook to automate noise reduction processing for alert events"
---

# Huawei Cloud Monitoring CES Integration

Synchronize Huawei Cloud Monitoring CES alert events with Flashduty via webhook to automate noise reduction processing for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Huawei Cloud Monitoring CES** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Huawei Cloud Monitoring CES** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In Huawei Cloud Monitoring CES

1. Log in to your Huawei Cloud console, search for **cloud monitoring** products, and enter the corresponding product console
2. Enter the **alert-Alert Notification - Notification Object** page and click the **Create Notification Object** button
3. Choose the `HTTPS` protocol, enter `flashduty` as the name, and fill in the integrated address (enter the integration name on the current page, and an address will be generated upon saving)
4. Click the **OK** button to complete the notification object creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/1.avif" />

5. Enter the **alert-Alert Notification - Notification Group** page and click the **Create Notification Group** button
6. Enter `FlashDuty` as the group name and select the previously created `flashduty` as the notification object
7. Click the **OK** button to complete the notification group creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/2.avif" />

Note that when creating a notification group, Huawei Cloud will initiate a request to Flashduty , verify the push address, and view the notification object list of the notification group. Only when the status of the notification object **is confirmed** , will it be pushed normally alert

8. Enter the **alert-Alert Rules** page, select an existing alert rule to edit, or create a new alert rule, and open the **alert Rule Details** page
9. Among them, **the notification group** is selected as `FlashDuty` , the trigger condition is checked **and appears alert** and **returns to normal** . Click the **OK** button to save changes

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/huawei_ces/3.avif" />

10. Return to the Flashduty console integration list page. If the latest event time is displayed, it indicates that the configuration is successful and events are being received
11. Finish

## Status Comparison

Mapping relationship between Huawei Cloud Monitoring and Flashduty alert levels:

| CES  |  Flashduty  | state |
| ---- | -------- | ---- |
| Urgent | Critical | serious |
| Important | Critical | serious |
| Minor | Warning  | warn |
| Hint | Info     | remind |