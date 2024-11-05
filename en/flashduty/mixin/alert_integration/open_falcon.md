---
brief: Synchronize Open-Falcon alert events to Flashduty via webhook to achieve automated noise reduction of alert events
---

# Open Falcon Integration

Synchronize Open-Falcon alert events to Flashduty via webhook to achieve automated noise reduction of alert events.
## In Flashduty
You can obtain an integration push address through the following two methods; choose either one.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the Add Integration page
    3. Select the **Falcon** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and complete.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and navigate to the integration selection page.
    2. Choose the **Falcon** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **Push Address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In Falcon
Select alert rules and configure webhooks one by one.

1. Log in to your Falcon console, select Templates, and enter the alert rule template list page
2. Open any alert rule template and set the callback address to the push address corresponding to the current integration
3. Click the Save button to save the alert rule
4. Repeat steps 2 and 3 for all alert rule templates that need to send events

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/open_falcon/1.avif" />
<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/open_falcon/2.avif" />

Similarly, the same push address can be configured for Expressions alert rules.

5. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
6. Complete

## Status Comparison

Open-Falcon to Flashduty alert level mapping:

| Open-Falcon |  Flashduty  | Status |
| ----------- | -------- | ---- |
| 0           | Critical | Critical |
| 1           | Critical | Critical |
| 2           | Warning  | Warning |
| 3           | Warning  | Warning |
| 4           | Info     | Information |
| 5           | Info     | Information |
| 6           | Info     | Information |