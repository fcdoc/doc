---
brief: >-
  Synchronize Zabbix alerts to Flashduty via webhook (supports Zabbix 3.x to 6.x
  versions; configurations may vary across versions) to achieve automated noise reduction processing for alert events
---

# Utilize dedicated integrations in Flashduty

Synchronize Zabbix alert events to Flashduty via webhook (supports Zabbix 3.x to 6.x versions; configurations may vary across versions) to achieve automated noise reduction processing for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Zabbix** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Zabbix** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## For versions 5.x to 6.x
<span id="v5"></span>

### Use Shared Integrations

#### 5. 完成

1. Media type refers to the transmission channel used in Zabbix for sending notifications and alerts. Download the complete configuration by entering the terminal and executing the following command:

```
// 5.x版本 XML配置：
wget https://download.flashcat.cloud/flashduty/integration/zabbix/zbx_mediatype_flashcat_v5.xml

// 6.x 版本 YAML 配置：
wget https://download.flashcat.cloud/flashduty/integration/zabbix/zbx_mediatype_flashcat_v6.yml
```

2. Log in to the Zabbix Console, navigate to `Administration > Media Types`, click the "Import" button in the upper right corner, proceed to the editing page, select the downloaded configuration file, and click the "Import" button to complete the import:
3. Return to the "Media Types" page, where you can see the imported media type. Click on the name to enter the editing page and fill in the URL, zabbix_url, and HTTPProxy fields:

- `URL`: The webhook push request address; simply copy the integrated push address
- `zabbix_url` : Zabbix Console address, just copy it (if your page is configured with tomcat/nginx forwarding path, please bring it with you at the same time), the system will splice trigger_id and other parameters after the path to generate alert details page link
- `HTTPProxy`: If your Zabbix Server cannot directly access the Flashduty service, set this parameter to a proxy address

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/1.avif" />

4. Click "Update" to save the configuration

#### 在 Zabbix

A media type must be associated with a user to send events. The user must have at least read permissions for the host. It is recommended to link it directly to the Admin user. For example, with the Admin user:

1. Log in to the Zabbix Console, select `Administration > Users`, choose the Admin user, select "media", click "Add", and enter the editing window:

- Type: Choose the previously created Flashduty media type
- Send To: Enter N/A
- Use the default configuration for other settings and keep them unchanged

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/2.avif" />

2. Click the "Add" button to exit the media addition window
3. Click the "Update" button to exit the user editing page

#### 步骤 1:定义 Flashduty  media type

Sending a notification is one of the operations performed by the action ( actions ) in Zabbix . So, to set up a notification, log into Zabbix console, select `Configuration > Actions` , then:

1. 2	Click `Create action` to access the action editing page

- Name: Enter "Send To FlashDuty"

2. 3	Select `Operations` to add notification sending configurations for three different scenarios:

- In the Operations configuration, click "Add" to enter the configuration window
- Send to users: Select the user created or configured above
- Send only to: Select the Flashduty media type
- Keep other configurations as default
- Click "Add" to complete the configuration of this item
- 12	Repeat the above steps to finalize the configuration for `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/3.avif" />
<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/4.avif" />

#### Step 4: Send events to Flashduty

Log in to the Zabbix console and select `Monitoring > Problems` to view the latest alert list.

1. Click "Actions" to see the message notification results in the popup
2. Locate the Flashduty corresponding log. If the Status is `Sent`, the notification was successful. Otherwise, follow the prompts to troubleshoot the issue

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/5.avif" />

3. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
4. Finish

<span id="v4"></span>

### 5.x ~ 6.x

#### 5. 完成

1. 5	Login to the Zabbix console, go to `Administration > Media Types`, click the `Create media type` button in the upper right corner to enter the editing page
2. 6	On the editing page, select `Script` for the Type, and fill in the following parameters in the order provided (do not rearrange the order; leave fields blank if no value is needed; the script will retrieve parameter values in the given order):

- `{ALERT.MESSAGE}`: The alert message, maintained as the second parameter
- `{ALERT.MESSAGE}`: Keep the alert information in the second parameter

- __FlashDuty webhook push request address__, copy the integrated push address and keep it as the third parameter
- **Zabbix Console address** , just copy it directly (if your page is configured with tomcat/nginx path, please bring it with you at the same time), which is used to generate alert details page connection. If it is not empty, keep it in the fourth parameter
- `HTTPProxy`: If your Zabbix Server cannot directly access the Flashduty service, set this parameter to a proxy address. If there is no value, leave it blank and keep it as the fifth parameter

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/6.avif"/>

3. `Script name`: Enter `send-to-flashduty.sh`
4. Click "Update" to save the configuration
5. Log in to the server where the Zabbix server is located and execute the following command:

```

#1. 进入告警脚本加载目录（具体地址配置在 Zabbix Server 配置文件中 `AlertScriptsPath` 变量，一般为`/usr/lib/zabbix/alertscripts`）
cd /usr/lib/zabbix/alertscripts

#2. 下载脚本
wget https://download.flashcat.cloud/flashduty/integration/zabbix/send-to-flashduty.sh

#3. 更改脚本为可执行状态
chmod +x send-to-flashduty.sh

```

6. Note that __the script uses the curl and jq commands__. Ensure that the Zabbix server process can locate and execute these two commands; if not, you will need to install them accordingly

#### 在 Zabbix

A media type must be associated with a user to send events. The user must have at least read permissions for the host. It is recommended to link it directly to the Admin user. For example, with the Admin user:

1. Log in to the Zabbix Console, select `Administration > Users`, choose the Admin user, select "media", click "Add", and enter the editing window:

- Type: Choose the previously created Flashduty media type
- Send To: Enter N/A
- Use the default configuration for other settings and keep them unchanged

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/7.avif" />

2. Click the "Add" button to exit the media addition window
3. Click the "Update" button to exit the user editing page

#### 步骤 1:定义 Flashduty  media type

Sending a notification is one of the operations performed by the action ( actions ) in Zabbix . So, to set up a notification, log into Zabbix console, select `Configuration > Actions` , then:

1. 8	Click `Create action` to enter the action editing page

- Name: Enter "Send To FlashDuty"

2. 9	Select `Operations` to update the notification user configurations for the three scenarios

- In the Operations configuration, click "Add" to enter the configuration window
- Send to users: Select the user created or configured above
- Send only to: Select the Flashduty media type
- Keep other configurations as default
- Click "Add" to complete the configuration of this item
- 12	Repeat the above steps to finalize the configuration for `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/8.avif" />

3. 11	Select `Operations` to update the notification content configurations for the three scenarios

- **In the Default Message configuration item, paste the following content after the default content**: FlashDuty will parse the corresponding text upon receiving the event to identify alert attribute information

```

-----FlashDuty Required Starts-----event_severity={TRIGGER.SEVERITY}||event_name={TRIGGER.NAME}||event_id={EVENT.ID}||event_tags={EVENT.TAGS}||event_ack={EVENT.ACK.STATUS}||event_value={EVENT.VALUE}||trigger_id={TRIGGER.ID}||trigger_desc={TRIGGER.DESCRIPTION}||trigger_expr={TRIGGER.EXPRESSION}||host_group={TRIGGER.HOSTGROUP.NAME}||host_ip={HOST.IP}||host_name={HOST.NAME}||item_name={ITEM.NAME}||item_value={ITEM.VALUE}-----FlashDuty Required Ends-----

```

- 12	Repeat the above steps to finalize the configuration for `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/9.avif" />

#### Step 4: Send events to Flashduty

Log in Zabbix Console, select Monitoring > Problems to view the latest alert list.

1. Click "Actions" to see the message notification results in the popup
2. Find the Flashduty corresponding log. If Status is Sent, it means the notification is successful. Otherwise, troubleshoot the cause according to the prompts

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/10.avif" />

3. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
4. Finish

## Status Comparison

Zabbix to Flashduty Alert Level Mapping Relationship:

| Zabbix         |  Flashduty  | state |
| -------------- | -------- | ---- |
| Disaster       | Critical | serious |
| High           | Critical | serious |
| Average        | Warning  | warn |
| Warning        | Warning  | warn |
| Information    | Info     | remind |
| Not classified | Info     | remind |