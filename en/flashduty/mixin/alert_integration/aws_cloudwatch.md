---
brief: Synchronize AWS CloudWatch alert events to Flashduty via webhook to achieve automated noise reduction of alert events
---

# AWS CloudWatch Integration

Synchronize AWS CloudWatch alert events to Flashduty via webhook to achieve automated noise reduction of alert events.

## In Flashduty
You can obtain an integrated push address through the following two methods, choose either one.

### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **AWS CloudWatch** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Choose **AWS CloudWatch** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## In AWS CloudWatch

1. Log in to your AWS console, search for `Simple Notification Service` and enter the corresponding product console
2. Enter the `Topics` page, click the `Create topic` button to start creating a topic
3. Select `Type` as `Standard` and name it `FlashDuty`
4. Click the `Create Topic` button to complete the topic creation
5. Enter the `Subscriptions` page, click the `Create subscription` button to create a subscription for the topic
6. `Topic ARN` select `FlashDuty` , `Protocal` select `HTTPS` , `Endpoint` fill in the integrated push address (fill in the integration name on the current page, and the address can be generated after saving)
7. Click the `Create subscription` button to complete the subscription creation

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aws_cloudwatch/1.avif" />

8. Return to the `Subscriptions` page. When the subscription status is `Confirmed`, it indicates that the subscription address verification is successful. Otherwise, please contact Flashduty
9. Search for `CloudWatch` and enter the corresponding product console
10. Enter the `All Alarms` page and choose to create or edit an existing alert strategy
11. For the `Notification` step, select `FlashDuty` as the push target `SNS topic` for the three states: `In alarm`, `OK`, and `Insufficient data`, as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aws_cloudwatch/2.avif" />

12. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
13. Complete

## Status Comparison

All indicator alerts monitored by CloudWatch correspond to Flashduty "warning" level alerts.