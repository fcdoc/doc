---
brief: Learn how to reassign, upgrade an assignment, or add a handler
---

# Upgrading and Dispatching Incidents

Reassign, upgrade the assignment, or add a handler.

## Reassign

When an incident is assigned to you, but you confirm that you are not the correct assignee, or you are unable to handle the incident, you can choose to reassign the incident to another person or duty schedule.

Reassigning means re-notifying. If an incident in **processing** is reassigned, the incident's processing progress may be reset to **pending**. Unless the new handler includes the previous handler, and the previous handler has already claimed the incident.

> [!TIP]
> Currently, the target of reassignment can only be a duty schedule or an individual, which we call **direct assignment**. The difference from **policy-based assignment** is that directly assigned incidents can only be notified according to personal preferences, and there is no possibility of upgrade.

## Upgrade Dispatch

- **Automatic Upgrade**: When an incident is automatically assigned to you according to a (multi-stage) assignment policy, and you do not resolve the incident within the specified time window, do not choose to postpone the upgrade, and the incident does not automatically recover, the incident will automatically upgrade to the next stage at the specified time.

- **Manual Upgrade**: When an incident is automatically assigned to you according to a (multi-stage) assignment policy, but after receiving the alert, you confirm that you cannot handle the incident and need the next stage (such as second-line technical support) to intervene, you can choose to directly upgrade the assignment of the incident to another stage.

> [!TIP]
> The essence of upgrading the assignment is **reassignment**. The main difference is that **upgrading the assignment** dispatches and notifies according to the personnel and notification channels that have been set in the assignment policy.

## Add Handler

When an incident is assigned to you, but you need another person (who is not among the current handlers) to participate in handling it, you can choose to add a handler.

Similar to **reassignment**, when adding a handler, you can only select a duty schedule or an individual as the assignment target. The system will notify these individuals based on their personal preferences.

![](https://fcimg.3ti.site/zh/flashduty/alter/escalate_incidents/1.avif)

## Frequently Asked Questions

|+| Why is there no policy-based notification when adding handlers?

    Adding handlers and reassigning are set according to personal notification preferences by default, and you can update them on the personal settings page. In the future, we will support modifying the notification method independently when dispatching.

|+| Why is there no upgrade button in my incident details?

    You can switch between different dispatch stages only when the incident is dispatched according to a dispatch policy. When you choose direct assignment (such as reassigning to an individual), the incident is not associated with any assignment policy and cannot be upgraded through the policy.