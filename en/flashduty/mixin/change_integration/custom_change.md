---
brief: Push your own system change events to Flashduty through standard protocols. Most incidents are caused by changes. The linkage between change and alert events helps to quickly identify the cause of the incident.
---

# Custom Change Event Integration Guide

Push your own system change events to Flashduty through standard protocols. Most incidents are caused by changes. The linkage between change and alert events helps to quickly identify the cause of the incident.

> [!NOTE]
> Flashduty has already adapted to the webhook protocols of some commonly used ticketing and deployment systems. For these systems, you should first use the corresponding integration, which is simpler and more convenient. This integration provides a standard HTTP interface that requires you to develop an adaptation. The benefit is that you can integrate with any deployment system.

## Operation Steps

### In Flashduty

1. Enter the Flashduty console, select **Integration Center => Change Events**, and navigate to the integration selection page.
2. Select **Custom Event** integration:
- **Integration Name**: Define a name for the current integration.
3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
4. Complete.

## Implementation Protocol

Please refer to [the development documentation](https://developer.flashcat.cloud/zh/flashduty/custom-change) to complete the protocol development.

## Best practices

Tags are descriptions of events and should be as detailed as possible. For example:
1. The scope of the change, such as host, cluster, etc
1. The ownership information of the change, such as team, owner, etc

## Frequently Asked Questions

|+| Why am I not receiving changes in Flashduty?

    #### In Flashduty

    1. Check if the integration shows the **latest event time**. If not, it means Flashduty did not receive the push, and you should first check the Nightingale part.

    #### In your system

    1. Confirm that the address you requested matches the address in the integration details exactly.
    2. Confirm that your service can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or separately enable external network access for Flashduty's domain name.
    3. Print the response from the Flashduty service to see if there is any clear information.

    If the problem remains unresolved after performing the above steps, please contact us with the **request_id** from the request response.