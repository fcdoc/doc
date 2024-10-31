---
brief: Synchronize Sentry alert events with Kuaimao Xingyun via webhook to automate noise reduction processing for alert events
---

# Sentry alert events

Synchronize Sentry alert events with Kuaimao Xingyun via webhook to automate noise reduction processing for alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Sentry** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Sentry** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In Sentry

## 1. Preliminary Remarks
Sentry offers two alert mechanisms: Issue Alerts and Metric Alerts. Issue Alerts can be notified through WebHooks in the Integrations section, while Metric Alerts are restricted to using Internal Integration for notifications. Notably, Internal Integration is not only suitable for Metric Alerts but also compatible with Issue Alerts. Given the broad applicability of Internal Integration, we have decided to adopt this method consistently, eliminating the need for separate reliance on WebHooks to simplify alert notification configuration.

## 2. Sentry Alert Push Configuration

### Step 1: Add FlashDuty Custom Integrations

1. Login to the Sentry management console.
2. Locate **Settings => Custom Integrations** in the left-hand navigation bar.
3. Click on Create New Integration and select **Internal Integration**.
4. on the edit page. **Fill in FlashDuty at Name , copy and write the integrated push address at WebhookURL** .
5. Enable **Alert Rule Action**, referring to the configuration shown in the following image:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/1.avif" />

5. **Configure Read permissions for Issue & Event** in PERMISSIONS Configuration.
6. In the WEBHOOKS configuration, check **issue**; **do not check** error and comment.
7. After completing the configuration, click Save Changes to finish the creation.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/2.avif" />

**Special Notes on WEBHOOKS Configuration:**
1. After selecting **issue**, FlashDuty can receive resolved events for issues. This means that when an issue is manually marked as resolved in the issue list, we will automatically restore the associated incident in FlashDuty.
2. FlashDuty does not support other issue events such as create, assigned, archived, and unresolved.
3. If both error and comment are checked, FlashDuty will not receive or process these events.

### Step 2: Use FlashDuty Integration in Alerts
1. Find **Alerts => Create Alert** in the left-hand navigation bar.
2. Select the type of Alert you wish to create, such as Issue.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/3.avif" />

3. Configure the trigger conditions as needed.

4. In the **THEN perform these actions** section, add an action and select **Send a notification via**.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/4.avif" />

5.  Choose the **FlashDuty** notification channel that you added earlier.

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/Sentry/5.avif" />

6. After configuring the other options, click **Save Rule** to save.

## 3. Status Correspondence

|Sentry|Kuaimao Nebula|state|
|---|---|---|
|critical|Critical|serious|
|warning|Warning|warn|
|triggered|Warning|warn|
|resolved|Ok|Recovered|