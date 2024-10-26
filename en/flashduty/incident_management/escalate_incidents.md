---
brief: Understand how to reassign, upgrade assignments, or add handlers
---

# Upgrade and dispatch issues

---

Reassign, upgrade the assignment, or add a handler.

## Reassign
---

When an issue is assigned to you, but you confirm that you are not the appropriate person to handle it, or you are unable to address the issue, you can choose to reassign it to someone else or to the duty schedule.

Reassignment means sending out notifications again. If an issue marked as **In Progress** is reassigned, its processing status may be reset to **Pending**, unless the new handler includes the previous handler, who has already claimed the issue.

> [!TIP]
> Currently, reassignment targets can only be the duty list or an individual, which we refer to as **Direct Assignment**. The difference from **Strategic Assignment** is that direct assignments are only notified based on personal preferences and do not allow for escalation.

## Upgrade Dispatch
---

- **Automatic Upgrade**: If an issue is assigned to you automatically according to a (multi-level) dispatch strategy, and you fail to resolve it within the specified time frame, do not opt for a deferral of the upgrade, and the issue does not resolve itself automatically, it will automatically escalate to the next level at the designated time.

- **Manual Upgrade**: If an issue is assigned to you automatically according to a (multi-level) dispatch strategy, but after receiving the alert, you confirm that you cannot handle the issue and require the intervention of personnel from the next level (such as second-line technical support), you can choose to directly escalate the assignment to the next level.

> [!TIP]
> The essence of an upgrade assignment is **reassignment**, with the main difference being that **upgrade assignments** follow the dispatch and notification channels already set in the dispatch policy.

## Add Handler
---

When an issue is assigned to you but you need the involvement of other personnel (not currently listed as handlers), you can choose to add a handler.

Similar to **reassignment**, when adding a handler, you can only select the duty list or an individual as the assignment target. The system will notify these individuals based on their personal preferences.

![](https://fcdoc.github.io/img/5yV6SZljnoyzXZygOdopT3n8RgQkKr5WITkG_FlwCt4.avif)

## FAQs

|+| Why is notification added without a strategy for handlers?

    Handlers are added and reassigned by default based on individual notification preferences, which you can update on the personal settings page. In the future, we will support the ability for you to modify the notification method independently during reassignment.

|+| Why is there no "Upgrade" button in my incident details?

    You can only switch between different dispatch stages if the incident is assigned according to the dispatch policy. When you opt for direct assignment (for instance, by specifying an individual through reassignment), the incident is unrelated to any assignment policy and cannot be escalated via the policy.