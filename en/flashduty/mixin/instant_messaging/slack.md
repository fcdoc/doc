---
brief: By integrating third-party Slack applications, the ability to receive and respond to alerts within Slack is achieved
---

# Slack Integration

By integrating third-party Slack applications, the ability to receive and respond to alerts within Slack is achieved.

## 1. Install the Application

1. Visit FlashDuty **Integration** **Center** - - `Slack` - **add**

2. The page jumps to the interface of Slack select **the workspace** in the upper right corner, and then click **Allow**

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/slack/1.avif" alt="drawing" width="400"/>

3. Enter the data source name and click **Save**

## 2. Frequently Asked Questions

1. **The desired private channel is not in the group chat list of the dispatch policy**
- To add an application to a channel, you need to **install the application** in step 1. No error is reported.
- Enter the channel related to slack , execute `/invite @FlashDuty` , it will prompt that **you have joined** or **it has been added from xx to xxx** , indicating that the addition is successful

2. **The desired public channel is not in the group chat list of the dispatch policy**
- Add the app authorizer to the public channel
- Or refer to **FAQ 1** to add the app to the channel

3. **Clicking the Allow button in Step 2 of the installation process results in an error.**
- Try again. There may be a communication issue between the server and Slack, causing authorization problems. Go back to the add data source page and try again
- If the error persists after retrying, please contact customer service

4. **Clicking the Save button in Step 3 of the installation process results in an error.**
- Try again. There may be a communication issue between the server and Slack, causing an error in obtaining the permanent authorization code. Go back to the add data source page and try again
- If the error persists after retrying, please contact customer service

5. **Slack App reports not_authed error.**
- Try again. There may be an issue with the Slack service
- If the error persists after retrying, please contact customer service

6. **Slack App reports Operation timed out error.**
- Try again. There may be a timeout issue between the server and Slack, or a communication problem
- If the error persists after retrying, please contact customer service

7. **Slack App reports This app responded with Status Code 500 error.**
- Try again. There may be an error with the service, such as the data source being closed
- If the error persists after retrying, please contact customer service

8. **Slack App reports Other questions error.**
- Try again. You may have encountered an issue that has not been recorded yet
- If the error persists after retrying, please contact customer service