---
brief: Synchronize Jira Issue events to Flashcat through webhooks to implement change event collection.
---

# Jira Integration

## Usage Restrictions

### In Jira

- You must have permission to modify **Settings => System => Webhooks**.
- (If deploying privately) Your Jira server must be able to access the domain api.flascat.cloud.

## Supported Versions

This article is applicable to **Jira Cloud and Private** versions.

## Operation Steps

### In Flashduty

1. Enter the Flashduty console, select **Integration Center => Change Events**, and go to the integration selection page.
2. Choose the **Jira** integration:
- **Integration Name**: Define a name for the current integration.
3. After clicking **Save**, copy the newly generated **push address** on the current page for later use.
4. Complete.

### In Jira

1. Log in to your Jira
2. Enter the **Settings => System => Webhooks** page and click the Create button
3. Fill in the callback address as the push address corresponding to the current integration, and select the three types of events: Issue Created/Updated/Deleted
4. Optionally, fill in JQL to further narrow the scope of events to be synchronized (such as specific Projects)
5. Click the Save button to submit the configuration

<img alt="drawing" src="https://fcdoc.github.io/img/zh/flashduty/mixin/change_integration/jira/1.avif" />

5. Complete

## Status Mapping

By default, Flashduty extracts the status.name information from the webhook payload and performs status transition according to the following mapping relationship:

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

If you wish to change this mapping, please contact Flashduty.