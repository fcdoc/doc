---
brief: Synchronize Influxdata alert events to Flashcat via webhook to achieve automated noise reduction of alert events
---

# Influxdata Integration

Synchronize Influxdata alert events to Flashduty via webhook to achieve automated noise reduction of alert events.

## In Flashduty
You can obtain an integration push URL through the following two methods; choose either one.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and go to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the Add Integration page
    3. Select the **Influxdata** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push URL**, copy it for later use, and you are done.

### Use Shared Integrations

Use Shared Integration

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => alert events**, and go to the integration selection page.
    2. Choose the **Influxdata** integration:
    - Select the **Influxdata** integration:
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Complete.

## In Influxdata

1. Log in to your Influxdata console and go to the Alerting > Alert Rules page
2. In Influxdata
3. In the Alert Handlers section, select Add Another Handler, select post as the type, and fill in the integrated push address for HTTP endpoint, as shown in the figure below:

![influxdb-alert-rule](https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/influxdata/1.avif)

4. Click the Save Rule button to save. Wait for the event to be triggered. If the latest event time is displayed in the integration list, it means the configuration is successful and the event is received
5. Complete

## Status Comparison

Complete

| Influxdata |  Flashduty  | Status Comparison |
| ---------- | -------- | ---- |
| CRITICAL   | Critical | Critical |
| WARNING    | Warning  | Warning |
| INFO       | Info     | Informational |