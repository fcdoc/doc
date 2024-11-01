---
brief: Synchronize Uptime Kuma alert events to Kuaimao Nebula via webhook to achieve automatic noise reduction of alert events
---

# Uptime Kuma Integration

Synchronize Uptime Kuma alert events to Flashduty via webhook to achieve automated noise reduction of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Uptime Kuma** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose **Uptime Kuma** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In Uptime Kuma
**Step 1: Set up notification channels**

1. Enter the `Settings -> Notifications` page, click Setup to edit, as shown in the figure below;
2. `Notification Type` select **FlashDuty ( Flashduty )** ;
3. `Integration Key` Copy and write the integration_key parameter value in the integrated push address;
4. `Severity` is the severity level; select as needed;
5. Submit and save

<img alt="drawing" width="400" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/uptime_kuma/1.avif" />

**Step 2: Configure monitoring items**

1. Click `Add New Monitor` or edit existing monitoring items to complete the monitoring configuration as needed;
2. As shown in the figure, in the `Notifications` section on the right, enable the notification method created in the previous step;
3. If you need to set labels, you can add `Tags`. Note that only tags with both Key/Value will be pushed to FlashDuty;
4. Submit and save, and wait for the alert to trigger.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/uptime_kuma/2.avif" />

## Status Comparison

Uptime Kuma to Flashduty alert level mapping:

| Uptime Kuma  |  Flashduty  | Status |
| ------------ | -------- | ---- |
| Critical     | Critical | Critical |
| Warning     | Warning  | Warning |
| Info     | Info     | Information |