---
brief: By integrating third-party Slack applications, you can achieve the ability to receive and respond to alerts within Slack
---

# Slack Integration

By integrating third-party Slack applications, you can achieve the ability to receive and respond to alerts within Slack.

## 1. Install the Application

1. Visit the FlashDuty __Integration Center__ - __Instant Messaging__ - `Slack` - __Add__

2. The page will redirect to the Slack interface. Select __the workspace__ in the upper right corner, then click __Allow__

<img src="https://fcdoc.github.io/img/zh/flashduty/mixin/instant_messaging/slack/1.avif" alt="drawing" width="400"/>

3. Enter the data source name and click __Save__

## 2. Frequently Asked Questions

1. **The desired private channel is not in the group chat list of the dispatch policy**
- To add the application to a channel, you need to complete step one: __install the application__ without any errors
- Enter the relevant Slack channel and execute `/invite @FlashDuty`. It will prompt __you have joined__ or __you have been added to xxx by xx__, indicating a successful addition

2. **The desired public channel is not in the group chat list of the dispatch policy**
- Add the application authorizer to the public channel
- Or refer to __FAQ 1__ to add the app to the channel

3. **Clicking the Allow button in Step 2 of the installation process results in an error.**
- Try again. There may be a communication issue between the server and Slack, causing authorization problems. Go back to the add data source page and try again
- If the error persists after retrying, contact customer service

4. **Clicking the Save button in Step 3 of the installation process results in an error.**
- Try again. There may be a communication issue between the server and Slack. FlashDuty might have encountered an error while obtaining the permanent authorization code. Go back to the add data source page and try again
- If the error persists after retrying, contact customer service

5. **Slack App: not_authed, error**
- Try again. There may be an issue with the Slack service
- If the error persists after retrying, contact customer service

6. **Slack App: Operation timed out, error**
- Try again. There may be a timeout issue between the server and Slack, or a communication problem between the server and Slack
- If the error persists after retrying, contact customer service

7. **Slack App: This app responded with Status Code 500, error**
- Try again. There may be an error with the service, such as the data source being closed
- If the error persists after retrying, contact customer service

8. **Slack App: Other questions, error**
- Try again. You may have encountered an issue that has not been recorded yet
- If the error persists after retrying, contact customer service