---
brief: Synchronize Alibaba Cloud ARMS monitoring alarm events with Kuaimao Nebula via webhook to automate noise reduction processing for alarm events
---

# Alibaba Cloud ARMS Integration

---

Synchronize Alibaba Cloud ARMS monitoring alarm events with Flashduty via webhook to automate noise reduction processing for alarm events.

## In Flashduty
---
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Alibaba Cloud ARMS** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Choose the **Alibaba Cloud ARMS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## The process is now complete
---
**Step 1: Configure Notification Objects**

<div id="!"><ol><li>Log in to your Alibaba Cloud console and select ARMS Monitoring product;</li><li> Enter **the Alarm Management -> Notification Object** page, select **Webhook Integration** , click the New Webhook button to start editing content;</li><li> As shown in the figure, set the object name, select `Post` , copy and write the integrated push address;</li><li> Add `Header` , enter `Content-Type` and `application/json` ;</li><li> Enter in the notification template: `$alertmanager_content` ;</li><li> Click the OK button to submit and save.</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/NBrkqKx5UuQfw74Jnxfh8E3Mms5vEUbYe8oSKAt-jIo.avif"><p> **Step 2: Configure notification policy**</p><ol><li> Enter **the Alarm Management -> Notification Policy** page, click New Notification Policy or select an existing policy to edit;</li><li> As shown in the figure below, on the **notification object** page, select the created **general Webhook** object;</li><li> Submit and save, waiting for the alarm to be triggered.</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/Bo_QVu-dAYs8mM-5bjKjO16cZvjnvMzV0R9eBWo0uGw.avif"></div>

## Status Comparison
---
<div class="md-block">

| Alibaba Cloud ARMS Monitoring |  Flashduty  | state |
| ------------ | -------- | ---- |
| P1     | Critical | serious |
| P2     | Warning  | warn |
| P3     | Warning     | warn |
| P4     | Info     | remind |

</div>