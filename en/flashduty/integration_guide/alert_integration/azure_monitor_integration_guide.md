---
brief: Synchronize Azure Monitor alert events to Kuaimao Xingyun via webhook to automate noise reduction processing of alerts
---

# Azure Monitor Integration

Synchronize Azure Monitor alert events to Flashduty via webhook to automate noise reduction processing of alerts.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Azure Monitor** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Azure Monitor** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## The process is now complete
**Step 1: Configure Webhook**

<div id="!"><ol><li>Log in to your Azure portal and select Monitor ;</li><li> Enter page `Alerts -> Action groups` , click the Create button to start editing;</li><li> As shown in the figure, option `Actions` chooses `Action type` as `Webhook` ;</li><li> Fill in the name, copy and write the `URI` parts into the integrated push address, pay attention to the `Enable` general alert structure;</li><li> Click the Create button to submit and save.</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/4gzLFt9GChD5e3f_GYsfB0c4VwgFWvEtl4oBrNyvKzs.avif"><p> **Step 2: Configuration Alert rule**</p><ol><li> Enter page `Alerts -> Alert rules` , click Create or select an existing policy to edit;</li><li> As shown in the figure below, on page `Actions` , select the created one Action group ;</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/b-vF-yP22lZacuG_Q9t4J7xx0uPFYqYcILv3Fc3vI3k.avif"><ol start="3"><li> Submit and save, waiting for the alarm to be triggered.</li></ol></div>

## Status Comparison
<div class="md-block">

| Azure Monitor  |  Flashduty  | state |
| ------------ | -------- | ---- |
| Sev0     | Critical | serious |
| Sev1     | Warning  | warn |
| Sev2     | Warning  | warn |
| Sev3     | Info     | remind |
| Sev4     | Info     | remind |

</div>