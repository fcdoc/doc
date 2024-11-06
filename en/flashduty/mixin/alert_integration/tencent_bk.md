---
brief: Synchronize Blue Whale Cloud monitoring events to FlashDuty via webhook to achieve automated noise reduction of alert events
---

# Blue Whale Cloud Integration

Synchronize Blue Whale Cloud monitoring events to FlashDuty via webhook to achieve automated noise reduction of alert events.

## In FlashDuty
You can obtain an integration push address through the following two methods, either of which can be chosen.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Blue Whale Cloud** integration, click **Save** to generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and you are done.

### Use Shared Integration

When you need to route the alert event based on the payload information to different collaboration spaces, this method is preferred.

|+| Expand

    1. Enter the FlashDuty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose the **Blue Whale Cloud** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Complete.

## In Blue Whale Cloud
The following content has been verified in __BlueWhale V6/7 version__. V5 and earlier versions are no longer officially supported, and it is recommended that you upgrade.

Blue Whale alert strategies can trigger __processing packages__, which can be integrated with surrounding systems to achieve complex functions. First, create a processing package, configure the FlashDuty callback address, then edit the alert strategy, and associate actions with the processing package to automatically push alert changes to FlashDuty. The specific steps are as follows:

#### Step 1: Create a Processing Package

1. Log in to your Blue Whale Cloud desktop and enter the __Monitoring Platform__
2. Enter the __Configuration - Processing Packages__ page, click the __Add Package__ button to start creating a processing package
3. Fill in the name as `Send To FlashDuty`, select __HTTP Callback__ as the package type, choose `POST` as the push method, and fill in the integration push address (obtained after saving the integration), as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_bk/1.avif" />

4. Switch to the __Body__ tab, select `JSON` as the type, and copy the message body with the following information (when an alert is actually generated, Blue Whale will render the variable content as the Payload and push it to the target callback address):

```
{{alarm.callback_message}}
```

5. Save the package to complete the creation.

#### Step 2: Edit Alert Policy

1. Enter the __Configuration - Alert Policy__ page, select an existing policy to edit, or create a new alert policy
2. Scroll down to the __Alert Processing__ section, select the `Send To FlashDuty` processing package in all three scenarios, and turn off the __Defense Rules__, as shown below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_bk/2.avif" />

3. Submit and save, and you are done
4. Repeat the above steps for other alerts you want to push to FlashDuty.

## Status Comparison

Blue Whale Cloud to FlashDuty alert level mapping relationship:

| Blue Whale Cloud |  Flashduty  | Status |
| -------- | -------- | ---- |
| Fatal     | Critical | Severe |
| Warning     | Warning  | Alert |
| Notice     | Info     | Notice |