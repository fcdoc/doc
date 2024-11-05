---
brief: Synchronize Uptime Kuma alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events
---

# Uptime Kuma Integration

Synchronize Uptime Kuma alert events to Flashduty via webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods, either one will work.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and go to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Uptime Kuma** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and you are done.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose the **Uptime Kuma** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **Push Address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed later.
    5. Finish.

## In Uptime Kuma
**Step 1: Set up notification channels**

1. Enter the `Settings -> Notifications` page, click Setup to edit, as shown in the figure below;
2. `Notification Type` select **FlashDuty ( Flashduty )** ;
3. `Integration Key` Copy and write the integration_key parameter value in the integrated push address;
4. `Severity` is the severity level, select as needed;
5. Submit and save

<img alt="drawing" width="400" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/uptime_kuma/1.avif" />

**Step 2: Configure monitoring items**

1. Click `Add New Monitor` or edit an existing monitor to complete the monitoring configuration as needed;
2. As shown in the figure, enable the notification method created in the previous step in the `Notifications` section on the right;
3. If you need to set labels, you can add `Tags`. Note that only tags with both Key/Value pairs will be pushed to FlashDuty;
4. Submit and save, and wait for the alert to trigger.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/uptime_kuma/2.avif" />

## Status Comparison

Uptime Kuma to Flashduty alert level mapping:

| Uptime Kuma  |  Flashduty  | State |
| ------------ | -------- | ---- |
| Critical     | Critical | Critical |
| Warning     | Warning  | Warning |
| Info     | Info     | Info |