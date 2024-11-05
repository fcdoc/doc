---
brief: Push your own system change events to Flashduty through standard protocols. Most incidents are caused by changes. Linking change and alert events helps quickly identify the cause of the incident.
---

# Custom Change Event Integration Guide

Push your own system change events to Flashduty through standard protocols. Most incidents are caused by changes. Linking change and alert events helps quickly identify the cause of the incident.

> [!NOTE]
> Flashduty has already adapted to the webhook protocols of some commonly used ticketing and deployment systems. For these systems, you should first use the corresponding integrations, which are simpler and more convenient. This integration provides a standard HTTP interface that requires you to develop an adaptation. The benefit is that you can integrate with any deployment system.

## Operation Steps

### In Flashduty

1. Enter the Flashduty console, select **Integration Center => Change Events**, and go to the integration selection page.
2. Select the **Custom Event** integration:
- **Integration Name**: Define a name for the current integration.
3. After clicking **Save**, copy the newly generated **Push URL** on the current page for later use.
4. Finish.

## Implement Protocol

Please refer to [the development documentation](https://developer.flashcat.cloud/zh/flashduty/custom-change) to complete the protocol development.

## Best Practices

Tags are descriptions of events and should be as detailed as possible, for example:
1. The scope of the change, such as host, cluster, etc
1. The ownership information of the change, such as team, owner, etc

## Frequently Asked Questions

|+| Why am I not receiving changes in Flashduty?

    #### In Flashduty

    1. Check if the integration shows **the latest event time**? If not, it means Flashduty has not received the push. Prioritize troubleshooting the Nightingale part.

    #### In your system

    1. Confirm that the address you requested matches the address in the integration details exactly.
    2. Confirm that your service can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or enable external network access for Flashduty's domain name alone.
    3. Print the response from the Flashduty service to see if there is any clear information.

    If the root cause of the problem is still not found after performing the above steps, please contact us with the **request_id** from the request response.