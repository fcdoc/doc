---
brief: Push proprietary system alert events to Flashduty via standard protocols to automate noise reduction processing for these alerts.
---

# Custom Alert Event Integration Guide

---

Push proprietary system alert events to Flashduty via standard protocols to automate noise reduction processing for these alerts.

> [!NOTE]
> Flashduty is compatible with the webhook protocols of most commonly used alert systems. For these systems, you should use the corresponding integration first, as it is simpler and more convenient. This integration provides a standard HTTP interface, allowing you to develop adaptations. The benefit is that you can push any alert event you wish to be handled by oncall.

## Operation Steps
---

### In Flashduty

使用专属集成

#### Use Proprietary Integrations

When you do not need to route alarm events to different collaboration spaces, this method is preferred because it is simpler.

|+| Expand

    1. Enter the Flashduty console, select **Collaboration Space**, and navigate to the details page of a specific space
    2. Select the **Integrated Data** tab, click **Add an Integration**, and proceed to the integration creation page
    3. Choose the **Prometheus** integration, click **Save**, and a card will be generated.
    4. Click on the generated card to view the **Push Address**, copy it for backup, and the task is complete.

#### Use Shared Integrations

When you need to route alarms to different collaboration spaces based on the payload information of the alarm event, this method is preferred.

|+| Expand

    1. Enter the Flashduty console, select **Integration Center > Alert Events**, and go to the integration selection page.
    2. Select the **Custom Event** integration:
    - **Integration Name**: Define a name for the current integration.
    3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
    4. Click **Create Route** to configure routing rules for the integration. You can route different alerts to different collaboration spaces based on conditions, or set a default collaboration space as a fallback, which can be adjusted as needed later.
    5. Completed.

## Implement Protocol
---

Please refer to [the development documentation](https://developer.flashcat.cloud/zh/flashduty/custom-alert) to complete the protocol development.

## Best Practices
---

1. When an alert status changes, send an event to Kuaimao Nebula
2. When an alert is resolved, send an event with a status of "Ok" to close the alert. Otherwise, the alert will remain open. If your alert system does not have a resolution event, it is recommended that you manually send a resolution event
3. The label is a description of the event. Enrich the label content as much as possible (specified when sending, or generated through configuration enrichment rules), such as:
- The source of the alert, such as host, cluster, check, or metric, etc
- Ownership information of the alert, such as team, owner, etc
- Category information of the alert, such as class (API, database, network)

## FAQs
---

|+| Why have I not received any alerts in Flashduty?

    #### In Flashduty

    1. Verify if the integration displays the **Latest Event Time**? If it does not, this indicates that Flashduty has not received the push, and you should check your system first.
    2. If you are using a **Shared Integration**, first ensure you have set up **Routing Rules**. Without routing rules, the system will reject new pushes directly, as there is no collaboration space to handle your alerts. In such cases, simply configure the routing rules to your desired space.

    #### In your system

    1. Confirm that the requested address matches exactly with the address in the integration details.
    2. Confirm that your service can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or separately enable external network access for Flashduty's domain name.
    3. Print the response result from the Flashduty service to check for any clear information.

    If the root cause of the issue is still not identified after following the above steps, please contact us **with the request_id from the response**.