---
brief: Synchronize Influxdata alert events to Flashcat through webhooks to achieve automated noise reduction processing of alert events
---

# Influxdata Integration

Synchronize Influxdata alert events to Flashduty through webhooks to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Influxdata** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Influxdata** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Influxdata

1. Log in to your Influxdata console and go to the Alerting > Alert Rules page
2. Click the alert rule that needs to synchronize events, enter the Alert Rule Builder page, and start editing the rules
3. In the Alert Handlers section, select Add Another Handler, select post as the type, and fill in the integrated push address for HTTP endpoint, as shown in the figure below:

![influxdb-alert-rule](https://fcimg.i18n.site/zh/flashduty/mixin/alert_integration/influxdata/1.avif)

4. Click the Save Rule button to save. Wait for the event to be triggered. If the latest event time is displayed in the integration list, it means the configuration is successful and the event is received
5. Finish

## Status Comparison

Mapping relationship between Influxdata alert events and Flashduty alert levels:

| Influxdata |  Flashduty  | Status |
| ---------- | -------- | ---- |
| CRITICAL   | Critical | High |
| WARNING    | Warning  | Average |
| INFO       | Info     | Disaster |