---
brief: Synchronize Skywalking alert events with Kuaimao Nebula via webhook to automate noise reduction processing for these alerts
---

# Skywalking alert events

Synchronize Skywalking alert events with Kuaimao Nebula via webhook to automate noise reduction processing for these alerts.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Skywalking** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Skywalking** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In Skywalking

## 1. Revise the configuration file for the Skywalking service

1. Access the Skywalking server.
2. Locate the Skywalking configuration file at ./config/alarm-settings.yml.
3. Add Level tags within the alert rules.

```
# v8.6.0+ 及以上版本才支持tags标签，其他版本可以不添加。
# Level 的对应 value ：Critical、Warning、Info。
# 请注意大小写。
rules:
endpoint_relation_resp_time_rule:
expression: sum(endpoint_relation_resp_time > 1000) >= 2
period: 10
message: Response time of endpoint relation {name} is more than 1000ms in 2 minutes of last 10 minutes
tags:
Level: Warning
```
4. Enter the webhook URL for FlashDuty.

```
# 在配置文件底部添加
# v8.8.0 ~ v9.5.0 的添加方式
webhooks:
- url: https://api.flashcat.cloud/event/push/alert/skywalking?integration_key=18c7f1551df55fa28a1a87f0846d9d1e131

# v10.0.0 的添加方式
hooks:
webhook:
default:
is-default: true
urls:
- https://api.flashcat.cloud/event/push/alert/skywalking?integration_key=18c7f1551df55fa28a1a87f0846d9d1e131
```

5. Once the modifications are complete, save the changes and restart the Skywalking service to activate the new configuration

## Status Comparison

|Skywalking|Kuaimao Nebula|state|
|---|---|---|
|Critical|Critical|serious|
|Warning|Warning|warn|
|Info|Info|remind|
|Other or Empty|Info|remind|