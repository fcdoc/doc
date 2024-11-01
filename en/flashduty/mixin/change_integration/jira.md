---
brief: Synchronize Jira Issue events to Kuaimao Nebula via webhook to enable change event collection.
---

# Jira Integration

## Usage Restrictions

### In Jira

- You must have permission to modify **Settings => System => Webhooks**.
- (If privately deployed) Your Jira server must be able to access the domain api.flascat.cloud.

## Supported Versions

This guide is applicable to **Jira Cloud and on-premises** versions.

## Operation Steps

### In Flashduty

1. Enter the Flashduty console, select **Integration Center => Change Events**, and navigate to the integration selection page.
2. Choose the **Jira** integration:
- **Integration Name**: Define a name for the current integration.
3. After clicking **Save**, copy the newly generated **push address** for later use.
4. Complete.

### In Jira

1. Log in to your Jira
2. Go to the **Settings => System => Webhooks** page and click the Create button
3. Enter the callback URL as the push URL corresponding to the current integration, and select the three event types: Issue Created/Updated/Deleted
4. Optionally, enter a JQL query to further narrow the scope of events to be synchronized (e.g., specific projects)
5. Click the Save button to submit the configuration

<img alt="drawing" src="https://fcdoc.github.io/img/zh/flashduty/mixin/change_integration/jira/1.avif" />

5. Complete

## State Mapping

Flashduty extracts the status.name information in the webhook payload by default, and performs status transition according to the following mapping relationship:

| Jira        | Flashduty   | Status               |
| ----------- | ---------- | ------------------ |
| planned     | planned    | Submitted             |
| to do       | planned    | Submitted             |
| ready       | ready      | About to Start (or Planned) |
| processing  | processing | In Progress             |
| open        | processing | In Progress             |
| reopen      | processing | In Progress             |
| in progress | processing | In Progress             |
| canceled    | canceled   | Canceled (or Rolled Back)   |
| aborted     | canceled   | Canceled (or Rolled Back)   |
| done        | done       | Completed             |
| resolved    | done       | Completed             |
| closed      | done       | Completed             |

If you wish to modify this mapping, please contact Flashduty.