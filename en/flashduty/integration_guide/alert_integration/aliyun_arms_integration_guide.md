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

<details><summary>Expand</summary><ol><li><p> Enter the Flashduty console, select **the collaboration space** , and enter the details page of a certain space</p></li><li><p> Select **Integration Data** tab and click **Add an Integration** to enter the Add Integration page.</p></li><li><p> Select **Alibaba Cloud ARMS** Integration, click **Save** , and generate a card.</p></li><li><p> Click on the generated card to view **the push address** , copy it for later use, and complete.</p></li></ol></details>

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

<details><summary>Expand</summary><ol><li> Enter the Flashduty console, select **Integration Center = > event** , and enter the integration selection page.</li><li> Select **Alibaba Cloud ARMS** integration:</li></ol><ul><li> **Integration Name** : Define a name for the current integration.</li></ul><ol start="3"><li> After clicking **Save** , copy the newly generated **push address** of the current page for later use.</li><li> Click **Create Route** to configure routing rules for the integration. You can match different alarms to different collaboration spaces based on conditions, or you can directly set the default collaboration space as a fallback, and then adjust it as needed.</li><li> Finish.</li></ol></details>


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