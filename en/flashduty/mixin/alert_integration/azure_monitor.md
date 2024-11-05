---
brief: Synchronize Azure Monitor alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events
---

# Azure Monitor Integration

Synchronize Azure Monitor alert events to Flashduty via webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods; choose either one.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Azure Monitor** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information of the alert event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Choose the **Azure Monitor** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Complete.

## In Azure Monitor
**Step 1: Configure Webhook**

1. Log in to your Azure portal and select the Monitor product
2. Enter page `Alerts -> Action groups` , click the Create button to start editing;
3. In the `Actions` section, select `Action Type` as `Webhook`
4. Fill in the name, copy the `URI` and paste it into the integration's push address, and ensure to `Enable` the common alert structure
5. Click the Create button to submit and save.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/azure_monitor/1.avif" />

**Step 2: Configure Alert Rule**

1. Enter the `Alerts -> Alert rules` page, click Create or select an existing strategy to edit;
2. As shown in the figure, in the `Actions` section, select the created Action Group

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/azure_monitor/2.avif" />

3. Submit and save, and wait for the alert to trigger.

## Status Comparison

Azure Monitor to Flashduty alert level mapping:

| Azure Monitor  |  Flashduty  | Status |
| ------------ | -------- | ---- |
| Sev0     | Critical | Critical |
| Sev1     | Warning  | Warning |
| Sev2     | Warning  | Warning |
| Sev3     | Info     | Information |
| Sev4     | Info     | Information |