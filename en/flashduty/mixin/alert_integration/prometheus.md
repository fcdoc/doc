---
brief: >-
  Push the Prometheus alert event to Flashduty through AlertManager through webhook. When alert triggers, send
  Prometheus Alert Integration
---

# Usage Restrictions

Push the Prometheus alert events to Flashduty via AlertManager through webhooks. When an alert triggers, send a trigger event to Flashduty, and when the alert recovers, send a recovery event to Flashduty.

## Usage Restrictions

### In AlertManager:

- You must have permission to modify the AlertManager configuration file.
- Supported Version

## Step 1: Configure Alertmanager

This article is compatible with **Alertmanager 0.16.0 and above** versions.

## Operation Steps

### In Flashduty

You can obtain an integration push address through the following two methods. Choose either one.

#### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Prometheus** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

#### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Prometheus** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

### In AlertManager:

#### Step 1: Configure Alertmanager

1. Log in to your Alertmanager instance
2. Find and open the configuration file, usually alertmanager.yml in the root directory of the Alertmanager deployment
3. In the receivers configuration section, add a Flashduty webhook type receiver, as follows

```receiver config
receivers:
- name: 'flashcat'
webhook_configs:
- url: '您的集成推送地址'
send_resolved: true
http_config:
proxy_url: 'http://proxyserver:port'
```

name: 'flashduty-webhook'

webhook_configs:

4. In the route configuration section, change the default route and specify the receiver to be the webhook just configured, as follows:

```route config
route:
...
receiver: 'flashcat'
```

You can also add the receiver to a non-default route, but this way you will only synchronize the alert events of the corresponding route to Flashduty, not all alert events.

5. Save the configuration file
6. Make changes take effect by reloading the configuration file (sending a SIGHUP signal to the process, or POST request to /-/reload api)
7. Finish

#### Step 2: Configure Timestamp

By default, the system uses the current time as the event trigger time. If you want to customize the time, you can set an additional timestamp field to identify the exact time when each alert occurs.

1. Log in to your Prometheus Server instance
2. Open the alert rule configuration file
3. For each alert rule, change the annotations section and add the timestamp field as follows:

```
annotations:
timestamp: '{{ with query "time()" }}{{ . | first | value }}{{ end }}'
...
```

4. Save the configuration file
5. Make changes take effect by reloading the configuration file (sending a SIGHUP signal to the process, or POST request to /-/reload api)
6. Finish

## Severity Mapping Relationship

The system sequentially extracts the `severity`, `priority`, and `level` from the alert event labels. The corresponding values will be used as the alert levels in Prometheus. If no values are extracted, the system automatically sets the Prometheus alert level to `Warning`.

route:

| Prometheus   |  Flashduty  | Status |
| ------------ | -------- | ---- |
| critical     | Critical | High |
| warning      | Warning  | Average |
| warn         | Warning  | Average |
| info         | Info     | Disaster |
| acknowledged | Info     | Disaster |
| unknown      | Info     | Disaster |
| unk          | Info     | Disaster |
| ok           | Ok       | recover | Resolved        | |

## Frequently Asked Questions

|+| Why didn't I receive an alert in Flashduty?

    #### In Flashduty

    1. Check if the integration shows the **latest event time**? If not, it means Flashduty did not receive the push, so check the AlertManager part directly.
    2. If you are using **shared integration**, first confirm whether you have configured **routing rules**. Without setting routing rules, the system will directly reject new pushes because there is no collaboration space to handle your alert. In this case, just configure the routing rules to the space you want.

    #### In AlertManager:

    1. First, confirm whether the AlertManager has generated a new alert. If no new alert is generated, please wait for a new alert to be triggered and then re-verify.
    2. Open the AlertManager configuration file. If you set up a sub-route, please make sure that your routing settings are correct (for example, if the previous route is set to continue , AlertManager will skip matching subsequent sub-routes. We recommend that you always only set a default route to Flashduty ). Also verify whether the target callback address exactly matches the integrated push address. If they do not match, please modify **alert rules** and re-verify.
    3. Step 2: Configure Timestamp
    4. If the network is not the issue, continue troubleshooting the AlertManager to see if there are any relevant error logs.

    If you still cannot find the root cause of the problem after performing the above steps, please contact us directly.