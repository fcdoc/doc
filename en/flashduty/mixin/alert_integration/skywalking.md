---
brief: Synchronize Skywalking alert events to Kuaimao Nebula via webhook to achieve automatic noise reduction of alert events
---

# Skywalking Alert Events

Synchronize Skywalking alert events to Kuaimao Nebula via webhook to achieve automatic noise reduction of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Skywalking** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose the **Skywalking** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In Skywalking

## 1. Modify the Skywalking Service Configuration File

1. Log in to the Skywalking server.
2. Find the Skywalking configuration file ./config/alarm-settings.yml.
3. Add Level tags to the alert rules.

```i18n
# Only versions v8.6.0 and above support the tags label; other versions do not need to add it.
# The corresponding values for Level are: Critical, Warning, Info.
# Please pay attention to the capitalization.
rules:
endpoint_relation_resp_time_rule:
expression: sum(endpoint_relation_resp_time > 1000) >= 2
period: 10
message: Response time of endpoint relation {name} is more than 1000ms in 2 minutes of last 10 minutes
tags:
Level: Warning
```
4. Add the FlashDuty webhook address.

```i18n
# Add at the bottom of the configuration file:
# For v8.8.0 ~ v9.5.0:
webhooks:
- url: https://api.flashcat.cloud/event/push/alert/skywalking?integration_key=18c7f1551df55fa28a1a87f0846d9d1e131

# For v10.0.0:
hooks:
webhook:
default:
is-default: true
urls:
- https://api.flashcat.cloud/event/push/alert/skywalking?integration_key=18c7f1551df55fa28a1a87f0846d9d1e131
```

5. After editing, save the changes and restart the Skywalking service to apply the configuration

## 2. Status Comparison

|Skywalking|Kuaimao Nebula|Status|
|---|---|---|
|Critical|Critical|Critical|
|Warning|Warning|Warning|
|Info|Info|Information|
|Other or Empty|Info|Information|