---
brief: Push proprietary system alert events to Flashduty via standard protocols to facilitate automated noise reduction for alert events.
---

# Custom Alert Event Integration Guide

Push proprietary system alert events to Flashduty via standard protocols to facilitate automated noise reduction for alert events.

> [!NOTE]
> Flashduty has adapted to the webhook protocols of most common alert systems. For these systems, you should first use the corresponding integration, which is simpler and more convenient. This integration provides a standard HTTP interface, allowing you to develop adaptors. The benefit is that you can push any alert event you wish to handle on-call.

## Operation Steps

### In Flashduty

使用专属集成

#### Use Proprietary Integrations

When there is no need to route alert events to different collaboration spaces, this method is preferable as it is more straightforward.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Prometheus** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

#### Use Shared Integrations

When routing alert events to different collaboration spaces based on the payload information of the alert events is required, this method should be prioritized.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center => Alert Events**, and proceed to the integration selection page.
    2. Select the **Custom Event** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can match different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, to be adjusted as needed later.
    5. Completed.

## Implement Protocol

Please refer to [the development documentation](https://developer.flashcat.cloud/zh/flashduty/custom-alert) to complete the protocol development.

## Best Practices

1. When an alert status changes, send an event to Kuaimao Nebula
2. When an alert is resolved, send an event with a status of "Ok" to close the alert. Otherwise, the alert will remain open. If your alert system does not generate recovery events, it is recommended to manually send a resolution event
3. The label is a description of the event. Enrich the label content as much as possible (specified when sending, or generated through configuration enrichment rules), such as:
- The source of the alert, such as host, cluster, check, or metric, etc
- Alert ownership information, such as team, owner, etc
- Alert category information, such as class (api, db, net)

## FAQs

|+| Why have I not received any alerts in Flashduty?

    #### In Flashduty

    1. Verify if the integration displays the **Latest Event Time**? If it does not, this indicates that Flashduty has not received the push, and you should check your system first.
    2. If you are using a **shared integration**, first verify whether you have set up **routing rules**. Without routing rules, the system will reject new alerts directly, as there is no collaboration space to handle them. In such cases, simply configure the routing rules to the desired space.

    #### In your system

    1. Confirm that the requested address matches exactly with the address in the integration details.
    2. Confirm that your service can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or separately enable external network access for Flashduty's domain name.
    3. Print the response result from the Flashduty service to check for any clear information.

    If the root cause of the issue is still not identified after following the above steps, please contact us **with the request_id from the response**.