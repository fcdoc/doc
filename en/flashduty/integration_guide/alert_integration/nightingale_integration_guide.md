---
brief: >-
  Push Nightingale (Nightingale/n9e) or Flashcat alert events to Flashduty via webhook. When an alert is triggered, send a trigger event to Flashduty; when the alert is resolved, send a recovery event to Flashduty
  Flashduty sends a trigger event when an alert is activated, and sends a recovery event when the alert is resolved
---

# Nightingale/Flashcat Integration

Push Nightingale (Nightingale/n9e) or Flashcat alert events to Flashduty through a webhook. When an alert is triggered, send a trigger event to Flashduty; when the alert is resolved, send a recovery event to Flashduty.

## Usage Restrictions

### In Nightingale,

- You must have the permission to modify **System Configuration > Global Notification** or **Alert Management > Alert Rules**.
- Your Nightingale server must be able to access the domain api.flascat.cloud to push alerts to the external network.

## Supported Versions

This article is compatible with **Nightingale V5 and V6** versions.

## Operation Steps

### In Flashduty

使用专属集成

#### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Nightingale/Flashcat** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.
    5. *(Optional)* Click on the generated card, click the **Edit** button, select **Console Address**, and enter the Nightingale console address (only the domain name part). Flashduty will generate a Nightingale detail jump link for new alerts.

#### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Nightingale/Flashcat** integration:
    - **Integration Name**: Define a name for the current integration.
    - **Console Address**: *(Optional)* Enter the Nightingale console address (only the domain name part), and Flashduty will generate a Nightingale detail jump link for new alerts.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

### In Nightingale/Flashcat,

Choose one of the two configuration methods.

#### Method 1: Configure by Policy

Select and configure webhooks for alert rules in bulk.

1. Login to your n9e console, navigate to Alarm Management > Alarm Rules, and access the alarm rule list page
2. Select the desired alert rules in bulk, then choose "Batch Update Alert Rules" from the upper right corner
3. In the popup window, select the "Callback Address" field and enter the integrated push address in the new input box, as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/UjmNaNKJ88MKM2yEVC51LPmB0PoC2jve-WRDdLKvsjk.avif" />

4. Return to the integration list. If the latest event time is displayed, it indicates that the configuration is successful and events are being received
5. Completed

#### Method 2: Global Configuration

Nightingale allows configuration of global webhook addresses in both the interface and configuration files to push all alert events. Choose either of the following two methods.

##### V6 and Above

1. Login to your n9e console
2. Enter the __System Configuration - Notification Settings - Callback Address__ page
3. As shown in the figure below, enable a new webhook and fill in the integrated push address in the `URL` field

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/KlaBAhQQ7VXvE2gal3qgIgbV0nuXhUjcu7ERu8Tg948.avif" />

4. Completed

##### V5.4 ~ 5.15

1. Login to your n9e server instance
2. Locate and open the configuration file, typically found at etc/server.conf
3. Modify the Alerting configuration section by adding the Webhook configuration as follows:

```receiver config
[Alerting.Webhook]
Enable = true
Url = "{api_host}/event/push/alert/n9e?integration_key=$integration_key"
BasicAuthUser = ""
BasicAuthPass = ""
Timeout = "5s"
Headers = ["Content-Type", "application/json", "X-From", "N9E"]
```

You are required to substitute the parameter value corresponding to the URL with the integrated push endpoint.

4. Save the configuration file
5. Restart the n9e server to activate the changes
6. Return to the integration list. If the latest event time is displayed, it indicates that the configuration is successful and events are being received
7. Completed

## Severity Level Mapping

Nightingale/Flashcat to Flashduty alert level mapping:

| n9e |  Flashduty  | state |
| --- | -------- | ---- |
| 1   | Critical | serious |
| 2   | Warning  | warn |
| 3   | Info     | remind |

## FAQs

|+| Why have I not received any alerts in Flashduty?

    #### In Flashduty

    1. Check if the integration displays the **Latest Event Time**. If not, it indicates that Flashduty has not received the push; therefore, begin troubleshooting with the Nightingale component first.
    2. If you are using a **Shared Integration**, first ensure you have set up **Routing Rules**. Without routing rules, the system will reject new pushes directly, as there is no collaboration space to handle your alerts. In such cases, simply configure the routing rules to your desired space.

    #### In Nightingale/Flashcat,

    1. First, confirm if Nightingale has generated new alerts: go to **Alert Management => Historical Alerts** and check if new alerts have been generated after setting up the webhook. Ensure the new alerts are marked as **Triggered**. If no new alerts are generated, wait for new alerts to trigger before re-verifying.
    2. After locating the alert, enter the alert details and check the **Callback Address** section. Verify that the actual callback address matches the integration push address exactly. If they do not match, adjust the **alert rules** and re-verify.
    3. If they match, log in to the Nightingale server and confirm that it can access the external domain api.flashcat.cloud. If it cannot, you need to enable external network access for the server or specifically for the Flashduty domain.
    4. If there are no network issues, continue to troubleshoot the server for any relevant error logs.

    If, after performing the above steps, you still cannot identify the root cause of the issue, please contact us directly.