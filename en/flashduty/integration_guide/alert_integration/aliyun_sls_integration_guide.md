---
brief: Synchronize Alibaba Cloud Log Service SLS monitoring alarm events with Kuaimao Xinyun via webhook, achieving automated noise reduction for alarm events
---

# Alibaba Cloud SLS Integration

Synchronize Alibaba Cloud Log Service SLS monitoring alarm events with Flashduty via webhook, achieving automated noise reduction for alarm events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Alibaba Cloud SLS** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Alibaba Cloud SLS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Alibaba Cloud SLS
**Step 1: Configure Webhook**

<div id="!"><ol><li>Log in to your Alibaba Cloud console, select Log Service SLS product, and select a Project</li><li> Enter the **Alarm** -> **Alarm Management** -> **Webhook Integration** page, click the **New** button to start editing.</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/do6Aljc-9776gTE_GTxT9gsVkAEejjOPvjVOZjEMs8U.avif"><ol start="3"><li> As shown in the figure, __ Type __ select "General Webhook ", __ method __ Select POST , __ request address __ fill in the integrated push address (obtained after saving)</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/l7QslDgInVpUwfNHW6GyVdSgdLrHiblCHY8-Zq1YR4M.avif"><ol start="4"><li> Click __ Confirm __ button to submit and save</li></ol></div>

**Step 2: Configure Content Template**

<div id="!"><ol><li>Switch to the __ Content Template __ page, click the __ Add __ button to start editing</li><li> Enter __Webhook- Custom __ configuration items, __ Sending method __ select "Send one by one", __ content __ Copy the following content:</li></ol><pre> `{{ alert
`</pre> | to_json}}</p><pre> `
<img alt="drawing" id="!">

3. 点击__确认__按钮，提交保存

</div>
`

**Step 3: Configure Action Strategy**

<div id="!"><ol><li>Switch to the __ Action Strategy __ page, click the __ Add __ button to start editing</li><li> Enter __ the first action list __ configuration item, click to add a __ action group __ node.</li><li> __ __ Select "General Webhook ", __ select Webhook__ and __ content template __ use the object created previously, __ send period __ select "any"</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/Dl-kqzyg53lz-hqYR8rZw8wC-cVpK4103tdtDLESOzU.avif"><ol start="4"><li> Click __ to end __ to complete the creation of the first action list</li><li> Click __ Confirm __ button to submit and save</li></ol></div>

**Step 4: Configure Monitoring Rules**

<div id="!"><ol><li>Switch to the __ Rules / Transaction __ page, click the __ New Alarm __ button or select an existing alarm to update and edit</li><li> Enter the __ Alarm Rules __ Edit page, **Alarm Policy** .</li><li> __ Alarm strategy __ select "Normal mode", __ strategy __ use the object created previously</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/TQ-mllhuKcn6FKPy11GIPpGB8GvwiJ17ZSraCR-IPCg.avif"><ol start="4"><li> Click the __ OK __ button to submit and save</li><li> For all other rules, repeat the above steps to push all alarms to FlashDuty</li></ol></div>

## Status Comparison
<div id="!"><p>Alibaba Cloud SLS Monitors the Flashduty level mapping relationship:</p>

| Alibaba Cloud SLS Monitoring |  Flashduty  | state |
| --------------- | -------- | ---- |
| 10              | Critical | serious |
| 8               | Critical | serious |
| 6               | Warning  | warn |
| 4               | Warning  | warn |
| 2               | Info     | remind |

</div>