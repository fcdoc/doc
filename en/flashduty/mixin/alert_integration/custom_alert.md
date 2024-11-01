---
brief: Push your system's alert events to Flashduty via standard protocols to achieve automated noise reduction of alert events.
---

# Custom Alert Event Integration Guide

Push your system's alert events to Flashduty via standard protocols to achieve automated noise reduction of alert events.

> [!NOTE]
> Flashduty has already adapted to the webhook protocols of most commonly used alert systems. For these systems, you should first use the corresponding integration, which is simpler and more convenient. This integration provides a standard HTTP interface that requires you to develop an adapter. The advantage is that you can push any alert event you want to manage.

## Operation Steps

### In Flashduty

You can obtain an integrated push address through the following two methods, choose either one.

#### Use Proprietary Integrations

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select **Prometheus** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

#### Use Shared Integrations

When you need to route alert events to different collaboration spaces based on the payload information, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alerts**, and navigate to the integration selection page.
    2. Select the **Custom Event** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed.
    5. Complete.

## Implement Protocol

Please refer to the [development documentation](https://developer.flashcat.cloud/zh/flashduty/custom-alert) to complete the protocol development.

## Best Practices

1. When the alert status changes, send an event to Kuaimao Nebula
2. When the alert is restored, send an event with status Ok to close the alert. Otherwise, the Alert will remain on. If your alert system does not have recovery events, it is recommended that you send recovery events manually
3. The label is a description of the event. The content of the label should be as detailed as possible (specify when sending, or generate new labels by configuring enrichment rules), such as:
- The source of the alert, such as host, cluster, check, or metric, etc
- The ownership information of the alert, such as team, owner, etc
- The category information of the alert, such as class (api, db, net)

## Frequently Asked Questions

|+| Why Didn't I Receive an Alert in Flashduty?

    #### In Flashduty

    1. Check if the integration shows the **Latest Event Time**? If not, it means Flashduty did not receive the push, and you should first check your system.
    2. If you are using **Shared Integration**, first confirm whether you have configured **Routing Rules**. Without setting routing rules, the system will directly reject new pushes because there is no collaboration space to handle your alert. In this case, just configure the routing rules to the space you want.

    #### In Your System

    1. Confirm that the address you are requesting matches the address in the integration details exactly.
    2. Confirm that your service can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or enable external network access for Flashduty's domain name alone.
    3. Print the response from the Flashduty service to check for any clear information.

    If the problem remains unresolved after performing the above steps, please contact us with the **request_id** from the request response.