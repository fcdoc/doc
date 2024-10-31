---
brief: 1	Synchronize Tencent Cloud Log Service CLS alert events to Kuaimao Star Cloud via webhook, achieving automated noise reduction for alert notifications
---

# 2	Integration of Tencent Cloud Log Service CLS

2	Synchronize Tencent Cloud Log Service CLS monitoring alert events to Flashduty via webhook, enabling automated noise reduction in alert processing.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Tencent Cloud CLS** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Tencent Cloud CLS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## CLS in Tencent Cloud

**Step 1: Configure Notification Channel Group**

1. Log in to your Tencent Cloud console, select the Log Service CLS product, and go to Monitoring Alert - Notification Channel Group
2. Click **New** to start a new

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cls/1.avif" />

3. As shown in the figure, **name** fill in the specific channel group name __ channel type __ select "custom interface callback", **callback address** fill in the integrated push address, **request method** select POST

4. Click **OK** to save and **add** multiple channels.

**Step 2: Configure Alert Policy**

1. Log in to your Tencent Cloud console, select the Log Service CLS product, and go to Monitoring Alert - Alert Policy
2. Click **New** to start a new

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/tencent_cls/2.avif" />

3. 5	As depicted, enter the specific alert name in the __alert name__ field, and select a specific log topic for the log theme

4. **Execution statement:** Fill in the specific query statement, select the time range for the query time range, click preview to view the execution results, and enter the specific trigger condition for the trigger condition.

5. **alert Level** , divided into emergency, Alert and reminder, selected according to the serious program of alert , and the execution cycle is selected according to needs

6. **Multi-dimensional analysis** , when triggered alert can perform additional retrieval and analysis on the original log, and append the results to the alert notification to assist in locating the alert cause. Multidimensional analysis will not affect alert trigger conditions.

7. Alert Notification, **notification channel group** , can be associated with a specific channel group

**Step 3: Configure Custom Callback**

1. After associating the channel group, you will be able to view the callback content configuration

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

| Tencent Cloud CLS Monitoring |  Flashduty    | state
| ------------- | --------- | --- |
| Info          |  Info     | remind
| Warn          |  Warning  | warn
| Critical      |  Critical | Urgent