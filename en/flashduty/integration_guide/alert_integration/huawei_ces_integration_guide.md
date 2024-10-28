---
brief: Synchronize Huawei Cloud Monitoring CES alarm events with Kuaimao Xinyun via webhook to automate noise reduction processing of alarm events"
---

# Huawei Cloud Monitoring CES Integration

Synchronize Huawei Cloud Monitoring CES alarm events with Flashduty via webhook to automate noise reduction processing of alarm events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Huawei Cloud Monitoring CES** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Huawei Cloud Monitoring CES** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Huawei Cloud Monitoring CES

1. Log in to your Huawei Cloud console, search for **cloud monitoring** products, and enter the corresponding product console
2. Enter **the Alarm - AlarmNotification - Notification Object** page and click the **Create Notification Object** button
3. Choose the `HTTPS` protocol, enter `flashduty` as the name, and fill in the integrated address (enter the integration name on the current page, and an address will be generated upon saving)
4. Click the **OK** button to complete the notification object creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/tgH1UDKys17VJAMsXbifQp-qYjXBKKOpusNdIiZJYbE.avif" />

5. Enter **the Alarm - AlarmNotification - NotificationGroup** page and click the **Create Notification Group** button
6. Enter `FlashDuty` as the group name and select the previously created `flashduty` as the notification object
7. Click the **OK** button to complete the notification group creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/un2_U8J_auion76Ks570Tt6OQj1_akTliX0oX-a3QUQ.avif" />

Note that when creating a notification group, Huawei Cloud will initiate a request to Flashduty verify the push address, and view the notification object list of the notification group. Only when the status of the notification object **is confirmed** , the alarm will be pushed normally.

8. Enter **the Alarm - Alarm Rules** page, select an existing alarm rule to edit, or create a new alarm rule, and open **the Alarm Rule Details** page.
9. Among them, **the notification group** is selected as `FlashDuty` , and the trigger condition is checked **as alarm** and **return to normal** . Click the **OK** button to save changes

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/XNjNCWbTfuFnsmavwkCyhMtG9DJNykfjqsIQiLG4Sj4.avif" />

10. Return to the Flashduty console integration list page. If the latest event time is displayed, it indicates that the configuration is successful and events are being received
11. Completion

## Status Comparison

Huawei Cloud monitoring to Flashduty alarm level mapping relationship:

| CES  |  Flashduty  | state |
| ---- | -------- | ---- |
| Urgent | Critical | serious |
| Important | Critical | serious |
| Minor | Warning  | warn |
| Hint | Info     | remind |