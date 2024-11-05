---
brief: >-
  Push the Prometheus alert event to Flashduty through AlertManager through webhook. When alert triggers, send
  Flashduty sends a trigger event. When the alert is restored, a recovery event is sent to Flashduty.
---

# Prometheus Alert Integration

Push the Prometheus alert events to Flashduty through AlertManager via webhook. When an alert is triggered, send a trigger event to Flashduty; when the alert is resolved, send a recovery event to Flashduty.

## Usage Restrictions

### In AlertManager:

- You must have permission to modify the AlertManager configuration file.
- Your AlertManager server must be able to access the domain name api.flascat.cloud and push the alert to the external network.

## Supported Versions

This article is suitable for **Alertmanager 0.16.0 and above** versions.

## Operation Steps

### In Flashduty:

You can obtain an integration push address through the following two methods, choose either one.

#### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand:

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrate Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Prometheus** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete.

#### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand:

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Select the **Prometheus** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can directly set a default collaboration space as a fallback, and adjust it as needed.
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

You need to replace url with the corresponding parameter value as the integrated push address. Note that the query string parameter part needs to carry integration_key .

If you need to request through a proxy Flashduty you can additionally set the proxy_url parameter of http_config to the proxy address.

4. In the route configuration section, change the default route and specify the receiver to be the webhook just configured, as follows:

```route config
route:
...
receiver: 'flashcat'
```

You can also add the receiver to a non-default route, but this way you will only synchronize the alerts of the corresponding route to Flashduty, not all alerts.

5. Save the configuration file
6. Make changes take effect by reloading the configuration file (sending a SIGHUP signal to the process, or POST request to /-/reload api)
7. Complete

#### Step 2: Configure Timestamp

By default, the system uses the current time as the event trigger time. If you want to customize the time, you can set an additional timestamp field to identify the exact time when each alert occurs.

1. Log in to your Prometheus Server instance
2. Open the alert rule-related configuration file
3. For each alert rule, change the annotations section and add the timestamp field as follows:

```
annotations:
timestamp: '{{ with query "time()" }}{{ . | first | value }}{{ end }}'
...
```

4. Save the configuration file
5. Make changes take effect by reloading the configuration file (sending a SIGHUP signal to the process, or POST request to /-/reload api)
6. Complete

## Severity Mapping

The system sequentially extracts the `severity`, `priority`, and `level` from the alert event tags. The corresponding values will be used as the alert level in Prometheus. If none are extracted, the system automatically sets the Prometheus alert level to `Warning`.

Prometheus to Flashduty alert level mapping:

| Prometheus   |  Flashduty  | State |
| ------------ | -------- | ---- |
| critical     | Critical | Critical |
| warning      | Warning  | Warning |
| warn         | Warning  | Warning |
| info         | Info     | Info |
| acknowledged | Info     | Info |
| unknown      | Info     | Info |
| unk          | Info     | Info |
| ok           | Ok       | Recovered |

## Frequently Asked Questions

|+| Why didn't I receive an alert in Flashduty?

    #### In Flashduty:

    1. Check if the integration shows **the latest event time**? If not, it means Flashduty did not receive the push, so prioritize troubleshooting the AlertManager part.
    2. If you are using **shared integration**, first confirm whether you have configured **routing rules**. Without setting routing rules, the system will directly reject new pushes because there is no collaboration space to handle your alert. In this case, simply configure the routing rules to the desired space.

    #### In AlertManager:

    1. First, confirm whether the AlertManager has generated a new alert. If no new alert is generated, continue to wait for a new alert to be triggered and then re-verify.
    2. Open the AlertManager configuration file. If you set up a sub-route, please make sure that your routing settings are correct (for example, if the previous route is set to continue , AlertManager will skip matching subsequent sub-routes. We recommend that you always only set a default route to Flashduty ). Also verify whether the target callback address exactly matches the integrated push address. If they do not match, please modify **alert rules** and re-verify.
    3. If it matches, please continue to confirm that the AlertManager instance can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for it, or separately enable external network access for Flashduty's domain name.
    4. If there is no network issue, you need to continue troubleshooting the AlertManager to see if there are any relevant error logs.

    If you still cannot find the root cause of the problem after performing the above steps, please contact us directly.