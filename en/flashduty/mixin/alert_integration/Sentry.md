---
brief: Synchronize Sentry alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events
---

# Sentry Alert Events

Synchronize Sentry alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Sentry** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Sentry** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Sentry

## Preliminary Instructions
Sentry provides two types of alert mechanisms: Issue Alerts and Metric Alerts. Issue Alerts support notification functionality through WebHooks in Integrations, while Metric Alerts are limited to using Internal Integration for alert notifications. Notably, Internal Integration is not only applicable to Metric Alerts but also compatible with Issue Alerts. Given the wide applicability of Internal Integration, we have decided to adopt this method uniformly and no longer rely solely on WebHooks to simplify the configuration of alert notifications.

## Sentry Alert Push Configuration

### Step 1: Add FlashDuty Custom Integrations

1. Log in to the Sentry management console.
2. In the left navigation bar, find **Settings => Custom Integrations**.
3. Click Create New Integration and select **Internal Integration** .
4. On the edit page, **enter FlashDuty in the Name field, and copy the integration's push address into the WebhookURL field**.
5. Enable **Alert Rule Action** and refer to the following configuration:

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/Sentry/1.avif" />

5. **Configure Read permissions for Issue & Event** in PERMISSIONS Configuration.
6. In WEBHOOKS configuration, check **issue** , **please do not check error and comment** .
7. After the configuration is complete, click Save Changes to complete the creation.

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/Sentry/2.avif" />

**Special Note on WEBHOOKS Configuration:**
1. After checking **issue**, FlashDuty can receive the resolved event for issues, i.e., when an issue is manually marked as resolved in the issue list, we will automatically restore the associated incident in FlashDuty.
2. Other events for issues, such as create, assigned, archived, and unresolved, are not supported.
3. If both error and comment are checked, FlashDuty will not receive and process such events.

### Step 2: Use FlashDuty Integration in Alerts
1. In the left navigation bar, find **Alerts => Create Alert**.
2. Select the type of Alert to create, such as Issue .

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/Sentry/3.avif" />

3. Configure the trigger conditions as needed.

4. At **THEN perform these actions Add action** and select **Send a notification via** .

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/Sentry/4.avif" />

5.  Choose the **FlashDuty** notification channel added above.

<img alt="drawing" width="600" src="https://fc.3ti.site/zh/flashduty/mixin/alert_integration/Sentry/5.avif" />

6. After configuring other options, click **Save Rule** to save.

## Status Comparison

|Sentry|Flashcat|Status|
|---|---|---|
|critical|Critical|High|
|warning|Warning|Average|
|triggered|Warning|Average|
|resolved|Ok|recover | Resolved        ||