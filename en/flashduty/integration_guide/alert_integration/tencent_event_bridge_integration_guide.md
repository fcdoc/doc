---
brief: Synchronize Tencent Cloud Event Bus EB events with Kuaimao Nebula via webhook to automate noise reduction processing for alarm events
---

# Tencent Cloud EventBridge

Synchronize Tencent Cloud Event Bus EB events with Flashduty via webhook to automate noise reduction processing for alarm events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Tencent Cloud EventBridge** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Tencent Cloud EventBridge** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Tencent Cloud EventBridge
<div id="!"><ol><li>Log in to your Tencent Cloud console and select the event bus product</li><li> Enter the event rules page, click the New button to start editing rules</li><li> Fill in the name as FlashDuty as shown in the figure below:</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/3xdEpRnxM31nV5t8REeGxRbhRhwfQpwFooG7q6L6JhA.avif"><ol start="4"><li> In the event matching part, you can select specific events through the form mode, or you can customize the following JSON content to match all events:</li></ol><pre> `{
"source": [
{
"suffix": ".cloud.tencent"
}
]
}
`</pre><p> The diagram is as follows:</p><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/pRBjDtOVtl4b6YmKAVF8EJ9RoOAIPGgt4m2hRWWaMzk.avif"><ol start="5"><li> Next, configure the event target, select "Message Push", "Universal Notification Template", "English", "Interface Callback" and "Custom webhook " respectively, webhook fill in the integrated push address for the address</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/ha120gZ2uvDk4brSB4_OqEoYRM751-TesVi4cmOYQ-0.avif"><ol start="6"><li> Click the Save button, return to the event set page, select an event set, click Send event, and test</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/gh3xRQXvARrh7BWDz_le-dLR-0TMS4vblvXZbSu7NkM.avif"><ol start="7"><li> Return to the integration list. If the latest event time is displayed, the configuration is successful and the event is received.</li><li> Finish</li></ol></div>

## Status Comparison
<div id="!"><p>All events in the Tencent Cloud event bus correspond to "warning ( warning )" level alarms Flashduty</p></div>