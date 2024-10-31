---
brief: Synchronize monitoring events from Blue Whale Intelligent Cloud to Flashduty via webhook to automate noise reduction for alert events
---

# Blue Whale Zhiyun Integration

By using a webhook to synchronize monitoring events from Blue Whale Intelligent Cloud to Flashduty, automated noise reduction for alert events is achieved.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Blue Whale Zhiyun** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Blue Whale Zhiyun** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In Blue Whale Zhiyun
The following content has been validated in the __BlueWhale V6/7 versions__, and official support for V5 and earlier versions has been discontinued. It is recommended that you upgrade.

Blue Whale alert policies can trigger the __Processing Package__, which can be integrated with surrounding systems to perform complex functions. First, create a processing package, configure the FlashDuty callback address, then edit the alert policy to associate actions with the processing package, enabling automatic alert updates to be pushed to FlashDuty. Specific steps are as follows:

#### Step 1: Create a Processing Package

1. Log in to your Blue Whale Zhiyun desktop and navigate to the __Monitoring Platform__
2. Proceed to the __Configuration - Processing Package__ page, click the __Add Package__ button to begin creating a new processing package
3. Enter the name `Send To FlashDuty`, select __HTTP Callback__ as the package type, choose the `POST` method for notification, and fill in the integrated push address (which you will obtain after saving the integration), as illustrated below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_bk/1.avif" />

4. Switch to the __Body__ section, select the `JSON` type, copy the message body, and fill in the following information (when an alert is actually generated, Blue Whale will render variable content as the Payload and push it to the target callback address):

```
{{alarm.callback_message}}
```

5. Save the package to complete the creation process.

#### Step 2: Edit Alert Policy

1. Enter the __Configuration - Alert Policy__ page, select an existing policy to edit, or create a new alert policy;
2. Scroll down to the __Alert Processing__ section, choose the `Send To FlashDuty` processing package for all three scenarios, and disable the __Defense Rules__, as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_bk/2.avif" />

3. Submit the changes and save to complete
4. For other alerts you wish to push to FlashDuty, repeat the above steps.

## Status Comparison

Mapping relationship between Blue Whale Intelligent Cloud and Flashduty alert levels:

| Blue Whale Zhiyun |  Flashduty  | state |
| -------- | -------- | ---- |
| Fatal     | Critical | serious |
| Early Warning     | Warning  | warn |
| remind     | Info     | remind |