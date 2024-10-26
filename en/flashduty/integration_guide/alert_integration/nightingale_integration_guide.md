---
brief: >-
  Push Nightingale (Nightingale/n9e) or Flashcat alert events to Flashduty via webhook. When an alert is triggered, send a trigger event to Flashduty; when the alert is resolved, send a recovery event to Flashduty
  Flashduty sends a trigger event when an alert is activated, and sends a recovery event when the alert is resolved
---

# Nightingale/Flashcat Integration

---

Push Nightingale (Nightingale/n9e) or Flashcat alert events to Flashduty through a webhook. When an alert is triggered, send a trigger event to Flashduty; when the alert is resolved, send a recovery event to Flashduty.


## Usage Restrictions
---

### In Nightingale,

- You must have the permission to modify **System Configuration > Global Notification** or **Alert Management > Alert Rules**.
- Your Nightingale server must be able to access the domain api.flascat.cloud to push alerts to the external network.

## Supported Versions
---

This article is compatible with **Nightingale V5 and V6** versions.

## Operation Steps
---

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

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Select the **Nightingale/Flashcat** integration:
    - **Integration Name**: Define a name for the current integration.
    - **Console Address**: *(Optional)* Enter the Nightingale console address (only the domain name part), and Flashduty will generate a Nightingale detail jump link for new alerts.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, and adjust as needed later.
    5. Completed.

### In Nightingale/Flashcat,

Choose one of the two configuration methods.

#### Method 1: Configure by Policy

<div id="!"><p>Select alarm rules in batches and configure them webhook .</p><ol><li> Log in to your n9e , select Alarm Management > Alarm Rules, and enter the alarm rule list page</li><li> Select the alarm rules you want to import in batches, and select Batch Update Alarm Rules in the upper right corner.</li><li> Select the "Callback Address" field in the pop-up window and fill in the integrated push address in the new input box, as shown in the figure below:</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/UjmNaNKJ88MKM2yEVC51LPmB0PoC2jve-WRDdLKvsjk.avif"><ol start="4"><li> Return to the integration list. If the latest event time is displayed, the configuration is successful and the event is received.</li><li> Finish</li></ol></div>

#### Method 2: Global Configuration

<div id="!">Nightingale supports configuring global webhook in pages and configuration files to push all alarm events. You can choose one of the following two methods.<h5> V6 and above version</h5><ol><li> Log into your n9e console</li><li> Enter __ System Configuration - Notification Settings - Callback Address __ page</li><li> As shown in the figure below, enable a new one webhook and fill in the integrated push address in part `URL`</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/KlaBAhQQ7VXvE2gal3qgIgbV0nuXhUjcu7ERu8Tg948.avif"><ol start="4"><li> Finish</li></ol><h5> V5.4 ~ 5.15</h5><ol><li> Log into your n9e server instance</li><li> Find and open the configuration file, usually etc/server.conf</li><li> Change the Alerting configuration part and write the Webhook configuration as follows</li></ol><pre> <code class="language-receiver">[Alerting.Webhook]
Enable = true
Url = "{api_host}/event/push/alert/n9e?integration_key=$integration_key"
BasicAuthUser = ""
BasicAuthPass = ""
Timeout = "5s"
Headers = ["Content-Type", "application/json", "X-From", "N9E"]
</code></pre><p> You need to replace the corresponding parameter value of Url with the integrated push address.</p><ol start="4"><li> Save configuration file</li><li> Restart n9e server to make the configuration take effect</li><li> Return to the integration list. If the latest event time is displayed, the configuration is successful and the event is received.</li><li> Finish</li></ol></div>

## Severity Level Mapping
---

Nightingale/Flashcat to Flashduty alert level mapping:

| n9e |  Flashduty  | state |
| --- | -------- | ---- |
| 1   | Critical | serious |
| 2   | Warning  | warn |
| 3   | Info     | remind |

## FAQs
---


|+| Why am I not receiving alerts in Flashduty?

    #### In Flashduty

    1. Check if the integration displays the **Latest Event Time**. If not, it indicates that Flashduty has not received the push; therefore, begin troubleshooting with the Nightingale component first.
    2. If you are using a **shared integration**, first verify if you have set up **routing rules**. Without routing rules, the system will reject new pushes directly, as there is no collaboration space to handle your alerts. In such cases, configure the routing rules to your desired space.

    #### In Nightingale/Flashcat,

    1. First, confirm if Nightingale has generated new alerts: go to **Alert Management => Historical Alerts** and check if new alerts have been generated after setting up the webhook. Ensure the new alerts are marked as **Triggered**. If no new alerts are generated, wait for new alerts to trigger before re-verifying.
    2. After locating the alert, enter the alert details and check the **Callback Address** section. Verify that the actual callback address matches the integration push address exactly. If they do not match, adjust the **alert rules** and re-verify.
    3. If they match, log in to the Nightingale server and confirm that it can access the external domain api.flashcat.cloud. If it cannot, you need to enable external network access for the server or specifically for the Flashduty domain.
    4. If there are no network issues, continue to troubleshoot the server for any relevant error logs.


    If you still cannot identify the root cause after these steps, please contact us directly.