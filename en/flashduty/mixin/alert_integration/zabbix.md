---
brief: >-
  Synchronize Zabbix alert to Flashduty via webhook (support Zabbix 3.x ~ 6.x
  version (the configuration of different versions is different) to realize automatic noise reduction processing of alert events.
---

# Zabbix Integration

Through webhook, synchronize Zabbix alert events to Flashduty (supports Zabbix 3.x ~ 6.x versions; configurations differ across versions) to achieve automated noise reduction of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods; choose either one.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Zabbix** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information of the alert event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Select the **Zabbix** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Complete.

## In Zabbix
<span id="v5"></span>

### 5.x ~ 6.x Versions

#### Step 1: Define the Flashduty Media Type

1. A media type is a transmission channel in Zabbix used to send notifications and alerts. Enter the terminal and download the complete configuration using the following command:

```i18n
// 5.x Version XML Configuration:
wget https://download.flashcat.cloud/flashduty/integration/zabbix/zbx_mediatype_flashcat_v5.xml

// 6.x Version YAML Configuration:
wget https://download.flashcat.cloud/flashduty/integration/zabbix/zbx_mediatype_flashcat_v6.yml
```

2. Log in to the Zabbix console, select `Administration > Media Types`, click the Import button in the upper right corner, enter the edit page, select the configuration file downloaded above, and click the Import button to complete the import
3. Return to the Media Types page, and you will see the imported media type. Click on the name to enter the edit page and complete the URL, zabbix_url, and HTTPProxy fields:

- `URL`: The webhook push request address; just copy the integrated push address
- `zabbix_url`: The Zabbix console address; just copy it (if your page is configured with a tomcat/nginx forwarding path, include it as well). The system will append parameters like trigger_id to the path to generate the alert details page link
- `HTTPProxy`: If your Zabbix Server cannot directly access the Flashduty service, set this parameter to a proxy address

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/1.avif" />

4. Click Update to save the configuration

#### Step 2: Associate the Media Type with a User

The media type must be associated with a user to send events. The user must have at least read permission on the host. It is recommended to link it directly to the Admin user. For example, using the Admin user:

1. Log in to the Zabbix console, select `Administration > Users`, select the Admin user, select media, select Add, and enter the edit window:

- Type: Select the Flashduty media type created above
- Send To: Fill in N/A
- Other configurations use the default settings and remain unchanged

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/2.avif" />

2. Click the Add button to exit the add media window
3. Click the Update button to exit the edit user page

#### Step 3: Create an Action

Sending a notification is one of the operations performed by the action ( actions ) in Zabbix . So, to set up a notification, log into Zabbix console, select `Configuration > Actions` , then:

1. Click `Create action` to enter the action edit page

- Name: Fill in "Send To FlashDuty"

2. Select `Operations` and add notification sending configurations for three scenarios:

- In the Operations configuration item, click the Add button to enter the configuration window
- Send to users: Select the user created or configured above
- Send only to: Select the Flashduty media type
- Keep other configurations as default
- Click the Add button to complete the configuration of this item
- Repeat the above steps to complete the configurations for `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/3.avif" />
<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/4.avif" />

#### Step 4: Send Events to Flashduty

Log in to the Zabbix console, select `Monitoring > Problems` to view the latest alert list.

1. Click Actions, and you can see the message notification results in the pop-up window
2. Find the corresponding Flashduty log. If the Status is `Sent`, it means the notification was successful. Otherwise, troubleshoot the issue based on the prompts

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/5.avif" />

3. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
4. Complete

<span id="v4"></span>

### 3.x ~ 4.x Versions

#### Step 1: Define the Flashduty Media Type

1. Log in to the Zabbix console, select `Administration > Media Types`, click the `Create media type` button in the upper right corner to enter the edit page
2. On the edit page, set Type to `Script`, and fill in the parameters in the following order (do not change the order; leave blank if there is no value; the script retrieves parameter values in order):

- `{ALERT.SUBJECT}`: Alert title, keep it as the first parameter
- `{ALERT.MESSAGE}`: Alert message, keep it as the second parameter

- **FlashDuty webhook Push request address** , just copy the integrated push address and keep it in the third parameter
- **Zabbix Console address** , just copy it directly (if your page is configured with tomcat/nginx path, please bring it with you at the same time), which is used to generate alert details page connection. If it is not empty, keep it in the fourth parameter
- `HTTPProxy`: If your Zabbix Server cannot directly access the Flashduty service, set this parameter to a proxy address. If it is not applicable, leave it blank and keep it as the fifth parameter

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/6.avif"/>

3. `Script name`: Fill in `send-to-flashduty.sh`
4. Click Update to save the configuration
5. Log in to the server where the Zabbix server is located and execute the following commands:

```i18n

#1. Enter the alert script loading directory (the specific path is configured in the Zabbix Server configuration file under the `AlertScriptsPath` variable, usually `/usr/lib/zabbix/alertscripts`)
cd /usr/lib/zabbix/alertscripts

#2. Download the script
wget https://download.flashcat.cloud/flashduty/integration/zabbix/send-to-flashduty.sh

#3. Change the script to an executable state
chmod +x send-to-flashduty.sh

```

6. Note that **the curl and jq commands are used in the script** . Make sure that the Zabbix server process can find and execute these two commands. If not, you need to install them according to the situation.

#### Step 2: Associate the Media Type with a User

The media type must be associated with a user to send events. The user must have at least read permission on the host. It is recommended to link it directly to the Admin user. For example, using the Admin user:

1. Log in to the Zabbix console, select `Administration > Users`, select the Admin user, select media, select Add, and enter the edit window:

- Type: Select the Flashduty media type created above
- Send To: Fill in N/A
- Other configurations use the default settings and remain unchanged

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/7.avif" />

2. Click the Add button to exit the add media window
3. Click the Update button to exit the edit user page

#### Step 3: Create an Action

Sending a notification is one of the operations performed by the action ( actions ) in Zabbix . So, to set up a notification, log into Zabbix console, select `Configuration > Actions` , then:

1. Click `Create action` to enter the action edit page

- Name: Fill in "Send To FlashDuty"

2. Select `Operations` and update the notification user configurations for the three scenarios:

- In the Operations configuration item, click the Add button to enter the configuration window
- Send to users: Select the user created or configured above
- Send only to: Select the Flashduty media type
- Keep other configurations as default
- Click the Add button to complete the configuration of this item
- Repeat the above steps to complete the configurations for `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/8.avif" />

3. Select `Operations` and update the notification content configurations for the three scenarios:

- **In the Default Message configuration item, copy the following content completely and paste it after the default content**. FlashDuty will parse the corresponding text to find the alert attribute information:

```

-----FlashDuty Required Starts-----event_severity={TRIGGER.SEVERITY}||event_name={TRIGGER.NAME}||event_id={EVENT.ID}||event_tags={EVENT.TAGS}||event_ack={EVENT.ACK.STATUS}||event_value={EVENT.VALUE}||trigger_id={TRIGGER.ID}||trigger_desc={TRIGGER.DESCRIPTION}||trigger_expr={TRIGGER.EXPRESSION}||host_group={TRIGGER.HOSTGROUP.NAME}||host_ip={HOST.IP}||host_name={HOST.NAME}||item_name={ITEM.NAME}||item_value={ITEM.VALUE}-----FlashDuty Required Ends-----

```

- Repeat the above steps to complete the configurations for `Recovery operations` and `Update operations`

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/9.avif" />

#### Step 4: Send Events to Flashduty

Log in Zabbix Console, select Monitoring > Problems to view the latest alert list.

1. Click Actions, and you can see the message notification results in the pop-up window
2. Find the corresponding Flashduty log. If the status is "Sent," it indicates the notification was successful. Otherwise, troubleshoot based on the provided prompts

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/zabbix/10.avif" />

3. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
4. Complete

## Status Comparison

Zabbix to Flashduty alert level mapping:

| Zabbix         |  Flashduty  | Status |
| -------------- | -------- | ---- |
| Disaster       | Critical | Critical |
| High           | Critical | Critical |
| Average        | Warning  | Warning |
| Warning        | Warning  | Warning |
| Information    | Info     | Information |
| Not classified | Info     | Information |