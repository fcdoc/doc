---
brief: Synchronize AWS CloudWatch alarm events with Flashduty via webhook to automate noise reduction processing for these events
---

# AWS CloudWatch Integration

Synchronize AWS CloudWatch alarm events with Flashduty via webhook to automate noise reduction processing for these events.

## In Flashduty
使用专属集成

### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **AWS CloudWatch** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **AWS CloudWatch** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## In AWS CloudWatch

1. Login to your AWS console, locate the `Simple Notification Service` product, and navigate to the corresponding product console
2. Proceed to the `Topics` page, click the `Create topic` button to begin creating a new topic
3. Select `Standard` for the `Type`, and enter the name `FlashDuty`
4. Click the `Create Topic` button to finalize the creation of the topic
5. Access the `Subscriptions` page, and click the `Create subscription` button to set up a subscription for the topic
6. Select `FlashDuty` for the `Topic ARN`, choose `HTTPS` as the `Protocol`, and enter the integrated push address in the `Endpoint` field (enter the integration name on the current page, and the address will be generated upon saving)
7. Click the `Create subscription` button to complete the subscription setup

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/gwmuAGU9LJLBtiGACTpOAzBVZeYcAhCPSPh7HFKmdJ0.avif" />

8. Return to the `Subscriptions` page. If the subscription status is `Confirmed`, this indicates successful verification of the subscription address; otherwise, please contact Flashduty
9. Search for the `CloudWatch` service and enter its corresponding console
10. Go to the `All alarms` page and select to create or edit an existing alarm policy
11. For the `Notification` step, choose `FlashDuty` as the `SNS topic` target for the three states: `In alarm`, `OK`, and `Insufficient data`, as shown in the figure below:

<img alt="drawing" width="600" src="https://fcdoc.github.io/img/zh/ZWmshP-7A7IaZw8z1v9mLjFZQQc_4Z6zNv9EyxJFvY0.avif" />

12. Revisit the integration list. If the latest event time is displayed, it means the configuration is successful and events are being received
13. Completion

## Status Comparison

All indicator alarms monitored by CloudWatch correspond to Flashduty "warning" level alarms.