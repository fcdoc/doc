---
brief: Synchronize OceanBase alarm events to Kuaimao Nebula via webhook to automate noise reduction processing for alarm events
---

# OceanBase Alarm Event

Synchronize OceanBase alarm events to Kuaimao Nebula via webhook to automate noise reduction processing for alarm events

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **OceanBase** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **OceanBase** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## At OceanBase

## 1. OceanBase Alarm Notification Configuration

### Step 1: Configure the Alarm Notification Channel
1. Login to your OceanBase console and navigate to the Alarm Center.
2. Access the **Alarm Channels** section, click the **Create New Channel** button to begin setting up a new channel.
3. Select **Custom Script** as the channel type.
4. The basic configuration details are as shown in the following image:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/IQVsfNMP7URm0FvPQlnMRB7JFUTPrgKlUw96ylc3Udc.avif" />

5. In the channel configuration, copy the following script content, and **please supplement the integration_key parameter in the script with the value of integration_key from the FlashDuty push address**.

```
#!/usr/bin/env bash

function sendToFlashDuty() {
URL="${address}/event/push/alert/standard?integration_key=${integration_key}"
curl -s -X POST ${URL} -H 'Content-Type: application/json' -d '{
"event_status": "'${alert_level}'",
"alert_key": "'${alarm_id}'",
"description": "'"${alarm_description//\"/\\\"}"'",
"title_rule": "$app_types::$name::$alarm_targets",
"event_time":'${timestamp}',
"labels": {
"app_types":"'${app_type}'",
"id":"'${alarm_id}'",
"name":"'${alarm_name}'",
"alarm_level":"'${alarm_level}'",
"alarm_status":"'${alarm_status}'",
"alarm_active_at":"'${alarm_active_at}'",
"alarm_threshold":"'${alarm_threshold}'",
"alarm_type":"'${alarm_type}'",
"alarm_targets":"'${alarm_target}'",
"ob_cluster_group":"'${ob_cluster_group}'",
"ob_cluster":"'${ob_cluster}'",
"hostIP":"'${host_ip}'",
"app_cluster":"'${app_cluster}'",
"alarm_description":"'"${alarm_description//\"/\\\"}"'",
"alarm_url":"'${alarm_url}'"
}
}'

return $?
}

alarm_name=$(echo ${alarm_name} | sed  "s/ /_/g")
alarm_target=$(echo ${alarm_target} | sed  "s/ /_/g")

#使用告警更新时间作为告警产生时间
timestamp=$(TZ=UTC date -d "${alarm_updated_at}" +%s)

#OceanBase告警通知的状态和级别是中文，所以先转Md5，再做判断
levelMd5=$(echo ${alarm_level} | md5sum | awk '{print$1}')
statusMd5=$(echo ${alarm_status} | md5sum | awk '{print$1}')

#状态Md5
active="048d106318302b41372b4292b5696ad4"
Inactive="bf7da164d431439fe9668fbc964110c4"

#告警级别Md5
down="2e1558b0a152fae2dd15884561b1508d"
critical="59b9b38574ca2ee4f5e264b56f49a83f"
alert="723931b03a5d1cec59eac40cf0703580"
caution="abf4d55ba8926eff32cb44065e634ed3"
info="6aae3f4254789d72aa0cc8ed55b8f11f"

address="https://api.flashcat.cloud"
integration_key=""

#将OceanBase的告警级别定义做转换
if [[ ${statusMd5} == ${Inactive} ]];then
alert_level="Ok"
timestamp=$(TZ=UTC date -d "${alarm_resolved_at}" +%s)
elif [[ ${statusMd5} == "${active}" ]];then
if [[ ${levelMd5} == ${down} || ${levelMd5} == ${critical} ]];then
alert_level="Critical"
elif [[ ${levelMd5} == ${alert} ]];then
alert_level="Warning"
elif [[ ${levelMd5} == ${caution}  ||  ${levelMd5} == ${info} ]];then
alert_level="Info"
fi
fi

#只有状态是告警中或恢复告警才发通知，屏蔽或抑制的不发通知
if [[ ${statusMd5} == ${active} || ${statusMd5} == ${Inactive} ]];then
sendToFlashDuty
fi
```

6. Simply input the verification information into the {} placeholder for Response.
7. In the message configuration, select Markdown as the format for alarm messages.
8. Choose **Simplified Chinese** for the alarm message template, and fill in the following content before submitting.

```
OCP告警通知-单条告警
- 告警ID： ${alarm_id}
- 名称：${alarm_name}
- 级别：${alarm_level}
- 告警对象：${alarm_target}
- 服务： ${service}
- 概述：${alarm_summary}
- 生成时间：${alarm_active_at}
- 更新时间： ${alarm_updated_at}
- 恢复时间：${alarm_resolved_at}
- 详情：${alarm_description}
- 状态： ${alarm_status}
- 告警类型： ${alarm_type}
- 告警阈值： ${alarm_threshold}
- 集群组： ${ob_cluster_group}
- 集群： ${ob_cluster}
- 主机： ${host_ip}
- 应用集群： ${app_cluster}
- OCP链接：${alarm_url}
```

### Step 2: Configure Alarm Notifications

1. Create a new notification configuration by following the path: **Alarm Center => Alarm Notifications => Create New Notification Configuration**.
2. Configure the push type and specified recipients as needed.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/xQQWu3WIzYHZ-oN5KSj9d2tD0HvTTLNVngjSn7YXxMU.avif" />

3. Select **Simplified Chinese** as the language for notifications.
4. Choose **FlashDuty** as the alarm channel.
5. Enable **Recovery Notifications**.
6. Submit the configuration.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/QuWqfI-2cNzlQ_tXih5zqo_AB3YzPDDD8scvINbxt54.avif" />

## Status Comparison

|OceanBase|Kuaimao Nebula|state|
|---|---|---|
|Service Suspension|Critical|serious|
|serious|Warning|serious|
|warn|Warning|warn|
|Notice|Info|remind|
|remind|Info|remind|

## Status Comparison

|OceanBase|Kuaimao Nebula|state|
|---|---|---|
|Service Suspension|Critical|serious|
|serious|Warning|serious|
|warn|Warning|warn|
|Notice|Info|remind|
|remind|Info|remind|