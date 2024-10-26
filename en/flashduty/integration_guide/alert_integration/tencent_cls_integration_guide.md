---
brief: 1	Synchronize Tencent Cloud Log Service CLS monitoring alarm events to Kuaimao Nebula via webhook, achieving automated noise reduction processing for alarm events
---

# 2	Integration of Tencent Cloud Log Service CLS

---

3	Synchronize Tencent Cloud Log Service CLS monitoring alarm events to Flashduty via webhook, realizing automated noise reduction processing for alarm events.

## In Flashduty
---
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.


|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click on **Add an Integration**, and proceed to the Add Integration page
    3. Choose the **Tencent Cloud CLS** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for later use, and the process is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.


|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Tencent Cloud CLS** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on specific conditions, or directly set a default collaboration space as a fallback, which can be adjusted as needed later on.
    5. Completed.

## CLS in Tencent Cloud
---

**Step 1: Configure Notification Channel Group**

<div id="!"><ol><li>Log in to your Tencent Cloud console, select the Log Service CLS product, and enter Monitoring Alarm - Notification Channel Group</li><li> Click **New** to start a new</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/9TVvjInBRsJOGHYptzIJmMgCaYUTRTohbSwENzk9_bg.avif"><ol start="3"><li><p> As shown in the figure, **name** fill in the specific channel group name, __ channel type __ select "custom interface callback", **callback address** fill in the integrated push address, **request method** select POST</p></li><li><p> Click **OK** to save and **add** multiple channels.</p></li></ol></div>

**Step 2: Configure Alarm Policy**

<div id="!"><ol><li>Log in to your Tencent Cloud console, select the Log Service CLS product, and enter Monitoring Alarm - Alarm Policy</li><li> Click **New** to start a new</li></ol><img alt="drawing" width="600" src="https://fcdoc.github.io/img/FCfCmqlCwhjze8nSa88mkVt3nUX1myHyDFygJd8_lIc.avif"><ol start="3"><li><p> As shown in the figure, __ Alarm name __ fill in the specific alarm name, select the specific log topic for the log topic</p></li><li><p> **Execution statement:** Fill in the specific query statement, select the time range for the query time range, click preview to view the execution results, and enter the specific trigger condition for the trigger condition.</p></li><li><p> **Alarm levels** are divided into emergency, alarm and reminder. The program is selected according to the severity of the alarm, and the execution cycle is selected according to needs.</p></li><li><p> **Multi-dimensional analysis** , when an alarm is triggered, additional retrieval and analysis can be performed on the original log, and the results are appended to the alarm notification to assist in locating the cause of the alarm. Multidimensional analysis will not affect alarm triggering conditions.</p></li><li><p> Alarm notifications, **notification channel groups** , can be associated with specific channel groups</p></li></ol></div>


**Step 3: Configure Custom Callback**

<div id="!"><ol><li><p>After associating the channel group, you can see the callback content configuration</p></li><li><p> Request header, you can add specific requests headers</p></li><li><p> Request content, return specific request data format, refer to:</p></li></ol><pre> <code class="language-json">{
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
</code></pre></div>


## Status Comparison
---
9	<div class="md-block">

| Tencent Cloud CLS Monitoring |  Flashduty    | state
| ------------- | --------- | --- |
| Info          |  Info     | remind
| Warn          |  Warning  | warn
| Critical      |  Critical | urgent</p> </