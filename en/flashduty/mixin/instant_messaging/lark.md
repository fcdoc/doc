---
brief: By integrating Feishu’s self-built applications, the ability to receive and respond to alerts within Feishu is achieved
---

# Feishu Lark Integration

By integrating Feishu’s self-built applications, the ability to receive and respond to alerts within the Feishu client is achieved.

## 1. Create Feishu Application

### 1. Create a Custom Application

Visit [the Feishu developer backend](https://open.feishu.cn/app) to create a self-built application within your enterprise. (See Feishu development documentation for details - [Creating a self-built enterprise application](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#132c1aac))

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/1.avif" alt="drawing" width="400"/>

The application icon can use the [Flashduty Official Icon](https://download.flashcat.cloud/flashcat_logo_circular.png).

### 2. Copy Credential Information

Go to the **Credentials and Basic Information** page and copy the `App ID` and `App Secret` for later use.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/2.avif" alt="drawing" width="800"/>

### 3. Copy the Token Information for Event Callbacks

Go to the **Development Configuration - Events and Callbacks - Encryption Strategy** page, and copy the `Encrypt Key` (recommended for enhanced security) and `Verification Token` for backup.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/3.avif" alt="drawing" width="800"/>

## 2. Add Feishu Integration

Flashduty to the **Integration Center** page, select **Instant Messaging = >飞书**, fill in **the name** and the `App ID` , `App Secret` , `Verification Token` and `Encrypt Key` copied in the previous step in the form, and click Save to create.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/4.avif" alt="drawing" width="800"/>

After creation, you will see the Feishu integration you just added in the list. Click the name to enter the details, where you will find the **web configuration** address, **redirect URL** address, and **message card request URL**. These will be used in subsequent steps.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/5.avif" alt="drawing" width="800"/>

## 3. Configure the Feishu Application

### 1. Enable and Configure Application Capabilities

1). Return to the Feishu developer backend, enter the Feishu application you just created, and go to the **Add Application Capabilities - Add by Capability** page. Enable both **Web Application** and **Robot** capabilities.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/6.avif" alt="drawing" width="800"/>

2). Go to the **web application** page and configure **the desktop homepage** and **mobile homepage** . The content is the **webpage configuration** address in the integration details.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/7.avif" alt="drawing" width="800"/>

(See Feishu development documentation for details - [Configuring the application homepage URL](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step1#8366b844))

3). Go to **the event callback - Callback configuration** page, configure **the message card request URL** (the content is **the message card request URL** in the integration details) and add a callback.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/8.avif" alt="drawing" width="800"/>
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/9.avif" alt="drawing" width="800"/>

### 2. Add Redirect URL to Feishu Application

Enter the **security settings** page, configure **redirection URL** the content is **redirection URL** in the integration details.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/10.avif" alt="drawing" width="800"/>

(See Feishu development documentation for details - [Configuring the redirect URL](https://open.feishu.cn/document/uYjL24iN/uYjN3QjL2YzN04iN2cDN?lang=zh-CN#c863e533))

### 3. Apply for Application Permissions

Go to the **Permission Management** page and apply for the `im:chat` and `im:message` permissions. These permissions will allow the current application to access group chat information and send messages to group chats or individuals.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/11.avif" alt="drawing" width="800"/>

## 4. Application Release and Use

After completing the above steps, proceed with the application’s release and usage. It can be used after the administrator’s review.
Note: The **Available Scope** requires special configuration and is recommended to be set to **All Employees**.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/12.avif" alt="drawing" width="800"/>

See Feishu development documentation for details - [Application publishing and usage](https://open.feishu.cn/document/uYjL24iN/uMTMuMTMuMTM/development-guide/step-4).

After the application is released, you can use the mobile /PC to access the application. You need to log in and associate your (Feishu <->Flashduty ) account for your first visit. You can use it without logging in later.

1. Mobile: On the mobile version, use Feishu > Workbench > search for the application name > open the application to use the web application.
2. PC: On the desktop (PC) version, use Feishu > Workbench > search for the application name > open the application to use the web application.

## 5. Frequently Asked Questions

1. **The message cannot be delivered to the individual**, the operation log indicates __Not Associated with the Application__?

- Go to Feishu > Workbench > search for the application name > open the application, complete a login and associate your (Feishu <-> Flashduty) account so that the system can obtain the user identity for message delivery

2. **The message card button click is invalid or reports an error**?

- Ensure that the account has been linked. Go to Feishu > Workbench > search for the application name > open the application, complete a login and associate your (Feishu <-> Flashduty) account. If you have already logged in, try clicking the menu in the upper right corner, switch accounts, and log in again to bind the account
- Ensure you have purchased enough licenses. The usage of licenses can be viewed in the console > Expense Center

2. **The Feishu group chat list in the dispatch strategy is empty**?

- Go to Feishu, select the group chat session, and add the created Flashduty robot, as shown in the figure below:
- Return to the dispatch policy configuration page, refresh and select the group chat list again

<img alt="drawing" width="800" src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/13.avif" />
<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/lark/14.avif" alt="drawing" width="800"/>