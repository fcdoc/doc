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

1. Log in to your Alibaba Cloud console, and select the Log Service SLS product. Choose a Project
2. Enter **the Alarm** -> **Alarm Management** -> **Webhook Integration** page, click the **New** button to start editing

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/1.avif" />

3. As shown in the figure, __ Type __ select "General Webhook ", __ Request method __ select POST , __ Request address __ fill in the integrated push address (obtained after saving)

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/2.avif" />

4. Click __ Confirm __ button to submit and save

**Step 2: Configure Content Template**

1. Switch to the __ Content Template __ page, click the __ Add __ button to start editing
2. Enter __Webhook- Customized __ items, __ Sending method __ select "Send one by one", __ Sending content __ Copy the following content:

```
{{ alert | to_json}}
```

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/3.avif" />

3. Click __ Confirm __ button to submit and save

**Step 3: Configure Action Strategy**

1. Switch to the __ Action Strategy __ page, click the __ Add __ button to start editing
2. Enter the __ First Action List __ configuration item and click to add an __ Action Group __ node.
3. __ Channel __ select "General Webhook ", __ select Webhook__ and __ Content Template __ use the object created previously, __ send period __ select "Any"

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/4.avif" />

4. Click __ End __ to complete the creation of the first action list
5. Click __ Confirm __ button to submit and save

**Step 4: Configure Monitoring Rules**

1. Switch to the __ Rules / Transaction __ page, click the __ New Alarm __ button or select an existing alarm to update and edit
2. Enter __ Alarm Rules __ edit page, **Alarm Policy** .
3. __ Alarm strategy __ "Normal mode", __ Action strategy __ use the object created previously

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/5.avif" />

4. Click the __ OK __ button to submit and save
5. Repeat the above steps for all other rules to ensure all alerts are pushed to FlashDuty

## Status Comparison

Alibaba Cloud SLS monitors the mapping relationship between FlashDuty alarm levels:

| Alibaba Cloud SLS Monitoring |  Flashduty  | state |
| --------------- | -------- | ---- |
| 10              | Critical | serious |
| 8               | Critical | serious |
| 6               | Warning  | warn |
| 4               | Warning  | warn |
| 2               | Info     | remind |