---
brief: Synchronize Tencent Cloud Log Service CLS to monitor alert events to Kuaimao Nebula through webhook to realize automatic noise reduction processing of alert events
---

# Tencent Cloud Log Service CLS Integration

Synchronize Tencent Cloud Log Service CLS monitoring alert events to Flashduty through webhook to realize automatic noise reduction processing of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Tencent Cloud CLS** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose the **Tencent Cloud CLS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In the Tencent Cloud CLS

**Step 1: Configure Notification Channel Group**

1. Log in to your Tencent Cloud console, select the Log Service CLS product, and enter Monitoring Alert - Notification Channel Group
2. Click **New** to start a new

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cls/1.avif" />

3. As shown in the figure, **name** fill in the specific channel group name __ channel type __ select "custom interface callback", **callback address** fill in the integrated push address, **request method** select POST

4. Click **OK** to save and **add** multiple channels.

**Step 2: Configure Alert Policy**

1. Log in to your Tencent Cloud console, select the Log Service CLS product, and enter Monitor Alert - Alert Policy
2. Click **New** to start a new

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cls/2.avif" />

3. As shown in the figure, __alert Name __ fill in the specific alert name, and the log topic selects a specific log topic

4. **Execution statement:** Fill in the specific query statement, select the time range for the query time range, click preview to view the execution results, and enter the specific trigger condition for the trigger condition.

5. **alert Level** , divided into emergency, Alert and reminder, selected according to the serious program of alert , and the execution cycle is selected according to needs

6. **Multi-dimensional analysis** , when triggered alert can perform additional retrieval and analysis on the original log, and append the results to the alert notification to assist in locating the alert cause. Multidimensional analysis will not affect alert trigger conditions.

7. Alert Notification, **notification channel group** , can be associated with a specific channel group

**Step 3: Configure Custom Callbacks**

1. After associating the channel group, you can see the callback content configuration

2. Request headers, you can add specific request headers

3. Request content, return specific request data format, refer to:

```json
{
"uin": "{{escape .UIN}}",
"nickname": "{{escape .Nickname}}",
"region": "{{escape .Region}}",
"alarm": "{{escape .Alarm}}",
"alarm_id": "{{escape .AlarmID}}",
"condition": "{{escape .Condition}}",
"happen_threshold": "{{escape .HappenThreshold}}",
"alert_threshold": "{{escape .AlertThreshold}}",
"topic": "{{escape .Topic}}",
"topic_id": "{{escape .TopicId}}",
"level": "{{escape .Level}}",
"label": {{.Label}},
"start_time": "{{escape .StartTime}}",
"start_time_unix": "{{escape .StartTimeUnix}}",
"notify_time": "{{escape .NotifyTime}}",
"notify_time_unix": "{{escape .NotifyTimeUnix}}",
"notify_type": "{{escape .NotifyType}}",
"consecutive_alert_nums": "{{escape .ConsecutiveAlertNums}}",
"duration": "{{escape .Duration}}",
"trigger_params": "{{escape .TriggerParams}}",
"record_group_id": "{{escape .RecordGroupId}}",
"detail_url": "{{escape .DetailUrl}}",
"query_url": "{{escape .QueryUrl}}",
"message": {{.Message}},
"query_result": {{.QueryResult}},
"query_log": {{.QueryLog}},
"analysis_result": {{.AnalysisResult}}
}
```

## Status Comparison

Tencent Cloud CLS monitoring alert level to Flashduty mapping relationship:

| Tencent Cloud CLS Monitoring |  Flashduty    | Status
| ------------- | --------- | --- |
| Info          |  Info     | Information
| Warn          |  Warning  | Warning
| Critical      |  Critical | Emergency