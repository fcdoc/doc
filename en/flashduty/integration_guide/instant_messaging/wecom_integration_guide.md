---
brief: By integrating third-party enterprise WeChat applications, the ability to receive and respond to alerts within the enterprise WeChat client is realized
---

# Enterprise WeChat Integration

---

By integrating third-party enterprise WeChat applications, the ability to receive and respond to alerts within the enterprise WeChat client is realized.

## 1. Install the Application
---

1. Visit [the enterprise WeChat management backend](/0) - **Application Management** - **Third Party** and select to add a third-party application

<img src="https://fcdoc.github.io/img/IgG_9fMWOSStyP-Mfy34i03HFthJ3GNqJhQ0h0wYKE8.avif" alt="drawing" width="400"/>

2. Enter `flashduty` in the search bar, retrieve the application, and click the **Add** button

<img src="https://fcdoc.github.io/img/FIPgCZNwraqFTID3vXd6xBQ2KpLSF6ba4IzwPLx-0EI.avif" alt="drawing" width="400"/>

3. Modify **the visible scope** of the application and recommend all employees or specific department nodes to prevent the scope from having to be modified when adding new members. Click **to agree to the above authorization and add it** to complete the installation.

<img src="https://fcdoc.github.io/img/q-OMKvZ372VP_Z9Ym2g63seLWgZjyfrmGQzZG27uJkA.avif" alt="drawing" width="400"/>

4. Visit [the enterprise WeChat management backend](/0) - **My Enterprise** page, copy **the enterprise ID** as `Corp ID` on the current page and fill it into the integration configuration, click Save to complete the integration configuration.

<img src="https://fcdoc.github.io/img/DZu7yYB2CXNegJm6ZkFdR3TcARZnoBvKY_LPgOPsIv0.avif" alt="drawing" width="400"/>

5. **Please note: Flashduty As an enterprise WeChat service provider, we provide you with a long-term free version of the `FlashDuty` application. This application needs to obtain the Enterprise WeChat interface calling license before it can be used (password-free login + messages). This license currently supports $ 60 day __ for free for up to __ . After that, we must purchase the Enterprise WeChat license for you before you can use it.**

## 2. Common Issues
---

1. **Upon clicking the integrated save button, an error `authorize app first` appears?**

- Please check if you have completed the application installation steps, such as whether you can see the `FlashDuty` application in the workspace
- Please check if you have correctly configured the `Corp ID`

2. **How to complete account linking? Or message sending prompt __ Not associated with the application __ ?**

- Log in to the enterprise WeChat client (both desktop and mobile), enter **the workbench** , find and enter application `FlashDuty`
- When entering the application for the first time, you need to log in - Select a member account, password or single sign-on. After successful login, `Flashduty` linkage to **the enterprise WeChat** account is completed.
- Subsequent entries into the application will be password-free

3. **How to send fault notifications?**

- You must first complete the account association as described in question 1 before sending notifications
- Enter the details page of a specific collaboration space - Dispatch Strategy, and under the personal channel section, select to notify the enterprise WeChat integration to complete the notification configuration
- Support for customizing the content of enterprise WeChat notifications is available. You can go to the template management page to set a custom template. Note: **The custom area can display a maximum of 8 lines. Content exceeding this limit will be truncated by enterprise WeChat.**

<img src="https://fcdoc.github.io/img/YJ3cNz2YnnC8zi44MUfat7CNuti0ntKvxzXD4eB2XlM.avif" alt="drawing" width="400"/>

4. **How to handle alerts within WeChat?**

- Click on the card message to directly go to the alert details page
- Click **to start processing** and directly set the alarm to **the processing** status.
- Click **Close directly** to directly set the alarm to the **closed** state.
- Click **Block for 2 hours** to directly block the alarm for 2 hours. If you want to block for more time, click `...` in the upper right corner of the card for more blocking options.

5. **Why does the card message provide a <strong>status refresh</strong> button?**

- Enterprise WeChat limits card interactions to one update every 72 hours. Each button operation counts as an interaction
- When the status of an alert changes, Flashduty will request an update to the card content
- When the alert status changes frequently, it may exceed the update limit, preventing the card from updating in real time. In such cases, you can click the refresh button to get one opportunity to update the card status

6. **Mac How to open click card messages using <strong>the system default browser</strong> on the desktop?**

- By default, the Mac desktop uses the in-app browser to open links
- You can try the shortcut keys `ctrl` + `command` + `shift` + `d` to turn on debugging mode, and then select **debug - browser, webView related - system browser to open the web page** to change the link opening mode. Use the same shortcut to turn off debug mode and keep settings.

7. **Fault notification failed, prompt __ Enterprise WeChat license __ has not been activated?**

- Contact Flashduty customer service or dedicated support to purchase and activate the license for you