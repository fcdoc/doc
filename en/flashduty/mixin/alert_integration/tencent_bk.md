---
brief: Synchronize Blue Whale Cloud monitoring events with Flashduty via webhook to automate noise reduction for alarm events
---

# Blue Whale Zhiyun Integration

Synchronize Blue Whale Cloud monitoring events with Flashduty via webhook to automate noise reduction for alarm events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Blue Whale Zhiyun** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Blue Whale Zhiyun** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Blue Whale Zhiyun
The following content has been validated in the __BlueWhale V6/7 versions__, and official support for V5 and earlier versions has been discontinued. It is recommended that you upgrade.

BlueWhale's alert strategy can trigger a __Processing Package__, which can be integrated with peripheral systems to achieve complex functionalities. We will first create a processing package, configure the FlashDuty callback address, then edit the alert strategy to associate actions with this processing package, thereby enabling automatic alert notifications to be sent to FlashDuty. The detailed steps are as follows:

#### Step 1: Create a Processing Package

1. Log in to your Blue Whale Zhiyun desktop and navigate to the __Monitoring Platform__
2. Proceed to the __Configuration - Processing Package__ page, click the __Add Package__ button to begin creating a new processing package
3. Enter the name `Send To FlashDuty`, select __HTTP Callback__ as the package type, choose the `POST` method for notification, and fill in the integrated push address (which you will obtain after saving the integration), as illustrated below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_bk/1.avif" />

4. Switch to the __Body__ section, choose the `JSON` type, and copy the following information into the message body (when an actual alert is triggered, Blue Whale will render the variable content as Payload and send it to the target callback address):

```
{{alarm.callback_message}}
```

5. Save the package to complete the creation process.

#### Step 2: Edit Alarm Policy

1. Access the __Configuration - Alarm Policy__ page, and either edit an existing policy or create a new one
2. Scroll down to the __Alarm Handling__ section, choose the `Send To FlashDuty` processing package for all three scenarios, and disable the __Defense Rules__, as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_bk/2.avif" />

3. Submit the changes and save to complete
4. For other alerts that you wish to push to FlashDuty, repeat the above steps.

## Status Comparison

Mapping relationship between Blue Whale Zhiyun and FlashDuty alarm levels:

| Blue Whale Zhiyun |  Flashduty  | state |
| -------- | -------- | ---- |
| Fatal     | Critical | serious |
| Early Warning     | Warning  | warn |
| remind     | Info     | remind |