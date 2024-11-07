---
brief: Synchronize OceanBase alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events
---

# OceanBase Alert Events

Synchronize OceanBase alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **OceanBase** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **OceanBase** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In OceanBase

## OceanBase Alert Push Configuration

### Step 1: Configure Alert Channel
1. Log in to your OceanBase console and select the alert center.
2. Enter **Alert Channel**, click the **New Channel** button to start creating a new channel.
3. Select **Custom Script** for the channel type.
4. The basic configuration content is as shown in the figure below:

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/oceanbase/1.avif" />

5. Copy the following script content in the configuration channel, and **please add the integration_key parameter in the script with the integration_key value in the FlashDuty address** .

```i18n
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

#Use the alert update time as the alert generation time
timestamp=$(TZ=UTC date -d "${alarm_updated_at}" +%s)

#The status and level of OceanBase alert notifications are in Chinese, so convert them to MD5 first and then make a judgment
levelMd5=$(echo ${alarm_level} | md5sum | awk '{print$1}')
statusMd5=$(echo ${alarm_status} | md5sum | awk '{print$1}')

#Status MD5
active="048d106318302b41372b4292b5696ad4"
Inactive="bf7da164d431439fe9668fbc964110c4"

#Alert Level MD5
down="2e1558b0a152fae2dd15884561b1508d"
critical="59b9b38574ca2ee4f5e264b56f49a83f"
alert="723931b03a5d1cec59eac40cf0703580"
caution="abf4d55ba8926eff32cb44065e634ed3"
info="6aae3f4254789d72aa0cc8ed55b8f11f"

address="https://api.flashcat.cloud"
integration_key=""

#Convert OceanBase alert level definitions
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

#Notifications will be sent only if the status is "In Alert" or "Recovered"; if the status is "Blocked" or "Suppressed," no notification will be sent
if [[ ${statusMd5} == ${active} || ${statusMd5} == ${Inactive} ]];then
sendToFlashDuty
fi
```

6. Just fill in {} for the Response verification information.
7. Select Markdown as the alert message format in the message configuration.
8. **Select Simplified Chinese** for the alert message template, fill in the following content, and submit.

```i18n
OCPAlert Notification - Single Alert
- Alert ID: ${alarm_id}
- Name: ${alarm_name}
- Level: ${alarm_level}
- Alert Object: ${alarm_target}
- Service: ${service}
- Overview: ${alarm_summary}
- Generation Time: ${alarm_active_at}
- Update Time: ${alarm_updated_at}
- Recovery Time: ${alarm_resolved_at}
- Details: ${alarm_description}
- Status: ${alarm_status}
- Alert Type: ${alarm_type}
- Alert Threshold: ${alarm_threshold}
- Cluster Group: ${ob_cluster_group}
- Cluster: ${ob_cluster}
- Host: ${host_ip}
- Application Cluster: ${app_cluster}
- OCPLink: ${alarm_url}
```

### Step 2: Configure Alert Push

1. Create a new push configuration, path: **Alert Center => Alert Push => New Push Configuration**.
2. Configure the push type and specified objects as needed.

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/oceanbase/2.avif" />

3. Select **Simplified Chinese** as the push language.
4. Select **FlashDuty** as the alert channel.
5. Enable **Recovery Notifications**.
6. Submit.

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/oceanbase/3.avif" />

## Status Comparison

|OceanBase|Flashcat|Status|
|---|---|---|
|Stop Service|Critical|High|
|High|Warning|High|
|Average|Warning|Average|
|Notice|Info|Disaster|
|Disaster|Info|Disaster|

## Status Comparison

|OceanBase|Flashcat|Status|
|---|---|---|
|Stop Service|Critical|High|
|High|Warning|High|
|Average|Warning|Average|
|Notice|Info|Disaster|
|Disaster|Info|Disaster|