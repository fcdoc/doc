---
brief: By integrating self-developed applications within DingTalk, the ability to receive and respond to alerts directly in the DingTalk client is achieved
---

# DingTalk Integration

By integrating self-developed DingTalk applications, the capability to receive and respond to alerts within the DingTalk client is realized.

**(This document uses the new version of the DingTalk Open Platform as an example.)**

## 1. Creating a DingTalk Application

### 1. Create a Self-Built Application

Visit [DingTalk Developer Backend](https://open-dev.dingtalk.com/fe/app) - Application Development - Intra-Enterprise Development to create an application. (For details, see the DingTalk Development Documentation - [Creating an Intra-Enterprise Application - H5 Micro-Application](https://open.dingtalk.com/document/orgapp/microapplication-creation-and-release-process#title-ovn-666-1ty).)

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/1.avif" alt="drawing" width="400"/>

The application icon can be the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

### 2. Copy the Enterprise CorpId

Click on the enterprise in the top right corner of the page and copy the `CorpId` from the dropdown menu for backup.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/2.avif" alt="drawing" width="500"/>

### 3. Copy Application Credential Information

Go to the **Credentials and Basic Information** page and copy the `AgentID`, `ClientID`, and `ClientSecret` for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/3.avif" alt="drawing" width="500"/>

### 4. Copy Event Subscription Information

Go to the **Development Configuration - Events and Callbacks** page.

Generate __encryption aes_key__ and __signature Token__ as a backup.

**(Note: After generating the aes_key and Token, please temporarily save the information in another location. The information will be lost after leaving the page and will be needed later.)**

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/4.avif" alt="drawing" width="500"/>

## 2. Adding DingTalk Integration

Flashduty to the **Integration Center** page, select Instant Messaging > , fill in **the integration name** and the application information copied in the previous step in the form, and click Save to create.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/5.avif" alt="drawing" width="400"/>

After saving, you will see information such as the **Web Configuration** address, **Server Exit IP** address, and **Event Subscription Request URL**, which will be used in the subsequent process.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/6.avif" alt="drawing" width="400"/>

## 3. Configuring the DingTalk Application

### 1. Add Cool Apps, Web Apps, and Bots
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/7.avif" alt="drawing" width="500"/>

1) On the **Cool Apps - Cool Apps List** page, click the **Create Cool App** button and choose to **Extend to Group Sessions**

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/8.avif" alt="drawing" width="500"/>

2) Go to the **Edit Cool App** page and complete the following steps:

2.1) First, fill in the basic information, and the icon can be the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/9.avif" alt="drawing" width="500"/>

2.2) Second, configure the functional design by selecting **Group Quick Entry** and **Message Card** on the left. The group quick entry icon can use the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png), and for desktop and mobile access addresses, please copy the **Cool App Web Address** from the integration details.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/10.avif" alt="drawing" width="500"/>

2.3) Skip the third step of function development and proceed to the fourth step, **Preview and Publish**, click the **Publish** button and confirm.

### 2. Configure Robots and Message Delivery

Enter the **Application Capabilities - Robot** page, enable the robot configuration, fill in the name, and upload an icon. The icon can be the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png), then save.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/11.avif" alt="drawing" width="500"/>

### 3. Configure Application Address

Enter the **Application Capabilities - Web Application** page

1) Configure the **Application Homepage Address** and **PC Homepage Address** with the content from the **Application Homepage Address** and **PC Homepage Address** in the integration details.

2) Click **Save** in the upper right corner.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/12.avif" alt="drawing" width="500"/>

### 4. Configure Event Subscription

1) On the **Development Configuration - Event Subscription** page, configure the **Request URL** with the content from the **Event Subscription Request URL** in the integration details, then **save** after the configuration is complete.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/13.avif" alt="drawing" width="500"/>

2) Below the **Save** button, select the three group session events: __Group Session Change Group Name__, __Install Cool App in Group__, and __Uninstall Cool App in Group__, and click **Save** after the configuration is complete.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/14.avif" alt="drawing" width="500"/>

### 5. Apply for Application Permissions

Enter the Permission Management page and apply for the `qyapi_chat_manage` and `qyapi_robot_sendmsg` permissions. These two permissions will allow the current application to obtain information about the groups it belongs to and the ability to send messages to groups or individuals.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/15.avif" alt="drawing" width="600"/>

## 4. Application Release and Usage

After completing the above steps, proceed with **Application Release - Version Management and Publishing**, create a new version, and then publish it (note that the visibility range should be set to all employees, otherwise others will not be able to use it)

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/16.avif" alt="drawing" width="500"/>
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/17.avif" alt="drawing" width="500"/>

After the application is released, you can use the mobile /PC to access the application. You need to log in and associate your (DingTalk <->Flashduty ) account for your first visit. You can use it without logging in later.

1. Mobile: On the mobile side, access the application through DingTalk > Workbench > search for the application name > open the application to use the web application.
2. PC: On the desktop (PC) side, access the application through DingTalk > Workbench > search for the application name > open the application to use the web application.

## 5. Frequently Asked Questions

1. **Message delivery to individuals is not possible**, with the operation record indicating __Not Associated with an Application__?

- Go to DingTalk > Workbench > search for the application name > open the application, complete a login, and associate the (DingTalk <-> Flashduty) account so that the system can obtain the user identity for message delivery

2. **Why is the message card button click ineffective or showing an error?**

- Go to DingTalk > Workbench > search for the application name > open the application, complete a login, and associate the (DingTalk <-> Flashduty) account. If you have already logged in, try clicking the top right menu, switch accounts, and log in again to bind the account
- Ensure you have purchased an adequate number of licenses. The status of used licenses can be viewed in the console > Expense Center

2. **Why is the distribution policy DingTalk group chat list empty?**

- Go to DingTalk, select a group chat session, and install the cool app; otherwise, you will not be able to obtain the group chat list
- Return to the distribution policy configuration page, refresh, and select the group chat list again
- If you still cannot obtain the group chat list, try uninstalling the cool app in the group and retry the above steps. If it still does not work, please contact customer or dedicated technical support

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/18.avif" alt="drawing" width="800"/>

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/dingtalk/19.avif" alt="drawing" width="800"/>