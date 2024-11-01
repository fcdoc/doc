---
brief: Understand the Usage Scenarios and Configuration Methods of Custom Operations
---

# Custom Operations

## Usage Scenarios

A custom operation is essentially a Webhook call. You can add custom operations for incidents in different collaboration spaces and manually trigger these operations in the incident details to achieve rapid troubleshooting or information synchronization.

Common Usage Scenarios for Custom Operations:
1. **Restart the Host**: When the host memory or CPU is full, trigger a host restart script to quickly complete the host restart.
2. **Enrich Information**: When an incident occurs, call back your service to retrieve Tracing, Logging, and topology information based on alert details. Actively call the FlashDuty Open API to update the incident information, such as adding labels or setting custom fields, to assist in troubleshooting.
3. **Rollback Changes**: When an incident occurs, if it is determined that the incident is caused by a change, you can directly trigger a callback to your deployment platform to start the rollback process and speed up incident recovery.
4. **Update Status Page**: When it is determined that the incident affects online services, trigger an external Status Page update to notify your customers or upstream and downstream users in a timely manner.

## Configure Custom Operations

1. Log in to the console and navigate to **Integration Center => Webhook**
2. Click **Add Custom Operation** Integration
3. Configure the following information:
- **Operation Name**: This name will appear as a button in the incident details.
- **Collaboration Spaces**: You can configure multiple spaces, but each space can have up to three custom operations.
- **Endpoint**: The HTTP(s) address that will be triggered when the custom operation button is clicked.
- **Custom Headers**: The custom message headers to be included when requesting the endpoint.
4. Save and complete

After creation, you can see the operation button under [Incident Details - More Operations] in the corresponding space. Click the button and the system will prompt you with the operation result. If the operation is successful, the system will write the operation record.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_actions/1.avif)

### How to Implement a Webhook?

Go to [Webhook Get Started](https://developer.flashcat.cloud/doc-2996930) to learn more.