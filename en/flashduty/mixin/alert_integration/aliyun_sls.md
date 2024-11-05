---
brief: Synchronize Alibaba Cloud Log Service SLS monitoring alert events to Flashcat via webhook to achieve automated noise reduction of alert events
---

# Alibaba Cloud SLS Integration

Synchronize Alibaba Cloud Log Service SLS monitoring alert events to Flashduty via webhook to achieve automated noise reduction of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods; choose either one.

### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Alibaba Cloud SLS** integration, click **Save**, and generate a card.
    4. Click the generated card to view the **Push Address**, copy it for later use, and complete.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information of the alert event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Choose **Alibaba Cloud SLS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **Push Address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can directly set a default collaboration space as a fallback, and then adjust as needed.
    5. Complete.

## In Alibaba Cloud SLS
**Step 1: Configure Webhook**

1. Log in to your Alibaba Cloud console, select the Log Service SLS product, and choose a Project
2. Enter the **alert** -> **alert Management** -> **Webhook integration** page, click the **New** button to start editing

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/1.avif" />

3. As shown in the figure, __Type__ select "General Webhook", __Request Method__ select POST, and __Request Address__ fill in the integrated push address (obtained after saving)

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/2.avif" />

4. Click the __Confirm__ button to submit and save

**Step 2: Configure Content Template**

1. Switch to the __Content Template__ page, click the __Add__ button to start editing
2. Enter the __Webhook - Custom__ configuration item, __Sending Method__ select "Send Individually", and __Sending Content__ copy the following content:

```
{{ alert | to_json}}
```

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/3.avif" />

3. Click the __Confirm__ button to submit and save

**Step 3: Configure Action Strategy**

1. Switch to the __Action Strategy__ page, click the __Add__ button to start editing
2. Enter the __First Action List__ configuration item and click to add an __Action Group__ node.
3. __Channel__ select "General Webhook", __Select Webhook__ and __Content Template__ use the object created previously, and __Send Period__ select "Any"

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/4.avif" />

4. Click __End__ to complete the creation of the first action list
5. Click the __Confirm__ button to submit and save

**Step 4: Configure Monitoring Rules**

1. Switch to the __Rules / Transaction__ page, click the __New Alert__ button or select an existing alert to update and edit
2. Enter the __Alert Rules__ edit page, __Alert Strategy__.
3. __Alert Strategy__ select "Normal Mode", and __Action Strategy__ use the object created previously

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aliyun_sls/5.avif" />

4. Click the __OK__ button to submit and save
5. Repeat the above steps for all other rules to push all alerts to FlashDuty

## Status Comparison

Alibaba Cloud SLS monitoring to Flashduty alert level mapping:

| Alibaba Cloud SLS Monitoring |  Flashduty  | Status |
| --------------- | -------- | ---- |
| 10              | Critical | Critical |
| 8               | Critical | Critical |
| 6               | Warning  | Warning |
| 4               | Warning  | Warning |
| 2               | Info     | Info |