---
brief: By integrating Feishu’s self-built applications, the ability to receive and respond to alerts within Feishu is achieved
---

# Feishu Lark Integration

By integrating Feishu’s self-built applications, the ability to receive and respond to alerts within the Feishu terminal is achieved.

## 1. Create Feishu Application

### 1. Create a Self-Built Application

Visit [the Feishu developer backend](https://open.feishu.cn/app) to create a self-built application within the enterprise. (See Feishu development documentation for details - [Creating a self-built application](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#132c1aac))

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/1.avif" alt="drawing" width="400"/>

The application icon can be the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

### 2. Copy Credential Information

Go to the **Credentials and Basic Information** page and copy the `App ID` and `App Secret` for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/2.avif" alt="drawing" width="800"/>

### 3. Copy the Token Information for Event Callbacks

Go to the **Development Configuration - Events and Callbacks - Encryption Strategy** page, copy the `Encrypt Key` (recommended to enable for more security) and `Verification Token` for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/3.avif" alt="drawing" width="800"/>

## 2. Add Feishu Integration

Flashduty **Integration Center** 页面，选择 **Instant Messaging => Feishu**，在表单中填入 __名称__ 以及上一步复制的`App ID`、`App Secret`、`Verification Token` 和 `Encrypt Key`后，点击保存创建。

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/4.avif" alt="drawing" width="800"/>

After creation, you will see the Feishu integration you just added in the list. Click the name to enter the details, where you will see the **Web Configuration** address, **Redirect URL** address, and **Message Card Request URL**. These will be used in subsequent steps.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/5.avif" alt="drawing" width="800"/>

## 3. Configure the Feishu Application

### 1. Enable and Configure Application Capabilities

1). Return to the Feishu developer backend, enter the Feishu application you just created, and go to the **Add Application Capabilities - Add by Capability** page to enable both **Web Application** and **Robot** capabilities.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/6.avif" alt="drawing" width="800"/>

2). 前往 **Web Application** 页面，配置 __桌面端主页__ 和 __移动端主页__，内容均为集成详情中的 **网页配置** 地址。

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/7.avif" alt="drawing" width="800"/>

(See Feishu development documentation for details - [Configuring the Application Homepage Address](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#8366b844))

3). 前往 **Event Callback - Callback Configuration** 页面，配置 __消息卡片请求网址__(内容为集成详情中的 **消息卡片请求网址**)并添加回调。

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/8.avif" alt="drawing" width="800"/>
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/9.avif" alt="drawing" width="800"/>

### 2. Add Redirect URL to Feishu Application

进入 **Security Settings** 页面，配置 __重定向URL__，内容为集成详情中的 **重定向 URL**。

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/10.avif" alt="drawing" width="800"/>

(See Feishu development documentation for details - [Configuring the Redirect URL](https://open.feishu.cn/document/uYjL24iN/uYjN3QjL2YzN04iN2cDN?lang=zh-CN#c863e533))

### 3. Apply for Application Permissions

Go to the **Permission Management** page and apply for the `im:chat` and `im:message` permissions. These permissions will allow the current application to access group chat information and send messages to group chats or individuals.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/11.avif" alt="drawing" width="800"/>

## 4. Application Release and Use

After completing the above steps, proceed with the application’s release and usage. It can be used after the administrator has reviewed it.
Note: The **Available Scope** requires special configuration. It is recommended to set it to **All Employees**.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/12.avif" alt="drawing" width="800"/>

See Feishu development documentation for details - [Application Release and Usage](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step-4).

After the application is released, you can access it using the mobile/PC end. For the first visit, you need to log in and associate your (Feishu<->Flashduty) account. Subsequent visits can be made without logging in.

1. Mobile Version: On the mobile version, use Feishu > Workbench > search for the application name > open the application to use the web application.
2. PC Version: On the desktop (PC) version, use Feishu > Workbench > search for the application name > open the application to use the web application.

## 5. Frequently Asked Questions

1. **The message cannot be delivered to the individual**, the operation record prompts __Not Associated with the Application__?

- Go to Feishu > Workbench > search for the application name > open the application, complete a login and associate the (Feishu <-> Flashduty) account so that the system can obtain the user identity for message delivery

2. **Message card button click is invalid or reports an error**?

- Ensure the account has been linked. Go to Feishu > Workbench > search for the application name > open the application, complete a login and link the (Feishu <-> Flashduty) account. If you have already logged in, try clicking the menu in the upper right corner, switch accounts, and log in again to link the account
- Ensure you have purchased enough licenses. The usage of licenses can be viewed in the console > Expense Center

2. **The Feishu group chat list in the dispatch strategy is empty**?

- Go to Feishu, select the group chat session, and add the created Flashduty robot, as shown in the figure below:
- Return to the dispatch policy configuration page, refresh and select the group chat list again

<img alt="drawing" width="800" src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/13.avif" />
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/14.avif" alt="drawing" width="800"/>