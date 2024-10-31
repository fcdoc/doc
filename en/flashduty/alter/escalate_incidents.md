---
brief: Understand how to reassign, upgrade assignments, or add handlers
---

# Upgrading and dispatching incidents

Reassign, upgrade the assignment, or add a handler.

## Reassign

When an incident is assigned to you, but you confirm that you are not the correct person to handle it, or you are unable to address the incident, you can choose to reassign it to someone else or to the duty schedule.

Reassignment means a new notification. If an incident marked as **In Progress** is reassigned, it may reset the incident's status to **Pending**. Unless the new handler includes the previous handler, who has already claimed the incident.

> [!TIP]
> Currently, reassignment targets can only be the duty list or an individual, which we refer to as **Direct Assignment**. The difference from **Strategic Assignment** is that incidents under direct assignment are notified based only on personal preferences and do not have the option for escalation.

## Upgrade Dispatch

- **Automatic Escalation**: When an incident is assigned to you according to a (multi-level) dispatch strategy and you fail to resolve the incident within the specified time frame, you do not opt to defer the escalation, and the incident does not automatically recover, the incident will automatically escalate to the next level at the specified time.

- **Manual Escalation**: When an incident is assigned to you according to a (multi-level) dispatch strategy, but after receiving an alert, you confirm that you cannot handle the incident and require the intervention of personnel from the next level (such as second-line technical support), you can choose to directly escalate the incident to the next level.

> [!TIP]
> The essence of an upgrade assignment is **reassignment**, with the main difference being that **upgrade assignments** follow the dispatch and notification channels already set in the dispatch policy.

## Add Handler

When an incident is assigned to you, but you need the involvement of other personnel (not included in the current handlers), you can choose to add a handler.

Similar to **reassignment**, when adding a handler, you can only select the duty list or an individual as the assignment target. The system will notify these individuals based on their personal preferences.

![](https://fcdoc.github.io/img/zh/flashduty/alter/escalate_incidents/1.avif)

## FAQs

|+| Why is notification added without a strategy for handlers?

    Handlers are added and reassigned by default based on individual notification preferences, which you can update on the personal settings page. In the future, we will support the ability for you to modify the notification method independently during reassignment.

|+| Why is there no upgrade button in my incident details?

    Only when an incident is dispatched according to the dispatch strategy can you switch between different dispatch stages. When you choose direct assignment (such as by reassigning to an individual), the incident is not associated with any dispatch strategy and cannot be escalated through the strategy.