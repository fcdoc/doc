---
brief: Synchronize Alibaba Cloud Log Service SLS to monitor alert events to Kuaimao Nebula through webhook to realize automatic noise reduction processing of alert events
---

# Alibaba Cloud SLS Integration

Synchronize Alibaba Cloud Log Service SLS monitoring alert events to Flashduty through webhook to realize automatic noise reduction processing of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Alibaba Cloud SLS** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose **Alibaba Cloud SLS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In Alibaba Cloud SLS
**Step 1: Configure Webhook**

1. Log in to your Alibaba Cloud console, select the Log Service SLS product, and select a Project
2. Enter the **alert** -> **alert Management** -> **Webhook Integration** page, click the **New** button to start editing

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/1.avif" />

3. As shown in the figure, __ Type __ select "General Webhook ", __ Request method __ select POST , __ Request address __ fill in the integrated push address (obtained after saving)

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/2.avif" />

4. Click __ Confirm __ button to submit and save

**Step 2: Configure Content Template**

1. Switch to the __ Content Template __ page, click the __ Add __ button to start editing
2. Enter __Webhook- Custom __ item, __ Sending method __ select "Send one by one", __ Sending content __ Copy the following content:

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

1. Switch to the __ Rules / Transaction __ page, click the __ New alert__ button or select an existing alert to update and edit
2. Enter the __alert Rules __ edit page, **alert Strategy** .
3. __alert Strategy __ "Normal Mode", __ Action Strategy __ use the object created previously

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/5.avif" />

4. Click the __ OK __ button to submit and save
5. Repeat the above steps for all other rules to push all alerts to FlashDuty

## Status Comparison

Alibaba Cloud SLS monitoring to Flashduty alert level mapping:

| Alibaba Cloud SLS Monitoring |  Flashduty  | Status |
| --------------- | -------- | ---- |
| 10              | Critical | Critical |
| 8               | Critical | Critical |
| 6               | Warning  | Warning |
| 4               | Warning  | Warning |
| 2               | Info     | Information |