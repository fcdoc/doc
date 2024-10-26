---
brief: Synchronize Blue Whale Cloud monitoring events with Flashduty via webhook to automate noise reduction for alarm events
---

# Blue Whale Zhiyun Integration

---

Synchronize Blue Whale Cloud monitoring events with Flashduty via webhook to automate noise reduction for alarm events.

## In Flashduty
---
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.


|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Blue Whale Zhiyun** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.


|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alarm Events**, and go to the integration selection page.
    2. Select the **Blue Whale Zhiyun** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on specific conditions, or set a default collaboration space as a fallback, with further adjustments as required.
    5. Completed.

## In Blue Whale Zhiyun
---
The following content has been validated in the __BlueWhale V6/7 versions__, and official support for V5 and earlier versions has been discontinued. It is recommended that you upgrade.

BlueWhale's alert strategy can trigger a __Processing Package__, which can be integrated with peripheral systems to achieve complex functionalities. We will first create a processing package, configure the FlashDuty callback address, then edit the alert strategy to associate actions with this processing package, thereby enabling automatic alert notifications to be sent to FlashDuty. The detailed steps are as follows:

#### Step 1: Create a Processing Package

<div id="!"><ol><li>Log in to your Blue Whale Zhiyun desktop and enter __ Monitoring Platform __ ;</li><li> Enter the __ Configuration - Processing Package __ page, click the __ Add Package __ button to start creating a processing package;</li><li> Fill in the name as `Send To FlashDuty` , select the package type __HTTP callback __ , select the push method as `POST` , and fill in the integrated push address (obtained after saving the integration), as shown in the following figure:</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/PZqbJNifhVKQj9FQNUw3DmVq8JGPf0sug4nfwFxVEjQ.avif"><ol start="4"><li> Switch to __ __ , select type `JSON` , copy the message body and fill in the following information (when an alarm is actually generated, Blue Whale will render the variable content as Payload and push it to the target callback address):</li></ol><pre> `{{alarm.callback_message}}
`</pre><ol start="5"><li> Save the package to complete creation.</li></ol></div>

#### Step 2: Edit Alarm Policy

<div id="!"><ol><li>Enter the __ Configuration - Policy __ page, select an existing policy to edit, or create a new alarm policy;</li><li> Scroll down to the __ Alarm Processing __ section, select `Send To FlashDuty` processing package for all three scenarios, and turn off __ Defense Rules __ , as shown below:</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/yeCaYyAFIHIaZZL6z7_gTPHz-vjF6nCl5Yw8rv1t9SI.avif"><ol start="3"><li> Submit and save, complete;</li><li> For other alarms that you want to push to FlashDuty repeat the above steps.</li></ol></div>

## Status Comparison
---
<div class="md-block">

| Blue Whale Zhiyun |  Flashduty  | state |
| -------- | -------- | ---- |
| Fatal     | Critical | serious |
| Early Warning     | Warning  | warn |
| remind     | Info     | remind |

</div>