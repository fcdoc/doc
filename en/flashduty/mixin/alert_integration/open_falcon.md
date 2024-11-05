---
brief: Synchronize Open-Falcon alert events to Flashduty via webhook to achieve automated noise reduction of alert events
---

# Open Falcon Integration

Synchronize Open-Falcon alert events to Flashduty via webhook to achieve automated noise reduction of alert events.
## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Falcon** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and complete.

### Use Shared Integrations

Use Shared Integration

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => alert events**, and go to the integration selection page.
    2. Choose the **Falcon** integration:
    - Select the **Falcon** integration:
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Finish.

## In Falcon
Complete.

1. In Falcon
2. Select alert rules and configure webhooks one by one
3. Click the Save button to save the alert rule
4. Open any alert rule template and set the callback address to the push address corresponding to the current integration

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/open_falcon/1.avif" />
<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/open_falcon/2.avif" />

Similarly, you can configure the same push address for the Expressions alert rules.

5. Repeat steps 2 and 3 for all alert rule templates that need to send events
6. Finish

## Status Comparison

Complete

| Open-Falcon |  Flashduty  | Status Comparison |
| ----------- | -------- | ---- |
| 0           | Critical | Serious |
| 1           | Critical | State | Flashduty | |
| 2           | Warning  | --- | --- | |
| 3           | Warning  | Critical | Critical | |
| 4           | Info     | Major | Major | |
| 5           | Info     | Minor | Minor | |
| 6           | Info     | Info | Info | |