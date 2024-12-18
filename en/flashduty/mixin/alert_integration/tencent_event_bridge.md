---
brief: Synchronize Tencent Cloud event bus EB events to Flashcat through webhook to realize automatic noise reduction processing of alert events
---

# Tencent Cloud EventBridge

Synchronize Tencent Cloud event bus EB events to Flashduty through webhook to realize automatic noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Tencent Cloud EventBridge** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Tencent Cloud EventBridge** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Tencent Cloud EventBridge

1. Log in to your Tencent Cloud console and select the event bus product
2. Enter the Event Rules page, click the New button to start editing rules
3. Fill in the name as FlashDuty, as shown below:

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/tencent_event_bridge/1.avif" />

4. In the event matching section, you can select specific events through the form mode, or you can customize the following JSON content to match all events:

```
{
"source": [
{
"suffix": ".cloud.tencent"
}
]
}
```

The diagram is as follows:

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/tencent_event_bridge/2.avif" />

5. Next, configure the event target. Select "Message Push", "Universal Notification Template", "English", "Interface Callback", and "Custom Webhook" respectively, and fill in the integrated push address for the webhook address

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/tencent_event_bridge/3.avif" />

6. Click the Save button, return to the Event Set page, select an event set, click Send Event, and test

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/tencent_event_bridge/4.avif" />

7. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
8. Finish

## Status Comparison

All events in the Tencent Cloud event bus correspond to Flashduty "warning" level alerts.