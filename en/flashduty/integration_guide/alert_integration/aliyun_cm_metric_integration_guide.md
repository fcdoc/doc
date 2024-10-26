---
brief: Synchronize Alibaba Cloud monitoring alarm events with Kuaimao Xinyun via webhook to automate noise reduction processing for alarm events
---

# Alibaba Cloud Monitoring CM Indicator Integration

Synchronize Alibaba Cloud monitoring alarm events with Flashduty via webhook to automate noise reduction processing for alarm events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Alibaba Cloud CM Indicator** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Alibaba Cloud CM Indicator** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Alibaba Cloud Monitoring
Choose either of the following two methods.

**Method 1: Configure by Rule**

<div id="!"><ol><li>Log in to your Alibaba Cloud console and select cloud monitoring products</li><li> Enter the Alarm Service -> Alarm Rules page, select a rule, and click the Modify button to start editing the rule content.</li><li> As shown in the figure, fill in the callback address under advanced settings as the integrated push address.</li><li> Click the Confirm button to submit the update</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/n5-x2vmAcZT9W1drSq44Cz74Tmi7RGcJCjr2w_n3Vls.avif"><ol start="5"><li> Repeat the above steps for all alert rules that expect synchronization events</li><li> Return to the integration list. If the latest event time is displayed, the configuration is successful and the event is received.</li><li> Finish</li></ol></div>

**Method 2: Configure by Contact**

<div id="!"><ol><li>Log in to your Alibaba Cloud console and select cloud monitoring products</li><li> Enter the alarm service -> Alarm contact page and choose to modify a contact.</li><li> As shown in the picture, fill in the integrated push address under Webhook</li><li> Click the Confirm button to submit the update</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/tJbcFhqxnFI_YxB1_byBDX_PODjjD-DNSFzTXoCKZFM.avif"><ol start="5"><li> Repeat the above steps for all contacts for which sync events are expected</li><li> Return to the integration list. If the latest event time is displayed, the configuration is successful and the event is received.</li><li> Finish</li></ol></div>

## Status Comparison
<div class="md-block">

| Alibaba Cloud Monitoring |  Flashduty  | state |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | serious |
| WARN         | Warning  | warn |
| INFO         | Info     | remind |
| NODATA       | Info     | remind |

</div>