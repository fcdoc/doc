---
brief: Synchronize Influxdata alert events to Kuaimao Xingyun via webhook to automate noise reduction processing of alerts
---

# Influxdata Integration

---

Synchronize Influxdata alert events to Flashduty via webhook to automate noise reduction processing of alerts.

## In Flashduty
---
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Influxdata** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Influxdata** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Influxdata
---
<div id="!"><ol><li>Log in to your Influxdata console and go to the Alerting > Alert Rules page</li><li> Click on the alarm rule that needs to be synchronized, enter the Alert Rule Builder page, and start editing the rules.</li><li> Alert Handlers Part, Select Add Another Handler , select post as type, HTTP endpoint fill in the integrated push address, as shown in the figure below:</li></ol><p>![influxdb-alert-rule](/0)</p><ol start="4"><li> Save Rule the button to save. Wait for the event to be triggered. If the latest event time is displayed in the integration list, it means the configuration is successful and the event is received.</li><li> Finish</li></ol><h2> Status comparison</h2><hr><div id="!"><p> Influxdata relationship between alarm Flashduty and alarm levels:</p>

| Influxdata |  Flashduty  | state |
| ---------- | -------- | ---- |
| CRITICAL   | Critical | serious |
| WARNING    | Warning  | warn |
| INFO       | Info     | remind |

</div>