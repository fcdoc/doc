---
brief: Synchronize Grafana alert events to Flashcat through webhooks to achieve automated noise reduction of alert events.
---

# Grafana Integration

Synchronize Grafana alert events to Flashduty through webhooks to achieve automated noise reduction of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Grafana** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Grafana** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Grafana
Grafana V4~V8 versions have the Legacy Alerting feature enabled by default, while V9 and later versions have the Grafana Alerting feature enabled by default. For details on the differences and activation methods, please refer to the [official documentation](https://grafana.com/docs/grafana/v8.4/alerting/unified-alerting/opt-in/#opt-in-to-grafana-alerting). Please integrate according to the version you have deployed. The steps are as follows.

### Legacy Alerting

1. Open your Grafana Console and select Alerting > Notification channels
2. Click Add Channel to open the Channel configuration pop-up page
3. Configure the name, select webhook for Type, fill in the integrated push address for Url, and select POST for Method, as shown in the figure below:

<img src="https://fcimg.3ti.site/zh/flashduty/mixin/alert_integration/grafana/1.avif" alt="drawing" width="600"/>

4. Save, return to the integration list, and wait for an alert to be generated. If the latest event time is displayed, the configuration is successful and the event has been received
5. Finish

### Grafana Alerting

1. Open your Grafana Console and select Alerting > Contact points
2. Click New contact point to open the configuration pop-up page
3. Configure the name, select webhook for Type, fill in the integrated push address for Url, and select POST for Method, as shown in the figure below:

<img src="https://fcimg.3ti.site/zh/flashduty/mixin/alert_integration/grafana/2.avif" alt="drawing" width="600"/>

4. Open the Notification policies page, edit or add a policy as appropriate, and select the contact point created in the previous step as the sending channel, as shown in the following figure:

<img src="https://fcimg.3ti.site/zh/flashduty/mixin/alert_integration/grafana/3.avif" alt="drawing" width="600"/>

5. Save, return to the integration list, and wait for an alert to be generated. If the latest event time is displayed, the configuration is successful and the event has been received
6. The default alert level is warning. If you need to customize it, you can configure the severity label on the alert details page (for enumeration, please refer to the status comparison below). The specific operation is as shown in the figure below:

<img src="https://fcimg.3ti.site/zh/flashduty/mixin/alert_integration/grafana/4.avif" alt="drawing" width="600"/>

7. Finish

## Status Comparison

Legacy Alerting to Flashduty alert level mapping:

| Legacy Alerting |  Flashduty  | Status |
| --------------- | -------- | ---- |
| alerting        | Warning  | Average |
| no_data         | Critical | High |
| ok              | Ok       | recover | Resolved        | |

Grafana Alerting to Flashduty alert level mapping:

The system sequentially extracts the `severity`, `priority`, and `level` from the alert event tags. The corresponding values will be used as the alert level in Prometheus. If none are extracted, the system automatically sets the Prometheus alert level to `warning`.

| Grafana Alerting |  Flashduty  | Status |
| ---------------- | -------- | ---- |
| critical         | Critical | High |
| warning          | Warning  | Average |
| warn             | Warning  | Average |
| info             | Info     | Disaster |
| acknowledged     | Info     | Disaster |
| unknown          | Info     | Disaster |
| unk              | Info     | Disaster |
| ok               | Ok       | recover | Resolved        | |