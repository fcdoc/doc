---
brief: Synchronize Azure Monitor alert events to Flashcat through a webhook to achieve automatic noise reduction processing of alert events
---

# Azure Monitor Integration

Synchronize Azure Monitor alert events to Flashduty through a webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods; choose either one.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the Add Integration page
    3. Select the **Azure Monitor** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and complete.

### Use Shared Integrations

Use Shared Integration

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Select the **Azure Monitor** integration:
    - Choose the **Azure Monitor** integration:
    3. After clicking **Save**, copy the newly generated **Push URL** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed later.
    5. Finish.

## Complete
**Step 1: Configure Webhook**

1. In Azure Monitor
2. Enter page `Alerts -> Action groups` , click the Create button to start editing;
3. As shown in the figure, in the `Actions` section, select `Action type` as `Webhook`;
4. Fill in the name, and copy the `URI` part to the integration's push address. Make sure to `Enable` the generic alert structure;
5. Click the Create button to submit and save.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/azure_monitor/1.avif" />

**Step 2: Configure Alert Rule**

1. Enter the `Alerts -> Alert rules` page, click Create or select an existing strategy to edit;
2. As shown in the figure, on the `Actions` page, select the created Action group

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/azure_monitor/2.avif" />

3. Submit and save, and wait for the alert to trigger.

## Status Comparison

Submit and save, and wait for the alert to trigger

| Azure Monitor  |  Flashduty  | Status Comparison |
| ------------ | -------- | ---- |
| Sev0     | Critical | Severe |
| Sev1     | Warning  | Warning |
| Sev2     | Warning  | Warning |
| Sev3     | Info     | Information |
| Sev4     | Info     | Information |