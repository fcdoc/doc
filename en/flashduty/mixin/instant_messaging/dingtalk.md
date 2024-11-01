---
brief: By integrating with DingTalk's custom applications, the capability to receive and respond to alerts within the DingTalk client is achieved
---

# DingTalk Integration

By integrating with DingTalk's custom applications, the capability to receive and respond to alerts within the DingTalk client is achieved.

**(This document uses the new version of the DingTalk Open Platform as an example)**

## 1. Create a DingTalk Application

### 1. Create a Custom Application

Visit the [DingTalk Developer Console](https://open-dev.dingtalk.com/fe/app) - Application Development - Internal Enterprise Development to create an application. (For detailed steps, refer to the DingTalk development documentation - [Creating Internal Enterprise Applications - H5 Micro Applications](https://open.dingtalk.com/document/orgapp/microapplication-creation-and-release-process#title-ovn-666-1ty))

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/1.avif" alt="drawing" width="400"/>

The application icon can use the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

### 2. Copy the Enterprise CorpId

Click on the company in the upper right corner of the page and copy the `CorpId` from the drop-down menu for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/2.avif" alt="drawing" width="500"/>

### 3. Copy the Application Credential Information

Go to the **Credentials and Basic Information** page and copy the `AgentID`, `ClientID`, and `ClientSecret` for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/3.avif" alt="drawing" width="500"/>

### 4. Copy the Event Subscription Information

Go to the **Development Configuration - Events and Callbacks** page.

Generate **encryption aes_key** and **signature Token** for backup.

**(Note: After generating the aes_key and Token, please temporarily save this information elsewhere. The information will disappear once you leave the page and will be needed later)**

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/4.avif" alt="drawing" width="500"/>

## 2. Add DingTalk Integration

Flashduty to the **Integration Center** page, select Instant Messaging > , fill in **the integration name** and the application information copied in the previous step in the form, and click Save to create.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/5.avif" alt="drawing" width="400"/>

After saving, you will see the **web configuration** address, **server exit IP** address, and **event subscription request URL**. These will be used in the subsequent steps.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/6.avif" alt="drawing" width="400"/>

## 3. Configure the DingTalk Application

### 1. Add Cool Apps, Web Apps, and Bots
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/7.avif" alt="drawing" width="500"/>

1) On the **Cool Apps - Cool Apps List** page, click the **Create Cool App** button and select **Extend to Group Sessions**

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/8.avif" alt="drawing" width="500"/>

2) Enter the **Edit Cool App** page and complete the following steps:

2.1) In the first step, fill in the basic information. The icon can use the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/9.avif" alt="drawing" width="500"/>

2.2) In the second step, configure the functional design. Select **Group Quick Entry** and **Message Card** on the left. The group quick entry icon can use the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png). For the desktop and mobile access addresses, copy the **Cool App Web Address** from the integration details.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/10.avif" alt="drawing" width="500"/>

2.3) Skip the third step of function development and proceed to the fourth step **Preview and Publish**. Click the **Publish** button and confirm.

### 2. Configure Bots and Message Push

Enter the **Application Capabilities - Bots** page, open the bot configuration, fill in the name and upload the icon. The icon can use the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png) and save it.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/11.avif" alt="drawing" width="500"/>

### 3. Configure Application Address

Enter the **Application Capabilities - Web Application** page

1) Configure the **Application Homepage Address** and **PC Homepage Address**. The content should be the **Application Homepage Address** and **PC Homepage Address** from the integration details.

2) Click **Save** in the upper right corner.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/12.avif" alt="drawing" width="500"/>

### 4. Configure Event Subscription

1) **Develop configuration - Event subscription** page, configure **the request URL** , the content is **the event subscription request URL** in the integration details, **save it** after the configuration is completed.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/13.avif" alt="drawing" width="500"/>

2) Below the **save** button, select the three group session events: __ Group Session Change Group Name __ , __ Install Cool App in Group __ and __ Uninstall Cool App in Group __ , and **save them** after the configuration is completed.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/14.avif" alt="drawing" width="500"/>

### 5. Apply for Application Permissions

Enter the permission management page and apply for the `qyapi_chat_manage` and `qyapi_robot_sendmsg` permissions. These two permissions will allow the current application to obtain the group chat information it belongs to and the ability to send messages to group chats or individuals.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/15.avif" alt="drawing" width="600"/>

## 4. Application Release and Use

After completing the above steps, proceed to **Application Release - Version Management and Release** to create a new version and then publish it (note that the visibility should be set to all employees, otherwise others will not be able to use it)

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/16.avif" alt="drawing" width="500"/>
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/17.avif" alt="drawing" width="500"/>

After the application is released, you can use the mobile/PC version to access the application. The first time you visit, you need to log in and associate your (DingTalk <-> Flashduty) account. Subsequent visits can be made without logging in.

1. Mobile Version: On the mobile version, use DingTalk > Workbench > search for the application name > open the application to use the web application.
2. PC Version: On the desktop (PC) version, use DingTalk > Workbench > search for the application name > open the application to use the web application.

## 5. Frequently Asked Questions

1. **The message cannot be delivered to the individual**, the operation log indicates __Not Associated with the Application__?

- Go to DingTalk > Workbench > search for the application name > open the application, complete a login and associate your (DingTalk <-> Flashduty) account so that the system can obtain the user identity for message delivery

2. **The message card button click is invalid or reports an error?**

- Go to DingTalk > Workbench > search for the application name > open the application, complete a login and associate your (DingTalk <-> Flashduty) account. If you have already logged in, try clicking the menu in the upper right corner, switch accounts, and log in again to bind the account
- Ensure you have purchased enough licenses. The usage of licenses can be viewed in the console > Expense Center

2. **The distribution policy DingTalk group chat list is empty?**

- Go to DingTalk, select the group chat session and install the cool app, otherwise you will not be able to get the group chat list
- Return to the dispatch policy configuration page, refresh and select the group chat list again
- If you still cannot get the group chat list, try uninstalling the cool app in the group and retry the above steps. If it still doesn't work, please contact the customer or dedicated technical support

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/18.avif" alt="drawing" width="800"/>

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/19.avif" alt="drawing" width="800"/>