---
brief: >-
  Synchronize Zabbix alert to Flashduty via webhook (support Zabbix 3.x ~ 6.x
  version (the configuration of different versions is different) to realize automatic noise reduction processing of alert events.
---

# Zabbix Integration

Synchronize Zabbix alerts to Flashduty via webhook (supports Zabbix 3.x ~ 6.x versions; configurations differ between versions) to achieve automatic noise reduction of alert events.

## In Flashduty
Use Dedicated Integration

### Use Proprietary Integrations

Expand

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select **Zabbix** integration, click **Save**, and generate a card
    3. Select **Zabbix** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and complete.

### Use Shared Integrations

Expand

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. **Integration Name**: Define a name for the current integration
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **Push Address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. In Zabbix

## x ~ 6.x Versions
<span id="v5"></span>

### Step 1: Define Flashduty Media Type

#### Step 1: Define Flashduty Media Type

1. x Version XML Configuration:

```i18n
// x Version YAML Configuration:
wget https://download.flashcat.cloud/flashduty/integration/zabbix/zbx_mediatype_flashcat_v5.xml

// Version 6.x YAML configuration:
wget https://download.flashcat.cloud/flashduty/integration/zabbix/zbx_mediatype_flashcat_v6.yml
```

2. Log in to the Zabbix console, select `Administration > Media Types`, click the Import button in the upper right corner to enter the editing page, select the configuration file downloaded above, and click the Import button to complete the import
3. Return to the Media Types page, you can see the imported media type. Click on the name to enter the editing page and complete the URL, zabbix_url, and HTTPProxy fields:

- `URL`: Webhook push request address, copy the integration's push address
- `zabbix_url`: Zabbix console address, copy it directly (if your page is configured with a tomcat/nginx forwarding path, include it as well). The system will append trigger_id and other parameters to the path to generate the alert details page link
- `HTTPProxy`: If your Zabbix Server cannot directly access the Flashduty service, set this parameter to a proxy address

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/1.avif" />

4. Step 2: Associate Media Type with User

#### Step 2: Associate Media Type with User

The media type must be associated with a user to send events. The user must have at least read permission on the host. It is recommended to link it directly to the Admin user. For example, with the Admin user:

1. Log in to the Zabbix console, select `Administration > Users`, select the Admin user, select media, select Add, and enter the editing window:

- Type: Select the Flashduty media type created above
- Send To: Fill in N/A
- Click the Add button to exit the add media window

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/2.avif" />

2. Click the Update button to exit the edit user page
3. Step 3: Create Action

#### Step 3: Create Action

Sending a notification is one of the operations performed by the action ( actions ) in Zabbix . So, to set up a notification, log into Zabbix console, select `Configuration > Actions` , then:

1. Click `Create action` to enter the action editing page

- Name: Fill in "Send To FlashDuty"

2. Select `Operations` and add notification sending configurations for three scenarios:

- Send to users: Select the user created or configured above
- Send only to: Select the Flashduty media type
- Keep other configurations as default
- Click the Add button to complete the configuration of this item
- Click the Add button to complete the configuration of this item
- Repeat the above steps to complete the configuration of `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/3.avif" />
<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/4.avif" />

#### Step 4: Send Events to Flashduty

Log in to the Zabbix console, select `Monitoring > Problems` to view the latest alert list.

1. Click Actions, and you can see the message notification results in the pop-up window
2. Find the corresponding Flashduty log. If the Status is `Sent`, it means the notification was successful. Otherwise, troubleshoot the issue based on the prompts

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/5.avif" />

3. Complete
4. x ~ 4.x Versions

<span id="v4"></span>

### Step 1: Define Flashduty Media Type

#### Step 1: Define Flashduty Media Type

1. Log in to the Zabbix console, select `Administration > Media Types`, click the `Create media type` button in the upper right corner to enter the editing page
2. On the editing page, select `Script` for Type, and fill in the following parameters in order (do not change the order; leave blank if there is no value, as the script retrieves parameter values in order):

- `{ALERT.MESSAGE}`: Alert message, keep it as the second parameter
- `{ALERT.MESSAGE}`: Alert information, keep it as the second parameter

- **FlashDuty webhook Push request address** , just copy the integrated push address and keep it in the third parameter
- **Zabbix Console address** , just copy it directly (if your page is configured with tomcat/nginx path, please bring it with you at the same time), which is used to generate alert details page connection. If it is not empty, keep it in the fourth parameter
- `HTTPProxy`: If your Zabbix Server cannot directly access the Flashduty service, set this parameter to a proxy address. If it is not applicable, leave it blank and keep it as the fifth parameter

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/6.avif"/>

3. `Script name`: `send-to-flashduty.sh`
4. Click Update to save the configuration
5. Log in to the server where Zabbix server is located and execute the following commands:

```i18n

#1. Enter the alert script loading directory (the specific path is configured in the Zabbix Server configuration file under the `AlertScriptsPath` variable, usually `/usr/lib/zabbix/alertscripts`)
cd /usr/lib/zabbix/alertscripts

#Change the script to an executable state
wget https://download.flashcat.cloud/flashduty/integration/zabbix/send-to-flashduty.sh

#3. Change the script to executable state
chmod +x send-to-flashduty.sh

```

6. Note that **the curl and jq commands are used in the script** . Make sure that the Zabbix server process can find and execute these two commands. If not, you need to install them according to the situation.

#### Step 2: Associate Media Type with User

The media type must be associated with a user to send events. The user must have at least read permission on the host. It is recommended to link it directly to the Admin user. For example, with the Admin user:

1. Log in to the Zabbix console, select `Administration > Users`, select the Admin user, select media, select Add, and enter the editing window:

- Type: Select the Flashduty media type created above
- Send To: Fill in N/A
- Click the Add button to exit the add media window

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/7.avif" />

2. Click the Update button to exit the edit user page
3. Step 3: Create Action

#### Step 3: Create Action

Sending a notification is one of the operations performed by the action ( actions ) in Zabbix . So, to set up a notification, log into Zabbix console, select `Configuration > Actions` , then:

1. Click `Create action` to enter the action editing page

- Name: Fill in "Send To FlashDuty"

2. Select `Operations` and update the notification user configurations for the three scenarios:

- Send to users: Select the user created or configured above
- Send only to: Select the Flashduty media type
- Keep other configurations as default
- Click the Add button to complete the configuration of this item
- Click the Add button to complete the configuration of this item
- Repeat the above steps to complete the configuration of `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/8.avif" />

3. Select `Operations` and update the notification content configurations for the three scenarios:

- **In the Default Message configuration item, copy the following content completely and paste it after the default content**. FlashDuty will parse the corresponding text to find the alert attribute information:

```

-----FlashDuty Required Starts-----event_severity={TRIGGER.SEVERITY}||event_name={TRIGGER.NAME}||event_id={EVENT.ID}||event_tags={EVENT.TAGS}||event_ack={EVENT.ACK.STATUS}||event_value={EVENT.VALUE}||trigger_id={TRIGGER.ID}||trigger_desc={TRIGGER.DESCRIPTION}||trigger_expr={TRIGGER.EXPRESSION}||host_group={TRIGGER.HOSTGROUP.NAME}||host_ip={HOST.IP}||host_name={HOST.NAME}||item_name={ITEM.NAME}||item_value={ITEM.VALUE}-----FlashDuty Required Ends-----

```

- Repeat the above steps to complete the configuration of `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/9.avif" />

#### Step 4: Send Events to Flashduty

Log in Zabbix Console, select Monitoring > Problems to view the latest alert list.

1. Click Actions, and you can see the message notification results in the pop-up window
2. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/10.avif" />

3. Complete
4. Status Comparison

## Status Comparison

Status

| Zabbix         |  Flashduty  | Critical |
| -------------- | -------- | ---- |
| Disaster       | Critical | Critical |
| High           | Critical | High |
| Average        | Warning  | High |
| Warning        | Warning  | Warning |
| Information    | Info     | Warning |
| Not classified | Info     | Information |