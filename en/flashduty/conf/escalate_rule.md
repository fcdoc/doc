---
brief: Alert events from various businesses or teams can be dispatched to the appropriate handling groups via dispatch strategies, ensuring that relevant handlers are reachable through various channels
---

# Configure Dispatch Strategy

Each collaborative space should have at least one dispatch strategy. Through this strategy, alerts from different businesses or teams can be directed to the corresponding handling groups, and the relevant handlers can be contacted through diverse channels, such as common IM apps, text messages, voice calls, and robots. Additionally, it supports multi-stage notification configurations and automatic progression between stages. If a collaborative space lacks a dispatch strategy, incoming alerts will not trigger notifications.

## Policy Configuration
### Time Filtering
- By default, all incidents are notified according to this policy.
- Supports the selection of whether to dispatch based on specific days of the week, for instance, only processing incidents from Monday to Friday, with Saturday and Sunday incidents not being addressed.
- Supports the selection of whether to dispatch based on a service calendar (which needs to be created in advance), allowing configuration according to holidays or working days. For example, only incidents on trading days require notification, which is typically applicable in the securities industry.

![](https://fcdoc.github.io/img/zh/flashduty/conf/escalate_rule/1.avif)

### Incident Filtering
- By default, all incidents are notified according to this policy.
- Supports matching incidents based on criteria such as title, level, and tags. For example, alerts with an "Info" level will follow this dispatching rule.

![](https://fcdoc.github.io/img/zh/flashduty/conf/escalate_rule/2.avif)

Go to [How to Configure Filter Conditions](/conf/how_to_filter) for more information.

## Dispatch configuration

### Dispatch Object
- **Individual:** Specifies certain members to receive the alert, supporting multiple selections without repetition.
- **Team:** Specifies a team to receive the alert, supporting multiple selections, with duplicate team members receiving only one notification.
- **On Duty:** Specifies a duty schedule to receive the alert, with the specific recipients determined by the duty rules. Multiple selections are supported, with duplicate duty personnel receiving only one notification.
- **Combination:** Select a combination of individuals, teams, and duty schedules.

> [!NOTE]
> Looking to integrate with internal self-developed systems for dynamic dispatching?
>
> Please refer to [Dynamically Setting Dispatch Personnel](/advanced/dynamic_notifications).

### Single Chat Channel
Single chat refers to one-on-one notifications, such as through email, SMS, voice, and certain IM applications.

- **Follow Personal Preferences:** Notification methods are determined by members themselves in their [account settings](/conf/preference) for each alert category.
- **Follow Unified Settings:** Notification recipients' alert channels and methods are configured uniformly by the policy setter.

### Group Chat Channel

Group chat involves sending notifications to a group with special mentions for dispatch personnel, including various webhook robots and some IM applications.

- In the group chat, users can select different applications and group bots to reach the intended recipients. **When choosing to notify via IM applications**, the notification recipients must first associate themselves with the respective application. For specific instructions, please refer to [Instant Messaging Integration](/mixin/instant_messaging/lark)

> [!NOTE]
> Select at least one notification channel for personal and group chats. If you prefer not to notify individuals, only groups, you can set an empty team as the dispatch target.

### Cyclic Notification

- Cyclic notifications are disabled by default, meaning that the same event is notified only once. If enabled, configure the number of notifications appropriately. Note that you must enter a value of at least `2` to receive additional cyclic notifications.
- If an incident is claimed, the cycle of notifications is terminated.

### Upgrade Dispatch

- To ensure that every incident is addressed, we can set up automatic escalation for incidents that exceed a timeout without being closed. This involves setting up multiple stages.
- You can choose to automatically escalate incidents that are __not closed by timeout__ or __not claimed by timeout__.
- Typical scenarios include hierarchical upgrades between primary and backup duty personnel, between superiors and subordinates, and between first and second lines of support.

You can also manually escalate incidents. Visit [Escalate & Dispatch Incidents](/alter/escalate_incidents) for more information.

### Strategy Sequence Adjustment
- When multiple dispatch strategies are in place, notifications are matched sequentially and stop once a match is found. Consider the relevant dispatch conditions thoroughly when configuring.
- Different strategies can be adjusted by dragging and dropping to change the notification order, with changes taking effect immediately. Please proceed with caution.

> [!NOTE]
> If you need to set multiple dispatch policies within a collaboration space and ensure that every incident is notified, it's advisable to set up a fallback policy with no filtering criteria.

> [!WARN]
> We do not recommend setting a collaboration space too large, especially when using a single space to manage all alerts for a large business. This can lead to managing numerous dispatch policies, making long-term maintenance more burdensome, confusing, and error-prone.

## Policy Configuration Principles
General principles for configuring dispatch strategies should consider the following aspects:

1. **Notification Object Capability Matching:** Ensure that the notification object has the ability and authority to handle the space's alerts. This means that only relevant individuals or teams receive alerts related to their work, avoiding the delivery of irrelevant alerts to unrelated individuals.
2. **Multi-Channel Notification:** Employ multiple notification methods to ensure that recipients receive alerts promptly. For example, notifications can be sent through various channels such as SMS, email, and instant messaging tools to enhance timeliness and reliability. However, different alert levels may warrant different notification methods to avoid message overload.
3. **Alert Escalation Mechanism:** When an alert remains unclaimed or unprocessed for an extended period, an escalation mechanism should be in place. This could involve automatically escalating the alert to the next level of handlers or teams, or distributing the alert to multiple stages of handlers to ensure timely processing.

## FAQs

|+| How to troubleshoot if an alert is generated but no notification is received?

    Go to the "Incident Details" section => Timeline, to verify the normalcy of the notification statuses across all channels within the notification trigger process. Should there be failures, a failure message will be provided for your reference. For further reasons or assistance in diagnosing the issue, please contact technical support for guidance.

|+| Why do the notification methods not align with my personal preference settings?

    Flashduty's single chat notification channel supports two settings: "Follow Personal Preferences" and "Follow Unified Settings." Notifications will be personalized according to your settings only when the "Follow Personal Preferences" option is selected.

    Go to Collaboration Space Details => Assignment Policy to review your specific settings.