---
brief: Understand the scenarios and configuration methods for using custom operations
---

# Custom Operations

## Usage Scenarios

The custom operation itself is a Webhook invocation, allowing you to add custom actions for incidents across different collaboration spaces. You can manually trigger these actions within the incident details to facilitate swift troubleshooting or information synchronization.

Common scenarios for using custom operations:
1. **Restart Host**: When the host's memory or CPU is maxed out, trigger a restart script to quickly reboot the host.
2. **Information-rich**: Upon incident occurrence, the system will callback your service, leveraging alert details to retrieve Tracing, Logging, and topology information. It will proactively call the FlashDuty Open API to update incident details, such as adding tags or setting custom fields to aid in troubleshooting.
3. **Rollback Changes**: If an incident is confirmed to be caused by a change, you can directly trigger a callback to your deployment platform to initiate the rollback process, thereby accelerating incident recovery.
4. **Update Status Page**: When it is confirmed that an incident affects online services, you can trigger an update to the external Status Page to promptly notify your customers or upstream and downstream partners.

## Configure Custom Operations

1. Login to the console and navigate to **Integration Center > Webhook**
2. Click to add a **Custom Operation** integration
3. Configure the following information:
- **Operation Name**, this name will be displayed as a button within the incident details.
- **Collaboration Spaces**, where multiple can be configured, but no more than three custom operations can be added per space.
- **Endpoint**, the HTTP(s) request address that is triggered when the custom operation button is clicked.
- **Custom Headers**, the custom headers included in the request to the Endpoint.
4. Save to complete the configuration

After creation, you can see the operation button under [Incident Details - More Operations] in the corresponding space. Click the button and the system will prompt you with the operation result. If the operation is successful, the system will write the operation record.

![](https://fcdoc.github.io/img/zh/flashduty/alter/custom_actions/1.avif)

### How to Implement Webhooks?

Visit [Webhook Getting Started](https://developer.flashcat.cloud/doc-2996930) for more information.