---
brief: Synchronize Grafana alert events with Kuaimao Nebula via webhook to automate noise reduction processing for alert events.
---

# Grafana Integration

Synchronize Grafana alert events with Flashduty via webhook to automate noise reduction processing for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Grafana** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Grafana** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## Within Grafana
Grafana versions V4 to V8 have the Legacy Alerting feature enabled by default, while V9 and later versions have the Grafana Alerting feature enabled by default. For the differentiation of features and activation methods, please refer to [the official documentation](https://grafana.com/docs/grafana/v8.4/alerting/unified-alerting/opt-in/#opt-in-to-grafana-alerting). Please integrate according to the version you have deployed, following the steps below.

### Legacy Alerting

1. Open your Grafana console and navigate to Alerting > Notification channels
2. Click Add Channel to launch the configuration pop-up page for the channel
3. Enter a name, choose webhook as the Type, fill in the integrated push address in the Url field, and select POST for the Method, as shown in the figure below:

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/grafana/1.avif" alt="drawing" width="600"/>

4. Save, return to the integration list, and wait for an alert to be generated. If the latest event time is displayed, it indicates successful configuration and event reception
5. Finish

### Grafana Alerting

1. Open your Grafana console and go to Alerting > Contact points
2. Click New contact point to open the configuration pop-up page
3. Enter a name, choose webhook as the Type, fill in the integrated push address in the Url field, and select POST for the Method, as shown in the figure below:

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/grafana/2.avif" alt="drawing" width="600"/>

4. Proceed to the Notification policies page, edit or add a policy as needed, and select the contact point created in the previous step as the notification channel, as depicted in the following figure:

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/grafana/3.avif" alt="drawing" width="600"/>

5. Save, return to the integration list, and wait for an alert to be generated. If the latest event time is displayed, it indicates successful configuration and event reception
6. The default alert level is "warning." If customization is required, configure the "severity" label on the alert details page (refer to the enumeration in the status comparison below). The specific steps are shown in the figure below:

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/grafana/4.avif" alt="drawing" width="600"/>

7. Finish

## Status Comparison

Legacy Alerting to Flashduty alert level mapping relationship:

| Legacy Alerting |  Flashduty  | state |
| --------------- | -------- | ---- |
| alerting        | Warning  | warn |
| no_data         | Critical | serious |
| ok              | Ok       | Recovered |

Grafana Alerting to Flashduty alert level mapping relationship:

The system sequentially extracts the `severity`, `priority`, and `level` from the alert event tags, using the corresponding values as the alert levels within Prometheus itself. In the event that these values are not extracted, the system defaults to setting Prometheus' alert level to `warning`.

| Grafana Alerting |  Flashduty  | state |
| ---------------- | -------- | ---- |
| critical         | Critical | serious |
| warning          | Warning  | warn |
| warn             | Warning  | warn |
| info             | Info     | remind |
| acknowledged     | Info     | remind |
| unknown          | Info     | remind |
| unk              | Info     | remind |
| ok               | Ok       | Recovered |