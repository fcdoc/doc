---
brief: Synchronize Uptime Kuma alert events to Kuaimao Xingyun via webhook to automate noise reduction processing of alerts
---

# Uptime Kuma Integration

Synchronize Uptime Kuma alert events to Flashduty via webhook to automate noise reduction processing of alerts.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Uptime Kunma** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Uptime Kunma** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## The process is now complete
**Step 1: Set up notification channels**

1. Access the `Settings -> Notifications` page, click on "Setup" to edit, as illustrated in the figure below;
2. `Notification Type` select **FlashDuty ( Flashduty )** ;
3. Copy and paste the `Integration Key` from the integrated push address into the corresponding field;
4. Choose the appropriate `Severity` as needed;
5. Submit the changes to save

<img alt="drawing" width="400" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/uptime_kuma/1.avif" />

**Step 2: Configure monitoring items**

1. Click on `Add New Monitor` or edit an existing monitor to customize the monitoring settings as required;
2. As illustrated, enable the notification method created in the previous step in the `Notifications` section on the right;
3. If you need to set a label, you can add `Tags` Note that only labels that also exist Key/Value will be pushed to FlashDuty ;
4. Submit and save the settings, then wait for an alarm to trigger.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/uptime_kuma/2.avif" />

## Status Comparison

The mapping relationship between Uptime Kuma and FlashDuty alert levels:

| Uptime Kuma  |  Flashduty  | state |
| ------------ | -------- | ---- |
| Critical     | Critical | serious |
| Warning     | Warning  | warn |
| Info     | Info     | remind |