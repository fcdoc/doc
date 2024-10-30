---
brief: Synchronize Graylog alert events to Kuaimao Nebula via webhook to automate noise reduction processing for these alerts
---

# Graylog Alert Event

Synchronize Graylog alert events to Kuaimao Nebula via webhook to automate noise reduction processing for these alerts.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Graylog** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Graylog** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In Graylog

## 1. Graylog Alert Push Configuration

### Step 1: Configure the Alarm Notification Channel
1. Login to the Graylog console.
2. Locate Alerts in the menu and select Notifications.
3. Create a new Notification.
4. Enter the Title and Description.
5. Select **HTTP Notification** for the Notification Type, as shown in the figure below.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/1.avif" />

6. Enter the URL obtained from FlashDuty (the URL needs to be whitelisted upon first entry).

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/2.avif" />

7. Click Save to whitelist the URL

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/3.avif" />

8. After saving, submit the creation.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/4.avif" />

### Step 2: Utilize the FlashDuty Alert Channel in Alert Events
1. Create or edit an existing Event Definition.
2. Other alert configurations are omitted here (configure alert conditions according to business needs).
3. Configure the channel in Notifications.
4. Select the FlashDuty channel under Add Notification.
5. Click Done.
6. Proceed to the next step to complete the process.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/5.avif" />

## Status Comparison

|Graylog|Kuaimao Nebula|state|
|---|---|---|
|3|Critical|serious|
|2|Warning|warn|
|1|Info|remind|