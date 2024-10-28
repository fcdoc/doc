---
brief: Synchronize Open-Falcon alert events to Flashduty via webhook to automate noise reduction processing
---

# Open Falcon Integration

Synchronize Open-Falcon alert events to Flashduty via webhook to automate noise reduction processing.
## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Falcon** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Falcon** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Falcon
Select alert rules and configure webhooks one by one.

1. Log in to your Falcon console, select "Templates," and navigate to the alert rule template list page
2. Open any alert rule template and enter the callback address as the push address corresponding to the current integration
3. Click the "Save" button to preserve the alert rule settings
4. Repeat steps 2 and 3 for each alert rule template intended to send events

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/K8WaMj6aJuvE6gB_F7OMBexypNErGAVawIwmAlCr64Y.avif" />
<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/BO_Ai0Y13E8v87DBBXD5IOD16hvspuJGBLxdpAkq7uY.avif" />

The same push address can also be configured for "Expressions" alert rules.

5. Return to the integration list; if the latest event time is displayed, this indicates a successful configuration and event reception
6. Completion

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