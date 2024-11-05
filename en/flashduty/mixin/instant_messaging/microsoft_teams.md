---
brief: By integrating third-party applications with Microsoft Teams, you can achieve the ability to receive and respond to alerts within Microsoft Teams
---

# Microsoft Teams Integration

By integrating third-party applications with Microsoft Teams, you can achieve the ability to receive and respond to alerts within Microsoft Teams.
## 1. Install the Application

Microsoft Teams integration is currently in the beta stage. Before connecting, you need to complete the following steps:

> [!WARN]
> This step must be completed by a Microsoft Teams administrator

### 1. Download the Application Package
Download [FlashDutyBot.zip](https://fcpub-1301667576.cos.ap-nanjing.myqcloud.com/flashduty/integration/microsoft-teams/FlashDutyBot.zip) to your local device

### 2. Upload the Application Package
Enter **Microsoft Teams, navigate to [ +Apps ] - [ Manage your apps ] - [ Upload an app ] - [ Upload an app to your org's app catalog ]** to upload the application package FlashDutyBot.zip

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/1.avif)

### 3. Configure Application Visibility
Go to the Microsoft Teams admin center, find the FlashDuty app, and adjust the app’s visibility to everyone (or your custom scope)

> [!NOTE]
> If the application status is [Blocked], please wait a moment and then refresh the page or modify it manually
![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/2.avif)

### 4. Check if the Installation Was Successful
Wait a few minutes, and organization members will be able to find this app integration under [ +Apps ] - [ Built for your org ]

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

## 2. Connect the Team

### 1. Add the FlashDuty Application to the Target Team

#### 1.1 Find the FlashDuty Application
If the application is not available, please contact your Microsoft Teams organization administrator
![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

#### 1.2 Add to the Target Team
> [!WARN]
> Note: This step must select the General Channel of the target Team; otherwise, incidents will not be sent to the Team

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/4.avif)

### 2. Send the Connection Command
@FlashDuty and send linkTeam {ID} to the added Team, then click "Link Now"

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/5.avif)

## 3. Connect Users

### 1. Add the FlashDuty Application

#### 1.1 Find the FlashDuty Application
If the application is not available, please contact your Microsoft Teams organization administrator
![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

#### 1.2 Click the Add Button
> [!WARN]
> Note: This step must select the General Channel of the target Team; otherwise, incidents will not be sent to the Team

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/6.avif)

### 2. Send the Connection Command
Copy the command: linkUser {} and send it to the chat, then click to connect immediately

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/7.avif)

## Frequently Asked Questions

|+| The team or individual is not receiving messages

    Please go to the integration center => Instant Messaging => Microsoft Teams to check if the team and user are successfully connected

|+| How to view connected teams and users

    Please go to the integration center => Instant Messaging => Microsoft Teams to view the connected teams and users

|+| How to cancel connected teams and users

    Not supported yet