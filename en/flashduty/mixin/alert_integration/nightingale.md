---
brief: >-
  Push Nightingale (Nightingale/n9e) or Flashcat alert events to Flashduty through webhook. When alert triggers, send
  Flashduty sends a trigger event. When the alert is restored, a recovery event is sent to Flashduty
---

# Nightingale/Flashcat Integration

Push Nightingale (Nightingale/n9e) or Flashcat alert events to Flashduty through webhook. When an alert triggers, send a trigger event to Flashduty. When the alert recovers, send a recovery event to Flashduty.

## Usage Restrictions

### In Nightingale

- You must have permission to modify **System Configuration => Global Notifications** or **Alert Management => Alert Rules**.
- Your Nightingale server must be able to access the domain name api.flascat.cloud and push the alert to the external network.

## Supported Versions

This article is suitable for **Nightingale V5 and V6** versions.

## Operation Steps

### In Flashduty

You can obtain an integration push address through the following two methods. Choose either one.

#### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Nightingale/Flashcat** Integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and complete.
    5. (Optional) Click the generated card, click the **Edit** button, select **Console Address**, and enter the Nightingale console address (only the domain part). Flashduty will generate a Nightingale details jump link for the new alert.

#### Use Shared Integration

When you need to route alerts to different collaboration spaces based on the payload information of the alert event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Choose **Nightingale/Flashcat** Integration:
    - **Integration Name**: Define a name for the current integration.
    - **Console Address**: (Optional) Enter the Nightingale console address (only the domain part). Flashduty will generate a Nightingale details jump link for the new alert.
    3. After clicking **Save**, copy the newly generated **Push Address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can directly set the default collaboration space as a fallback, and adjust as needed.
    5. Complete.

### In Nightingale/Flashcat

Choose one of the two configuration methods.

#### Method 1: Configure by Policy

Batch select alert rules and configure the webhook.

1. Log in to your n9e console, select alert Manage > alert Rules, and enter the alert rule list page
2. Select the alert rules you want to import in batches, and select batch update alert rules in the upper right corner
3. In the pop-up window, select the "Callback Address" field and enter the integration push address in the new input box, as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/nightingale/1.avif" />

4. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
5. Complete

#### Method 2: Global Configuration

Nightingale supports configuring a global webhook address in both the page and configuration file to push all alert events. Choose one of the following two methods.

##### V6 and Above

1. Log in to your n9e console
2. Enter the __System Configuration - Notification Settings - Callback Address__ page
3. As shown in the figure below, enable a new webhook and enter the integration push address in the `URL` field

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/nightingale/2.avif" />

4. Complete

##### V5.4 to 5.15

1. Log in to your n9e server instance
2. Find and open the configuration file, usually etc/server.conf
3. Modify the Alerting configuration section and add the Webhook configuration as follows:

```receiver config
[Alerting.Webhook]
Enable = true
Url = "{api_host}/event/push/alert/n9e?integration_key=$integration_key"
BasicAuthUser = ""
BasicAuthPass = ""
Timeout = "5s"
Headers = ["Content-Type", "application/json", "X-From", "N9E"]
```

You need to replace the corresponding parameter value of Url with the integrated push address.

4. Save the configuration file
5. Restart the n9e server to apply the configuration
6. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
7. Complete

## Severity Mapping Relationship

Nightingale/Flashcat to Flashduty alert level mapping relationship:

| n9e |  Flashduty  | Status |
| --- | -------- | ---- |
| 1   | Critical | Critical |
| 2   | Warning  | Warning |
| 3   | Info     | Info |

## Common Issues

|+| Why didn't I receive an alert in Flashduty?

    #### In Flashduty

    1. Check if the integration shows **the latest event time**? If not, it means Flashduty has not received the push. Start by checking the Nightingale part.
    2. If you are using **Shared Integration**, first confirm whether you have configured **Routing Rules**. Without setting routing rules, the system will directly reject new pushes because there is no collaboration space to handle your alert. In this case, configure the routing rules to the desired space.

    #### In Nightingale/Flashcat

    1. First, confirm whether Nightingale has generated a new alert: Go to **Alert Management => History Alerts**, and check if a new alert has been generated after configuring the webhook. Note that the new alert status must be **Triggered**. If no new alert has been generated, wait for a new alert to be triggered and re-verify.
    2. After finding the alert, go to the alert details and view the **Callback Address** section. Verify that the actual callback address matches the integration push address exactly. If they do not match, modify the **Alert Rule** and re-verify.
    3. If they match, you need to log in to the Nightingale server and confirm that it can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or separately enable external network access for Flashduty's domain name.
    4. If there is no network issue, continue to troubleshoot the server to check for any relevant error logs.

    If you still cannot find the root cause of the problem after performing the above steps, please contact us directly.