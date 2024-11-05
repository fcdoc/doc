---
brief: By integrating Feishu’s self-built applications, the ability to receive and respond to alerts within Feishu is achieved
---

# Feishu Lark Integration

By integrating Feishu’s self-built applications, the ability to receive and respond to alerts within the Feishu terminal is achieved.

## Create Feishu Application

### 1. Create a Self-Built Application

Visit [the Feishu developer backend](https://open.feishu.cn/app) to create a self-built application within the enterprise. (See Feishu development documentation for details - [Creating enterprise-built applications](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#132c1aac))

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/1.avif" alt="drawing" width="400"/>

The application icon can be the [Flashduty official icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

### 2. Copy Credential Information

Go to the **Credentials and Basic Information** page and copy the `App ID` and `App Secret` for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/2.avif" alt="drawing" width="800"/>

### 3. Copy the Token Information for Event Callbacks

Go to the **Development Configuration - Events and Callbacks - Encryption Strategy** page, and copy the `Encrypt Key` (recommended for better security) and `Verification Token` for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/3.avif" alt="drawing" width="800"/>

## Add Feishu Integration

Back to the Flashduty **Integration Center** page, select **Instant Messaging => Feishu**, fill in the __name__ and the `App ID`, `App Secret`, `Verification Token`, and `Encrypt Key` copied in the previous step in the form, and click Save to create.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/4.avif" alt="drawing" width="800"/>

After creation, you will see the Feishu integration you just added in the list. Click the name to enter the details, where you will see the **Web Configuration** URL, **Redirect URL**, and **Message Card Request URL**. These will be used in subsequent steps.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/5.avif" alt="drawing" width="800"/>

## Configure the Feishu Application

### 1. Enable and Configure Application Capabilities

1). Return to the Feishu developer backend, enter the Feishu application you just created, and go to the **Add Application Capabilities - Add by Capability** page. Enable both **Web Application** and **Robot** capabilities.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/6.avif" alt="drawing" width="800"/>

2). Go to the **Web Application** page and configure the __desktop homepage__ and __mobile homepage__. The content for both should be the **webpage configuration** URL from the integration details.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/7.avif" alt="drawing" width="800"/>

(See Feishu development documentation for details - [Configuring the Application Homepage URL](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#8366b844))

3). Go to the **Event Callback - Callback Configuration** page, configure the __message card request URL__ (which is the **message card request URL** from the integration details) and add the callback.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/8.avif" alt="drawing" width="800"/>
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/9.avif" alt="drawing" width="800"/>

### 2. Add Redirect URL to Feishu Application

Go to the **Security Settings** page and configure the __redirect URL__. The content should be the **redirect URL** from the integration details.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/10.avif" alt="drawing" width="800"/>

(See Feishu development documentation for details - [Configuring the Redirect URL](https://open.feishu.cn/document/uYjL24iN/uYjN3QjL2YzN04iN2cDN?lang=zh-CN#c863e533))

### 3. Apply for Application Permissions

Go to the **Permission Management** page and apply for the `im:chat` and `im:message` permissions. These permissions will allow the current application to access group chat information and send messages to group chats or individuals.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/11.avif" alt="drawing" width="800"/>

## Application Release and Usage

After completing the above steps, proceed to publish and use the application. It can be used after the administrator has reviewed it.
Note: The **Available Scope** requires special configuration and is recommended to be set to **All Employees**.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/12.avif" alt="drawing" width="800"/>

See Feishu development documentation for details - [Application Publishing and Usage](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step-4).

After the application is released, you can use the mobile /PC to access the application. You need to log in and associate your (Feishu <->Flashduty ) account for your first visit. You can use it without logging in later.

1. Mobile: On the mobile end, access the application through Feishu > Workbench > search for the application name > open the application to use the web application.
2. PC: On the desktop (PC) end, access the application through Feishu > Workbench > search for the application name > open the application to use the web application.

## Frequently Asked Questions

1. **The message cannot be delivered to the individual**, and the operation log indicates __Not associated with the application__?

- Go to Feishu > Workbench > search for the application name > open the application, complete a login and associate the (Feishu <-> Flashduty) account so that the system can obtain the user identity for message delivery

2. **The message card button click is invalid or reports an error**?

- Ensure the account has been associated. Go to Feishu > Workbench > search for the application name > open the application, complete a login and associate the (Feishu <-> Flashduty) account. If you have already logged in, try clicking the menu in the upper right corner, switch accounts, and log in again to link the account
- Ensure you have purchased enough licenses. The usage of licenses can be checked in the console > Expense Center

2. **The Feishu group chat list in the dispatch strategy is empty**?

- Go to Feishu, select the group chat session, and add the created Flashduty robot, as shown in the figure below:
- Return to the dispatch strategy configuration page, refresh, and select the group chat list again

<img alt="drawing" width="800" src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/13.avif" />
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/14.avif" alt="drawing" width="800"/>