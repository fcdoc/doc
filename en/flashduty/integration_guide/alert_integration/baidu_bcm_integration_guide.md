---
brief: Synchronize Baidu Cloud BCM alarm events with Flashduty via webhook to automate noise reduction processing for alarm events
---

# Baidu Cloud BCM Monitoring Integration

Synchronize Baidu Cloud BCM alarm events with Flashduty via webhook to automate noise reduction processing for alarm events.
## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Baidu Cloud Monitoring BCM** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Baidu Cloud Monitoring BCM** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Baidu Cloud Monitoring BCM
<div id="!"><ol><li>Log in to your Baidu Cloud console, retrieve **cloud monitoring** products, and enter the corresponding console</li><li> Baidu Cloud provides a variety of ways to configure alarm callbacks. For details, please refer to [the official documentation](/0) . The following only demonstrates **alarm management - Alarm policy** entry configuration method</li><li> Enter **the Alarm Management - Alarm Policy** page and choose to edit an existing alarm policy or create a new one.</li><li> In the **callback address** column of the alarm policy, fill in the integrated push address (fill in the integration name on the current page, and the address can be generated after saving)</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/YNQKnmj1FuILvVEkkDliHTFfRCgRUxWDDNsctXsp12Q.avif"><ol start="5"><li> Finish</li></ol></div>

## Status Comparison
<div class="md-block">

| BCM  |  Flashduty  | state |
| ---- | -------- | ---- |
| serious | Critical | serious |
| Important | Critical | serious |
| warn | Warning  | warn |
| Notification | Info     | remind |

</div>