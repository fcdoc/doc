---
brief: >-
  Push Prometheus alert events to Flashduty via AlertManager using a webhook. When an alert is triggered, send a trigger event to
  Flashduty, and when the alert is resolved, send a recovery event to Flashduty.
---

# Prometheus Alert Integration

Push Prometheus alert events to Flashduty via AlertManager using a webhook. When an alert is triggered, send a trigger event to Flashduty, and when the alert is resolved, send a recovery event to Flashduty.

## Usage Restrictions

### In AlertManager

- You must have the permission to modify the AlertManager configuration file.
- Your AlertManager server must be able to access the domain api.flascat.cloud to push alerts to the external network.

## Supported Versions

This article is compatible with **Alertmanager version 0.16.0 and above**.

## Operation Steps

### In Flashduty

使用专属集成

#### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Prometheus** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

#### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Prometheus** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

### In AlertManager

#### Step 1: Configure Alertmanager

1. Log in to your Alertmanager instance
2. Find and open the configuration file, usually alertmanager.yml in the root directory of the Alertmanager deployment
3. Within the receivers configuration section, add a Flashduty webhook receiver as follows:

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

4. In the route configuration section, modify the default route to specify the webhook receiver that was just configured, as shown below:

```route config
route:
...
receiver: 'flashcat'
```

You can also add a receiver to a non-default route; however, doing so will only synchronize the alerts for that specific route to Flashduty, not all alerts.

5. Save the configuration file
6. Make changes take effect by reloading the configuration file (sending a SIGHUP signal to the process, or POST request to /-/reload api)
7. Completion

#### Step 2: Configure Timestamp

By default, the system uses the current time as the event trigger time. If you wish to customize the time, you can set an additional timestamp field to indicate the exact time of each alert occurrence.

1. Log in to your Prometheus Server instance
2. Open the configuration file related to the alerting rules
3. For each alert rule, change the annotations section and add the timestamp field as follows:

```
annotations:
timestamp: '{{ with query "time()" }}{{ . | first | value }}{{ end }}'
...
```

4. Save the configuration file
5. Make changes take effect by reloading the configuration file (sending a SIGHUP signal to the process, or POST request to /-/reload api)
6. Completion

## Severity Level Mapping

The system sequentially extracts the `severity`, `priority`, and `level` tags from the alert event. The corresponding values will be used as Prometheus's own alert levels. If none are extracted, the system will automatically set the Prometheus alert level to `Warning`.

Prometheus to Flashduty Alert Level Mapping:

| Prometheus   |  Flashduty  | state |
| ------------ | -------- | ---- |
| critical     | Critical | serious |
| warning      | Warning  | warn |
| warn         | Warning  | warn |
| info         | Info     | remind |
| acknowledged | Info     | remind |
| unknown      | Info     | remind |
| unk          | Info     | remind |
| ok           | Ok       | Recovered |

## FAQs

|+| Why have I not received any alerts in Flashduty?

    #### In Flashduty

    1. Check if the integration displays the **Latest Event Time**? If it doesn't, this indicates that Flashduty has not received the push; therefore, you should first troubleshoot the AlertManager component.
    2. If you are using a **Shared Integration**, first ensure you have set up **Routing Rules**. Without routing rules, the system will reject new pushes directly, as there is no collaboration space to handle your alerts. In such cases, simply configure the routing rules to your desired space.

    #### In AlertManager

    1. First, confirm whether AlertManager has generated a new alert. If no new alert has been generated, please wait for a new alert to trigger and then re-verify.
    2. Open the AlertManager configuration file. If you have configured sub-routes, ensure your routing settings are accurate (for instance, if the preceding route is set to "continue," AlertManager will bypass matching any subsequent sub-routes. We advise setting only a default route to Flashduty at all times). Additionally, verify that the target callback address aligns perfectly with the integrated push address. If they do not correspond, please revise the **alarm rules** and re-verify the settings.
    3. If it matches, please continue to confirm that the AlertManager instance can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for it, or separately enable external network access for Flashduty's domain name.
    4. If there are no network issues, you need to continue troubleshooting AlertManager to check for any related error logs.

    If, after performing the above steps, you still cannot identify the root cause of the issue, please contact us directly.