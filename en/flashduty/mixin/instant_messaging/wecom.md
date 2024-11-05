---
brief: By integrating third-party applications with Enterprise WeChat, the ability to receive and respond to alerts within the Enterprise WeChat app is achieved
---

# Enterprise WeChat Integration

By integrating third-party applications with Enterprise WeChat, the ability to receive and respond to alerts within the Enterprise WeChat app is achieved.

## Install the Application

1. Visit [the Enterprise WeChat management backend](https://work.weixin.qq.com/wework_admin/frame#apps) - __Application Management__ - __Third Party__, and select to add a third-party application

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/1.avif" alt="drawing" width="400"/>

2. Enter `flashduty` in the search bar, find the application, and click the __Add__ button

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/2.avif" alt="drawing" width="400"/>

3. Modify the __Visible Scope__ of the application. It is recommended to set it for all employees or specific department nodes to prevent the need to modify the scope when new members are added. Click __Agree to the Above Authorization and Add__ to complete the installation

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/3.avif" alt="drawing" width="400"/>

4. Visit [the Enterprise WeChat management backend](https://work.weixin.qq.com/wework_admin/frame#apps) - __My Enterprise__ page, copy the __Enterprise ID__ and fill it in as the `Corp ID` in the integration configuration. Click Save to complete the integration configuration

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/4.avif" alt="drawing" width="400"/>

5. **Please note: As an Enterprise WeChat service provider, Flashduty offers you a long-term free version of the `FlashDuty` application. This application requires an Enterprise WeChat API call license to function (password-free login + message sending). This license currently supports __a maximum of 60 days__ for free. After this period, we must purchase the Enterprise WeChat license for you to continue using it.**

## Frequently Asked Questions

1. **Clicking the integration save button results in an error `authorize app first`?**

- Please check if you have completed the application installation steps, for example, whether you can see the `FlashDuty` application on the workbench
- Please check if you have correctly configured the `Corp ID`

2. **How to complete account linking? Or why does the message send prompt __Not Associated with the Application__?**

- Log in to the Enterprise WeChat client (both desktop and mobile versions), enter the __Workbench__, find and enter the `FlashDuty` application
- When entering the application for the first time, you need to log in. Choose a member account - password or single sign-on. After a successful login, the `Flashduty` to __Enterprise WeChat__ account association is completed
- Subsequent entries into the application will be password-free

3. **How to proceed with incident notifications?**

- You must refer to question 1 to complete the account association before sending notifications
- Enter the details page of a certain collaboration space - Dispatch Strategy. In the personal channel section, select Notification to Enterprise WeChat integration to complete the notification configuration
- It supports customizing the content of Enterprise WeChat notifications. You can go to the template management page to set a custom template. Note: **The maximum number of display lines in the custom area is 8. If it exceeds this limit, it will be truncated by Enterprise WeChat.**

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/5.avif" alt="drawing" width="400"/>

4. **How to handle alerts within WeChat?**

- Click on the card message to go directly to the alert details page
- Click __Start Processing__ to directly set the alert to the __Processing__ status
- Click __Directly Close__ to directly set the alert to the __Closed__ status
- Click __Block for 2 Hours__ to directly block the alert for 2 hours. If you want to block it for a longer time, click `...` in the upper right corner of the card for more blocking options

5. **Why does the card message provide a __Status Refresh__ button?**

- Enterprise WeChat limits a card interaction to one update within 72 hours. Each button operation is an interaction
- When the status of the alert changes, Flashduty will request an update to the card content
- When the alert status changes frequently, the card may not be updated in real time due to exceeding the update limit. In this case, you can click the refresh button to get an opportunity to update the card status

6. **How to open card messages using the __System Default Browser__ on a Mac desktop?**

- The Mac desktop version uses the in-app browser to open links by default
- You can try the shortcut keys `ctrl` + `command` + `shift` + `d` to enable debug mode, then select __Debug - Browser, WebView Related - System Browser to Open Web Page__ to change the link opening mode. Use the same shortcut to disable debug mode and keep the settings.

7. **Incident notification failed, prompting __License Not Activated__?**

- Contact Flashduty customer service or dedicated support to purchase and activate it for you