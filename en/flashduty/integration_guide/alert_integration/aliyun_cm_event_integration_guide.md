---
brief: Synchronize Alibaba Cloud Monitoring Event Center alerts to Kuaimao Xingyun via webhook to automate noise reduction processing for alert events
---

# Alibaba Cloud Monitoring CM Event Integration

Synchronize Alibaba Cloud Monitoring Event Center alerts to Flashduty via webhook to automate noise reduction processing for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Alibaba Cloud CM Event** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Alibaba Cloud CM Event** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## Configure Alibaba Cloud Monitoring CM Events
**Step 1: Add a Push Channel**

<div id="!"><ol><li>Log in to your Alibaba Cloud console and select cloud monitoring products</li><li> Enter **the Event Center -> Event Subscription** page, switch to **the Push Channel** tab, click the Create Push Channel button, and start editing content</li><li> As shown in the figure, select **POST** **for the request method** , and fill in the integrated push address **for the address.**</li><li> Click the Confirm button to submit the update</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/seOk8MgkEvjJCNzrDUEr8i0bnprzJyM5bb7-V_I3lqs.avif"></div>

**Step 2: Add a Subscription Policy**

<div id="!"><ol><li>Log in to your Alibaba Cloud console and select cloud monitoring products</li><li> Enter **the Event Center -> Event Subscription** page, switch to **the Subscription Strategy** tab, click the Create Subscription Strategy button, and start editing content</li><li> Fill in the subscription name, select the event type and scope, and configure the push channel at the bottom to be the Flashduty created previously.</li><li> Click the Confirm button to submit the update</li><li> The figure below shows the subscription results of two types of events: threshold and system.</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/yyNAM2bu8Z8ppbnnUX_irJpODrosO8QqejhB8egEojw.avif"></div>

## Status Comparison
<div class="md-block">

| Alibaba Cloud Monitoring |  Flashduty  | state |
| ------------ | -------- | ---- |
| CRITICAL     | Critical | serious |
| WARNING      | Warning  | warn |
| INFO         | Info     | remind |

</div>