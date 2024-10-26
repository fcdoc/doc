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

<div id="!"><ol><li>Log into your Alertmanager instance</li><li> Find and open the configuration file, usually alertmanager.yml in the Alertmanager root directory</li><li> In the receivers configuration section, add a Flashduty  webhook type receiver , as follows</li></ol><pre> <code class="language-receiver">receivers:
- name: 'flashcat'
webhook_configs:
- url: '您的集成推送地址'
send_resolved: true
http_config:
proxy_url: 'http://proxyserver:port'
</code></pre><p> You need to url the corresponding parameter value with the integrated push address. Note query string the parameter part needs to be carried integration_key</p><p> If you need to request Flashduty through a proxy, you can additionally set the http_config to proxy_url parameters as the proxy address.</p><ol start="4"><li> In the route configuration section, change the default route and specify receiver to webhook just configured, as follows:</li></ol><pre> <code class="language-route">route:
...
receiver: 'flashcat'
</code></pre><p> You can also add receiver to the non-default route , but then you will only synchronize the alarm events corresponding to route to Flashduty not all alarm events.</p><ol start="5"><li> Save configuration file</li><li> Make changes take effect by reloading the configuration file (sending a SIGHUP signal, or POST request /-/reload api to the process)</li><li> Finish</li></ol></div>

#### Step 2: Configure Timestamp

By default, the system uses the current time as the event trigger time. If you wish to customize the time, you can set an additional timestamp field to indicate the exact time of each alert occurrence.

<div id="!"><ol><li>Log into your Prometheus Server instance</li><li> Open the configuration file related to the alarm rule</li><li> For each alarm rule, change the annotations part and add the timestamp field, as follows:</li></ol><pre> `annotations:
timestamp: '{{ with query "time()" }}{{ .
`</pre> | first | value }}{{ end }} '...</p><pre> `
4. 保存配置文件
5. 通过重新加载配置文件（向进程发送 SIGHUP 信号，或 POST 请求/-/reload api），使更改生效
6. 完成

</div>
`

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