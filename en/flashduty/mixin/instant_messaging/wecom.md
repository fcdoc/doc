---
brief: By integrating third-party applications with Enterprise WeChat, the capability to receive and respond to alerts within the Enterprise WeChat app is achieved
---

# Enterprise WeChat Integration

By integrating third-party applications with Enterprise WeChat, the capability to receive and respond to alerts within the Enterprise WeChat app is achieved.

## 1. Install the Application

1. Visit [the enterprise WeChat management backend](/0) - **Application Management** - **Third Party** and select to add a third-party application

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/1.avif" alt="drawing" width="400"/>

2. Enter `flashduty` in the search bar, retrieve the application, and click the **Add** button

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/2.avif" alt="drawing" width="400"/>

3. Modify **the visible scope** of the application and recommend all employees or specific department nodes to prevent the scope from having to be modified when adding new members. Click **to agree to the above authorization and add it** to complete the installation.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/3.avif" alt="drawing" width="400"/>

4. Visit [the enterprise WeChat management backend](/0) - **My Enterprise** page, copy **the enterprise ID** as `Corp ID` on the current page and fill it into the integration configuration, click Save to complete the integration configuration.

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/4.avif" alt="drawing" width="400"/>

5. **Please note: Flashduty As an enterprise WeChat service provider, we provide you with a long-term free version of the `FlashDuty` application. This application needs to obtain the Enterprise WeChat interface calling license before it can be used (password-free login + messages). This license currently supports $ 60 day __ for free for up to __ . After that, we must purchase the Enterprise WeChat license for you before you can use it.**

## 2. Frequently Asked Questions

1. **Clicking the integration save button results in an error `authorize app first`?**

- Please check if you have completed the application installation steps, for example, whether you can see the `FlashDuty` application on the workbench
- Please check if you have correctly configured the `Corp ID`

2. **How to complete account linking? Or why does the message say __Not associated with the application__?**

- Log in to the enterprise WeChat client (both desktop and mobile), enter **the workbench** , find and enter application `FlashDuty`
- When entering the application for the first time, you need to log in - Select a member account, password or single sign-on. After successful login, `Flashduty` linkage to **the enterprise WeChat** account is completed.
- Subsequent logins to the application will be password-free

3. **How to send incident notifications?**

- You must refer to question 1 to complete the account association before sending notifications
- Go to the details page of a specific collaboration space - Dispatch Strategy. In the personal channel section, select Notification to Enterprise WeChat integration to complete the notification configuration
- It supports customizing the content of Enterprise WeChat notifications. You can go to the template management page to set a custom template. Note: **The maximum number of display lines in the custom area is 8. If it exceeds this limit, it will be truncated by Enterprise WeChat.**

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/wecom/5.avif" alt="drawing" width="400"/>

4. **How to handle alerts within WeChat?**

- Click on the card message to go directly to the alert details page
- Click **to start processing** and directly set alert to the **processing** status
- Click **to close directly** , and directly set alert to the **closed** state
- Click **Block for 2 hours** to directly block alert for 2 hours. If you want to block more time, click `...` in the upper right corner of the card for more blocking options.

5. **Why does the card message provide a <strong>status refresh</strong> button?**

- Enterprise WeChat limits card interactions to one update within 72 hours. Each button operation is an interaction
- When the status of the alert changes, Flashduty will request an update to the card content
- When the alert status changes frequently, the card may not be updated in real time due to exceeding the update limit. In this case, you can click the refresh button to get an opportunity to update the card status

6. **Mac How to open click card messages using <strong>the system default browser</strong> on the desktop?**

- The Mac desktop version uses the in-app browser to open links by default
- You can try the shortcut keys `ctrl` + `command` + `shift` + `d` to turn on debugging mode, and then select **debugging - browser, webView related - system browser to open the web page** to change the link opening mode. Use the same shortcut to turn off debug mode and keep settings.

7. **Why does the incident notification fail with the message __license not opened__?**

- Contact Flashduty customer service or dedicated support to purchase and activate it for you