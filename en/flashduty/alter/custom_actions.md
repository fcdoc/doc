---
brief: Understand the usage scenarios and configuration methods of custom actions
---

# Custom Actions

## Usage Scenarios

A custom action is essentially a Webhook call. You can add custom actions for incidents in different collaboration spaces and manually trigger these actions in the incident details to achieve rapid troubleshooting or information synchronization.

Common usage scenarios for custom actions:
1. **Restart the host**: When the host memory or CPU is full, trigger the host restart script to quickly complete the host restart.
2. **Enrich information**: When an incident occurs, call back your service to retrieve Tracing, Logging, topology, and other information based on alert details. Actively call the FlashDuty Open API to update the incident information, such as adding labels or setting custom fields, to assist in troubleshooting.
3. **Rollback changes**: When an incident occurs, if it is determined that the incident is caused by a change, you can directly trigger a callback to your deployment platform to start the rollback process and speed up incident recovery.
4. **Update Status Page**: When it is determined that the incident affects online services, you can trigger an update to the external Status Page to notify your customers or upstream and downstream users in a timely manner.

## Configure Custom Actions

1. Log in to the console and navigate to **Integration Center => Webhook**
2. Click **Add Custom Action** Integration
3. Configure the following information:
- **Action Name**: This name will appear as a button in the incident details.
- **Collaboration Spaces**: You can configure multiple spaces, but each space can have up to three custom actions.
- **Endpoint**: The HTTP(s) address that will be triggered when the custom action button is clicked.
- **Custom Headers**: The custom message headers to be included when requesting the endpoint.
4. Save and complete

After creation, you can see the operation button under [Incident Details - More Operations] in the corresponding space. Click the button and the system will prompt you with the operation result. If the operation is successful, the system will write the operation record.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_actions/1.avif)

### How to Implement a Webhook?

Go to [Webhook Get Started](https://developer.flashcat.cloud/doc-2996930) to learn more.