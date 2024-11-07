---
brief: Synchronize Skywalking alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events
---

# Skywalking Alert Events

Synchronize Skywalking alert events to Flashcat via webhook to achieve automated noise reduction processing of alert events.

## In Flashduty
You can obtain an integration push address through the following two methods. Choose either one.

### Use Proprietary Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Skywalking** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the setup.

### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and go to the integration selection page.
    2. Choose **Skywalking** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust as needed.
    5. Complete.

## In Skywalking

## Modify the Configuration File of the Skywalking Service

1. Log in to the Skywalking server.
2. Find the Skywalking configuration file ./config/alarm-settings.yml.
3. Add Level tags in the alert rules.

```i18n
# Only versions v8.6.0 and above support tags; other versions do not need to add them.
# The corresponding values for Level: Critical, Warning, Info.
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
# At the bottom of the configuration file, add:
# For versions v8.8.0 to v9.5.0:
webhooks:
- url: https://api.flashcat.cloud/event/push/alert/skywalking?integration_key=18c7f1551df55fa28a1a87f0846d9d1e131

# For version v10.0.0:
hooks:
webhook:
default:
is-default: true
urls:
- https://api.flashcat.cloud/event/push/alert/skywalking?integration_key=18c7f1551df55fa28a1a87f0846d9d1e131
```

5. After editing is complete, save and restart the Skywalking service to make the configuration file take effect

## Status Comparison

|Skywalking|Flashcat|Status|
|---|---|---|
|Critical|Critical|High|
|Warning|Warning|Average|
|Info|Info|Disaster|
|Other or Empty|Info|Disaster|