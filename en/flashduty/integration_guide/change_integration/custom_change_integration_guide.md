---
brief: Push proprietary system change events to Flashduty via standard protocols. Most failures are caused by these changes, and the correlation between change and alert events aids in swiftly identifying the root causes of failures.
---

# Custom Change Event Integration Guide

---

Push proprietary system change events to Flashduty via standard protocols. Most failures are caused by these changes, and the correlation between change and alert events aids in swiftly identifying the root causes of failures.

> [!NOTE]
> Flashduty has already adapted to the webhook protocols of some common ticketing and deployment systems. For these systems, you should first utilize the corresponding integrations, which are more straightforward and convenient. This integration provides a standard HTTP interface, allowing you to develop custom adaptations. The advantage is that you can integrate with any deployment system.

## Operation Steps
---

### In Flashduty

1. Enter the Flashduty console, select **Integration Center => Change Events**, and navigate to the integration selection page.
2. Select the **Custom Event** integration:
- **Integration Name**: Define a name for the current integration.
3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
4. Completed.

## Implement Protocol
---

Please refer to [the development documentation](https://developer.flashcat.cloud/zh/flashduty/custom-change) to complete the protocol development.

## Best Practices
---

Tags are descriptive elements of events and should be as detailed as possible, including:
1. The scope of the change, such as host, cluster, etc
1. Ownership information of the change, such as team, owner, etc

## FAQs
---

|+| Why have I not received any updates in Flashduty?

    #### In Flashduty

    1. Check if the integration displays the **Latest Event Time**. If not, it indicates that Flashduty has not received the push; therefore, begin troubleshooting with the Nightingale component first.

    #### In your system

    1. Confirm that the requested address matches exactly with the address in the integration details.
    2. Confirm that your service can access the external api.flashcat.cloud domain name. If not, you first need to open an external network for the server, or separately enable external network access for Flashduty's domain name.
    3. Print the response result from the Flashduty service to check for any clear information.

    If the root cause of the issue is still not identified after following the above steps, please contact us **with the request_id from the response**.