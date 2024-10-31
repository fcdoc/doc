---
brief: Synchronize Azure Monitor alert events to Kuaimao Xingyun via webhook to automate noise reduction processing for alert events
---

# Azure Monitor Integration

Synchronize Azure Monitor alert events to Flashduty via webhook to automate noise reduction processing for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Azure Monitor** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Azure Monitor** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## The process is now complete
**Step 1: Configure Webhook**

1. Log in to your Azure Portal and select the Monitor service;
2. Proceed to the `Alerts -> Action groups` page, click the Create button to begin editing;
3. As illustrated, under the `Actions` section, choose `Action type` as `Webhook`;
4. Enter a name, then copy and paste the integrated push address into the `URI` field, ensuring the general alert structure is `Enabled`;
5. Click the Create button to submit and save your changes.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/azure_monitor/1.avif" />

**Step 2: Configure Alert Rule**

1. Access the `Alerts -> Alert rules` page, click Create or select an existing policy to edit;
2. As shown in the figure below, in the `Actions` tab, select the Action group you have created;

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/azure_monitor/2.avif" />

3. Submit and save the settings, then wait for the alert to trigger.

## Status Comparison

Azure Monitor to Flashduty alert level mapping relationship:

| Azure Monitor  |  Flashduty  | state |
| ------------ | -------- | ---- |
| Sev0     | Critical | serious |
| Sev1     | Warning  | warn |
| Sev2     | Warning  | warn |
| Sev3     | Info     | remind |
| Sev4     | Info     | remind |