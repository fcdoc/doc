---
brief: Alert events from different businesses or different teams can be assigned to corresponding processing groups through dispatch strategies, and the processing members can be reached through various channels
---

# Configure Dispatch Strategy

Each collaboration space should have at least one dispatch strategy. Through the dispatch strategy, alert events from different businesses or different teams can be assigned to the corresponding processing groups, and the processing members can be reached through various channels, such as common IM applications, SMS, voice, and robots. It also supports multi-level notification configuration and automatic escalation between levels; when the collaboration space is not configured with a dispatch strategy, alerts connected to the collaboration space will not trigger notifications.

## Policy Configuration
### Time Filter
- By default, incidents at all times are notified according to this policy.
- Supports selecting whether to dispatch based on a specific day of the week. For example, only incidents from Monday to Friday will be dispatched, and incidents on Saturday and Sunday will not be processed.
- Supports selecting whether to dispatch based on the service calendar (the service calendar needs to be created in advance), and can be configured according to holidays or working days. For example, only incidents on trading days need to be notified, which is generally applicable to the securities industry.

![](https://fcdoc.github.io/img/zh/flashduty/conf/escalate_rule/1.avif)

### Incident Filtering
- By default, all incidents are notified according to this policy.
- Supports matching incidents based on conditions such as title, level, and label. For example, if the alert level is Info, it follows this dispatch.

![](https://fcdoc.github.io/img/zh/flashduty/conf/escalate_rule/2.avif)

Go to [How to configure filters](/conf/how_to_filter) to learn more.

## Dispatch Configuration

### Dispatch Object
- **Individual:** Designate certain members to receive this alert. Multiple selections are supported, and duplicates are not allowed.
- **Team:** Designate a team to receive this alert. Multiple selections are supported, and if there are duplicate team members, only one notification will be sent to the member.
- **On Duty:** Designate a duty schedule to receive this alert. The specific receiving members will be determined according to the duty schedule. Multiple selections are supported, and if the duty personnel are repeated, only one notification will be sent to the duty person.
- **Combination:** Select individuals, teams, and duty schedules together.

> [!NOTE]
> Want to integrate with an internal self-developed system to achieve dynamic dispatch?
>
> Please refer to [Dynamically Setting Assignees](/advanced/dynamic_notifications).

### Single Chat Channel
Single chat means one-to-one push. For example, email, SMS, voice, and some IM applications.

- **Follow Personal Preferences:** Notification methods are configured by members themselves in their [account settings](/conf/preference) for each alert category.
- **Follow Unified Settings:** The policy configurator uniformly configures the channels and methods for members in the notification object to receive alerts.

### Group Chat Channel

Group chat means pushing to a group and giving special reminders to the assigned personnel. This includes various webhook robots and some IM applications.

- In the group chat, you can choose various applications and group robots to reach the recipients. **When selecting IM application notifications**, the notification recipients need to be associated with the corresponding application first. For details, please refer to [Instant Messaging Integration](/mixin/instant_messaging/lark)

> [!NOTE]
> Please select at least one channel for personal and group chat notifications. If you do not want notifications to go to any individuals, only groups, you can set an empty team as the dispatch target.

### Circular Notification

- Circular notifications are turned off by default, meaning the same event is notified once by default. If you need to turn it on, please configure the number of notifications appropriately. Note that the value you enter must be at least `2` times to get additional circular notifications.
- If the incident is claimed, the circular notification will be terminated.

### Upgrade Dispatch

- To ensure that someone handles the incident, you can set the incident to automatically escalate if it remains unclaimed or unprocessed for a certain period. This involves setting up multiple levels.
- You can choose to automatically upgrade when an incident is __timeout and not closed__ or __timeout and not claimed__.
- Typical scenarios include: layer-by-layer escalation between primary and backup personnel on duty, between superiors and subordinates, and between first and second lines.

You can also manually escalate an incident. Go to [Upgrade & Dispatch Incident](/alter/escalate_incidents) to learn more.

### Strategy Sequence Adjustment
- When multiple dispatch strategies are used, notifications are matched in order and terminated when matched. Please fully consider the relevant dispatch conditions when configuring.
- Different strategies support dragging and dropping to adjust the notification order. The adjustment will take effect immediately. Please operate with caution.

> [!NOTE]
> If you need to set up multiple dispatch policies in a collaboration space and ensure that every incident is notified, it's a good idea to set up a dispatch policy with no filters as a fallback.

> [!WARN]
> We do not recommend making a collaboration space too large. In particular, using a collaboration space to manage all alerts for a large business can result in maintaining many different dispatch strategies, making long-term maintenance burdensome, more confusing, and more error-prone.

## Policy Configuration Principles
General dispatch strategy configuration should consider the following aspects:

1. **Notification Object Capability Matching:** Ensure that the notification object has the ability and authority to handle the space alerts. This means that only relevant people or teams receive alerts related to their work, avoiding irrelevant alerts being sent to irrelevant people.
2. **Multi-channel Notification:** Use multiple notification methods to ensure that the notification recipient can receive the alert information in a timely manner. For example, notifications can be sent through SMS, email, and instant messaging tools to improve the timeliness and reliability of notifications. Different levels of alerts should use different notification methods to avoid message overload.
3. **Alert Upgrade Mechanism:** When an alert has not been claimed or processed for a long time, there should be a corresponding upgrade mechanism. This could be automatically escalating the alert to the next level handler or team, or sending the alert to handlers at multiple levels to ensure timely processing.

## Frequently Asked Questions

|+| How to troubleshoot if an alert is generated but no notification is received?

    Go to incident details => timeline to check whether the notification status of each channel in the trigger notification process is normal. If it fails, there will be a failure message for reference. For more reasons, you can contact technical support for assistance in troubleshooting.

|+| Why don't my notification methods match my personal preferences?

    Flashduty single chat notification channels support two settings: one is "Follow Personal Preferences," and the other is "Follow Unified Settings." Only in the "Follow Personal Preferences" setting will notifications be personalized according to your settings.

    Go to Collaboration Space Details => Dispatch Strategy to view your specific settings.