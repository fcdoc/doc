---
brief: By integrating third-party applications with Microsoft Teams, the capability to receive and respond to alerts directly within Microsoft Teams is realized
---

# Microsoft Teams Integration

Through the integration of third-party applications in Microsoft Teams, the functionality to receive and respond to alerts within Microsoft Teams is enabled.
## 1. Install the Application

The Microsoft Teams integration is currently in the Beta phase. Before proceeding with the association, you need to complete the following actions:

> [!WARN]
> This step must be completed by a Microsoft Teams administrator

### 1. Download the Application Package
Download [FlashDutyBot.zip](https://fcpub-1301667576.cos.ap-nanjing.myqcloud.com/flashduty/integration/microsoft-teams/FlashDutyBot.zip) to your local machine

### 2. Upload the Application Package
Enter **Microsoft Teams jump to [ +Apps ] - [ Manage your apps ] - [ Upload an app ] - [ Upload an app to your org ' s app catalog ]** to upload the application package FlashDutyBot.zip

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/1.avif)

### 3. Configure Application Visibility
Enter the Microsoft Teams admin center, locate the FlashDuty app, and adjust the visibility scope of the app to everyone (or to your custom scope)

> [!NOTE]
> If you encounter a status of [Blocked] for the application, please wait a moment, refresh the page, or make changes manually
![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/2.avif)

### 4. Check if the addition was successful
Wait a few minutes, and organization members will be able to find this app integration under [+Apps] - [Built for your org]

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

## 2. Associate Teams

### 1. Add the FlashDuty app to the target Team

#### 1.1 Locate the FlashDuty app
If the app is not available, please contact your Microsoft Teams organization administrator
![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

#### 1.2 Add to the target Team
> [!WARN]
> Note: This step requires choosing the General Channel of the target Team; failing to do so will prevent incidents from being dispatched to the Team

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/4.avif)

### 2. Send the Association Command
@FlashDuty and send linkTeam {ID} to the added Team, then click to associate immediately

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/5.avif)

## 3. Associate Users

### 1. Add the FlashDuty app

#### 1.1 Locate the FlashDuty app
If the app is not available, please contact your Microsoft Teams organization administrator
![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/3.avif)

#### 1.2 Click the Add button
> [!WARN]
> Note: This step requires choosing the General Channel of the target Team; failing to do so will prevent incidents from being dispatched to the Team

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/6.avif)

### 2. Send the Association Command
Copy the command: linkUser {} and send it to the chat, then click to associate immediately

![](https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/microsoft_teams/7.avif)

## FAQs

|+| The team or individual is not receiving messages

    Please navigate to the Integration Center => Instant Messaging => Check if the teams and users in Microsoft Teams have been successfully associated

|+| How to view associated teams and users

    Please navigate to the Integration Center => Instant Messaging => View the associated Teams and associated users in Microsoft Teams

|+| How to disassociate teams and users

    Not supported yet