---
brief: Synchronize Open-Falcon alert events to Flashduty via webhook to automate noise reduction processing
---

# Open Falcon Integration

---

Synchronize Open-Falcon alert events to Flashduty via webhook to automate noise reduction processing.
## In Flashduty
---
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
---
Select alert rules and configure webhooks one by one.

<div id="!"><ol><li>Log in to your Falcon console and select Templates to enter the alarm rule template list page</li><li> Open any alarm rule template and fill in the callback address as the push address corresponding to the current integration.</li><li> Click the Save button to save the alarm rules</li><li> Repeat steps 2 and 3 for all alert rule templates that want to send events</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/K8WaMj6aJuvE6gB_F7OMBexypNErGAVawIwmAlCr64Y.avif"><img alt="drawing" width="600" src="https://fcdoc.github.io/img/BO_Ai0Y13E8v87DBBXD5IOD16hvspuJGBLxdpAkq7uY.avif"><p> Similarly, for Expressions alarm rules), you can also configure the same push address.</p><ol start="5"><li> Return to the integration list. If the latest event time is displayed, the configuration is successful and the event is received.</li><li> Finish</li></ol></div>

## Status Comparison
---
<div class="md-block">

| Open-Falcon |  Flashduty  | state |
| ----------- | -------- | ---- |
| 0           | Critical | serious |
| 1           | Critical | serious |
| 2           | Warning  | warn |
| 3           | Warning  | warn |
| 4           | Info     | remind |
| 5           | Info     | remind |
| 6           | Info     | remind |

</div>