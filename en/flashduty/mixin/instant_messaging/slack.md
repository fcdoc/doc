---
brief: By integrating third-party Slack applications, you can receive and respond to alerts within Slack
---

# Slack Integration

By integrating third-party Slack applications, you can receive and respond to alerts within Slack.

## Install the Application

1. Visit the FlashDuty __Integration Center__ - __Instant Messaging__ - `Slack` - __Add__

2. The page will redirect to the Slack interface. Select the __workspace__ in the upper right corner, then click __Allow__

<img src="https://fcimg.i18n.site/zh/flashduty/mixin/instant_messaging/slack/1.avif" alt="drawing" width="400"/>

3. Enter the data source name and click __Save__

## Frequently Asked Questions

1. **The desired private channel is not in the group chat list of the dispatch policy.**
- To add the application to a channel, ensure that step 1 __Install the Application__ completes without errors
- Enter the relevant Slack channel and execute `/invite @FlashDuty`. If it prompts __You have joined__ or __Added by xx to xxx__, the addition is successful

2. **The desired public channel is not in the group chat list of the dispatch policy.**
- Add the app authorizer to the public channel
- Or refer to __FAQ 1__ to add the app to the channel

3. **Clicking the Allow button in step 2 of the installation results in an error.**
- Retry the operation. There may be a communication issue between the server and Slack, causing authorization problems. Go back to the add data source page and try again
- If the error persists after retrying, contact customer service

4. **Clicking the Save button in step 3 of the installation results in an error.**
- Retry the operation. There may be a communication issue between the server and Slack, causing an error in obtaining the permanent authorization code. Go back to the add data source page and try again
- If the error persists after retrying, contact customer service

5. **Slack App reports a not_authed error.**
- Retry the operation. There may be an issue with the Slack service
- If the error persists after retrying, contact customer service

6. **Slack App reports an Operation timed out error.**
- Retry the operation. There may be a timeout issue between the server and Slack, or a communication problem
- If the error persists after retrying, contact customer service

7. **Slack App reports a This app responded with Status Code 500 error.**
- Retry the operation. There may be an issue with the service, such as the data source being closed
- If the error persists after retrying, contact customer service

8. **Slack App reports other questions.**
- Retry the operation. You may have encountered an unrecorded issue
- If the error persists after retrying, contact customer service