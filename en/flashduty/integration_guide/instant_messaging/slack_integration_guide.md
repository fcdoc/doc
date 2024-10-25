---
brief: By integrating a third-party Slack application, the capability to receive and respond to alerts within Slack is achieved
---

# Slack Integration

---

By integrating a third-party Slack application, the capability to receive and respond to alerts within Slack is achieved.

## 1. Install the Application
---

1. Visit FlashDuty **Integration** **Center** - - `Slack` - **add**

2. The page jumps to the interface of Slack select **the workspace** in the upper right corner, and then click **Allow**

<img src="https://fcdoc.github.io/img/aXIi-nrANb2NC__s3jg6kIgcoh68NENKYDJb8xhf9Mk.avif" alt="drawing" width="400"/>

3. Enter the data source name and click **Save**


## 2. Common Issues
---

1. **The desired private channel is missing from the group chat list in the dispatch policy**
- To add an application to a channel, you need to **install the application** in step 1. No error is reported.
- Enter the channel related to slack , execute `/invite @FlashDuty` , it will prompt that **you have joined** or **it has been added from xx to xxx** , indicating that the addition is successful

2. **The desired public channel is missing from the group chat list in the dispatch policy**
- Add the app authorizer to the public channel
- Or refer to **FAQ 1** to add the app to the channel

3. **Error encountered when clicking the 'Allow' button in step 2 of the installation process**
- Retry the operation. There might be a communication issue between the server and Slack, leading to authorization problems. Return to the data source addition page and attempt again
- If the error persists after retrying, contact customer support

4. **Error encountered when clicking the 'Save' button in step 3 of the installation process**
- Retry the operation. There might be a communication issue between the server and Slack, causing an error in obtaining the permanent authorization code. Return to the data source addition page and attempt again
- If the error persists after retrying, contact customer support

5. **'not_authed' error within the Slack App**
- Retry the operation. There may be an issue with the Slack service
- If the error persists after retrying, contact customer support

6. **'Operation timed out' error within the Slack App**
- Retry the operation. There may be a timeout issue between the server and Slack, indicating a communication problem
- If the error persists after retrying, contact customer support

7. **'This app responded with Status Code 500' error within the Slack App**
- Retry the operation. There may be a service error, for instance, the data source might be closed
- If the error persists after retrying, contact customer support

8. **'Other questions' error within the Slack App**
- Retry the operation. An unrecorded issue has been encountered
- If the error persists after retrying, contact customer support