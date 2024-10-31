---
brief: Synchronize Open-Falcon alert events with Flashduty via webhook to automate noise reduction for alert events
---

# Open Falcon Integration

By using a webhook, synchronize Open-Falcon alert events with Flashduty to automate noise reduction for alert events.
## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Falcon** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Falcon** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In Falcon
Select alert rules and configure the webhook for each one individually.

1. Login to your Falcon console, navigate to the "Templates" section, and access the alert rule template list page
2. Open any alert rule template and enter the callback address as the push address corresponding to the current integration
3. Click the "Save" button to preserve the alert rule
4. Repeat steps 2 and 3 for all alert rule templates that require event dispatching

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/open_falcon/1.avif" />
<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/open_falcon/2.avif" />

The same push address can also be configured for Expressions alert rules, similarly.

5. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
6. Finish

## Status Comparison

Open-Falcon to Flashduty alert level mapping relationship:

| Open-Falcon |  Flashduty  | state |
| ----------- | -------- | ---- |
| 0           | Critical | serious |
| 1           | Critical | serious |
| 2           | Warning  | warn |
| 3           | Warning  | warn |
| 4           | Info     | remind |
| 5           | Info     | remind |
| 6           | Info     | remind |