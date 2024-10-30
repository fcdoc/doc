---
brief: By integrating a self-built Feishu application, the ability to receive and respond to alerts within the Feishu platform is achieved
---

# Feishu Lark Integration

By integrating a self-built Feishu application, the ability to receive and respond to alerts within the Feishu platform is achieved.

## 1. Create a Feishu Application

### 1. Create a Self-Built Application

Visit [Feishu Developer Backend](https://open.feishu.cn/app) to create a self-built application within the enterprise. (For details, refer to the Feishu Development Documentation - [Creating an Enterprise Self-Built Application](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#132c1aac))

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/1.avif" alt="drawing" width="400"/>

The application icon can be the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

### 2. Copy Credential Information

Go to the **Credentials and Basic Information** page and copy the `App ID` and `App Secret` for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/2.avif" alt="drawing" width="800"/>

### 3. Copy the Event Callback Token Information

Go to the **Development Configuration - Events and Callbacks - Encryption Policy** page and copy the `Encrypt Key` (recommended for enhanced security) and `Verification Token` for backup.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/3.avif" alt="drawing" width="800"/>

## 2. Add Feishu Integration

Flashduty to the **Integration Center** page, select **Instant Messaging = >飞书**, fill in **the name** and the `App ID` , `App Secret` , `Verification Token` and `Encrypt Key` copied in the previous step in the form, and click Save to create.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/4.avif" alt="drawing" width="800"/>

After creation, the newly added Feishu integration will appear in the list. Click on the name to enter the details, where you will find the **Web Configuration** address, **Redirect URL**, and **Message Card Request URL** which will be used in the subsequent steps.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/5.avif" alt="drawing" width="800"/>

## 3. Configure the Feishu Application

### 1. Enable and Configure Application Capabilities

1). Return to the Feishu Developer Backend, enter the Feishu application you just created, navigate to the **Add Application Capabilities - Add by Capability** page, and simultaneously enable the **Web Application** and **Robot** capabilities.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/6.avif" alt="drawing" width="800"/>

2). Go to the **web application** page and configure **the desktop homepage** and **mobile homepage** . The content is the **webpage configuration** address in the integration details.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/7.avif" alt="drawing" width="800"/>

(For more details, refer to the Feishu Development Documentation - [Configuring the Application Home Page Address](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#8366b844))

3). Go to **the event callback - Callback configuration** page, configure **the message card request URL** (the content is **the message card request URL** in the integration details) and add a callback.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/8.avif" alt="drawing" width="800"/>
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/9.avif" alt="drawing" width="800"/>

### 2. Add a Redirect URL to the Feishu Application

Enter the **security settings** page, configure **redirection URL** the content is **redirection URL** in the integration details.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/10.avif" alt="drawing" width="800"/>

(For more details, refer to the Feishu Development Documentation - [Configuring Redirect URL](https://open.feishu.cn/document/uYjL24iN/uYjN3QjL2YzN04iN2cDN?lang=zh-CN#c863e533))

### 3. Apply for Application Permissions

Enter the **Permission Management** page and apply for the `im:chat` and `im:message` permissions. These two permissions will allow the current application to access information about the groups it belongs to and to send messages to groups or individuals.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/11.avif" alt="drawing" width="800"/>

## 4. Application Release and Usage

After completing the above steps, proceed with the application release and usage. The application can be used after it is reviewed by the administrator.
Note: The **Available Scope** requires special configuration, and it is recommended to set it to **All Employees**.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/12.avif" alt="drawing" width="800"/>

For more details, refer to the Feishu Development Documentation - [Application Release and Usage](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step-4).

After the application is released, you can use the mobile /PC to access the application. You need to log in and associate your (Feishu <->Flashduty ) account for your first visit. You can use it without logging in later.

1. Mobile: On the mobile side, access the application through Feishu > Workbench > search for the application name > open the application to use the web application.
2. PC: On the desktop (PC) side, access the application through Feishu > Workbench > search for the application name > open the application to use the web application.

## 5. Frequently Asked Questions

1. **Message delivery to individuals is not possible**, with the operation record indicating __Not Associated with an Application__?

- Go to Feishu > Workbench > search for the application name > open the application, complete a login, and associate the (Feishu <-> Flashduty) account so that the system can obtain the user identity for message delivery

2. **Message card buttons are not clickable or result in errors**?

- Ensure that the account has been associated. Go to Feishu > Workbench > search for the application name > open the application, complete a login, and associate the (Feishu <-> Flashduty) account. If you have already logged in, try clicking the menu in the upper right corner, switch accounts, and log in again to bind the account
- Ensure you have purchased an adequate number of licenses. The status of used licenses can be viewed in the console > Expense Center

2. **The Feishu group chat list is empty in the distribution strategy**?

- Go to Feishu, select a group chat session, and add the created Flashduty robot as shown in the figure below:
- Return to the distribution policy configuration page, refresh, and select the group chat list again

<img alt="drawing" width="800" src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/13.avif" />
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/14.avif" alt="drawing" width="800"/>