---
brief: Learn how to reassign, upgrade an assignment, or add a handler
---

# Upgrading and Reassigning Incidents

Reassign, upgrade the assignment, or add a handler.

## Reassign

When an incident is assigned to you, but you confirm that you are not the correct assignee or are unable to handle the incident, you can choose to reassign the incident to another person or on-call schedule.

Reassigning means re-notifying. If an incident in **processing** is reassigned, its progress may be reset to **pending**. This does not happen if the new assignee includes the previous handler and the previous handler has already claimed the incident.

> [!TIP]
> Currently, the target of reassignment can only be an on-call schedule or an individual, which we call **direct assignment**. Unlike **policy-based assignment**, direct assignment can only notify according to personal preferences and does not allow for escalation.

## Upgrade Assignment

- **Automatic Upgrade**: When an incident is automatically assigned to you according to a (multi-stage) dispatch policy, and you do not resolve the incident within the specified time window, do not choose to defer the upgrade, and the incident does not auto-resolve, the incident will automatically upgrade to the next stage at the specified time.

- **Manual Upgrade**: When an incident is automatically assigned to you according to a (multi-stage) dispatch policy, but after receiving the alert, you confirm that you cannot handle the incident and need the next stage (such as second-line technical support) to intervene early, you can choose to directly upgrade the incident to the next stage.

> [!TIP]
> The essence of upgrading an assignment is **reassignment**. The main difference is that **upgrading an assignment** follows the personnel and notification channels already set in the dispatch policy.

## Add Handler

When an incident is assigned to you, but you need another person (not currently a handler) to participate in handling it, you can choose to add a handler.

Similar to **reassignment**, when adding a handler, you can only select an on-call schedule or an individual as the assignment target. The system will notify these individuals based on their personal preferences.

![](https://fcdoc.github.io/img/zh/flashduty/alter/escalate_incidents/1.avif)

## Frequently Asked Questions

|+| Why is there no policy-based notification when adding handlers?

    Adding handlers and reassigning are set according to personal notification preferences by default, and you can update these preferences on the personal settings page. In the future, we will support customizing the notification method during dispatch.

|+| Why is there no upgrade button in my incident details?

    You can switch between different dispatch stages only when the incident is dispatched according to a dispatch policy. When you choose direct assignment (such as reassigning to an individual), the incident is not associated with any dispatch policy and cannot be upgraded through the policy.