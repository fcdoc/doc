---
brief: Synchronize AWS CloudWatch alert events with Flashduty via webhook to automate noise reduction for these alerts
---

# AWS CloudWatch Integration

By using a webhook, sync AWS CloudWatch alert events to Flashduty for automated noise reduction of alert events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **AWS CloudWatch** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **AWS CloudWatch** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## In AWS CloudWatch

1. Login to your AWS console, locate the `Simple Notification Service` product, and navigate to the corresponding product console
2. Proceed to the `Topics` page, click the `Create topic` button to begin creating a new topic
3. Select `Standard` for the `Type`, and enter the name `FlashDuty`
4. Click the `Create Topic` button to finalize the creation of the topic
5. Access the `Subscriptions` page, and click the `Create subscription` button to set up a subscription for the topic
6. Select `FlashDuty` for the `Topic ARN`, choose `HTTPS` as the `Protocol`, and enter the integrated push address in the `Endpoint` field (enter the integration name on the current page, and the address will be generated upon saving)
7. Click the `Create subscription` button to complete the subscription setup

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aws_cloudwatch/1.avif" />

8. Return to the `Subscriptions` page. If the subscription status is `Confirmed`, this indicates successful verification of the subscription address; otherwise, please contact Flashduty
9. Search for the `CloudWatch` service and enter its corresponding console
10. Go to the `All Alarms` page to create or edit an existing alert policy
11. For the `Notification` step, choose `FlashDuty` as the `SNS topic` target for the three states: `In alarm`, `OK`, and `Insufficient data`, as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/flashduty/mixin/alert_integration/aws_cloudwatch/2.avif" />

12. Return to the integration list. If the latest event time is displayed, the configuration is successful and the event has been received
13. Finish

## Status Comparison

All indicator alerts monitored by CloudWatch correspond to Flashduty "warning" level alerts.