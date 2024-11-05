---
brief: Through the use of webhooks, synchronize Blue Whale Cloud monitoring events to Flashduty to achieve automated noise reduction of alert events
---

# Blue Whale Cloud Integration

Through the use of webhooks, synchronize Blue Whale Cloud monitoring events to Flashduty to achieve automated noise reduction of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Blue Whale Cloud** integration, click **Save** to generate a card.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and complete.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Choose the **Blue Whale Cloud** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **Push Address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Complete.

## In Blue Whale Cloud
The following content has been verified in __Blue Whale V6/7 versions__. V5 and earlier versions are no longer officially supported. It is recommended that you upgrade.

Blue Whale alert strategies can trigger __processing packages__. A processing package can integrate with surrounding systems to perform complex functions. We will first create a processing package, configure the FlashDuty callback address, and then edit the alert strategy to associate actions with the processing package, thereby achieving automatic pushing of alert changes to FlashDuty. The specific steps are as follows:

#### Step 1: Create a Processing Package

1. Log in to your Blue Whale Cloud desktop and enter the __Monitoring Platform__
2. Enter the __Configuration - Processing Packages__ page, click the __Add Package__ button to start creating a processing package
3. Fill in the name as `Send To FlashDuty`, select __HTTP Callback__ as the package type, choose `POST` as the push method, and fill in the integration push address (obtained after saving the integration), as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_bk/1.avif" />

4. Switch to the __Body__ tab, select `JSON` type, and copy the message body with the following information (when an alert is actually generated, Blue Whale will render the variable content as the Payload and push it to the target callback address):

```
{{alarm.callback_message}}
```

5. Save the package to complete the creation.

#### Step 2: Edit Alert Strategy

1. Enter the __Configuration - Alert Strategies__ page, select an existing strategy to edit, or create a new alert strategy
2. Scroll down to the __Alert Processing__ section, select `Send To FlashDuty` processing package in all three scenarios, and turn off the __Defense Rules__, as shown below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_bk/2.avif" />

3. Submit and save to complete
4. Repeat the above steps for other alerts you want to push to FlashDuty.

## Status Comparison

Blue Whale Cloud to Flashduty alert level mapping relationship:

| Blue Whale Cloud |  Flashduty  | Status |
| -------- | -------- | ---- |
| Fatal     | Critical | Severe |
| Warning     | Warning  | Alert |
| Notice     | Info     | Notice |