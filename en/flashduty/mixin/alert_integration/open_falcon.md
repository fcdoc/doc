---
brief: Synchronize Open-Falcon alert events to Flashduty via webhook to achieve automated noise reduction processing of alert events
---

# Open Falcon Integration

Synchronize Open-Falcon alert events to Flashduty via webhook to achieve automated noise reduction processing of alert events.
## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Falcon** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Falcon** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Falcon
Select alert rules and configure webhooks one by one.

1. Log in to your Falcon console, select Templates, and enter the alert rule template list page
2. Open any alert rule template and set the callback address to the push address corresponding to the current integration
3. Click the Save button to save the alert rule
4. Repeat steps 2 and 3 for all alert rule templates that need to send events

<img alt="drawing" width="600" src="https://fcimg.3ti.site/zh/flashduty/mixin/alert_integration/open_falcon/1.avif" />
<img alt="drawing" width="600" src="https://fcimg.3ti.site/zh/flashduty/mixin/alert_integration/open_falcon/2.avif" />

Similarly, the same push address can be configured for Expressions alert rules.

5. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
6. Finish

## Status Comparison

Open-Falcon to Flashduty alert level mapping:

| Open-Falcon |  Flashduty  | Status |
| ----------- | -------- | ---- |
| 0           | Critical | High |
| 1           | Critical | High |
| 2           | Warning  | Average |
| 3           | Warning  | Average |
| 4           | Info     | Disaster |
| 5           | Info     | Disaster |
| 6           | Info     | Disaster |