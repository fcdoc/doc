---
brief: Synchronize Graylog alert events to Flashcat via webhook to achieve automatic noise reduction processing of alert events
---

# Graylog Alert Event

Synchronize Graylog alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods; either one will work.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Graylog** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete.

### Use Shared Integration

When you need to route the alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Choose **Graylog** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can directly set a default collaboration space as a fallback, and adjust it as needed.
    5. Complete.

## In Graylog

## 1. Graylog Alert Push Configuration

### Step 1: Configure Alert Channel
1. Log in to the Graylog console.
2. Find Alerts in the menu and select Notifications.
3. Create Create Notification.
4. Enter a Title and Description.
5. Notification Type Select **HTTP Notification** as shown below.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/1.avif" />

6. Enter the URL obtained from FlashDuty (you need to whitelist the URL the first time you enter it).

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/2.avif" />

7. Click Save to save the whitened URL

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/3.avif" />

8. After saving, submit Create.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/4.avif" />

### Step 2: Use FlashDuty Alert Channel in Alert Event
1. Create or edit an existing Event Definition.
2. Other alert configurations are omitted here (configure alert conditions according to business requirements).
3. Configure channels in Notifications.
4. Add Notifition Select FlashDuty channel.
5. Click Done.
6. Complete the next step.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/graylog/5.avif" />

## 2. Status Comparison

|Graylog|Flashcat|Status|
|---|---|---|
|3|Critical|Critical|
|2|Warning|Warning|
|1|Info|Info|