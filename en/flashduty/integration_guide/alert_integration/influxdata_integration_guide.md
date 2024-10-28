---
brief: Synchronize Influxdata alert events to Kuaimao Xingyun via webhook to automate noise reduction processing of alerts
---

# Influxdata Integration

Synchronize Influxdata alert events to Flashduty via webhook to automate noise reduction processing of alerts.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Influxdata** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Influxdata** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Influxdata

1. Log in to your InfluxData console and navigate to the Alerting > Alert Rules page
2. Click on the alert rule that requires event synchronization, proceed to the Alert Rule Builder page, and begin editing the rule
3. In the Alert Handlers section, choose Add Another Handler, select "post" as the type, and enter the integrated push address in the HTTP endpoint field, as illustrated in the figure below:

![influxdb-alert-rule](https://fcdoc.github.io/img/zh/zOee-vdaCq3Qhon3O8iOhQF-zC2yV8gKyGQo-mcDFKE.avif)

4. Click the Save Rule button to preserve your changes. Await the triggering of an event; if the latest event time appears in the integration list, this indicates that the configuration is successful and events are being received
5. Completed

## Status Comparison

The mapping relationship between InfluxData alert events and FlashDuty alert levels:

| Influxdata |  Flashduty  | state |
| ---------- | -------- | ---- |
| CRITICAL   | Critical | serious |
| WARNING    | Warning  | warn |
| INFO       | Info     | remind |