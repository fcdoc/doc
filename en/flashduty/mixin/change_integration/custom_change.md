---
brief: Push your own system change events to Flashduty via standard protocols. Most incidents are caused by changes. Linking change and alert events helps quickly identify the root cause of incidents.
---

# Custom Change Event Integration Guide

Push your own system change events to Flashduty via standard protocols. Most incidents are caused by changes. Linking change and alert events helps quickly identify the root cause of incidents.

> [!NOTE]
> Flashduty has adapted to the webhook protocols of some commonly used ticketing and deployment systems. For these systems, you should first use the corresponding integration, which is simpler and more convenient. This integration provides a standard HTTP interface that allows you to develop and adapt. The benefit is that you can integrate with any deployment system.

## Operation Steps

### In Flashduty

1. Enter the Flashduty console, select **Integration Center => Change Events**, and navigate to the integration selection page.
2. Select the **Custom Event** integration:
- **Integration Name**: Define a name for the current integration.
3. After clicking **Save**, copy the newly generated **push address** for later use.
4. Complete.

## Implement Protocol

Please refer to [the development documentation](https://developer.flashcat.cloud/zh/flashduty/custom-change) to complete the protocol implementation.

## Best Practices

Tags are descriptions of events and should be as detailed as possible, for example:
1. The scope of the change, such as host, cluster, etc
1. The ownership information of the change, such as team, owner, etc

## Frequently Asked Questions

|+| Why am I not receiving changes in Flashduty?

    #### In Flashduty

    1. Does the integration show the **Latest Event Time**? If not, it means Flashduty has not received the push, and you should first check the Nightingale part.

    #### In Your System

    1. Confirm that the address you are requesting matches the address in the integration details exactly.
    2. Confirm that your service can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or enable external network access for Flashduty's domain name alone.
    3. Print the response from the Flashduty service to check for any clear information.

    If the problem remains unresolved after performing the above steps, please contact us with the **request_id** from the request response.