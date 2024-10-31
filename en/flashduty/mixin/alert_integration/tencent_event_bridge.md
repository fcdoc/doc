---
brief: Synchronize Tencent Cloud Event Bus EB events to Kuaimao Nebula via webhook to achieve automated noise reduction for alert events
---

# Tencent Cloud EventBridge

Synchronize Tencent Cloud Event Bus EB events to Flashduty via webhook to achieve automated noise reduction for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Tencent Cloud EventBridge** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Tencent Cloud EventBridge** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In Tencent Cloud EventBridge

1. Log in to your Tencent Cloud console and select the Event Bus product
2. Navigate to the Event Rules page, click the "Create" button to begin editing the rules
3. Enter the name "FlashDuty" as shown in the following image:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_event_bridge/1.avif" />

4. In the event matching section, you can choose specific events using the form mode, or customize the following JSON content to match all events:

```
{
"source": [
{
"suffix": ".cloud.tencent"
}
]
}
```

The illustration is as follows:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_event_bridge/2.avif" />

5. Next, configure the event targets by selecting "Message Push", "Universal Notification Template", "English", "Interface Callback", and "Custom Webhook". Fill in the webhook address with the integrated push address

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_event_bridge/3.avif" />

6. Click the "Save" button, go back to the Event Sets page, select an event set, click "Send Event" to perform a test

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_event_bridge/4.avif" />

7. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
8. Finish

## Status Comparison

All events in the Tencent Cloud event bus correspond to Flashduty "warning" level alerts.