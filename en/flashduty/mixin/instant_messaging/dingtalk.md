---
brief: By integrating DingTalk’s self-built applications, the ability to receive and respond to alerts within the DingTalk terminal is achieved
---

# DingTalk Integration

By integrating DingTalk's self-built applications, the ability to receive and respond to alerts within the DingTalk terminal is achieved.

**(This document uses the new version of the DingTalk Open Platform as an example)**

## Create DingTalk Application

### 1. Create a Self-Built Application

Visit [the DingTalk developer backend](https://open-dev.dingtalk.com/fe/app) - Application Development - Internal Enterprise Development, and create an application. (For details, refer to the DingTalk development documentation - [Creating Internal Enterprise Applications - H5 Micro Applications](https://open.dingtalk.com/document/orgapp/microapplication-creation-and-release-process#title-ovn-666-1ty))

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/1.avif" alt="drawing" width="400"/>

The application icon can use the [Flashduty official icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

### 2. Copy the Enterprise CorpId

Click on the company in the upper right corner of the page, and in the drop-down menu, copy the `CorpId` for backup.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/2.avif" alt="drawing" width="500"/>

### 3. Copy Application Credential Information

Go to the **Credentials and Basic Information** page and copy the `AgentID`, `ClientID`, and `ClientSecret` for later use.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/3.avif" alt="drawing" width="500"/>

### 4. Copy Event Subscription Information

Go to the **Development Configuration - Events and Callbacks** page.

Generate **encryption aes_key** and **signature Token** for backup.

**(Note: After generating the aes_key and Token, please temporarily save the information elsewhere. The information will disappear after leaving the page and will be needed later)**

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/4.avif" alt="drawing" width="500"/>

## Add DingTalk Integration

Flashduty to the **Integration Center** page, select Instant Messaging > , fill in **the integration name** and the application information copied in the previous step in the form, and click Save to create.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/5.avif" alt="drawing" width="400"/>

After saving, you will see the **web configuration** address, **server exit IP** address, and **event subscription request URL**. These will be used in the subsequent process.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/6.avif" alt="drawing" width="400"/>

## Configure DingTalk Application

### 1. Add Cool Apps, Web Apps, and Bots
<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/7.avif" alt="drawing" width="500"/>

1) On the **Cool Apps - Cool Apps List** page, click the **Create Cool App** button and select **Extend to Group Sessions**

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/8.avif" alt="drawing" width="500"/>

2) Enter the **Edit Cool App** page and complete the following steps:

2.1) The first step is to fill in the basic information. The icon can use the [Flashduty official icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/9.avif" alt="drawing" width="500"/>

2.2) The second step is to configure the functional design. Select **Group Quick Entry** and **Message Card** on the left. The group quick entry icon can use the [Flashduty official icon](https://download.flashcat.cloud/flashcat_logo_circular.png). For desktop and mobile access addresses, copy the **Cool App Web Address** from the integration details.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/10.avif" alt="drawing" width="500"/>

2.3) Skip the third step of function development, and go to the fourth step **Preview and Publish**. Click the **Publish** button and confirm.

### 2. Configure Bots and Message Push

Enter the **Application Capabilities - Bots** page, open the bot configuration, fill in the name and upload the icon. The icon can use the [Flashduty official icon](https://download.flashcat.cloud/flashcat_logo_circular.png) and save it.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/11.avif" alt="drawing" width="500"/>

### 3. Configure Application Address

Enter the **Application Capabilities - Web Application** page

1) Configure the **application homepage address** and **PC homepage address**. The content should be the **application homepage address** and **PC homepage address** from the integration details.

2) Click **Save** in the upper right corner.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/12.avif" alt="drawing" width="500"/>

### 4. Configure Event Subscription

1) On the **Development Configuration - Event Subscription** page, configure the **request URL** with the **event subscription request URL** from the integration details, and **save** after the configuration is completed.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/13.avif" alt="drawing" width="500"/>

2) Below the **save** button, select the three group session events: __ Group Session Change Group Name __ , __ Install Cool App in Group __ and __ Uninstall Cool App in Group __ , and **save them** after the configuration is completed.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/14.avif" alt="drawing" width="500"/>

### 5. Apply for Application Permissions

Enter the permission management page and apply for the `qyapi_chat_manage` and `qyapi_robot_sendmsg` permissions. These two permissions will allow the current application to obtain the group chat information it belongs to and the ability to send messages to group chats or individuals.

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/15.avif" alt="drawing" width="600"/>

## Application Release and Use

After completing the above steps, proceed to **Application Release - Version Management and Release**, create a new version, and then publish it (note that the visibility range should be set to all employees, otherwise others will not be able to use it)

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/16.avif" alt="drawing" width="500"/>
<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/17.avif" alt="drawing" width="500"/>

After the application is released, you can use the mobile/PC version to access the application. The first visit requires logging in and associating the (DingTalk <-> Flashduty) account. Subsequent visits can be made without logging in.

1. Mobile Version: On the mobile version, access the application through DingTalk > Workbench > search for the application name > open the application to use the web application.
2. PC Version: On the desktop (PC) version, access the application through DingTalk > Workbench > search for the application name > open the application to use the web application.

## Frequently Asked Questions

1. **Message cannot be delivered to an individual**, operation record prompts __Not Associated with Application__?

- Go to DingTalk > Workbench > search for the application name > open the application, complete a login and associate the (DingTalk <-> Flashduty) account so that the system can obtain the user identity for message push

2. **Message card button click is invalid or reports an error?**

- Go to DingTalk > Workbench > search for the application name > open the application, complete a login and associate the (DingTalk <-> Flashduty) account. If you have already logged in, try clicking the menu in the upper right corner, switch accounts, and log in again to bind the account
- Ensure you have purchased enough licenses. The usage of licenses can be viewed in the console > Expense Center

2. **Distribution policy DingTalk group chat list is empty?**

- Go to DingTalk, select the group chat session, and install the cool app; otherwise, you will not be able to get the group chat list
- Return to the dispatch policy configuration page, refresh, and select the group chat list again
- If you still cannot get the group chat list, try uninstalling the cool app in the group and retry the above steps. If it still doesn't work, please contact the customer or dedicated technical support

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/18.avif" alt="drawing" width="800"/>

<img src="https://fc.3ti.site/zh/flashduty/mixin/instant_messaging/dingtalk/19.avif" alt="drawing" width="800"/>