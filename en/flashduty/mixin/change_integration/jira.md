---
brief: Through the use of webhooks, synchronize Jira Issue events with Kuaimao Nebula to collect change events.
---

# Jira Integration

## Usage Restrictions

### In Jira

- You must have the authority to modify **Settings => System => Webhooks**.
- (For on-premises deployment) Your Jira server must be able to access the domain api.flascat.cloud.

## Supported Versions

This guide is compatible with **Jira Cloud and On-Premises** versions.

## Operation Steps

### In Flashduty

1. Enter the Flashduty console, select **Integration Center => Change Events**, and navigate to the integration selection page.
2. Choose the **Jira** integration:
- **Integration Name**: Define a name for the current integration.
3. Click **Save**, then copy the newly generated **Push Address** on the current page for future reference.
4. Completed.

### In Jira

1. Log into your Jira account
2. Navigate to the **Settings => System => Webhooks** page and click the "Create" button
3. Set the callback address to the push address associated with the current integration, and select the event types: Issue Created/Updated/Deleted
4. Optionally, you can enter JQL to further refine the scope of events to be synchronized (e.g., specific Projects)
5. Click the "Save" button to submit the configuration

<img alt="drawing" src="https://fcdoc.github.io/img/zh/flashduty/mixin/change_integration/jira/1.avif" />

5. Finish

## Status Mapping

By default, Flashduty extracts the "status.name" information from the webhook payload and performs status transitions based on the mapping relationship provided below:

| Jira        | Flashduty   | state               |
| ----------- | ---------- | ------------------ |
| planned     | planned    | Bill Submitted             |
| to do       | planned    | Bill Submitted             |
| ready       | ready      | Soon to Start (or Planned) |
| processing  | processing | In Progress             |
| open        | processing | In Progress             |
| reopen      | processing | In Progress             |
| in progress | processing | In Progress             |
| canceled    | canceled   | Canceled (or Rolled Back)   |
| aborted     | canceled   | Canceled (or Rolled Back)   |
| done        | done       | Completed             |
| resolved    | done       | Completed             |
| closed      | done       | Completed             |

If you wish to modify this mapping, please contact Flashduty support.