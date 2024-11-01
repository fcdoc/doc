---
brief: Synchronize Sentry alert events to Kuaimao Nebula via webhook to achieve automatic noise reduction of alert events
---

# Sentry Alert Events

Synchronize Sentry alert events to Kuaimao Nebula via webhook to achieve automatic noise reduction of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Sentry** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose the **Sentry** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In Sentry

## 1. Preliminary Instructions
Sentry provides two types of alert mechanisms: Issue Alerts and Metric Alerts. Issue Alerts support the notification function through WebHooks in Integrations, while Metric Alerts are limited to using Internal Integration for alert notifications. It is worth noting that Internal Integration is not only applicable to Metric Alerts but is also compatible with Issue Alerts. Given the wide applicability of Internal Integration, we have decided to adopt this method uniformly and no longer rely solely on WebHooks to simplify the configuration of alert notifications.

## 2. Sentry Alert Push Configuration

### Step 1: Add FlashDuty Custom Integrations

1. Log in to the Sentry management console.
2. In the left navigation bar, find **Settings => Custom Integrations**.
3. Click Create New Integration and select **Internal Integration** .
4. on the edit page. **Fill in FlashDuty at Name , copy and write the integrated push address at WebhookURL** .
5. Enable **Alert Rule Action** and configure it as follows:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/1.avif" />

5. **Configure Read permissions for Issue & Event** in PERMISSIONS Configuration.
6. In WEBHOOKS configuration, check **issue** , **please do not check error and comment** .
7. After the configuration is complete, click Save Changes to complete the creation.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/2.avif" />

**Special instructions about WEBHOOKS configuration:**
1. After checking **issue**, FlashDuty can receive the resolved event for issues, meaning that when an issue is manually marked as resolved in the issue list, the associated incident in FlashDuty will be automatically restored.
2. Other events for issues, such as create, assigned, archived, and unresolved, are not supported.
3. If both error and comment are checked, FlashDuty will not receive and process such events.

### Step 2: Use FlashDuty Integration in Alerts
1. In the left navigation bar, find **Alerts => Create Alert**.
2. Select the type of Alert to create, such as Issue .

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/3.avif" />

3. Configure the trigger conditions as needed.

4. At **THEN perform these actions Add action** and select **Send a notification via** .

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/4.avif" />

5.  Choose the **FlashDuty** notification channel that you added earlier.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/5.avif" />

6. After configuring the other options, click **Save Rule** to save the alert.

## 3. Status Comparison

|Sentry|Kuaimao Nebula|Status|
|---|---|---|
|critical|Critical|Critical|
|warning|Warning|Warning|
|triggered|Warning|Warning|
|resolved|Ok|Recovered|