---
brief: Push your system's alert events to Flashduty through standard protocols to achieve automated noise reduction of alert events.
---

# Custom Alert Event Integration Guide

Push your system's alert events to Flashduty through standard protocols to achieve automated noise reduction of alert events.

> [!NOTE]
> Flashduty has adapted to the webhook protocols of most commonly used alert systems. For these systems, you should first use the corresponding integration, which is simpler and more convenient. This integration provides a standard HTTP interface that requires you to develop an adapter. The advantage is that you can push any alert event you want to manage oncall.

## Operation Steps

### In Flashduty

You can obtain an integrated push address through the following two methods; choose either one.

#### Use Dedicated Integration

When you do not need to route alert events to different collaboration spaces, this method is preferred as it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and enter the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and enter the Add Integration page
    3. Select the **Prometheus** integration, click **Save**, and generate a card.
    4. Click on the generated card to view the **push address**, copy it for later use, and complete the process.

#### Use Shared Integration

When you need to route alert events to different collaboration spaces based on the payload information of the alert event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and enter the integration selection page.
    2. Select the **Custom Event** integration:
    - **Integration Name**: Define a name for the current integration.
    3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or you can set a default collaboration space as a fallback and adjust it as needed.
    5. Complete.

## Implement Protocol

Please refer to [the development documentation](https://developer.flashcat.cloud/zh/flashduty/custom-alert) to complete the protocol development.

## Best Practices

1. When the alert status changes, send an event to Flashcat
2. When the alert is restored, send an event with a status of "Ok" to close the alert. Otherwise, the alert will remain open. If your alert system does not support recovery events, it is recommended that you manually send recovery events
3. The label is a description of the event. The content of the label should be as detailed as possible (specify when sending, or generate new labels by configuring enrichment rules), such as:
- The source of the alert, such as host, cluster, check, or metric, etc
- The ownership information of the alert, such as team, owner, etc
- The category information of the alert, such as class (api, db, net)

## Frequently Asked Questions

|+| Why didn't I receive the alert in Flashduty?

    #### In Flashduty

    1. Check if the integration shows the **Latest Event Time**. If not, it means Flashduty did not receive the push, and you should first check your system.
    2. If you are using a **shared integration**, first confirm whether you have configured **routing rules**. Without setting routing rules, the system will directly reject new pushes because there is no collaboration space to handle your alerts. In this case, configure the routing rules to the space you want.

    #### In Your System

    1. Confirm that the address you are requesting matches the address in the integration details exactly.
    2. Confirm that your service can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or separately enable external network access for Flashduty's domain name.
    3. Print the response from the Flashduty service to see if there is any clear information.

    If the problem remains unresolved after performing the above steps, please contact us with the **request_id** from the request response.